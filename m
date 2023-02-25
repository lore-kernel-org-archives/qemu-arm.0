Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2634524ejc;
        Sat, 25 Feb 2023 01:16:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+y58/gnP8L9u0+DQpD/S+gPxPFILWUZnk8cym8wjiYfAjkPZRfbdBKAG+m3Z6agHm8fD+n
X-Received: by 2002:a05:622a:64e:b0:3b8:6763:c25f with SMTP id a14-20020a05622a064e00b003b86763c25fmr17193046qtb.13.1677316569887;
        Sat, 25 Feb 2023 01:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316569; cv=none;
        d=google.com; s=arc-20160816;
        b=SRPreQwf3klZxclC+UROwU2TW7jdxhK9yaU7QvNULIRe/nzH/9oMghfPh+WcmN63en
         0rTuRjTyur8kc8+0E2ugb1NF5E+ZVfHNE6dZp+vOoPnY7yqY7mMtxrdbXQFIYpB3nr9m
         Cqjapmz6tjY8WqcfmDLqJLOjHCJrzz7770h5WF55EB5mXYZMTDcDZ7PAh41mVSvLkXEv
         HuawnmsgKjq5khLeIIbkLu/bvc3RkIscgWuBe/vXuv+u+x6wR08pF+H/pMcNnyMqWHW6
         HzgmVWqvCUuzskDOnWWe5cZyQzIbKVdxA8JGcYojOTizSqCenGhk2kom+fegfj4oc0+y
         lD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P8j3IPZTVyN+dZUsOhoCKYp0bksAGUAJsCP3IzISZ8Y=;
        b=Ws5b2c6PpdLn+pxc+3asrtDSqDTV/Ue3q3uR60y91NLGPIDyl89L8I54iXdJdVQwx8
         31Yu5o+hqJKXl/7TF0Xb94N7iVKPChtizGWyF0u4AlOa+BxJhA5FO+NiwLDb4NECXauw
         7G5doA6nBmdSGUPGg/QyW59TcXLxvCj3a2jEV4RA0nIwtb7M3LKgrq5P/Ee7F6ztXfRH
         cAog96EZHUprLzQcUWL3pyrruYXP165WD2xdetc+HjOhRaahdboW/wnM/PRjDgqe3gG/
         Pcj+6z3NIAAis0N2iLq0Fyj0cNQsuaRPMEIgQYxahgCeC6oBqPe/HR2wUf9j/kSnvQo5
         PXuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnO8Rywr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r189-20020a37a8c6000000b00723b9fa217bsi1221394qke.490.2023.02.25.01.16.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:16:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnO8Rywr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqdw-0004pt-2F; Sat, 25 Feb 2023 04:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdu-0004nj-Nq
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:58 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdq-0001Tm-LQ
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5184555pjb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8j3IPZTVyN+dZUsOhoCKYp0bksAGUAJsCP3IzISZ8Y=;
 b=hnO8RywrmUO1SnD6e9SiXnibf+TtDXEsLXwhbArJp4RjVLqbKNQ3KVNIcXslx97+uZ
 QQn+Z6Cixm1PCr2V2sSi0HtFOTjVyVHq7v0E6oDb1rRIxcdmJ0SSs2n+AbT6Gw5Er84/
 Gx5MPZaGwPVwoFFeUViT5F3dSQTMp+sHv2Vhx6lkPmqcI3H8Qzjp5f1rN7tUaqN3YxN9
 W2yoH1SJaKnMDrslJXtEcfGYrap/E/mpjrw36i9MXPXMajTvY9N/9B1BRyf40IBRBd5j
 WiawVQpsp+n2hELjCWutIItmIRPI2reXkcroKasHBO1wqQYZIT4FshVAUm5PU0QvpDKO
 w3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8j3IPZTVyN+dZUsOhoCKYp0bksAGUAJsCP3IzISZ8Y=;
 b=prh3/agL54bmRw4U/G1af3Tt1ch48UJE/dNIZLtXKAJ2UKcA2ozCqygJsS5XaqKH3d
 s9OsBb748lEI1r73ZMn3h+0b7lZ32r1/6KSNGbbP4A5uTxyj8cGIPuLjPag/9c1QkIDY
 MZfTiWXKnNJe57Fgws+IpMiocg04NJ3fkIRvOhmAnHV5JEcVuMe48ZunD5bR2Itkjzdp
 IywDl1veBr4gAdzIEdQtj5a/jFCjN0AEI7fxYd3Racnw0b7p0AngLHHJZ6LiRvOGjFiM
 UMzbt3NfLGIFf79KRgcveyx8W7sacQzAWi6sQQh3v8SMXOID3K0wEDVJ7gf0slPmYRNi
 5irg==
