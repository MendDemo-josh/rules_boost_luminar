"rules_boost_test"

module(
    name = "rules_boost_test",
    version = "0.0.1",
)

bazel_dep(
    name = "rules_boost", 
    version = "0.0.1"
)

# Override the path to the local rules_boost repository
local_path_override(
    name = "rules_boost", 
    path = "../"
)
