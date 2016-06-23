Received: by 10.25.21.96 with SMTP id l93csp575196lfi;
        Thu, 23 Jun 2016 08:12:35 -0700 (PDT)
X-Received: by 10.237.53.151 with SMTP id c23mr45925627qte.51.1466694755824;
        Thu, 23 Jun 2016 08:12:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b102si528872qkb.85.2016.06.23.08.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 08:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:37267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG6J1-0007pW-4e
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 11:12:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG6Iv-0007iy-HX
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 11:12:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bG6Ir-0003Xo-C9
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 11:12:29 -0400
Received: from forward14o.cmail.yandex.net ([37.9.109.194]:47016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bG6Ip-0003UN-SK; Thu, 23 Jun 2016 11:12:25 -0400
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [37.140.190.26])
	by forward14o.cmail.yandex.net (Yandex) with ESMTP id 8995921578;
	Thu, 23 Jun 2016 18:12:08 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (localhost [127.0.0.1])
	by smtp1o.mail.yandex.net (Yandex) with ESMTP id BEDEBDE014B;
	Thu, 23 Jun 2016 18:12:07 +0300 (MSK)
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	M14mKgTrSS-C7ciJADS; Thu, 23 Jun 2016 18:12:07 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1466694727; bh=spgNY90KM2Mtwn57vxoJVcwoWqfFC3pUuxJaaibga+M=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=k9NTPuJ8m+8LRLRqGYasI0Gn8alTNud+HLzz+yq/tz12uDspgWuhO5yKWtUMCVSfY
	qtLzDMDp5y6UTzlhd8d/A+lW6NblX8VvgcCpfhJzPiE18CuEyJ2jfGollBAeOZBWm+
	uFzsBkt/TlzjY/YlG3hCefpHHWj6yRAEEeq0Ome8=
Authentication-Results: smtp1o.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Thu, 23 Jun 2016 18:11:57 +0300
Message-Id: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.9.109.194
Subject: [Qemu-arm] [PATCH] target-arm: Add missed AArch32 TLBI sytem
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
X-TUID: YWEucbD+mAlA

Some PL2 related TLBI system registers are missed in AArch32
implementation. The patch fixes it.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 target-arm/helper.c | 148 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 35ff772..73c844f 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -572,6 +572,111 @@ static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    CPUState *cs = ENV_GET_CPU(env);
+
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        tlb_flush_by_mmuidx(cs, ARMMMUIdx_S12NSE1, ARMMMUIdx_S12NSE0,
+                            ARMMMUIdx_S2NS, -1);
+    } else {
+        tlb_flush_by_mmuidx(cs, ARMMMUIdx_S12NSE1, ARMMMUIdx_S12NSE0, -1);
+    }
+}
+
+static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    bool has_el2 = arm_feature(env, ARM_FEATURE_EL2);
+    CPUState *other_cs;
+
+    CPU_FOREACH(other_cs) {
+        if (has_el2) {
+            tlb_flush_by_mmuidx(other_cs, ARMMMUIdx_S12NSE1,
+                                ARMMMUIdx_S12NSE0, ARMMMUIdx_S2NS, -1);
+        } else {
+            tlb_flush_by_mmuidx(other_cs, ARMMMUIdx_S12NSE1,
+                                ARMMMUIdx_S12NSE0, -1);
+        }
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
+
+    tlb_flush_page_by_mmuidx(cs, value & TARGET_PAGE_MASK, ARMMMUIdx_S1E2, -1);
+}
+
+static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 uint64_t value)
+{
+    CPUState *other_cs;
+    uint64_t pageaddr = value & TARGET_PAGE_MASK;
+
+    CPU_FOREACH(other_cs) {
+        tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S1E2, -1);
+    }
+}
+
 static const ARMCPRegInfo cp_reginfo[] = {
     /* Define the secure and non-secure FCSE identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
@@ -1238,6 +1343,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbiasid_write },
     { .name = "TLBIMVAA", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
+    { .name = "TLBIALLNSNH",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiall_nsnh_write },
+    { .name = "TLBIALLNSNHIS",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiall_nsnh_is_write },
     REGINFO_SENTINEL
 };
 
@@ -3273,6 +3386,22 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimva_write },
     { .name = "TLBIMVAAL", .cp = 15, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
       .type = ARM_CP_NO_RAW, .access = PL1_W, .writefn = tlbimvaa_write },
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
@@ -3605,6 +3734,25 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
       .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[2]) },
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
+    { .name = "TLBIMVALH", .cp = 15, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbimva_hyp_write },
+    { .name = "TLBIMVALHIS",
+      .cp = 15, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbimva_hyp_is_write },
     { .name = "TLBI_ALLE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
       .type = ARM_CP_NO_RAW, .access = PL2_W,
-- 
1.9.3

