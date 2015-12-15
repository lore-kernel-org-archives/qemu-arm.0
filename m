Received: by 10.182.158.201 with SMTP id ww9csp2758072obb;
        Tue, 15 Dec 2015 14:51:39 -0800 (PST)
X-Received: by 10.55.16.205 with SMTP id 74mr57247578qkq.15.1450219899065;
        Tue, 15 Dec 2015 14:51:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y66si3317114qhc.73.2015.12.15.14.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 14:51:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8yRW-0004Di-PO
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 17:51:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yRS-0004Ci-Ut
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:51:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a8yRO-0001U8-Ti
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 17:51:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a8yRO-0001Tu-MW; Tue, 15 Dec 2015 17:51:30 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 6B8853812B6;
	Tue, 15 Dec 2015 22:51:29 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBFMpNh1024186; Tue, 15 Dec 2015 17:51:24 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Dec 2015 16:51:09 -0600
Message-Id: <1450219878-5293-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v3 0/9] target-arm: enable qmp-dump-guest-memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pdPtYFWmvp5h

This series brings qmp-dump-guest-memory to arm and aarch64
targets. I've detailed my testing and the results in the
following table.

v3:
 - more changes thanks to Peter's review comments
   - fix 32-to-64 shoehorning to work better with EL2/EL3
   - stole comment from Peter for best-effort at endianness selection
   - only make ARM VFP notes when the guest has VFP registers
   - some more patch squashing and code commenting
   - another r-b added
 - collapsed a level of indirection, because if we're writing elf64 notes
   then we'll always call the aarch64 function [drew]
 - fixed the note type for ARM VFP notes (+ a tiny bit of refactoring) [drew]
 - set prstatus.pr_fpvalid [drew]
 - tested on tcg [drew]

v2: changes thanks to Peter's review questions
 - Threw in the FP registers. Can view them with gdb on elf
   formatted dumps.
 - Added comments stating where the register structs come from.
 - Fixed determination of 32 vs. 64-bit and LE vs. BE formats.
   Added a new config to the test matrix below to test this fix.
 - Added a couple R-b's


arm/aarch64 kvm guest kdump testing (P - PASS, F - FAIL). Testing done
with a latest mainline crash utility (all new patches needed are now in
master).

.-------------------------------------------------------------------------------.
|				Host	| arm32	| arm64	| arm64 | arm64	| arm64	|
|---------------------------------------|-------|-------|-------|-------|-------|
|				Guest	| arm32	| arm64	| arm64 | arm64	| arm32	|
|---------------------------------------|-------|-------|-------|-------|-------|
|			     User binary| arm32	| arm64	| arm32 | arm64	| arm32	|
|---------------------------------------|-------|-------|-------|-------|-------|
|				Pagesize| 4K	| 4K	| 4K	| 64K	| 4K	|
|===============================================================================|
| kdump in guest			| F[1]	| P[2]	| P[2]	| P[3]	| F[1]	|
|---------------------------------------|-------|-------|-------|-------|-------|
| qmp-dump-guest-memory <filename>[4]	| P	| P	| P	| P	| P	|
|---------------------------------------|-------|-------|-------|-------|-------|
| qmp-dump-guest-memory -z <filename>[5]| F[8]	| P	| P	| P	| F[8]	|
|---------------------------------------|-------|-------|-------|-------|-------|
| qmp-dump-guest-memory -l <filename>[6]| F[8]	| P	| P	| P	| F[8]	|
|---------------------------------------|-------|-------|-------|-------|-------|
| qmp-dump-guest-memory -s <filename>[7]| F[8]	| P	| P	| P	| F[8]	|
.-------------------------------------------------------------------------------.

[1] Kernel v4.4-rc1 crashes with a NULL pointer dereference at virtual
    address 00000000 in a memcpy (crash_kexec/machine_kexec/fncpy/memcpy).
    Needs kernel debugging.
[2] Not sure about mainline, but works with the RHEL kernel,
    makedumpfile does not yet support arm64 with 4K pages, but using
    'core_collector cp' in /etc/kdump.conf allows saving an uncompressed
    elf file.
[3] Not sure about mainline, but works with the RHEL kernel,
    uses makedumpfile, thus generates a makedumpfile formatted file
    using zlib compression.
[4] No format specified, creates an uncompressed elf formatted file.
[5] makedumpfile format, with zlib compression
[6] makedumpfile format, with lzo compression
[7] makedumpfile format, with snappy compression
[8] The crash utility doesn't seem to like arm32 dumps in makedumpfile
    format. Looks like the physical page bitmap is all zeros? Needs
    qemu and crash debugging.

Additional notes:
1) QEMU also has scripts/dump-guest-memory.py, which can and should be
   updated to support multiple architectures, pagesizes, and physbases.
   This is currently left as future work.


Andrew Jones (9):
  qapi-schema: dump-guest-memory: Improve text
  dump: qemunotes aren't commonly needed
  dump: allow target to set the page size
  dump: allow target to set the physical base
  target-arm: introduce aarch64_compat_sp
  target-arm: support QMP dump-guest-memory
  target-arm: dump-guest-memory: add prfpreg notes for aarch64
  elf: add arm note types
  target-arm: dump-guest-memory: add vfp notes for arm

 dump.c                      | 131 ++++++++++-------
 include/elf.h               |   5 +
 include/sysemu/dump-arch.h  |   9 +-
 include/sysemu/dump.h       |  11 +-
 qapi-schema.json            |   4 +-
 qom/cpu.c                   |   4 +-
 target-arm/Makefile.objs    |   3 +-
 target-arm/arch_dump.c      | 336 ++++++++++++++++++++++++++++++++++++++++++++
 target-arm/cpu-qom.h        |   5 +
 target-arm/cpu.c            |   3 +
 target-arm/cpu.h            |  45 ++++++
 target-ppc/arch_dump.c      |   6 -
 target-ppc/cpu-qom.h        |   2 -
 target-ppc/translate_init.c |   1 -
 target-s390x/arch_dump.c    |   6 -
 target-s390x/cpu-qom.h      |   2 -
 target-s390x/cpu.c          |   1 -
 17 files changed, 487 insertions(+), 87 deletions(-)
 create mode 100644 target-arm/arch_dump.c

-- 
2.4.3

