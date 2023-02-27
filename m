Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4300464ejc;
        Sun, 26 Feb 2023 21:49:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9P/mSHc4VE4JVX8chhR8UzYOTYqDcW4wtEzbC7byuaDWWLYrfurQG63LqVBnCyoKGCYWVV
X-Received: by 2002:ac8:7f95:0:b0:3bd:ad1:49c with SMTP id z21-20020ac87f95000000b003bd0ad1049cmr45146940qtj.24.1677476965121;
        Sun, 26 Feb 2023 21:49:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476965; cv=none;
        d=google.com; s=arc-20160816;
        b=RT9YRXTFSE9tU3OmS+dlTThQba46cDS/KvM48DYrw82ANKoemBzZp41u49cEz/ODmx
         fDzrg/e/ebGy8UaEeOByBtC/YZ8fVFU/dWBXPiXozCI6LR8qZpChU7/JgBgKYfEjiA0I
         8V1r03kTLxPVl9I1HCAscc1cPnOSkY1r8VzmYQgCgVzTKgy0+0DaVpHFCAGaEjJ4Twg/
         rlr4Sp3rRMGwVyOhx1elKqmA8N8UwHg0xwgjdnpjNT4BDYxyukwZcPuEpV2iKcaGAOPl
         Dq7OkhJ00VMl3fqnFIMgCq+UcMNwK6Z/6P3pJy+K2hZcESGWsJWENORwpEAyj/rFTUA1
         BKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=J6bFQbr4bFP1rh4Nb5AKcYb/yq2BEfgRK7JPoiaNmaA=;
        b=NcCYAdijETaOTaluZSvI37EwYJkRgpvPerffDiwjOJf+ZpW2edTW+n6E1XgVEZKLcQ
         Jb8OLdx63Jov8NwAsvO5r6QBcpxWq0SVMODqaGMzQE1Mul9llqQLRl5ujp5XecCtPDgv
         vHUUV+KOLn1OfgmESykJnjUjA3udapmdgF+XCXZ3d2tKVFUsnxOVo3Wmz/ekDT4CeAWD
         L6c10FsVC5L8OnJ1Zmi/K4yy8y0ifWv5vE1YNnsIhVJ3ZibUir9lMK0AgDrFfVVo3f9p
         d1C5cZPug+sT3lkNF8tA9B/Wr6jB+rsGnTTwaNppL7um8hxebKdx7JPmj5eVThAN0uQz
         o8jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CdPLsiuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22-20020a05622a135600b003b9a3723193si6225390qtk.204.2023.02.26.21.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:49:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CdPLsiuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWHy-0002dm-TM; Mon, 27 Feb 2023 00:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHs-0002Jw-U3
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:00 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHq-0004pZ-Qz
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:00 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 16so2830460pge.11
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6bFQbr4bFP1rh4Nb5AKcYb/yq2BEfgRK7JPoiaNmaA=;
 b=CdPLsiuQ19juWpyq14r/MO76tXcmg+ScjE9v9VqqyD6flMQpnFswRfylRCqikQCApK
 i5VKVDzGOrtUFcDBiRQmDS1Dq6/yi9fgyWzbu6B/xgk+aUqLjgb3ZkDizuDUYFSipyOp
 CC2d3IUMQlxf6rdHD7iitQiIWH95SeCYIfer/Y0yXnWiUd6k4Rt3IYQZIoxWqzR9dy8z
 3aO8+mkwGrUNl8fiySV19x5ulWOytqCNoD9rO3Ws9sxGs3/iOridir+dcNQuQJ61LmPs
 CPIrWo2bHogZNJOOFjUhtuBr4UvP3HLgT0d3qoF5e6HoLOtUrWH/Sw80o0hNtkU2NRYZ
 Xb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6bFQbr4bFP1rh4Nb5AKcYb/yq2BEfgRK7JPoiaNmaA=;
 b=CJKKpnO59rBtHnYUrw2A7iSYcKkambqU7FtdF8RDWpXQ/kYWaFvaY9Vi9tp5P9dMvF
 zk566QqpRZO/L8vkqskeAc7krjatNqk+eDcFkLXnSSanPY+/lo7lROwqavDU72VaQbfz
 znx2i3AnD1eJaceHe+V71pVqaYkQRj3356dhnda0M5RmGHOlOEfRN6cHug8COjv/IkeH
 S/MZ/4j7GGrPlmJLvfbpwYxQK7YuVuf9W1mDk414B0uATVRWNHXeQZ3k921kAe1VRITS
 3dooHqXif8PhtwD5OQNx5xsQZVe49bvrgHKTLZ858haIon8znfIRbvHClnKtejtB3Zz5
 sDFg==
