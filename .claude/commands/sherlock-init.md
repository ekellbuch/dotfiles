---
name: sherlock-init
description: Set up a repo to use /run commands on Sherlock. Copies the dispatch workflow and registers the self-hosted runner.
tools: Read, Write, Bash, Glob
---

Initialize the current repo for Sherlock `/run` dispatch.

## Steps

1. **Copy workflow**: Copy the sherlock-dispatch workflow from dotfiles into the repo:
   ```bash
   DOTFILES="/home/groups/swl1/ekb/Projects/dotfiles"
   mkdir -p .github/workflows
   cp "$DOTFILES/.github/workflows/sherlock-dispatch.yml" .github/workflows/
   ```

2. **Register runner** (if not already registered for this repo):
   ```bash
   RUNNER_DIR="/home/groups/swl1/ekb/actions-runner"
   module load system gh icu 2>/dev/null || true
   REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')

   # Check if runner is already configured for this repo
   if [ -f "$RUNNER_DIR/.runner" ]; then
     CURRENT_REPO=$(cat "$RUNNER_DIR/.runner" | python3 -c "import sys,json; print(json.load(sys.stdin).get('gitHubUrl',''))" 2>/dev/null || true)
     echo "Runner already configured for: $CURRENT_REPO"
     echo "To add another repo, you need a separate runner instance or an org-level runner."
   else
     TOKEN=$(gh api --method POST "repos/$REPO/actions/runners/registration-token" --jq '.token')
     cd "$RUNNER_DIR"
     ./config.sh --url "https://github.com/$REPO" --token "$TOKEN" --labels "self-hosted,sherlock" --name "sherlock" --unattended
   fi
   ```

3. **Commit and push** the workflow file.

4. **Test** by commenting `/run echo hello` on any issue or PR.

## Important

- The workflow must be on the default branch (usually `main`) for `issue_comment` triggers to work.
- The runner must be running: `cd /home/groups/swl1/ekb/actions-runner && nohup ./run.sh > runner.log 2>&1 &`
- Repos must be cloned under `/home/groups/swl1/ekb/Projects/<repo-name>/` for auto-detection.
