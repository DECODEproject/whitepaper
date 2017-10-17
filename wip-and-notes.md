# DUMP

*Put things here that you think are relevant, but that are not clear enough yet, or for which it is not clear where to place them*



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
