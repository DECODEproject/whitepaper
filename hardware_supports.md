# The DECODE network


DECODE is at the core a distributed P2P network of "nodes" that together provide data privacy and integrity services to application developers.

The overall architecture is similar to other distributed ledgers and we have followed familiar terminology, such as "Wallet". We describe here the roles and responsibilities of each of the components and how they work together to achieve our goals.

![Decode Overview](img/decode-overview.png "Decode Overview")

## Relay nodes (validating nodes)

The integrity and resilience of the network is provided through a distributed ledger of nodes. One of the key architectural features of DECODE is that it separates *execution* of logic (*contracts*) from the *verification* of that logic, which allows for privacy aware execution [REF!](section-on-concepts). 

- User Interface

## Wallet nodes

- User Interface

## Hardware Hubs
### Requirements
#### Capability of running DECODE OS

The processor of the HUB needs to be able to run the DECODE OS. The DECODE OS is based on Devuan and is developed by Dyne, who published the first release on April 2017. To assure compatibility the processor selected has to be a target of the DECODE OS SDK. The DECODE OS SDK is modeled after the Devuan SDK and supports all its architecture targets. Additionally to the capability to run the DECODE OS, the DECODE HUB needs to host enough computing power to act as local data broker, encrypt data and potentially run local storage of historical information. 

#### Transparency 
One of the goals of the DECODE platform is to create a level playing field that enables developers from all backgrounds to contribute to the society by implementing innovative applications and opening up new economical, technological and social values based on the new infrastructure that DECODE will provide. In order to facilitate the participation of these developers, all the elements of the DECODE architecture should be open source. For that reason any device specifically designed to operate as a DECODE HUB should be open source and compliant with the Open Source Hardware Association (OSHWA). Schematics, design files and documentation should be available for designers to build upon. DECODE will encourage hardware designers to join their efforts in creating a more secure and open hardware. 

#### Deployability and availability
Deployability is a key factor to ensure DECODEs adoption and success. To reduce the entry barrier for users the wallet HUB must be easily available. The most available potential HUB is any commercial computer. According to Barcelona data-sheet 20171 the Household ICT penetration is 88.3 in 2015 (% on population 16 to 74 years with a computer at home). Despite most of commercial computers not being open source this is a viable alternative for promoting an early adoption. For scenarios where an embedded device with a small form factor is required, low cost open source single board computers (SBCs) are a good alternative for the DECODE HUB.

#### Hardware security
The need for privacy and confidentiality might differ according to the use cases of the platform. For instance, noise quality data might be less critical than health monitoring data or communication with the healthcare sector where a higher level of not only confidentiality but also essentially privacy might be required. This implies encryption in many cases. To build trust in the platform, the DECODE system needs to respond to the need for security. Software-based security means that access conditions can be hacked and that logs can be tampered with. In addition, the data itself cannot be considered secure if left unprotected on a regular PC.

For this reason the DECODE platform user should consider the adoption of hardware-based security as well when the level of confidentiality required is higher. This measures should be made easy to interact with and effortless for the end-user.Some of the hardware security features that the HUB could provide are:
- **Multiple factor authentication:**
The security protection provided by a single authentication method, 		e.g. a password, have proved to be weak. To make access conditions 		more secure, the system can ask for a multiple factor authentication. This could be the combination of a password with some token that the user have (like an RFID or BLE device) or  biometric data like fingerprint readers or voice recognition.
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

- Knowledge factors: the user is required to prove knowledge of a secret in order to  authenticate. Typical secrets include passwords, PIN codes, answer to secret question etc.
- Possession factors: “something only the user has” is just the modern form of owning a key that opens a lock. Typically, objects used in authentication include passive or active tokens, smart card chips packaged in a variety of form factors (key, token, ring, badge, etc.).
- Inherence factors: associated with the user, such as biometric methods, including fingerprint readers, retina scanners or voice recognition.

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

```comment
Curator: MarkD
```
A core use-case for the DECODE project is to provide a set of tools to enable personal IOT data to be securely managed.

Integrating with the plethora of IOT devices on the market is a non-trivial problem and one that the DECODE project considers solving by :

**Normalisation** Data from devices range from high level representations in JSON and XML to a series of bytes. Normalisation is the process of transforming into a common, open format. JSON-LD (https://json-ld.org/) is an example of one such format.

**Semantic Understanding** Once data is normalised it is important to understand the meaning of the data. To add this understanding you could use an ontology such as the M3-Lite (http://ontology.fiesta-iot.eu/ontologyDocs/m3-lite.owl#).

An example of a tool that follows is the device-hub software offered by thingful. The tool is available at https://github.com/thingful/device-hub

## P2P networking

- p2p
- Identity?
- Relationship to the ledger? 



