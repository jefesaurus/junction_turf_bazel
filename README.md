## Initial setup

## Add remotes
git remote add -f junction https://github.com/preshing/junction.git
git remote add -f turf https://github.com/preshing/turf.git

## Add as subtrees
git subtree add --prefix turf turf master --squash
git subtree add --prefix junction junction master --squash
