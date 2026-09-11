# Get-Branch-Name Github Action

This action outputs the current branch name and corresponding tag. Composite action: one `bash` step, no container build per run and no Node runtime to deprecate.

## Outputs

### `branch`

The current branch name — `GITHUB_REF` with the `refs/heads/` prefix removed. Refs that are not branches (tags, pull requests) come through unchanged, e.g. `refs/tags/v1`.

### `tag`

`master` on the master branch, `latest` when the ref is a tag, empty otherwise.

## Example usage

```yaml
- name: Get Current Branch
  id: get-branch
  uses: codio/get-branch-name-github-action@v2

- run: echo "${{ steps.get-branch.outputs.branch }} / ${{ steps.get-branch.outputs.tag }}"
```
