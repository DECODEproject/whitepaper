# DUMP
#

![Distribution of bitcoin hash rate by miners - Oct 2017](img/bitcoin-pools-oct-2017.png "Distribution of bitcoin hash rate by miners - Oct 2017"){height=300px}


The document will evolve over time and will be published regularly as a versioned series.

| Version                        | Date Published            |
| ------------------------------ | ------------------------- |
| EA-SNAPSHOT | (Targeted Oct 31 2017)    |



Don't think we should include this part until we are closer to implementation but the structure in (loosely) BNF (https://tools.ietf.org/html/rfc4234, https://www.w3.org/Notation.html)  for attributes is as follows:

```
/*
1# means 1 or more items in a repeating list, separated by commas
1* means one or more repetitions of the following symbol
*/

ATTRIBUTE = (SUBJECT PREDICATE OBJECT PROVENANCE SCOPE)

SUBJECT = decode_account
PREDICATE = 1#ontology_url
OBJECT = 1*string
PROVENANCE = (source *verification)
SCOPE = entitlement_policy

ontology_url: A deep link to a particular ontology reference, e.g. http://xmlns.com/foaf/spec/#term_Person
string: In a formal definition would be made up of valid characters, omitted here

source: a link back to the DECODE application that originated the attribute

verification: a link to zero or more (making it optional) cryptographic verifications of the attribute, for e.g. an attribute based credential representing residency of "Paris". Note: the ABC that is linked to may also be used by other attributes.

entitlement_policy: A link to an entitlement policy
```

```comment
Thought - theres a whole part of the proposal around "standards" etc - what if the above formed some form of RFC to define privacy aware attributes? We could at least write it as an RFC and submit it to see what people thought, DECODE would be a reference implementation.
```
```
locality:["decode-account:543232", <- SUBJECT   
	    "schema:addressLocality",     <- PREDICATE
            "Paris",                      <- OBJECT
            ["application:23234",         <- source        /           
             "verification:67565"]        <- verification  \PROVENANCE
            "entitlement:8678756"         <- SCOPE
           ]
    ^                
    |               
ATTRIBUTE          

```

application, verification and entitlement are also URNS, TBD how they resolve.


Take the example case of participatory democracy. It is possible to cryptographically demonstrate that a set of citizens signed their support for a particular initiative. This significantly increases the value of such an activity in the political world. A comparison would be with an online petition which has only email addresses recorded against it. Without cryptographic evidence there are several problems:

- No traceable evidence that these emails belong to the group of citizens involved
- "Leaking" of personal data (the emails) breaking privacy
- No demonstrable evidence that the person who actually controls an email was that who digitally signed the petition

DECODE proposes a scheme whereby not only can citizenship and accountability to an individual be demonstrated cryptographically, it can do so without requiring the proof to contain revealing personal details. This is achieved through the application of Zero Knowledge proofs and Attribute based Cryptography.

In this example, DECODE provides for a mechanism of declaring and controlling access to a person's data. We employ combinations of Attribute Based Cryptography and the ledger to record such declarations and provide system mechanisms to control the access. For example it may be that in within a community of individuals the members of the community wish to share data only with their peers. In a traditional setup this would be achieved using standard database and web server technologies. In DECODE we propose a scheme whereby access is provided through cryptographically verifiable credentials (Attribute Based Credentials) and varying levels of mechanism to protect such data, including Attribute Based Encryption. DECODE takes a decentralised approach to the issuing of these credentials, removing the need for a central authority.


# 2F Login procedure
The procedure for acessing the system will follow the next steps:

1. You sign in with your password.
2. You get a request from the validating node to plug in your hardware key and complete a challenge. The challenge could for example be to press a button, input a pin code supplying a specific biometric inherence factor.
3. You are logged into the system if said challenged is passed.

![U2F-diagram](img/U2F-diagram.png "U2F diagram")


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

DECODE uses Attribute based encryption (ABE) [Ref: Amit Sahai and Brent Waters. Fuzzy Identity-Based Encryption. In EUROCRYPT, volume 3494 of LNCS, pages 457-473. Springer, 2005.] which determines decryption ability based on a user's attributes. ABE uses zero knowledge proofs to securely verify attributes. Combining ABE with data entitlements with a blockchain based store for transactional data, DECODE provides a new framework for data ownership and transfer.


*Put things here that you think are relevant, but that are not clear enough yet, or for which it is not clear where to place them*


DECODE aims to design and implement a free, open source, reliable and distributed architecture to run applications developed by third parties. The DECODE architecture is secure, distributed and privacy friendly as it will host different privacy sensitive applications in parallel.

The whitepaper is structured as follows. We first describe the functionality the architecture should implement, together with the main non-functional requirements. We then give a high-level description of the conceptual foundations that are brought together, before digging deeper and discussing the main components. We describe the function and responsibility of these and how they relate to each other. We then discuss what kind of applications can be built with DECODE and provide some examples.

