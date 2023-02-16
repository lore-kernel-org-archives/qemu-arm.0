Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp78449ejb;
        Wed, 15 Feb 2023 19:09:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+CZC0HIhQVnrZvskVm9TUBMlZBQS9RoAKzKN2gR6YoEWEBp5inBhQoKAykHRMjTVbT4+Ua
X-Received: by 2002:a05:622a:4d4:b0:3b9:e683:23d with SMTP id q20-20020a05622a04d400b003b9e683023dmr7345474qtx.38.1676516998535;
        Wed, 15 Feb 2023 19:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676516998; cv=none;
        d=google.com; s=arc-20160816;
        b=u0BbfYCWJW+2ET0ZWnyyJ/l+3gHd9dYv7wJtUxq7buTDbWk0Mp8KSgtAy5Z3LDeMKg
         hb5zyox9P8HU4cIAWdLByhCv6ODPYrGDRC5bY0PvRzyd6Wxv3K26NmONly22cTYqf89Z
         QvEbctqzD6XulooJsZfFWhCmhDTBBo3l9e25aq6SgGiqsdh5czU/2wdXDaDcAjVJcyNr
         OpAZ2Cc70JvX+uhE0RBaOLC8OMgDlc7y7HRZZ+BwhWiJ6I9qAdSza+b6bpgUdcv28VxX
         qy/e31udRkhg9h8ZMhuDrsDPRR3Dg7EFOqNTLvRp8FEHme037Sf3/ReFvFhWUKv0gKnt
         rnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M2fap56PeedHPfSJE6dzUTTL7OKlS8CMUdMWOfCPYes=;
        b=VjCZSMW1nhGrsEmZ41pA4UgK0ub89Mcwf7sH8NzGpIhZSjnmVCit/IPA6kiytmQsAa
         HC1Yoe2hxQ8AG1d+T70sn08occMZ7jzmomg7SM7c6zCr9fJwEXpz16R9AypMgcL3cocv
         6nrTW+d8oayDh/dEt19n8p+gb/1NH0SUq/Z7XiPt6MKJYKEcqFSFpwN7Z+J68bNZbr6k
         mB+YMNt3APZeguWsmurFaJerX64Kw6oI7yn6Cr4L7KJXXS6KVnGdv9QB9gphX+oxzdjp
         4vbECee/MadCHgx3youKyyfIc85ywndnJmHilnPqWqKjcL08SkOdPDg/o3dBJ9A5HmEl
         2Vkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ucpIMADl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm35-20020a05620a19a300b00734578ced2esi391357qkb.614.2023.02.15.19.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ucpIMADl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUe3-0007Kg-1m; Wed, 15 Feb 2023 22:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdx-0007IG-Bu
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:11 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdv-000079-7X
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:09 -0500
Received: by mail-pf1-x42c.google.com with SMTP id y25so581441pfw.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2fap56PeedHPfSJE6dzUTTL7OKlS8CMUdMWOfCPYes=;
 b=ucpIMADlvbWsX4+GbkizWUaxt7RPnnTbKTV4kVhwLEmhDp0bsYX9aaGa/jmS3pJXpo
 fijPuUQTN6LpiAwde5NpypEy9gvpcJG/K3qBMOG2/MOgZOeLTRq3JrSA5iIk7s/uGK7Y
 v56NK00P9dd7ZiytcD+l9uYGNd6VXBdeEqaADoQub3EqmqloJATfW+Uc0H1JS8+vmiJM
 rdeTHVh5hvVc8VvEIG/YImfMhvDCXwvE6D6AKZQcPguw3Afd5dcc48/GQydpGP988yQ0
 5wGc88bgpwun4k1/lo+cQSDEvOU2/jBFmtazmqQ58EcRuwecHATWqWkzr54H5NaQyVyX
 K5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2fap56PeedHPfSJE6dzUTTL7OKlS8CMUdMWOfCPYes=;
 b=aGsoNlK1C7mup2DuHWfgsuwbvmIV6oyk/uiEsETxxp1j47dHTq6PsZgnD3Qk9jRWU5
 UwbvcBuWf7z4EeEqcMgA/yvnDZodKZ7Em8kclR4N5Rums0lda4F6ZllrMoCy409YySEm
 C9zyr7Wk1mGuJw5rr3ZagUaYIge/y0a90kw6gipYDsyglNjiad8akicC99vmCcILHEEZ
 LHw/4rdhpKmEcM6d9bHZZWp4dKMunqrg2Vhp21Htrtje5TX5Z3MPKnEWZ+H7sVJukU8y
 m9edFX22jL6l/jiOAsFFlPHjySEi2Z3Tt+UcEN7uGx/TYyDJgKlM5bYaBZRPvzKn2J22
 C5xw==
