Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1294143lfj;
        Thu, 5 May 2022 12:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzWwyEQGOj8kPzUTJBMF1wspU4yNltLbvaETbkwE6LeD/jQx4YmUpJRsrygvSGUo0ioAx9
X-Received: by 2002:ac8:5ac3:0:b0:2e1:e117:b2ed with SMTP id d3-20020ac85ac3000000b002e1e117b2edmr25259734qtd.541.1651777521307;
        Thu, 05 May 2022 12:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651777521; cv=none;
        d=google.com; s=arc-20160816;
        b=TDqkPJC1s75mMz047vMDiKbS92Vm3nwahE3SugYrHn7KBrCslfmecaapnTtCavnRPi
         uqXtr7umPCHGrxZ0NeGc/4pTV0OwkVv8Z+z8VYE7hdyWtlx9prPpNR1JGkcIixKOAC+U
         znvqaCTewdzDV4SmSnPR6gpr4FT8t8NJc5kBA7Yg6dpAzAP7nhhqcYsEXZR4HvabMchT
         9Fhp2Ed3AQgJm22ps7g0H4NN19QWPVSMv6SY06jTmLghQH8XoK1uXcPuxej76vvRgKx8
         fSm32Z4r5YukYl6c3D8u97C0y/mFMDUNg+sLAT8c43gBd99/MQ+8egwHry2asVZNG1AD
         JKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RP7uxMyjyjVvNPdZI9ZcRwKJ1kV5jw0hdIhEr9Ry6LU=;
        b=KtA2v3/RYO9rd71E4i/N26VMkCb7XysfMpZxdvRjs4ZIgprCBa68DBF1WaxRiQK0QU
         0ecRJD9pCCpiWbeeOYxu31FwwXzuem98BOlXdKyVEAgjmr3GmgLH/KPDFhv+SB6eJahI
         x1oCCk01ksEBzfkgPb9itiJkxQ+rv36zXGkvCyi8Yykenc0bcpUw+mQHRWt2ZNfP19Ab
         G+Jwj4pd9X4eOEDPiDc/ySQosyVouryk1Uu8HiDHVnjdBtV0jy4b4FoJ9lU466Ve2FZ6
         0+wYpK9PLbJw0M25zkIlLqhp3KSvIEQBRgBe1oNYugW635mMBCKMNYOKrFjDFPd5RZtd
         d3Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLDDBC3f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020ac85c83000000b002f3ab2a4f81si1390268qta.101.2022.05.05.12.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLDDBC3f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgmu-0003Pl-KT
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYR-0002VK-Dc
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:23 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004O5-1U
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:23 -0400
Received: by mail-oi1-x22d.google.com with SMTP id y63so5254914oia.7
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RP7uxMyjyjVvNPdZI9ZcRwKJ1kV5jw0hdIhEr9Ry6LU=;
 b=NLDDBC3fq0resN9WsUbO0xfXeF5YtR1ByR0y/Pu4jgZIK//R8/6EfnASO6UVw0r5LO
 eUC1mFpL6Cn4OMMbbRE35jX8ypEdhORsEbnov90Dnka11tr9wWf47MtWQzeAQcHbxt8Q
 egGfHPb9V57E8roxqD+l+MVJViptvJtaDvwfg6cCIMzhI79lJb8r7qQVBpqQ3NEiHs9d
 Nk1evjfjeAJIZBsQaZ3/eoiobytWGvS85p48DXgWkAX+4KFPJLlgA/vGR7VV0RKvXWvl
 TqT3Sa/HUEvbjkAL/nGUQYG/S1w5bJBkY+hQ2nqbB9dfhbFB0YLaxjl6WB0GUgqbIUHL
 Pi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RP7uxMyjyjVvNPdZI9ZcRwKJ1kV5jw0hdIhEr9Ry6LU=;
 b=NposOkfv9seqm8u/A8lT+ysSTFN1upwX9666USNYUp3Ob1esONO6VnvkAl8LxrHfht
 EDrOePgFNeBeUcJ6EK3dPs/TthPl6UAJdF2EnMiJkMNAprr2sT1yM7HziDTcRKmP+2lN
 G8zGwasww9Y8NvSR674+D5Cc8imn7T/2QyfsqBPP8RwX7LWIzHFVoeyT2Y28auWJU49q
 g4unMwJakKq7HAg9z33y3tSqpZCTGgxY3FbzIWsWoNzzD9XWZ+SnI4ygpZ3PoLKBT7Oy
 3Ubd21gyn/tYv8cDrqT0uOJ97Oq2Koh9KdtBic0BiJ716MGuSaSC3B4d0MmrYvaIovO0
 8RUA==
