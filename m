Received: by 10.25.77.65 with SMTP id a62csp45414lfb;
        Tue, 31 Jan 2017 09:08:29 -0800 (PST)
X-Received: by 10.200.34.28 with SMTP id o28mr28187140qto.269.1485882509808;
        Tue, 31 Jan 2017 09:08:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q186si12384932qkf.140.2017.01.31.09.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 09:08:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYbuv-00023L-42
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 12:08:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDE-00018f-J7
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYbDA-0001Dw-LB
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:23:20 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34540)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYbDA-0001Dr-FQ; Tue, 31 Jan 2017 11:23:16 -0500
Received: by mail-pf0-x243.google.com with SMTP id y143so28599266pfb.1;
	Tue, 31 Jan 2017 08:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tcIXhoni8V3eJxNXhYCQYI/3k8gqkpy7O7QVYpZTYNc=;
	b=C/L/4BmC/r//ezHSAKj8VPXzpbE5O8sYdTG3gBpqvzvEjS+ptRl2qF1W0+t/HM9FOR
	gX0PcDsLyHpA9tywEuJ45QLZ+A0hrFuX7+MoXjyzcRBBFaGw0r8maOf2H6RXDdqK7MYp
	3Fl+44z4Js3C2JRA1c23FMQ7a/rKFXS9dqyCwwkLUsh2bfCuMocdk3cKotIKLkdtDskh
	Xiqrh+3fOPSG747VGdu5CfuIPIJzoz+fjhmGEaMak0symZIX3JNB+1W1/VW/CfrSjbtM
	tV3nUVUetL45J5b0ofBSPzvrFZz2gWe0fP/oSqumtjz0NxPGwEuvUbw0PFYflWzUUgtE
	HkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tcIXhoni8V3eJxNXhYCQYI/3k8gqkpy7O7QVYpZTYNc=;
	b=Bsc9qdojJQVeX1fK8hZcSdG9raB4IbZkxMb1RWDpALlWtxTe+qeyvDXgrX+EfRTnmT
	nUSMvFZcNcfQr4ZAt75oq+jzuYEh/R5SHRHZIPit81jlPDMKu8pND7Q9WqOPpTijyNRc
	zYENj/jvB+4xJEtCx219n5uoSIEiah0ygJxt67+wpKBlEOVyJqL4sKXwEy/BebuNq/Ep
	H2+mP+GXmBIWAO8BGlcvslEmMSIycr2a3+Gq3h0ovE3tdFp0JCHntk1pSgaUmDN26ufC
	v3dsgXT5LM34UnjDxHyuTwIa01n2M0aV2939DN5SBeuojetEY+3MEfzbxLWoHZ3Pvc5Y
	/WYQ==
X-Gm-Message-State: AIkVDXLZ/qfcGGq+uJtMFAKPlmkzX5MZhwYVbJUJ6QZtENG65v+iuPwNIRA3Qdyx1Ndntw==
X-Received: by 10.84.248.10 with SMTP id p10mr40257018pll.87.1485879795540;
	Tue, 31 Jan 2017 08:23:15 -0800 (PST)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id
	z70sm42377261pff.26.2017.01.31.08.23.12
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:23:14 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:52:57 +0530
Message-Id: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v7 RESEND 0/5] GICv3 live migration support
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fIv+h7x0SA/G

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

 hw/intc/arm_gicv3_common.c         |   1 +
 hw/intc/arm_gicv3_kvm.c            | 640 ++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |   1 +
 include/hw/intc/arm_gicv3_common.h |   1 +
 linux-headers/asm-arm/kvm.h        |  12 +
 linux-headers/asm-arm64/kvm.h      |  12 +
 target-arm/cpu.h                   |   2 +
 7 files changed, 658 insertions(+), 11 deletions(-)

-- 
1.9.1

