local parser = clink.arg.new_parser

local uv_global_flags = {
    "--help",
    "-h",
    "--verbose",
    "-v",
    "--version",
    "-V",
    "--color",
    "--native-tls",
    "--offline",
    "--allow-insecure-host",
    "--no-progress",
    "--directory",
    "--project",
    "--config-file",
    "--no-config",
}

local uv_python_flags = {
    "--managed-python",
    "--no-managed-python",
    "--no-python-downloads",
}

local uv_python_with_extras_flags = {
    "-p",
    "--python",
    "--managed-python",
    "--no-managed-python",
    "--no-python-downloads",
}

local uv_cache_flags = {
    "-n",
    "--no-cache",
    "--cache-dir",
}

local uv_index_flags = {
    "--index",
    "--default-index",
    "-i",
    "--index-url",
    "--extra-index-url",
    "-f",
    "--find-links",
    "--no-index",
    "--index-strategy",
    "--keyring-provider",
}

local uv_resolver_flags = {
    "-U",
    "--upgrade",
    "-P",
    "--upgrade-package",
    "--resolution",
    "--prerelease",
    "--fork-strategy",
    "--exclude-newer",
    "--exclude-newer-package",
    "--no-sources",
}

local uv_build_flags = {
    "-C",
    "--config-setting",
    "--config-settings-package",
    "--no-build-isolation",
    "--no-build-isolation-package",
    "--no-build",
    "--no-build-package",
    "--no-binary",
    "--no-binary-package",
    "--refresh",
    "--refresh-package",
}

local uv_installer_flags = {
    "--reinstall",
    "--reinstall-package",
    "--link-mode",
    "--compile-bytecode",
}

local uv_publish_parser = parser(
    {},
    "--index",
    "-u",
    "--username",
    "-p",
    "--password",
    "-t",
    "--token",
    "--trusted-publishing",
    "--keyring-provider",
    "--publish-url",
    "--check-url",
    "--dry-run"
)
uv_publish_parser:add_flags(uv_cache_flags)
uv_publish_parser:add_flags(uv_python_flags)
uv_publish_parser:add_flags(uv_global_flags)

local uv_build_parser = parser(
    {},
    "--package",
    "--all-packages",
    "-o",
    "--out-dir",
    "--sdist",
    "--wheel",
    "--no-build-logs",
    "--force-pep517",
    "--clear",
    "--no-create-gitignore",
    "-b",
    "--build-constraints",
    "--require-hashes",
    "--no-verify-hashes"
)
uv_build_parser:add_flags(uv_build_flags)
uv_build_parser:add_flags(uv_installer_flags)
uv_build_parser:add_flags(uv_resolver_flags)
uv_build_parser:add_flags(uv_index_flags)
uv_build_parser:add_flags(uv_cache_flags)
uv_build_parser:add_flags(uv_global_flags)
uv_build_parser:add_flags(uv_python_with_extras_flags)

local uv_format_parser = parser({}, "--check", "--diff", "--version", "--no-project")
uv_format_parser:add_flags(uv_cache_flags)
uv_format_parser:add_flags(uv_python_flags)
uv_format_parser:add_flags(uv_global_flags)

local uv_tree_parser = parser(
    {},
    "--universal",
    "-d",
    "--depth",
    "--prune",
    "--package",
    "--no-dedupe",
    "--invert",
    "--outdated",
    "--show-sizes",
    "--only-dev",
    "--no-dev",
    "--group",
    "--no-group",
    "--no-default-groups",
    "--only-group",
    "--all-groups",
    "--locked",
    "--frozen",
    "--script",
    "--python-version",
    "--python-platform",

    -- Global options
    "--link-mode"
)
uv_tree_parser:add_flags(uv_build_flags)
uv_tree_parser:add_flags(uv_resolver_flags)
uv_tree_parser:add_flags(uv_index_flags)
uv_tree_parser:add_flags(uv_cache_flags)
uv_tree_parser:add_flags(uv_global_flags)
uv_tree_parser:add_flags(uv_python_with_extras_flags)

