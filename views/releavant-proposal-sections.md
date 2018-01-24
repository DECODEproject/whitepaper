# FOR REFERENCE: Design requirements taken from the proposal

The following pieces of text appear in the proposal and are relevant with respect to both the scope of the architecture and how the architecture should be implemented.

Higher level aims:

- *Prevent the concentration of power in the hands of a few platform operators* that aggregate big data on a global scale through a fully decentralised architecture for identity management, data storage, processing and governance.
- *Represent and effectively use an extended range of data*, coming from people, sensors, devices and the city; deploying privacy-aware intelligent systems that help to make citizens more aware of issues and possible social solutions; fostering collective deliberation and bottom up decision-making.
- *Ensure that people are in full control of their data and identity*, maintaining privacy and trust in the systems they use, reaping the benefits of big data aggregation, within a clear socio-technical and legal framework, enhancing privacy and ownership of data.
- *Create a level playing field* enabling new entrants (social entrepreneurs, P2P developers, open source software and open hardware developers) to implement innovative approaches and applications, opening up new economic and social perspectives.
- *Preserve the digital sovereignty of European (and worldwide) citizens*, preventing unauthorised usage of their personal data, on clouds, social networks and the Internet of Things.

More concrete design goals:

- DECODE will develop a decentralised IoT data access system using open standards (for example, CoAP, MQTT, UPnP, etc.)  that accommodates legacy devices, smart objects and new services, enabled by controllable data sharing.  These will be embedded in a modern scalable blockchain, and supported by distributed smart rules, providing a fully decentralised social-application ecosystem.
- DECODE builds on a Free and Open Source Software (FOSS) and hardware platform.
- DECODE technology will provide a means to manage identities of parties as collections of personal attributes, access and influence in the domain of the body (BAN), local (LAN) and wide area network (WAN).  It will develop specific data-brokers based on the generic principles proposed for each network, backed by a state of the art blockchain infrastructure supporting smart rules and privacy protections.
- DECODE will develop an intuitive interface empowering citizens to control with the click of a button with whom they share their data, in which format (addressing interoperability), and who is allowed to perform actions at what times, up to the lowest possible granularity.  Specific policy language will be developed that is both easy to express smart rules in, and easy to audit for compliance and to build trust.
- DECODE will develop a decentralised system for accessing private IoT data and open civic data, creating a data index and data presentation interface, able to deliver secure, stable, validated datasets to a data entitlement layer in which citizens are in full control of these datasets.
- “MyData approach”: Let the citizen control who can access their personal data and under what circumstances, using adaptive, smart, context-dependent access rules. 
- Citizens will be able to amend incorrect data and delete unwarranted data.
- DECODE will define solutions and strategies for streaming, publish/subscribe access, storage  decentralisation and redundancy of real-time IoT data.
- Smart Rules facilitate data governance and identity management with basic functions: publish/subscribe access to events and functions to interface with external APIs; core functions to store and access the blockchain according to ABC entitlements; library functions to interfaces with external applications.  Smart rules allow users to define obligations around their data, and conditions of access.  Providers and app developers can also specify rules relating to the operation of the system or the regulatory environment.
- DECODE makes it possible for data subjects to determine access rights to their information through flexible entitlements (smart rules).
- DECODE develops a distributed and privacy-aware architecture for decentralised data governance that supports  the governance of decentralised data and federated identities. (a  fully  decentralised  architecture  for  identity  management,  data  storage,  processing and governance.)

## Fully distributed architecture for data management 

We plan on leveraging the existing social and community structure around the pilot applications, and design technically distributed stores with a decentralised authority.  Those should provide high% integrity, availability and confidentiality.  Both sybil%resistance to flooding attacks by corrupt nodes, and also routing security will leverage emergent trust assumptions, rather than expensive proof of work schemes. We aim to support complex transactions, since those are necessary for rich services and even simple local currencies and token / reservation systems to support Uber / Airbnb types of applications. At the same time, to challenge those systems, a serious volume of transactions needs to be supported (such as 1000s/second).  No such service, combining all those features, exists today.

## Scalable distributed ledgers

DECODE needs a distributed data backend offering high-integrity, high-availability, which is compatible with privacy techniques such as attribute-based credentials (ABC) and attribute based encryption (ABE). It should balance transparency and privacy.

## Decentralised identity management, privacy, and trust: Attribute-based credentials/encryption

DECODE will propose a novel ABC access model that is decentralised and where data, rules, and credentials may be stored on the distributed ledger.  Whenever they meet at a DECODE node, the rules determine whether (some of) the data is released.

DECODE projects aim at addressing the following challenges: how to securely issue and use credentials that are stored in the distributed ledger instead of at the user locally; how to exert control over distributed stored credentials; how to combine attribute-based encryption and attribute-based credentials; and how to authorise transactions anonymously using ABC.

## Formal language for the management of data access and privacy (smart rules) 
 
A language is needed to define, implement and enforce clear and transparent smart rules for data access, governance and identity management.  Access rules should allow organisation to use data, depending on specific parameters; capture and enforce legal rules and constraints, as well as rules around anonymisation obligations and data deletion or retention.  Language rules must be enforced by design, on either centralised or decentralised datasets.  Their enforcement should be safe from platform attacks (through hacking or malware).  Language design should promote clarity and avoid ambiguities; their syntax should be extended according to the need that will emerge.  The rules should ensure the respect of the decisions of the data owner (for example, citizen or the city), but also of collective regulations and legal obligations on application providers.

## Decentralised data access and open IoT semantic ontology

De-couple the search and access functions. A lightweight open source client with complete transparency can be installed by the data consumer service (app, algorithm, service etc.)  to search for data and once the results are returned, the Interchange client can borrow for each source its data repository parser maps, access credentials and other relevant information. Build a smart rule based interface to its service for device and data owners which links to a shared semantic ontology which will be external to core search and access service and which will be stored via a distributed data storage layer.  The smart rule interface (T3.5) will provide a mechanism for any interested party to provide new or amended taxonomic information, and the created taxonomy will have a permanent presence on the network meaning that it will exist beyond the control of any single party.

## Privacy-preserving, discrimination=aware data mining and recommendation system 

 In DECODE we will devise privacy%preserving data mining and aggregation methods that will extend the existing works in privacy-aware data mining by allowing efficient privacy analysis and anonymisation of distributed datasets, residing on the DECODE distributed ledgers. DECODE aims to develop non-discriminatory data mining methods that will extend the existing works in discrimination-aware data mining by allowing the discrimination analysis and prevention in the decentralised data analytics and recommendation systems, where data needed for data mining and personalisation might be distributed among different parties in the context of the data entitlement model.  While the current state of the art only focused on discrimination risks of classification data mining tasks in the centralised setting, our work also takes into account discrimination risks in recommendation systems and distributed datasets.
 
## Trust framework for digital commons, including personal data 

DECODE will transform the current data ecosystem so that individuals can truly own and control their data.  In order to do so, the conditions for the processing of data set out by the individual would constitute the basis for an organisation to accept to engage with and use the data.  This would not be exactly a privacy policy or a consent form, but a different kind of rule or license to use the data.  DECODE proposes a combination of business practices, legal rules and technical solutions (a trust framework) operated through smart rules that manage user preferences for data sharing and capture the “operating rules” for a community of trust.  This starts with transparency over what data is held by whom, and the ability to authorise any sharing while understanding the implications. Taking advantage of the potential of the distributed ledger technologies, DECODE will design legal schemes (rules and/or licenses) apt to foster stigmergic behaviours by individuals that generate digital commons made of personal data and identify the specific characteristics, ownership regimes, and access rights of such digital commons.
