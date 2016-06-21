Received: by 10.25.21.96 with SMTP id l93csp2053424lfi;
        Tue, 21 Jun 2016 10:09:56 -0700 (PDT)
X-Received: by 10.55.50.14 with SMTP id y14mr30100777qky.42.1466528996580;
        Tue, 21 Jun 2016 10:09:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29si664043qks.36.2016.06.21.10.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 10:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFPBT-00049l-Lf
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 13:09:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBM-00047v-9U
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBK-000466-2h
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:47 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBJ-00044f-Qr; Tue, 21 Jun 2016 13:09:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPB9-00024H-C9; Tue, 21 Jun 2016 18:09:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 18:09:28 +0100
Message-Id: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 0/6] Runtime pagesize computation
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Ys2XD9oMzy1

This set of patches is a development based on the ones from Vijaya:
the general idea is similar but I have tried to improve the interface
for defining the page size a bit.  I've also tweaked patches 2 and 3
to address code review comments.

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
have the same idea of a page size). Mismatches will probably
result in an unhelpfully obscure migration failure. (Possibly we
could have the migration send the page size if it was different
from TARGET_PAGE_BITS_MIN so we at least got a nice error?)

This could in theory be extended to the user-mode binaries,
but for the moment I have just required them to define a
fixed TARGET_PAGE_BITS.

NB: I have only very lightly tested these and haven't attempted
to measure performance at all. There is an assert() in the
definition of TARGET_PAGE_BITS which is good for making sure
it isn't used before it's valid but not so good for speed.

thanks
-- PMM


Peter Maydell (3):
  cpu: Support a target CPU having a variable page size
  target-arm: Make page size a runtime setting
  hw/arm/virt: Set minimum_page_bits to 12

Vijaya Kumar K (3):
  migration: Remove static allocation of xzblre cache buffer
  exec.c: Remove static allocation of sub_section of sub_page
  translate-all.c: Compute L1 page table properties at runtime

 exec.c                 | 47 ++++++++++++++++++++++++++++++++---
 hw/arm/virt.c          |  2 ++
 include/exec/cpu-all.h |  8 ++++++
 include/hw/boards.h    |  7 ++++++
 include/qemu-common.h  | 13 ++++++++++
 migration/ram.c        |  4 ++-
 target-arm/cpu.c       | 24 ++++++++++++++++++
 target-arm/cpu.h       |  9 ++++---
 translate-all.c        | 67 +++++++++++++++++++++++++++++++++-----------------
 vl.c                   | 10 ++++++++
 10 files changed, 160 insertions(+), 31 deletions(-)

-- 
1.9.1