X-Gm-Message-State: AO0yUKWdNeBoKhgLxE/V8Ym42PAAIXZ9atk6LjUSNpGNJ3tNJt0kYf+Y
 TTIrmtCLscDKe62WlpUUJ7zS984kLRZqCdvfucY=
X-Received: by 2002:a62:1a07:0:b0:593:ed9c:9f07 with SMTP id
 a7-20020a621a07000000b00593ed9c9f07mr3355701pfa.27.1676516945248; 
 Wed, 15 Feb 2023 19:09:05 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 05/19] target/arm: Use tcg_gen_qemu_{ld,
 st}_i128 in gen_sve_{ld, st}r
Date: Wed, 15 Feb 2023 17:08:40 -1000
Message-Id: <20230216030854.1212208-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Wg0rrU6ex+oD

Round len_align to 16 instead of 8, handling an odd 8-byte as part
of the tail.  Use MO_ATOM_NONE to indicate that all of these memory
ops have only byte atomicity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 107 ++++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 26 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 621a2abb22..f3d5e79dd2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4312,11 +4312,12 @@ TRANS_FEAT(UCVTF_dd, aa64_sve, gen_gvec_fpst_arg_zpz,
 void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
                  int len, int rn, int imm)
 {
-    int len_align = QEMU_ALIGN_DOWN(len, 8);
-    int len_remain = len % 8;
-    int nparts = len / 8 + ctpop8(len_remain);
+    int len_align = QEMU_ALIGN_DOWN(len, 16);
+    int len_remain = len % 16;
+    int nparts = len / 16 + ctpop8(len_remain);
     int midx = get_mem_index(s);
     TCGv_i64 dirty_addr, clean_addr, t0, t1;
+    TCGv_i128 t16;
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
@@ -4334,12 +4335,20 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         int i;
 
         t0 = tcg_temp_new_i64();
-        for (i = 0; i < len_align; i += 8) {
-            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
+        t1 = tcg_temp_new_i64();
+        t16 = tcg_temp_new_i128();
+
+        for (i = 0; i < len_align; i += 16) {
+            tcg_gen_qemu_ld_i128(t16, clean_addr, midx,
+                                 MO_LE | MO_128 | MO_ATOM_NONE);
+            tcg_gen_extr_i128_i64(t0, t1, t16);
             tcg_gen_st_i64(t0, base, vofs + i);
-            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+            tcg_gen_st_i64(t1, base, vofs + i + 8);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 16);
         }
         tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free_i128(t16);
     } else {
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
@@ -4357,16 +4366,25 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
         gen_set_label(loop);
 
-        t0 = tcg_temp_new_i64();
-        tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ);
-        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+        t16 = tcg_temp_new_i128();
+        tcg_gen_qemu_ld_i128(t16, clean_addr, midx,
+                             MO_LE | MO_128 | MO_ATOM_NONE);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 16);
 
         tp = tcg_temp_new_ptr();
         tcg_gen_add_ptr(tp, base, i);
-        tcg_gen_addi_ptr(i, i, 8);
+        tcg_gen_addi_ptr(i, i, 16);
+
+        t0 = tcg_temp_new_i64();
+        t1 = tcg_temp_new_i64();
+        tcg_gen_extr_i128_i64(t0, t1, t16);
+        tcg_temp_free_i128(t16);
+
         tcg_gen_st_i64(t0, tp, vofs);
-        tcg_temp_free_ptr(tp);
+        tcg_gen_st_i64(t1, tp, vofs + 8);
         tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free_ptr(tp);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
