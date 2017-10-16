# Architectural Principles

DECODE is composed of both hardware and software components - each component will adhere to the core architectural principles described below. The underlying philosophy adopted is that of the Unix philosophy [@Raymond:2003:AUP:829549] following key principles of modularity, clarity, composition, separation, simplicity, parsimony, transparency, robustness, representation and least surprise.

## Free and Open source

All work produced by DECODE will be published as free and open source according to licenses approved by the Free Software Foundation Europe and emerging open hardware standards. The core execution environment of DECODE, i.e the DECODE OS is built on free and open source GNU/Linux and BSD software components. The **Openness** of the platform will enable innovation and citizen participation.

## Modularity and interoperability

Adopting the key unix principle of modularity (simple parts connected by clean interface), enables building independent components which can be reused and combined to form a flexible eco-system of software products. DECODE will develop a modular privacy-aware tools and libraries that integrate with the operating system backed by a state of the art blockchain infrastructure supporting smart-contracts and privacy protections.

DECODE would adopt a layered architecture, with components that build on top of each other. As opposed to building privacy aware applications solely in the application layer (layer 7) of the Operating System, privacy would be built into the lower layers as well, such as transport, network and data-link layers.

## Decentralisation and federation

The current era in technology has seen a shift from large monolithic systems to distributed decentralised systems, this is to meet the requirements of system - scaling, resilience and fault tolerance but also provides for decentralised governance models. DECODE builds upon decentralised models for data and identity management, this is a fundamental architectural principle within DECODE.

## Privacy by design

DECODE aims to develop a privacy preserving data distribution platform to foster commons-based sharing economy models, where citizens own and control their data. This asks for a privacy by design- based approach, for which the concept of privacy design strategies have recently been developed. [@D1.2]

DECODE adopts a privacy design strategy which specifies a distinct architectural goal in privacy by design to achieve a certain level of privacy protection.  This impacts the way personal data is processed, stored, and controlled.

The overarching strategies of

 - Minimising and limiting the use of personal data (minimise & abstract)
 - Preventing correlation of personal data by separating the processing logically or physically (separate)
 - Protecting personal data leaks (hide)
 - Informing users about how their data is processed and how to control their data (inform & control)
 - Enforcing data privacy by specifying a clear privacy policy (enforce)
 - Providing evidence that personal data is processed in a privacy preserving way (demonstrate)

## User friendliness

Building **user-friendly** tools and applications for end-users, and app developers for **easy adoption** is a core principle for DECODE. Using an outside in lean approach, where requirements from users’ are researched and analysed, and prototypes are tested on target community groups will allow DECODE to develop open, interactive and user friendly interfaces.

 - **Openness** of the platform, to enable innovation and citizen participation.
 - **Flexibility** through smart rules, driven by the needs of the usecases.
 - **Transparency** and **auditability** of collective action and choice, privacy of individual actions.
 - **High-integrity**, appropriate **privacy** options, and **availability** against disruption and suppression.
 - **User-friendliness** for end-users, and app developers for **easy adoption**.
 - **Scalability** and **deployability** to compete with corporate and closed platforms.

