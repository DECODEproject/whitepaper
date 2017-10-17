# Outline

This documents describes the design of the DECODE ([https://decodeproject.eu/](https://decodeproject.eu/)) architecture. The document will evolve over time and will be published regularly as a versioned series.

| Version                        | Date Published            |
| ------------------------------ | ------------------------- |
| EA-SNAPSHOT | (Targeted Oct 31 2017)    |


The whitepaper is structured as follows. We first describe the functionality the architecture should implement, together with the main non-functional requirements. We then give a high-level description of the conceptual foundations that are brought together, before digging deeper and discussing the main components. We describe the function and responsibility of these and how they relate to each other. We then discuss what kind of applications can be built with DECODE and provide some examples.


# Introduction to DECODE

## What is DECODE and why is it important?

DECODE is a transdisciplinary effort involving different fields in technology, legal, business, and social sciences to provide digital tools for managing data online. The main premise of DECODE is to provide value for the  data subjects and citizens themselves rather than the service provider only. The current model relies on service providers collecting citizens' data in exchange for services. Given the high value of this data to the service provider, a vast number of them appropriate data to create value without providing people with comparable compensation.

DECODE aims to design and implement a free, open source, reliable and distributed architecture to run applications developed by third parties. The DECODE architecture is secure, distributed and privacy friendly as it will host different privacy sensitive applications in parallel.

DECODE  focuses  research  and  development  effort  on  novel  notions  of  trust  and  privacy that  can  be  operationalised  in  new  governance  frameworks,  and  innovative  economic  models  based  on  digital  commons.  Entitlements attached to the private data would be searchable in the public domain but will grant access only to  those  parties  that  have  the  entitlement  to  access  it.  This  novel  concept  of  data  rights  and  entitlements  also  applies to data being sent to or consumed by connected IoT objects in order to perform actions on the real world,  allowing citizens to manage and control their devices and the data they generate. [@DECODEProject]

![Open Data commons](img/entitlements-data.png "Open Data commons"){width=300}

In its most granular format, the entitlements on data should enable users to choose who they share their data with and what data is being shared with the recipient. The aim of DECODE is to provide blockchain-based tools to give people better control of their data on the internet. The project will then create free and open data commons into which people can share their data in a secure and anonymous way. This will mean that all of society can benefit from the insights that can be gained from data. The project will develop and test a distributed, privacy aware, and trusted technology architecture for decentralised data governance and identity management. [Ref: D6.1 Dissemination Strategy and Communication Plan]

DECODE is an evolution of the concept of [decentralised systems](section-link) which leverages state of the art cryptographic techniques such as [Distributed Ledgers](section-link) and [Attribute Based Credentials](section-link) to build a system that provides its [participants](glossary-link) the capability to store data securely, give control and transparency over with whom and for what purpose data is shared and transact with other participants or  organisations.

DECODE aims to design and implement a free and open source, reliable and distributed architecture to run applications developed by third parties.

The DECODE architecture must be secure, distributed and privacy
friendly as it will host different privacy sensitive applications in
parallel.


### DECODE is made of:

- a set of specifications for distributed ledgers to support decode
- a free and open source reference implementation of a distributed ledger
- a smart rule language that can be translated and graphically represented
- a GNU/Linux based operating system that can execute signed smart rule applications
- the documentation needed for operators to write and deploy smart rules that request access to private data
- an intuitive graphical interface for participants to allow smart rules to access their private data
- an ontology of attributes for private data that is aggregated by operators
- an attribute based cryptographic implementation that can grant access to data


### DECODE main goals are:

- allow *participants* to manage access to their *private data*, by granting and revoke access to parts
- allow *operators* to write *smart rules* sign them and get the authorisation to run them on DECODE
- allow *smart rules* to access *private data* based on *entitlements* and matched *attributes*
- allow everyone to record *entitlements* on a *distributed ledger* whose integrity is resilient and verifiable

```comment
TODO: description of 1-2 use cases once the first pilot in Amsterdam and Barcelona are selected, e.g. collaborative economy/hospitality (FairBnB) and participatory citizen sensing (Things Network, Fitbit)*
```

3 exemplar use cases / demo apps:

- A) Citizen Sensing - Air quality for a location
- B) Asset sharing / renting (TBD, equivalent of FairBnB)
- C) Complex privacy (TBD, either in terms of participants or varying based on context)

## History and current state of the art

Decentralised technology ecosystems have been around for decades, and more recently there has been an explosion of decentralised platforms powering the rise of cryptocurrencies. In 2008-09, Satoshi Nakamoto implemented the first decentralized currency combining advancements in public key cryptography with a consensus algorithm widely known as "proof of work." This was a breakthrough in building a completely decentralised ecosystem that was centered around the transfer of ‘assets’ from one individual to another. Since then, there have been several advancements in using blockchain for creating both fungible and non-fungible assets.

Ethereum [Ref: https://github.com/ethereum/wiki/wiki/White-Paper#history] provides a blockchain implementation that can be used to encode arbitrary state transitions, enabling it to be used as a decentralised ‘back-end’ for applications. Ethereum operates as a programmable blockchain. Rather than give users a set of pre-defined operations (e.g. bitcoin transactions), Ethereum allows users to create their own operations of any complexity they wish. The public ledger of Ethereum and the computing capacity it provides is referred to as the Ethereum Virtual Machine (“EVM”), which can execute code of arbitrary algorithmic complexity.


Monax (previously known as Eris) is an open platform for developers to build, ship, and run blockchain-based applications for business ecosystems. It’s client is agnostic to the underlying blockchain technology. Public ledgers such as Ethereum are both anonymous and permissionless systems, i.e any user can run validating nodes, and the inherent nature of the cryptography that is the basis for mining determines that an attacker would need to control more than 50% of the network. The decentralised and distributed nature of the blockchain forms the basis of its trust model.


Identity on the internet has evolved from being implemented as centralised silos to federated identity models. Federated identity enables, single sign on available across several large service provider platforms. Service providers continue to be data controllers, in both centralised and federated models. Sovrin [@Sovrin] is a blockchain based identity platform, providing the user control, security, and portability.


DECODE uses Attribute based encryption (ABE) [Ref: Amit Sahai and Brent Waters. Fuzzy Identity-Based Encryption. In EUROCRYPT, volume 3494 of LNCS, pages 457–473. Springer, 2005.] which determines decryption ability based on a user’s attributes. ABE uses zero knowledge proofs to securely verify attributes. Combining ABE with data entitlements with a blockchain based store for transactional data, DECODE provides a new framework for data ownership and transfer.


```
Bitcoin -> Ethereum
        -> Private implementations -> Alternatives to Proof of work
                                   -> Permissioned -> Hyperledger -> Monax Burrow
                                                                  -> IBM Fabric
                                                                  -> R3 Corda

Models Of execution:

Execute transactions vs Verification

Privacy

Scalability

```
