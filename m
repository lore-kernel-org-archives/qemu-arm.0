Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4256826wrg;
        Tue, 11 Jun 2019 04:56:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPwLzy4g8mP75WuZzlPrIh6A6oQR8SllDuj3JV40XMksxMJ8s3VMuFqMm2dus5mJEV4iJ7
X-Received: by 2002:ac8:18b2:: with SMTP id s47mr62829754qtj.75.1560254169292;
        Tue, 11 Jun 2019 04:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560254169; cv=none;
        d=google.com; s=arc-20160816;
        b=k/BfA5LoFw2Mzt6lj1IkX2MfDIcC1pH7mY0XO80cHN4iNAq1/Q4lN5UOaIzkHE6clT
         i6LryjBgwiyKfkV/KSVvEQb9IIP0tEQFHEBeIJ0B8kOqPdzQu13jBGiLbbpOArCRfhAt
         ePpXdppvxhD7nrPwJavus4JsW+TCTp6Cz3KIZvi3TRgfaICxBBkEMODNWLL+roPlUVeO
         BZvxoCBcR8awlgE5uJ1xJrsf2Ch/YrZ2b+NDB00f9Ft/xNYtRUWe5ziN5jMQuHtma18n
         SOR3woduEv8B+tprJFXP6otATeTzK+y8guyoeSLNI+9j4JTgpjaT97ZNw8WSUvGxlErK
         OjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=5kclgn/mhQ0nS8PSsHlo/mWH1a0d6xpWo9XIEBfVkVw=;
        b=eGs89hnz/IOy9LGuPwtCKrnxT7HWn+GRmRxccs9EPBQdrRAGhqQtr9wN4BedAeuDwc
         BPOvwIoS+wgkXBf3k4u4oBlcxiP3yxvl73HfVokMXLuptVt5JkRhO+xb5a9rxOkAiRbY
         6InDpTpLON0Diw3+ACD9LPI6VlDmOkD6TuZ2yGM/qIWjvwASLdDbkwpzPWWYiE1szaem
         qsjjXUnR3njz+54TB8/Yjrm7NoQAk49/YGKKk4UCyMh59rE/Sw3c3TTb8pPf6hb8SNeV
         j5kVVbfYqd4QIsS9GfIfdbmo/Mawcf3NGfG1KZZBVwiqfpFnT749xDPXv9FClf+x2uSV
         SbXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uQ3SYwIt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z53si7371466qtz.218.2019.06.11.04.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uQ3SYwIt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hafNo-0003sQ-Pw
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39682)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQR-0007ev-C4
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQL-0007rD-1u
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:47 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45357)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007n0-J5
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wr1-x442.google.com with SMTP id f9so12458108wre.12
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kclgn/mhQ0nS8PSsHlo/mWH1a0d6xpWo9XIEBfVkVw=;
 b=uQ3SYwItXx9n5xeTrIbsCFvhAIWGIWRFC+o17wUQs5FpmIJzRyj7E0/SqfuvrkFpIM
 7W9w4bHv7eSu/pqJACuEPQyA/4feDaZx1FCJqR/IFuyu/UxVfjkCEdMxc8VO77hgKkfg
 S/YV+46jBHDJPWeebeuQrV+jD0HZbuB69R7yjj0HJ43zsuESAZ/YhVAVmSWLhqOMxqQb
 ER/78zcTCH8qoB6rxfJjrFaHvAzZSYOATRSNS5aDeRuqsYGw9QqV47+8vp7Fx6hG45CB
 6lkCcW2G5HDLMdNlwXc/qSGr5Pb+O0oNmBAZowoM9gzRdGUwTiqGD/LTeSM4b1on7ARn
 hmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kclgn/mhQ0nS8PSsHlo/mWH1a0d6xpWo9XIEBfVkVw=;
 b=QKC6bgb9Sm44v9TVouqQOABtseymMM5QCQt4sXeux9UtC/1JQI18SSI9Xbnz17tQI8
 KMifk70fvbEXng41vn/6JwPSIQLf1Dkpj5l6cDxZlhwxZDj1LF+hdXWcD41/y7sgif7G
 OEoEySaZqmw5kuY//CVOrNPy2fwxxIzjHs8XJlFzdZQjx0c7TKQUnaGr1acVPsIT0hBG
 QyJAI4+0g/v2zetZISM/FEvJlglCl2z0BveqQ2IzX5JJHN8XfubsNTc/tnG12Klvvg7t
 AxwaeODBcrbgGZxP6YrDKwPXRdZN36LAS9iiMLEEuY/SMMq889gA/Z5x4SkIYGCeXzhA
 Na3A==
