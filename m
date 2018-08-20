Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp815663wrd;
        Mon, 20 Aug 2018 08:30:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzk8b9N+ycn/IqHqHmF0zsZWO9DCZZuE+jm6nE6W8iLLpg0vFMjbiGAbIHCrXQcMNIxUe2S
X-Received: by 2002:a0c:fa4e:: with SMTP id k14-v6mr34748720qvo.35.1534779043563;
        Mon, 20 Aug 2018 08:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534779043; cv=none;
        d=google.com; s=arc-20160816;
        b=Oum422qSnRV++d1Gwyt00gPjtTHOdILJZu4E7MNZL2LZlWg1lWp6o3zPZ7skQ4QWW4
         WHU6IFZDsKPQDwQsdBOj/Yugk0JpWCNLx4FTaKHjNwQKKrTKfHs6iag5rm/Q9Dks6C/e
         KdT5qD1A/mcG/QF19345Mr39Flt1NUIjnna5ndNsTswwJeueaRLP/oWqyrBc2X1UTWRI
         A+k/QSOMFTJtq5LVZyAQigtq9O/fz77v5PuimJG/ExDbztDwvpDsNAz0vkcu0X2YSnFJ
         ykl4SMET1OmzGCHe8y67cwPQFuaux6AhXFATkDL0aXS7dSTDo2akxSLfLcSezO81JCJj
         RRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=dTlAW1R75oI0ehvpJ9J2s5Toht/Nma1HKacyMIer5Ns=;
        b=NuPFuRDJDEgfBlXeeFQ3eeqimhqTRhRWmgGmE0IFWkk/Vznwl9DtQyJCi1k8WewcYi
         4EpLJSS4nd8uPToi9a89dITD7xP80Yq/XVz/VPwc/993dWQlPyUoaESfGs9I7YGVz7T9
         L1YmAS6vksvAqDfwn37SqCduOctwogU5hAyVWp3GNCNMkfnhYD3zpm6PBIyCr+FBk0Hs
         XnRHg+/8dWpgsW/FdF4+aD3xdLI7Qgu4q3ibu8vMfxZdrFqHCPnPtaByoXn5SZNG+34z
         0+SocAUMUlq8nsNNW1Sc17gROq/481FYgjaqPLmKQ4oVWF3iUHwU97adfQq39K6iBqnQ
         USTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q34-v6si1610975qkq.244.2018.08.20.08.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 08:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frm8g-0005V2-WC
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 11:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8R-0005T7-Bx
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8Q-00043S-EB
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44694)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frm8Q-00041d-63; Mon, 20 Aug 2018 11:30:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frm8O-0003YA-Mk; Mon, 20 Aug 2018 16:30:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 16:30:16 +0100
Message-Id: <20180820153020.21478-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
References: <20180820153020.21478-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 2/6] target/arm: Implement AArch32 HCR and HCR2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vQUPWJKuwb/P

The AArch32 HCR and HCR2 registers alias HCR_EL2
bits [31:0] and [63:32]; implement them.

Since HCR2 exists in ARMv8 but not ARMv7, we need new
regdef arrays for "we have EL3, not EL2, we're ARMv8"
and "we have EL2, we're ARMv8" to hold the definitions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes from v1: moved HCR2 definition to new regdef
arrays so we don't define it for ARMv7 CPUs
---
 target/arm/helper.c | 54 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 22547d8e739..9ff6778b3ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3754,11 +3754,11 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
       .access = PL2_RW,
       .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
-    { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
+    { .name = "HCR_EL2", .state = ARM_CP_STATE_BOTH,
       .type = ARM_CP_NO_RAW,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW,
-      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
       .access = PL2_RW,
@@ -3857,6 +3857,15 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Ditto, but for registers which exist in ARMv8 but not v7 */
+static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
+    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
+      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
+      .access = PL2_RW,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -3883,10 +3892,26 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
      * HCR_PTW forbids certain page-table setups
      * HCR_DC Disables stage1 and enables stage2 translation
      */
-    if ((raw_read(env, ri) ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
+    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
         tlb_flush(CPU(cpu));
     }
-    raw_write(env, ri, value);
+    env->cp15.hcr_el2 = value;
+}
+
+static void hcr_writehigh(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    /* Handle HCR2 write, i.e. write to high half of HCR_EL2 */
+    value = deposit64(env->cp15.hcr_el2, 32, 32, value);
+    hcr_write(env, NULL, value);
+}
+
+static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    /* Handle HCR write, i.e. write to low half of HCR_EL2 */
+    value = deposit64(env->cp15.hcr_el2, 0, 32, value);
+    hcr_write(env, NULL, value);
 }
 
 static const ARMCPRegInfo el2_cp_reginfo[] = {
@@ -3894,6 +3919,11 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_write },
+    { .name = "HCR", .state = ARM_CP_STATE_AA32,
+      .type = ARM_CP_ALIAS,
+      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
+      .writefn = hcr_writelow },
     { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
@@ -4128,6 +4158,16 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
+    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
+      .type = ARM_CP_ALIAS,
+      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
+      .access = PL2_RW,
+      .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
+      .writefn = hcr_writehigh },
+    REGINFO_SENTINEL
+};
+
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -5179,6 +5219,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         define_arm_cp_regs(cpu, vpidr_regs);
         define_arm_cp_regs(cpu, el2_cp_reginfo);
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            define_arm_cp_regs(cpu, el2_v8_cp_reginfo);
+        }
         /* RVBAR_EL2 is only implemented if EL2 is the highest EL */
         if (!arm_feature(env, ARM_FEATURE_EL3)) {
             ARMCPRegInfo rvbar = {
@@ -5211,6 +5254,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             };
             define_arm_cp_regs(cpu, vpidr_regs);
             define_arm_cp_regs(cpu, el3_no_el2_cp_reginfo);
+            if (arm_feature(env, ARM_FEATURE_V8)) {
+                define_arm_cp_regs(cpu, el3_no_el2_v8_cp_reginfo);
+            }
         }
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.18.0

