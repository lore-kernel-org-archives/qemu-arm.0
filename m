Received: by 10.25.77.65 with SMTP id a62csp23503lfb;
        Thu, 16 Feb 2017 22:32:34 -0800 (PST)
X-Received: by 10.55.142.135 with SMTP id q129mr5751333qkd.83.1487313153961;
        Thu, 16 Feb 2017 22:32:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17si6878377qta.94.2017.02.16.22.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 22:32:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cec5p-0001C0-BR
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 01:32:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5f-000198-5o
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5b-0005bQ-7u
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:23 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:35020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cec5b-0005ag-1A; Fri, 17 Feb 2017 01:32:19 -0500
Received: by mail-pg0-x244.google.com with SMTP id y6so2992514pgy.2;
	Thu, 16 Feb 2017 22:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kJDBJ22q9A8ewHUBsZhFtD2Tp7yquCEN8qbIHiexvoE=;
	b=EXoofZLEoCPw0zEE7xovd6orJC0xi6CW3nod5ETerI6aMzNX7yCnM5eysKCFKDqKrs
	dL1zygzIqOjCHeZSRKpv1v7ggxoCv73Kju36euoVviVu1FZGpbA/5K4e0kgb5grMeIor
	+aICuxZE9cMy6ZrXgR5pnE2lCNYNdjDQgkMWzKv4mQXsvpa3XVWZXwYYj6XGRJr39BqO
	bj6D5SwaCKwBNnJzUhhBat+JGUbkblzKMiYc4JxV688V6tljWso6Zz+rXOdb4iLqD1Pg
	VT4uQG26dUnOmC8l4uLbS5Mn+OB+7vUkQbZq5gFrKfIea6MjH2tOFS7Bn4/9jKKyMlwY
	x+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kJDBJ22q9A8ewHUBsZhFtD2Tp7yquCEN8qbIHiexvoE=;
	b=Xxy8/XonEeyK4K7wHPt7wLW1Pvk+P36TFHtqOZnxWnSjCeeVd5PeCiZWMe8hyvSpJm
	+scKBnLnCAPi+htfLrgpYx4fxKl7VWbs+Ip4GoY5EGy3Fpzg6MP0wwDpnye3hNQT49nZ
	tIDBA35Af64hX8Kukjp7RPgBcuokyVzAUbmM1hw+2eDcVssnVDNMTU6TivPypDpfYnxT
	A+K9B2kpnZwnh+tjej0AOL2p6tIFyxT27ep/Cn5t0jtx/fQiz5Rz+0C4toEkiWkCa/5t
	2Wso3uUZWLLuayABzBrHBZlx0xg2Rhg1gLIaOpYowwIdZTUe5pkkch7xaubw8GdIKyFG
	IM8A==
X-Gm-Message-State: AMke39k29OvnLJYqgQyC0RNIPQPjNnoRP8rHzFhnAkXX4ufSL0bA/jmU+poU14lZ54oprA==
X-Received: by 10.98.137.73 with SMTP id v70mr7388313pfd.125.1487313137870;
	Thu, 16 Feb 2017 22:32:17 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	89sm17074808pfo.40.2017.02.16.22.32.14
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 22:32:16 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Fri, 17 Feb 2017 12:01:50 +0530
Message-Id: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v8 0/5] GICv3 live migration support
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
X-TUID: qbogiimGj+qN

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

 hw/intc/arm_gicv3_common.c         |  34 ++
 hw/intc/arm_gicv3_cpuif.c          |   8 +
 hw/intc/arm_gicv3_kvm.c            | 627 ++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |   3 +
 include/hw/intc/arm_gicv3_common.h |   1 +
 linux-headers/asm-arm/kvm.h        |  12 +
 linux-headers/asm-arm64/kvm.h      |  12 +
 target/arm/cpu.h                   |   2 +
 8 files changed, 685 insertions(+), 14 deletions(-)

-- 
1.9.1

