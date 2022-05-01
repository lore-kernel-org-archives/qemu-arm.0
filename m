Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp480752lfu;
        Sat, 30 Apr 2022 23:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzQU93OWpE48cwBFtqluU0fHKjtTZdO5UMqpJ/5+O7WLgSytPWD71os0cSwonjOv5iMeNH
X-Received: by 2002:a05:622a:552:b0:2f2:538:d951 with SMTP id m18-20020a05622a055200b002f20538d951mr5803908qtx.466.1651387174801;
        Sat, 30 Apr 2022 23:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651387174; cv=none;
        d=google.com; s=arc-20160816;
        b=zz6CkarxGRjsyg3uatgeqe4XfEz6oJry8yqjNMZ1frfZvNT8escU+N8zbN8Miiq/y/
         zKBsgOJfo3M1mC8L2C3YMIRdj0ujATXePWh+5rUDB6P/LJauCYu33ufUrC6dUEjSFBnU
         XT4+sx+v1TPvvqjOfL4+6ruzBX05VedRZ4UMhKnObaTLmzXO4O93lTObM8ZDcn5rtlLH
         8itSBFt/bDa+rxyEjTxdpN0UPEdJZCIdWY/3wY7pxp+BG1/sywCDO6MkxCY90EvcBePV
         ocja6PugDsWmd2O+vA+ns62u2qK5PuTRHVvRQWdgvOgQ8EbgJsZAkYEqwihm6xZ2hcek
         wKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lRiwKmtxyYjFps6kK3GQ6tE0B9LAUXXJNHq5l1sdG8c=;
        b=Sz7lFwptslt+tk+Nd6v6uH93fqiZoPi5bXcAQly9VIAA7qSMaZh/SocVIdDTfDfQxZ
         BqQTl4nPhBvnlKugDyMtomZGoVFECTRxhZFlq7Hlr0gb8evoJIkWLiTUXEbpxt5LgEmV
         dRJ333teNgEg0NuO/mZIfcEyLculwbBhmoCJV1hLkXFa/axDsTR31iXY+JiWeVZd7UWz
         wmLtbtvRLuRoDnLZcjS0AB+N08LDA51hMs0IEap8MZtF/mbu7e0fQznhJXm8+i92Wbo6
         ZaSLb5I9Bqx5aAoSwNUNkfNLDuBqZJM9P5GhNuWz97VQo5vkNR52jmg9vjSLQcFQbbrv
         KNTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8txeQ5R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020ac87d07000000b002f1e9e73278si658033qtb.246.2022.04.30.23.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8txeQ5R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3F0-0007X4-0G
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tt-0006tW-9J
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tr-0001Jt-1e
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:53 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so10494160pjf.0
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRiwKmtxyYjFps6kK3GQ6tE0B9LAUXXJNHq5l1sdG8c=;
 b=D8txeQ5Rq1oJGEiw8rVi9QZUCegTfomha5cdxRAOQMLo17h0wMx0ekodIF/TQKeIw+
 s5Ae3Y2bkxbZPBmQNhshu3htqE99woTKov3CguBIIQ2GAQsANMXwMEWT/2x2IRlozqi0
 Fn3IZzwDMKg0cUZL0WKAaAbots8Yee9CxTji/Ax1eDv8RnOhaLOPLfQd4RY7JIoj2s5t
 gOp57fmzD+jdZlocVJXsKGMtJm8gYv68G3jE/i5qDsuXgGU1rdFrcevNBWDqDJTg9CLZ
 /CJaFhgI1X3jqNJePH65JSZ5gYJlunDoAaP+bSFw+u21D/L3ZSuUMNyZSk4tW/075lvF
 9xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRiwKmtxyYjFps6kK3GQ6tE0B9LAUXXJNHq5l1sdG8c=;
 b=hKGQ9u4cJJE2+GQfkQYYf/jJEtU0BvXIducMA8IbLwlZqKyQnlVHQEwYrG9i0BcuTt
 yjoTkC9C8TDK+T9y2QsuTBFxEGO+XUHf4X5NQgIKFuqtjWwbUYvMWIxjpF8sna0xOYb7
 TdGaEp2S+Qo/2MiP8Y1Z0p8TzEf+mSs7n4eOhG/n4dQblo6NOsCF2I7gm1SqqfDygMJQ
 wDTEBHIz7amfeSvvbiR0LhRgH1aJPqi84yqM1eISNJ4boXgig75Y8QgQxr3pr0cK7DGd
 anTAUiv4uQDJH0jaBEr08BSs+VIKDYmSBWiu/3nNOF6S97buJ7s3ihp4LMhG5Bby6xaN
 Nnng==
