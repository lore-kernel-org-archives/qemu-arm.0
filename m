Received: by 10.25.77.65 with SMTP id a62csp22896lfb;
        Tue, 31 Jan 2017 08:18:33 -0800 (PST)
X-Received: by 10.237.62.44 with SMTP id l41mr28692500qtf.16.1485879513340;
        Tue, 31 Jan 2017 08:18:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f37si12261893qte.335.2017.01.31.08.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 08:18:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYb8a-0005OT-Nu
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 11:18:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawf-0002Tr-Du
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:06:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cYawc-0005R6-2m
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 11:06:13 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cYawb-0005Qj-TX; Tue, 31 Jan 2017 11:06:09 -0500
Received: by mail-pf0-x242.google.com with SMTP id 19so28470573pfo.3;
	Tue, 31 Jan 2017 08:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TYCBImyZNkx0E0I+UqndVhLqkWaD4AtCP3eImJOXMBs=;
	b=iXXHY82lQjRiYJ2rqX54a7AbBKJErYY4Y+8H2t0XWNYD+Y6SSq8nuQoY8jhMpptQTI
	taN/EXK+2djgtNgYynjdjgk3/l6m0nRf8ti7Oyuetkkn75Z+wkYTxHeNpKHgPwcnbmFX
	LoAesi9Ej64ItBiyeyNrTMM9so+vhye4/s1vSJjOBtdzCEHi1KmvcfR5q3LnLpbDznVW
	eTXVnHVnHu1SIGIvnlxcSFOQOElcQvUjnMyT03fCKJxDmpGg9vdSgXGp8OYdbao2ncQQ
	dn/dWq+Bwohnp8gbuR5k7WdXGVb0OIvJ7OvG42KlOsLs+4UrmMQO6y9Ds78rEyWO7BTP
	MrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TYCBImyZNkx0E0I+UqndVhLqkWaD4AtCP3eImJOXMBs=;
	b=d85pCQQWWBBtpcc0tYiG4bPuJ9+Wsm+eLKcgs7MH0t2zlHcUt16Z3eDuqaYaFfz6/H
	k1tojLLbr3sBmlYuyWDziiSYezvjrSdhkDOwtnSGcr7SIAtmtNav1ghhbXUfhY5Cit4T
	SzDOOsXN3XGQacUI6z7oAzXN7DHU4d/pUc4kE/j3FZhd67zuBEI0J6NQiwBjTFkx/Qwr
	A+hMsuPRoSnwtnflKGWBvWB6U4v7i1Y46cgTfEVNkpMXE0npfke2YDCvnCZuZSlElcD0
	OShI98X4LRsRgjRElkoCz+vFUvIbpqIQq6nlt0C/z8nrik6UpzVtLljp8xsYiSIIpFXV
	lTxw==
X-Gm-Message-State: AIkVDXKThRlYhfT6MXY82nvncJSCp1uaJQhIqy39zLyXvjFuKeirmBUt67BNZMF/Vre5yw==
X-Received: by 10.84.174.197 with SMTP id r63mr41163275plb.14.1485878769020;
	Tue, 31 Jan 2017 08:06:09 -0800 (PST)
Received: from localhost.localdomain ([106.51.232.200])
	by smtp.gmail.com with ESMTPSA id
	b10sm42699837pga.21.2017.01.31.08.06.06
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 08:06:08 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Tue, 31 Jan 2017 21:35:46 +0530
Message-Id: <1485878749-5641-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
References: <1485878749-5641-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v7 1/4] hw/intc/arm_gicv3_kvm: Add ICC_SRE_EL1
 register to vmstate
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
X-TUID: WiCZwxHQVBt1

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

To Save and Restore ICC_SRE_EL1 register Add ICC_SRE_EL1 register
to vmstate and GICv3CPUState struct.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_common.c         | 1 +
 include/hw/intc/arm_gicv3_common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 0f8c4b8..f3245d9 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -68,6 +68,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         VMSTATE_UINT32(gicr_igrpmodr0, GICv3CPUState),
         VMSTATE_UINT32(gicr_nsacr, GICv3CPUState),
         VMSTATE_UINT8_ARRAY(gicr_ipriorityr, GICv3CPUState, GIC_INTERNAL),
+        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
         VMSTATE_UINT64_ARRAY(icc_ctlr_el1, GICv3CPUState, 2),
         VMSTATE_UINT64(icc_pmr_el1, GICv3CPUState),
         VMSTATE_UINT64_ARRAY(icc_bpr, GICv3CPUState, 3),
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 341a311..183c7f8 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -166,6 +166,7 @@ struct GICv3CPUState {
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
 
     /* CPU interface */
+    uint64_t icc_sre_el1;
     uint64_t icc_ctlr_el1[2];
     uint64_t icc_pmr_el1;
     uint64_t icc_bpr[3];
-- 
1.9.1

