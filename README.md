# Get-Branch-Name Github Action

This action outputs the current branch name and corresponding tag. Composite action: one `bash` step, no container build per run and no Node runtime to deprecate.

## Outputs

### `branch`

The current branch name — `GITHUB_REF` with the `refs/heads/` prefix removed. Refs that are not branches (tags, pull requests) come through unchanged, e.g. `refs/tags/v1`.

### `docker-safe-branch`

`branch` made usable as a Docker image tag: every character outside `[A-Za-z0-9_.-]` becomes `-`, leading `.` and `-` are removed, and the result is cut to 128 characters, e.g. `dependabot/gradle/gradle-bc2102bea3` → `dependabot-gradle-gradle-bc2102bea3`. Use it for image tags; `branch` with a `/` makes `docker build` fail with `invalid reference format`.

### `tag`

`master` on the master branch, `latest` when the ref is a tag, empty otherwise.

## Example usage

```yaml
- name: Get Current Branch
  id: get-branch
  uses: codio/get-branch-name-github-action@v3

- run: echo "${{ steps.get-branch.outputs.branch }} / ${{ steps.get-branch.outputs.tag }}"
```
