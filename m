Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp260942ejc;
        Thu, 31 Aug 2023 16:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC2BdCpDMc6kthdqADkDCbCM7RZiBPWfF6oVkT0nVC9hvNYGqaz0N7kwRjEpxRKov36CdE
X-Received: by 2002:a05:620a:4087:b0:768:4206:fc8d with SMTP id f7-20020a05620a408700b007684206fc8dmr1029576qko.50.1693524330553;
        Thu, 31 Aug 2023 16:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693524330; cv=none;
        d=google.com; s=arc-20160816;
        b=hPMmNABPvD7F8v+6zqZttU8priqoJ8lEFc8Okh6p0n7V4/LlCbWDuDq2p3VZdvskIL
         04X59iw4jx21tanERyyj3Zb/TWjcH9pvppOmrwdljKUehCAB5m9/NBhtzD0CyWI9JLWa
         N7vHTdrvbtQuo4IgfIlDnmwQrMrKpK/lBJzxWPBGfyZ5eQ5UgunmdX0DPpV/eVqckdyk
         jOkxxe/T4R0554LibGQpDZAFxEUyhLpvWyaiO/FKVKpEUY3Ld5WK7PoOa6glDR46Q7/d
         iyjQcxFcme/Fw9Bl1+aaNIT09EhQHuqJtl6FTz/3xMS6s0ZE4g7FwV0UKkAXwzTyMnGq
         UerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xJhlXQXtvoaQKGLnjSOd47nDGtHCxt4SmP6oJ81pLWo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=JL1DYAkFrvoGA9O1V5l6cYYM4o3Suk0Dr7kK04BpGqZdLF0gCeZJivseqnvxbDQwEU
         tlZit+cgmoFiyKJjhOa7OHf8jPC3dReG7P9EvP/5g6nfe5GvIUB6V+PiaUhSyLww+q/i
         afDEIWVMJsRhXBfVLdCGtHjIM3w485zoT637lILmZFR/Ms1690c2eT6C9E+D122BJa/0
         53pPZr28LPdzemmHIv+24f/zfAtQbusd/WajnoroHy6JpV2XAXpFh1rC8PYPg86LfH/H
         jeUkJ61NsK20ATudyx2Va22A+9QJHH/gMn6vWyPJQcHon8oEx2ID121y25tdWbwFQtmP
         NMzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGgYw5rA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05620a22f300b0076f03e58b62si1494000qki.147.2023.08.31.16.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 16:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGgYw5rA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbr1y-0006ml-9b; Thu, 31 Aug 2023 19:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1x-0006mS-MV
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:53 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1p-0002H9-P8
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c1f7f7151fso10223775ad.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 16:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693524283; x=1694129083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJhlXQXtvoaQKGLnjSOd47nDGtHCxt4SmP6oJ81pLWo=;
 b=KGgYw5rASumvONBf6UcLSkentlF6tNkXxP+CBv0GtQUmbNzyDQkGZIbS3pbFRaOzj+
 TeGgNyyShGaD71pScgey2Ppbm+MJTpJxEsFkPpV9e0BwQ4zLqY2VzJ5XMbG7IqNPUPW3
 VedrXZqPsSUCqxg9iO0TnitFDEzfWGdIbQ8JHe6JYMTNqGBxY8Z7TTlcjcWEQxkpAQNW
 SkpjMPs90TJUQnTWrOX/lbyfS1mSskIk823xXjJR0xLPWa/broifu2taKR8IHfHqnDUd
 ePA4ZlYGU1nyvAZ+mfHQXmFhCWMThWZAKdRtB2pMsne/tHRl+Hr4RyCItcrdzkdZPqw6
 vcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693524283; x=1694129083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJhlXQXtvoaQKGLnjSOd47nDGtHCxt4SmP6oJ81pLWo=;
 b=QMHkeJaFfmw8wsWiGUbIX7eXZR8/yEbG/XtHbPm7PEPPqCo6FmUMiJOBiip11E225B
 JGhAxg7YreFqdgQ3+/jfsKv9pZ/ulBiAnw58ny4F1V6crCticP23iF1Pwsl70vJzCF3G
 tTRFo5i4lSXnwqkIW/FK4r8n6iaDHEfUvfloZVbaOFTtZetYrUPYAIi+wVUf8ZtqUqct
 7Hr/REoI+VFItr6ZbKSR6ndwBcd4WKtUlnvUwjm403S9l/Ck/zFEdGTlbSr50mc2eRGB
 gf8awaNqHeOcT8LWZrWowvLSltMfA5zjgXUEgXpDMjJBOXVdcpYXi9H11iWxxKbr9dcG
 YzBw==
