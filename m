Received: by 10.25.21.156 with SMTP id 28csp368859lfv;
        Tue, 12 Jul 2016 06:08:46 -0700 (PDT)
X-Received: by 10.37.5.13 with SMTP id 13mr1331269ybf.95.1468328926506;
        Tue, 12 Jul 2016 06:08:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h186si2479021qkd.278.2016.07.12.06.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 06:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:40414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMxQb-0001ky-JR
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 09:08:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMxQV-0001kd-NN
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 09:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMxQQ-000099-Fe
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 09:08:38 -0400
Received: from forward19j.cmail.yandex.net ([5.255.227.238]:45503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bMxQO-000069-VY; Tue, 12 Jul 2016 09:08:34 -0400
Received: from smtp11.mail.yandex.net (smtp11.mail.yandex.net
	[IPv6:2a02:6b8:0:801:1::10])
	by forward19j.cmail.yandex.net (Yandex) with ESMTP id 76116213C4;
	Tue, 12 Jul 2016 16:08:17 +0300 (MSK)
Received: from smtp11.mail.yandex.net (localhost [127.0.0.1])
	by smtp11.mail.yandex.net (Yandex) with ESMTP id 72E517E0362;
	Tue, 12 Jul 2016 16:08:17 +0300 (MSK)
Received: by smtp11.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	0VQOALi2Uq-8GUmkfoM; Tue, 12 Jul 2016 16:08:16 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1468328896; bh=mfHJK0WxArwSsgmHKXaSh1iKsM/Xj3lj8Mzg2UPu7GA=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=RSF1zOQ9x1TvTB6A6Zm/fLPypTE59Yc84VfzMI5HFVPUQuLpCFR9t9Lvxozq8j+hj
	MOeHj6C5zijswn1aY/fHvvSUEPsPu4/3jpQRwQKR5St8UVA58o667URKSSt6vsUzX5
	l7kAh8mL8MIoI58AU5r/LaGtN5NCIUkE/aGa7f8w=
Authentication-Results: smtp11.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jul 2016 16:08:05 +0300
Message-Id: <1468328885-3217862-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.238
Subject: [Qemu-arm] [PATCH v2] target-arm: Add missed AArch32 TLBI sytem
 registers
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W8QL9pEcHiT7

Some PL2 related TLBI system registers are missed in AArch32
implementation. The patch fixes it.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
In the second version of the patch some new system registers
was moved into another groups. Some write functions was
slightly changed.
 target-arm/helper.c | 139 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 1f9cdac..bdb842c 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -572,6 +572,102 @@ static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    CPUState *cs = ENV_GET_CPU(env);
+
+    tlb_flush_by_mmuidx(cs, ARMMMUIdx_S12NSE1, ARMMMUIdx_S12NSE0,
+                        ARMMMUIdx_S2NS, -1);
+}
+
+static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    CPUState *other_cs;
+
+    CPU_FOREACH(other_cs) {
+        tlb_flush_by_mmuidx(other_cs, ARMMMUIdx_S12NSE1,
+                            ARMMMUIdx_S12NSE0, ARMMMUIdx_S2NS, -1);
+    }
+}
+
+static void tlbiipas2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    /* Invalidate by IPA. This has to invalidate any structures that
+     * contain only stage 2 translation information, but does not need
+     * to apply to structures that contain combined stage 1 and stage 2
+     * translation information.
+     * This must NOP if EL2 isn't implemented or SCR_EL3.NS is zero.
+     */
+    CPUState *cs = ENV_GET_CPU(env);
+    uint64_t pageaddr;
+
+    if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 & SCR_NS)) {
+        return;
+    }
+
+    pageaddr = sextract64(value << 12, 0, 40);
+
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdx_S2NS, -1);
+}
+
+static void tlbiipas2_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    CPUState *other_cs;
+    uint64_t pageaddr;
+
+    if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 & SCR_NS)) {
+        return;
+    }
+
+    pageaddr = sextract64(value << 12, 0, 40);
+
+    CPU_FOREACH(other_cs) {
+        tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S2NS, -1);
+    }
+}
+
+static void tlbiall_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    CPUState *cs = ENV_GET_CPU(env);
+
+    tlb_flush_by_mmuidx(cs, ARMMMUIdx_S1E2, -1);
+}
+
+static void tlbiall_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 uint64_t value)
+{
+    CPUState *other_cs;
+
+    CPU_FOREACH(other_cs) {
+        tlb_flush_by_mmuidx(other_cs, ARMMMUIdx_S1E2, -1);
+    }
+}
+
+static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    CPUState *cs = ENV_GET_CPU(env);
+    uint64_t pageaddr = value & ~MAKE_64BIT_MASK(0, 12);
+
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdx_S1E2, -1);
+}
+
+static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 uint64_t value)
+{
+    CPUState *other_cs;
+    uint64_t pageaddr = value & ~MAKE_64BIT_MASK(0, 12);
+
+    CPU_FOREACH(other_cs) {
+        tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S1E2, -1);
+    }
+}
+
 static const ARMCPRegInfo cp_reginfo[] = {
     /* Define the secure and non-secure FCSE identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
@@ -3273,6 +3369,29 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_write },
     { .name = "TLBIMVAAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
+    { .name = "TLBIMVALH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbimva_hyp_write },
+    { .name = "TLBIMVALHIS",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbimva_hyp_is_write },
+    { .name = "TLBIIPAS2",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_write },
+    { .name = "TLBIIPAS2IS",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_is_write },
+    { .name = "TLBIIPAS2L",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_write },
+    { .name = "TLBIIPAS2LIS",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_is_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .type = ARM_CP_NOP, .access = PL1_W },
@@ -3605,6 +3724,26 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
       .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
+    { .name = "TLBIALLNSNH",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiall_nsnh_write },
+    { .name = "TLBIALLNSNHIS",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiall_nsnh_is_write },
+    { .name = "TLBIALLH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiall_hyp_write },
+    { .name = "TLBIALLHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiall_hyp_is_write },
+    { .name = "TLBIMVAH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 1,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbimva_hyp_write },
+    { .name = "TLBIMVAHIS", .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbimva_hyp_is_write },
     { .name = "TLBI_ALLE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-- 
1.9.3