local uv_export_parser = parser(
    {},
    "--format",
    "--all-packages",
    "--package",
    "--prune",
    "--extra",
    "--all-extras",
    "--no-extra",
    "--no-dev",
    "--only-dev",
    "--group",
    "--no-group",
    "--no-default-groups",
    "--only-group",
    "--all-groups",
    "--no-annotate",
    "--no-header",
    "--no-editable",
    "--no-hashes",
    "-o",
    "--output-file",
    "--no-emit-project",
    "--no-emit-workspace",
    "--no-emit-local",
    "--no-emit-package",
    "--locked",
    "--frozen",
    "--script",

    -- Global options
    "--link-mode"
)
uv_export_parser:add_flags(uv_build_flags)
uv_export_parser:add_flags(uv_resolver_flags)
uv_export_parser:add_flags(uv_index_flags)
uv_export_parser:add_flags(uv_cache_flags)
uv_export_parser:add_flags(uv_python_with_extras_flags)
uv_export_parser:add_flags(uv_global_flags)

local uv_lock_parser = parser(
    {},
    "--dry-run",
    "--script",
    "--check",
    "--check-exists",

    -- Global options
    "--link-mode"
)
uv_lock_parser:add_flags(uv_build_flags)
uv_lock_parser:add_flags(uv_resolver_flags)
uv_lock_parser:add_flags(uv_index_flags)
uv_lock_parser:add_flags(uv_cache_flags)
uv_lock_parser:add_flags(uv_python_with_extras_flags)
uv_lock_parser:add_flags(uv_global_flags)

local uv_sync_parser = parser(
    {},
    "--extra",
    "--output-format",
    "--all-extras",
    "--no-extra",
    "--no-dev",
    "--only-dev",
    "--group",
    "--no-group",
    "--no-default-groups",
    "--only-group",
    "--all-groups",
    "--no-editable",
    "--inexact",
    "--active",
    "--no-install-project",
    "--no-install-workspace",
    "--no-install-local",
    "--no-install-package",
    "--locked",
    "--frozen",
    "--dry-run",
    "--all-packages",
    "--package",
    "--script",
    "--python-platform",
    "--check"
)
uv_sync_parser:add_flags(uv_build_flags)
uv_sync_parser:add_flags(uv_installer_flags)
uv_sync_parser:add_flags(uv_resolver_flags)
uv_sync_parser:add_flags(uv_index_flags)
uv_sync_parser:add_flags(uv_cache_flags)
uv_sync_parser:add_flags(uv_python_with_extras_flags)
uv_sync_parser:add_flags(uv_global_flags)

local uv_version_parser = parser(
    {},
    "--bump",
    "--dry-run",
    "--short",
    "--output-format",
    "--no-sync",
    "--active",
    "--locked",
    "--frozen",
    "--package"
)
uv_version_parser:add_flags(uv_build_flags)
uv_version_parser:add_flags(uv_installer_flags)
uv_version_parser:add_flags(uv_resolver_flags)
uv_version_parser:add_flags(uv_index_flags)
uv_version_parser:add_flags(uv_cache_flags)
uv_version_parser:add_flags(uv_python_with_extras_flags)
uv_version_parser:add_flags(uv_global_flags)

local uv_remove_parser = parser(
    {},
    "--dev",
    "--optional",
    "--group",
    "--no-sync",
    "--locked",
    "--frozen",
    "--active",
    "--package",
    "--script"
)
uv_remove_parser:add_flags(uv_build_flags)
uv_remove_parser:add_flags(uv_installer_flags)
uv_remove_parser:add_flags(uv_resolver_flags)
uv_remove_parser:add_flags(uv_index_flags)
uv_remove_parser:add_flags(uv_cache_flags)
uv_remove_parser:add_flags(uv_python_with_extras_flags)
uv_remove_parser:add_flags(uv_global_flags)

local uv_add_parser = parser(
    {},
    "-r",
    "--requirements",
    "-c",
    "--constraints",
    "-m",
    "--marker",
    "--dev",
    "--optional",
    "--group",
    "--editable",
    "--raw",
    "--bounds",
    "--rev",
    "--tag",
    "--branch",
    "--extra",
    "--no-sync",
    "--locked",
    "--frozen",
    "--active",
    "--package",
    "--script",
    "--workspace",
    "--no-workspace",
    "--no-install-project",
    "--no-install-workspace",
    "--no-install-local"
)
uv_add_parser:add_flags(uv_build_flags)
uv_add_parser:add_flags(uv_installer_flags)
uv_add_parser:add_flags(uv_resolver_flags)
uv_add_parser:add_flags(uv_index_flags)
uv_add_parser:add_flags(uv_cache_flags)
uv_add_parser:add_flags(uv_python_with_extras_flags)
uv_add_parser:add_flags(uv_global_flags)

