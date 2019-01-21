Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6175869wrt;
        Mon, 21 Jan 2019 07:23:19 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7NViJRZl8/SiYUD0G9pUyQWPapqdJ5dKFKZibBz+qGqr9/t1FpCg/s2hrEYQQVtQYzSYyN
X-Received: by 2002:a1c:f909:: with SMTP id x9mr8074430wmh.108.1548084199848;
        Mon, 21 Jan 2019 07:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548084199; cv=none;
        d=google.com; s=arc-20160816;
        b=SELlcM87iMrJlnZyqsgHsNxqncKQvabFfrwNG9mNpTZAjztdwkops+tDr8yRYI+Z5D
         uFG8V1vIn8I2nzHlykvSncgVhUGu/lGCLZ9RNJdTNz/+EMQUERpFNjlbWSXQqi/rc074
         sBCHI+XFUfO03NPiuMMhw1bv1GHFtLfTVy/wBFxvxsNpdNV+qUNjHUgE4Vnd/h5QwWwX
         YYTQM0biGOMqdglIU5UU5hZpSE9Knk0NXlDz1DNXX699ZchZlV5TK8ZUTpnKSETAC1KC
         /V/2bYsTwzHaypShw7LdGYTWZGx9Olw8Y/IzK70CkWRN3LUbJ/k607r7m35FGGM/c9G5
         o61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=4MvUNGHV/vkBrZ+X/IxGZhQvVLqxEZ/wDaQURyKKI10=;
        b=hlFNvDn2GbPALb+STcU+mqJ7hM7t/I+wfMzsDj/Ux8lLqLnXeOzOBF6QPm5drRXoDc
         W5peoWNPN84ypHN7vzIH2qaoddqNHaUBoa/4J6yGKzhYWcDu8HvXqa0/GpShiquPEd4Y
         tGhDhQ+l+1XPeg9+xNxRUFlXqQ3O70YvA0D7qlsWU7Evvj9YP0Gn8m/UarKr/TglLtwp
         alOIrWARTbTgKl7CpuOWoJb2OWN9x2adRyBJ5KQJchFWhlbpdhi5VdWNMZaxJcUJLWEI
         CqTh3XAADaw0+51QMTy/d2/fTMoHYfsnq0ln+0g9597TswzQ/dWsdi5+6OSWtIePiksr
         +uxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YYBSO1Hk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w72si32953738wme.155.2019.01.21.07.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 07:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YYBSO1Hk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glbPy-0007x3-Q8
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 10:23:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPD-0007wx-Qq
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPA-0003sQ-FN
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:31 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54147)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glbP6-0003pw-Jy
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:27 -0500
Received: by mail-wm1-x341.google.com with SMTP id d15so11168190wmb.3
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4MvUNGHV/vkBrZ+X/IxGZhQvVLqxEZ/wDaQURyKKI10=;
	b=YYBSO1HkRLZHX3e/t1kJFHHrLKdyVGtQNG53v4fL5lgFz3B9/qQcTppFv0D2JlCGdz
	Vk0fH6kCNLUTqoU+FNc8DBzA0wcCCqzLiANdtnh8xV5//IaLZ/XFaf7lp/ZEIZUORQBy
	9py3INCm3op20AbQAah2+kqJujNzqEI+PsSRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4MvUNGHV/vkBrZ+X/IxGZhQvVLqxEZ/wDaQURyKKI10=;
	b=ORCXudWdnLi0tMTgzIR+nICFg9rfEdUr88XIaoI4jyQ/F5IfYcyY+Z0dKW4mJY0f5F
	8MiUACXXJ99352t1B/farDX9F1Cg79Vq7jNvig/XhJ7Zwh9mq1j3deiCaE6w6u1eqpkg
	+nainq/6kuB6ssXwHbGaBVpZX9/1oCYjnkVNIcB97xRc+atKmgafinyf6upx8sbBuZAy
	BmdGfnmiYpGbLRqLAv4j5Ye3HWoA2cr9P666uSyzf4VLrTSygDWypR236NeM+5H2Tlcm
	oM1FaePAtoOa9yhw9o7kkhAg/BuvFOSRA9CP0t7NUL1qdso/UY2DCZJOm1n9KADjbX1r
	V+7A==
X-Gm-Message-State: AJcUukfCPVPuFhZ8/baMCf0WvvoyZ4ZJOVisajTLLXIxnZedSiF/zWE+
	65a/QpVCeqp/ViIwpFssLkuTUw==
X-Received: by 2002:a1c:a6c2:: with SMTP id
	p185mr22943962wme.133.1548084141383; 
	Mon, 21 Jan 2019 07:22:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	o16sm128900134wrn.11.2019.01.21.07.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 07:22:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 15:22:14 +0000
Message-Id: <20190121152218.9592-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v3 0/4] tcg: support heterogenous CPU clusters
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nvBXextvCZzu

In the process of debugging my board code that uses this
feature, I realized I needed to support the CPU object
not being a direct child of the cluster object, which
also lead me to the object_child_foreach_recursive()
function which is a neater way to iterate children anyway.
I also figured out we could add an assert which catches
most "parenting CPU vs cluster realize ordering" bugs.

Only patch 2 has changed here, others are already reviewed.

Changes v2->v3:

 * allow CPU objects to be indirect children of the cluster;
   this is useful for ARMv7M, where the CPU object is a child
   of the armv7m container and the board code that sets up
   the cluster object only has the armv7m container object:
   this is done by using object_child_foreach_recursive()
   rather than an open-coded child iteration
 * add an assertion that the cluster has at least one CPU,
   which catches the easiest-to-make errors when creating
   and populating the cluster

