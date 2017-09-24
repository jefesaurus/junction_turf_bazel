## Add as subtrees
```
git subtree add --prefix turf https://github.com/preshing/turf.git master --squash
git subtree add --prefix junction https://github.com/preshing/junction.git master --squash
```

## Update subtrees
```
git subtree pull --prefix turf https://github.com/preshing/turf.git master --squash
git subtree pull --prefix junction https://github.com/preshing/junction.git master --squash
```

## Including this Bazel conversion in a parent Bazel workspace 

I've included the `BUILD` file, so it should be okay to add the repo to your `WORKSPACE` with something like this:
```
http_archive(
    name="junction_turf_bazel",
    urls="https://github.com/jefesaurus/archive/junction_turf_bazel.tar.gz",
    sha256=???)
```

Then you can depend on either of the targets `@junction_turf_bazel//:junction` or`@junction_turf_bazel//:turf`. And then include the files like system headers relative to the include directory with `#include <junction/ConcurrentMap_Grampa.h>`