local uv_init_parser = parser(
    {},
    "--name",
    "--bare",
    "--package",
    "--no-package",
    "--app",
    "--lib",
    "--script",
    "--description",
    "--no-description",
    "--vcs",
    "--build-backend",
    "--no-readme",
    "--author-from",
    "--no-pin-python",
    "--no-workspace"
)
uv_init_parser:add_flags(uv_build_flags)
uv_init_parser:add_flags(uv_installer_flags)
uv_init_parser:add_flags(uv_resolver_flags)
uv_init_parser:add_flags(uv_index_flags)
uv_init_parser:add_flags(uv_cache_flags)
uv_init_parser:add_flags(uv_global_flags)
uv_init_parser:add_flags(uv_python_with_extras_flags)

local uv_run_parser = parser(
    {},
    "--extra",
    "--all-extras",
    "--no-extra",
    "--no-dev",
    "--group",
    "--no-group",
    "--no-default-groups",
    "--only-group",
    "--all-groups",
    "-m",
    "--module",
    "--only-dev",
    "--no-editable",
    "--exact",
    "--env-file",
    "--no-env-fil",
    "-w",
    "--with",
    "--with-editable",
    "--with-requirements",
    "--isolated",
    "--active",
    "--no-sync",
    "--locked",
    "--frozen",
    "-s",
    "--script",
    "--gui-script",
    "--all-packages",
    "--package",
    "--no-project",
    "--python-platform"
)
uv_run_parser:add_flags(uv_cache_flags)
uv_run_parser:add_flags(uv_python_with_extras_flags)
uv_run_parser:add_flags(uv_global_flags)

local uv_auth_login_parser = parser({}, "-u", "--username", "--password", "-t", "--token", "--keyring-provider")
uv_auth_login_parser:add_flags(uv_cache_flags)
uv_auth_login_parser:add_flags(uv_python_flags)
uv_auth_login_parser:add_flags(uv_global_flags)

local uv_auth_user_parser = parser({}, "-u", "--username", "--keyring-provider")
uv_auth_user_parser:add_flags(uv_cache_flags)
uv_auth_user_parser:add_flags(uv_python_flags)
uv_auth_user_parser:add_flags(uv_global_flags)

local uv_auth_dir_parser = parser({})
uv_auth_dir_parser:add_flags(uv_cache_flags)
uv_auth_dir_parser:add_flags(uv_python_flags)
uv_auth_dir_parser:add_flags(uv_global_flags)

local uv_auth_parser = parser({
    "login" .. uv_auth_login_parser,
    "logout" .. uv_auth_user_parser,
    "token" .. uv_auth_user_parser,
    "dir" .. uv_auth_dir_parser,
})
uv_auth_parser:add_flags(uv_cache_flags)
uv_auth_parser:add_flags(uv_global_flags)
uv_auth_parser:add_flags(uv_python_flags)

local uv_tool_uninstall_parser = parser({}, "--all")
uv_tool_uninstall_parser:add_flags(uv_cache_flags)
uv_tool_uninstall_parser:add_flags(uv_global_flags)
uv_tool_uninstall_parser:add_flags(uv_python_flags)

local uv_tool_list_parser =
    parser({}, "--show-paths", "--show-version-specifiers", "--show-with", "--show-extras", "--show-python")
uv_tool_list_parser:add_flags(uv_cache_flags)
uv_tool_list_parser:add_flags(uv_global_flags)
uv_tool_list_parser:add_flags(uv_python_flags)

local uv_tool_upgrade_parser = parser({}, "--all", "--python-platform")
uv_tool_upgrade_parser:add_flags(uv_index_flags)
uv_tool_upgrade_parser:add_flags(uv_installer_flags)
uv_tool_upgrade_parser:add_flags(uv_build_flags)
uv_tool_upgrade_parser:add_flags(uv_cache_flags)
uv_tool_upgrade_parser:add_flags(uv_resolver)
uv_tool_upgrade_parser:add_flags(uv_python_flags)
uv_tool_upgrade_parser:add_flags(uv_global_flags)

