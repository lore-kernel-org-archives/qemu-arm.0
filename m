Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp824830lfy;
        Tue, 4 Aug 2020 12:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8+0wz9/VeVWSaffJp5rSlxAplYfwTVfRV7otgAjBdj/rBMGCt+yKRB2qLzbU+M2Us2x1W
X-Received: by 2002:a25:f20d:: with SMTP id i13mr35420638ybe.152.1596569962099;
        Tue, 04 Aug 2020 12:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596569962; cv=none;
        d=google.com; s=arc-20160816;
        b=Mn4hJ9nrM/siDAZBpDfa4MnrLwxgH+WQTMnOpVPbFzPRtwhad1d3fbKngORKLj6HXw
         SKCWjBqwnwagfHK+cArPjKLwXZv/rjb+ToG6C7naMx3Vala5hq/wU3+gD6tscBmjr2TF
         MJewCRbc2NrVWZmL3BC3Cb+9eoVPRZ/XcvJLxZ80L739q5PF7RBxVJtzTluY2DVd0S0D
         afrUvMILD78Yl+PZcizawAfeygL3AtcbM6ntk03r1dsvJV3aBvpMMwJIehrk23nwpyMc
         YoX4mnlvc/2I6JLLgY7CYjPchPaLsWgY+5M6fIIGfCFmbGBCaTnIjHtQCJ3XlPD6qiag
         A8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=HqGbC8FUGCeQi5R5J6OQwzhAXNsqzsV2csRohNKrHYc=;
        b=TBWvlrsHsNLwmQ0axyYcxrIwJssM9JAHZpFXx4vkdxTFh3NJdel4JvgIvo7zSHeHT4
         kdNIUiWd+LficQ7V7TvEANesGoWxNSDiz9jeSMxYzcP0tkUdI/cO+Wtc20jtrnrZAzbR
         41IKEFPL9yA36SocZ0qoJ1ezTMJHMQb1oNBzVVwqE8EMizC03yI+ietDqNOPmk3iC4cD
         JqcX+dv+8ZobPQTvt3ggQwewWCNGoPy6d9rnbBuPfiC0LeJa0eHCg/e5BOzAHYOM8N+q
         mAv+yavROIQSQ5C0veejPaOf4JdwVjVjZgsZyzUCVY1zHbVdmrkiwctKZm7716wHg/ni
         6ASA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T7OmZzjs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si3653523yba.196.2020.08.04.12.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 12:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T7OmZzjs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k32mP-0007tD-9a
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 15:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k32mF-0007sv-Vq
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 15:39:12 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k32mC-0008RN-A7
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 15:39:11 -0400
Received: by mail-wm1-x343.google.com with SMTP id 184so4064263wmb.0
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqGbC8FUGCeQi5R5J6OQwzhAXNsqzsV2csRohNKrHYc=;
 b=T7OmZzjsZOt2UJirFFWl2tuE85uH9Z1J5MLHCIpJYroWA1nXXFm4zS4iNudk7+dL5W
 uXpuFbe1zm8RF9FHAYBsgeHOSvrPv8AJ7mFqzyZYp9vKjex/3zvONSle9h+oBg5RJLom
 XZ9b8co57pSnQ2CVt7yFbTCBvV3c/2Q3KxTjXYLWMD69STwiqOZQ/vgHr/IAre2Af/4Z
 7IGK3rGf2RJYk7FbxdKavZ02ab4HDlHlSD1f6kDPNM3TYFVymR9Dn1QmdE0GchNHNQ88
 +D3VbGpUQYfN3QUN4IWSqDNmXiJ017EKfDUh6C+Kd9PLP8QT2u3ija0XXhppKa3la54Q
 DUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqGbC8FUGCeQi5R5J6OQwzhAXNsqzsV2csRohNKrHYc=;
 b=HCw49ZL+K/Mrq1H0QGSZEBJz0d66twcUU4X6VeYkGlZziW0zgq0R0mzmuJZTR7zqJh
 zbR2+zlFRD+xKjff7m9v+oST0SQg9HGJUgrC0EdyWCSNBteVo3+5aaD8XYg0wk+XJRrS
 6ETW0Pqvz+AKv7QnoFjnSrcxFbiWIcGk8dBnv9TfoL2xj2iv5LfLx9c1H8C58Jm0u5qO
 wQeaCmLp7DmExYucv0ajE/P59j4+RIkB5ExzMrFPc+g1yvSORr0a9iphT/gDYRDXqxfr
 jm/Xq+464RbnhoR8e1QhF63/6vb+1PoG9GJ3oeVu1p4gE6rkZO2NawXKT4lmgdamCpQD
 uZww==
X-Gm-Message-State: AOAM532UuRmoUaWfPUJC3UEHtXOuUhkxirfvfMz3tFgU3PAsqERJw8L1
 ErUqOAC+b9en6WPSeiXrW85mKeNJI1NPtg==
X-Received: by 2002:a1c:27c1:: with SMTP id n184mr52220wmn.6.1596569945632;
 Tue, 04 Aug 2020 12:39:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b203sm6023388wmc.22.2020.08.04.12.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 12:39:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 for-5.1?] target/arm: Fix Rt/Rt2 in ESR_ELx for copro traps
 from AArch32 to 64
Date: Tue,  4 Aug 2020 20:39:03 +0100
Message-Id: <20200804193903.31240-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>, Julien Freche <julien@bedrocksystems.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lp9UHa1wgmoX