X-Gm-Message-State: AO0yUKWe18Y9UfeAirSVXeboeqO7mBuvY/pFZsplImsAH52lzikAV/My
 WVR+SlzXhYaBT7RA9IYBQ8f93Q==
X-Received: by 2002:aa7:958a:0:b0:5e1:f54e:8074 with SMTP id
 z10-20020aa7958a000000b005e1f54e8074mr10046437pfj.21.1677476577405; 
 Sun, 26 Feb 2023 21:42:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 05/70] target/arm: Create gen_set_rmode, gen_restore_rmode
Date: Sun, 26 Feb 2023 19:41:28 -1000
Message-Id: <20230227054233.390271-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: LWLDwAAP/pUl

Split out common subroutines for handing rounding mode
changes during translation.  Use tcg_constant_i32 and
tcg_temp_new_i32 instead of tcg_const_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 17 ++++++++++++++
 target/arm/translate-a64.c | 47 +++++++++++++++-----------------------
 target/arm/translate-sve.c |  6 ++---
 target/arm/translate-vfp.c | 26 ++++++++-------------
 4 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3dbff87349..062f91de54 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -616,6 +616,23 @@ static inline TCGv_ptr gen_lookup_cp_reg(uint32_t key)
     return ret;
 }
 
+/*
+ * Set and reset rounding mode around another operation.
+ */
+static inline TCGv_i32 gen_set_rmode(ARMFPRounding rmode, TCGv_ptr fpst)
+{
+    TCGv_i32 new = tcg_constant_i32(arm_rmode_to_sf(rmode));
+    TCGv_i32 old = tcg_temp_new_i32();
+
+    gen_helper_set_rmode(old, new, fpst);
+    return old;
+}
+
+static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
+{
+    gen_helper_set_rmode(old, old, fpst);
+}
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3c0462a9c1..9e682f36c9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6146,13 +6146,12 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
     {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(opcode & 7));
+        TCGv_i32 tcg_rmode;
+
         fpst = fpstatus_ptr(FPST_FPCR_F16);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        tcg_rmode = gen_set_rmode(opcode & 7, fpst);
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
         break;
     }
     case 0xe: /* FRINTX */
@@ -6231,10 +6230,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6304,10 +6302,9 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6944,9 +6941,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             rmode = FPROUNDING_TIEAWAY;
         }
 
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
 
         switch (type) {
         case 1: /* float64 */
@@ -7023,7 +7018,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             g_assert_not_reached();
         }
 
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -8771,9 +8766,8 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
 
     assert(!(is_scalar && is_q));
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     tcg_fpstatus = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, tcg_fpstatus);
     fracbits = (16 << size) - immhb;
     tcg_shift = tcg_constant_i32(fracbits);
 
@@ -8831,7 +8825,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    gen_restore_rmode(tcg_rmode, tcg_fpstatus);
 }
 
 /* AdvSIMD scalar shift by immediate
@@ -10219,12 +10213,11 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
-        tcg_rmode = NULL;
         tcg_fpstatus = NULL;
+        tcg_rmode = NULL;
     }
 
     if (size == 3) {
@@ -10276,7 +10269,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12406,8 +12399,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         tcg_fpstatus = NULL;
     }
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
         tcg_rmode = NULL;
     }
@@ -12590,7 +12582,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     clear_vec_high(s, is_q, rd);
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12758,8 +12750,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     }
 
     if (is_scalar) {
@@ -12859,7 +12850,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3c65dd1ff2..3ca60fb36b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4096,17 +4096,15 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    tmode = tcg_const_i32(arm_rmode_to_sf(mode));
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-
-    gen_helper_set_rmode(tmode, tmode, status);
+    tmode = gen_set_rmode(mode, status);
 
     tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                        vec_full_reg_offset(s, a->rn),
                        pred_full_reg_offset(s, a->pg),
                        status, vsz, vsz, 0, fn);
 
-    gen_helper_set_rmode(tmode, tmode, status);
+    gen_restore_rmode(tmode, status);
     return true;
 }
 
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index e7acfb3338..dd782aacf4 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -464,8 +464,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         fpst = fpstatus_ptr(FPST_FPCR);
     }
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_op;
@@ -489,7 +488,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -533,9 +532,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     }
 
     tcg_shift = tcg_constant_i32(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_double, tcg_res;
@@ -572,7 +569,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -2783,10 +2780,9 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2808,10 +2804,9 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rints(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2842,10 +2837,9 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     tmp = tcg_temp_new_i64();
     vfp_load_reg64(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rintd(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg64(tmp, a->vd);
     return true;
 }
-- 
2.34.1

