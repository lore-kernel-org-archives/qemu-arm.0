Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1275390lfk;
        Sun, 17 Apr 2022 11:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI2A/C7ZXdgfu01/J+a1tL3tuD3GLBN7qSqyDHsxTFOUhMXaMEx/+VjGEeh7v/V5jjLKSU
X-Received: by 2002:a37:e211:0:b0:699:fa4f:f730 with SMTP id g17-20020a37e211000000b00699fa4ff730mr4788839qki.338.1650219229921;
        Sun, 17 Apr 2022 11:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219229; cv=none;
        d=google.com; s=arc-20160816;
        b=WqR2xhWxI8bTh+OjEqPYw0+q48+RpVSS2ATDnlnoaZdj6p5jVn0cL47o7ZKwAXIRhh
         7gCWZApyyxnq8pNJ2QiaZmaJ0e6x+fMe+25AoeHuM3dUe89uKoqW7QqX5lozfC3X/z4Y
         ArCP93hbMwQkQ/GkWHrKOsA02sRNzcmBpFOavzeEDUkbxbRfCp5Fa6ha+KtVbp6Dd4mK
         i/3wocRxGFxutyDhgG2kx6kEEYp+OjjvbwXDngpH8VgjWltSB24GmYGMcmfui25YOM5m
         i0B+FVcCpIeG4Db/D/j6a7S2Bkhi1hesbBTfTYjIarPUGbWL3bQvYfZdD/0ZjZa9CU6/
         Z2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SQLjPgr/00ZHzz+LXu9cgSfnxSwNm0BkUh4Gx2ZNmzI=;
        b=f1MqydcM26IsVghWsAq0s+zTunvGWB0jszN47BOpbiBbllrj7pAgiQm4QXAjgRMjpg
         BhQfx5LastAj9MIU9SSkl2KFb3HseIE3hgE8BJTnGtujQ7tooNsdT866OE1dxKLC9Q+8
         IjXfE43qPvOv/1aRLH1QKqZwdAqPy66/iz4UOJefquC4POoMk+9tkmv6zieg4qftty5b
         /nBURe6xqXP/CCnNzj/osZrMnzFVfcQrfcTkjEChLbFXNKwg80zjpa3JaoB0OZQjk1Gi
         6l7jzOTTc9zJVxLobkvFM8KA4uorTfV3aFzPlFpctTYtQoEMMks/EZJKN10qIQgUqA48
         ZSJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIyi9tON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo15-20020a056214500f00b004446850416asi2405933qvb.369.2022.04.17.11.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIyi9tON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9PB-0007hn-DG
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90K-0004Ln-2v
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90H-00041S-NK
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso12244541pjj.2
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQLjPgr/00ZHzz+LXu9cgSfnxSwNm0BkUh4Gx2ZNmzI=;
 b=mIyi9tON29gCMputm9X387391rlIQRigK/2td+qN81SyAhQ0d22YW7PCoxlsh/mMpH
 PylBOWsaBCK3yEbbCVTBKU8ygZsxCUp8+lfwQIA9uYo1iVltbaPPJymwqyMzrGDpQv6o
 YySd8xchjrIJ/D8y14i4jByoSzy46K8ADqXfldvy/xuEY9K8849cAwaUwLcstmaROEtU
 ijnhgBmvMZSE5Nse732dIkF5SqeVghln0+sHqBOd34QwLwfQnsmGcZX/ZMFJtPF00AxX
 LYIwDwjrz80vrZ66iAqOoBqcPzMmVbQpunRvGWfPm9ONlko2SHzmU1PLnZlHY9tpXrFh
 pzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQLjPgr/00ZHzz+LXu9cgSfnxSwNm0BkUh4Gx2ZNmzI=;
 b=jhzN06jdCdzRETKQrd+6GACuHCXZlS8Ah/8tRTKCStZKUete4u5uQMZ3TQ7SQcwGAg
 5/kwhzchUQrpar//l6NMg+vlWioEea0OXQiVBsplvRsKeuTY4OS0gB8OI3J47V0kEC5q
 mJuq4ga6wgj6siNJ31h29/7ebTm7aiDfJ0s0lVEY//uoQDbWsziRD3LaK83/GQXDIVAP
 sMSEPNUX3Sn2IPyI5QHJyiYcdq1mvUB5yvA2QGBgFi4L89P7ZzqoEbsQdRSTkjJpo2gD
 f7fjMWVLm1RqTjJ/ZGCIf+o/B1WpC+bXwBVJH4N3WoTMWyKqt8y2A3ddBxv1OJovHDw+
 zEWw==
X-Gm-Message-State: AOAM5323g+QJAs5EwMnoHOQ0UBBb7J5YHRl19NUQqOMnYKOZwLq2PSCx
 QtEAu7wpiXHuWNBhszDQeApWKA==
X-Received: by 2002:a17:90b:38cb:b0:1d2:6c52:5be0 with SMTP id
 nn11-20020a17090b38cb00b001d26c525be0mr6620290pjb.32.1650217684476; 
 Sun, 17 Apr 2022 10:48:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/60] target/arm: Move cortex impdef sysregs to cpu_tcg.c
Date: Sun, 17 Apr 2022 10:44:06 -0700
Message-Id: <20220417174426.711829-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aonZwT8Gh9AT

Previously we were defining some of these in user-only mode,
but none of them are accessible from user-only, therefore
define them only in system mode.

This will shortly be used from cpu_tcg.c also.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: New patch.
---
 target/arm/internals.h |  6 ++++
 target/arm/cpu64.c     | 64 +++---------------------------------------
 target/arm/cpu_tcg.c   | 59 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 60 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7f696cd36a..96a57ee68f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1295,4 +1295,10 @@ int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
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
index c40373bd18..67d628c0af 100644
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
2.25.1

