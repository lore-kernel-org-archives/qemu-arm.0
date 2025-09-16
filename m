Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E061FCAC59E
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:30:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWbj-00078w-Fu; Tue, 16 Sep 2025 10:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaa-0005y6-VV
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:25 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaT-0008MH-Sd
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:24 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-25d44908648so53125925ad.0
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032578; x=1758637378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYtAYFlCCwkQWVKst4EMyP1kPI4iTxoV2MGMTex6t8A=;
 b=OCJli5m6ZJpnvIB20IaJoar56913aQ3arlkjGOU2YjgQg5WYxTX7sN0k2eNXxe2zeO
 fpAvrI1KRn31mVOavrVb1VpZUMR8sBaLeMKHTODxHVQBGXGq0ULFNOMPXjjLosSJa+F5
 cHsTFID6yDUWS3TgUjZcZXxy70thDGAB/iwlpFgOFps7Rdep/9DsfoOWBoHOa8hRQAZc
 rfDnYXsjhbP8sGlflFRp0YSiVNKArqKD6hFSCegQIqKo+d8IASHhTIfUShYZrrz3B01c
 k6fVg+H0lY2CiLzCa7+dxxee5C3kMAkuebW6PPrIiWYZrGWoBFQeFtK3YDJVPjaeCiW3
 gS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032578; x=1758637378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aYtAYFlCCwkQWVKst4EMyP1kPI4iTxoV2MGMTex6t8A=;
 b=u1yZBNLGDbb11OlMHiKB9LASvL2+6U7Z9lvYIJYN9ykIQwt9ctDnT17p/Hd8/NK3U5
 GkEETJ6gDYGnkcycpMp08qo5ri65TyQIFjG7OpeZ9g2WlM1Ov0zEZs6hx+eAUZIghVAD
 prxF9pV4wRoI2b9FIChOq5bBYdpFrfuDH2gsbHoHwt4hrTKH6G9Xz5FTEhDXTASUc9TW
 4SUHxfxcom6ZqW9ps+IWJONDCn1o/b760XiWuZ4aeIh0OOuQud1LtdF09id4g46FbpwR
 XK+CuYAVdUqaP8h7Tpp+x7822xxJRY5QCvEsw1qzI96xs1zBnuo7+bPp2HKgeZBgkMsk
 Ij3w==
X-Gm-Message-State: AOJu0Yy9acn7Dfo5mWzJND/IavIPtBEvLqhYZ/UZRiSKyHrRO5VzZ3k8
 vf/hnje7clrjIzh7Vfxvlhh6Zk4GH+zEHuPEOQ32dePCqQorBKu1qWPObWkh6sBiqEwhjhpoAi+
 a07PS
X-Gm-Gg: ASbGncs5d4X+Tx0d6v0boW9A4xNM4ggRzHCUnqigTMwsT0ksJ81F4WYEVYMvZ3iuErv
 ouaiJduTRWM4jtii0MkOcRCpuvuXKcjLJOfOJH4eviJVUqYoP5m2HPw4w+FUSO0zQcEgO1pRd/V
 jvgVw7O6VOmpPPdZ9QkxecAQumiwc6rCTjs/ZAW7Hrwz1Uxbem/K7+BvI3CtvsZss+CaTdU88uR
 BWUbK+YOBmsIP3MjhASmmE6n8el+9UqfkzFufTfXqPeAAY7iIC67zZN1hWBOSb5hSBQu/PewSRE
 b8WNv+DZ/40XxM2MayjHqn3D0tA8tnRGVgbh7ILJPT5iWQoh6xwf2tbn4O7pYhqEwQAT6otLqAN
 YSBzDDejgQjRkTySjyg4T6VV1TdCO
X-Google-Smtp-Source: AGHT+IEe8VFXmDlrf0Bdw8LTQ6PJcAQOvBC1c9hgeyEvWIIicLDlzk8jSEXAjRxHu1ng6X/z3TbURA==
X-Received: by 2002:a17:903:1904:b0:246:4077:455b with SMTP id
 d9443c01a7336-25d2675f896mr186980815ad.36.1758032578111; 
 Tue, 16 Sep 2025 07:22:58 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 24/36] target/arm: Add key parameter to
 add_cpreg_to_hashtable
