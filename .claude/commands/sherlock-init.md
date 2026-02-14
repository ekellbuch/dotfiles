---
name: sherlock-init
description: Set up a repo to use /run commands on Sherlock. Copies the dispatch workflow and registers the self-hosted runner.
tools: Read, Write, Bash, Glob
---

Initialize the current repo for Sherlock `/run` dispatch.

Requires env vars from shell config: `$DOTFILES_DIR`, `$SHERLOCK_RUNNER_DIR`.

## Steps

1. **Copy workflow**: Copy the sherlock-dispatch workflow from dotfiles into the repo:
   ```bash
   mkdir -p .github/workflows
   cp "$DOTFILES_DIR/.github/workflows/sherlock-dispatch.yml" .github/workflows/
   ```

2. **Register runner** (if not already registered for this repo):
   ```bash
   module load system gh icu 2>/dev/null || true
   REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')

   if [ -f "$SHERLOCK_RUNNER_DIR/.runner" ]; then
     echo "Runner already configured. Create a new instance for this repo:"
     echo "  SHERLOCK_RUNNER_DIR=$SHERLOCK_RUNNER_DIR-<name> sherlock-init"
   else
     TOKEN=$(gh api --method POST "repos/$REPO/actions/runners/registration-token" --jq '.token')
     mkdir -p "$SHERLOCK_RUNNER_DIR"
     cd "$SHERLOCK_RUNNER_DIR"
     [ -f ./config.sh ] || curl -sL "https://github.com/actions/runner/releases/download/v2.322.0/actions-runner-linux-x64-2.322.0.tar.gz" | tar xz
     ./config.sh --url "https://github.com/$REPO" --token "$TOKEN" --labels "self-hosted,sherlock" --name "sherlock-$(basename $REPO)" --unattended
   fi
   ```

3. **Commit and push** the workflow file to the default branch.

4. **Start the runner**:
   ```bash
   cd "$SHERLOCK_RUNNER_DIR" && nohup ./run.sh > runner.log 2>&1 &
   ```

5. **Test** by commenting `/run echo hello` on any issue or PR.

## Important

- The workflow must be on the default branch (`main` or `master`) for `issue_comment` triggers to work.
- Repos must be cloned under `$SHERLOCK_PROJECTS/<repo-name>/` for working directory auto-detection.