@@ -4381,6 +4399,17 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
      * Predicate register loads can be any multiple of 2.
      * Note that we still store the entire 64-bit unit into cpu_env.
      */
+    if (len_remain >= 8) {
+        t0 = tcg_temp_new_i64();
+        tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUQ | MO_ATOM_NONE);
+        tcg_gen_st_i64(t0, base, vofs + len_align);
+        len_remain -= 8;
+        len_align += 8;
+        if (len_remain) {
+            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+        }
+        tcg_temp_free_i64(t0);
+    }
     if (len_remain) {
         t0 = tcg_temp_new_i64();
         switch (len_remain) {
@@ -4388,14 +4417,14 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         case 4:
         case 8:
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain));
+                                MO_LE | ctz32(len_remain) | MO_ATOM_NONE);
             break;
 
         case 6:
             t1 = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL | MO_ATOM_NONE);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
-            tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW);
+            tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW | MO_ATOM_NONE);
             tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
             tcg_temp_free_i64(t1);
             break;
@@ -4412,11 +4441,12 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
                  int len, int rn, int imm)
 {
-    int len_align = QEMU_ALIGN_DOWN(len, 8);
-    int len_remain = len % 8;
-    int nparts = len / 8 + ctpop8(len_remain);
+    int len_align = QEMU_ALIGN_DOWN(len, 16);
+    int len_remain = len % 16;
+    int nparts = len / 16 + ctpop8(len_remain);
     int midx = get_mem_index(s);
-    TCGv_i64 dirty_addr, clean_addr, t0;
+    TCGv_i64 dirty_addr, clean_addr, t0, t1;
+    TCGv_i128 t16;
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
@@ -4435,12 +4465,19 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         int i;
 
         t0 = tcg_temp_new_i64();
+        t1 = tcg_temp_new_i64();
+        t16 = tcg_temp_new_i128();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_ld_i64(t0, base, vofs + i);
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
-            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+            tcg_gen_ld_i64(t1, base, vofs + i + 8);
+            tcg_gen_concat_i64_i128(t16, t0, t1);
+            tcg_gen_qemu_st_i128(t16, clean_addr, midx,
+                                 MO_LE | MO_128 | MO_ATOM_NONE);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 16);
         }
         tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free_i128(t16);
     } else {
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
@@ -4459,15 +4496,22 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
+        t1 = tcg_temp_new_i64();
         tp = tcg_temp_new_ptr();
         tcg_gen_add_ptr(tp, base, i);
         tcg_gen_ld_i64(t0, tp, vofs);
-        tcg_gen_addi_ptr(i, i, 8);
+        tcg_gen_ld_i64(t1, tp, vofs + 8);
+        tcg_gen_addi_ptr(i, i, 16);
         tcg_temp_free_ptr(tp);
 
-        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
-        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+        t16 = tcg_temp_new_i128();
+        tcg_gen_concat_i64_i128(t16, t0, t1);
         tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+
+        tcg_gen_qemu_st_i128(t16, clean_addr, midx, MO_LEUQ);
+        tcg_temp_free_i128(t16);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 16);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
@@ -4479,6 +4523,17 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
     }
 
     /* Predicate register stores can be any multiple of 2.  */
+    if (len_remain >= 8) {
+        t0 = tcg_temp_new_i64();
+        tcg_gen_st_i64(t0, base, vofs + len_align);
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ | MO_ATOM_NONE);
+        len_remain -= 8;
+        len_align += 8;
+        if (len_remain) {
+            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+        }
+        tcg_temp_free_i64(t0);
+    }
     if (len_remain) {
         t0 = tcg_temp_new_i64();
         tcg_gen_ld_i64(t0, base, vofs + len_align);
@@ -4488,14 +4543,14 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         case 4:
         case 8:
             tcg_gen_qemu_st_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain));
+                                MO_LE | ctz32(len_remain) | MO_ATOM_NONE);
             break;
 
         case 6:
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL | MO_ATOM_NONE);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW | MO_ATOM_NONE);
             break;
 
         default:
-- 
2.34.1

