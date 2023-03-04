# pre-commit-hooks

Some [pre-commit/pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks).

## Make

For `make`.

## Update `CITATION.cff`

`pyproject.toml` contains meta information:

```toml
[project]
name = ""
description = ""
authors = [{ name = "", email = "" }]
readme = "README.md"
```

Use `pyproject.toml` to update
[CITATION.cff](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files)

## Update `package.json`

[frinyvonnick/gitmoji-changelog](https://github.com/frinyvonnick/gitmoji-changelog)
depends on:

```json
{
  "name": "",
  "version": "",
  "description": "",
  "author": "",
  "license": ""
}
```

## Update `addon-info.json`

[google/vimdoc](https://github.com/google/vimdoc) depends on:

```json
{
  "name": "",
  "description": "",
  "version": "",
  "author": "",
  "repository": {
    "type": "",
    "url": ""
  }
}
```

## Update `pyproject.toml`

```console
$ ls requirements/*.txt
requirements/a.txt
requirements/b.txt
...
```

Your `pyproject.toml`:

```toml
[tool.setuptools.dynamic.optional-dependencies.a]
file = "requirements/a.txt"

[tool.setuptools.dynamic.optional-dependencies.b]
file = "requirements/b.txt"

...
```
