Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2952873wrt;
        Mon, 14 Jan 2019 03:56:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ELB1KOFM5hE44DFCBx7NwKx03bZnXXzZWvcjf9ipRUfkupuOamFVF2LRjq7FSkb+nRD5d
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr24542403wrj.107.1547467016192;
        Mon, 14 Jan 2019 03:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547467016; cv=none;
        d=google.com; s=arc-20160816;
        b=JzPTCcFlv+9JqtKn6FN28F6KnY9DP2p+2z8y7zS3a6O/pbxG3AU7VgV15EHCwPbaxD
         LZDuSyciHuQLnG7YZBl6z4Fg6FOBPiXOTagp2Q82SXhUBdRZY06VKqMIJAIRAe+HgOR/
         eEfoxqmWEtKumCWrjpwWgUQ7RKMg87OduzQK9Bf0xItGwpwZ1pDu5d8cY7cd+GFM862J
         XPTRuBGlKpuaWbfiXlba3s7puG5ucUltsTlTVqdsLgZ9K92Hx/dxypyG9LUwIj+2aU4/
         YQLuFhdX90kQlH3WFZ9Bf5DvvsBKRXSltJeezrVXqYmzcr2LynlDtZNUOtw9ticxy1Fh
         31Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=JJr1C7xnGnYQ9yTznPJqg/6XqVIgZuUV+lI4IdS1fkg=;
        b=gRmNQC6HiD0TNn2/XbIh9EKiTrZbOnYIDck/Hlhu4xRr/rwg72tfUpo/E5b2LpmhSg
         YqDLzwnP6KU4mMyLxAF8c/fMZ1UAVM6leCu9bjJH3+hc7u/lTes8ByqkytC/ZHIio6TC
         fijIqWmb7WJCwC7U0ZFA7I/catrTYVZioqVpypysLdYtACm3urMdg+QGLacd0G6T2G2k
         qhCLvlMhvnvrGi2giQ7d9TlNJysZ5Eb5xAxZQIjHSm0EqzWzL7XDZkcwBoo+J2Nps504
         5UMSiC4optPhp3LdCOBBXIcX/AVusbthiLVtWWgPdi4vdpOwubj2Rt+kMhax9XcYio+A
         foRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Htag7P//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si19523761wmc.18.2019.01.14.03.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 03:56:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Htag7P//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj0rP-0006WL-6N
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 06:56:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rE-0006WB-Os
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:56:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rC-0005pA-AA
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:56:44 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gj0rC-0005oY-1z
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:56:42 -0500
Received: by mail-wr1-x444.google.com with SMTP id v13so22499604wrw.5
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JJr1C7xnGnYQ9yTznPJqg/6XqVIgZuUV+lI4IdS1fkg=;
	b=Htag7P//Pdt/NoM0cfb3lmZpmJaZf9R9v+gIYddkeY/AlBYRBGgIZ6gh2CtlhGyIi4
	IOaBHhXg7nfrZJ2Brua0NN1zf/uld0ltxHPCqds/Qyhh9N+/ggMqwc+Yjfxm1PtqsiBp
	P7B13qKlH5ESmcYdPhDtHo7Awz9qBbx7uA50M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JJr1C7xnGnYQ9yTznPJqg/6XqVIgZuUV+lI4IdS1fkg=;
	b=C/x4kL6lE5OAgPYTBd0xa6jX6l314/wNTHeGb4MzdnfSuUQjybMC4/UzTwXz5+ByTl
	dGfOptknGTqUw4c21sbZttV/VCrZlCQasSMiiu5U19tUqE6qACFlzzU0uf3R/n6MAOq6
	yuxpd6TUZ06Jx1NHAC2IKL32YHvXcl7KaCafoB/cGMpLnTJzYoWNy4ebUxAzeFHBXFNt
	fxoGfLZzUfSGxKAFElQS5bCN4BK5Z4Rb6TU+qca7yWdlXnApHxLEAv0NTdzbHzPjjcqG
	9P21+u9Dh1Hzx81qzh+O7xCDvlSiCXV5BnQGpfl9k26gvyyHtx2We+n6atofQhiSArwh
	iFeg==
X-Gm-Message-State: AJcUukekVpHgXBge4/yjt6MA/jw09HwIpZCv2nGdD24QvgtDC+9DLe0+
	xAt9hFt6RrRIGHhVajE6x6NgM9Bh0fwZKA==
X-Received: by 2002:adf:c042:: with SMTP id c2mr24930786wrf.158.1547467000666; 
	Mon, 14 Jan 2019 03:56:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	125sm47835842wmm.26.2019.01.14.03.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jan 2019 03:56:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 11:56:33 +0000
Message-Id: <20190114115637.6335-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH v2 0/4] tcg: support heterogenous CPU clusters
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zVpU4kdmMzqK

Changes v1->v2:
just fixing a bug in patch 3 that meant we were
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
 include/hw/cpu/cluster.h  | 19 ++++++++++++++++
 include/qom/cpu.h         |  7 ++++++
 accel/tcg/cpu-exec.c      |  3 +++
 accel/tcg/translate-all.c |  3 +++
 gdbstub.c                 | 48 ++++-----------------------------------
 hw/arm/xlnx-zynqmp.c      |  4 ++--
 hw/cpu/cluster.c          | 33 +++++++++++++++++++++++++++
 qom/cpu.c                 |  1 +
 9 files changed, 76 insertions(+), 46 deletions(-)

-- 
2.20.1