X-Gm-Message-State: AOAM530++stQT47LAZBMPO960WW/6ef0xdNmojztsu0izHI89tn8R1rA
 roO688bOAG5yAfooDjsUKJRTkhd366FVUw==
X-Received: by 2002:a17:903:32d2:b0:15e:8b2b:a5c2 with SMTP id
 i18-20020a17090332d200b0015e8b2ba5c2mr6554291plr.153.1651384249703; 
 Sat, 30 Apr 2022 22:50:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/45] target/arm: Drop EL3 no EL2 fallbacks
Date: Sat, 30 Apr 2022 22:50:03 -0700
Message-Id: <20220501055028.646596-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: 48yVwg6VZia6

Drop el3_no_el2_cp_reginfo, el3_no_el2_v8_cp_reginfo,
and the local vpidr_regs definition, and rely on the
squasing to ARM_CP_CONST while registering.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 158 ++++----------------------------------------
 1 file changed, 13 insertions(+), 145 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 598a9253d0..e24e0749ac 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5099,124 +5099,6 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
 };
 
-/* Used to describe the behaviour of EL2 regs when EL2 does not exist.  */
-static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
-    { .name = "VBAR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
-      .access = PL2_RW,
-      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
-    { .name = "HCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
-      .access = PL2_RW,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HACR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 7,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
-      .access = PL2_RW,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "MAIR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "AMAIR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "AFSR0_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "AFSR1_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "VTCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 6, .crm = 2,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "VTTBR_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "SCTLR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "TPIDR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "TTBR0_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HTTBR", .cp = 15, .opc1 = 4, .crm = 2,
-      .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "CNTHCTL_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTVOFF_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 0, .opc2 = 3,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTVOFF", .cp = 15, .opc1 = 4, .crm = 14,
-      .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "CNTHP_CVAL_EL2", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTHP_CVAL", .cp = 15, .opc1 = 6, .crm = 14,
-      .access = PL2_RW, .type = ARM_CP_64BIT | ARM_CP_CONST,
-      .resetvalue = 0 },
-    { .name = "CNTHP_TVAL_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CNTHP_CTL_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 1,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-      .access = PL2_RW, .accessfn = access_tda,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HPFAR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
-      .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "HIFAR", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_CONST,
-      .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .resetvalue = 0 },
-};
-
-/* Ditto, but for registers which exist in ARMv8 but not v7 */
-static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
-    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
-      .access = PL2_RW,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
-};
-
 static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -7902,7 +7784,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
     }
-    if (arm_feature(env, ARM_FEATURE_EL2)) {
+
+    /*
+     * Register the base EL2 cpregs.
+     * Pre v8, these registers are implemented only as part of the
+     * Virtualization Extensions (EL2 present).  Beginning with v8,
+     * if EL2 is missing but EL3 is enabled, mostly these become
+     * RES0 from EL3, with some specific exceptions.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL2)
+        || (arm_feature(env, ARM_FEATURE_EL3)
+            && arm_feature(env, ARM_FEATURE_V8))) {
         uint64_t vmpidr_def = mpidr_read_val(env);
         ARMCPRegInfo vpidr_regs[] = {
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
@@ -7943,33 +7835,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &rvbar);
         }
-    } else {
-        /* If EL2 is missing but higher ELs are enabled, we need to
-         * register the no_el2 reginfos.
-         */
-        if (arm_feature(env, ARM_FEATURE_EL3)) {
-            /* When EL3 exists but not EL2, VPIDR and VMPIDR take the value
-             * of MIDR_EL1 and MPIDR_EL1.
-             */
-            ARMCPRegInfo vpidr_regs[] = {
-                { .name = "VPIDR_EL2", .state = ARM_CP_STATE_BOTH,
-                  .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
-                  .type = ARM_CP_CONST, .resetvalue = cpu->midr,
-                  .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
-                { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_BOTH,
-                  .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-                  .access = PL2_RW, .accessfn = access_el3_aa32ns,
-                  .type = ARM_CP_NO_RAW,
-                  .writefn = arm_cp_write_ignore, .readfn = mpidr_read },
-            };
-            define_arm_cp_regs(cpu, vpidr_regs);
-            define_arm_cp_regs(cpu, el3_no_el2_cp_reginfo);
-            if (arm_feature(env, ARM_FEATURE_V8)) {
-                define_arm_cp_regs(cpu, el3_no_el2_v8_cp_reginfo);
-            }
-        }
     }
+
+    /* Register the base EL3 cpregs. */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         define_arm_cp_regs(cpu, el3_cp_reginfo);
         ARMCPRegInfo el3_regs[] = {
-- 
2.34.1

