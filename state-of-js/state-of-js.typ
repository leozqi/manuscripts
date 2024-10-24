#import "@preview/hydra:0.5.1": hydra

#set page(
  paper: "a5",
  number-align: center,
  margin: (
    inside: 2.5cm,
    outside: 2cm,
    y: 2.5cm,
  ),
  numbering: "1",
  header: context {
    if calc.odd(here().page()) {
      align(right, emph(hydra(1)))
    } else {
      align(left, emph(hydra(2)))
    }
  } 
)
#set heading(
  numbering: "1.a",
)
#show heading: it => {
  it.body
  v(.2em)
}
#show heading.where(level: 1): it => pagebreak(weak: true) + it

#set par(
  justify: true
)

#let codeExample(body) = {
  set text(size: 9pt)
  set align(center)
  rect(
    fill: none,
    inset: 8pt,
    radius: 4pt,
    body
  )
}


#outline()

= The state of JavaScript

Today, more developers use JavaScript than any other language in the world.
It is the common tongue that ties together different ways of thinking, and programming.
However, most books either

1. Dwell purely on the syntax of the language, ignoring the rationale and development of several _approaches_ of developing
2. Focus on a specific paradigm.

This is a companion book.
It introduces all the paradigms and traces the evolution of JavaScript, as well as its architectural foundation.

We will go over

1. JavaScript's development
2. The different and distinct communities using the language
3. Mental models each community has developed separately
4. Common patterns to encounter.

Why read this book?
By understanding each "branch" of the JavaScript family, you become a versatile user of all branches.
You will understand the different constraints guiding the evolution of this language.

== Early days

JavaScript was invented by Brendan Eich in 1995.
It was developed for Netscape 2, and became the ECMA-262 standard in 1997.
After Netscape handed JavaScript over to ECMA, the Mozilla Foundation continued to develop JavaScript for the Firefox browser.
Mozilla's latest version was 1.8.5.

= Node.js

Node.js is a free, open-source, cross-platform JS _runtime environment_.
It was written by Ryan Dahl in 2009.

A runtime lets JS run on the computer; Dahl wanted to write servers.
He boasted Node.js's optimizations when it came to concurrent connections and asynchronous programming.
The project combined the Google V8 engine (used in Chromium), an event loop, and a low-level I/O API that could be called in JS.

The main reason for Node's adoption turned out to be its package manager, `npm`: the Node Package Manager.
It allowed developers to publish and share Node packages and source code and use each other's code very easily.
Analogous to Tex's CTAN, PHP's composer, and Python's `pip`, npm differed in its scope.
It was backed by Microsoft's GitHub and had the largest download rates ever.
Even today, when developers speak of "supply-chain security", they're talking about node packages; most of the time.

This is `Node.js`'s default project:

#codeExample(```js
const { createServer } = require('node:http');

const hostname = '127.0.0.1';
const port = 3000;

const server = createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```
)

#lorem(250)
