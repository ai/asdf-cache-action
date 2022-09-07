# asdf cache action

A GitHub Action that install [`asdf`] and all runtimes from `.tool-versions`.

It is a wrapper for [`asdf-vm/actions/install`] with a caches for `asdf`
and optionally for `pnpm`.

[`asdf-vm/actions/install`]: https://github.com/asdf-vm/actions
[`asdf`]: https://github.com/asdf-vm/asdf

```yml
      - name: Install tools from asdf config
        uses: ai/asdf-cache-action@main
```

If you are have jobs with `pnpm install` and `pnpm install --prod` you can use
`dependencies-cache` option to set different cache for a security reasons:

```yml
      - name: Install tools from asdf config
        uses: ai/asdf-cache-action@main
        with:
          dependencies-cache: production
      - name: Install dependencies
        run: pnpm install --prod --ignore-scripts
```