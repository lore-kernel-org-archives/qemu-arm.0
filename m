Received: by 10.182.158.201 with SMTP id ww9csp2404283obb;
        Tue, 24 Nov 2015 16:38:15 -0800 (PST)
X-Received: by 10.31.8.65 with SMTP id 62mr29908170vki.75.1448411895099;
        Tue, 24 Nov 2015 16:38:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h6si21018444vka.154.2015.11.24.16.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 16:38:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1O6A-0005VR-O4
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 19:38:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O68-0005Tx-8J
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1O63-0002Ct-7i
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:38:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a1O63-0002Cl-04; Tue, 24 Nov 2015 19:38:07 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 4C09643;
	Wed, 25 Nov 2015 00:38:06 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAP0c1rv014074; Tue, 24 Nov 2015 19:38:02 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 19:37:51 -0500
Message-Id: <1448411877-22019-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v2 0/6] target-arm: enable qmp-dump-guest-memory
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
X-TUID: LDEoSWC5A5Te

This series brings qmp-dump-guest-memory to arm and aarch64
targets. I've detailed my testing and the results in the
following table.

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


Andrew Jones (6):
  qapi-schema: dump-guest-memory: Improve text
  dump: qemunotes aren't commonly needed
  dump: allow target to set the page size
  dump: allow target to set the physical base
  target-arm: support QMP dump-guest-memory
  target-arm: dump-guest-memory: add fpregset notes

 dump.c                      | 131 ++++++++++-------
 include/sysemu/dump-arch.h  |   9 +-
 include/sysemu/dump.h       |  11 +-
 qapi-schema.json            |   4 +-
 qom/cpu.c                   |   4 +-
 target-arm/Makefile.objs    |   3 +-
 target-arm/arch_dump.c      | 347 ++++++++++++++++++++++++++++++++++++++++++++
 target-arm/cpu-qom.h        |   5 +
 target-arm/cpu.c            |   3 +
 target-ppc/arch_dump.c      |   6 -
 target-ppc/cpu-qom.h        |   2 -
 target-ppc/translate_init.c |   1 -
 target-s390x/arch_dump.c    |   6 -
 target-s390x/cpu-qom.h      |   2 -
 target-s390x/cpu.c          |   1 -
 15 files changed, 448 insertions(+), 87 deletions(-)
 create mode 100644 target-arm/arch_dump.c

-- 
2.4.3

