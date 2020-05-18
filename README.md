# `rules_boost` -- Bazel build rules for Boost

To use these rules, add the following to your `WORKSPACE` file:

```bazel
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_nelhage_rules_boost",
    commit = "9f9fb8b2f0213989247c9d5c0e814a8451d18d7f",
    remote = "https://github.com/nelhage/rules_boost",
    shallow_since = "1570056263 -0700",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
boost_deps()
```

You can then use libraries in `deps` through the `@boost` repository, for
example `@boost//:algorithm`.


Based in part on rules from https://github.com/mzhaom/trunk.

## ASIO SSL support

These rules implement support for Boost ASIO's SSL support. To use
ASIO-SSL, you must depend on the `"@boost//:asio_ssl"` target, instead
of `"@boost//:asio"`. ASIO-SSL depends on OpenSSL; By default,
`rules_boost` will download and build a recent
[BoringSSL](https://boringssl.googlesource.com/boringssl/) commit; To
use a different OpenSSL implementation, create a remote named
`openssl` before calling `boost_deps`. This remote must make available
OpenSSL's libssl at `@openssl//:ssl`.
