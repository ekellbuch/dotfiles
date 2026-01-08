# General hygiene

- ALWAYS use `uv` for dependency management. (`uv init` on fresh repo)
  - Prefer to use shell calls with `uv` than to manually edit `pyproject.toml`
    - E.g. `uv add jax`, `uv sync`, etc., and adapt based on dependency checker
      feedback
- Run scripts, tests, etc. with `uv run` (etc.), rather than by manually
  activating the virtual environment
- For the installed version, `uv -V`. For docs, `https://docs.astral.sh/uv/`

# Code Quality Standards

- Before preparing any git commit, always use the deslop subagent to review and
  clean up AI-generated patterns.

## Subagent Format

When creating new subagents, follow this structure:

1. Clear description with trigger conditions ("Use when...", "Use proactively when...")
2. Body starts with HOW to get the relevant context (e.g., which commands to run, which files to read)
3. Bulleted list of specific criteria/rules to apply
4. End with: "Report at the end with a concise summary of what you changed/found."

Example reference: .claude/agents/deslop.md