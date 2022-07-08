Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp335610lft;
        Fri, 8 Jul 2022 08:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7y04uNvbzjHr7BsZVuKUcM6+w3Hqdj8MTgBhcZqfbvTAxXIKirMPOIoWZI3iF9w+OkA/l
X-Received: by 2002:a05:620a:1a15:b0:6a9:3829:b6e with SMTP id bk21-20020a05620a1a1500b006a938290b6emr2790052qkb.756.1657293881648;
        Fri, 08 Jul 2022 08:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293881; cv=none;
        d=google.com; s=arc-20160816;
        b=z/a4mVjRbvz0DD624VlUcafMkStopWcH2U97kr/Go+RCFuO6ZfePWRFlXTnBwRWCpn
         Cap99R6hwd1V0aGXK2qYGE9lyaBrbPqEVc/deOvS/vxVzmO7Uk6dl3NeAR3MNG4AprPs
         y2c9xaWah6gSEpWFbrnJg8docVfXMi0q1VDt7oWFYeHaz9We5yMu7b532OypPtnbc36A
         PIjwkgks2mQXD/YtnUA3YYOK5mohInV4bU04G+5UOw8Cy5hbNtiXFgnDufvBMQLs934o
         QJ+bXzApkgsL6xJ+3WUxFkgoFT6QYs13Qhc4tCjQQDFCadleznVnU6IHIEynbl6Vxc8s
         fN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
        b=fYlNkrA5LvoOUZmZbUIYj/+DYFGK1WyRei11wkwDAqJWPdjkesvn2hZnwCJMwXsHmb
         YUE+78TC+krIM+jUG7l8/8CglhAGc6ezNucmtNPx4eGG67D4VksElgt7YQavsmF0cTmT
         9H2FsM7BRA7FH/0PmDgxYNzj/Xx8+mUVaRSufOqfyyVuJUqYmBfEhyvcKtQWhUdYLjcC
         leGtE1GEay0UK8tOoHK9M60fEqPT2jmJIxNPvauOWwvwpiui+Q+ImfdeN9kjOJO6rnV3
         p8psZhnM0WhFl1sflZEhwjfNJHOPo0H8ZxgLiKlrS5i0ipFpnmZDIW35B9eH5okn6bI1
         2gFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjokr42D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv2-20020ad45ce2000000b0047316c70030si6580406qvb.48.2022.07.08.08.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjokr42D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pqT-0002oD-4y
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pix-0003OE-1N
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:56 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piv-0002M9-24
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso1841126pjz.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
 b=vjokr42DkLjycxKd0gRZFbjH7r5W/ojBDlhKecp1yUpRtx95O3IdJQlpe3x4dZw1Ww
 ryObICQ4LnsmVmBM4XQfBbSoX4rPi6s8OV4z2qL7HNyFlg6514SWB2C2W4RAdcVPspmr
 hS2fXZv8LENn0ZZFfU6hXDQ6bluDVhr8fuvEZu+uYZ4pvxD5Uvf2AssWmtc6F+FnFzIC
 4IapOeS9CcHgIh2MjA6geiBGvFgQUbD3j6peoj+E1tORFa0R+adP/w6XkADU4NjAcmAK
 ufS/77LDNISBrswksUlMg80Z3lSS+DnYyEpZWML+tCvXLjpAlEtcePZUv3l2pUpXgRU/
 c7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
 b=oCt6HUilHf4TaTZg6txceqUB4tNi8V5q1jlLCfakXrauhAXSit5CNuKgz23rtkAsAY
 f9ex8d/IwHQf0ehDzLF2Pw8UOBgU2ZBk5+uxwyovH1AJPddiFKLWgVTcJwBTfx/yxEiQ
 dRPd5YxvNcnOCcKMfH1tAj0o/oBxDFtD1PlayZn2swOdwrqJEuQNS4gCF6zQwQoJgoa0
 8ALjr/4VYQleuUynpXird2eBtIP+5Fv7UwGPGGvNmyGvMIK08UxpPU6Yr9QboQMz7St8
 /eY5Wa0wmSF+fAnHv9FcpOojMf5Pp1Fhuy6V/o6G0YC0fQucXC/zE7hVd7bsMKu5Xjco
 VVNA==
