Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649815wrq;
        Sat, 14 Jul 2018 10:17:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfEB3vaKUlt8OcWI7NtTQ1DCSe2Vj0ZSEdD9B65NUfhm+aXROTYNSy4L7fNamsZWcBUls68
X-Received: by 2002:ac8:318e:: with SMTP id h14-v6mr10040354qte.36.1531588642860;
        Sat, 14 Jul 2018 10:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588642; cv=none;
        d=google.com; s=arc-20160816;
        b=e5UzyDf0L8EZDMRb4ERsdbuvwVW+XAl0uKvdVo4Bckkb0qo5+3/zpAberq0sShYjHC
         gO1iKEqrTbGt1v3VwDzB1/HiJUln/TbTpBG7FBiXqS+4PvcuOVVZRYMY1AJx8b530Z0q
         gPM0mcWGVnqjmZrYbV2DVY2DripCDPjjIEOMeoYKtoSzvjKKfa4LapiHcHogiHaWKpTU
         vltdGcy9+Ls3CHBQ7zcixwV9yaUrP0zCD5nASqZyenozWWiOnLyvOxN/GQ+TMIGeE/It
         7aHzCqqj8ImDYhQhCenlmHeJIZgraOOrHggbPBToPaZ2oX8+byHBgQOKdTwuBrZbDekA
         ViBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=CbToDPFt8a689GlWV3P9zqUDDCQK+Ke4oPYVgr4p5hE=;
        b=PMqHtBBYVhB+t+DkES/FG5Kvf+yQaGRIum924qjIvtlSISzIE0Or/ywqOBNhzY+Dkj
         4w6wfsFHCzgzn0MJuLJlwIDLe3qEUpw9vENGXMTuM6GQi0qSWxL8cGdAq8ryGzTz/o5S
         jZ5FSnDSfxexdBjC3c5D2fn4JMsJUImLFpVewLyyWmh46VjlXJizyVqyBY+vb2cp8m6u
         bcBGX2FIzC0d3KvJc7z3reqnvF8W7VLgFiv7Dn750dszp7hzuufAf3UzQ6DF5unchNnl
         jeeDQ5nSejVPUWuiY8kGzrsg6ec4FbBg4txNXU9gxCNFszCWOB+SdxszaMgau4CtZC1N
         58uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sk5Y1oyh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sM9gzi7L;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sM9gzi7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p52-v6si21768781qtb.230.2018.07.14.10.17.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sk5Y1oyh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sM9gzi7L;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=sM9gzi7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAc-0006Fw-As
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005k9-Bg
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004Pq-2Q
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9i-0004MO-Ml; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 8A497C7AFB;
	Sat, 14 Jul 2018 19:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588575;
	bh=rzwf9XC/FWQtDrHxhPsqndCwPLFk54kxRSL/yLimrp8=;
	h=From:To:Cc:Subject:Date;
	b=sk5Y1oyh4R16ZagykQuFigUWeMzSDJl60UxbzCudUC1TucLPHlVmGcpUFU+Qq3vH3
	ehO+iRZEgxvZonfIeeCUsaMddeErv5QTbqnAt0AJwFDfCnpACMaxeERayPN/1L/TAy
	LVhBlMbo6PRWqEjvnlToNPvH+0E+m7OgErjSvPmo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sM9gzi7L;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sM9gzi7L
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTeeqKTx76MI; Sat, 14 Jul 2018 19:16:14 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B12C5C7AE3; Sat, 14 Jul 2018 19:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588574;
	bh=rzwf9XC/FWQtDrHxhPsqndCwPLFk54kxRSL/yLimrp8=;
	h=From:To:Cc:Subject:Date;
	b=sM9gzi7LxQrWvrC1jDcWEcUCzI67wMwzTHMrrK86xQAZJpbw7md+VurD9VHA11mAs
	LGvmEof8F9/WgE1444QzetlUGE8wOGq47W+odEaUbz5qQN7UeNcil33JY/2dFCKJsz
	fQhYySXcMFqzfw8DhA4Apg1OeAKzzQ2nvfh2VPvY=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E62D6C7ADD;
	Sat, 14 Jul 2018 19:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588574;
	bh=rzwf9XC/FWQtDrHxhPsqndCwPLFk54kxRSL/yLimrp8=;
	h=From:To:Cc:Subject:Date;
	b=sM9gzi7LxQrWvrC1jDcWEcUCzI67wMwzTHMrrK86xQAZJpbw7md+VurD9VHA11mAs
	LGvmEof8F9/WgE1444QzetlUGE8wOGq47W+odEaUbz5qQN7UeNcil33JY/2dFCKJsz
	fQhYySXcMFqzfw8DhA4Apg1OeAKzzQ2nvfh2VPvY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:41 +0200
