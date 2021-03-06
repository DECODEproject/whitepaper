# Conceptual foundations

This section describes the foundational concepts that are combined to
achieve the purpose of DECODE.

DECODE is built upon several foundations:

- Decentralisation of trust
- A distributed ledger
- Zero knowledge proofs
- Attribute Based Cryptography
- Cryptographically verifiable entitlements
- A "Smart Rules" language to express governance of participants data
- A highly verifiable and controlled execution environment

A key concept behind DECODE is to build a system which aims towards a
model of *decentralised trust*. This means that as much as possible,
the control over the system should not be in the hands of a small
number of entities over whom the participants of the system have no
influence or recourse. For example, even though Bitcoin began life as
a model for decentralisation, the current state is that the hash power
is controlled by a few large mining pools. DECODE will seek to explore
alternative, decentralised models and economic incentives (See section
on Distributed Ledgers).

A distributed ledger with decentralised governance provides a public,
resilient, tamper-resistant and censorship resistant record which
allows any party to be able to verify some "fact" recorded within
it. This verification is demonstrable through the use of cryptography.

The public nature of the ledger is in tension with a desire to
maintain the privacy of the participants of the network. DECODE
applies the concept of Zero knowledge proofs to allow the
cryptographic proof of a transaction to be recorded in the ledger
without needing to publicly record the data within the transaction
itself.

In addition to the participant's transactional data, a key element of
privacy is to allow a strong control over data which is directly
related to *Identity*. In DECODE all data is represented as
Attributes. DECODE takes an approach to identity which states that
what a participant discloses about their identity should only be
related to the minimum transfer of information required for a
particular interaction. Further, this transfer of information should
occur through a privacy preserving mechanism.


The cryptographic implementation of this mechanism is Attribute Based
Credentials. This mechanism allows a participant to prove something
about themselves without transferring any other identifying
information to the *relying party* (The entity that requires
proof). Underlying this selective disclosure mechanism is often a Zero
knowledge protocol to allow for multi-show unlinkability. For example
a participant can cryptographically prove their residency of a
particular city without exposing sensitive information such as data of
birth, national Id number, or the actual address. This mechanism can
also be used to provide strong guarantees about authenticity of an
interaction whilst preserving a level of individual anonymity,
particularly relevant for scenarios of participatory democracy.


Building on its verifiable public record and privacy preserving
cryptography and design, DECODE adds a mechanism for participants to
declare and enforce agreements about how their data is
consumed. DECODE refers to this mechanism as the entitlements a
participant agrees to over their data. These entitlements are
cryptographically verifiable and can be extended to be
cryptographically enforceable through Attribute Based Encryption.

We can extend this data sharing capability to datasets for wide
sharing - for example we can consider individual contributions to an
aggregate dataset. This is often called the Digital Commons [@D1.8].

Based on the principle of User Friendliness, giving participants
access to a means to express and understand these entitlements is a
further aim of DECODE, which is expressed through the development of a
Smart Rules language and user interface.

Finally, DECODE considers the full technology stack within which all
of the above foundations executes. This includes the underlying
hardware platforms Hub and the Operating System on which the software
executes. DECODE terms this the *controlled execution environment* and
explores ways to provide assurance, transparency and reproducibility
of the execution environment.


Each of these conceptual building blocks are explored within the
following sections which should provide the basics required to
understand how the implementation functions. Each of the topics is a
deep area of study in its own right so we provide references to allow
further exploration.

A fundamental concept within DECODE is that *all* data is represented
by **attributes**, described below. This allows us to build a
conceptual model of how DECODE fulfils its purpose.

To describe how data (hereafter **attributes**) is produced and
consumed we first specify the entities and roles within the DECODE
*ecosystem*. That is, the set of systems, people and organisations
that in combination fulfil the purpose of DECODE.

*Real world entities* that play a defined role in the DECODE ecosystem
are:

- Individual citizens
- Organisations
    - Public authorities
    - Businesses
    - NGO and civic society organizations



Within DECODE we define several *roles* that these individuals or
organisations play within the ecosystem.