X-Gm-Message-State: AOJu0YwUbg/XcRctr4hA8KesP06bArkj/+qAyPxgaN25zmM5pC56SC6m
 wzcBcEjIMB+205shdJS3v1lSkg==
X-Received: by 2002:a17:902:efc6:b0:1c1:e7b2:27af with SMTP id
 ja6-20020a170902efc600b001c1e7b227afmr936043plb.57.1693524283242; 
 Thu, 31 Aug 2023 16:24:43 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001bb8895848bsm1732711plb.71.2023.08.31.16.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 16:24:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 1/5] target/arm: Implement RMR_ELx
Date: Thu, 31 Aug 2023 16:24:37 -0700
Message-Id: <20230831232441.66020-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831232441.66020-1-richard.henderson@linaro.org>
References: <20230831232441.66020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /S0gR1PTaLTa

Provide a stub implementation, as a write is a "request".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 64 +++++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3f5a7d2bd..654e7d06a8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8682,16 +8682,25 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         modify_arm_cp_regs(v8_idregs, v8_user_idregs);
 #endif
-        /* RVBAR_EL1 is only implemented if EL1 is the highest EL */
+        /*
+         * RVBAR_EL1 and RMR_EL1 only implemented if EL1 is the highest EL.
+         * TODO: For RMR, a write with bit 1 set should do something with
+         * cpu_reset(). In the meantime, "the bit is strictly a request",
+         * so we are in spec just ignoring writes.
+         */
         if (!arm_feature(env, ARM_FEATURE_EL3) &&
             !arm_feature(env, ARM_FEATURE_EL2)) {
-            ARMCPRegInfo rvbar = {
-                .name = "RVBAR_EL1", .state = ARM_CP_STATE_BOTH,
-                .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
-                .access = PL1_R,
-                .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
+            ARMCPRegInfo el1_reset_regs[] = {
+                { .name = "RVBAR_EL1", .state = ARM_CP_STATE_BOTH,
+                  .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
+                  .access = PL1_R,
+                  .fieldoffset = offsetof(CPUARMState, cp15.rvbar) },
+                { .name = "RMR_EL1", .state = ARM_CP_STATE_BOTH,
+                  .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 2,
+                  .access = PL1_RW, .type = ARM_CP_CONST,
+                  .resetvalue = arm_feature(env, ARM_FEATURE_AARCH64) }
             };
-            define_one_arm_cp_reg(cpu, &rvbar);
+            define_arm_cp_regs(cpu, el1_reset_regs);
         }
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
@@ -8775,22 +8784,25 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             define_arm_cp_regs(cpu, el2_sec_cp_reginfo);
         }
-        /* RVBAR_EL2 is only implemented if EL2 is the highest EL */
+        /*
+         * RVBAR_EL2 and RMR_EL2 only implemented if EL2 is the highest EL.
+         * See commentary near RMR_EL1.
+         */
         if (!arm_feature(env, ARM_FEATURE_EL3)) {
-            ARMCPRegInfo rvbar[] = {
-                {
-                    .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
-                    .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
-                    .access = PL2_R,
-                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
-                },
-                {   .name = "RVBAR", .type = ARM_CP_ALIAS,
-                    .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
-                    .access = PL2_R,
-                    .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
-                },
+            static const ARMCPRegInfo el2_reset_regs[] = {
+                { .name = "RVBAR_EL2", .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 1,
+                  .access = PL2_R,
+                  .fieldoffset = offsetof(CPUARMState, cp15.rvbar) },
+                { .name = "RVBAR", .type = ARM_CP_ALIAS,
+                  .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
+                  .access = PL2_R,
+                  .fieldoffset = offsetof(CPUARMState, cp15.rvbar) },
+                { .name = "RMR_EL2", .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 2,
+                  .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 1 },
             };
-            define_arm_cp_regs(cpu, rvbar);
+            define_arm_cp_regs(cpu, el2_reset_regs);
         }
     }
 
@@ -8801,8 +8813,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "RVBAR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 1,
               .access = PL3_R,
-              .fieldoffset = offsetof(CPUARMState, cp15.rvbar),
-            },
+              .fieldoffset = offsetof(CPUARMState, cp15.rvbar), },
+            { .name = "RMR_EL3", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 2,
+              .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 1 },
+            { .name = "RMR", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 2,
+              .access = PL3_RW, .type = ARM_CP_CONST,
+              .resetvalue = arm_feature(env, ARM_FEATURE_AARCH64) },
             { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
               .access = PL3_RW,
-- 
2.34.1