```
 - **Openness** of the platform, to enable innovation and citizen participation.
 - **Flexibility** through smart rules, driven by the needs of the usecases.
 - **Transparency** and **auditability** of collective action and choice, privacy of individual actions.
 - **High-integrity**, appropriate **privacy** options, and **availability** against disruption and suppression.
 - **User-friendliness** for end-users, and app developers for **easy adoption**.
 - **Scalability** and **deployability** to compete with corporate and closed platforms.
```


DECODE supports smart rules that encode the 'business' logic of specific applications.
To support privacy-friendly contracts, DECODE offers mechanisms for verifiers to check validity of smart contracts without having to learn private/confidential state within the contracts.
In order to achieve this in a secure and private system, DECODE uses the advantages of blockchain-supported secure multiparty computation.

## Applications and scenarios

DECODE will test and evaluate four pilot/trials in Amsterdam and Barcelona following a lean and agile methodology. 

DECODE use-cases to be evaluated with pilots:

- **Open democracy**: this use case builds on the D-CENT project, which developed decentralised democracy applications used by thousands of citizens across Europe. It demonstrated how viable distributed systems can foster the next generation of democracy tools and open policy making. DECODE's Barcelona pilot will go a step beyond by making data available and easily accessible by citizens, fostering informed collective decision-making.
- **Data aggregation dashboard** : Providing access to crowdsourced information about the city to foster informed and deliberative decision-making.
- **Collaborative economy / Hospitality** : Providing a new model where the data platform is the new middleman. The data is the raw resource through which value is created, enabling businesses to offer better and better services, which in turn generates more accurate data in a closed ecosystem.
- **Participatory citizen sensing / IoT**: T Facilitates an open, secure and privacy-aware market place of distributed, wireless  sensors and actuators in which every citizen can participate, fostering a smart, IoT enabled city from the ground up. The pilot facilitates an open, secure and privacy-aware ecosystem of distributed, wireless sensors and actuators in which every citizen can participate, fostering an IOT enabled city from the ground up.


To facilitate these use-cases, the following section describes how DECODE can be used in certain real world example scenarios.



## P2P networking

- p2p
- Identity?
- Relationship to the ledger? 

## ABC

A core functionality of DECODE is **verification** of **claims** that an individual makes about themselves.
For example "I live at 123 Main Street" or "I am over the age of 18" or "I am a resident of Barcelona city".
These claims may be important in a particular application use case. For example if we have an application which allows residents of Paris to sign a petition, we might want to be able to verify that the **account** used to  is also a resident of Barcelona.
Furthermore, the application defines a secure and uniquely identifiable attribute, together with a smart rule that only allows a single vote for any particular ballot.
Through using DECODE, the attribute does not have to expose any real knowledge (for example a citizen ID number) but it must be possible to be checked for a particular value (number of votes cast).


## Provenance

Data in the DECODE core is stored as **attributes**. Attributes are **statements** of the form **\<subject> \<predicate> \<object>**. The subject represents the participant, the object represents the 'value' (data), and the predicate defines the type of the relation between the subject and the object.
In the predicate we encode the provenance. An example:

    <account> addressLocality 'Amsterdam'

The representation of \<account> in the system is possibly just a public key that I control the private key of; 'Amsterdam' is the value of the attribute, and 'addressLocality' is what the attribute represents.
What is interesting is the question: *who made this claim*?? Also, what does it mean, *addressLocality*? This is the information that you want to record together with with the attribute statement itself.
Typically, you encode the answers to both questions in the predicate clause. To start with the last question, what does 'addressLocality' mean, you solve that like this:

    <account> schema:addressLocality 'Amsterdam'

Where 'schema' is defined to mean http://schema.org/. The total predicate so becomes a urn (which in this case you can even click on for a html version) that defines this particular predicate: http://schema.org/addressLocality.

So far this is standard semantic web. It becomes more DECODE specific when we want talk **about the statement**, when we want to record who makes this claim, when we want be able to verify the statement, and possibly to validate the value.

To enable this functionality we add a fourth clause to the statement:

    <account> schema:addressLocality 'Amsterdam' <app_id:scope:verifier>

```comment
jimb: I think we might need to distinguishe more clearly between the conceptual model here and the actual implementation. there is a slight issue I think with talking about clauses and statements in that it sounds like I would expect to see this representation somewhere in the system. we may visualise it in the UI but it feels to me like this structure is more logical than implementation?

tomd: I use it to illustrate the concepts. It is actually implementation (like in triple stores), but not meant to be visualized as such.

```
At the very least the \<prov> clause holds an **application id**; the other parts of the clause are optional. The app_id is a unique id that represents an **application**, and is issued what that application registers (for the precise sense in which we use the word application, please see the glossary).


