# Operating system architecture

The DECODE OS is the base operating system running all software
designed, developed and deployed for the DECODE project. This
operating system is based on the renown Devuan GNU+Linux distribution,
a fork of the now 20 years old Debian distribution, maintained by the
Dyne.org foundation and an open community of volunteers. Devuan forked
Debian to preserve the simplicity and minimalism of the SystemV
tradition in UNIX systems, still running modern software applications
and inheriting the security patches from Debian.

The first release of the DECODE OS is made available at the Internet
address <https://files.dyne.org/decode/OS> and it incudes fully
functioning virtual machine images (Vagrant/vbox and Qcow2/Qemu
formats) implementing a base architecture (kernel and base system
tools) to build, run and connect a diverse range of future
applications. The DECODE OS is provided to developers of the DECODE
project along with comprehensive documentation and tools to reproduce
its build, benchmark and audit its functioning, as well with a
dashboard for live monitoring.

The primary goal of the DECODE OS can be explained in brief by
defining it as a "controlled execution environment" where, from the
making of its base to the execution of every single application, all
steps are recorded on a ledger of events that can be saved, analysed
and shipped along with every instance of the operating system. A
secondary goal of this development is that of making the results of
such a recorded sequence of operations reproducible.

The DECODE OS both as a product but also as a well defined process
leading to its release aims primarily at satisfying the following main
objectives:

- Adopt free and open source software compliant with any of DECODE's
  approved licenses. Make the source-code of any running software
  immediately available for audit. Avoid any dependency from
  proprietary software.

- Rely on widely used, peer-reviewed and stable applications and
  standards from GNU/Linux/BSD software traditions for its base
  functions.

- Make the whole building process transparent and auditable, providing
  schematic information about all adopted components that can be short
  and to the point, as well machine parsable.

- Realise a minimal, lean and resource aware operating system running
  as less processes as possible, to avoid complexity and to facilitate
  the controlled execution of micro-services.

- Rely on a continuous-integration infrastructure (see D4.2) able to
  integrate the dependencies and applications of DECODE developers
  with as less friction as possible.

- Provide an optimal developer experience by providing two distinct
  profiles: "-dev" for development and "-prod" for production use and
  a way to switch between development and production that is seamless.

- Maintain an exact history of changes made to the OS as well builds
  triggered, reflected in the final product and auditable according to
  a map of liabilities drawn during the build process.

- Integrate benchmarking tools and a live monitoring dashboard to
  facilitate quality assurance assessments and the review of resource
  management under different conditions. Also allow the customisation
  of the dashboard to include future application specific indicators.

- Target a wide range of hardware architectures and well-established
  chipset standards, virtual machines and cloud providers, without
  requiring any significant change in the base system, just a
  different setup of the continuous-integration pipeline.

- Refer to well established UNIX standards for the configuration of
  the system and process control. Avoid any binary configuration
  format and adopt as much as possible input and output formats that
  can be both read by humans and easily parsed by machines.

- Enforce full-spectrum process separation between all different
  applications running on the DECODE OS, making it possible to isolate
  problems and eventually recover functionality.

## Process separation

DECODE's implementation of a distributed computational system aims to
be solid and fit for mission critical purposes by leveraging well
established standard practices in the UNIX world. Contrary to the
monolithic applications implementing blockchain functionalities in a
single runtime environment running in application space, our
implementation of a "DECODE NODE" (see D1.1) is a controlled execution
environment unit for Smart Rules grafted on the classic concept of a
UNIX-like operating system, keeping POSIX.1b and SystemV
compatibilty. This approach brings several advantages:

- The system is familiar to system administrators and can be monitored
  and managed using existing well known tools.  A DECODE NODE is
  backward compatible with the vast majority of existing entreprise
  infrastructure.

- Planned and documented integration between application specific
  functions and the underlying OS, verticalising the full stack and
  providing a fully certified environment for smart rule execution.

- The security of the DECODE NODE is granted by means of stable Linux
  based access control lists (ACL) and firewalling.

- The diagnosis of problems occurring on running nodes is fully
  compatible with already established practices of logging, tracing,
  profiling and debugging processes.

- Components can be mixed in a modular fashion, allowing reusal of
  existing implementations in different roles, including production
  ready software for network orchestration, p2p networking, data
  storage presentation, cryptographic operations and immutable ledger
  functions.


## Privilege escalation


Intelligence communities use the concept of "need to know" as a way to
minimize information leaks and only grant access to secrets when it is
absolutely necessary for the performance of an agent's action. In
computer security, the same concept can be translated for _privilege
escalation_: the need for a program to execute actions not normally
available to its calling user. Often used offensively to gain control
of a target machine or extract information, privilege escalation has
also legitimate use, for example to enable a desktop user to perform
administrative actions such as rebooting a running system or upgrading
its software packages.

In case of the DECODE privilege model for data access the intention is
to maintain defense in depth by granting the integrity to the
underlying operating system in addition to the cryptographic security
model implemented by the application layer, because a node that is
compromised by a rogue process escalating its privileges could anyway
jeopardise the validity of results provided by the smart rules
computations happening on it.

In order to avoid such a situation, DECODE adopts a privilege
escalation model based on a hard-coded hash-table that is inscribed
into its operating system. The standard C (POSIX.1b) implementation
for this model is called *sup*, currently maintened by Dyne.org and
well known to the security community especially in the context of
embedded development. Its website is visible at <https://sup.dyne.org>

