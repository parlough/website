---
title: Markdown syntax and style
description: >-
  Learn about the standard and custom Markdown syntax supported on the site,
  as well as our preferred style.
---

## Headings

## Text styling

## Horizontal rule

## Links

## Images

## Lists

### Unordered lists

### Ordered lists

### Definition lists

## Block quotes

Block quotes are infrequently used on the site,
but are supported by the standard Markdown syntax,
with one or more lines starting with a greater-than arrow (`>`).

````markdown
> This block quoted content renders like this.
> Optionally, with more lines.
````

> This block quoted content renders like this.
> Optionally, with more than one line.

## Code blocks

Code blocks are supported through fenced code blocks,
which are indicated through opening and closing triple backticks.
A language, filetype, or `plaintext` after
the opening backticks is also required.

````markdown
```dart
void main() {
  print('Hello world!');
}
```
````

```dart
void main() {
  print('Hello world!');
}
```

To learn more about code blocks, the languages supported,
and the custom features we support to make them more expressive,
check out the [Code block reference][].

:::tip
If your code block contains triple back ticks or another fenced code block,
wrap your code block with quadruple backticks instead.
:::

[Code block reference]: TODO

## Asides

There is custom support for a variety of asides,
to call out related or important information.

Asides are indicated by opening and closing triple colons (`:::`),
an aside type, and an optional title.

## Details

While the HTML `<details>` and `<summary>` elements work,
if you need to initially hide content,
prefer to use the custom [Liquid details tag][].

[Liquid details tag]: TODO

## Tables

## Diagrams

The site does not currently support rendering diagrams from Markdown,
such as [Mermaid][] syntax within code blocks.

If you need a diagram for your documentation,
consider online tools such as [Excalidraw][], [draw.io][],
or any other vector-based diagramming tool.

[Excalidraw]: https://excalidraw.com/
[Mermaid]: https://mermaid.js.org/

## Raw HTML

Raw HTML is supported when needed, but should be avoided if possible.
If you do need HTML, consider if you can introduce it with
a custom [Markdown syntax][] or [Liquid tag][].

[custom Markdown syntax]: TODO(parlough)
[Liquid tag]: /contribute/docs/reference/liquid#custom-tags

## Comments

While HTML comments are supported, prefer to use [Liquid comments][],
which are not included in the rendered output.

[Liquid comments]: /contribute/docs/reference/liquid#comments

## Liquid variables and tags

All text-based content files on the site, including Markdown and HTML,
are processed as [Liquid][] templates.
This enables support for partials, variables, control flow,
and more within documents.
The site also adds multiple custom features using Liquid,
including support for tab navigation,

To learn more about the Liquid features you can use on the site,
check out the [Liquid templating syntax and reference][] doc.


[Liquid]: https://liquidjs.com/index.html
[Liquid templating syntax and reference]: /contribute/docs/reference/liquid