- Participant
- Operator
- Attribute Verifier
- Node Host

*Participants* represent the end consumers of DECODE - in this role an
entity is storing data and interacting with
*applications*. *Applications* are *operated* by *operators* who are
entities that code and maintain applications that run in the DECODE
ecosystem. *Attribute verifiers* are entities which have the ability
to *verify claims* associated with a particular *attribute*, and
provide cryptographic evidence of the claim. For example a public
authority can verify that a participant is a resident of a particular
city or country. *Node hosts* are members of the DECODE ecosystem who
operate the underlying infrastructure of the DECODE network. Most
commonly they will be hosting and running the nodes within the
network, but may also run specialised services such as meta data
services or online wallet services.

All interactions within DECODE are cryptographically linked back to an
*Account*. In its most basic form this can be thought of as a public /
private key pair. In effect the controller of an account will own a
private key and therefore there is some cryptographic evidence that
this control can be demonstrated. This is common to all distributed
ledger systems. As with these, it makes the security of the private
keys a prime concern.

*Applications* within DECODE are subject themselves to a high degree
of verification and transparency. All applications must be transparent
about what *attributes* they wish to access / manipulate for a
*Participant*. We refer to this set of attributes as a *Profile*.

A key concept to understand about DECODE is that attributes are
strongly linked to applications. This provides a level of control and
traceability over the system. It says that attributes can only be
"created" (or "captured") by applications and that there is a 1 to 1
relationship between attributes and applications. This means that
e.g. even if two applications both capture a First Name, in DECODE
these represent separate instances of attributes.

Creating a structured model around attributes provides a foundation
allows us to build higher level constructs such as *Smart Rules* and
*User Experience* which make it straightforward for *Application
Developers* to produce high integrity, privacy aware *Applications*
without needing access to highly specialised experts in the field of
cryptography. It allows *Participants* to have a highly transparent
view and control of their data also without the necessity to become
cryptographic and privacy experts themselves. A key principle of
DECODE is "User Friendliness" for both *Application developers* and
*participants*.

![Key conceptual terminology and relationships](img/terminology-relationships.png "Key conceptual terminology and relationships")

## Attributes

Data items alone provide little value, for example the string "Paris"
could mean many things to many people. In order to be able to make a
useful system that can process data, and in particular provide
additional value for the purpose of data privacy and integrity, DECODE
implements a conceptual model that attaches meta-data to an
attribute. This model allows us to make **claims** about
attributes. We begin with a basic structure of the form:

ATTRIBUTE = (SUBJECT PREDICATE OBJECT)

Where the SUBJECT is the entity to which the attribute relates (in
DECODE terms, the account), the PREDICATE describes the relationship
between the SUBJECT and the OBJECT and the OBJECT is the value of the
attribute.

Thus we might say (e.g. in JSON):

```
locality : ["decode-account:543232", "schema:addressLocality", "Paris"]
    ^                  ^                        ^                  ^
    |                  |                        |                  |
ATTRIBUTE           SUBJECT                 PREDICATE           OBJECT
```

