Received: by 10.182.158.201 with SMTP id ww9csp2002821obb;
        Thu, 19 Nov 2015 06:53:54 -0800 (PST)
X-Received: by 10.31.134.79 with SMTP id i76mr5402159vkd.51.1447944834383;
        Thu, 19 Nov 2015 06:53:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r192si4343973vke.105.2015.11.19.06.53.54
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 06:53:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzQav-00087E-T0
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 09:53:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZzQat-000879-HD
	for qemu-arm@nongnu.org; Thu, 19 Nov 2015 09:53:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZzQao-00010d-I0
	for qemu-arm@nongnu.org; Thu, 19 Nov 2015 09:53:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52313)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ZzQao-00010X-Aa; Thu, 19 Nov 2015 09:53:46 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 5E399C0BFBA9;
	Thu, 19 Nov 2015 14:53:45 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-106.ams2.redhat.com
	[10.36.116.106])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJEreNI000808; Thu, 19 Nov 2015 09:53:41 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 Nov 2015 09:53:32 -0500
Message-Id: <1447944817-13286-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH 0/5] target-arm: enable qmp-dump-guest-memory
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
X-TUID: Vdjwa1lc0fiF

This series brings qmp-dump-guest-memory to arm and aarch64
targets. I've detailed my testing and the results in the
following table.

arm/aarch64 kvm guest kdump testing (P - PASS, F - FAIL). Testing done
with a latest mainline crash utility patched with [*]

.-----------------------------------------------------------------------.
|				Host	| arm32	| arm64	| arm64	| arm64	|
|---------------------------------------|-------|-------|-------|-------|
|				Guest	| arm32	| arm64	| arm64	| arm32	|
|---------------------------------------|-------|-------|-------|-------|
|				Pagesize| 4K	| 4K	| 64K	| 4K	|
|=======================================================================|
| kdump in guest			| F[1]	| P[2]	| P[3]	| F[1]	|
|---------------------------------------|-------|-------|-------|-------|
| qmp-dump-guest-memory <filename>[4]	| P	| P	| P	| P	|
|---------------------------------------|-------|-------|-------|-------|
| qmp-dump-guest-memory -z <filename>[5]| F[8]	| P	| P	| F[8]	|
|---------------------------------------|-------|-------|-------|-------|
| qmp-dump-guest-memory -l <filename>[6]| F[8]	| P	| P	| F[8]	|
|---------------------------------------|-------|-------|-------|-------|
| qmp-dump-guest-memory -s <filename>[7]| F[8]	| P	| P	| F[8]	|
.-----------------------------------------------------------------------.

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

[*] https://www.redhat.com/archives/crash-utility/2015-November/msg00031.html

Andrew Jones (5):
  qapi-schema: dump-guest-memory: Improve text
  dump: qemunotes aren't commonly needed
  dump: allow target to set the page size
  dump: allow target to set the phys_base
  target-arm: support QMP dump-guest-memory

 dump.c                      | 129 +++++++++++++++----------
 include/sysemu/dump-arch.h  |   9 +-
 include/sysemu/dump.h       |  11 +--
 qapi-schema.json            |   4 +-
 qom/cpu.c                   |   4 +-
 target-arm/Makefile.objs    |   3 +-
 target-arm/arch_dump.c      | 222 ++++++++++++++++++++++++++++++++++++++++++++
 target-arm/cpu-qom.h        |   5 +
 target-arm/cpu.c            |   3 +
 target-ppc/arch_dump.c      |   6 --
 target-ppc/cpu-qom.h        |   2 -
 target-ppc/translate_init.c |   1 -
 target-s390x/arch_dump.c    |   6 --
 target-s390x/cpu-qom.h      |   2 -
 target-s390x/cpu.c          |   1 -
 15 files changed, 321 insertions(+), 87 deletions(-)
 create mode 100644 target-arm/arch_dump.c

-- 
2.4.3

