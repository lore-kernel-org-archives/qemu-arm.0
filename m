Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4559382lft;
        Wed, 6 Jul 2022 02:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v89QvtmW7Nl4vxPlX7nmMkbbSZ4O7R4RB6cHzMR5pNlOborzMcgVilKAPwzq6bbXmHlJ2c
X-Received: by 2002:a05:6214:762:b0:472:d7cf:15af with SMTP id f2-20020a056214076200b00472d7cf15afmr18860603qvz.11.1657098707501;
        Wed, 06 Jul 2022 02:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657098707; cv=none;
        d=google.com; s=arc-20160816;
        b=U0r8KrPn+0/ftSvMK749j+U3TMJ44uUx6DbZ8DEGgpi5b3BVzsO3IUx/OaHNboCAeS
         ZG+9/6xobHTCynnVOZwBuU5jTVwKWuQTe2ehgw1iheItY4tTfjwGmRXamkeU6IpyhS9x
         GdIqix2+I6hM6nE8oFbmQgFpCMV5MjvdfQVEUik1R72u2YEVs70z6YKG3T6qdvG9Fpe7
         wSj5U34nphhTx/V39tNvSnpSoofZWe9JU1WLT8VnFK1HnP5x4Is9+dXWyL86OhLnW4vq
         Ti/u31/iUAiirBxYqmqb6ITgzcI6a6Z6xOsPMm0niuG+LkJ6cSsjqUElfTc/iB2HcbQQ
         IqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
        b=ac6ANeWMLCHwBlrG4j4vpF65wa7u8sD9F1PTQsdDDSTZM5bVfm3RyGTT8CI7L0TCZq
         D8sWY99cl1pNT+7lbyZO5yjtYvIaeybc9nEm+o6lUU+18PpW8R9ojMlYUVuMX6KYG3S9
         +wtL7qVJjbFGVXPYWbiVsNIHhbrfmXouWHc1ZIdJspUEKsVH8Wv9SZLrX6OXIIB4JErR
         gAB3x9DLhgvMh1SUn74GWMBm2dVMHAeOoRg0QerFWnR+46knNEm8xVnfNKj2z1hhdusn
         V7eoFyr/D+7iYBpvvcCut9+jBb/aBfrqhsdbVFzo7csRnE+iJORpxxkgdV7+mfGebVjU
         xvpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JI/ATYoe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn4-20020a05620a2ac400b006ab8e86072asi8390866qkb.561.2022.07.06.02.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JI/ATYoe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o914U-0002XE-Qe
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LU-0006KS-NS
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:18 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LS-0000PV-1C
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id y18so5049197plb.2
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
 b=JI/ATYoekixrud7Hb4ATmnrtVhfS0Gb7+OrtNiA0g289g6jVAYkC2Diqt7IPHixTMJ
 BhNnA8umkAUOy/TG7WfqYHpTm7f7aSTukkCfzmc+q9B+ZsphGqk1SRiuW3cgwdbcZOpL
 vTGuX09Yy53cLdre22AfjQYikWZ7u49jgcI/JgvelzmcbPmqR+IeDAsOvx1/3AVhVm3P
 MuS9GBoKhcO4zp3uRkO/XxZyhCy7idlFWsnWrTwzv30X1ZAO6VKhBm1vIJMT9Ld6pUeg
 AF0TrTMNdJwoDZCVABItFfIyVd+fNdSdw/yBwahLIT/dPwjrPW+pmwJfJxW/z9trlO2p
 hSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WXFOydNqWu4pd209lRdohDlcMY8B614kNt2CpuhFxBg=;
 b=jDQe7d7xpOYWbrYUMQDvMi85k6M0kxWNGsx/qA47NELHhYMEYwJnW+MqxspKdupK2r
 GCkaXWA7O0NI5k9R5T20odOfHkWAHLhA1FoLP8X9cvnxOmK7nuAsZyop1DxfuzrS2PUI
 8JFzRkcD7zJyHcU4Gtot92TKcAlSvOo5bPJ9cp3rMatZKj+72GLiCbGUzAty+G36jn4G
 UFrQfAnyYnYC5ALCATJ84mcW5em9NKQErlRZhFCLlEKqBsW6iJDNcrmnWUrzsv+02L0h
 cdx4PK/6ERkdIZVJpTfclCOJFl9kTUU9MLsXTAYF5HLuA0Ec4hp7RV6VpDNAgoT0nMLZ
 xkeg==
X-Gm-Message-State: AJIora/2FXVJLBHJR88OQYqV38swOAQp6ySgAv4RXMP6cpv1CqApM+v0
 4U8ynA3QKotbKQH1QKpcWEki5g==
X-Received: by 2002:a17:90b:33ca:b0:1ec:c617:9660 with SMTP id
 lk10-20020a17090b33ca00b001ecc6179660mr49445214pjb.95.1657095913287; 
 Wed, 06 Jul 2022 01:25:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 21/45] target/arm: Export unpredicated ld/st from
 translate-sve.c
Date: Wed,  6 Jul 2022 13:53:47 +0530
Message-Id: <20220706082411.1664825-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: IxqFbpmOOOU7

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