#### Provenance


All **claims** are made by an application. Without anything else, this application is the only entity that can access the data (applications always have access to their own data); default **scope** is 'application'. Another scope is 'world'; further scopes are entitlements based on (possibly unrelated) attributes (only people of Amsterdam can see that I live in Amsterdam). There is also a 'decode core' application hat does not play by these rules. This would be an application that allows participant to 'administer' their decode 'accounts' and data. Participants that control an \<account> can, through this application, always access (and delete, but not necessarily modify) the statements that have this \<account> as a subject.

The *verifier*, lastly, is a participant, operator or a group of these that can vouch for the statement in a precise and formal way. In the above case that could be the City of Amsterdam, for a formal and legal claim, or it could be 15 people of Amsterdam that form a quorum to vouch that I, illegal immigrant of Amsterdam *do* indeed live there (as is a requirement of gebied online, for instance).
The implementation, through digital signing and attribute based cryptography is described elsewhere. The 'verifier' field of the provenace clause holds enough information to verify that the claim is made by the verifier and not altered after signing.



## Attributed intor

*Participants* generate resources. Resources are either *public* or *restricted*. (Some data is personal data, other data is not. The architecture cannot and does not distinguish that at the architecture layer.) Restricted data is *encrypted*. All data is stored on a p2p, high availability, redundant data store.

The *publisher* of restricted data determines who has access to the data. To this end it attaches an *entitlement condition* to the restricted data. Participants wishing to obtain access to the data need to prove they possess the necessary *entitlement*. Entitlements can be *issued* to participants. Entitlements have a *lifetime*: they are not valid before and not valid after a certain time. Additional flexibility can be expressed through *smart contracts* that, given a set of inputs (consisting of attributes and entitlements but also other *context*, like the current location or the current time or date) yield another entitlement or generate additional data. Smart contracts are defined by *applications* and stored on a *distributed ledger*. Participants store their entitlements privately, insofar as they are not dynamically generated when needed.

A home owner wishing to allow his guests access to the local Wifi, for example, could create an entitlement `john-doe-house-wifi`, a smart contract saying "*if someone has an entitlement `renting-john-doe-house` and this entitlement is valid now, then output the entitlement `john-doe-house-wifi` valid for one hour*". Then if the owner rents out his house and issues the renter the entitlement `renting-john-doe-house`, access to the wifi is securely arranged automatically.



## Authentication



For the purposes of DECODE we define authentication as being the mechanism by which a participant gains access to the system in a controlled way such that only that participant can access and control the DECODE data associated with themselves.  
Password-less Authentication
A core goal of authentication for decode is that we should aim to have authentication without passwords.

Options for the implementation of this include:

-	one time codes sent to a device
-	Device OS security (e.g. fingerprint on a mobile phone or laptop)
-	Embedded authentication in the device, rely upon general OS security such as locking screen on a PC

We also make the observation that in general, security and privacy on the device is not the core purpose of DECODE - of much greater concern is privacy and control of data once it leaves the device and enters the network.

For example, if I gain access to a persons device (e.g. Laptop) there is already enough of a compromise in terms of being able to access all their non DECODE material that it is potentially not worth having a secondary control on the application itself.

This topic requires further investigation, threat modelling and discussion, however we will aim to attempt to only implement password protection as a last resort.

It is possible then for the **operator** to provide a "Login with DECODE" option whereby an integration between the wallet and the online service where the wallet provides a credentialisation to the application containing relevant information. For example it may involve the wallet passing a proof of residency credential to the application. 

Following the core privacy by design principles, only the information absolutely nescessary should be requested by
### Transparency and Integrity

Alongside controlling access to the data, decode will also ensure that access to data is **audited**. This is made possible by virtue of the fact that in order to interact with decode, a participant will need to be registered. In particular **operators** will need to be registered and have some level of authenticity - for example be traceable to a company registration (e.g. in UK companies house). This allows a far greater level of transparency to both the participants and regulatory authorities (e.g. city council) of what data is being shared where.

Alongside audit trails we also wish to make it clear to the participant exactly what entitlements they have granted in a simple manner. An example of work in this area is https://www.digitalcatapultcentre.org.uk/project/pd-receipt/ who are developing ideas around the user experience of how to represent entitlments a user has granted.



## P2P



https://github.com/subutai-io/p2p


https://github.com/peervpn/peervpn


https://github.com/Kuebler-IT/meshvpn/wiki/Tutorial


https://github.com/meshbird/meshbird

i2p

gnunet

cjdns






## Architecture Notes

###Values

These from Georges slide deck


###Components - What they are, what are their responsibilities

Data storage - in particular what do do with large volumes of streaming data, vs transactional data (e.g. I agree to lend someone my lawnmower for x times)

