# asdf cache action

A GitHub Action that install [`asdf`] and all runtimes from `.tool-versions`.

It is a wrapper for [`asdf-vm/actions/install`] with a caches for `asdf`
and optionally for `pnpm`.

[`asdf-vm/actions/install`]: https://github.com/asdf-vm/actions
[`asdf`]: https://github.com/asdf-vm/asdf

```yml
      - name: Install tools from asdf config
        uses: ai/asdf-cache-action@v1
```

<a href="https://evilmartians.com/?utm_source=nanoid">
  <img src="https://evilmartians.com/badges/sponsored-by-evil-martians.svg"
       alt="Sponsored by Evil Martians" width="236" height="54">
</a>


## Full Example

```yml
name: CI
on:
  push:
    branches:
      - main
  pull_request:
permissions:
  contents: read
jobs:

  test:
    name: Test
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the repository
        uses: actions/checkout@v3
      - name: Install tools from asdf config
        uses: ai/asdf-cache-action@v1
      - name: Install dependencies
        run: pnpm install --ignore-scripts
      - name: Run tests
        run: pnpm test
```


## Inputs

If you are have jobs with `pnpm install` and `pnpm install --prod` you can use
`dependencies-cache` input to set different cache for a security reasons:

```yml
      - name: Install tools from asdf config
        uses: ai/asdf-cache-action@v1
        with:
          dependencies-cache: production
      - name: Install dependencies
        run: pnpm install --prod --ignore-scripts
```