local uv_tool_run_parser = parser(
    {},
    "--from",
    "-w",
    "--with",
    "--with-editable",
    "--with-requirements",
    "-c",
    "--constraints",
    "-b",
    "--build-constraints",
    "--overrides",
    "--isolated",
    "--env-file",
    "--no-env-file",
    "--python-platform"
)
uv_tool_run_parser:add_flags(uv_index_flags)
uv_tool_run_parser:add_flags(uv_installer_flags)
uv_tool_run_parser:add_flags(uv_build_flags)
uv_tool_run_parser:add_flags(uv_cache_flags)
uv_tool_run_parser:add_flags(uv_python_with_extras_flags)
uv_tool_run_parser:add_flags(uv_global_flags)

local uv_tool_install_parser = parser(
    {},
    "-w",
    "--with",
    "--with-requirements",
    "-e",
    "--editable",
    "--with-editable",
    "--with-executables-from",
    "-c",
    "--constraints",
    "--overrides",
    "-b",
    "--build-constraints",
    "--force",
    "--python-platform"
)
uv_tool_install_parser:add_flags(uv_index_flags)
uv_tool_install_parser:add_flags(uv_installer_flags)
uv_tool_install_parser:add_flags(uv_build_flags)
uv_tool_install_parser:add_flags(uv_cache_flags)
uv_tool_install_parser:add_flags(uv_python_with_extras_flags)
uv_tool_install_parser:add_flags(uv_global_flags)

local uv_tool_parser = parser({
    "run" .. uv_tool_run_parser,
    "install" .. uv_tool_install_parser,
    "upgrade" .. uv_tool_upgrade_parser,
    "list" .. uv_tool_list_parser,
    "uninstall" .. uv_tool_uninstall_parser,
    "update-shell" .. parser({}, uv_cache_flags, uv_python_flags, uv_global_flags),
    "dir" .. parser({}, "--bin", uv_cache_flags, uv_python_flags, uv_global_flags),
})
uv_tool_parser:add_flags(uv_cache_flags)
uv_tool_parser:add_flags(uv_global_flags)
uv_tool_parser:add_flags(uv_python_flags)

local uv_python_list_parser = parser(
    {},
    "--all-versions",
    "--all-platforms",
    "--all-arches",
    "--only-installed",
    "--only-downloads",
    "--show-urls",
    "--output-format",
    "--python-downloads-json-url",
    "--python-platform"
)
uv_python_list_parser:add_flags(uv_cache_flags)
uv_python_list_parser:add_flags(uv_global_flags)
uv_python_list_parser:add_flags(uv_python_flags)

local uv_python_install_parser = parser(
    {},
    "-i",
    "--install-dir",
    "--no-bin",
    "--no-registry",
    "--mirror",
    "--pypy-mirror",
    "--python-downloads-json-url",
    "-r",
    "--reinstall",
    "-f",
    "--force",
    "--default"
)
uv_python_install_parser:add_flags(uv_cache_flags)
uv_python_install_parser:add_flags(uv_global_flags)
uv_python_install_parser:add_flags(uv_python_flags)

local uv_python_upgrade_parser =
    parser({}, "-i", "--install-dir", "--mirror", "--pypy-mirror", "-r", "--reinstall", "--python-downloads-json-url")
uv_python_upgrade_parser:add_flags(uv_cache_flags)
uv_python_upgrade_parser:add_flags(uv_global_flags)
uv_python_upgrade_parser:add_flags(uv_python_flags)

local uv_python_find_parser = parser({}, "--no-project", "--system", "--script", "--show-version")
uv_python_find_parser:add_flags(uv_cache_flags)
uv_python_find_parser:add_flags(uv_global_flags)
uv_python_find_parser:add_flags(uv_python_flags)

local uv_python_pin_parser = parser({}, "--resolved", "--no-project", "--global", "--rm")
uv_python_pin_parser:add_flags(uv_cache_flags)
uv_python_pin_parser:add_flags(uv_python_flags)
uv_python_pin_parser:add_flags(uv_global_flags)

local uv_venv_parser = parser(
    {},
    "--no-project",
    "--seed",
    "-c",
    "--clear",
    "--allow-existing",
    "--prompt",
    "--system-site-packages",
    "--relocatable",
    "--index-strategy",
    "--keyring-provider",
    "--exclude-newer",
    "--exclude-newer-package",
    "--link-mode"
)
uv_venv_parser:add_flags(uv_python_with_extras_flags)
uv_venv_parser:add_flags(uv_index_flags)
uv_venv_parser:add_flags(uv_cache_flags)
uv_venv_parser:add_flags(uv_global_flags)

