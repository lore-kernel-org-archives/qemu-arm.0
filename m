Received: by 10.25.77.65 with SMTP id a62csp23554lfb;
        Thu, 16 Feb 2017 22:32:43 -0800 (PST)
X-Received: by 10.55.128.65 with SMTP id b62mr6493822qkd.302.1487313163171;
        Thu, 16 Feb 2017 22:32:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e184si6867317qkc.72.2017.02.16.22.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 22:32:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cec5y-0001LP-K4
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 01:32:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5j-0001Am-5X
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cec5i-0005f3-Cz
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 01:32:27 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cec5i-0005eY-7N; Fri, 17 Feb 2017 01:32:26 -0500
Received: by mail-pf0-x243.google.com with SMTP id e4so3379960pfg.0;
	Thu, 16 Feb 2017 22:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l74g7ipXLddK10c+ibRRtqT0eFiOwB29KK25px5HQ5U=;
	b=IvsvUknaHK0gi90+HSkAidfHqWCrgwfYjjqkjuDBsCwoqls6Cgc0DFZOeWcGJxIrvQ
	hQqPYoK+2Ssc4pBoq2PFFFwurM6BOchmk0VkZCeknKRq27WWlfukas0KB8rCbqr5WwJu
	l7xoyL+f1gMeSXTqeIxywgr8OxEciXbKjCWk/Jrkl1H6f1/ZuZKTSpkq2rzjmm34KdVl
	2eYh2si8vb4SpyC8oaDJObAGHRhZ/4MLl4ppWOrjozZrnXTWFQHkqPXrlNhgabXWTIH/
	UWGoXFWA9gagSBVPO67aP136cjz2DD1oMAbqvuMgsx2/z2T2V45Os699xztexrPGPRuy
	g4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l74g7ipXLddK10c+ibRRtqT0eFiOwB29KK25px5HQ5U=;
	b=SJ5WJoWmjFJAroxwDqnklZBSiX58KBZhAS+ZMV+0n1Rqptx2cBb1JhyY/Xk8rRDl5W
	5HBcnPzzeZMzkS9NgAteIH80IOS9vBq42VzGwt10p5F0VZrWdR8uPnpMqcUb5/2LlIZD
	bJ/dyv5CxAzsbbgNgqdn4euk7/+By6O/WsuDB8ed6i0P9wXNG5WxAKBQT8B+ydpbHm6+
	UCtUWFOWKKQVCbtqNhwkXgkDb9Z2KkRiZe9ePHZN7w/RFdnAi4kmxNae7Z2+2FW/aKPA
	xPnZ1C09bVQKQblS1SKdGZFXiiuSyYMyDM/dEhY84rIPZj6d+BPCrdMBlp9pbcaGh/H3
	sIZA==
X-Gm-Message-State: AMke39nYIMz15DsedoPylfoIcqvod1BDBO5V4alfh+j0l8ZzIV2Na6wKzj8ydZD2UBXt5w==
X-Received: by 10.99.122.3 with SMTP id v3mr8083095pgc.31.1487313145325;
	Thu, 16 Feb 2017 22:32:25 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	89sm17074808pfo.40.2017.02.16.22.32.21
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 22:32:24 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Fri, 17 Feb 2017 12:01:52 +0530
Message-Id: <1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add ICC_SRE_EL1
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
X-TUID: QRvFLOJ7CLmG

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

To Save and Restore ICC_SRE_EL1 register introduce vmstate
subsection and load only if non-zero.
Also initialize icc_sre_el1 with to 0x7 in pre_load
function.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_common.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 16b9b0f..e62480e 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -70,6 +70,34 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
     }
 };
 
+static int icc_sre_el1_reg_pre_load(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+    /* By default enable SRE and disable IRQ & FIQ bypass. */
+    cs->icc_sre_el1 = 0x7;
+    return 0;
+}
+
+static bool icc_sre_el1_reg_needed(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+    return cs->icc_sre_el1 != 0;
+}
+
+const VMStateDescription vmstate_gicv3_cpu_sre_el1 = {
+    .name = "arm_gicv3_cpu/sre_el1",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_load = icc_sre_el1_reg_pre_load,
+    .needed = icc_sre_el1_reg_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3_cpu = {
     .name = "arm_gicv3_cpu",
     .version_id = 1,
@@ -100,6 +128,10 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_gicv3_cpu_virt,
         NULL
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gicv3_cpu_sre_el1,
+        NULL
     }
 };
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 4156051..bccdfe1 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -172,6 +172,7 @@ struct GICv3CPUState {
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
 
     /* CPU interface */
+    uint64_t icc_sre_el1;
     uint64_t icc_ctlr_el1[2];
     uint64_t icc_pmr_el1;
     uint64_t icc_bpr[3];
-- 
1.9.1

