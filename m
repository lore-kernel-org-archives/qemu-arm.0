Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4775659wrt;
        Tue, 8 Jan 2019 08:31:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN77gMcJ510D+yLVYqpD4RST+IVqT5spS1dHA6YtcCB3INWq3gSNpqJi1ZdZ6GbyuY7KBDbb
X-Received: by 2002:a1c:c10f:: with SMTP id r15mr2314769wmf.27.1546965067716;
        Tue, 08 Jan 2019 08:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546965067; cv=none;
        d=google.com; s=arc-20160816;
        b=fFboeV+Fp1XdvJ2PNupkioCTYVAur0xJhpzR6VP6qHbiDTxHPiGOvQCUewQOg5S0nH
         9rMYCiJ4uwyODFGJriK0o0pGWsyf5jAHunqyPMCOVMpiO/9/mLSi/cb+1RNccsAHhC+R
         +br3LGaWRQE9MenUJoncb9YnTKHUDyUxU3w20GPeOkm4DXNjJMwnTUOGOiLkEYk9gXFk
         U2/TAmmXz6SZhCgRfbqVcA8Yr7KMJIYlVEB11qVSn+1SxydJVv2erwrasCV0XyMum37k
         6Es3zjh8fkL+8486+BKnCEpeCkUXMEsXZ9dxcPYBj2lwErP8XevnQ5DDdah+NPFBL6+v
         46VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=tVBDZIH4LGBduiNzI6RI1Bk43qY5icfsauGs6xKHS7A=;
        b=x57AHLvDUaY6MaZoGEPLiWK4kjKMErfARsN07/drMdjztrMBy/25bh/TEn3WlUwxW7
         /1x+8rd/ddL7JB3crkc750c1WasZgFHPlpqdmb6+KWxVfnhnrqwRCHF/0nsjFMlEo2YS
         AHODpFMumYdJnF8OMnP24Vw+JZz5n4WuKblOoIdoid5TAtZCVNoGB9NBwxfjA6Ol0Jc3
         /m1Ucvx3Y83idVtGA34RxAq/pwtmXyo1GGgO31XbaNaX3N6iX0Ezyd2GWdLn8ZxgdZO5
         deGo974m7UV8CxTopcO7kG6cpb0KHa2XSv0hjFWb7F96cdfu4mcoTxCoQ850oniLXPz4
         bZOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DGIBz0Vk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si39438328wri.426.2019.01.08.08.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 08:31:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DGIBz0Vk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gguHR-0002xv-N0
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 11:31:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGm-0002ly-Qj
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 11:30:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGb-0003ey-Cc
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 11:30:20 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gguGb-0003Zy-5E
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 11:30:13 -0500
Received: by mail-wm1-x341.google.com with SMTP id f188so5021550wmf.5
	for <qemu-devel@nongnu.org>; Tue, 08 Jan 2019 08:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tVBDZIH4LGBduiNzI6RI1Bk43qY5icfsauGs6xKHS7A=;
	b=DGIBz0VkDWcSuOvIwNLJ8yW/jRgATRKWF5EE6wl2O8DpQVxbcnFjZhKqSTTw6t1+wp
	F9q3RQ59UrMKS65IdstRyPh+SMxzcjrLvJuzaU4yBilPfm6+m1EQcWw3/5PaId/2gnOr
	4FFlUSm0df4fttlB4h1zuUyCIINXZY0L+1e9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tVBDZIH4LGBduiNzI6RI1Bk43qY5icfsauGs6xKHS7A=;
	b=LUsnovsk9rzEqgssu4sDa9ka3mIYoRBCsmjyss8lNASScwfplqGh+floLJC1XGKu7F
	OF7yFnhEvPyrHOXGpU68NnqdNeSkzmYHAJ/9XrcJj5HUAthC07N4dJwCAsg3vXpe9KjD
	iR2iIo1tLMD9z/tANH5+vPP9rKlMhTV3IZhxMfUX2+sC924z6rrfOPfHCoLqT4mZ1Ag1
	2SpL4huIfzxv/O9xztU95p/NZDEWs0rNHIPhVCn8PxlvVOe3qDeVDTEjUARg2vXGs01P
	F3TwskcAbvZgVcTND4PEPpjOpCy5iv1BSGm7RmmMJOsPiogmIPRdzyZ/hTZ5yevXNfR2
	FGgA==
X-Gm-Message-State: AJcUuke5LlQcZgiVXyORFNQ7fRSNYvxOWL+pk4Iw3fxYhCVcHGzadthx
	ukZGb2KfWETG3Cvay3eL491g+w==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr2344410wmi.10.1546965010821;
	Tue, 08 Jan 2019 08:30:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	x81sm11278839wmg.17.2019.01.08.08.30.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Jan 2019 08:30:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  8 Jan 2019 16:30:04 +0000
Message-Id: <20190108163008.7006-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH 0/4] tcg: support heterogenous CPU clusters
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
	"Emilio G . Cota" <cota@braap.org>, patches@linaro.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /+SzZKYDFc6H

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
 accel/tcg/cpu-exec.c      |  4 ++++
 accel/tcg/translate-all.c |  3 +++
 gdbstub.c                 | 48 ++++-----------------------------------
 hw/arm/xlnx-zynqmp.c      |  4 ++--
 hw/cpu/cluster.c          | 33 +++++++++++++++++++++++++++
 qom/cpu.c                 |  1 +
 9 files changed, 77 insertions(+), 46 deletions(-)

-- 
2.19.2