X-Gm-Message-State: AO0yUKUHcTSLTBpZJp1SQU3w6Jusu8q+5/hSO5nW4of3Pj6uym+L83M8
 IA+yVctDYsP22BAndqeAi1JCajiZAB8hrQWGT7M=
X-Received: by 2002:a17:903:11d2:b0:19c:be03:d1b8 with SMTP id
 q18-20020a17090311d200b0019cbe03d1b8mr9197832plh.17.1677316493149; 
 Sat, 25 Feb 2023 01:14:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 08/76] target/arm: Drop new_tmp_a64
Date: Fri, 24 Feb 2023 23:13:19 -1000
Message-Id: <20230225091427.1817156-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yDrDxdvfDeGL

This is now a simple wrapper for tcg_temp_new_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 -
 target/arm/translate-a64.c | 45 +++++++++++++++++---------------------
 target/arm/translate-sve.c | 20 ++++++++---------
 3 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index ca24c39dbe..8ac126991f 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,7 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-TCGv_i64 new_tmp_a64(DisasContext *s);
 TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 98d1bee5d5..04872d9925 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -224,7 +224,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
-    TCGv_i64 clean = new_tmp_a64(s);
+    TCGv_i64 clean = tcg_temp_new_i64();
 #ifdef CONFIG_USER_ONLY
     gen_top_byte_ignore(s, clean, addr, s->tbid);
 #else
@@ -269,7 +269,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
 
-        ret = new_tmp_a64(s);
+        ret = tcg_temp_new_i64();
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
@@ -300,7 +300,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
 
-        ret = new_tmp_a64(s);
+        ret = tcg_temp_new_i64();
         gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
@@ -408,14 +408,9 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-TCGv_i64 new_tmp_a64(DisasContext *s)
-{
-    return tcg_temp_new_i64();
-}
-
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 {
-    TCGv_i64 t = new_tmp_a64(s);
+    TCGv_i64 t = tcg_temp_new_i64();
     tcg_gen_movi_i64(t, 0);
     return t;
 }