X-Gm-Message-State: AJIora9fNq1MPoe1t4AOFSSCiHa82Humo4n0+xsBbEytlnp/WxnHegFM
 os4+nEgUelpR3ybqHs+VVL4GGVEqEfOuVSaA
X-Received: by 2002:a17:903:32c4:b0:16a:4227:cd68 with SMTP id
 i4-20020a17090332c400b0016a4227cd68mr4075185plr.173.1657293411712; 
 Fri, 08 Jul 2022 08:16:51 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 21/45] target/arm: Export unpredicated ld/st from
 translate-sve.c
Date: Fri,  8 Jul 2022 20:45:16 +0530
Message-Id: <20220708151540.18136-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MlgC+qpmX7uB

Add a TCGv_ptr base argument, which will be cpu_env for SVE.
We will reuse this for SME save and restore array insns.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  3 +++
 target/arm/translate-sve.c | 48 ++++++++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 2a7fe6e9e7..ad3762d1ac 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -195,4 +195,7 @@ void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t rm_ofs, int64_t shift,
                   uint32_t opr_sz, uint32_t max_sz);
 
+void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 95016e49e9..fd1a173637 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4306,7 +4306,8 @@ TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
  * The load should begin at the address Rn + IMM.
  */
 
-static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
+                 int len, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4332,7 +4333,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
-            tcg_gen_st_i64(t0, cpu_env, vofs + i);
+            tcg_gen_st_i64(t0, base, vofs + i);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
         tcg_temp_free_i64(t0);
@@ -4345,6 +4346,12 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (base != cpu_env) {
+            TCGv_ptr b = tcg_temp_local_new_ptr();
+            tcg_gen_mov_ptr(b, base);
+            base = b;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4352,7 +4359,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         tcg_gen_addi_i64(clean_addr, clean_addr, 8);
 
         tp = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_add_ptr(tp, base, i);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_gen_st_i64(t0, tp, vofs);
         tcg_temp_free_ptr(tp);
@@ -4360,6 +4367,11 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
+
+        if (base != cpu_env) {
+            tcg_temp_free_ptr(base);
+            assert(len_remain == 0);
+        }
     }
 
     /*
@@ -4388,13 +4400,14 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         default:
             g_assert_not_reached();
         }
-        tcg_gen_st_i64(t0, cpu_env, vofs + len_align);
+        tcg_gen_st_i64(t0, base, vofs + len_align);
         tcg_temp_free_i64(t0);
     }
 }
 
 /* Similarly for stores.  */
-static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
+                 int len, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4420,7 +4433,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
-            tcg_gen_ld_i64(t0, cpu_env, vofs + i);
+            tcg_gen_ld_i64(t0, base, vofs + i);
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
@@ -4434,11 +4447,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (base != cpu_env) {
+            TCGv_ptr b = tcg_temp_local_new_ptr();
+            tcg_gen_mov_ptr(b, base);
+            base = b;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
         tp = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_add_ptr(tp, base, i);
         tcg_gen_ld_i64(t0, tp, vofs);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_temp_free_ptr(tp);
@@ -4449,12 +4468,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
+
+        if (base != cpu_env) {
+            tcg_temp_free_ptr(base);
+            assert(len_remain == 0);
+        }
     }
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain) {
         t0 = tcg_temp_new_i64();
-        tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
+        tcg_gen_ld_i64(t0, base, vofs + len_align);
 
         switch (len_remain) {
         case 2:
@@ -4486,7 +4510,7 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4499,7 +4523,7 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4512,7 +4536,7 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4525,7 +4549,7 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
-- 
2.34.1