Date: Tue, 16 Sep 2025 07:22:25 -0700
Message-ID: <20250916142238.664316-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hoist the computation of key into the caller, where
state is a known constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4a109a113d..a5195e296d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7424,26 +7424,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    CPState state, CPSecureState secstate,
                                    int cp, int crm, int opc1, int opc2,
-                                   const char *name)
+                                   const char *name, uint32_t key)
 {
     CPUARMState *env = &cpu->env;
-    uint32_t key;
     ARMCPRegInfo *r2;
-    bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
     size_t name_len;
 
-    switch (state) {
-    case ARM_CP_STATE_AA32:
-        key = ENCODE_CP_REG(cp, is64, ns, r->crn, crm, opc1, opc2);
-        break;
-    case ARM_CP_STATE_AA64:
-        key = ENCODE_AA64_CP_REG(r->opc0, opc1, r->crn, crm, opc2);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
     /* Overriding of an existing definition must be explicitly requested. */
     if (!(r->type & ARM_CP_OVERRIDE)) {
         const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
@@ -7548,22 +7535,28 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, const ARMCPRegInfo *r,
      * (same for secure and non-secure world) or banked.
      */
     char *name;
+    bool is64 = r->type & ARM_CP_64BIT;
+    uint32_t key = ENCODE_CP_REG(cp, is64, 0, r->crn, crm, opc1, opc2);
 
     assert(!(r->type & ARM_CP_ADD_TLBI_NXS)); /* aa64 only */
 
     switch (r->secure) {
-    case ARM_CP_SECSTATE_S:
     case ARM_CP_SECSTATE_NS:
+        key |= CP_REG_AA32_NS_MASK;
+        /* fall through */
+    case ARM_CP_SECSTATE_S:
         add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, r->secure,
-                               cp, crm, opc1, opc2, r->name);
+                               cp, crm, opc1, opc2, r->name, key);
         break;
     case ARM_CP_SECSTATE_BOTH:
         name = g_strdup_printf("%s_S", r->name);
         add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, ARM_CP_SECSTATE_S,
-                               cp, crm, opc1, opc2, name);
+                               cp, crm, opc1, opc2, name, key);
         g_free(name);
+
+        key |= CP_REG_AA32_NS_MASK;
         add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA32, ARM_CP_SECSTATE_NS,
-                               cp, crm, opc1, opc2, r->name);
+                               cp, crm, opc1, opc2, r->name, key);
         break;
     default:
         g_assert_not_reached();
@@ -7573,6 +7566,8 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, const ARMCPRegInfo *r,
 static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, const ARMCPRegInfo *r,
                                         int crm, int opc1, int opc2)
 {
+    uint32_t key = ENCODE_AA64_CP_REG(r->opc0, opc1, r->crn, crm, opc2);
+
     if ((r->type & ARM_CP_ADD_TLBI_NXS) &&
         cpu_isar_feature(aa64_xs, cpu)) {
         /*
@@ -7587,18 +7582,22 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, const ARMCPRegInfo *r,
          */
         ARMCPRegInfo nxs_ri = *r;
         g_autofree char *name = g_strdup_printf("%sNXS", r->name);
+        uint32_t nxs_key;
 
         assert(nxs_ri.crn < 0xf);
         nxs_ri.crn++;
+        nxs_key = key + (1 << CP_REG_ARM64_SYSREG_CRN_SHIFT);
         if (nxs_ri.fgt) {
             nxs_ri.fgt |= R_FGT_NXS_MASK;
         }
+
         add_cpreg_to_hashtable(cpu, &nxs_ri, ARM_CP_STATE_AA64,
-                               ARM_CP_SECSTATE_NS, 0, crm, opc1, opc2, name);
+                               ARM_CP_SECSTATE_NS, 0, crm, opc1, opc2,
+                               name, nxs_key);
     }
 
     add_cpreg_to_hashtable(cpu, r, ARM_CP_STATE_AA64, ARM_CP_SECSTATE_NS,
-                           0, crm, opc1, opc2, r->name);
+                           0, crm, opc1, opc2, r->name, key);
 }
 
 void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
-- 
2.43.0


