# DECODE Glossary

##### Account
An account is the software construct within decode that provides control of attributes and represents either the Participant, Operator or Attribute verifier in any decode transaction. The account will ultimately relate to some cryptographic construct such as private / public key pair. Attributes will be related to and controlled by an account. An account will be able to submit transactions to the ledger.

#### Attribute
All data which is in DECODE are attributes. All attributes have the potential to demonstrate Provenance.

<!--
Conversation about whether all data relates to. "Attributes about a participant" - simple answer is "yes" - could be an interesting discussion about. 
-->

#### Attribute provenance
Meta-data related to an attribute that relates it to an ontology. All attributes must specify a link to an ontology. We may also consider optionally adding other meta-data to attributes that for example describes the source of the attribute data.

#### Attribute Provenance Verification
A cryptographic demonstration of the validity of the provenance of an attribute. A key property of provenance is that it should be possible to demonstrate provenance without revealing any connection back to the decode account and hence all the other attributes related to it, thus preserving privacy of the participant. The assumed mechanism for this is via some implementation of Zero Knowledge Proofs. All provenance verification must be cryptographically relatable back to an account within DECODE.

#### Attribute vault
Process running in the DECODE OS. Allows to control access to the attribute data.

#### Attribute verifier
An entity which has the credentials / authority to verify the provenance of an attribute. The expression of this verification will be through cryptographic form which will then be associated with the attribute owned by a participant. e.g. Participant Alice has the attribute "resident of city X" which is related to some cryptographic evidence that this claim is true, traceable back to some authoritative source of city X. An attribute verifier will require an account in order to be able to create this verification. The entity who is the attribute verifier may act also act as an operator at the same time. Further, attribute verification and the subsequent use of that verification may happen within the same application. The authenticity of the verifier may itself be verified by its own attributes.

#### Attribute Verification
Synonym: Attribute Provenance Verification

#### Blockchain
A type of distributed ledger that records transactions in a sequence of "blocks"

#### Operator
Organisation or individual who is responsible for the build, deployment and operation of an application. Operators may also own and control attributes via an account within decode. Operators may also create new attributes that are then associated with participants. The minimum requirements of eligibility for an operator to deploy an application to the decode platform require further discussion as the platform evolves. Taking into account a general desire for greater transparency to the participant of the organisations with whom they are interacting and sharing data.

#### DECODE Architecture
The internal architecture of DECODE, node anatomy, communications between nodes, components that are used to build DECODE.

#### DECODE Ecosystem
The environment in which DECODE operates, involving other systems, pilots, organisations, open source communities. We can consider various specific ecosystems for example the "Sharing economy" ecosystem which may have different characteristics.

#### DECODE Platform
Software with a high degree of privacy by design that provides the core functionality of DECODE. For example, DECODE OS, Distributed Ledger, device metadata. [@D4.2] [@D1.1]

#### DECODE Application
A DECODE application is a domain specific software application which will leverage the DECODE platform. Some part of this application may be a website and it is anticipated that some element of the application will involve definition and deployment of Smart Rules, Profile definitions and Ontology meta data.


#### DECODE SDK
The SDK is a development kit for modules developed and distributed by other consortium partners. It can be used to build, test and profile individual software applications on top of the DECODE OS, both locally and remotely on the continous integration infrastructure. [@D4.1]

#### DECODE Node
Controlled execution environment where the DECODE Hub runs. Decentralized transactions will be continuously being carried by the NODE.
[@D4.3]

#### DECODE Hub
The DECODE Hub is the hardware component of the DECODE architecture. The Hub is any device on which the DECODE OS is installed. It provides connectivity to IoT devices, connects to other DECODE nodes and supports the DECODE OS. As any other component of the DECODE architecture, the Hub needs to follow the values of openness, security, scalability, deployability and flexibility. [@D4.3]

#### DECODE OS
The DECODE OS is the base operating system running all software designed, developed and deployed for the DECODE project [@D4.4]. The DECODE OS is a blend of Devuan OS, with DECODE specific packages included within it.

#### DECODE Core
The DECODE Core is a process that acts as a co-ordinator for different components of DECODE (Application Smart Rule engines, IOT Connector, Attribute Vault, Ledger Connector).

#### Distributed Ledger
A consensus of replicated, shared, and synchronized digital data geographically spread across multiple sites, countries, or institutions. There is no central administrator or centralised data storage.

#### Entitlement
It describe which Participant's attribute can view or have access to another attribute.

#### IOT Connector
Previous Term: Device Hub. Maps IoT data coming from external sensor devices to an ontology known to DECODE.

#### Ledger Connector
Allows the processes part of DECODE Core to interface with the Distributed Ledger.

#### Ledger Node
This term is derived from the Bitcoin concept of a node. Bitcoin is a widely known cryptocurrency based on blockchain that organizes nodes in a peer-to-peer (P2P) network; any node can join and become part of the network. If a node receives new information, it broadcasts it to rest of the network. While all nodes listen to and broadcast information, only special nodes can append information to the blockchain. [@D3.1]

#### Metadata service
The metadata service is responsible for maintaining an index of discoverable data and their locations, displaying any data that is accessible, allow a user to make an entitlement request to access data that is not yet accessible.  [@D3.2]

#### Node Host
This refers to an (online) service provider hosting nodes on behalf of participants.

#### Ontology
In computer science and information science, an ontology is a formal naming and definition of the types, properties, and interrelationships of the entities that really or fundamentally exist for a particular domain of discourse. It is thus a practical application of philosophical ontology, with a taxonomy. Specifically in information science terminology, an ontology is a referenceable "schema" which describes the attribute. As raised, we need to be careful this does not become too restrictive. There is a wider discussion around this from the device hub work. While all attributes require a definition, registering changes to ontologies is an open process. Some governance / structure will be needed (to be discussed later). We will also need to consider evolution of ontologies over time.

#### Participant
An individual who digitally participates in the DECODE ecosystem. Participation occurs by interacting with an application. participants own and control attributes via their account.

#### Profile
Relates to the set of attributes which are required application to run. There are as many profiles as there are Applications. It is application specific as to whether the attributes need to be verified. A Profile may also declare attributes that it will generate and then be associated with an account, for example browsing behaviour, favorites, reccommendations.


#### Smart Contract
A computer protocol intended to facilitate, verify, or enforce the negotiation or performance of a contract.

#### Smart Rule engine
Process running in the DECODE OS. It is part of the Application and runs the Application Smart Rules.

#### Smart Rule
They are Application specific functions that take attributes (or objects) and create entitlements.

#### SSO (Single Sign On)
It is a property of access control of multiple related, yet independent, software systems. With this property, a user logs in with a single ID and password to gain access to a connected system or systems without using different usernames or passwords. 

#### Transaction
Transactions are the application of one or more valid procedures - according to type - to active input objects, and possibly some referenced objects, to create a number of new active output objects. [@1708.03778]