local uv_python_parser = parser({
    "list" .. uv_python_list_parser,
    "install" .. uv_python_install_parser,
    "upgrade" .. uv_python_upgrade_parser,
    "find" .. uv_python_find_parser,
    "pin" .. uv_python_pin_parser,
    "dir" .. parser({}, "--bin", uv_cache_flags, uv_python_flags, uv_global_flags),
    "uninstall" .. parser({}, "-i", "--install-dir", "--all", uv_cache_flags, uv_python_flags, uv_global_flags),
    "update-shell" .. parser({}, "-n", "--no-cache", "--cache-dir", uv_cache_flags, uv_python_flags, uv_global_flags),
})
uv_python_parser:add_flags(uv_cache_flags)
uv_python_parser:add_flags(uv_global_flags)
uv_python_parser:add_flags(uv_python_flags)

local uv_pip_compile_parser = parser(
    {},
    "--no-project",
    "--seed",
    "-c",
    "--clear",
    "--allow-existing",
    "--prompt",
    "--system-site-packages",
    "--relocatable",
    "--index-strategy",
    "--keyring-provider",
    "--exclude-newer",
    "--exclude-newer-package",
    "--link-mode",

    --Global options
    "--link-mode"
)
uv_pip_compile_parser:add_flags(uv_index_flags)
uv_pip_compile_parser:add_flags(uv_resolver_flags)
uv_pip_compile_parser:add_flags(uv_build_flags)
uv_pip_compile_parser:add_flags(uv_cache_flags)
uv_pip_compile_parser:add_flags(uv_python_flags)
uv_pip_compile_parser:add_flags(uv_global_flags)

local uv_pip_sync_parser = parser(
    {},
    "-c",
    "--constraints",
    "--overrides",
    "-b",
    "--build-constraints",
    "--extra",
    "--all-extras",
    "--group",
    "--no-deps",
    "-o",
    "--output-file",
    "--format",
    "--no-strip-extras",
    "--no-strip-markers",
    "--no-annotate",
    "--no-header",
    "--annotation-style",
    "--custom-compile-command",
    "--system",
    "--generate-hashes",
    "--no-build",
    "--no-binary",
    "--only-binary",
    "--python-platform",
    "--universal",
    "--no-emit-package",
    "--emit-index-url",
    "--emit-find-links",
    "--emit-build-options",
    "--emit-index-annotation",
    "--torch-backend"
)
uv_pip_sync_parser:add_flags(uv_index_flags)
uv_pip_sync_parser:add_flags(uv_installer_flags)
uv_pip_sync_parser:add_flags(uv_build_flags)
uv_pip_sync_parser:add_flags(uv_resolver_flags)
uv_pip_sync_parser:add_flags(uv_cache_flags)
uv_pip_sync_parser:add_flags(uv_python_with_extras_flags)
uv_pip_sync_parser:add_flags(uv_global_flags)

local uv_pip_install_parser = parser(
    {},
    "-r",
    "--requirements",
    "-e",
    "--editable",
    "-c",
    "--constraints",
    "--overrides",
    "-b",
    "--build-constraints",
    "--extra",
    "--all-extras",
    "--group",
    "--no-deps",
    "--require-hashes",
    "--no-verify-hashes",
    "--system",
    "--break-system-packages",
    "--no-break-system-packages",
    "--target",
    "--prefix",
    "--no-build",
    "--no-binary",
    "--only-binary",
    "--python-version",
    "--python-platform",
    "--exact",
    "--strict",
    "--dry-run",
    "--torch-backend",
    "--user"
)
uv_pip_install_parser:add_flags(uv_index_flags)
uv_pip_install_parser:add_flags(uv_resolver_flags)
uv_pip_install_parser:add_flags(uv_installer_flags)
uv_pip_install_parser:add_flags(uv_build_flags)
uv_pip_install_parser:add_flags(uv_cache_flags)
uv_pip_install_parser:add_flags(uv_python_with_extras_flags)
uv_pip_install_parser:add_flags(uv_global_flags)

