# Smart-rules engine

The main way to communicate with a DECODE node and operate its
functions is via a language, rather than an API. All read and write
operations affecting entitlements and accessing attributes can be
expressed in a smart-rule language, which we intend to design and
develop to become a robust open standard for authorisation around
personal data. The DECODE smart-rule language will aim to naturally
avoid complex constructions and define sets of transformations that
can be then easily represented with visual metaphors.

What we call smart-rule language in DECODE is a computable
[@sober1978computability] sociolect [@louwerse2004semantic] that can
be parsed into a semantic model referred to a finite ontology and
executed by a distributed computing cluster. It is of central
importance to grant participants the access to such a language and
clear understanding of what it expresses and of the consequences of
its execution.

The open nature of the smart-rules is extremely important when
compared to the popularization of "sharing economies" that apply
mostly unknown rules that are opaque to the participants and
undemocratically adjusted by third parties who are not participating
in the economy, but in most cases just profiting from it.

The DECODE project plans the development of a language for
"smart-rules" that is not conceived to stay behind the scenes, but to
be understood and modified: this a different approach to data
management rather than CRUD-type interaction, an approach that is also
necessitated by the distributed and write once immutable nature of
blockchain technologies.

DECODE's smart-rule language is conceived as a trust framework
which is both usable (can be executed) and expressive (can be
understood) to encode smart-rules and contracts relating to the
governance of personal and other data in the DECODE architecture. The
possibility to understand and not only to execute a language is of
paramount importance to allow algorithmic sovereignty
[@Roio2017AlgoSov]. Algorithms are law [@lessig1999code] in their own
specific domain and just as law they must be subject to reviews,
critiques and transformations according to societal needs and
techno-political negotiations.

The objective is to achieve compliance with privacy regulations and
digital right by converging them in a usable and expressive integrated
approach (crossing the domains of social, legal, economic and
technical modeling) formalised by smart-rules that represent social
contracts and entitlements. The design of the smart-rule language
should promote clarity and avoid ambiguities. The rules should ensure
the respect of the decisions of the data owner (for example, citizens,
or the city administration or an organisation processing data) as well
regulations and legal obligations on application providers.

The data management and policy enforcement according to rules is
defined by the user interacting directly with rules or with a
facilitate abstraction of them, graphically representing their flow,
facilitating progressive level of understanding by all participants.

Arguably, a task-oriented mindset should be assumed when re-designing
a new blockchain language for DECODE. The opportunity for innovating
the field lies in abandoning this approach and instead build an
External Domain Specific Language [@fowler2010domain] using an
existing grammar to do the Syntax-Directed Translation. The Semantic
Model can be then a coarse-grained implementation that can sync
computations with blockchain based deterministic conditionals.

## Language Security

The research made on "Language-theretical security" should be the
underpinning of DECODE's smart-rule language. Here below we include a
brief explanation condensed from the information material of the
LangSec.org project hosted at IEEE, which is informed by the
collective experience of the exploit development community, since
exploitation is practical exploration of the space of unanticipated
state, its prevention or containment.

> In a nutshell [...] LangSec is the idea that many security issues can be avoided by applying a standard process to input processing and protocol design: the acceptable input to a program should be well-defined (i.e., via a grammar), as simple as possible (on the Chomsky scale of syntactic complexity), and fully validated before use (by a dedicated parser of appropriate but not excessive power in the Chomsky hierarchy of automata). [@DBLP:conf/secdev/MomotBHP16]

LangSec is a design and programming philosophy that focuses on
formally correct and verifiable input handling throughout all phases
of the software development lifecycle. In doing so, it offers a
practical method of assurance of software free from broad and
currently dominant classes of bugs and vulnerabilities related to
incorrect parsing and interpretation of messages between software
components (packets, protocol messages, file formats, function
parameters, etc.).

This design and programming paradigm begins with a description of
valid inputs to a program as a formal language (such as a
grammar). The purpose of such a disciplined specification is to
cleanly separate the input-handling code and processing code. A
LangSec-compliant design properly transforms input-handling code into
a recognizer for the input language; this recognizer rejects
non-conforming inputs and transforms conforming inputs to structured
data (such as an object or a tree structure, ready for type- or
value-based pattern matching). The processing code can then access the
structured data (but not the raw inputs or parsers temporary data
artifacts) under a set of assumptions regarding the accepted inputs
that are enforced by the recognizer.

This approach leads to several advantages:

 1. produce verifiable recognizers, free of typical classes of ad-hoc parsing bugs
 2. produce verifiable, composable implementations of distributed systems that ensure equivalent parsing of messages by all components and eliminate exploitable differences in message interpretation by the elements of a distributed system
 3. mitigate the common risks of ungoverned development by explicitly exposing the processing dependencies on the parsed input.

As a design philosophy, LangSec focuses on a particular choice of
verification trade-offs: namely, correctness and computational
equivalence of input processors.


## Syntax-Directed Translation

For the initial design phase the LUA language interpreter is adopted
for the syntax-directed translation of smart-rule language
semantics. Lua is an interpreted, cross-platform, embeddable,
performant and low-footprint language whose popularity is on the rise
in the last couple of years. Simple design and efficient usage of
resources combined with its performance make it attractive for
production web applications even to big organizations such as
Wikipedia, CloudFlare and GitHub. In addition to this, Lua is one of
the preferred choices for programming embedded and IoT devices. This
context allows to assume a large and growing Lua codebase yet to be
assessed. This growing Lua codebase could be potentially driving
production servers and extremely large number of devices, some perhaps
with mission-critical function for example in automotive or
home-automation domains. [@costin2017lua]

Lua solidity has been well tested through a number of public
applications including the adoption by the gaming industry for
untrusted language processing in "World of Warcraft" scripting. It is
ideal for implementing an external DSL using C or Python as a host
language.

Lua is also tooled with a working VPL implementation for code
visualisation in BLOCKS, allowing the project to jump-start into an
early phase of prototyping DECODE smart-rules in a visual way and
involving directly pilot participants.

## Satisfiability Modulo theories

Satisfiability Modulo theories (SMT) is an area of automated deduction
that studies methods for checking the satisfiability of first-order
formulas with respect to some logical theory of interest
[@barrett2009satisfiability]. It differs from general automated
deduction in that the background theory need not be finitely or even
first-order axiomatizable, and specialized inference methods are used
for each theory. By being theory-specific and restricting their
language to certain classes of formulas (such as, typically but not
exclusively, quantifier-free formulas), these specialized methods can
be implemented in solvers that are more efficient in practice than
general-purpose theorem provers.

While SMT techniques have been traditionally used to support deductive
software verification, they are now finding applications in other
areas of computer science such as, for instance, planning, model
checking and automated test generation. Typical theories of interest
in these applications include formalizations of arithmetic, arrays,
bit vectors, algebraic datatypes, equality with uninterpreted
functions, and various combinations of these.

Constraint-satisfaction is crucial to software and hardware
verification and static program analsysis [@de2011satisfiability]
among the other possible applications.

DECODE will benefit from including SMT capabilities into the design at
an early stage: even if not immediately exploited, their inclusion
will keep the horizons for language development open while permitting
its application in mission critical roles.
