Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5222785lfh;
        Thu, 2 Jun 2022 15:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAIxc0/2LbpptHDuMxf9As/ve18wz+PninJMDotksi19hdzw6LClU+qvi2GvDmhdQqo3Yr
X-Received: by 2002:a05:6214:889:b0:464:4ce8:62ce with SMTP id cz9-20020a056214088900b004644ce862cemr19176704qvb.35.1654210042759;
        Thu, 02 Jun 2022 15:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210042; cv=none;
        d=google.com; s=arc-20160816;
        b=VMcpPEUkM+whd3Wo351hBZc8rpAaze3G2hI8gb2t7FjrAVp1FIRlMYX9AU3RxfmkaX
         YD9/cH7FvMtaYPwlS+jJyXc1XtF4t1NwIyjOkfhIbkc9KTEpC3Tj2AG+ILgeQC0kla+H
         2A8ZIrKA450wCK7+OCVdmJHf+0g+s5tnVrthFZc2wnaOmTXzrAfLxPG/gWVwW4AqISuj
         KgpX3jmEFI1k+Eh1yM2P68HQnVC2MCSWQjl5NLUAmbMJO7miZr0RO8g6my9Oqkf9df/R
         VnKT6kJZTmBnm6tUHO9k95NiZwDSk7IagKR2vOFIylysjiLk2RmEfvO6g0F+XMOBZqZr
         +HDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hBZdPZWCdnFknqirCWCAN0zMysKwnh33zUMVY3zWbxw=;
        b=HNmqhoFa5CF1hO4rr6hstFXf/xKJTfUa8O1RzUcUka14rtCb2vYsNqezx5o60p5wvD
         FBDQf7wWxy4sr4UphjZBFJqX5FmUOhbXC7eV08evEIohHnNPHEZ0QuXL69cz9etRvA0j
         GTp2LilIsoytA8EjAAX+8MZkb7kSJyqThVsY4QRb3hK5BqW8JV4iE21w8ELfB0MK81oU
         ykONBPhSEEzRBUjf32NU8u+EiUs1QAUrnFq5XY1FH4VYiZ2fAlPuIR0m7BqjqFyYlvot
         y9ZXYL00D8VmXHXiKPZaZ8/gfC31favDSrn2HF+BsoqovpbjQuy9dIHUISwI9fXWDAFF
         ddGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNh13BfV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22-20020a05622a135600b002f3c6aa6cd1si2804535qtk.495.2022.06.02.15.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNh13BfV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtb8-0008DE-7q
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001ic-1b
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskL-0000xB-Dy
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:52 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id el14so4460405qvb.7
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hBZdPZWCdnFknqirCWCAN0zMysKwnh33zUMVY3zWbxw=;
 b=UNh13BfV7arA5TxObmWyk4RxENWFy7Fxw2O8EH2PYF5eIgLYtQ6qv/c9wau5my+FZV
 7OUy9EpTk5lCrrOgFUwSfnT36X8HVtcctH1NvymVOUW0Try7w++FwidfcuromWfjd9yT
 NBxFLnWRG4HeX6BBiRMEhEHI6zNfPC8Fjoc1HwjRAou6fgul2dtx4MxAWkj1Vm41ufdz
 qJ/SolNoycnVx1FVhCJUg3dEieCeXd4opCao1koeLYqySNLgT/pfE1FOwZltmPYF8vnT
 vqfDJU91bewoWOTAqkl+l0VYnRTY48s4lT40caFzyYOz8knJm4an771ca+N1W9w6tQMr
 SQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBZdPZWCdnFknqirCWCAN0zMysKwnh33zUMVY3zWbxw=;
 b=A2mCashB0+zOsF3/PjPFllI+ysVN/UR8lvPC6Q4jjYzQaCFhyLScOIou2rZws834kt
 k9xtNh380RoAb7sL8NcoqUfIjw2yQoesITa8wd3844eKE+DWqEBkvUpqxpFS3DuacUX6
 8pqFpYxVuihmaaVMBQ2aVTXcGho1/yOvjaX5eo161RoIojrSZ6ykLL9fFMApNtOniX15
 LnSY6j+LT+fUvb6aWwJCsjsffedYAP5waSrG0kNrduYKR0xGYX/oj64G5QSak8sG+ZfL
 PyhX/gHJRTpnAuHlEmo7SW3yVFXh6BtSygvDNNaEv0V/lUXoahTmnEXxPug2b+JDd0F+
 3w6g==
X-Gm-Message-State: AOAM530W7SRdYTdALmMBXzqdO166M/wkNMBYF87zXLEMK3oemQKcrE8o
 ZEaumHWhcozKQMw+qBICDsg8pnZ/ucXYxQ==
X-Received: by 2002:a17:903:41c1:b0:163:771e:e61c with SMTP id
 u1-20020a17090341c100b00163771ee61cmr6945534ple.49.1654206756302; 
 Thu, 02 Jun 2022 14:52:36 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 47/71] target/arm: Export unpredicated ld/st from
 translate-sve.c
Date: Thu,  2 Jun 2022 14:48:29 -0700
Message-Id: <20220602214853.496211-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YHsQiNiWyuZ8

Add a TCGv_ptr base argument, which will be cpu_env for SVE.
We will reuse this for SME save and restore array insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  3 +++
 target/arm/translate-sve.c | 48 ++++++++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index c341c95582..54503745a9 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -165,4 +165,7 @@ void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t rm_ofs, int64_t shift,
                   uint32_t opr_sz, uint32_t max_sz);
 
+void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
+
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 13bdd027a5..adf0cd3e68 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4294,7 +4294,8 @@ TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
  * The load should begin at the address Rn + IMM.
  */
 
-static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
+                 int len, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4320,7 +4321,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
-            tcg_gen_st_i64(t0, cpu_env, vofs + i);
+            tcg_gen_st_i64(t0, base, vofs + i);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
         tcg_temp_free_i64(t0);
@@ -4333,6 +4334,12 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
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
@@ -4340,7 +4347,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         tcg_gen_addi_i64(clean_addr, clean_addr, 8);
 
         tp = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_add_ptr(tp, base, i);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_gen_st_i64(t0, tp, vofs);
         tcg_temp_free_ptr(tp);
@@ -4348,6 +4355,11 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
+
+        if (base != cpu_env) {
+            tcg_temp_free_ptr(base);
+            assert(len_remain == 0);
+        }
     }
 
     /*
@@ -4376,13 +4388,14 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
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
@@ -4408,7 +4421,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
-            tcg_gen_ld_i64(t0, cpu_env, vofs + i);
+            tcg_gen_ld_i64(t0, base, vofs + i);
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
@@ -4422,11 +4435,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
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
@@ -4437,12 +4456,17 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
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
@@ -4474,7 +4498,7 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4487,7 +4511,7 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        gen_sve_ldr(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4500,7 +4524,7 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        gen_sve_str(s, cpu_env, off, size, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4513,7 +4537,7 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
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

