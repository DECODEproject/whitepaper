# Distributed ledger
## Reference to chainspace
## Contract requirements
## Crypto requirements

The DECODE platform architecture has at its core a *distributed
ledger* implementation. This provides the the capablities of
availablilty and integrity. The core function of the ledger allows for
distributed, redundant storage of objects and the verification of
execution of smart rules.

<!--

tomd: we do not store objects in the ledger, I think. Only hashes for
verification of various components and transaction information (audit
trails?)



jimb: the core functionality of chainspace allows for data to be
stored as object. The domain model that it uses involves "Objects" and
"Transactions" what would be potentially worthwhile in this section of
the white paper is a quick summary of that. We can link then to the
soon to be published Chainspace white paper for more details.  Wether
we choose to store real data in the ledger or not is then a privacy
design issue. We could work through the example of the rental register
to explore this topic further, if the rentals themeselves are recorded
on the ledger how would we answer the question "how many nights has
this property been rented for this year?"

-->


In DECODE, smart rules are executed *outside* the ledger, and the
results are submitted to the ledger for storage and verification. In
this way, we allow for a completely private application to be written
because the only requirement of the ledger is that it be *provable*
that an execution is correct, the ledger does not need to actually
execute the transaction itself. For example one could write a smart
rule that can be verified through the use of a [Zero Knowledge
Proof](https://en.wikipedia.org/wiki/Zero-knowledge_proof).

This separation of *execution* from *verification* is a fundamental
design principle of the ledger.

The ledger operates as a series of managed nodes running across the
internet. The design of DECODE allows for multiple parties to operate
networks of nodes. Further, when desiging a smart rule, the designer
can select which node providers may execute the rule. Participants
using the application and submitting transactions will have clear
visibility of which organisations are participating in validating and
accepting their transactions.

Where checks are required of multiple inputs and outputs to a
transaction (e.g. to avoid a double spend scenario), all the input
transactions will require to also be known to the validating network.

<!--

**Enabling queries over the ledger**

**TODO:** Discussion around how one can query the ledger securely -
i.e. in order to query, an index view or projection needs to be
created across the data. How is this possible if all the data is
private for e.g.? Perhaps related to entitlements and meta data


-->