@@ -456,7 +451,7 @@ TCGv_i64 cpu_reg_sp(DisasContext *s, int reg)
  */
 TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf)
 {
-    TCGv_i64 v = new_tmp_a64(s);
+    TCGv_i64 v = tcg_temp_new_i64();
     if (reg != 31) {
         if (sf) {
             tcg_gen_mov_i64(v, cpu_X[reg]);
@@ -471,7 +466,7 @@ TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf)
 
 TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf)
 {
-    TCGv_i64 v = new_tmp_a64(s);
+    TCGv_i64 v = tcg_temp_new_i64();
     if (sf) {
         tcg_gen_mov_i64(v, cpu_X[reg]);
     } else {
@@ -1984,7 +1979,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
             desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
             desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
 
-            tcg_rt = new_tmp_a64(s);
+            tcg_rt = tcg_temp_new_i64();
             gen_helper_mte_check_zva(tcg_rt, cpu_env,
                                      tcg_constant_i32(desc), cpu_reg(s, rt));
         } else {
@@ -2293,7 +2288,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
                 modifier = new_tmp_a64_zero(s);
             }
             if (s->pauth_active) {
-                dst = new_tmp_a64(s);
+                dst = tcg_temp_new_i64();
                 if (op3 == 2) {
                     gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
                 } else {
@@ -2311,7 +2306,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         if (opc == 1) {
             TCGv_i64 lr = cpu_reg(s, 30);
             if (dst == lr) {
-                TCGv_i64 tmp = new_tmp_a64(s);
+                TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_mov_i64(tmp, dst);
                 dst = tmp;
             }
@@ -2330,7 +2325,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         }
         btype_mod = opc & 1;
         if (s->pauth_active) {
-            dst = new_tmp_a64(s);
+            dst = tcg_temp_new_i64();
             modifier = cpu_reg_sp(s, op4);
             if (op3 == 2) {
                 gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
@@ -2344,7 +2339,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         if (opc == 9) {
             TCGv_i64 lr = cpu_reg(s, 30);
             if (dst == lr) {
-                TCGv_i64 tmp = new_tmp_a64(s);
+                TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_mov_i64(tmp, dst);
                 dst = tmp;
             }
@@ -2912,7 +2907,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = new_tmp_a64(s);
+    clean_addr = tcg_temp_new_i64();
     gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
@@ -5167,7 +5162,7 @@ static void disas_adc_sbc(DisasContext *s, uint32_t insn)
     tcg_rn = cpu_reg(s, rn);
 
     if (op) {
-        tcg_y = new_tmp_a64(s);
+        tcg_y = tcg_temp_new_i64();
         tcg_gen_not_i64(tcg_y, cpu_reg(s, rm));
     } else {
         tcg_y = cpu_reg(s, rm);
@@ -5295,7 +5290,7 @@ static void disas_cc(DisasContext *s, uint32_t insn)
 
     /* Load the arguments for the new comparison.  */
     if (is_imm) {
-        tcg_y = new_tmp_a64(s);
+        tcg_y = tcg_temp_new_i64();
         tcg_gen_movi_i64(tcg_y, y);
     } else {
         tcg_y = cpu_reg(s, y);
@@ -5724,8 +5719,8 @@ static void handle_div(DisasContext *s, bool is_signed, unsigned int sf,
     tcg_rd = cpu_reg(s, rd);
 
     if (!sf && is_signed) {
-        tcg_n = new_tmp_a64(s);
-        tcg_m = new_tmp_a64(s);
+        tcg_n = tcg_temp_new_i64();
+        tcg_m = tcg_temp_new_i64();
         tcg_gen_ext32s_i64(tcg_n, cpu_reg(s, rn));
         tcg_gen_ext32s_i64(tcg_m, cpu_reg(s, rm));
     } else {
@@ -5790,7 +5785,7 @@ static void handle_crc32(DisasContext *s,
         default:
             g_assert_not_reached();
         }
-        tcg_val = new_tmp_a64(s);
+        tcg_val = tcg_temp_new_i64();
         tcg_gen_andi_i64(tcg_val, cpu_reg(s, rm), mask);
     }
 
@@ -7062,7 +7057,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
     if (itof) {
         TCGv_i64 tcg_int = cpu_reg(s, rn);
         if (!sf) {
-            TCGv_i64 tcg_extend = new_tmp_a64(s);
+            TCGv_i64 tcg_extend = tcg_temp_new_i64();
 
             if (is_signed) {
                 tcg_gen_ext32s_i64(tcg_extend, tcg_int);
@@ -10707,8 +10702,8 @@ static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
     int dsize = 64;
     int esize = 8 << size;
     int elements = dsize/esize;
-    TCGv_i64 tcg_rn = new_tmp_a64(s);
-    TCGv_i64 tcg_rd = new_tmp_a64(s);
+    TCGv_i64 tcg_rn = tcg_temp_new_i64();
+    TCGv_i64 tcg_rd = tcg_temp_new_i64();
     int i;
 
     if (size >= 3) {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 718a5bce1b..2f607a355e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4721,7 +4721,7 @@ static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_ld_zpa(s, a->rd, a->pg, addr, a->dtype, a->nreg);
@@ -4737,7 +4737,7 @@ static bool trans_LD_zpri(DisasContext *s, arg_rpri_load *a)
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn),
                          (a->imm * elements * (a->nreg + 1))
@@ -4840,7 +4840,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
     }
     s->is_nonstreaming = true;
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 1, false,
@@ -4945,7 +4945,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
         int off = (a->imm * elements) << dtype_msz(a->dtype);
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), off);
         do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 1, false,
@@ -5003,7 +5003,7 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
     }
     if (sve_access_check(s)) {
         int msz = dtype_msz(a->dtype);
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_ldrq(s, a->rd, a->pg, addr, a->dtype);
@@ -5017,7 +5017,7 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
         do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
@@ -5097,7 +5097,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
     }
     s->is_nonstreaming = true;
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_ldro(s, a->rd, a->pg, addr, a->dtype);
@@ -5112,7 +5112,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
     }
     s->is_nonstreaming = true;
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
         do_ldro(s, a->rd, a->pg, addr, a->dtype);
     }
@@ -5307,7 +5307,7 @@ static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), a->msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
         do_st_zpa(s, a->rd, a->pg, addr, a->msz, a->esz, a->nreg);
@@ -5326,7 +5326,7 @@ static bool trans_ST_zpri(DisasContext *s, arg_rpri_store *a)
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> a->esz;
-        TCGv_i64 addr = new_tmp_a64(s);
+        TCGv_i64 addr = tcg_temp_new_i64();
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn),
                          (a->imm * elements * (a->nreg + 1)) << a->msz);
-- 
2.34.1

