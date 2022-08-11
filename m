Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp654763ejf;
        Thu, 11 Aug 2022 10:24:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4XiMYAsM8T3D2FFPXDII1/cgcKPNt1/j04VfXMRwig6LnOoY47W6fbu295W0YIrDsE2huD
X-Received: by 2002:a37:5481:0:b0:6b9:573e:a813 with SMTP id i123-20020a375481000000b006b9573ea813mr9880qkb.197.1660238640110;
        Thu, 11 Aug 2022 10:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238640; cv=none;
        d=google.com; s=arc-20160816;
        b=FgDBiqamuKV/MYKUCbbP6Cl8dkf/jyK90qEKXVY3p9fFr3xYuOfe7dWNf20nPJRkw3
         KXTGRosmUm5P+bqGyktKrrwtqQXWi0dBpWN6D4XVmxCsTzLZ4v7rKlzWI0pX8xJR5C09
         8TnKc8ci5TS/CbuG9TlyD9gc25BdZz2D3JPeubB3MwgKJVmju3YUcGuF5TtYdWRfSrW/
         +Jddhmh7tpwa2c1ic7elAkdSJONqj/hO5Y5ywWHXRruQZXRTb2MNBpVD5smDJyusJIb/
         c84LA9wh4osJx6ZZwkE0Yv0Sy+IDKGGZpSbUhZgkjskY5coOza3HeZJkpQVeXqoONbcY
         kWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ulFcTK/UMwbyB6T+H2cmDJnndecNUSXMdH2zsNS8rWY=;
        b=R2ZPPwvg1xhoJVZsfhW98rAJIZBDnrXkGXme/3IM0F3PHcZsvj2/Hln8PvEghIudhy
         0757CNK8tei36Rrk+41GYXLqSqOlx9VPQWObRoUH4VVN5KJC/SH3tYGVOdifx5XuEq8C
         JkibMoKfEsaaJNrEBzHMfy2irs//ijMda6Ji6sw8ERkJ1zE6yGyZfyYTPOlYujdCxcN4
         noQkNb/eOp+3CYTGj1YyqrNKUchmZT6iEIDdOP7M+jDo7e3TlSe898JJf0jT2Co2J+kS
         5hOQe1MQQCBPP0xN62S6Tz1p/seA/6OCibLRFtAdMV8T7pz8c1eX0ElKinHO2ePfU6bS
         ukcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TW+iMmrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a37640e000000b006b99aaf8fd1si1761172qkb.332.2022.08.11.10.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TW+iMmrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBuZ-0005DS-Hi
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0006qI-KU
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnF-0000tu-44
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z17so22042810wrq.4
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=ulFcTK/UMwbyB6T+H2cmDJnndecNUSXMdH2zsNS8rWY=;
 b=TW+iMmrxXvn4IUI5eXZS5bL4HRuuZsFJkGJbLKpM+WCfO3Roo/5brIAbqrOF5p9xiD
 pmCeUFh2IpbrS3zu4DGQuiet5wYvkQnSS95fdsqDlOsxz9A6dLNlNKDgXCM88QbPWqYu
 FaoZIDYPYxgta90s3c9pDAReZeDcMnALOgnpUo3p50Cos2OqIULVk+xJb6N3fR9grd8V
 GNQAOPoeVl7SW2/wQJUGMY+IOYzWszC8aUIIcxKEy3CmUzNpBRqpPttM1xGloAA206vY
 SmeFUTqS63uBP4NHn6Kojtbcz7LEG8y9ZGXoEp5asFNWT3ActGjwhnZWrz+f1XUBpMOc
 vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=ulFcTK/UMwbyB6T+H2cmDJnndecNUSXMdH2zsNS8rWY=;
 b=140i06ZCBeIdWBhuZEyuFH/309LGqiXhDoqeN8M0HbehJrrC5l3O2zqtJa65AktR4A
 yIGmudDxxXQXRWpqTFkORIuRtCqcL/AyeFcXajIlVRwGZcB9mrtFVSWVU6f3jcgXLuEW
 MjHaYAYZmmoa+0mR/qo8SAgqyR+Eg7GGoQsflLSgowSYMczgUSrVNc3ovFGqkagqQPmi
 naU4PinJdhhPiHnl8tIjhgMM0JQIzdvZG5nD3JZm8fUwzKq3VxegxTcmuGIOY9/wD+qg
 oRoMfKJ2DIifb28WrX4wKXpyiu+EyslBYkOwcLuXe7bMXrWuju3suCZVcBxPzRHElNSO
 KGWQ==
