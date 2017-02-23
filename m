Received: by 10.25.0.147 with SMTP id 141csp171826lfa;
        Thu, 23 Feb 2017 04:17:56 -0800 (PST)
X-Received: by 10.237.33.143 with SMTP id l15mr1823730qtc.222.1487852275979;
        Thu, 23 Feb 2017 04:17:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f36si3146466qtb.305.2017.02.23.04.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 04:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgsLJ-0002lU-9r
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 07:17:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgs9p-0007j4-8N
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 07:06:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgrvz-0004ZK-5A
	for qemu-devel@nongnu.org; Thu, 23 Feb 2017 06:51:44 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cgrvv-0004Yk-OG; Thu, 23 Feb 2017 06:51:39 -0500
Received: by mail-pg0-x241.google.com with SMTP id 5so4352010pgj.0;
	Thu, 23 Feb 2017 03:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AXtrVIE0NlRHiJ6whcw762bfLbsKPWt4xO1G/qPxZ/U=;
	b=NlIMmRRXXLZT+ZrhmkETGPkXS1fZNY5Ih+bGjHAv3onDEpqmklOVlUbf9ADrFq5a46
	2bgODQy38iKrBNeCQdRdpnwFaPVGOHR/VWOz4OXGxbUsxBsjgF3ATTy9bwjgH3yXkNtB
	A7JGSCFbXNK1L3fFcxKpl1LL9ehznD/9cSm9KHZrvuwMTeDqrSQAy3YI9dbxJIKslzhw
	xfLMEBYhSEe+z7MUQMSzSPcUkGmSBaTobOWi+NTcA/6294OvP8G821iwADhVJxzrsT2o
	mPz8+5KdDbmkYdPumXFisE6sN4rB9N6Cu7BdOlUKUKIQBHNRrZdp+MlgeeN/c/DIyXLo
	oLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AXtrVIE0NlRHiJ6whcw762bfLbsKPWt4xO1G/qPxZ/U=;
	b=tDwWlePX5hv5yz1a3JfLSNyk2QJ7bIljFD1HRJVyaxOltP6k4M1ejhHIgrQPyKaVb0
	b95IyGKOSYGaHJd4ytI1UEk/+hOH1fFg48nFbTppRkgEl3AiPeDEbKBMHgdTDP/luELg
	/o1/GX9m3OhBqeenIuW+NCNiK9rVvWzcG04Xojoq01ZuHDt3oMkV2Gzb4+0VLEmj05pO
	hqOoxk7yiBlelsXCuEK5gXLHXODhyadgxDyePq5/Xkv3mScesVMdEkvmWmDBqewVU/cH
	Q2f889Rp09qBfYvxRZWLvWLvn9743qZK8ckUmlQzPD7fyEcNivRPSRSaHoyAujOdPlIm
	cjMw==
X-Gm-Message-State: AMke39l8NYSb2Wl92Zru9PN+kXnoLvc+ppyxQjvZppbvYjL7oW0r0HRhTHSIA1EgvIXRxA==
X-Received: by 10.99.234.83 with SMTP id l19mr48379038pgk.114.1487850698485;
	Thu, 23 Feb 2017 03:51:38 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm9462026pfg.53.2017.02.23.03.51.34
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 03:51:37 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Thu, 23 Feb 2017 17:21:08 +0530
Message-Id: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH v9 0/5] GICv3 live migration support
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1lGd/mssCr96

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This series introduces support for GICv3 live migration with
new VGIC implementation in 4.7-rc3 kernel.
In this series, patch 1 of the previous implementation
are ported.
https://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg05284.html

Patch 2, is based on below implementation.
http://patchwork.ozlabs.org/patch/626746/

Latest kernel patches
https://www.spinics.net/lists/arm-kernel/msg558046.html

This API definition is as per version of VGICv3 specification
in linux kernel Documentation/virtual/kvm/devices/arm-vgic-v3.txt

Tested Live migration of Idle VM running with 4 VCPUs and 8GB RAM.

v8 => v9:
 - Updated icc_sre_el1_reg_needed() return condition to
   cs->icc_sre_el1 != 0x7;
 - Dropped assert in arm_gicv3_icc_reset()
 - Added comments at required places

v7 => v8:
 - Introduced vmstate subsection to add icc_ctrl_el1 register to
   VMStateDescription
 - Introduced new function gicv3_set_gicv3state() in arm_gicv3_cpuif.c
   to update gicv3state variable in CPUARMState struct.
 - Used arm_cp_read_zero & arm_cp_write_ignore for ARMCPRegInfo[].

v6 => v7:
 - Rebased on top of v2.8.0-rc4 release.
 - Added patch to add icc_ctrl_el1 to vmstruct before live migration
   patch.
 - Added patch to add gicv3state variable to CPUARMState struct to
   store GICv3CPUState pointer.
 - Added patch to register ARMCPRegInfo[] struct and reset on CPU reset.

v5 => v6:
 - Added separate patch for Reseting ICC* register
 - Added seperate patch for save and restore of ICC_CTLR_EL1
 - Dropped translate_fn mechanism and coded open functions
   for edge_trigger and priority save and restore.
 - Save and Restore APnR registers based on ICC_CTLR_EL1.PRIBITS

v4 => v5:
 - Initialized ICC registers before reset.

v3 => v4:
 - Reintroduced offset GICR_SGI_OFFSET
 - Implement save and restore of ICC_SRE_EL1
 - Updated kvm.h header file in sync with KVM v4 patches

v2 => v3:
 - Dropped offset GICR_SGI_OFFSET
 - Implement save/restore of irq line level using
   KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO
 - Fixed bug with save/restore of edge_trigger
Vijaya Kumar K (5):
  kernel: Add definitions for GICv3 attributes
  hw/intc/arm_gicv3_kvm: Add ICC_SRE_EL1 register to vmstate
  hw/intc/arm_gicv3_kvm: Implement get/put functions
  target-arm: Add GICv3CPUState in CPUARMState struct
  hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers

 hw/intc/arm_gicv3_common.c         |  38 +++
 hw/intc/arm_gicv3_cpuif.c          |   8 +
 hw/intc/arm_gicv3_kvm.c            | 629 ++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |   3 +
 include/hw/intc/arm_gicv3_common.h |   1 +
 linux-headers/asm-arm/kvm.h        |  12 +
 linux-headers/asm-arm64/kvm.h      |  12 +
 target/arm/cpu.h                   |   2 +
 8 files changed, 691 insertions(+), 14 deletions(-)

-- 
1.9.1