The *sup* binary runs as root (with suid bit on) to facilitate the
privilege escalation needed to execute certain programs as superuser,
for instance to open a listening port below 100, for a web or an SMTP
server. In order to regulate the privilege escalation *sup* handles a
few conditions to authorize execution, all hard-coded in a static ELF
binary.

For the DECODE OS an "allow list" is provided to *sup* at the time of
building the ISO installers and SD card images, so that running "*sup*
application" will escalate the privileges of application without the
need of any password, in case the application is included in the
"allow list". In order to extend the list of applications allowed to
escalate privileges within the execution environment of the DECODE OS,
a new build of it must be provided.  Binaries change their contents
across builds that are targeted to different architectures (i386,
amd64, armhf, arm64, etc.) therefore the hashes in the allow list will
change for each targeted build.

The *sup* binary itself is authenticated by the "root" signature of
each DECODE OS which is shipped along with the ISO or installer or SD
card or virtual machine image formats. The cryptographic signature of
DECODE OS verifies all the binaries of the system in their current
state as released, including *sup* whose unique binary footprint
changes at every change of its privilege escalation hash
table. Therefore any change in any binary that can escalate its
privilege via *sup* will lead to a change in the *sup* binary itself,
which will lead in a change in the signature of the whole DECODE OS.

This way of authorising the execution of software applications is not
only implying that a particular binary can escalate privileges, but
also that a particular build of that program can. It means that even
if the binary is substituted with another one by modifying the
installer image of the DECODE OS, it will not be able to be executed
with privileges, denying the possibility to run effectively
counterfeited DECODE OS images, as this check is combined with the
check of a cryptographic signature for the whole OS image.


### Security implications

This privilege escalation model improves the overall security of the
DECODE OS as a system where it can be pre-determined what needs to run
with privileges, harnessing the main difference with desktop systems
that are interactively configured and whose privilege model can be
changed by users.  When this model is used in combination with a
security enhanced Linux kernel, it constitutes a very robust
foundation for the realisation of a secure operating system that
executes a predetermined set of computing processes.

DECODE's privilege escalation model provides overall better security
against the breach of the system integrity, but it cannot be
considered a blanket solution for the security and integrity of the
whole DECODE architecture. It is a reasonably strong measure to insure
the integrity of operations at the core of the DECODE OS, granting
integrity for the execution machine.


### Technical implications

For the developers involved, DECODE's privilege escalation model means
that every software application, be it binary compiled or scripted
executable, needs to be registered with its hash inside the OS at
build time. To change such an application a whole new build of the
DECODE OS needs to be triggered. This is of course a setting necessary
to produce production ready installers, but it can be de-activated for
testing environments.

The other main implication is that each and every program executed
with privileges cannot arbitrarily execute other programs that are
configured at runtime. For instance a privileged process cannot have a
variable that can be configured at runtime to call another program. An
exception to this rule can be the implementation of a mechanism to
drop privileges inside the program, which should be throughly
reviewed: such implementations exist in C, however the need for such
an exception should be avoided.

Regarding updates, patching a running system would entail a reboot
after downloading a new OS version, which will be distributed in a
"squashed" bundle (squashFS). This wouldn't mean to reinstall the
entire OS, but to download and reboot into a new signed binary system.


### Political implications

The model by which privilege escalation is granted to processes
running in the DECODE OS is intentionally resistant to changes, which
need to be implemented and recorded in the history of revisions before
the build process. This model forces a clear negotiation of privileged
process, allowing a debate on such choices that is extended to all
technical stakeholders. The process of privilege escalation should be
in fact seen as a political negotiation about which algorithms are
allowed to deal with more delicate parts of the operating system.


## Application modules

Considering a first abstraction of functionalities, mostly resulting
from the study of user-cases and currently adopted pilots in DECODE,
it is already possible to envision a set of modules whose
functionalities can be satisfied by a considerable number of stable
software implementations. The following figure shows the
functionalities that can be contained in a DECODE node, each of them
can be a different software application running as an isolated
process, whose communication channels can be specified at the time of
building the DECODE OS and cannot modified unless the design of the OS
is re-negotiated according to clear needs and specified patterns.

![DECODE application modules diagram](img/decode_node.png "DECODE application modules diagram")

The modules listed in the figure above are:
- Smart Rules language interpreter and controlled execution
  environment
- Entitlements ACL layer based on attribute based cryptography
- Distributed Blockchain providing an immutable ledger
- Data storage (Vault) in different possible formats (Document or
  Graph)
- Peer to Peer Networking Orchestration System and VPN

The modules listed can be implemented by new software developed by the
DECODE consortium as well as by existing and well established open
source standard implementations. Being this the first release of the
DECODE OS it is well out of the scope of this document to envision
which software will satisfy these roles, as well the listed modules
may be subject to further adjustments as new needs and refinements
become manifest in the coming research iterations.

What matters to us now is the fact that there is a clear way to
include such SOFTWARE modules inside a coherent and well documented
system built from source and that the overhead to substitute a module
with another implementation is minimum. Each application is an
installed software package that is ran at startup, whose health is
monitored by the system and whose failure does not propagates to other
system components.

This architecture also allows to map the inner architecture of a NODE
as well to envision the possibility to produce different NODES that
are tailored ad-hoc to different use-cases. As a last note, the
architecture also includes the possibility to have an optional
application to be ran inside the NODE and interact with some of the
components inside it: this is an opportunity DECODE OS can leverage
for special applications requiring intensive communication with inner
components of the DECODE NODE.


