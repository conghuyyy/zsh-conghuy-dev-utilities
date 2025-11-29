## 🔹 Git Branch & Checkout
| Name             | Type  | Description                                                                    |
| ---------------- | ----- | ------------------------------------------------------------------------------ |
| `current_branch` | alias | Prints the name of the current Git branch (`git rev-parse --abbrev-ref HEAD`). |
| `checkout`       | alias | Shortcut for `git checkout`.                                                   |
| `checkdev`       | alias | Checks out the `develop` branch.                                               |

## 🔹 Commit Wrapper
| Name                     | Type     | Description                                                                                                                              |
| ------------------------ | -------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `commit "msg" [args...]` | function | Safe commit wrapper: <br>• Shows Git user info <br>• Requires typing **ok** to continue <br>• Runs `git commit -m "msg"` with extra args |


## 🔹 Git Push / Pull / Reset / Branch Ops
| Name                     | Type     | Description                                                        |
|--------------------------|----------|--------------------------------------------------------------------|
| `push`                   | alias    | Shows a message → pushes current branch to origin → shows “Done”.  |
| `force_push`             | alias    | Shows a warning → runs `git push --force-with-lease`.              |
| `pull <branch?>`         | function | Pulls from the specified branch, or the current branch if omitted. |
| `gp`                     | alias    | Use `pull` alias behind the scene, pulls from current branch         |
| `revert_previous_commit` | alias    | Soft-resets to previous commit (`git reset --soft HEAD@{1}`).      |
| `gf`                     | alias    | Runs `git fetch` → prints “Done”.                                  |

## 🔹 Git Branch Management
| Name            | Type  | Description                                                                   |
| --------------- | ----- | ----------------------------------------------------------------------------- |
| `delb <branch>` | alias | Force-deletes a local branch (`git branch -D`).                               |
| `delb_current`  | alias | Copies current branch name → switches to `develop` → deletes previous branch. |
| `bl`            | alias | Lists local branches (`git branch`).                                          |
| `glog`          | alias | Shows one-line commit log.                                                    |

## 🔹 Git Stash / Cherry-pick / User Info
| Name    | Type  | Description                                           |
| ------- | ----- | ----------------------------------------------------- |
| `stash` | alias | Stashes changes with a message (`git stash push -m`). |
| `pick`  | alias | Runs `git cherry-pick`.                               |
| `me`    | alias | Prints Git `user.name` and `user.email` with styling. |

## 🔹 System / Utilities
| Name              | Type     | Description                                              |
| ----------------- | -------- | -------------------------------------------------------- |
| `killport <port>` | function | Finds PID using the port → kills it with `sudo kill -9`. |
| `restart_nginx`   | alias    | Restarts nginx via Homebrew.                             |
| `cls`             | alias    | Clears the terminal.                                     |


## 🔹 Project / TypeScript Helpers
| Name        | Type  | Description                                                       |
| ----------- | ----- | ----------------------------------------------------------------- |
| `dev`       | alias | Clears local lint caches → runs `pnpm clean` → runs `pnpm dev`.   |
| `typecheck` | alias | Shows TS check message → runs `npx tsc --noEmit` → prints “Done”. |