When a coprocessor instruction in an  AArch32 guest traps to AArch32
Hyp mode, the syndrome register (HSR) includes Rt and Rt2 fields
which are simply copies of the Rt and Rt2 fields from the trapped
instruction.  However, if the instruction is trapped from AArch32 to
an AArch64 higher exception level, the Rt and Rt2 fields in the
syndrome register (ESR_ELx) must be the AArch64 view of the register.
This makes a difference if the AArch32 guest was in a mode other than
User or System and it was using r13 or r14, or if it was in FIQ mode
and using r8-r14.

We don't know at translate time which AArch32 CPU mode we are in, so
we leave the values we generate in our prototype syndrome register
value at translate time as the raw Rt/Rt2 from the instruction, and
instead correct them to the AArch64 view when we find we need to take
an exception from AArch32 to AArch64 with one of these syndrome
values.

Fixes: https://bugs.launchpad.net/qemu/+bug/1879587
Reported-by: Julien Freche <julien@bedrocksystems.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2: fixed the register mapping for LR (thanks to
Julien for testing v1, diagnosing the bug in it, and suggesting
the fix to LR handling)

Marc: Cc'd you just in case you're interested, given that I'd
expect running Linux aarch64 KVM in QEMU emulation with a 32-bit
guest to hit this bug...
---
 target/arm/helper.c | 92 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ef0fb478f4..455c92b8915 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9581,6 +9581,66 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
     take_aarch32_exception(env, new_mode, mask, offset, addr);
 }
 
+static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
+{
+    /*
+     * Return the register number of the AArch64 view of the AArch32
+     * register @aarch32_reg. The CPUARMState CPSR is assumed to still
+     * be that of the AArch32 mode the exception came from.
+     */
+    int mode = env->uncached_cpsr & CPSR_M;
+
+    switch (aarch32_reg) {
+    case 0 ... 7:
+        return aarch32_reg;
+    case 8 ... 12:
+        return mode == ARM_CPU_MODE_FIQ ? aarch32_reg + 16 : aarch32_reg;
+    case 13:
+        switch (mode) {
+        case ARM_CPU_MODE_USR:
+        case ARM_CPU_MODE_SYS:
+            return 13;
+        case ARM_CPU_MODE_HYP:
+            return 15;
+        case ARM_CPU_MODE_IRQ:
+            return 17;
+        case ARM_CPU_MODE_SVC:
+            return 19;
+        case ARM_CPU_MODE_ABT:
+            return 21;
+        case ARM_CPU_MODE_UND:
+            return 23;
+        case ARM_CPU_MODE_FIQ:
+            return 29;
+        default:
+            g_assert_not_reached();
+        }
+    case 14:
+        switch (mode) {
+        case ARM_CPU_MODE_USR:
+        case ARM_CPU_MODE_SYS:
+        case ARM_CPU_MODE_HYP:
+            return 14;
+        case ARM_CPU_MODE_IRQ:
+            return 16;
+        case ARM_CPU_MODE_SVC:
+            return 18;
+        case ARM_CPU_MODE_ABT:
+            return 20;
+        case ARM_CPU_MODE_UND:
+            return 22;
+        case ARM_CPU_MODE_FIQ:
+            return 30;
+        default:
+            g_assert_not_reached();
+        }
+    case 15:
+        return 31;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Handle exception entry to a target EL which is using AArch64 */
 static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 {
@@ -9591,6 +9651,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int old_mode;
     unsigned int cur_el = arm_current_el(env);
+    int rt;
 
     /*
      * Note that new_el can never be 0.  If cur_el is 0, then
@@ -9645,7 +9706,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_HVC:
     case EXCP_HYP_TRAP:
     case EXCP_SMC:
-        if (syn_get_ec(env->exception.syndrome) == EC_ADVSIMDFPACCESSTRAP) {
+        switch (syn_get_ec(env->exception.syndrome)) {
+        case EC_ADVSIMDFPACCESSTRAP:
             /*
              * QEMU internal FP/SIMD syndromes from AArch32 include the
              * TA and coproc fields which are only exposed if the exception
@@ -9653,6 +9715,34 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
              * AArch64 format syndrome.
              */
             env->exception.syndrome &= ~MAKE_64BIT_MASK(0, 20);
+            break;
+        case EC_CP14RTTRAP:
+        case EC_CP15RTTRAP:
+        case EC_CP14DTTRAP:
+            /*
+             * For a trap on AArch32 MRC/MCR/LDC/STC the Rt field is currently
+             * the raw register field from the insn; when taking this to
+             * AArch64 we must convert it to the AArch64 view of the register
+             * number. Notice that we read a 4-bit AArch32 register number and
+             * write back a 5-bit AArch64 one.
+             */
+            rt = extract32(env->exception.syndrome, 5, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                5, 5, rt);
+            break;
+        case EC_CP15RRTTRAP:
+        case EC_CP14RRTTRAP:
+            /* Similarly for MRRC/MCRR traps for Rt and Rt2 fields */
+            rt = extract32(env->exception.syndrome, 5, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                5, 5, rt);
+            rt = extract32(env->exception.syndrome, 10, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                10, 5, rt);
+            break;
         }
         env->cp15.esr_el[new_el] = env->exception.syndrome;
         break;
-- 
2.20.1

