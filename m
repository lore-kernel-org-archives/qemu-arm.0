Received: by 10.25.44.15 with SMTP id s15csp1869054lfs;
        Thu, 27 Jul 2017 03:59:42 -0700 (PDT)
X-Received: by 10.237.32.41 with SMTP id 38mr5564284qta.68.1501153182867;
        Thu, 27 Jul 2017 03:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501153182; cv=none;
        d=google.com; s=arc-20160816;
        b=XHHIk6pw6tMl//h9m9UNTbWZ1dBh8nO3K8BqlOWBNpiqdfyj/rXOTxH9REo7g8GuAL
         Q3zYonrpmSctXVQ09MBHzVTLnIad199B1WTiFdWyM47nPp5CigpJimfj7cIo3ZE5fxu6
         ombAJMewkn/IrRN1iBj+HOWL7nt+n2OUFThJLRSe2MF1aY72cO7XbAQu9bpAoWwG5DvZ
         hfCwYTUk4naWD4WlmezUXSU4WnsgbpNh9O+zi1ktnLKtf+sf+wgH7qSS3nPT7Vr4Fay+
         0vq3Gu/q8oCJ6cP/JngEQa5NW7lapuhKlKxUag0iD17CG+Ae7Zlr5B1JrYC9VJC1NTKE
         tVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0P1+p/ybu7yRPhxKGm8K2Ws7peRvbF3x0dxJfEYdif8=;
        b=usklE7/rolYty1db2vuz9Lp0xbmQ0D2oYnzyTnMz/wMMqRg6HoB8SiKJ1X47D4iUg3
         lGyJxK4TKqotwiDPx7g81sr27byw8/4gLTc+BWReF+mnaEqUlF2gWaezY/yJ31uylB13
         d4SVyY4yR8rleKw8VOJWVBBf/zL4aOSSo++41+pDTYfRcYCCdDCzReB5uXYPujFn3/46
         oi7dPw4+sTYpeJtDkCf+tywn0/PWHKrn06FBNDDoTVMaT72VXr81mfV6ZKyr4fd7dd1s
         loWtwkkMjVVqeQM5uvHqp/9KSgp8e/s+6mTuhShuXZJqVAqOqMRsTLqCWNbvHFLL4urT
         eBKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si17043335qkt.272.2017.07.27.03.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 03:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dagW4-0006Sw-7D
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 06:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVl-0006HU-MY
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVk-0000EI-Oa
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:21 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dagVk-0008P0-H2; Thu, 27 Jul 2017 06:59:20 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dagVd-0003mN-9k; Thu, 27 Jul 2017 11:59:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 27 Jul 2017 11:59:09 +0100
Message-Id: <1501153150-19984-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10 4/5] target/arm: Move PMSAv7 reset into
 arm_cpu_reset() so M profile MPUs get reset
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z6Ip4cI43yMg

When the PMSAv7 implementation was originally added it was for R profile
CPUs only, and reset was handled using the cpreg .resetfn hooks.
Unfortunately for M profile cores this doesn't work, because they do
not register any cpregs. Move the reset handling into arm_cpu_reset(),
where it will work for both R profile and M profile cores.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c    | 14 ++++++++++++++
 target/arm/helper.c | 28 ++++++++++++----------------
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 96d1f84..05c038b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -232,6 +232,20 @@ static void arm_cpu_reset(CPUState *s)
 
     env->vfp.xregs[ARM_VFP_FPEXC] = 0;
 #endif
+
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V7)) {
+        if (cpu->pmsav7_dregion > 0) {
+            memset(env->pmsav7.drbar, 0,
+                   sizeof(*env->pmsav7.drbar) * cpu->pmsav7_dregion);
+            memset(env->pmsav7.drsr, 0,
+                   sizeof(*env->pmsav7.drsr) * cpu->pmsav7_dregion);
+            memset(env->pmsav7.dracr, 0,
+                   sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion);
+        }
+        env->pmsav7.rnr = 0;
+    }
+
     set_flush_to_zero(1, &env->vfp.standard_fp_status);
     set_flush_inputs_to_zero(1, &env->vfp.standard_fp_status);
     set_default_nan_mode(1, &env->vfp.standard_fp_status);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63187de..a9247e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2404,18 +2404,6 @@ static void pmsav7_write(CPUARMState *env, const ARMCPRegInfo *ri,
     *u32p = value;
 }
 
-static void pmsav7_reset(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    ARMCPU *cpu = arm_env_get_cpu(env);
-    uint32_t *u32p = *(uint32_t **)raw_ptr(env, ri);
-
-    if (!u32p) {
-        return;
-    }
-
-    memset(u32p, 0, sizeof(*u32p) * cpu->pmsav7_dregion);
-}
-
 static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                               uint64_t value)
 {
@@ -2433,22 +2421,30 @@ static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
+    /* Reset for all these registers is handled in arm_cpu_reset(),
+     * because the PMSAv7 is also used by M-profile CPUs, which do
+     * not register cpregs but still need the state to be reset.
+     */
     { .name = "DRBAR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, pmsav7.drbar),
-      .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
+      .readfn = pmsav7_read, .writefn = pmsav7_write,
+      .resetfn = arm_cp_reset_ignore },
     { .name = "DRSR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 2,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, pmsav7.drsr),
-      .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
+      .readfn = pmsav7_read, .writefn = pmsav7_write,
+      .resetfn = arm_cp_reset_ignore },
     { .name = "DRACR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 1, .opc2 = 4,
       .access = PL1_RW, .type = ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, pmsav7.dracr),
-      .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
+      .readfn = pmsav7_read, .writefn = pmsav7_write,
+      .resetfn = arm_cp_reset_ignore },
     { .name = "RGNR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW,
       .fieldoffset = offsetof(CPUARMState, pmsav7.rnr),
-      .writefn = pmsav7_rgnr_write },
+      .writefn = pmsav7_rgnr_write,
+      .resetfn = arm_cp_reset_ignore },
     REGINFO_SENTINEL
 };
 
-- 
2.7.4