where `schema` and `decode-account` are
[URNs](https://www.w3.org/TR/uri-clarification/#urn-namespaces). `schema`
expands to [https://schema.org/](https://schema.org/).


This already provides a lot of value. However DECODE adds two further
concepts to the model, PROVENANCE and SCOPE.

ATTRIBUTE = (SUBJECT PREDICATE OBJECT PROVENANCE SCOPE)


PROVENANCE provides traceable evidence to support the claim we are
making. This evidence currently consists of two parts, the source of
the attribute, by which we mean the application which captured it or
generated it, and optionally one or more verification elements which
are links to a cryptographic demonstration of that attribute. In our
example this would be an Attribute Based Credential issued by the city
authority of Paris associated with the private key of the account.

SCOPE relates to the agreement that is made between the application
and the owner of the attribute (usually the Participant), in terms of
entitlement. In DECODE terms, this is a link to an entitlement policy.

One element of attributes that is still under consideration and review
is the *lifespan* of an attribute, or the time frame within which it
exists. It is possible that attributes have an expiry and certain that
attributes are dynamic with respect to time. For example I may move
house and unavoidably become older with the passing of time. The
thinking so far in these areas tends towards representing data as
append only, immutable event streams. That is to say that you never
"overwrite" or "mutate" an attribute, only add a new instance that
represents the new value. The most common reference model to think
about this is your bank account, consisting of a set of debits and
credits. You can't go back and "undo" a withdrawal, but you can make a
compensating transaction and make a deposit of the same amount which
in real terms ends at the same outcome.


### Identity

Identity within DECODE inverts the current world position whereby
participants know little about the operators of the services they are
registered with but the services know everything about the identity of
the participants. "Vendor relationship management" so to speak; where
the vendors are DECODE-enabled applications.  In DECODE, the focus is
on strengthening the position of the participant in terms if
understanding exactly what organisations are operating applications
and what those applications are doing with the participants' data.

**Participants** The identity of the participants is irrelevant to the
DECODE system, and also to the applications that run in the DECODE
ecosystem. What is relevant are the attributes that are related to the
participants. We would go as far as to say that identity is a concept
not needed at all. In the real world we live and act in many different
contexts, these activities and the relations in those contexts each
define a perspective on who we "really" are. There is overlap, sure,
but there is no context in which **all** aspects of us are
relevant. So, what is our identity?

There are three options:

1. identity is what **we** think **we** are (i.e. self)
2. It is how the state defines us, typically through a number or code
   assigned at birth
3. It is the combination of all perspectives from all contexts
   combined

In the DECODE ecosystem we will keep the diverse and subtle ways of
addressing aspects of our lives and selves in different (online,
digital) contexts, and leverage the capacity of the medium to improve
upon this in a privacy enhancing fashion. When thinking of identity in
this ecosystem, option one, above, is irrelevant, and option three is
fine in an abstract way, but fraught with privacy issues when it would
be possible to address and use practically. That leaves the extremely
narrow definition of the government assigned civic number. Apart from
the issue that people exist without such numbers, this is just a
single attribute of a person, at best a strictly formal (or legal)
definition of identity, but missing out on just about everything we
are.

Better to avoid discussion and confusion and **not** to use the word
identity at all, and talk about different collections of attributes,
relevant in different (online, or even DECODE-supported offline)
contexts (or *applications*).

Let's call such a collection a **profile** for now.

In the end we are talking about physical people (AI's with civil
rights are a ways off), even when assigning attributes that are purely
abstract, or are transferable, these are about, or related to a
person. This person is represented in the DECODE ecosystem as a
profile, but **not uniquely**. One physical person will have control
of the data related to multiple **profile**. These may overlap (in the
values of certain attributes), or may not.

These profiles aren't entities in the DECODE system, they are a way of
talking about *application-defined* collections of
attributes. Profiles are the subject of **entitlements**, even when,
for instance, the only attribute needed for the online alcohol-buying
app is the age, that app would, in its use, **define** a profile with
an age, and nothing else at all. For the sake of argument we leave out
practicalities as payment, and the address to send the purchase to.

The connection to the real person in the real world is through a
DECODE account that the person will authenticate against in order to
interact with DECODE applications. This account is not part of the
DECODE data that these applications have anything to do with, although
the authentication app or apps (multiple means of authentication)
could be seen as a special kind of DECODE enabled applications.

Authentication usually involves a participant providing various
personally identifying facts to a system such as date of birth,
passport id / driving licence number, potentially with additional
offline checks and questions of the participant. For example in
signing up to the UK's [Gov.uk
Verify](https://www.gov.uk/government/publications/introducing-govuk-verify/introducing-govuk-verify)
you register with a federated identity provider (e.g. The Post
Office). The post office has a mobile app that can capture images of
your passport, OCR the details and confirm them against the HMPO (Her
Majesty's Passport office) and then takes a photo using the phone
camera in order to compare against the photo on the passport.

A participant demonstrates control of these **attributes** through
some cryptographic means (essentially by holding a private key). This
private key may be embedded on a physical device that the participant
owns, such as a
[Ubikey](https://www.yubico.com/products/yubikey-hardware/) or Smart
Card issued by a civic authority. In the case of a device issued by an
authority it may also contain attributes of interest to other DECODE
applications, such as the fact that one lives in a particular
city. These attributes, when stored, record the provenance and the
semantic meaning of the relation in their URN, and can so be
"officially verified" attributes that certain applications may require
(such as voting in participatory budgeting applications, see below).

Taking this approach to "identity", also has the benefit of following
a privacy by design principle of only providing the minimum set of
information that is absolutely required for a particular interaction.

### Attribute provenance

#### Accountability of systems

Of course digital systems cannot be held accountable in any legal
sense (yet), but we'll need to address the fact that consequences of
using digital and 'autonomous' systems are no longer as pre-cooked as
they once were.

No longer is it guaranteed that the mechanisms and processes though
which technology interacts with the world are clear and
understandable, even to the engineers who build the systems; the bias
in the training data is invisibly and irretrievably encoded in the
trained models.  This means that technology needs to be able to be
held accountable in itself, not only through the people running it or
the engineers building it.  In order to enable this, accountability
needs to be designed into the systems, needs to be part of the
systems, and thus, in a certain sense, systems need to be able to
reflect on their actions; at least in response to queries.

#### Data transparency

Taking stock of this *accountability design* challenge leads us to a
couple of preconditions to a possible solution or implementation. One
of the most important of these, especially in a DECODE context, is
**data transparency**. What type of data was used, where, when and for
what purpose was this data collected?  In a system for data management
(such as DECODE) the relevant metadata needs to be recorded and made
available when needed, either directly to the user in response to
queries, or to aggregation algorithms that produce data that itself
needs to be able to provide an account of its provenance. The
accountability mechanisms may not be part of DECODE, the data formats
needed to make them possible **are**.

In DECODE the provenance metadata is provided through the
*application*. When a participant stores some data in a DECODE-enabled
system, the participant **always** does this through an
*application*. Similarly, the application may generate data on behalf
of the participant and store it (or a link to it) through DECODE. The
data recorded or stored always has the relationship recorded that it
comes from this particular *application* (The **source**).


### Attribute verification with ABC

In order to provide a stronger assertion about the **provenance** of
attributes in DECODE, we incorporate the cryptographic mechanism of
Attribute Based Credentials (ABC)


> An attribute in this case is any indivisible piece of personal
> information that can be described by a bit-string, such as an
> identifier, a qualification or a property of an
> entity. [@alpar2015attribute]


> Informally, an Attribute-Based Credential (ABC) is a cryptographic
> container of attributes that can provide security assurances for all
> participants in the system. [@alpar2015attribute]


For example, when selling a bottle of wine, a vendor has to verify
that their customer is over the age of 18.  The customer shows their
credential; an identity card issued by the government, to convey the
information 'date of birth' to the shop owner, in order to prove that
they have the attribute 'being over the age of 18'.  ABCs provide a
cryptographic way to authenticate using selectively disclosed personal
attributes.  This means that in the above example, we can use an ABC
credential to convey just the property of 'being over the age of 18',
without revealing any of the other attributes in our credential, and
even without linking this event to previous interactions.

A different example, proves the usefulness when attempting to digitise
a membership system.

Classically, a library card allows a member to borrow a book.  This
credential reveals no more information about the borrower than their
membership of the library.  When building a digital library card
system, it is difficult to verify active membership without
cross-referencing the card with a list of authorised members.  ABCs
allow the showing of a membership credential, without having to check
the list of authorised members.  In addition it can provide multi-show
un-linkability of the credential showings, which prevents them from
leaking information about the specific member through logging of the
interactions.  There are three parties involved in the use of ABCs:
the *Issuer* of the credential, the user or *Owner* of the credential
(in DECODE terms, the *Participant*, and the party that wishes to
verify a credential (*Relying Party*).

![User requests a credential](img/abc-preparation.png "User requests a credential")


![User presents credential](img/abc-first-use.png "User presents credential")


The proposed model for ABCs in DECODE is based on Idemix
[@CamenischL01] [@IBM_Idemix], since the DECODE implementation
requires multiple verifications of non-identifying credentials to be
unlinkable.  A tested implementation of ABCs is
[IRMA](https://credentials.github.io) by the Privacy by [Design
Foundation](https://privacybydesign.foundation/en).  Credentials can
be part of a claim.

So how are claims actually verified in the first place?  In the
example, the entity responsible for verification would be the city of
Barcelona.  This could be a physical process, or could be done online
(as in the Dutch [DigiD](https://www.digid.nl/) mechanism), and
involves some exchange between the city and the individual.  The
result of this exchange would be a cryptographic token, signed by the
city, which, invoked with a specific smart rule would result in an
attribute with verified provenance and value being set in the DECODE
platform.  This whole process could take place through a website which
is run by the city of Barcelona (and thus is a DECODE enabled
application).  Required will be a mechanism by which the DECODE
network can **trust** the public key of the city of Barcelona,
i.e. there will need to be a registration protocol to establish this
trust.

ABCs could provide both the trust mechanism for externally verified
attributes, and the initial cryptographic tokens can be produced
through a process of proving (possibly in zero-knowledge) the control
of a credential.

The User Journey for this interaction would involve the person
authenticating this website and then creating a "city_of_residence:
Barcelona" credential signed with the city's private key.  In this
example there would be a validity time limit on the attribute, a
month, perhaps, within the credential. People move.  Because the
choice of using applications that accepts this credential is in the
hands of the participant they have strong control of how this link is
used.  In a P2P sharing application a different proof-of-residency
attribute may be good enough, for instance.

In order to make it straightforward for developers to build DECODE
applications, the mechanisms for interacting with and validating
external or "official" claims will be a core part of the language that
is used to express Smart Rules.

## Entitlements

We define two parties in any given data exchange, the **data owner**
and the **data consumer**. An **entitlement** is an agreement of
disclosure controlled by the **data owner**. A **data entitlement**
concerns the sharing of data. In DECODE an **entitlement** is defined
in a **policy** *and* implemented with the application of
cryptography.


### Entitlement policies

The DECODE architecture is inherently distributed and as such the
management of entitlement policies will need to respond to some well
understood challenges :

**Challenge of embedded decisions** The entitlement policy for a piece
of data would need to be consistent wherever that data is stored - the
data may be sharded or replicated or both.

**Challenge of lack of overview** Distributed entitlement policies
make it difficult to gather and understand policies governing the
data.

**Challenge of identity integration** A data entitlement system within
the context of a distributed system may need to interface with one of
many identity systems.

**Challenge of expression** A formal expression of an entitlement
policy should have a rich model of expression.

There are 4 key elements to an entitlement policy :

- What **attributes** are being shared
- With **whom** is the data owner sharing data
- For what **purpose**
- Under what **conditions** will the data consumer use the data
  (e.g. [https://opendatacommons.org/licenses/pddl/](https://opendatacommons.org/licenses/pddl/))
- What is the **timeframe** within which this entitlement is valid
  (Expiry date)
- How does the entitlement respond to changes to the value of the
  attribute

This last point is a subject of further research and exploration - how
should an entitlement be considered when the underlying attribute is
superseded. For example, if a participant provides a new address to
the application, does the entitlement automatically apply to the new
address? It may be possible to express such "rules" using the Smart
Rules language.

Rather than attempting to build a hierarchical entitlements system by
classifying certain attributes into privacy groups, such as
"sensitive, personal, public" DECODE specifies all entitlements at the
granularity of individual attributes.


DECODE defines three possible access levels:

| Access level | Description |
| --------------- | ------------------ |
| `owner-only` | Subject can see neither the existence of this attribute, or its value |
| `can-discover` | Subject can see that the data item has a value for this attribute, but not what it is |
| `can-access` | Subject can both see that the data item has a value and read that value |


In most cases, the participants in the system will not be creating the
entitlements directly, they will be interacting with DECODE
applications. These applications will have the ability to declare what
entitlements they require and the participants can agree to them, in
much the same way that users can accept authorisation grants using
OAuth.



### Implementation (access control)

Defining and declaring entitlements is a matter of describing access
rules. In order for these to be useful we require a mechanism to
enforce them. In a traditional system we would simply "trust" that the
system has been coded to take account of the entitlement declaration -
for example we might install an authorisation server product to define
and store entitlements and rely on the developers of the system to
code appropriate controls into the system that communicate with the
authorisation server.

DECODE moves towards a more decentralised model and ultimately will
explore ways in which both the data and the mechanisms of access
control can be decentralised, including the issuing and verification
of credentials.

An intermediate position which provides for low investment integration
to existing systems is to leverage the core foundations of a
distributed ledger and attribute credentials to improve on the more
"traditional" access control methods.

The following sections describe both of these scenarios, starting with
leveraging cryptographic credentials in a "standard" data access
scenario and then expanding on this to move towards a more
decentralised data storage and optimisation of encryption through
Attribute Based Encryption.

The possibility of having completely decentralised credential issuers
is currently a research topic and will be explored as the project
progresses. It is imagined that the first scenario will integrate with
the existing applications sooner.



#### Using ABC as an authorization mechanism

In this scenario, we leverage a "traditional" architecture whereby a
central entity stores data of many people and protects it by means of
access control implementations. DECODE allows for the possibility to
be integrated with such systems as the source of authorisation
information. By referring to entitlement policies stored within
DECODE, the application can then accept Attribute Based Credentials
presented by users and validate them against the policy, in order to
make an authorisation decision. This model allows for DECODE to be
easily integrated to existing systems whilst still providing state of
the art cryptographic security.

The implementation of this will be based around the [Json Web Token
(JWT)](https://tools.ietf.org/html/rfc7519) specification.

!['Data vault' access control](img/access-control-data-vault.png "'Data vault' access control")


#### Using ABE as an access control mechanism

Evolving the model towards a more decentralised approach, DECODE
proposes that data can be encrypted in order that it can be stored in
the open (for example on a massively distributed file sharing system
such as IPFS. A baseline implementation of this would be simply to
encrypt the data with the public key of every user who has the
entitlement. DECODE will explore the use of Attribute Based Encryption
(ABE) a state of the art cryptographic mechanism which is an evolving
topic but that has the potential to significantly reduce the overhead
of allowing groups of people cryptographic access to an encrypted data
source.

At a high level, it relates cryptographically an attribute that the
participants possess to the encryption of the data. In one way this
can be seen as each participant owning a key which is unique to them,
where the encrypted data can be decrypted by any of the keys. For
example a participant "Charlie" may want to share their monthly energy
usage with other members of their block of flats. Charlie can use ABE
to encrypt using the public key of the attribute "member of block of
flats" such that anyone else in the block can decrypt it. In this
model, DECODE enables the owner of the data to enforce the access
control as opposed to relying on a third party as in the previous
scenario.

ABE allows users to encode more complex access conditions. For example
you can encrypt a party invite only for your neighbours: ```( NOT
('being under the age of 18') AND 'being a resident of my block')```
The data can be encrypted in such a way that only individual agents
with those particular set of attributes in their wallet can decrypt
the message.

![Attribute based encryption](img/attribute-based-encryption.png "Attribute based encryption")

The main models for ABE come from previous work on 'Attribute-based
Encryption for Fine-grained Access Control of Encrypted Data'[@ABE]
and 'Ciphertext-Policy Attribute-Based Encryption'[@ABE_CP]. Reference
implementations are available, but at the time of writing none have
been selected to be supported by DECODE.

The design of DECODE will try to support this method of user
controlled access policies.


One of the complexities with ABE is the scheme by which keys are
issued. Many existing schemes rely on a central party to issue and
manage keys. DECODE will explore more decentralised models in this
space.

However, if the participants wished to broadcast their data to a
larger, but still restricted, set of users; this method of access
control will turn into a key-distribution problem; which is outside of
the scope of the main functionality of DECODE at this stage.


![Attribute based encryption access control](img/abe-with-abc.png "Attribute based encryption access control")



**Controlling access to large datasets or streams of data**

We require a mechanism for controlling access to either large datasets
or streams of data. Perhaps a participant wishes to publish a dataset
including all their movement data from their phone for the last two
months and yet control access to certain attributes.

This is also an ongoing research topic within DECODE.

Potential options are:

- Encrypt each data item in the list as above
- Separate the data into "columns" ie. each data attribute is becomes
  an array of values and these are then encrypted using ABE
- Investigate DRM tech for encrypting large streams (e.g. video). Can
  similar approaches be applied to user data?


## Distributed ledger

Within DECODE, the ledger provides for two characteristics, Integrity
and Availability. This is an important distinction within
DECODE. Privacy (or Confidentiality) is not a core function of the
ledger but is rather enabled by its features and design.

In combination with ABC and ABE, DECODE achieves privacy through the
core principle that *no private data must be stored on the
ledger*. Privacy is one of the classic issues faced by decentralised
systems (the other being scalability). For example while Bitcoin
provides some level of anonymity, all nodes have access to all
transactions and all the data within them. The same is true for
Ethereum, although it is moving in this direction by integrating
features from
[ZCash](https://blog.ethereum.org/2017/01/19/update-integrating-zcash-ethereum/)
to allow [zk-SNARK](https://eprint.iacr.org/2013/879.pdf) computations
from solidity, in the upcoming [metropolis
release](https://blog.ethereum.org/2017/10/12/byzantium-hf-announcement/). Other
ledger implementations are exploring different designs by which
privacy can be obtained, for example [R3
Corda](https://www.corda.net/).

DECODE puts this principal at the centre of its Privacy by Design
strategy. The cryptographic mechanism by which this is achieved is
through Zero Knowledge proofs.

In short these allow a participant to perform an action (transaction)
and record a verifiable proof of that transaction which has no
relation to the data used within the transaction. The proof can be
stored quite safely on any number of nodes since it contains no
private data. It is also possible for multiple nodes to validate the
transaction and build up a level of confidence in it (Integrity) and
enable redundancy of the proof (Availability).

In practical terms for example, in combination with attribute based
cryptography, this allows for anonymous yet verifiable petitions (see
examples section). The resulting petition has a high degree of
integrity because the ledger provides a Byzantine Fault tolerant
replication mechanism and a high degree of Availability because it is
decentralised and therefore not under the control of a single party or
system. This makes it extremely resistant to many forms of failure or
attack.

In summary the key requirements of a distributed ledger for the
purposed of DECODE are:

- Byzantine Fault Tolerance
- Decentralised network
- Ability to implement contracts that transaction execution from
  verification via ZK Proofs
- An environment that allows a higher order language to be created
  (See Smart Rules)
- Ability to scale horizontally
- Open source

### Querying the ledger

Having a robust and verifiable source of truth for transactions is of
little value if applications cannot make use of the record. To this
end, DECODE will provide a query interface over the ledger which will
be a separate capability. This area is still under development and
updates will be provided via. the whitepaper as it evolves.


## Authentication

DECODE recognises two scenarios involving Authentication.

**a) Authentication to DECODE wallets and nodes**

This is the means by which the participant protects access to their
wallet. In its most basic form this will be the standard option of a
password credential.

DECODE also supports and will explore the concepts of more
sophisticated authentication, for example external hardware security
devices and leveraging biometric capabilities of devices.

**b) The use of decode as a federated authentication provider**

It is possible for **operators** to provide a "Login with DECODE"
option. In this scenario the operator would enable an integration
whereby the participant would be redirected to their DECODE wallet,
authenticate there as above and then an exchange of application
specific cryptographic credentials would be passed back to the
website, allowing them to be authenticated.

A key principle at work with this scenario is that the operators must
themselves be transparent to the participants. This means in practice
that in order to allow login with DECODE the operator must first
register with DECODE and itself be cryptographically auditable in any
actions it takes in the DECODE system.

This raises questions around the governance of the DECODE ecosystem
which will be explored as it is field tested and evolved.
