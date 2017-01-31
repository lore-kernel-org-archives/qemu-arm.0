Received: by 10.25.77.65 with SMTP id a62csp22809lfb;
        Tue, 31 Jan 2017 08:18:21 -0800 (PST)
X-Received: by 10.55.142.7 with SMTP id q7mr30108995qkd.104.1485879501499;
        Tue, 31 Jan 2017 08:18:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a188si12286448qkc.182.2017.01.31.08.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 08:18:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYb8O-0005Bt-QE
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 11:18:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawe-0002Sv-FQ
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:06:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawa-0005QH-EV
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:06:12 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:35821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYawa-0005Po-8g; Tue, 31 Jan 2017 11:06:08 -0500
Received: by mail-pf0-x243.google.com with SMTP id f144so28528143pfa.2;
	Tue, 31 Jan 2017 08:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eHfNRx0lYSFtG3IEr3bZ7BjoQAsVXy2tBjjdtQYOVh4=;
	b=XfXHWjtMRDswOw+WRc9tPRR778iKLJsOfwSOCdHwitxSNuoKoyNE3abwyjcbksQ+hH
	4dXJPrLQYqhVEEPuvo447BGfH/qXwzp/hQ6ntOjnTfdRwRU1s+F+FLb/iUci4YgwvTJ/
	kmg8D8Unq9AHMDeUJpG1fQyoHP2s1SsTuJPd2LhcMVs/faDijhoHy5SxUvBWBPQull/3
	mpCEpRLBFeLG6Km+UarfnrWlww0w4OEGvH5nTLGTPZ9KQzsYMVS22t4xWOdfh8Ir8Feo
	/nlUZrYoq7WC4OE/XRYHQz0foGZZFDxnOsQIATKX2T1aYS4AE5ck5fs+yVDXl9GoLZAo
	aiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eHfNRx0lYSFtG3IEr3bZ7BjoQAsVXy2tBjjdtQYOVh4=;
	b=H5z1SEW341h0zYbY1TXH2tuV5/vb5uFvFMJWQKci5H/EmObAznDulnfwtRxskl3ixT
	OGIL1+lGeedpGbI8JwBAon5DtRUgP8kuFRDDlr7tMhbwg7y1VnFZ3em+SjOaKjZCSdrL
	aBDu4P5SgvgVlpJChproMWS3Y8pgXLUGjbrHdYmhve0xYBEO/DHTKcNzxH3xpadwf0qe
	/03O9pyj75dp+nSCuIeZa9qTB/cEf9kVvh4d+p3a85Yv7YtZ4r+l1zWDcv9d5RmNIE7H
	w39a7jwGbKXXAii4uZ/5eH+pIx4Jh9kgGAKs1VIFW4PUy+6vT8C8Tw5ckY6LtaaVFX0/
	t1EQ==
X-Gm-Message-State: AIkVDXJXllfQt3LEczb5XFeBmuNltj5Hg61TRaqkpbl79qcS59AzcTpX9VXjWo/hUprRCg==
X-Received: by 10.99.45.133 with SMTP id t127mr31388125pgt.224.1485878765816; 
	Tue, 31 Jan 2017 08:06:05 -0800 (PST)
Received: from localhost.localdomain ([106.51.232.200])
	by smtp.gmail.com with ESMTPSA id
	b10sm42699837pga.21.2017.01.31.08.06.03
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:06:05 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:35:45 +0530
Message-Id: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v7 0/4] GICv3 live migration support
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
X-TUID: CEXkVpbjxXH1

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
 - Added patch to add icc_ctrl_el1 to vmstruct before live migration
   patch
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

Vijaya Kumar K (4):
  hw/intc/arm_gicv3_kvm: Add ICC_SRE_EL1 register to vmstate
  hw/intc/arm_gicv3_kvm: Implement get/put functions
  target-arm: Add GICv3CPUState in CPUARMState struct
  hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers

 hw/intc/arm_gicv3_common.c         |   1 +
 hw/intc/arm_gicv3_kvm.c            | 640 ++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |   1 +
 include/hw/intc/arm_gicv3_common.h |   1 +
 target-arm/cpu.h                   |   2 +
 5 files changed, 634 insertions(+), 11 deletions(-)

-- 
1.9.1

