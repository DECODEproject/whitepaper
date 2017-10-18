# Architectural Principles

DECODE is composed of both hardware and software components - each component will adhere to the core architectural principles described below. The underlying philosophy adopted is that of the Unix philosophy [@Raymond:2003:AUP:829549] following key principles of modularity, clarity, composition, separation, simplicity, parsimony, transparency, robustness, representation and least surprise.




## Free and Open source

All work produced by DECODE will be published as free and open source according to licenses approved by the Free Software Foundation Europe and emerging open hardware standards. The **openness** of the platform will enable innovation and citizen participation.

DECODE adopts free software, however free software projects cannot be entirely considered as digital commons. As a matter of fact, writing a code and publishing it with a free license are not sufficient conditions in order to realize a free software. There are other necessary conditions, among them:

- the reputation inside the community
- the adoption of the good practices diffused in the community (for instance public repository, - continuous free upgrading, an efficient system of bugtrack and feedback
the quality of the code, including its documentation to allow understanding of the code;
- the software's coverage, as the presence of automatic tests for evaluating the absence of bug on high percentages in the written code. [Ref D1.8]


## Modularity and interoperability

Adopting the key unix principle of modularity (simple parts connected by clean interface), enables building independent components which can be reused and combined to form a flexible eco-system of software products. DECODE will develop a modular privacy-aware tools and libraries that integrate with the operating system backed by a state of the art blockchain infrastructure supporting smart-contracts and privacy protections.

DECODE would adopt a layered architecture, with components that build on top of each other. As opposed to building privacy aware applications solely in the application layer (layer 7) of the Operating System, privacy would be built into the lower layers as well, such as transport, network and data-link layers.

## Reuse don't Re-Invent

DECODE aims to be built upon the solid foundations of existing well proven software wherever appropriate. For example we build "DECODE OS" based on the well known and solid Debian OS.

## Decentralisation and federation

The current era in technology has seen a shift from large monolithic systems to distributed decentralised systems, this is to meet the requirements of system - scaling, resilience and fault tolerance but also provides for decentralised governance models. DECODE builds upon decentralised models for data and identity management, this is a fundamental architectural principle within DECODE.

## Privacy by design


```comment
Priya

  The below texts are (mostly) verbatim from the deliverable:
  * [@D1.2]

  Additional sources already added to the bibliography:
  * [@PrivacyDesignPattersHoepman2014]
  * [@PrivacyDeisngStrategiesColesky16]

  Suggestions for completeness:
  * https://www.decodeproject.eu/blog/privacy-design-requirements-decode
  * (GDPR)

```

DECODE aims to develop a privacy preserving data distribution platform to foster commons-based sharing economy models, where citizens own and control their data. This asks for a privacy by design- based approach, for which the concept of privacy design strategies have recently been developed.[@D1.2]

The General Data Protection Regulation (GDPR), as well as other data protection or privacy protection laws and regulations, define data protection in legal terms. These terms are soft, open to interpretation, and highly dependent on context. Because of this inherent vagueness, engineers find such legal requirements hard to understand and interpret.
The GDPR also mandates privacy by design, without describing clearly what this means exactly, let alone giving concrete guidelines on how to go about implementing privacy by design when actually designing a system. Intuitively, privacy design means addressing privacy concerns throughout the system development lifecycle, from the conception of a system, through its design and implementation, proceeding through its deployment all the way to the decommissioning of the system many years later. In terms of software engineering, privacy is a quality attribute, like security, or performance. To make privacy by design concrete, the soft legal norms need to be translated into more concrete design requirements that engineers understand. This is achieved using privacy design strategies.

Software can however enable or hinder an organisation in achieving GDPR compliance
As DECODE is designed with privacy in mind from the ground up it naturally affords a good foundation
DECODE will provide transparency for **participants** about exactly where their data is and with whom it has been shared which will also enable GDPR compliance
Further, many of the privacy by design principles will correlate with needs of GDPR compliance, for example right to be forgotten.

### Privacy Design Strategies

As described in [@PrivacyDeisngStrategiesColesky16] a privacy design strategy specifies a distinct architectural goal in privacy by design to achieve a certain level of privacy protection. It is noted that this is different from what is understood to be an architectural strategy within the software engineering domain. Instead our strategies can be seen as goals of the privacy protection quality attribute (where a quality attribute is a term from software engineering describing non-functional requirements like performance, security, and also privacy).
In the description of privacy design strategies we frequently refer to processing of personal data.
Engineers should be aware that the legal concept of processing is broader than what a typical engineer understands processing to mean.
In what follows we use the legal interpretation of processing, which includes creating, collecting, storing, sharing and deleting personal data.

The eight PbD principles proposed for DECODE are:

@. _Minimise_: Limit the processing of personal data as much as possible.

@. _Separate_: Prevent correlation of personal data by separating the processing logically or physically.

@. _Abstract_: Limit as much as possible the amount of detail of personal data being processed.

@. _Hide_: protect personal data, or make them unlinkable or unobservable. Prevent personal data becoming public. Prevent exposure of personal data by restricting access, or hiding its very existence.

@. _Inform_: provide data subjects with adequate information about which personal data is processed, how it is processed, and for what purpose.

@. _Control_: provide data subjects mechanisms to control the processing of their personal data.

@. _Enforce_: commit to a privacy friendly way of processing personal data, and enforce this.

@. _Demonstrate_: provide evidence that you process personal data in a privacy friendly way.

```comment
   **Very** brief refinement of the conclusion of [@D1.2] below.  
```

DECODE supports user-defined smart rules that encode the 'business' logic of specific applications.
To support privacy-friendly contracts, DECODE offers mechanisms for verifiers to check validity of smart contracts without having to learn private/confidential state within the contracts.
In order to achieve this in a secure and private system, DECODE uses the advantages of blockchain-supported secure multiparty computation.

## User friendliness

Building **user-friendly** tools and applications for end-users, and app developers for **easy adoption** is a core principle for DECODE. Using an outside in lean approach, where requirements from users' are researched and analysed, and prototypes are tested on target community groups will allow DECODE to develop open, interactive and user friendly interfaces.

```
 - **Openness** of the platform, to enable innovation and citizen participation.
 - **Flexibility** through smart rules, driven by the needs of the usecases.
 - **Transparency** and **auditability** of collective action and choice, privacy of individual actions.
 - **High-integrity**, appropriate **privacy** options, and **availability** against disruption and suppression.
 - **User-friendliness** for end-users, and app developers for **easy adoption**.
 - **Scalability** and **deployability** to compete with corporate and closed platforms.
```
