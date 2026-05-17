Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF6BCD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:35:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPe-0007yt-7O; Sat, 16 May 2026 20:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOp-0007FK-0n
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOi-00051m-Ms
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:29 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-83538fbd0b2so382386b3a.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977819; x=1779582619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGCvxGAP+SJVq2oNHJQ8ObdWRbCOzKV7LFFW7Nyer9U=;
 b=DdXtfZP1xb3qsh+DcetV3ltYX9s/jgFaqMaUawxoEnsnsQpvM5zccTkqQr6r+QviZ5
 +mZtJaFqw8gaO3hdT8cTEmV4y5FgsZbJjU6W4Gfi6rwmOHGM5wKZiO8xn98UDW6JPKGX
 mRiUs/QE40/hOmuH7IMyfOJ5PBxvz0JP54VHh/lVxvhMB3jGBrh0dwHvAGjliyaoR+xz
 jsCSMW/UfG5IPId3yt0caVwKRvXEW39Ubs6DRAErFQxN6HpPCgEPvh1fJIc7Lpo5pIiO
 IHNON1s1dwGtg/OgqJ8z8bsd7+TEXzUEWh3FwcZQDkyv2nLTqMAfokRZbfG1+vCHLieT
 jt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977819; x=1779582619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mGCvxGAP+SJVq2oNHJQ8ObdWRbCOzKV7LFFW7Nyer9U=;
 b=ZBeCRY4tBDIcWil7+gnVWkZJYr3dEhBEPyffzm2f4S5m/491vqWy3OmthX7i1FRHCC
 XDtfQCcXZmbk2wslsMGXT5sKXMA2rylo1FHeRBI+UK6yvrobQHxW2Dib+3wwG86u7Mtf
 kDrarIRYcR4XJHbakmVo7yee9RuwNb7A+qQNti+8zbsyVeb3i8cDLOCeWZL9uG3ZP2FA
 +Z1e3OTviDvtYiqc0p7cnUYBMmCc3gJbohhagGe0TLUNnXKcjzd0LKOc5XQh5LNF8zYr
 v3EyBfpnndIT3qrU71w7nocWQpph2YG/p8YwsAX2gRUz21zPwwqTKO3LYps09867sZx7
 tv9Q==
X-Gm-Message-State: AOJu0YwsTg9+p6YAm9Zl3kLxJ7YLmfGDLN7y7ekGW3pl5EvVXMxK08wq
 Wm0mrVb4PIa0dTDXccKP5mhoK6eOkYwKe7giqBpqGrnFHgXzxZRMXF/wVxllVqPioeKQYzmgZY8
 kgTQR
X-Gm-Gg: Acq92OEUZ5Xfgu6mkAUE5QXCfopZgCYYkfigIrVvNPxXg9BAuK9TLjr8Q9Pr7NtkuTa
 iFOMC1gvRRcQA2nTRpQUfrBDCQCJMO6gQ2HmDKo1XIzObbu7Hq+gNVtucZvKs+7zfIHquOIoRUz
 XrkM4XLKJhAwNL/hJlJFPtmjeyvlSNRYLC0p7s7DDnOEdP+pErD3nkJqVJZYRrX5XATJxSiSB/S
 OBEs8n0Jb6OqhGDUtDWy8R3xozqEmsHAG67PT8djPZUGZ4ze0uB7ZiXnYY5hg4NwBrQZv1sIOGR
 rfMQmwkQaVlVb82UCqb0fx5KgTkMGKBl5wW5FORmgLFflfz1NUgCOQDbv8D+QoZg74hu8FImjwk
 SVuf0IqOp88m2D16uypBGiFsLlYV4NDlm8x8SAkDDDXD4HrNWFFMeO7i0v8BZH5S+e+HKbGweub
 cDwUEq3KWLQyuiA3qR74X5YQjt+6e3
X-Received: by 2002:a05:6a00:ab0d:b0:839:e27c:6cce with SMTP id
 d2e1a72fcca58-83f33d97d9amr9329893b3a.37.1778977819186; 
 Sat, 16 May 2026 17:30:19 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 17/63] target/arm: Implement ID_AA64FPFR0
Date: Sat, 16 May 2026 17:29:16 -0700
Message-ID: <20260517003002.321430-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h    |  9 +++++++++
 target/arm/helper.c          | 13 +++++++++++--
 target/arm/cpu-sysregs.h.inc |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index e13c1c1331..1bb77d78da 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -410,6 +410,15 @@ FIELD(ID_AA64SMFR0, I16I64, 52, 4)
 FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
 FIELD(ID_AA64SMFR0, FA64, 63, 1)
 
+FIELD(ID_AA64FPFR0, F8E5M2, 0, 1)
+FIELD(ID_AA64FPFR0, F8E4M3, 1, 1)
+FIELD(ID_AA64FPFR0, F8MM4, 26, 1)
+FIELD(ID_AA64FPFR0, F8MM8, 27, 1)
+FIELD(ID_AA64FPFR0, F8DP2, 28, 1)
+FIELD(ID_AA64FPFR0, F8DP4, 29, 1)
+FIELD(ID_AA64FPFR0, F8FMA, 30, 1)
+FIELD(ID_AA64FPFR0, F8CVT, 31, 1)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3d6e7f1ccc..34487eeaa3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6477,11 +6477,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
               .resetvalue = 0 },
-            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64FPFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64FPFR0) },
             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6712,6 +6712,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64SMFR0_I16I64_MASK |
                                R_ID_AA64SMFR0_SMEVER_MASK |
                                R_ID_AA64SMFR0_FA64_MASK },
+            { .name = "ID_AA64FPFR0_EL1",
+              .exported_bits = R_ID_AA64FPFR0_F8E5M2_MASK |
+                               R_ID_AA64FPFR0_F8E4M3_MASK |
+                               R_ID_AA64FPFR0_F8MM4_MASK |
+                               R_ID_AA64FPFR0_F8MM8_MASK |
+                               R_ID_AA64FPFR0_F8DP2_MASK |
+                               R_ID_AA64FPFR0_F8DP4_MASK |
+                               R_ID_AA64FPFR0_F8FMA_MASK |
+                               R_ID_AA64FPFR0_F8CVT_MASK },
             { .name = "ID_AA64MMFR0_EL1",
               .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
               .fixed_bits = (0xfu << R_ID_AA64MMFR0_TGRAN64_SHIFT) |
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index b99579f773..6e8b335b8f 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -3,6 +3,7 @@ DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
 DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
 DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
 DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
+DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
 DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
 DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
 DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
-- 
2.43.0


