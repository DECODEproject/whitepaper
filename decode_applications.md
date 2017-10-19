# DECODE Applications

## What is a DECODE application?

A DECODE application is application capable of interacting with the DECODE nodes, constituting the main endpoint for human interaction with DECODE.

DECODE will test and evaluate four pilot/trials in Amsterdam and Barcelona following a lean and agile methodology. 

DECODE use-cases to be evaluated with pilots:

- **Open democracy**: this use case builds on the D-CENT project, which developed decentralised democracy applications used by thousands of citizens across Europe. It demonstrated how viable distributed systems can foster the next generation of democracy tools and open policy making. DECODE's Barcelona pilot will go a step beyond by making data available and easily accessible by citizens, fostering informed collective decision-making.
- **Data aggregation dashboard** : Providing access to crowdsourced information about the city to foster informed and deliberative decision-making.
- **Collaborative economy / Hospitality** : Providing a new model where the data platform is the new middleman. The data is the raw resource through which value is created, enabling businesses to offer better and better services, which in turn generates more accurate data in a closed ecosystem.
- **Participatory citizen sensing / IoT**: T Facilitates an open, secure and privacy-aware market place of distributed, wireless  sensors and actuators in which every citizen can participate, fostering a smart, IoT enabled city from the ground up. The pilot facilitates an open, secure and privacy-aware ecosystem of distributed, wireless sensors and actuators in which every citizen can participate, fostering an IOT enabled city from the ground up.

## Application Ecosystem


### Application operators

 is transparent to a known and registered organisation that a participant can discover and make a choice about wether to interact with or provide data to. For example an app mayb be operated by a company which will be required to be registered in the civic records for a city / country and a link made between the app, the operator and such records. In the uk there is the example of Companies house which can be accessed via a URL, for eg https://beta.companieshouse.gov.uk/company/04091535.


## Example - Participatory Democracy through Petitions

In this example a City Authority would like to allow Citizens to participate more directly in decision making. One way to do this is to provide support for Citizens to support proposed initiatives through signing a petition. This example of course can be generalised to any context in which a group of people wish to create a petition and is closely related to an example where participants vote between choices, either as a Poll or a vote. 

It is important to note that actual Legal voting is somewhat beyond the scope of DECODE at this stage as it requires many more legal constraints, however it can be seen as a step in that direction that exemplifies the use of cryptography and ledgers.

There are several important invariants for this system:

1. It should not be possible for any entity to be able to connect the real world identity of a signatory of the petition to their signature
- Any entity should be able to cryptographically verify the results of the petition (how many signatories there were)
- It should not be possible for a participant to sign the petition twice, or should be possible to identify that two signatures are from the same account 
- A signatory must demonstrate cryptographic evidence that they are a legal resident of the city
- It must be possible for a signatory to withdraw their support
- It should be possible to gather demographic information (e.g. Age group) about the signatories in a privacy preserving manner and only with their consent and awareness 
- The petition mechanism should be decentralised to avoid interference or subversion by any single entity

The foundation for implementing this scenario in DECODE is that of Attribute Based Credentials (ABC). As we have described previously, this mechanism allows that a participant can obtain a credential issued by the city authority and cryptographically linked to the participants private key, but *without the participant being required to share their private key with the council*. This means that whilst the citizen must engage with the authority in an exchange in order to obtain the credential, the council has no contact with the *account* of the participant and so cannot later link the real world identity to the signature satisfying (1).

It is also possible when issuing the credential to provide a unique token that can be used to satisfy (3). 

The integrity and tamper resistence is provided by utilising a distributed ledger to verify the results. The application of zero knowledge proofs provides us with a mechanism to ensure that we do not need to store the credentials themselves (private data) on the ledger. 

The core *petition mechanism* is an example of a "distributed application" this is in DECODE terms a more tightly defined notion than for example in Ethereum. In DECODE it is a "distributes application with levels of guarantee about privacy by design built in".

The core of the implementation of the petition in DECODE is the Smart Rules which describe the logic of the *contract* that implements the invariants above.

The execution of these smart rules are as described previously made of two cryptographically bound parts, the *contract* and the *verifier*. The contract will execute in the wallet and will cryptographically access the credential, confirm that this user has not voted twice and that the credential is indeed provided by the relevant city authority (it is cryptographically linked to a well known and trusted public key of the city). And if all the invariants are met, will construct a proof which can be stored on the ledger, linked to the contract instance (the particular petition the participant is signing) to which it belongs. At this stage it increments a counter in the contract to indicate the number of votes.

This proof is the "signature" of the participant. Given that the ledger has the list of proofs, it is now possible for anyone to be able to cryptographically verify that those proofs were infact generated by someone in possession of the credentials indicating their residency, and that they have executed the invariants in the contract which prevent them from voting twice (2, 3).

We can also extend the contract such that at the same time as incrementing a counter for the number of signatures, we also increment various counters for aggregate statistics, for example age range. Because the *contract* is executed within the control of the participant (inside their wallet), they choose wether or not to provide this data. Depending on the circumstances, it may or may not be mandatory to also increment the age range counter. In any case, this needs to be clearly communicated to the participant during the process of signing (as discussed in the user experience section of wallets). Another important privacy by design principle here is that only the information required is transmitted. For example an alternate implementation would be to send (or worse record) the participant's data of birth to be used to calculate the age range.

By employing the combination of ABC, a privacy preserving ledger (does not contain any private data) and zero knowledge proofs, DECODE is able to satisfy the key invariants outlined and provide a robust and proovable engine that will give authority to any petition that is recorded, robust enough to meet the stringent demands of a city authority engaged in participatory democracy. As noted, to be able to conduct a formal legal *vote* is beyond this scope as it requires considerably more controls around physical voting devices for example, however, its possible to see that with the application of hardware described previously DECODE takes a step in that direction.

Signing petitions or voting is not limited to participatory democracy. It is infact a very common activity amongst any group and will have wide ranging utility to community movements and organisations. For example Unicef have successfully developed a community project called [Ureport](https://ureport.in/) which does exactly this and enables communities to have a voice.

## Example - IOT entitlements

- Contributing IOT data from my devices
- Include use of device up to add ontology data
- Options for securing access (including just securing access to the stream via ABC)
- Still a topic of research and evolution

## Example - Peer verified credentials

Would allow access control to private groups of people where membership of the group is granted by peer support

- the P2P issuer scenario 
- A group of people together form a "decentralised Issuer"
- Research topic 
- A simple model would be to nominate "administrators"
- Isnt this just a contract implementation that can generate a credential if x number of signatories who also have the credential support the candidate?

## Example - Data commons?

Should we come up with something here or leave it till a next iteration of WP?


```comment
TODO: description of 1-2 use cases once the first pilot in Amsterdam and Barcelona are selected, e.g. collaborative economy/hospitality (FairBnB) and participatory citizen sensing (Things Network, Fitbit)*
```

3 exemplar use cases / demo apps:

- A) Citizen Sensing - Air quality for a location
- B) Asset sharing / renting (TBD, equivalent of FairBnB)
- C) Complex privacy (TBD, either in terms of participants or varying based on context)