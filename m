Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5180248gdb;
        Wed, 14 Sep 2022 05:30:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR50m7yN8Hx+9/yzcp9F90JMOi5IvYoyRv6F/6aH67WyK++7vzl7MWS+V2gnXyFvfk22m3sq
X-Received: by 2002:ac8:7d90:0:b0:35b:b5b2:e05a with SMTP id c16-20020ac87d90000000b0035bb5b2e05amr12032096qtd.513.1663158641793;
        Wed, 14 Sep 2022 05:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663158641; cv=none;
        d=google.com; s=arc-20160816;
        b=XpT9AWeK7sYiXffDA0b5a3FHt3Q7cnmJwg3TA971Q8oJk3jqWuf0wdsAreaUFnPi2J
         qHs4DKBZJRJlVuV0GN8I0DvrhnNY9ewUA4UXldHw+7hP9a+Zc0iDklUbVd7VrQXd3YSl
         VgI2PDQ2GEvc9GiMvv+YCjvUa2voggrVIeEPEK6/6NYuR54B7Fe/aO5ADGfgDFRd3wu3
         ZBlTMMLKJiW0UQhMIwxtMFUrLynYwcMjJxilqnj0U5bTevH8FQHvE2s6iGNJ3Ht7s2cO
         6WxWXmvnxoxOhEtN+f2d1kCSxni3YU2UbARBLSU7+T+5gsGDeZYZa9Y0GfVJRo0jF3OZ
         T4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eX9v5Z0oAQlP6jLTUUgwTUT4/yfPB84SQ6s4Q9u/ICs=;
        b=rTdO7y0f83/KjhH9lv7mVbVQFi1WbWGTdyxfHDSQqCRmuRZ1amGBJWtGSly8+ZbQ+t
         7V1qjjcXphQqxDRcbbHQ5r0FWPCJDVc7i6BapR2KJzyV7NMOz4k/6bW/4RtylURK6Qm2
         7+1KzqoZd/1asiQ1GKpcZ7hTcY/3NU/31Q1A6FxGeidEdnbjNXYnxDC7DtAs/02fmnL9
         qPIchi6egoN6JiORVM/fkTVb8kWO1ult0vUZhCKSyHpoo/wNx9b+DKeM4KK8qhhn8GX9
         kiwW1UR1XCrjb3OaBPUQFzf6hCrCp+mo1Jo1auwAysIZqBztVZq4PIXG+3IknYPtT/mQ
         DDmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gE8kKcgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z26-20020ac8101a000000b0035bdb8db404si1049257qti.290.2022.09.14.05.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:30:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gE8kKcgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRXN-0004tj-97
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-0000At-Qx
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwK-0008VR-2K
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso11345992wmr.3
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eX9v5Z0oAQlP6jLTUUgwTUT4/yfPB84SQ6s4Q9u/ICs=;
 b=gE8kKcgqXlHRHBUQCrrIVaJ2f9FKRQlR05Jrm96RnewwYYpoLU7mLte+QE0ykHKwWT
 7QRuaMoQnAVoG199x1k53n4Oen0skCFNiuT5yzO3Ic/8CVsE1Vs6tKtxlFWFfsCUZcvy
 bb7DVzgvsOOREREBICjsDnNK20SeQkzLquradwuq54dhFpURvTvyMRSS8TQZoL8eGF96
 XSFdVK72AIGEMKC96yiA/Etx9q6mI+1IQI+/5GcnIHhOJnLXLT0+csWMQ3zq8koIOpWQ
 LRSPlBoh0423uP2eKqXG4WgA65tUgrQ6twF71BLpDYnpQG2iD3lnG4dZxpBrYE5yH7ZI
 0Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eX9v5Z0oAQlP6jLTUUgwTUT4/yfPB84SQ6s4Q9u/ICs=;
 b=X4aAG6dOvcWsNvQPpbHiCCbjRLoS3rdNqDpRwGH2e5a4BuV2OEdmp75Weh+G3UwYdP
 TxMSudzf2omKsSzgWSH0wJMGRg9j8qdfiwZ+jqfVilV3W/gbxo7UINXhTQlOuAoE6hQF
 tNvtCTKsnwPPdxanyDV3hVmwb+lr+ebpCuG5bZ9t/0WE6qrBQdgiJg/qPBGWipS2jQiq
 ixNlGpf/q+9/aioQYt61Yms5HYZPoZRSqWez13f3z7AA8hgVQeHVrJMJNS0BR1yplVIR
 sjLisXms5j6Nb9MbXgTAw98roVLYV5sx02y9URS1KNWJggLy8mpWjhtiszoAsHr5vD5g
 tEyQ==
X-Gm-Message-State: ACgBeo0z133jDpC3mrGvvy7y8M/EzkNxqrTf5+AortkVnTEXG0LGLACj
 LYLp4Z7/C67pfSwrj2FsTEU6dQ==
X-Received: by 2002:a05:600c:1688:b0:3b4:8726:f304 with SMTP id
 k8-20020a05600c168800b003b48726f304mr2866278wmn.46.1663156342484; 
 Wed, 14 Sep 2022 04:52:22 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/20] target/arm: Make cpregs 0, c0, c{3-15},
 {0-7} correctly RAZ in v8
