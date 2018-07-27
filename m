Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507049wru;
        Fri, 27 Jul 2018 02:55:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd2FHcsamon5wsofuCboE5GHiMllpP7heMlnelQRLfcir7PqJOwpSS62SSKVBHLCk+5tTFR
X-Received: by 2002:a37:3c8c:: with SMTP id j134-v6mr4935223qka.66.1532685321047;
        Fri, 27 Jul 2018 02:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685321; cv=none;
        d=google.com; s=arc-20160816;
        b=vFt/zesim5EGc4HUvxMkfXazE7/5LaLLjTGgZELGicmohWlxAJFiWIQLpz9XhOJpdb
         LABpFdWp2V1bVSGeiiXP4h2a6eppee5pwxf7O14E8DaqPWJ4HdsxTUhseyfC+5Kai6Fv
         a+Iz9sYztR9NLoqP4EPlNgfw4DrECp11NUW+QL2FkUZFVtmX16kMqBkmL0gMY9Z/RLss
         TpQBL3W8JvGjc4RePusJhk1zRBg9Ol8nR4J1Iynr8A0LkR79rslfKdzNfWtbfO1rzltK
         xNpvJaUDB0TJk83v/YrxPSXgWpQt7EfcuvlLOXoHJIYk6mxLt04XMdCwYxnJgQno2aTK
         nXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=8ysia57PoyTKL8WDZwG5xS/h7A/b/nOVnAgb1N8s9fE=;
        b=huAE0OMAaMp5dpP6qzZg6OnuU8cHkECm7iB/YrkJ44jxkHfmpVTRX+H/mn37Z/4g/b
         p4eY1ilkxHIiNpu2PAR7DJB4YO8mG7rWSEGQBDoVAmKDdJsaln9GHbSjukjB6sj2yerA
         AsxNzN4K98fKWfJStOTLGAH6thxnMtOitIc/0I0gIXVMNmzn3tEI/DzJ40iTa4awaLVj
         ut/ey2xiFKsH/an6uT6FOeoFquVJNeTa4j1jk6MZwOCSpcVN3Xb7g0rlfawXlL11QZDX
         fa8Psyg0hepAMTYjNcHwyOzR8NUUPTw4UGy0iNLjYP52W0e1+88Zk5hW4zdUnuAJpHqq
         SIMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vk3kAhuI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vk3kAhuI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=trkKgjfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i125-v6si3334408qkd.227.2018.07.27.02.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vk3kAhuI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vk3kAhuI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=trkKgjfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizSy-0003if-Cx
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003W7-FH
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSY-000688-GI
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00064A-19; Fri, 27 Jul 2018 05:54:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DE18C443548;
	Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685283;
	bh=wmQpZGlHuKxagHeUxmKZ1XmvsRAsvkeTs+1r3I3RBUU=;
	h=From:To:Cc:Subject:Date;
	b=vk3kAhuIyv+DaA66IdG0XA3vQiV+go2JYl1D0wLBzUi5TE/36QAPWmNkdnxti/AXh
	nI1ZeNWluZaJ2UCCm1OVecXFPA9oYMsj2+6evqmiLCpNWMEKaEiiK7jZiyH1SGBT6y
	LncTPeS5GfZavZ7dX3tCRh7cC875tpi30C/d0gLc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vk3kAhuI;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=trkKgjfX
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JfnRAi_z81J; Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 17699443485; Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685283;
	bh=wmQpZGlHuKxagHeUxmKZ1XmvsRAsvkeTs+1r3I3RBUU=;
	h=From:To:Cc:Subject:Date;
	b=vk3kAhuIyv+DaA66IdG0XA3vQiV+go2JYl1D0wLBzUi5TE/36QAPWmNkdnxti/AXh
	nI1ZeNWluZaJ2UCCm1OVecXFPA9oYMsj2+6evqmiLCpNWMEKaEiiK7jZiyH1SGBT6y
	LncTPeS5GfZavZ7dX3tCRh7cC875tpi30C/d0gLc=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B34C7400DC8;
	Fri, 27 Jul 2018 11:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685282;
	bh=wmQpZGlHuKxagHeUxmKZ1XmvsRAsvkeTs+1r3I3RBUU=;
	h=From:To:Cc:Subject:Date;
	b=trkKgjfX3FFTftTHbObbyn8wLYkPIcHF52msXSdsohC1unrsoWE5yvrlL9AEXFtTs
	FtE69ZCJqvG0R89A6jGjJc4N2KyZc6Z+B/x5K/OyHpvP1FIVKDBQaytjEvUeUg2LK7
	EmTfXKbgZl6TvsFNU+j741xcM+xkBt1/sZQbLMMo=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:01 +0200
Message-Id: <20180727095421.386-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 00/20] arm_gic: add virtualization extensions
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
X-TUID: EDLhdJG69JkI

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

v5:
  - Patch 7: dropped unreachable 'return NULL' [Peter]
  - Patch 12: reworked the way invalid vIRQ are handled. The
    specification being uncleared, I used real hardware to check our
    previous hypothesises. See commit message for the adopted behaviour.
    The main difference is that when EOIMode is true (EOI split is
    enabled), a write to V_EOIR never increments H_HCR.EOICount. [Peter]
  - Patch 14-15: fixed commit message regarding mirrored regions. [Peter]

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
 hw/intc/arm_gic.c                | 994 +++++++++++++++++++++++++------
 hw/intc/arm_gic_common.c         | 154 ++++-
 hw/intc/arm_gic_kvm.c            |  31 +-
 hw/intc/gic_internal.h           | 282 ++++++++-
 hw/intc/trace-events             |  12 +-
 include/hw/arm/virt.h            |   4 +-
 include/hw/arm/xlnx-zynqmp.h     |   4 +-
 include/hw/intc/arm_gic_common.h |  43 +-
 include/migration/vmstate.h      |   3 +
 12 files changed, 1393 insertions(+), 284 deletions(-)

--
2.18.0

