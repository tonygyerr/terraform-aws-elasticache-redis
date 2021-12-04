# Test Files
go_test(
    name = "elasticache_pkg_test",
    srcs = glob([
        "*.go",
    ]),
    data = ["//terraform/modules/data/elasticache_redis:elasticache_pkg"],
    visibility = ["PUBLIC"],
    deps = [
        "//third_party/go:terratest",
        "//third_party/go:testify",
    ]
)