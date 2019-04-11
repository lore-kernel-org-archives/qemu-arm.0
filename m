Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7332562wrx;
        Thu, 11 Apr 2019 08:43:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWjGTnEnCsQxzGjRR4+brIJy8HwmbdFjJuXw060ThmUqlKQNUaNkmiweEqAis3g9n3U2j6
X-Received: by 2002:a5d:494c:: with SMTP id r12mr31910127wrs.250.1554997384859;
        Thu, 11 Apr 2019 08:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554997384; cv=none;
        d=google.com; s=arc-20160816;
        b=nVsxbAgKeNsbaAC3ztlPTCbZgLUQRUp8QWyieTT6DjpjlDa+wXR/KvmhPynqi08aEh
         9p+/Gyd6n+NxmEcXSVYeVm12GZle3db4qd6OFVrn5jTJyC3rQd2sJNsYJcCDKS7X30uj
         +6xOXMcmbIAHPqhHTGbj+e9Pnw70Y5+4RUIeEt1AtCsQXFCLci24QNTmjizKeP/KwXHw
         VCKCX0ZSlRLf3NnH98Dplh3KreXEP6Dyw5zUe/hmgubTASqJ1cGZT4kmma0VLiWdjcIw
         1whK5Mb/jtIM2facYDXpdZ0mmiJZ0vzAtGtD65WfGK/KgRe/CVoODX+MDJ8hsakU9gdL
         sPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=DCRADAn52YQB0i1Vcag5VquhM34iiUI7ee/x7IVTB+I=;
        b=L21rPdSsFWOvADgld8FXk2nLfyucZurOIemG1LbP9oqi8E4dML8vIMUuHWDIgN8Dxh
         ukRhALVY29dlEFC099ZbBFFSoFVPkR2asg7OuFQmgPXqfqwjB3bMjPlppk0FdgAEL8CH
         9VSDqbKyGFm2CcR1bdRL2GXnY8lyp3W63NMUpm4z6Ow/dA7vQ87L1MLaAGbCU14SFaRP
         IhJ4OcQZkqzCqE3MsDQ1ZOjC8OZ+OgqwiAzCdfA2AohPID+7/PyIQjdDkXA/kIKnhc2U
         vjpj95H3c5lIWt9Fz1iSgO85vvX22WUecYRBKb/CTdoxybb9yh9ddREZdBUQ+0j4LGwO
         77KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w93VzOhj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si26034578wrp.64.2019.04.11.08.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 08:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w93VzOhj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEbqx-0003n9-PT
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 11:43:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEbnn-0001Io-Lh
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 11:39:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEbnm-0008EZ-EB
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 11:39:47 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hEbnm-0008E6-43
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 11:39:46 -0400
Received: by mail-wr1-x444.google.com with SMTP id r4so7947413wrq.8
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DCRADAn52YQB0i1Vcag5VquhM34iiUI7ee/x7IVTB+I=;
	b=w93VzOhjHNXoT40RlJkosHDhMfGSasHqeNuNb1iQ47/8o3D9mWd5aQktuA1FBfqTEX
	02CK4EMU5HiW4hOi3OYFVbezZWea8HueruYgLo5Fk76TxhuKhGtpKnbr/Sn1OedSCJ0x
	SalAIq0brIfMWylnXK+K9pRkJl4xPgRCiehFB8Ci5NC2QfQyUhBPeq3CZ6a9ZTNkkY6g
	/pKjXKRak0fVNlMM9/hpgt5p+ngxYWuTdrf71yI0XqRgLTZ12LsCAOlsMFQi4KzH3Y0C
	TqwbYtgfeyueWCQwnzsAc8r3Vn7D7p2UBy3dwsNreqIi3y27HQWDGj0CvIRNn4uENni1
	OTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DCRADAn52YQB0i1Vcag5VquhM34iiUI7ee/x7IVTB+I=;
	b=YorbY8YTT6vJ8bKvQN47Tc36MeTkzosOjUDRLgRYKlhuA049OBVROLCzZkR3IVPNXM
	qb5CuiwNep3kFrpwh+zPGWauXe4Du3S0c1SWE+JqgnYlQxMMK4jMAA+tJkqRPIZoVtUI
	OpiVTr83cA3FV/xySdujBsUvoE+erk5VC2rILsutjHcqIM0dFxRLeqVoymNg9yfZc/M4
	xbVAMbMqPFHm/1n1jOsqtRN5YgpFWK+BqmvKn3iJisCTz6o1EBIYSM8OSxEboRlzJSFv
	HvBoIPtC56g+tQo1rCUzerQv2Ls7fDz/aV1FgTl4dISOqUlZ6rON9kWzPVDXLt708U2Y
	IWCw==