Date: Wed, 14 Sep 2022 12:52:00 +0100
Message-Id: <20220914115217.117532-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: yGqgQA5sfuxV

From: Peter Maydell <peter.maydell@linaro.org>

In the AArch32 ID register scheme, coprocessor registers with
encoding cp15, 0, c0, c{0-7}, {0-7} are all in the space covered by
what in v6 and v7 was called the "CPUID scheme", and are supposed to
RAZ if they're not allocated to a specific ID register.  For our
pre-v8 CPUs we get this right, because the regdefs in
id_pre_v8_midr_cp_reginfo[] cover these RAZ requirements.  However
for v8 we failed to put in the necessary patterns to cover this, so
we end up UNDEFing on everything we didn't have an ID register for.
This is a problem because in Armv8 some encodings in 0, c0, c3, {0-7}
are now being used for new ID registers, and guests might thus start
trying to read them.  (We already have one of these: ID_PFR2.)

For v8 CPUs, we already have regdefs for 0, c0, c{0-2}, {0-7} (that
is, the space is completely allocated with no reserved spaces).  Add
entries to v8_idregs[] covering 0, c0, c3, {0-7}:
 * c3, {0-2} is the reserved AArch32 space corresponding to the
   AArch64 MVFR[012]_EL1
 * c3, {3,5,6,7} are reserved RAZ for both AArch32 and AArch64
   (in fact some of these are given defined meanings in Armv8.6,
   but we don't implement them yet)
 * c3, 4 is ID_PFR2 (already defined)

We then programmatically add RAZ patterns for AArch32 for
0, c0, c{4..15}, {0-7}:
 * c4-c7 are unused, and not shared with AArch64 (these
   are the encodings corresponding to where the AArch64
   specific ID registers live in the system register space)
 * c8-c15 weren't required to RAZ in v6/v7, but v8 extends
   the AArch32 reserved-should-RAZ space to cover these;
   the equivalent area of the AArch64 sysreg space is not
   defined as must-RAZ

Note that the architecture allows some registers in this space
to return an UNKNOWN value; we always return 0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a..c171770b03 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7345,11 +7345,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V8)) {
-        /* AArch64 ID registers, which all have impdef reset values.
+        /*
+         * v8 ID registers, which all have impdef reset values.
          * Note that within the ID register ranges the unused slots
          * must all RAZ, not UNDEF; future architecture versions may
          * define new registers here.
+         * ID registers which are AArch64 views of the AArch32 ID registers
+         * which already existed in v6 and v7 are handled elsewhere,
+         * in v6_idregs[].
          */
+        int i;
         ARMCPRegInfo v8_idregs[] = {
             /*
              * ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST in system
@@ -7539,7 +7544,34 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.mvfr2 },
-            { .name = "MVFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            /*
+             * "0, c0, c3, {0,1,2}" are the encodings corresponding to
+             * AArch64 MVFR[012]_EL1. Define the STATE_AA32 encoding
+             * as RAZ, since it is in the "reserved for future ID
+             * registers, RAZ" part of the AArch32 encoding space.
+             */
+            { .name = "RES_0_C0_C3_0", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 0,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            { .name = "RES_0_C0_C3_1", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 1,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            { .name = "RES_0_C0_C3_2", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            /*
+             * Other encodings in "0, c0, c3, ..." are STATE_BOTH because
+             * they're also RAZ for AArch64, and in v8 are gradually
+             * being filled with AArch64-view-of-AArch32-ID-register
+             * for new ID registers.
+             */
+            { .name = "RES_0_C0_C3_3", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
@@ -7549,17 +7581,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_pfr2 },
-            { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_6", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_7", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
@@ -7625,6 +7657,29 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
+
+        for (i = 4; i < 16; i++) {
+            /*
+             * Encodings in "0, c0, {c4-c7}, {0-7}" are RAZ for AArch32.
+             * For pre-v8 cores there are RAZ patterns for these in
+             * id_pre_v8_midr_cp_reginfo[]; for v8 we do that here.
+             * v8 extends the "must RAZ" part of the ID register space
+             * to also cover c0, 0, c{8-15}, {0-7}.
+             * These are STATE_AA32 because in the AArch64 sysreg space
+             * c4-c7 is where the AArch64 ID registers live (and we've
+             * already defined those in v8_idregs[]), and c8-c15 are not
+             * "must RAZ" for AArch64.
+             */
+            g_autofree char *name = g_strdup_printf("RES_0_C0_C%d_X", i);
+            ARMCPRegInfo v8_aa32_raz_idregs = {
+                .name = name,
+                .state = ARM_CP_STATE_AA32,
+                .cp = 15, .opc1 = 0, .crn = 0, .crm = i, .opc2 = CP_ANY,
+                .access = PL1_R, .type = ARM_CP_CONST,
+                .accessfn = access_aa64_tid3,
+                .resetvalue = 0 };
+            define_one_arm_cp_reg(cpu, &v8_aa32_raz_idregs);
+        }
     }
 
     /*
-- 
2.34.1

