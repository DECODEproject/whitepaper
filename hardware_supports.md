# The DECODE network


DECODE is at the core a distributed P2P network of "nodes" that together provide data privacy and integrity services to application developers.

The overall architecture is similar to other distributed ledgers and we have followed familiar terminology, such as "Wallet". We describe here the roles and responsibilities of each of the components and how they work together to achieve our goals.

![Decode Network Architecture](img/decode-network-architecture.png "Decode Network Architecture")



## Validating Nodes

The integrity and resilience of the network is provided through a distributed network of Validating nodes. One of the key architectural features of DECODE is that it separates *execution* of logic (*contracts*) from the *verification* of that logic, which allows for privacy aware execution [REF!](section-on-concepts-distributed-ledgers).

The validating nodes are key to providing the integrity and availability of the DECODE network. Therefore we build them from the ground up with a strong emphasis on verifiability by basing them on the DECODE OS. Each node will also contain the distributed ledger node and any other libraries and software that is required to participate in the DECODE network. This is likely to include cryptographic functionality and P2P networking capabilities to allow dynamic and evolving P2P networks to be formed. It is possible that the P2P networking capabilities can come from the underlying ledger implementation, or be augmented with custom protocols.

It is important to note that DECODE does not mandate that every participant host a validating node. The minimum software you need access to in order to participate is a DECODE Wallet. 
 

The process of governance of the node network and the underlying motivations to make the network self sustainable are a research topic within DECODE and as this evolves, the results will be updated in this whitepaper.

Existing self sustaining networks such as Bitcoin or Ethereum offer a financial incentive to node hosts to operate the validating nodes of the network. DECODE will explore alternate, social motivations alongside these.


## DECODE Wallets

The wallet is the minimum component a person requires to interact with DECODE. Every **participant** will have their own wallet. The wallet has several core functions:

- Store securely cryptographic material (e.g. private keys)
- Securely store Attribute based credentials, linked to private keys
- Execute DECODE transactions (via Smart Rules) and submit them to the Ledger for verification
- Store, encrypted the participant's **attributes**
- Define and publish **entitlement policies** based on interactions with **applications**
- Provide the participant with a graphical user interface that allows them to manage their attributes, entitlements and applications. 

Optionally a participant can push the cryptographic functions of the wallet onto a hardware device, similar to Trezor, Ledger Nano from the blockchain world. A discussion of these options is to be found in the hardware section.

We have identified two options for participants to obtain a wallet and begin interacting with DECODE. This is a topic of research for the DECODE system and is likely to evolve as we move into field testing with real communities of participants.


**a) Download a Wallet**

The wallet will be available as a standalone application that a participant can download to their device (either laptop or mobile device). In combination with a hardware security device this will form the maximum level of protection that a participant can achieve. 

Whenever the participant must perform a cryptographically sensitive activity such as signing a transaction, they will be redirected to their wallet to perform this. 


**a) Wallets Hosted by Operators**

We recognise however that *requiring* participants to download software and engage with a registration process *may* be a barrier to adoption. We plan to explore this through user research and field experiments. With this in mind, the architecture of DECODE also supports the concept of an ***hosted wallet***. 

DECODE intends to provide tools and documentation to allow **operators**[^3rdpartywallet] to host wallets *on behalf* of their existing users. This is an  low barrier to entry for an operator, involving minimal integration whereby the operator maintains any existing authentication mechanisms they have in place and links existing accounts to a DECODE wallet. It also preserves any existing authentication structures the application may have, allowing DECODE functionality to be added in a decoupled and safe manner.

[^3rdpartywallet]: It might be possible for 3rd Parties to create an online wallet hosting service,  however we have yet to explore the demand for this scenario.

To maintain the core values of DECODE however, a constraint of this scenario is that the user *must be aware and consciously agree* to the connection between their account and DECODE. Whilst the process itself maybe "1 click" for the user, the user journey must include a "connect my account to DECODE" phase. The exact design guidelines for how this is achieved will be developed on an ongoing basis.

There is a tradeoff with this scenario in that while it allows for lower barrier to adoption, it also diminishes the true value of DECODE as a decentralised system. In this scenario, the trust relationship has not been decentralised, i.e. the participant is still trusting the operator as an organisation with all their data.