X-Gm-Message-State: ACgBeo1hLm+rECH4j/6Et0xYfeqvV0lnoS0l48SAQgYaOG7cMy8xfaFX
 WyECZ3kII7UNI8ZtOf+ZJBwItUan1iAGBw==
X-Received: by 2002:a5d:47a1:0:b0:221:7e3b:b3b4 with SMTP id
 1-20020a5d47a1000000b002217e3bb3b4mr17662wrb.694.1660238183645; 
 Thu, 11 Aug 2022 10:16:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/10] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Date: Thu, 11 Aug 2022 18:16:12 +0100
Message-Id: <20220811171619.1154755-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F+0VunZS/NlO

The PMU cycle and event counter infrastructure design requires that
operations on the PMU register fields are wrapped in pmu_op_start()
and pmu_op_finish() calls (or their more specific pmmcntr and
pmevcntr equivalents).  This includes any changes to registers which
affect whether the counter should be enabled or disabled, but we
forgot to do this.

The effect of this bug is that in sequences like:
 * disable the cycle counter (PMCCNTR) using the PMCNTEN register
 * write a value such as 0xfffff000 to the PMCCNTR
 * restart the counter by writing to PMCNTEN
the value written to the cycle counter is corrupted, and it starts
counting from the wrong place. (Essentially, we fail to record that
the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
to have started counting is the point when PMCNTEN is written to enable
the counter.)

Add the necessary bracketing calls, so that updates to the various
registers which affect whether the PMU is counting are handled
correctly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 87c89748954..7a367371921 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1079,6 +1079,14 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
+/*
+ * Bits in MDCR_EL2 and MDCR_EL3 which pmu_counter_enabled() looks at.
+ * We use these to decide whether we need to wrap a write to MDCR_EL2
+ * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
+ */
+#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN)
+#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME)
+
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
  * the current EL, security state, and register configuration.
  */
@@ -1432,15 +1440,19 @@ static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
+    pmu_op_start(env);
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten |= value;
+    pmu_op_finish(env);
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
+    pmu_op_start(env);
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten &= ~value;
+    pmu_op_finish(env);
 }
 
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4681,7 +4693,39 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
+    /*
+     * Some MDCR_EL3 bits affect whether PMU counters are running:
+     * if we are trying to change any of those then we must
+     * bracket this update with PMU start/finish calls.
+     */
+    bool pmu_op = (env->cp15.mdcr_el3 ^ value) & MDCR_EL3_PMU_ENABLE_BITS;
+
+    if (pmu_op) {
+        pmu_op_start(env);
+    }
     env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
+    if (pmu_op) {
+        pmu_op_finish(env);
+    }
+}
+
+static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /*
+     * Some MDCR_EL3 bits affect whether PMU counters are running:
+     * if we are trying to change any of those then we must
+     * bracket this update with PMU start/finish calls.
+     */
+    bool pmu_op = (env->cp15.mdcr_el2 ^ value) & MDCR_EL2_PMU_ENABLE_BITS;
+
+    if (pmu_op) {
+        pmu_op_start(env);
+    }
+    env->cp15.mdcr_el2 = value;
+    if (pmu_op) {
+        pmu_op_finish(env);
+    }
 }
 
 static const ARMCPRegInfo v8_cp_reginfo[] = {
@@ -7669,6 +7713,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo mdcr_el2 = {
             .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+            .writefn = mdcr_el2_write,
             .access = PL2_RW, .resetvalue = pmu_num_counters(env),
             .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
         };
-- 
2.25.1