Changes v1->v2:
 * just fixing a bug in patch 3 that meant we were
   accidentally never reusing TBs. Patch 3 is the only
   one that needs review.

Original cover letter included below for context.

thanks
-- PMM

Currently, TCG implicitly assumes that all CPUs are alike,
because we have a single cache of generated TBs and we
don't account for which CPU generated the code or is looking
for the TB when adding or searching for generated TBs.
This can go wrong in two situations:
 (1) two CPUs have different physical address spaces
     (eg CPU 1 has one lot of RAM/ROM, and CPU 2 has
     different RAM/ROM): the physical address alone is
     then not sufficient to distinguish what code to run
 (2) two CPUs have different features (eg FPU vs no FPU):
     since our TCG frontends bake assumptions into the
     generated code about the presence/absence of features,
     if a CPU with FPU picks up a TB for one generated
     without an FPU it will behave wrongly

This is unfortunate, because we already have one board in
the tree which has a heterogenous setup: the xlnx-zcu102.
This board has 4xCortex-A53 and 2xCortex-R5F. Although
most "normal" guest code doesn't run into this, it is
possible to demonstrate the bug with it. There's a test case
at http://people.linaro.org/~peter.maydell/xlnx-het.tgz
which arranges to run a fragment of code in AArch32 which
should behave differently on the two CPUs, but does not
(either the A53 gets the behaviour the R5 should have, or
vice-versa).

This patchset adds the "cluster ID" to the set of things
we include in the TCG TB hash, which means that the two
sets of CPUs in this board can no longer accidentally
get TBs generated by the other cluster. It fixes the
bug demonstrated by the test case.

Design notes:

 * Adding cluster ID to the hash is RTH's suggestion. It might
   also be possible to make each cluster have a TCGContext
   code generation context, and have the CPUs use the right
   one for the cluster, but that would be a lot more code
   rework compared to this approach.
 * I put the cluster number in the existing cflags, since
   we have plenty of spare bits there. If in future we
   need either more than 256 clusters (unlikely) or want
   to reclaim bits in the cflags field for some other
   purpose we can always extend our xxhash from 28 to 32 bytes.
   (I actually wrote the patch to do that before realising
   I didn't need it...)
 * The cluster object now fills in the CPU object's
   cluster_index field when the cluster object is realized.
   This imposes an ordering constraint that all CPUs must
   be added to a cluster before realizing the cluster. That's
   not a big deal, except that unfortunately QOM provides
   no way that I could find to enforce this. If anybody
   has a suggestion for a better approach that would be great.
   Patch 1 therefore makes sure our only current user of the
   cluster feature obeys the ordering constraint.
 * Patch 4 is a tidyup to the gdbstub code which is possible
   now that the CPUState struct has the cluster ID in it.

I believe that this fix is basically all we need to support
heterogenous setups (assuming of course that you just mean
"within an architecture family" like Arm, rather than
systems with say both an Arm and a Microblaze core in them).
The other things I have considered are:

 * code that calls cpu_physical_memory_read() and friends,
   uses address_space_memory, or otherwise assumes there's
   only a single view of "CPU memory": I sent some patches
   out before Christmas that fixed these in generic code
   like the monitor and disassembler. There are also some
   uses in target-arch or device-specific code, which I
   think we can in practice ignore unless/until we come to
   implement a board that is heterogenous and also uses those
   devices or target architectures.
 * handling of TB invalidation: I think this should Just Work,
   because tb_invalidate_phys_addr() takes an AddressSpace+hwaddr,
   which it converts into a ramaddr for (the badly misnamed)
   tb_invalidate_phys_page_range(). So the TB caching all works
   on ramaddrs, and if CPU 1 writes to some ram X that's mapped
   at physaddr A for it but at physaddr B for CPU 2, we will
   still correctly invalidate any TBs that CPU 2 had for code
   that from its point of view lives at physaddr B.
   Note that translate-all.c has a single l1_map[] structure
   which will have PageDesc entries for pages for all CPUs in
   the system. I believe this is OK because the only thing
   we use them for is TB invalidation.
 * dirty memory tracking: like TB invalidation, this is OK
   because it all works either on MemoryRegions or on ramaddrs,
   not on physaddrs.

Have I missed anything that we also need to fix ?

thanks
-- PMM

Peter Maydell (4):
  hw/arm/xlx-zynqmp: Realize cluster after putting RPUs in it
  qom/cpu: Add cluster_index to CPUState
  accel/tcg: Add cluster number to TCG TB hash
  gdbstub: Simplify gdb_get_cpu_pid() to use cpu->cluster_index

 include/exec/exec-all.h   |  4 +++-
 include/hw/cpu/cluster.h  | 24 ++++++++++++++++++++
 include/qom/cpu.h         |  7 ++++++
 accel/tcg/cpu-exec.c      |  3 +++
 accel/tcg/translate-all.c |  3 +++
 gdbstub.c                 | 48 ++++-----------------------------------
 hw/arm/xlnx-zynqmp.c      |  4 ++--
 hw/cpu/cluster.c          | 46 +++++++++++++++++++++++++++++++++++++
 qom/cpu.c                 |  1 +
 9 files changed, 94 insertions(+), 46 deletions(-)

-- 
2.20.1

