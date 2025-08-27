Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094DFCA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dS-0007OL-N8; Tue, 26 Aug 2025 21:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cx-0005ML-B2
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:05 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cg-0007Ry-Uu
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:01 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-771ff6f117aso1013853b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256804; x=1756861604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xm+DiQK3QPrsWhspwKpORtvyMvoqamrQ0zoWrs8mIIg=;
 b=UD76AQ8cMaHTg5s1d0d3NXo6BJRRAwlL3TehQuq+fE9+QinvRcjwiJv/g5jtFVDGiO
 CjzKFw89ZSW9PAE6Yx4cypjX/AxSS4Tl25vUgzoyuSY0lRLMwlws5SHzyd1qSKWsuIUw
 jr3xijRBUCSk1D8xBHvgbWnpYtTUax0c57Qm0nZmsR8NFjy5rKFZW04bKNNHihsUDE56
 DKyVZufDAqh731z74C7Vx0k1KrMBwRJl8oUMPa8UvxUpKjnUg+FgmTnzTk4zIIEHCWTI
 MGT5RONEQsCOqsuhgwSD10G9rRcBeUydonJ4rba6FAzbLE6+B/LZZ7sdadJMAst8QAMT
 Z9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256804; x=1756861604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xm+DiQK3QPrsWhspwKpORtvyMvoqamrQ0zoWrs8mIIg=;
 b=DmLKdchm6OysVG0mz/zIVuBGYlxjZSJXcmsGd44K4TDwx00muvGWDcN/hX54bW8zFh
 FU2P5TN1gvhL+oIBaGAwTNjTiFr6yivl3nSVqq6IwEYA+2hr0yq4ZgkwJ2gziPIxSt1b
 NUgQCrBodaXPC15YPWxlBDHXW4W1ZGEjAGLdDxzozDEEdZe0dCJjl5cskZ35YX4U7EBC
 5qncph9bTAgP8FxkaK6lYby6TS0+fJu/eUsnsxKFdxl8eUo0RNL09BRZYiigW6cZP+lZ
 4ulJaaVDPBBeo45EBwVkTQlGGteVejizPDlrD+QF97+Q4GRSQWAN5ZmoMiVL44oHGBwE
 6b+g==
X-Gm-Message-State: AOJu0YxXNZiyEH1o5Ss6Sy2CZxT5EEFn7GVJdDUSOhPfFlAmcWd7QEhD
 B/omX3vh2I6KzZ4Nk4971FT6+dUWuz+NonJLg/Pgb4M6dnDEEGW1E1tc2ODMrnGFKRA=
X-Gm-Gg: ASbGncuCtH61ePVP0eLc9vZnW4iMD3rJ5u5vfV9ZTu48RsUEfGrduA4Op2eBGJufvE/
 0MYQCAsKLesQ8jMRQN+qLt7yCgfk4yz22s61pDHmk2KdSYajgTZ5++l0s1Jj9F5T/wxQS/MdQF7
 cEy5L8EWP4wX+3lzsW4AH7wXAScXYmsD5AFFl0lP73ZPVjtLHmx3AL4tdijEF1VfOzXeUk6qX1a
 5DECxnYznDq1f6XniiR8Gi5Iwm7aQfi8Xl15vx+IpMnhUIMCKBCx9t5OQet9Ee/+PV+ZLliPTgU
 8TIWksDrq5YCn3Fyd1gshrrEkFcK1H0zpXyLD1DFxD8LFZiHKTmqL/Jfu7ChVB8mlYQWKjI7xGL
 yxeG/CEi405uplH8BznpxqLaUTA==
X-Google-Smtp-Source: AGHT+IFavYLkjFmtmd47RFYLz95wqtF/AITqoCSmalH++VzPT9h05R1tRUpwCLbHP1Ad/lvtP/Hd+g==
X-Received: by 2002:a05:6a00:23d1:b0:771:e1bf:bddc with SMTP id
 d2e1a72fcca58-771e1bfccbfmr13032300b3a.13.1756256804289; 
 Tue, 26 Aug 2025 18:06:44 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:06:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/61] target/arm: Reorder ENCODE_AA64_CP_REG arguments
Date: Wed, 27 Aug 2025 11:04:10 +1000
Message-ID: <20250827010453.4059782-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
index 93cae888e2..b48b669a6a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4527,7 +4527,7 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
     };
 
 #define K(op0, op1, crn, crm, op2) \
-    ENCODE_AA64_CP_REG(crn, crm, op0, op1, op2)
+    ENCODE_AA64_CP_REG(op0, op1, crn, crm, op2)
 
     static const struct E2HAlias aliases[] = {
         { K(3, 0,  1, 0, 0), K(3, 4,  1, 0, 0), K(3, 5, 1, 0, 0),
@@ -7299,7 +7299,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
          */
         assert(cp == 0 || r->state == ARM_CP_STATE_BOTH);
         cp = 0;
-        key = ENCODE_AA64_CP_REG(r->crn, crm, r->opc0, opc1, opc2);
+        key = ENCODE_AA64_CP_REG(r->opc0, opc1, r->crn, crm, opc2);
         break;
     default:
         g_assert_not_reached();
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index af03fc7fc1..bda57614ed 100644
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
index 743c5a10e1..58303c224f 100644
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