local uv_pip_uninstall_parser = parser(
    {},
    "-r",
    "--requirements",
    "--keyring-provider",
    "--system",
    "--break-system-packages",
    "--no-break-system-packages",
    "--target",
    "--prefix",
    "--dry-run"
)
uv_pip_uninstall_parser:add_flags(uv_python_with_extras_flags)
uv_pip_uninstall_parser:add_flags(uv_cache_flags)
uv_pip_uninstall_parser:add_flags(uv_global_flags)

local uv_pip_list_parser = parser(
    {},
    "-e",
    "--editable",
    "--exclude-editable",
    "--exclude",
    "--format",
    "--outdated",
    "--strict",
    "--system",

    --Global options
    "--exclude-newer"
)
uv_pip_list_parser:add_flags(uv_index_flags)
uv_pip_list_parser:add_flags(uv_python_with_extras_flags)
uv_pip_list_parser:add_flags(uv_cache_flags)
uv_pip_list_parser:add_flags(uv_global_flags)

local uv_pip_show_parser = parser({}, "--strict", "-f", "--files", "--system")
uv_pip_show_parser:add_flags(uv_python_with_extras_flags)
uv_pip_show_parser:add_flags(uv_cache_flags)
uv_pip_show_parser:add_flags(uv_global_flags)

local uv_pip_tree_parser = parser(
    {},
    "--show-version-specifiers",
    "-d",
    "--depth",
    "--prune",
    "--package",
    "--no-dedupe",
    "--invert",
    "--outdated",
    "--show-sizes",
    "--strict",
    "--system",

    --Global options
    "--exclude-newer"
)
uv_pip_tree_parser:add_flags(uv_index_flags)
uv_pip_tree_parser:add_flags(uv_python_with_extras_flags)
uv_pip_tree_parser:add_flags(uv_cache_flags)
uv_pip_tree_parser:add_flags(uv_global_flags)

local uv_pip_check_parser = parser({}, "--system", "--python-version", "--python-platform")
uv_pip_check_parser:add_flags(uv_cache_flags)
uv_pip_check_parser:add_flags(uv_python_with_extras_flags)
uv_pip_check_parser:add_flags(uv_global_flags)

local uv_pip_parser = parser({
    "compile" .. uv_pip_compile_parser,
    "sync" .. uv_pip_sync_parser,
    "install" .. uv_pip_install_parser,
    "uninstall" .. uv_pip_uninstall_parser,
    "freeze" .. parser(
        {},
        "--exclude-editable",
        "--strict",
        "--path",
        "--system",
        uv_cache_flags,
        "-p",
        "--python",
        uv_python_flags,
        uv_global_flags
    ),
    "list" .. uv_pip_list_parser,
    "show" .. uv_pip_show_parser,
    "tree" .. uv_pip_tree_parser,
    "check",
})
uv_pip_parser:add_flags(uv_cache_flags)
uv_pip_parser:add_flags(uv_global_flags)
uv_pip_parser:add_flags(uv_python_flags)

local uv_cache_parser = parser({
    "clean" .. parser({}, "--force", uv_cache_flags, uv_python_flags, uv_global_flags),
    "prune" .. parser({}, "--ci", "--force", uv_cache_flags, uv_python_flags, uv_global_flags),
    "dir",
})
uv_cache_parser:add_flags(uv_cache_flags)
uv_cache_parser:add_flags(uv_global_flags)
uv_cache_parser:add_flags(uv_python_flags)

local uv_parser = parser({
    "auth" .. uv_auth_parser,
    "run" .. uv_run_parser,
    "init" .. uv_init_parser,
    "add" .. uv_add_parser,
    "remove" .. uv_remove_parser,
    "version" .. uv_version_parser,
    "sync" .. uv_sync_parser,
    "lock" .. uv_lock_parser,
    "export" .. uv_export_parser,
    "tree" .. uv_tree_parser,
    "format" .. uv_format_parser,
    "tool" .. uv_tool_parser,
    "python" .. uv_python_parser,
    "pip" .. uv_pip_parser,
    "venv" .. uv_venv_parser,
    "build" .. uv_build_parser,
    "publish" .. uv_publish_parser,
    "cache" .. uv_cache_parser,
})
uv_parser:add_flags(uv_cache_flags)
uv_parser:add_flags(uv_python_flags)
uv_parser:add_flags(uv_global_flags)

clink.arg.register_parser("uv", uv_parser)
