# DECODE Components




![Decode Overview](img/decode-overview.png "Decode Overview")

## Relay nodes (validating nodes)
- User Interface

## Wallet nodes

- User Interface

## Hardware Hubs

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