X-Gm-Message-State: AOAM531iHYn6ehbkTNS259elrHYlcia01zKQ8bMjIJvRRkb/LGYfXBqa
 r1T9Tqow4e5RCWccfGE+FKOLgyJ7RwPgjBpL
X-Received: by 2002:a05:6808:140a:b0:326:5fa8:a66b with SMTP id
 w10-20020a056808140a00b003265fa8a66bmr3268083oiv.164.1651776615586; 
 Thu, 05 May 2022 11:50:15 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 05/24] target/arm: Move cortex impdef sysregs to cpu_tcg.c
Date: Thu,  5 May 2022 13:49:47 -0500
Message-Id: <20220505185006.200555-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xmtrQBU5VmZ6

Previously we were defining some of these in user-only mode,
but none of them are accessible from user-only, therefore
define them only in system mode.

This will shortly be used from cpu_tcg.c also.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: New patch.
---
 target/arm/internals.h |  6 ++++
 target/arm/cpu64.c     | 64 +++---------------------------------------
 target/arm/cpu_tcg.c   | 59 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 60 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 255833479d..343b465d51 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1307,4 +1307,10 @@ int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
 #endif
 
+#ifdef CONFIG_USER_ONLY
+static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
+#else
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
+#endif
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c841d55d0e..33a0a71900 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -34,65 +34,9 @@
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
-#include "cpregs.h"
+#include "internals.h"
 
 
-#ifndef CONFIG_USER_ONLY
-static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    /* Number of cores is in [25:24]; otherwise we RAZ */
-    return (cpu->core_count - 1) << 24;
-}
-#endif
-
-static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
-#ifndef CONFIG_USER_ONLY
-    { .name = "L2CTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .readfn = a57_a53_l2ctlr_read,
-      .writefn = arm_cp_write_ignore },
-    { .name = "L2CTLR",
-      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .readfn = a57_a53_l2ctlr_read,
-      .writefn = arm_cp_write_ignore },
-#endif
-    { .name = "L2ECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2ECTLR",
-      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2ACTLR", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR",
-      .cp = 15, .opc1 = 0, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUECTLR",
-      .cp = 15, .opc1 = 1, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "CPUMERRSR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUMERRSR",
-      .cp = 15, .opc1 = 2, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "L2MERRSR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2MERRSR",
-      .cp = 15, .opc1 = 3, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-};
-
 static void aarch64_a57_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -143,7 +87,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
 static void aarch64_a53_initfn(Object *obj)
@@ -196,7 +140,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
 static void aarch64_a72_initfn(Object *obj)
@@ -247,7 +191,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9338088b22..d078f06931 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -20,6 +20,65 @@
 #endif
 #include "cpregs.h"
 
+#ifndef CONFIG_USER_ONLY
+static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Number of cores is in [25:24]; otherwise we RAZ */
+    return (cpu->core_count - 1) << 24;
+}
+
+static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
+    { .name = "L2CTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .readfn = l2ctlr_read,
+      .writefn = arm_cp_write_ignore },
+    { .name = "L2CTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .readfn = l2ctlr_read,
+      .writefn = arm_cp_write_ignore },
+    { .name = "L2ECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2ECTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2ACTLR", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR",
+      .cp = 15, .opc1 = 0, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUECTLR",
+      .cp = 15, .opc1 = 1, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "CPUMERRSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUMERRSR",
+      .cp = 15, .opc1 = 2, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "L2MERRSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2MERRSR",
+      .cp = 15, .opc1 = 3, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+};
+
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
+{
+    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+}
+#endif /* !CONFIG_USER_ONLY */
+
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-- 
2.34.1