X-Gm-Message-State: APjAAAUOTMM46i8uxg35mk6u8FD4e6nZttTiFBHO+WuQZ0YVpGEXUyDw
 U/N+B3LCmpZLFtrX8A5kjACtOw==
X-Received: by 2002:adf:d081:: with SMTP id y1mr3431016wrh.34.1560250476510;
 Tue, 11 Jun 2019 03:54:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:49 +0100
Message-Id: <20190611105351.9871-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v2 40/42] target/arm: Convert VCVT
 fp/fixed-point conversion insns to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WFihSSUiOWQs

Convert the VCVT (between floating-point and fixed-point) instructions
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 124 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  57 +--------------
 target/arm/vfp.decode          |  10 +++
 3 files changed, 136 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 161f0fdd888..db07fdd8736 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2454,3 +2454,127 @@ static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
     tcg_temp_free_i32(vd);
     return true;
 }
+
+static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
+{
+    TCGv_i32 vd, shift;
+    TCGv_ptr fpst;
+    int frac_bits;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    frac_bits = (a->opc & 1) ? (32 - a->imm) : (16 - a->imm);
+
+    vd = tcg_temp_new_i32();
+    neon_load_reg32(vd, a->vd);
+
+    fpst = get_fpstatus_ptr(false);
+    shift = tcg_const_i32(frac_bits);
+
+    /* Switch on op:U:sx bits */
+    switch (a->opc) {
+    case 0:
+        gen_helper_vfp_shtos(vd, vd, shift, fpst);
+        break;
+    case 1:
+        gen_helper_vfp_sltos(vd, vd, shift, fpst);
+        break;
+    case 2:
+        gen_helper_vfp_uhtos(vd, vd, shift, fpst);
+        break;
+    case 3:
+        gen_helper_vfp_ultos(vd, vd, shift, fpst);
+        break;
+    case 4:
+        gen_helper_vfp_toshs_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 5:
+        gen_helper_vfp_tosls_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 6:
+        gen_helper_vfp_touhs_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 7:
+        gen_helper_vfp_touls_round_to_zero(vd, vd, shift, fpst);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i32(shift);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
+{
+    TCGv_i64 vd;
+    TCGv_i32 shift;
+    TCGv_ptr fpst;
+    int frac_bits;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    frac_bits = (a->opc & 1) ? (32 - a->imm) : (16 - a->imm);
+
+    vd = tcg_temp_new_i64();
+    neon_load_reg64(vd, a->vd);
+
+    fpst = get_fpstatus_ptr(false);
+    shift = tcg_const_i32(frac_bits);
+
+    /* Switch on op:U:sx bits */
+    switch (a->opc) {
+    case 0:
+        gen_helper_vfp_shtod(vd, vd, shift, fpst);
+        break;
+    case 1:
+        gen_helper_vfp_sltod(vd, vd, shift, fpst);
+        break;
+    case 2:
+        gen_helper_vfp_uhtod(vd, vd, shift, fpst);
+        break;
+    case 3:
+        gen_helper_vfp_ultod(vd, vd, shift, fpst);
+        break;
+    case 4:
+        gen_helper_vfp_toshd_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 5:
+        gen_helper_vfp_tosld_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 6:
+        gen_helper_vfp_touhd_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 7:
+        gen_helper_vfp_tould_round_to_zero(vd, vd, shift, fpst);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    neon_store_reg64(vd, a->vd);
+    tcg_temp_free_i64(vd);
+    tcg_temp_free_i32(shift);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 99b436ad6f7..6046bb32247 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1439,13 +1439,9 @@ static inline void gen_vfp_##name(int dp, int shift, int neon) \
     tcg_temp_free_i32(tmp_shift); \
     tcg_temp_free_ptr(statusptr); \
 }
-VFP_GEN_FIX(tosh, _round_to_zero)
 VFP_GEN_FIX(tosl, _round_to_zero)
-VFP_GEN_FIX(touh, _round_to_zero)
 VFP_GEN_FIX(toul, _round_to_zero)
-VFP_GEN_FIX(shto, )
 VFP_GEN_FIX(slto, )
-VFP_GEN_FIX(uhto, )
 VFP_GEN_FIX(ulto, )
 #undef VFP_GEN_FIX
 
@@ -3050,7 +3046,8 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 19:
+                case 0 ... 23:
+                case 28 ... 31:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3070,21 +3067,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     rd_is_dp = false;
                     break;
 
-                case 0x14: /* vcvt fp <-> fixed */
-                case 0x15:
-                case 0x16:
-                case 0x17:
-                case 0x1c:
-                case 0x1d:
-                case 0x1e:
-                case 0x1f:
-                    if (!arm_dc_feature(s, ARM_FEATURE_VFP3)) {
-                        return 1;
-                    }
-                    /* Immediate frac_bits has same format as SREG_M.  */
-                    rm_is_dp = false;
-                    break;
-
                 default:
                     return 1;
                 }
@@ -3143,17 +3125,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             /* Load the initial operands.  */
             if (op == 15) {
                 switch (rn) {
-                case 0x14: /* vcvt fp <-> fixed */
-                case 0x15:
-                case 0x16:
-                case 0x17:
-                case 0x1c:
-                case 0x1d:
-                case 0x1e:
-                case 0x1f:
-                    /* Source and destination the same.  */
-                    gen_mov_F0_vreg(dp, rd);
-                    break;
                 default:
                     /* One source operand.  */
                     gen_mov_F0_vreg(rm_is_dp, rm);
@@ -3170,18 +3141,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 20: /* fshto */
-                        gen_vfp_shto(dp, 16 - rm, 0);
-                        break;
-                    case 21: /* fslto */
-                        gen_vfp_slto(dp, 32 - rm, 0);
-                        break;
-                    case 22: /* fuhto */
-                        gen_vfp_uhto(dp, 16 - rm, 0);
-                        break;
-                    case 23: /* fulto */
-                        gen_vfp_ulto(dp, 32 - rm, 0);
-                        break;
                     case 24: /* ftoui */
                         gen_vfp_toui(dp, 0);
                         break;
@@ -3194,18 +3153,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     case 27: /* ftosiz */
                         gen_vfp_tosiz(dp, 0);
                         break;
-                    case 28: /* ftosh */
-                        gen_vfp_tosh(dp, 16 - rm, 0);
-                        break;
-                    case 29: /* ftosl */
-                        gen_vfp_tosl(dp, 32 - rm, 0);
-                        break;
-                    case 30: /* ftouh */
-                        gen_vfp_touh(dp, 16 - rm, 0);
-                        break;
-                    case 31: /* ftoul */
-                        gen_vfp_toul(dp, 32 - rm, 0);
-                        break;
                     default: /* undefined */
                         g_assert_not_reached();
                     }
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 1a7c9b533de..c3223a124ac 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -224,3 +224,13 @@ VCVT_int_dp  ---- 1110 1.11 1000 .... 1011 s:1 1.0 .... \
 # VJCVT is always dp to sp
 VJCVT        ---- 1110 1.11 1001 .... 1011 11.0 .... \
              vd=%vd_sp vm=%vm_dp
+
+# VCVT between floating-point and fixed-point. The immediate value
+# is in the same format as a Vm single-precision register number.
+# We assemble bits 18 (op), 16 (u) and 7 (sx) into a single opc field
+# for the convenience of the trans_VCVT_fix functions.
+%vcvt_fix_op 18:1 16:1 7:1
+VCVT_fix_sp  ---- 1110 1.11 1.1. .... 1010 .1.0 .... \
+             vd=%vd_sp imm=%vm_sp opc=%vcvt_fix_op
+VCVT_fix_dp  ---- 1110 1.11 1.1. .... 1011 .1.0 .... \
+             vd=%vd_dp imm=%vm_sp opc=%vcvt_fix_op
-- 
2.20.1