The Decode Stack - from Hardware -> OS -> Applications


### Structure of Applications

https://en.bitcoin.it/wiki/Stratum
https://en.bitcoin.it/wiki/Obelisk
https://en.bitcoin.it/wiki/Libbitcoin_Server

# QUESTIONS

*Put your questions or items for discussion here*

- Do we need to distinguish Hubs, OS and nodes? (The way I understand it is that the DECODE Hub is the physical thing that runs the DECODE OS, on top of which the DECODE Node is the main user-facing application that users use to manage their data and access to their data. Is this correct?)

- What is a "Node" - is it a hardware device that a participant owns or is it a server running on the internet?

- Recommendation systems (SOTA 5b) and privacy-preserving, discrimination aware data-mining (SOTA 6a): they are placed at the DECODE OS level in the proposal, but aren't these higher-level applications? Or is some kind of OS support necessary to achieve them?

- Do ALL interactions with decode need to go through the device?

- What about multiple people who are using the same device?

- Do people themselves need an "account" that is on the server side - perhaps like bitcoin based on a public key which is maintained within a HSM that they own? e.g. ubikey?

- Is there scope for interactions which might happen through a mobile device (e.g. IOS / Android) - perhaps a trust is constructed between the decode device and the mobile device? i.e. I could register my Iphone on the network?

- Is there a need to provide an "entitlement" to the metadata as well as the data itself ? In some cases privacy is compromised by the knowledge that the data exists.

- Do we need to make the distinction that citizens are both "data owners" and "data consumers"?

- Should we make it clear that the "data owner" should be the arbitrator who decides whether a piece of data is *public* or *restricted*?

Use of Distributed ledger technology

- What is the rationale that leads us to this conclusion - i.e. Based on a set of characteristics we are looking for, a distributed ledger fits

- What are the key constraints that might differ from either Bitcoin or Ethereum - i.e. Privacy, not everyone seeing the entire ledger?

Entitlements

- Internally at thingful we express entitlements very similar to AWS IAM Policies - The readme on this inspired project gives a very useful introduction -  https://github.com/ory/ladon#concepts (2-3 minutes read).

- I think entitlement expirations are a potential minefield if based on "wall clock" time especially in a distributed, possibly adverserial context. My first instinct is that we would need some oracle for time outwith of trusting the operating system and/or a singular NTP.


Note on identity: (Remarks added by Ula upong reading the white-paper on 19/07/2017 and focused on "voting petitions" use case, apologies if they are due to a misunderstanding from my part.)

- Speciffic specs for how the signed key by Identity Verificator will need to be provided (and can be a large hindering for DECODE adoption depending on the specs). The protocol must also stablish the way by which uniqueness of verification to **DECODE Identity**/individual is done.
- If a unique attribute is provided, then is there a way in which a DECODE app can decrypt the user Identity? In other words: How to avoid a "double vouting" schema with different **DCID** but at same time enable verification and uniqueness (for the voting case this is crucial). Case study:
	- Bob registers his disposable identity ID1 in DECODE.
	- For ID1, BOB verifies itself with Verification provider (VPr).
	- VPr signs BOB-ID1 public key with its private key, and signs via ABE with Bob unique feature (BUF) to ensure uniqueness.
	- BOB logs in DECODE with ID1 and does an action requiring Verification and uniqueness of user.
	- DECODE checks that ID1 key is signed by VPr.
	- Question: How does DECODE checks for vote unicity if BOB has two verified identities due to VPr breach?
		- Answer 1: If the key includes a BUF, then DECODE can check for unicity if it knows the BUF. But then DECODE can decipher Bob's identity (BUF is common to ID1 and ID2 and must be enough to identify Bob uniquely). Then zero-personal-identity DECODE knowledge is lost.
		- Answer 2: If the key des not include a BUF to identify uniquely a single person, multiple voting schemas can be envisaged, all the reliability of the system relies on VPr, which even if it is not breached, will know the relation of ID1 and ID2 to BOB. Hence his identity will be revealed.

```
jimb: Good question - I will also schedule this as a design conversation we need to have in the tech standups. I think that if decode provides a non identifiable  token to the claim authority then it works ok - i.e. the claim authority provides a uniqueness token but all it knows is a random hash so theres no way they can trace it back to the decode account(s) that they user has submitted. However, it is possible that if the uniqueness token is recorded with the vote, theres a way to map back to the identity of the person. Needs some more thought!
```

## Other Work

**Bitcoin Id (BTID)**

[https://github.com/bitid/bitid/blob/master/BIP_draft.md](https://github.com/bitid/bitid/blob/master/BIP_draft.md)

And 

[https://github.com/bitid/bitid/issues/6](https://github.com/bitid/bitid/issues/6)

# References

https://en.wikipedia.org/wiki/Affero_General_Public_License
