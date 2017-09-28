# DUMP

*Put things here that you think are relevant, but that are not clear enough yet, or for which it is not clear where to place them*




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
