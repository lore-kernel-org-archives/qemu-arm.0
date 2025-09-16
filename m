Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C99CAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:28:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWaq-0006KR-4t; Tue, 16 Sep 2025 10:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaL-0005nz-O4
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:11 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaC-0008LB-JK
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:05 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7728815e639so3858684b3a.1
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032575; x=1758637375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSIAGhmwh8mZ4wBWdZ4ZwC8IrpicHIIk/ZQHhSqFh34=;
 b=l2tN+n/U5zVOe7rIHWNnZt+WAjC4RKfUMQoN01Uf8Q5BQJ4WW7f9yKBw6R/k3DbIjc
 p0sugoGXJOjiQ9yNqH9m+hmnSUR92bca0YzOsgNUUQR1PY1z8IhyMVsspeGdj7kR3Ko5
 BJtuXjwsi6PKpbvjlYKJyZ4Vqsfy5yQOJLPPtR3p1DjjDn2edBbIHkCCYac9Y3aZa9Ok
 AO4RdYbVwx523grZ0lUEZQWAb605JVJJfW16KjfguaL+RcB1O71ZmEnaKix4NvnEkDoP
 5JORahLokGJqdTx+V+qC+YNvTdtzFU/mahWyspSLuOYAaw21I0CMBgcgB2VamRiBS/yb
 HLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032575; x=1758637375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSIAGhmwh8mZ4wBWdZ4ZwC8IrpicHIIk/ZQHhSqFh34=;
 b=ehMycd9QsIwhF1ItGTeb304u44Cmc3wV+ws+XcNYze0oPynlnmCrdLSg7qku30hvOQ
 yXJJe73GQ2IXycoyYlRZ0VSnRtATYhI95IrX+4We3I/1DVCjblFIUVdYhYNfrEAidnrR
 78ZzX1csHHR9gUd0bIOXybK4fh6LSa5wDU45c8nVO+pW7E90v+J3mFt5zm/uJzVCdf1+
 xfPoelVwAVFLzOmaazrhy+2wazIv/LbkK2+JbMxlrCGl8NLC6rYYZiq9qgwEo40mSGTR
 LUeVo8WVrOWtnLsq810aSxKQgbuW0+ooI+umg8vzmIiZaMKqurbOK1pr/A63MtXyZcO6
 B5OA==
X-Gm-Message-State: AOJu0YzPTgOSg5gxV4d33OaFV8A+kOHt3d+fhzq18zUNdsEaopr0i3ZX
 PawqO6A5yHgQXZfEZpq6UzdZcKfJ4HrZWkiuc4TRSgVQnPxiH4Tvbr/e/AmUz7a3cPw50Cmdk94
 h7A8d
X-Gm-Gg: ASbGncuw3zVA1zmWCMRCxfMkpEbwzf1o+MdNG/NHNYb2O05NqQi9hk8wbZTfpt3Tm2g
 oOVdRO3tf6G/yk0VYXqtMGhMzAUWc7ciS9qD8JeK1np76T7uEoQchL9XOt0KH2C353KsIjSDMWq
 LjsXcVYZu4OxTOKcTzUtEq1YWzNzZ3Ce2Nwi7NPUKxeMtBvY+4IWEpayIdrd4+Y9+RzntgTXaRZ
 1dm9ptdKhlHYv8xqM+ClNQAn7YXqYMYcbbXq2wh+F1wFAAWOCz1bAep6ESO8Ha7FUWJi0uuVEWy
 R4OAf6dLPbgb65bF/nRneUX2nuIp/2C4Uda7bz8+NJ6jFZptdx+7vZj936wlPsPNNHXFrgOCxsA
 pDXDOWsjILleYeg1Q3nOmrmahswHm
X-Google-Smtp-Source: AGHT+IEaTBui/B91+WuP7qzd0c/v5oaVCMAIgu//8CktMGyP697FmZZgXaXtjUwiQNvnERoSdLxpFw==
X-Received: by 2002:a17:902:cec6:b0:266:88ae:be6d with SMTP id
 d9443c01a7336-26688aec242mr94412115ad.6.1758032574645; 
 Tue, 16 Sep 2025 07:22:54 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 19/36] target/arm: Reorder ENCODE_AA64_CP_REG arguments
Date: Tue, 16 Sep 2025 07:22:20 -0700
Message-ID: <20250916142238.664316-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

The order of the parameters in the Arm ARM is

  op0, op1, crn, crm, op2

Reorder the arguments of ENCODE_AA64_CP_REG to match.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            | 2 +-
 target/arm/helper.c            | 4 ++--
 target/arm/hvf/hvf.c           | 6 +++---
 target/arm/tcg/translate-a64.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 95b0b9c78e..7bdf6cf847 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -187,7 +187,7 @@ enum {
      ((is64) << CP_REG_AA32_64BIT_SHIFT) |                  \
      ((cp) << 16) | ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
 
-#define ENCODE_AA64_CP_REG(crn, crm, op0, op1, op2) \
+#define ENCODE_AA64_CP_REG(op0, op1, crn, crm, op2) \
     (CP_REG_AA64_MASK | CP_REG_ARM64_SYSREG |           \
      ((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
      ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7094b63f82..8b63eacb91 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4542,7 +4542,7 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
     };
 
 #define K(op0, op1, crn, crm, op2) \
-    ENCODE_AA64_CP_REG(crn, crm, op0, op1, op2)
+    ENCODE_AA64_CP_REG(op0, op1, crn, crm, op2)
 
     static const struct E2HAlias aliases[] = {
         { K(3, 0,  1, 0, 0), K(3, 4,  1, 0, 0), K(3, 5, 1, 0, 0),
@@ -7453,7 +7453,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
          */
         assert(cp == 0 || r->state == ARM_CP_STATE_BOTH);
         cp = 0;
-        key = ENCODE_AA64_CP_REG(r->crn, crm, r->opc0, opc1, opc2);
+        key = ENCODE_AA64_CP_REG(r->opc0, opc1, r->crn, crm, opc2);
         break;
     default:
         g_assert_not_reached();
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 6e67d89163..8b467b3663 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1124,10 +1124,10 @@ static bool is_id_sysreg(uint32_t reg)
 
 static uint32_t hvf_reg2cp_reg(uint32_t reg)
 {
-    return ENCODE_AA64_CP_REG((reg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK,
-                              (reg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK,
-                              (reg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK,
+    return ENCODE_AA64_CP_REG((reg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK,
                               (reg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK,
+                              (reg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK,
+                              (reg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK,
                               (reg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK);
 }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a560ef0f42..0ec309f1ea 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2466,7 +2466,7 @@ static void handle_sys(DisasContext *s, bool isread,
                        unsigned int op0, unsigned int op1, unsigned int op2,
                        unsigned int crn, unsigned int crm, unsigned int rt)
 {
-    uint32_t key = ENCODE_AA64_CP_REG(crn, crm, op0, op1, op2);
+    uint32_t key = ENCODE_AA64_CP_REG(op0, op1, crn, crm, op2);
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
     bool need_exit_tb = false;
     bool nv_trap_to_el2 = false;
@@ -2602,7 +2602,7 @@ static void handle_sys(DisasContext *s, bool isread,
          * We don't use the EL1 register's access function, and
          * fine-grained-traps on EL1 also do not apply here.
          */
-        key = ENCODE_AA64_CP_REG(crn, crm, op0, 0, op2);
+        key = ENCODE_AA64_CP_REG(op0, 0, crn, crm, op2);
         ri = get_arm_cp_reginfo(s->cp_regs, key);
         assert(ri);
         assert(cp_access_ok(s->current_el, ri, isread));
-- 
2.43.0


