# DECODE Applications

## What is a DECODE application?

A DECODE application is any software application capable of interacting with the DECODE nodes, constituting the main endpoint for human interaction with DECODE.

A DECODE application is composed of several parts:

- Systems external to DECODE such as websites, databases and mobile apps
- Smart rules created by the *application developer* and deployed to the DECODE network. These represent core contracts of the application
- A DECODE account cryptographically controlled by the *Operator* of the application which is linked to the application
- A *Profile* which declares which attributes an application requires and their related metadata

The systems which are external to DECODE will interact with DECODE via a Wallet that is connected to the account of the operator. This will provide the ability to deploy contracts and execute transactions.

As previously mentioned, applications will be able to query the ledger to obtain information about transactions (see section "Distributed Ledgers"). Although at time of writing this is still an evolving topic.

An important aspect of applications is that they should provide a high degree of transparency as to who *operates* them, what data they will require / generate and for what purpose. To this end, DECODE will require all applications to be registered in an *application register* which will provide references to evidence concerning the operator. For example, in the UK there is a public record of companies which can be referenced e.g. [https://beta.companieshouse.gov.uk/company/04091535](https://beta.companieshouse.gov.uk/company/04091535). 

DECODE will continue to explore and evolve the concepts around operators and their trust relationship with participants. Please refer to the [decode project website](https://decodeproject.eu/pilots) for the latest news on how DECODE is being applied and tested in the field.


The range of applications for DECODE is wide. In order to bring together the concepts in this whitepaper and illustrate how they work together in a more concrete way, we consider here several applications as illustrative examples of the way in which the various DECODE components interact to provide a service. 

These are:

- Participatory Democracy
- Participatory Citizen Sensing (IOT)
- Peer to peer verification of credentials
- Data commons and Open data



## Example - Participatory Democracy through Petitions

In this example a City Authority would like to allow Citizens to participate more directly in decision making. One way to do this is to provide support for Citizens to support proposed initiatives through signing a petition. This example of course can be generalised to any context in which a group of people wish to create a petition and is closely related to an example where participants vote between choices, either as a Poll or a vote. 

It is important to note that actual Legal voting is somewhat beyond the scope of DECODE at this stage as it requires many more legal constraints, however it can be seen as a step in that direction that exemplifies the use of cryptography and ledgers.

There are several important invariants for this system:

- It should not be possible for any entity to be able to connect the real world identity of a signatory of the petition to their signature
- Any entity should be able to cryptographically verify the results of the petition (how many signatories there were)
- It should not be possible for a participant to sign the petition twice, or should be possible to identify that two signatures are from the same account 
- A signatory must demonstrate cryptographic evidence that they are a legal resident of the city
- It must be possible for a signatory to withdraw their support
- It should be possible to gather demographic information (e.g. Age group) about the signatories in a privacy preserving manner and only with their consent and awareness 
- The petition mechanism should be decentralised to avoid interference or subversion by any single entity

The foundation for implementing this scenario in DECODE is that of Attribute Based Credentials (ABC). As we have described previously, this mechanism allows that a participant can obtain a credential issued by the city authority and cryptographically linked to the participants private key, but *without the participant being required to share their private key with the council*. This means that whilst the citizen must engage with the authority in an exchange in order to obtain the credential, the council has no contact with the *account* of the participant and so cannot later link the real world identity to the signature satisfying (1).

It is also possible when issuing the credential to provide a unique token that can be used to satisfy (3). 

The integrity and tamper resistance is provided by utilising a distributed ledger to verify the results. The application of zero knowledge proofs provides us with a mechanism to ensure that we do not need to store the credentials themselves (private data) on the ledger. 

The core *petition mechanism* is an example of a "distributed application" this is in DECODE terms a more tightly defined notion than for example in Ethereum. In DECODE it is a "distributed application with levels of guarantee about privacy by design built in".

The core of the implementation of the petition in DECODE is the Smart Rules which describe the logic of the *contract* that implements the invariants above.

The execution of these smart rules are as described previously made of two cryptographically bound parts, the *contract* and the *verifier*. The contract will execute in the wallet and will cryptographically access the credential, confirm that this user has not voted twice and that the credential is indeed provided by the relevant city authority (it is cryptographically linked to a well-known and trusted public key of the city). And if all the invariants are met, will construct a proof which can be stored on the ledger, linked to the contract instance (the particular petition the participant is signing) to which it belongs. At this stage it increments a counter in the contract to indicate the number of votes.

This proof is the "signature" of the participant. Given that the ledger has the list of proofs, it is now possible for anyone to be able to cryptographically verify that those proofs were in fact generated by someone in possession of the credentials indicating their residency, and that they have executed the invariants in the contract which prevent them from voting twice (2, 3).

We can also extend the contract such that at the same time as incrementing a counter for the number of signatures, we also increment various counters for aggregate statistics, for example age range. Because the *contract* is executed within the control of the participant (inside their wallet), they choose whether or not to provide this data. Depending on the circumstances, it may or may not be mandatory to also increment the age range counter. In any case, this needs to be clearly communicated to the participant during the process of signing (as discussed in the user experience section of wallets). Another important privacy by design principle here is that only the information required is transmitted. For example an alternate implementation would be to send (or worse record) the participant's data of birth to be used to calculate the age range.

By employing the combination of ABC, a privacy preserving ledger (does not contain any private data) and zero knowledge proofs, DECODE is able to satisfy the key invariants outlined and provide a robust and provable engine that will give authority to any petition that is recorded, robust enough to meet the stringent demands of a city authority engaged in participatory democracy. As noted, to be able to conduct a formal legal *vote* is beyond this scope as it requires considerably more controls around physical voting devices for example, however, its possible to see that with the application of hardware described previously DECODE takes a step in that direction.

Signing petitions or voting is not limited to participatory democracy. It is in fact a very common activity amongst any group and will have wide-ranging utility to community movements and organisations. For example UNICEF have successfully developed a community project called [Ureport](https://ureport.in/) which does exactly this and enables communities to have a voice.

## Example - Participatory Citizen Sensing (IOT Entitlements)

Noise pollution is an issue for a number of citizens living in particularly noisy areas, such as, large public squares where activities take place. In these areas there is higher than average participation in citizens setting up IoT devices that measure noise. In this example, an involved citizen is interested in the correlation between health data (sleep patterns) and the levels of noise pollution in the area.

It is important to note that this example, integrates entitlements across public and sensitive personal data. In this context, private, personal and sensitive personal data can be defined as follows

- Private Data: In information science, this refers to data that is considered private, but may not may not be related to a physical person.

- Personal Data: Any information related to a natural person or 'Data Subject', that can be used to directly or indirectly identify the person. 
[@GDPRglossary]

- Sensitive personal: Personal data consisting of information on the racial or ethnic origin of the data subject, political opinions, religious beliefs etc. [@GDPRglossary]

Several cities include IoT devices that measure pollution levels (including noise) and publish this data in an open an accessible format. [Sentilo](http://sentilo.io) is an example of an open source sensor and actuator platform designed to fit in the City architecture, in several cities such data is freely and openly accessible. 

Individual citizens regularly measure and gather data from wearable devices such as activity, sleep, blood pressure, and heart rate etc. Terrabytes of IoT data from personal wearable devices currently live in closed data silos which are not amenable to contributing to a Digital Commons dataset. Combining both private and public data in this context, can lead to new insights about citizens habits and correlations. DECODE provides a privacy aware solution to establishing this union of data sets, giving people the ability to control the visibility of their personal data.

Using DECODE to implement this scenario will use DECODE as a smart rule based data entitlements engine for IoT data streams. Within DECODE, a complete and normalised ontology for the IoT data will be provided by the IoT connector. This maps all data coming from external sensor devices to an ontology known to DECODE. With privacy in mind, a user's preferences on data sharing policies are captured and translated to a smart rule language. 

The smart rules enable setting data entitlements below (as a prototype)

- owner-only - the data is not discoverable or accessible and is essentially private.
- can-discover - the data is discoverable and will be made available for search. The data is not accessible.
- can-access - the data is accessible and by default discoverable.

To qualify the terms used above:
- discoverable - the existence of the data can be found.
- accessible - the value of the data can be viewed. For the data to be accessible it is of course discoverable.

Based on the user's preferences and the ontology of the IoT data being processed by DECODE, entitlements rules to access this data are added to the attributes on the data. DECODE stores three types of data in this scenario

- Meta-data about the devices connected to DECODE
- Entitlements store
- Transactional data on the ownership of the data
- Device registry (a registry of devices that are known to DECODE and interact with the system)

Within DECODE, this continues to be a topic of research and evolution. IoT data is currently both fragmented and siloed, with the application of user interfaces that easily and transperantly allow users to add/remove/change entitlements on their IoT data, DECODE will enable IoT data to be used to share IoT data in  privacy preserving way.

```
Priya: Jim, I'm not sure if we discussed the relevance of ABC in this pilot/example/scenario.
Options for securing access (including just securing access to the stream via ABC)
```

## Example - Peer to peer identity and reputation verification

There has been rapid growth in the sharing economy in the last decade. The presence of several large online platforms such as AirBnb and has enabled more people to engage in sharing resources available to them. A core driving factor in this fast growing economy is _trust_, and is one of the biggest concerns of using sharing economy platforms. 

Sharing economy companies are beginning to understand the importance of that trust. In a peer-to-peer marketplace, verifying user identity increases trust, and from there users begins to build their online reputations. Identity verification is currently implemented via thrid parties undertaking the process of conducting identity and background checks on the users of the platform. Concerns have been raised that the Verified ID model disrupts privacy. Criticism is also spread to the reliance on social networks, which opens up issues of surveillance, identity theft and fake identity use. This presents a use case for a peer to peer identity and reputation verification. In this example, DECODE is used as a decentralised platform that enables users to anonymously and securely verify the identity of other users in their community.

The core implementation of P2P verification in DECODE relies on a group of people acting as a decentralised Issuer within the context of ABC. 

* An unverfied user submits a 'claim' for an identity verification into the system, for example, this could be a claim that 'User X is a resident of block 10, nichonson street, Edinburgh'. 
* A smart contract is created for this claim, and this is submitted into DECODE.
* Existing verified users (or nominated administrators) are notified of this claim, and they can anonymously verify the claim. 
* When a consensus is reached on the results of the claim contract, the transaction is deemed complete and the user making the claim is then promoted to a verified user.
* The claimant is issued with attribute based credential certificate to denote that they are a verified user.


## Example - Data commons and Open data

The latests years have seen a rise of movements demanding transparency of data in general, and specially in the domain of public administrations. Citizens and companies are increasingly asking for datasets to be released in the form of Open Data, so they can be shared and reused. These datasets, however, usually provide a general broad picture but should be combined with other crowd-sourced pools of data and also with private data in order to fully leverage their potential.

DECODE in this sense can help, by providing a platform where an application to view public data and generate custom visualizations of it, in relation to each user's private information, can be developped. Also, it can help in providing a platform allowing a controlled crowd-sourcing of data, thus enabling the idea of Data Commons to go beyond the simple concept of Open Data. The earlier examples of IoT entitlements or of a petition system that allows to disclose general information about the voters are two concrete examples of this.

A detailed example could be a dashboard that mixes public data sources as well as crowd-sources one. There, each user can generate visualizations that put their profiles in contrast with the general "public trends", thus obtaining unique information of their private information in a controlled way (which would be loaded on the client side). The configuration of each dashboard could be shared with peers so each person gets their own vision, and even the private data in it could also selectively be shared with the proper entitlements. Such an application would on the one hand effectively use a mix of public, private and crowd-sourced data for the common good, and on the other hand exemplify and induce the need to users to "donate" their data to generate Data Commons that allow to tackle societal problems such as pollution, citizen concerns, etc...

```
(Ula) Tried to answer the questions:

- Can we take the barcelona dashboard and make it generic, in particular to what purpose would we want to do this?
- Discuss people choosing to allow their data to contribute to a data commons
- Describe how a DECODE application could take data from DECODE and mash it with an open dataset, providing a trail of authenticity 

```
