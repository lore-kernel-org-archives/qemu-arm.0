Received: by 10.25.0.147 with SMTP id 141csp169213lfa;
        Thu, 23 Feb 2017 04:11:29 -0800 (PST)
X-Received: by 10.200.38.196 with SMTP id 4mr33584994qtp.96.1487851889733;
        Thu, 23 Feb 2017 04:11:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2si3154675qtb.68.2017.02.23.04.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 04:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgsF5-0005Ia-4D
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 07:11:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgs9o-00081t-Pd
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 07:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cgrw3-0004Zs-8g
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 06:51:48 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cgrw3-0004Zn-3L; Thu, 23 Feb 2017 06:51:47 -0500
Received: by mail-pg0-x242.google.com with SMTP id z128so4337144pgb.3;
	Thu, 23 Feb 2017 03:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QWhIXKkdVzUdy3DWBiyOV0BSW6uQv+ncYk5eDFC5i24=;
	b=r0EpDtjubCNh577qaKTPdI2bWrEKKiM0c4oV7f1FMzfvZmg5Ly8SbT+W434Rhe2Q9H
	/9iNuL0nVu2m2gWiDn+MHb7+OZy2dixn3fv038z5BG9dK328WnHWsE7f9XRlCvPJfnoA
	XKb8p/FdMKZS7QclVMgZoXprDx+1kLBUj0qAqpRz3eurLr6FiFo5xAtYuFNzJFKCwdWc
	5M/5QZ2yyLNOJcZH3K0Jm7NlaVqfah/V9ABI+0nLw6ljLlNE5br6Fv71eUWg7PUM7PhU
	5V61D/QdfdDlcis0gbIGP4WXUIv8D3w/AAXFTdU9oMyZnsRCS5o2pNp+qVIDT4xmD5m0
	hW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QWhIXKkdVzUdy3DWBiyOV0BSW6uQv+ncYk5eDFC5i24=;
	b=a+iWW51D+WWQ2jXnoCCabEKjj6dHqqXqGotdDvpwHDoegx4skdvVzuEUWzKHDml0FE
	21LYgL70YV/NuNtoQGRs1KGOMFcOu8ABsmlIU8ZvEtj0jhM/F94OVdHn4AEe0QLHPEZZ
	1hhVpQPJEniGYWNE78GJ3pkN7Hj3/AW7jpQJlmEb/2ayD46fy3CE+dU8+R2fmOs0Zu8P
	2E0MSwltq6s5PKtuk4Uw1ntJ/3c1kIOoYbk01sB6FHYBmSERPW9dtp1g1LxrOlorXbsu
	SGFOcaHpd3YYQSZFwp696DZ9ShbIV78U0xCK8IHHU1P8maZzF4bx1zaBhmoTA2FaQ+aT
	NmnA==
X-Gm-Message-State: AMke39mZ9miBhlZxXPiEfoeiCeqOsOF6lZ1sY6HFY+iC/QsYZEOSXXZgUI9U45VxXy2eFg==
X-Received: by 10.99.100.69 with SMTP id y66mr32801737pgb.103.1487850706129;
	Thu, 23 Feb 2017 03:51:46 -0800 (PST)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm9462026pfg.53.2017.02.23.03.51.42
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 03:51:45 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, christoffer.dall@linaro.org,
	eric.auger@redhat.com
Date: Thu, 23 Feb 2017 17:21:10 +0530
Message-Id: <1487850673-26455-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v9 2/5] hw/intc/arm_gicv3_kvm: Add ICC_SRE_EL1
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
X-TUID: lHGgWte9+pGY

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

To Save and Restore ICC_SRE_EL1 register introduce vmstate
subsection and load only if non-zero.
Also initialize icc_sre_el1 with to 0x7 in pre_load
function.

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 hw/intc/arm_gicv3_common.c         | 36 ++++++++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 16b9b0f..5b0e456 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -70,6 +70,38 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
     }
 };
 
+static int icc_sre_el1_reg_pre_load(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+   /*
+    * If the sre_el1 subsection is not transferred this
+    * means SRE_EL1 is 0x7 (which might not be the same as
+    * our reset value).
+    */
+    cs->icc_sre_el1 = 0x7;
+    return 0;
+}
+
+static bool icc_sre_el1_reg_needed(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+    return cs->icc_sre_el1 != 7;
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
@@ -100,6 +132,10 @@ static const VMStateDescription vmstate_gicv3_cpu = {
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