X-Gm-Message-State: APjAAAW5TIS2ba/gycWH29DGoiktAZFMBJ7QGBdMV7GDamKuv/fqkr4t
	0Xlt270D4Rm6SBWSoT9LNUo8gGPbKrc=
X-Received: by 2002:adf:f68d:: with SMTP id v13mr31103487wrp.6.1554997184884; 
	Thu, 11 Apr 2019 08:39:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y132sm6932581wmg.38.2019.04.11.08.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 08:39:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 11 Apr 2019 16:39:42 +0100
Message-Id: <20190411153942.4533-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH] target/arm: Implement NSACR gating of floating
 point
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RSk4sgYeRw3W

The NSACR register allows secure code to configure the FPU
to be inaccessible to non-secure code. If the NSACR.CP10
bit is set then:
 * NS accesses to the FPU trap as UNDEF (ie to NS EL1 or EL2)
 * CPACR.{CP10,CP11} behave as if RAZ/WI
 * HCPTR.{TCP11,TCP10} behave as if RAO/WI

Note that we do not implement the NSACR.NSASEDIS bit which
gates only access to Advanced SIMD, in the same way that
we don't implement the equivalent CPACR.ASEDIS and HCPTR.TASE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I noticed we were missing NSACR handling here while looking at
M profile floating point, but it turns out that M profile NSACR
isn't really the same, so the two don't share code. This patch
fixes the A-profile NSACR handling. Note that this only affects
CPUs with an AArch32 EL3.

 target/arm/helper.c | 75 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a0dd1f99974..26105f13e70 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -903,9 +903,36 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         value &= mask;
     }
+
+    /*
+     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
+     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value &= ~(0xf << 20);
+        value |= env->cp15.cpacr_el1 & (0xf << 20);
+    }
+
     env->cp15.cpacr_el1 = value;
 }
 
+static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /*
+     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
+     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
+     */
+    uint64_t value = env->cp15.cpacr_el1;
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value &= ~(0xf << 20);
+    }
+    return value;
+}
+
+
 static void cpacr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     /* Call cpacr_write() so that we reset with the correct RAO bits set
@@ -971,7 +998,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     { .name = "CPACR", .state = ARM_CP_STATE_BOTH, .opc0 = 3,
       .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 2, .accessfn = cpacr_access,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.cpacr_el1),
-      .resetfn = cpacr_reset, .writefn = cpacr_write },
+      .resetfn = cpacr_reset, .writefn = cpacr_write, .readfn = cpacr_read },
     REGINFO_SENTINEL
 };
 
@@ -4656,6 +4683,36 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /*
+     * For A-profile AArch32 EL3, if NSACR.CP10
+     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value &= ~(0x3 << 10);
+        value |= env->cp15.cptr_el[2] & (0x3 << 10);
+    }
+    env->cp15.cptr_el[2] = value;
+}
+
+static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /*
+     * For A-profile AArch32 EL3, if NSACR.CP10
+     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     */
+    uint64_t value = env->cp15.cptr_el[2];
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value &= ~(0x3 << 10);
+    }
+    return value;
+}
+
 static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_IO,
@@ -4703,7 +4760,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
       .access = PL2_RW, .accessfn = cptr_access, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.cptr_el[2]) },
+      .fieldoffset = offsetof(CPUARMState, cp15.cptr_el[2]),
+      .readfn = cptr_el2_read, .writefn = cptr_el2_write },
     { .name = "MAIR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[2]),
@@ -12804,6 +12862,19 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         break;
     }
 
+    /*
+     * The NSACR allows A-profile AArch32 EL3 and M-profile secure mode
+     * to control non-secure access to the FPU. It doesn't have any
+     * effect if EL3 is AArch64 or if EL3 doesn't exist at all.
+     */
+    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
+        if (!extract32(env->cp15.nsacr, 10, 1)) {
+            /* FP insns act as UNDEF */
+            return cur_el == 2 ? 2 : 1;
+        }
+    }
+
     /* For the CPTR registers we don't need to guard with an ARM_FEATURE
      * check because zero bits in the registers mean "don't trap".
      */
-- 
2.20.1