![Decode Overview](img/decode-overview.png "Decode Overview")


## Hardware Hubs
### Requirements
#### Capability of running DECODE OS

The processor of the HUB needs to run the DECODE OS. The DECODE OS is based on Devuan and which developed by Dyne, who published the first release on April 2017. To assure compatibility of a specific processor, it must be made a target of the DECODE OS SDK. The DECODE OS SDK is modeled after the Devuan SDK and supports all its architecture targets. Additionally, to run the DECODE OS, the DECODE HUB needs to host enough computing power to act as local data broker, encrypt data and potentially run local storage of historical information. 

#### Transparency 
One of the goals of the DECODE platform is to create a level playing field that enables developers from all backgrounds to contribute to society by implementing innovative applications and opening up new economical, technological and social values based on the new infrastructure that DECODE will provide. To facilitate the participation of these developers, all the elements of the DECODE architecture should be open source. For that reason any device specifically designed to operate as a DECODE HUB should be open source and compliant with the Open Source Hardware Association (OSHWA). Schematics, design files and documentation should be available for designers to build upon. DECODE will encourage hardware designers to join their efforts in creating a more secure and open hardware.  

#### Deployability and availability
Deployability is key to ensure the adoption and success of DECODE. Therefore, the HUB must be easily available. The most available potential HUB is any commercial computer. According to Barcelona data-sheet 20171 the Household ICT penetration is 88.3 in 2015 (% on population 16 to 74 years with a computer at home). Despite most of commercial computers not being open source this is a viable alternative for promoting an early adoption. For scenarios where an embedded device with a small form factor is required, low cost open source single board computers (SBCs) are a good alternative for the DECODE HUB. 

#### Hardware security
The need for privacy and confidentiality differ according to the use cases of the platform. For instance, noise quality data requires less security than biometric health-centered data that's being sent to a physician. This requires encryption on many different levels. To build trust in the platform, the DECODE needs to respond to the level of security each separate use case.
Software-based security means that access conditions can be hacked and logs can be tampered with. In addition, the data itself cannot be considered secure if left unprotected on a regular PC.

For this reason the DECODE platform user should consider the adoption of hardware-based security when a higher level of confidentiality is required. The interaction with these security measures should be easy and effortless for the end-user.

Potential hardware security features for the HUB:
- **Multiple factor authentication:**
The security protection provided by a single authentication method, e.g. a password, have proved to be weak. To make access conditions 		more secure, the system can ask for a multiple factor authentication. This could be the combination of a password with some token that the user have (like an RFID or BLE device) or  biometric data like fingerprint readers or voice recognition.
- **Secure processors:**
Secure microcontrollers with built-in cryptographic engines and secure 	boot loader can guard against threats such as cryptanalysis intrusions, physical tampering, and reverse engineering. These secure microcontrollers are equipped with silicon-level anti-tampering features that allow to make them tamper resistant and to provide tamper evidence. The security keys, used to run cryptographic algorithms, need to be stored in a secure memory 	managed by a secure microcontroller and should only be accessible by the secure microcontroller and not from the outside of the 	memory.
- **Tamper avoidance:**
Anti-intrusion sensors can be incorporated into the electrical design to ensure someone tampering physically with the device would not have access 	to any sensitive data.
- **Side channel attacks protection:**
Side channel attacks consist in attacks based on information gained from the physical implementation of a system, rather than brute force or weaknesses in the algorithms. For example, timing information, power consumption, electromagnetic leaks or even sound can	provide an extra source of information, which can be exploited to break the system. The first step to protect against this types of threats is the reduction of the electromagnetic and sound radiations. Other measures include random calculations and delays introduced between normal operations and try to balance the power consumption of different data values.
- **Access	attempt detection:**
Any attempt to access the system data remotely is detected. If the 		access is illegitimate (unauthenticated, coming from an unknown IP 		address, etc.), access is denied and in some cases data can be erased.