Message-Id: <20180714171601.5734-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 00/20] arm_gic: add virtualization extensions
 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FyIzq1HgY/To

v2:
  - Add VMSTATE_UINT16_SUB_ARRAY to vmstate.h
  - Keep backward compatibility on the GIC VMState by storing vCPUs
    state in the virt VMState subsection.
  - Use h_apr to store APR value for vCPUs, instead of increasing apr 2D
    array. This adds a little complexity to the implementation (a bunch
    of `if (gic_is_vcpu(cpu))'), but avoid ugly VMState description for
    the apr array.

v3:
  - Remove the LR caching mechanism as it is probably not worse it.
  - Remove the forced secure access hack and replace it with a proper
    check (commit 8, function gic_cpu_ns_access()).
  - Split the Implementation patch for easier review.
  - Misc modifications following the review from Peter on v2.
  - Add GICv2 virt extensions support to the arm virt machine.
  - Fix vCPU running prio not being recomputed after a write to H_APR.
  - Fix group0 hw interrupts deactivation request not being forwarded to
    distributor when the GIC is not secure.
  - Implement GICD_ISACTIVERn and GICD_ICACTIVERn because KVM uses them.

v4:
  - Patch 2: check GICD_ISACTIVERn and GICD_ICACTIVERn access (exist
    only in GICv2) [Peter]
  - Patch 2: moved after patch 1 to ensure compilation success across
    patches [Peter]
  - Patch 2: implement GICD_ICACTIVERn reads on GICv2 [Peter]
  - Patch 7: Integrated Peter rational about LRs helpers, added
    comments to explain what's going on [Peter]
  - Patch 9: gic_clear_active(): check that the given PhysicalID is a
    valid IRQ [Peter]
  - Patch 10: refactor to move out the virt cases for more clarity [Peter=
]
  - Patch 12: Add a validity check on the given vIRQ [Peter]
  - Patch 14: Fix a comment on memory region creation [Peter]
  - Patch 14: Fix per-core alias creation, that should target the
    virtual interfaces, and not the vCPU interfaces [Peter]
  - Patch 16: gic_update_internal(): Move the CPU interface enable test
    in gic_irq_signaling_enabled() [Peter]
  - Patch 17: Stylistic [Peter]
  - Patch 20: Rebase onto master
  - Patch 20: Merge the two GIC maintenance IRQ constants into one
    [Peter]
  - Patch 20: Fix Memory region size for GICv2 virtual interface and
    vCPU iface. [Peter]

Luc Michel (20):
  intc/arm_gic: Refactor operations on the distributor
  intc/arm_gic: Implement GICD_ISACTIVERn and GICD_ICACTIVERn registers
  intc/arm_gic: Remove some dead code and put some functions static
  vmstate.h: Provide VMSTATE_UINT16_SUB_ARRAY
  intc/arm_gic: Add the virtualization extensions to the GIC state
  intc/arm_gic: Add virtual interface register definitions
  intc/arm_gic: Add virtualization extensions helper macros and
    functions
  intc/arm_gic: Refactor secure/ns access check in the CPU interface
  intc/arm_gic: Add virtualization enabled IRQ helper functions
  intc/arm_gic: Implement virtualization extensions in
    gic_(activate_irq|drop_prio)
  intc/arm_gic: Implement virtualization extensions in
    gic_acknowledge_irq
  intc/arm_gic: Implement virtualization extensions in
    gic_(deactivate|complete_irq)
  intc/arm_gic: Implement virtualization extensions in
    gic_cpu_(read|write)
  intc/arm_gic: Wire the vCPU interface
  intc/arm_gic: Implement the virtual interface registers
  intc/arm_gic: Implement gic_update_virt() function
  intc/arm_gic: Implement maintenance interrupt generation
  intc/arm_gic: Improve traces
  xlnx-zynqmp: Improve GIC wiring and MMIO mapping
  arm/virt: Add support for GICv2 virtualization extensions

 hw/arm/virt-acpi-build.c         |   6 +-
 hw/arm/virt.c                    |  52 +-
 hw/arm/xlnx-zynqmp.c             |  92 ++-
 hw/intc/arm_gic.c                | 967 +++++++++++++++++++++++++------
 hw/intc/arm_gic_common.c         | 154 ++++-
 hw/intc/arm_gic_kvm.c            |  31 +-
 hw/intc/gic_internal.h           | 283 ++++++++-
 hw/intc/trace-events             |  12 +-
 include/hw/arm/virt.h            |   4 +-
 include/hw/arm/xlnx-zynqmp.h     |   4 +-
 include/hw/intc/arm_gic_common.h |  43 +-
 include/migration/vmstate.h      |   3 +
 12 files changed, 1370 insertions(+), 281 deletions(-)

--=20
2.18.0

