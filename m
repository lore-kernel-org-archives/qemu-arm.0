Received: by 10.80.166.35 with SMTP id d32csp103196edc;
        Tue, 11 Oct 2016 10:10:39 -0700 (PDT)
X-Received: by 10.55.197.157 with SMTP id k29mr5020136qkl.217.1476205839007;
        Tue, 11 Oct 2016 10:10:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u70si1905095qka.42.2016.10.11.10.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 10:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu0Za-0002wt-A2
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 13:10:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0XZ-0001Bn-Eu
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0XY-00043s-E9
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XY-00043i-7E; Tue, 11 Oct 2016 13:08:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XM-000161-HY; Tue, 11 Oct 2016 18:08:20 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Oct 2016 18:08:12 +0100
Message-Id: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v3 0/7] Runtime pagesize computation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FyeC2J8MStq0

(I posted version 2 way back in June...)

The basic idea here is that:
 * the target CPU implementation has to opt into variable page size
   by defining TARGET_PAGE_BITS_VARY, and then calling
   set_preferred_target_page_bits() in its realize function
   with whatever the CPU as instantiated actually requires
 * the machine also has to opt in, by specifying a new MachineClass
   field which states the value they guarantee will be no greater
   than the preferred page size for any CPU they create
 * we finalize the decision about page size in cpu_exec_init_all()
   (and then later attempts to create CPUs which can't cope with
   that decision are failed)

I would ideally have liked to finalize things much later, but
this is in practice hugely difficult because so many things
(in particular all the address space/memory system code)
assume the target page size is known.

Note that setting minimum_page-bits for a machine is a migration
compatibility break (the RAM migration format assumes both sides
have the same idea of a page size). In v3 I have included a
patch which adds the target-page-bits to the migration stream
so that you get a reasonably nice error message if you try
to migrate between source and destination which disagree about
the page size.

This could in theory be extended to the user-mode binaries,
but for the moment I have just required them to define a
fixed TARGET_PAGE_BITS.


Patches 1-3 have been reviewed, so 4-7 are the interesting
ones.

REQUEST FOR TESTING/PERFORMANCE BENCHMARKING:

I have only very lightly tested these and haven't attempted
to measure performance at all. Further testing and
benchmarking reports are therefore welcome.

In particular I would like to know how much of an
effect on TCG performance the assert() in the definition
of TARGET_PAGE_BITS has, so comparisons of all three configs:
 * before this patchset (ie TARGET_PAGE_BITS compile time const)
 * with this patchset (with assert in TARGET_PAGE_BITS)
 * this patchset, but with the assert commented out


Changes v2->v3:
 * rebased
 * added new patch to migrate the page size if it's not the default
 * virt-2.7 and earlier machines stick with the old
   default page size to avoid a compat break
 * in patch 3, v_l1_size is pulled into a local when we're
   using it as a loop upper bound

thanks
-- PMM


Peter Maydell (4):
  cpu: Support a target CPU having a variable page size
  migration/savevm.c: migrate non-default page size
  target-arm: Make page size a runtime setting
  hw/arm/virt: Set minimum_page_bits to 12

Vijaya Kumar K (3):
  migration: Remove static allocation of xzblre cache buffer
  exec.c: Remove static allocation of sub_section of sub_page
  translate-all.c: Compute L1 page table properties at runtime

 exec.c                 | 47 ++++++++++++++++++++++++++++++---
 hw/arm/virt.c          |  4 +++
 include/exec/cpu-all.h |  9 +++++++
 include/hw/boards.h    |  7 +++++
 include/qemu-common.h  | 12 +++++++++
 migration/ram.c        |  4 ++-
 migration/savevm.c     | 49 ++++++++++++++++++++++++++++++++++
 target-arm/cpu.c       | 24 +++++++++++++++++
 target-arm/cpu.h       |  9 ++++---
 translate-all.c        | 71 ++++++++++++++++++++++++++++++++------------------
 vl.c                   | 10 +++++++
 11 files changed, 213 insertions(+), 33 deletions(-)

-- 
2.7.4