#### Connectivity
Decentralized transactions will be continuously being carried by the NODE. This will result in the NODE using the network resources in an extensive manner. To reduce the latency in the communication and to avoid bandwidth bottlenecks, a high speed Ethernet port should be part of the specifications.



## Keys and smart cards
An exchange between DECODE nodes can only take place once both parties are security identified in the system. The DECODE architecture will provide an authentication method to enter the system.

Traditional authentication mechanisms consist in only one factor authentication like a pin code or password. But password based security has proven to be insufficient to prevent unauthorized access to websites, networks and hardware devices. For this reason, users are now requiring  multiple factor authentication, usually called 2FA for Two-factor authentication, 3FA for Three-factor authentication, etc. By combining several authentication factors, the authentication process is made more secure.
Authentication factors include:

- Knowledge factors: The users needs to prove knowledge of a secret that only themselvs know. Typical secrets include passwords, PIN codes, answer to secret question etc.
- Possession factors: An object that the user owns is used as a key to access the system. Typically, objects used in authentication include passive or active tokens, smart card chips packaged in a variety of form factors (key, token, ring, badge, etc.).
- Inherence factors: something associated with the user, such as biometrics, are used as a key to access the system. Examples include fingerprint readers, retina scanners, voice recognition etc.

In order to make access more secure DECODE will support hardware based authentication with login tokens that provides 2FA via the U2F standard. The login token will safeguard and manage digital keys for strong authentication and provide crypto processing. These modules traditionally come in the form of a plug-in card or an external device that can be attached directly to a DECODE HUB.

Open source examples for hardware security modules and login tokens:

**Authentication keys:**
- Nitrokey
- U2F zero

**Hardware secure modules:**
- CrypTech 
- Pitchfork

In case of need or desire for higher privacy control, users can opt for a specific computer with more advanced hardware security features. 


## IOT connectivity

A core use-case for the DECODE project is to provide a set of tools to enable personal IOT data to be securely managed.

Integrating with the plethora of IOT devices on the market is a non-trivial problem and one that the DECODE project considers solving by :

**Normalisation** Data from devices range from high level representations in JSON and XML to a series of bytes. Normalisation is the process of transforming into a common, open format. JSON-LD (https://json-ld.org/) is an example of one such format.

**Semantic Understanding** Once data is normalised it is important to understand the meaning of the data. To add this understanding you could use an ontology such as the M3-Lite (http://ontology.fiesta-iot.eu/ontologyDocs/m3-lite.owl#).

An example of a tool that provides this approach is the device-hub software offered by thingful. The tool is available at [https://github.com/thingful/device-hub](https://github.com/thingful/device-hub)

## The Ledger Implementation 

### Chainspace 

As part of the mission of DECODE, we present a distributed ledger implementation **Chainspace** ([http://chainspace.io](http://chainspace.io)) which has been designed deliberately with privacy and scalability in mind and is fully aligned to the goals and principles of DECODE. The full technical details of this implementation can be found at [REF!-CHAINSPACE PAPER](...).

In summary, chainspace provides a highly scalable, BFT fault tolerance ledger which separates transaction *execution* from *verification*. In implementation it provides for this in an entirely technology neutral and decoupled manner. 

**Chainspace contracts** can be written in any language and are composed of two asymmetric but cryptographically related  components. These are the *contract* and the *checker*. The *contract* is responsible for executing the transaction, definining the constraints that are required. The result of the execution of a *contract* is a *proof* which has no data from the transaction but which can be cryptographically verified by the  *checker*. The network of Chainspace nodes are responsible for verifying transactions and publishing the verifications as a blockchain. In implementation, Chainspace creates multiple blockchains, please see the white paper for more details.

### Alternatives

The architecture of DECODE, following the guiding principles of being modular and reusing code, is not restricted to the implementation of Chainspace to provide the underlying ledger capability. It is possible for example that with the cryptographic advances in Solidity already mentioned, that it would be possible to build DECODE using any ledger system that also incorporated the solidity vm, either Ethereum itself or for example the hyperledger [Burrow project](https://github.com/hyperledger/burrow) from [Monax](https://monax.io/).

As the project and this whitepaper evolves alternatives will be explored and tested as they may solve for different tradeoffs. 




