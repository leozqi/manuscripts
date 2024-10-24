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
  numbering: "1.1)",
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

#let dedication(body) = {
  set align(center)
  h(1fr)
  body
}

#let defn(body) = {
  emph(body)
}

#dedication([_For my parents_])

#outline()

= A unified perspective

This book examines control systems from many perspectives.
From the physical and mechanical, electronic, and biological fields, it aims to unify the connected ideas and give an understanding of something very important to real life.

We are focused on discovery of concepts and intuitive understanding, so in making these connections one does not need domain specific knowledge.
I am a computer engineer, and have tried to describe the other systems in terms that one can understand.

A glossary is provided.

Soon you will see the same patterns for systems everywhere.


= What is a system?

Let's give names to some integral parts of systems.
This can be made very rigorous but let's start simple.

A _system_ is anything that takes in _inputs_ and produces _outputs_.

$ S: bold(x) -> bold(y) $ 

We assume there is some relationship, or mapping, between the inputs and outputs.

Most systems are formed from many simpler systems, acting in concert.
A very abstract example is:

$ S: bold(x) -> bold(y) $

$ bold(y) = S_3 (S_1(bold(x)), S_2(bold(x))) $

This is an expression saying that $S$ is really three systems.
$S_1$ and $S_2$ produce different outputs for the initial input.
$S_3$ takes _those_ two outputs and combines them to form the final system output.

Another important consideration is _time_.
Many systems are represented such that the outputs are instantaneous, but in reality it takes time for a system to change its input to its output.
We examine this impact in two ways:

1. We state that given an input $bold(x)$, the output will become $bold(y)$ after a #defn[hold time]. (discrete model)
2. We give inputs and outputs with respect to time. (continuous model)

#lorem(500)


= Synchronization

The problem of synchronization is paramount for _protocols_.
We distinguish between _producers_, _consumers_, and _ports_.

1. Producer: the system component that produces data.
2. Consumer: component consuming data, or information.
3. Port: a communication channel used to transfer the data.
   This can be a wire, or a RF frequency.



#bibliography("works.bib")

