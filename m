Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4243135lfb;
        Tue, 8 Dec 2020 10:15:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydWSlAm4T+palJoBkH8B6mAXKzl5pou3n4vWCsRTM8PHyXQNCREJ6CvkcFGVkcIH5ZA9Dx
X-Received: by 2002:a25:9009:: with SMTP id s9mr30458806ybl.364.1607451317412;
        Tue, 08 Dec 2020 10:15:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451317; cv=none;
        d=google.com; s=arc-20160816;
        b=qZqxedxykDMndo2/dVSJr77ElACb8YVarlwtSeIdqIEC4/GuFFuN/h2OPfZpoVOCDS
         TAsRNnsxGjtGSC9U4qhjd2S8UGUMc0w8M/kvN0EhB4uk/10moHF4npidXLCpQgbP6XXZ
         qv3I+ftQdgwl9t8a/7qhzwwLrwMIF0LG0FDqKIXKme0uXn4xk9HBXrGXEirQgjNsRIko
         UgBml6aDCqcS5D/X/bVe8UyEOmM4epbLCvbj1Zuo+0QtUs8XXaQ9eUvB/48gMXVEu5VT
         fK//JzlmzYRc820br1S1vID1ADw8mU42nYHr/Vmfwg9xHOmZ+VwrCRF8Bmlj1Cfrju7i
         arWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jrS4YN7W+7NBTb0aYWu3j+MLNMtf7Sqw2+Bh5j7akD8=;
        b=czvIeql8qr2EECXtV/lmW3h59oNa77Gq6EDOizho5+FV6cStm/U2KC91Pul0TKPWtr
         uevcnlSDSFfU58QsoCZ7k1VQiYz3L85Y66pA406dyLJ8aZFkVMVFZUerKSTQ1lkKOu8j
         EX2k+y+HOghS9ITIHN+ApZ0nqqjGlB0JLKBtxo/kkpLFWOzRohDIeVLu+i3BSSg4cXEz
         kdVY0sUy1gz/Mb0WvC6vE21TbLQ/rrFGyOzJt6cb8arF5XUcMJtS2u+aNBEXUth+T/MX
         PjLs+Yzm60skYKS7s33uj12jL3Mw/12fyqoFa/+zZyK1C+GYA+q53XheWfSZNPdloR5H
         ibvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Js5NFBdL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si18482093ybq.162.2020.12.08.10.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:15:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Js5NFBdL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhW8-0004QF-Oi
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJO-0008IX-PU
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:02:07 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJM-0006Rg-LT
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:02:06 -0500
Received: by mail-oi1-x242.google.com with SMTP id f132so5845200oib.12
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jrS4YN7W+7NBTb0aYWu3j+MLNMtf7Sqw2+Bh5j7akD8=;
 b=Js5NFBdLH3DabQVBsvkfls7euQYa6P+mszjiyENSLaLlp27Wl3BU0gCUoPjQ1SsNnl
 DJPR4MTLrhWri8dWx/UT3YCnW8qOsJP3+6pEa23V69ZyHGDaZ/CZVISt9B5QSPlSpruI
 eBbsDPpg22VZb0QSVbSTFgSwAp9Dn5ONtcrq2QHHt8V5jw7WlC4a5QOCiS6gGS8R61Ec
 Wcz9KGB+0Y4B2x5F/GU+0Ul+Di5aemvRnhzNzzn/z75kvrhe0Fzh83m0XrSX7Cqgt4mB
 S/wzWITFaOTNoouGH4keCln+KKUAtnHTjUJEGToeWMsOZaLoL0plkhOu8QQXE+Ojyywu
 hCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jrS4YN7W+7NBTb0aYWu3j+MLNMtf7Sqw2+Bh5j7akD8=;
 b=LFYwTs+V0ZWV3Es8NJ8gFWrVYVKuU/ZBpgiMZ+HAyEowuRRtIQHhBqJsKLbMYY+wzC
 bDar3TweHAbaOpLxeWSfVj87NhgDiqAG9Y1QrjhR10SAm3FS9Heq/2jFlaCNw8+o6Vto
 HPZNgST5qlY/djQdU7ZoC/ay14bY8CxHauXQF/P0zzsFUdmyC1W39AEd8YAcXkbQyepW
 fwxb0+jkNJ3fbhSdUs93x8BwISm9iptddYm1pW/h1/bKMHkBoMTxTe9JOKaZYBKmOgop
 ClpNAQDCFotVPGV2jQRy4GjaSARkVb4BXDuW+ry67YRVW9wuYEuBOzvPcQo500kPGjVT
 Hu3A==
X-Gm-Message-State: AOAM533chMApgeO0i4O+XjrCyN6EmT70gBQRi5TFZna+fjJOrE6mkmll
 pwALadXvIHj4tunBMEj2+iMHCw==
X-Received: by 2002:aca:5a42:: with SMTP id o63mr3498827oib.69.1607450523604; 
 Tue, 08 Dec 2020 10:02:03 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:02:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/24] target/arm: Enforce alignment for sve unpredicated
 LDR/STR
Date: Tue,  8 Dec 2020 12:01:18 -0600
Message-Id: <20201208180118.157911-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5DnBasC++Z8y

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 58 +++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6125e734af..b481e97428 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4263,7 +4263,8 @@ static bool trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a)
  * The load should begin at the address Rn + IMM.
  */
 
-static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+static void do_ldr(DisasContext *s, uint32_t vofs, int len,
+                   MemOp align, int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4276,6 +4277,10 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
     tcg_temp_free_i64(dirty_addr);
 
+    if (!s->align_mem) {
+        align = 0;
+    }
+
     /*
      * Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
@@ -4288,7 +4293,8 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
-            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
+            align = 0;
             tcg_gen_st_i64(t0, cpu_env, vofs + i);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
@@ -4302,6 +4308,16 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (align > MO_ALIGN_8) {
+            t0 = tcg_temp_new_i64();
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+            tcg_gen_addi_ptr(i, i, 8);
+            tcg_gen_st_i64(t0, cpu_env, vofs);
+            tcg_temp_free_i64(t0);
+            align = 0;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4330,12 +4346,12 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         case 4:
         case 8:
             tcg_gen_qemu_ld_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain));
+                                MO_LE | ctz32(len_remain) | align);
             break;
 
         case 6:
             t1 = tcg_temp_new_i64();
-            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEUL | align);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW);
             tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
@@ -4351,7 +4367,8 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 }
 
 /* Similarly for stores.  */
-static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
+static void do_str(DisasContext *s, uint32_t vofs, int len, MemOp align,
+                   int rn, int imm)
 {
     int len_align = QEMU_ALIGN_DOWN(len, 8);
     int len_remain = len % 8;
@@ -4364,6 +4381,10 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
     tcg_temp_free_i64(dirty_addr);
 
+    if (!s->align_mem) {
+        align = 0;
+    }
+
     /* Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
      * operations on larger quantities.  There is no nice way to force
@@ -4378,7 +4399,8 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_ld_i64(t0, cpu_env, vofs + i);
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ | align);
+            align = 0;
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
         tcg_temp_free_i64(t0);
@@ -4391,6 +4413,16 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         clean_addr = new_tmp_a64_local(s);
         tcg_gen_mov_i64(clean_addr, t0);
 
+        if (align > MO_ALIGN_8) {
+            t0 = tcg_temp_new_i64();
+            tcg_gen_ld_i64(t0, cpu_env, vofs);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ | align);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+            tcg_gen_addi_ptr(i, i, 8);
+            tcg_temp_free_i64(t0);
+            align = 0;
+        }
+
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4400,7 +4432,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         tcg_gen_addi_ptr(i, i, 8);
         tcg_temp_free_ptr(tp);
 
-        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ | align);
         tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         tcg_temp_free_i64(t0);
 
@@ -4418,11 +4450,11 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
         case 4:
         case 8:
             tcg_gen_qemu_st_i64(t0, clean_addr, midx,
-                                MO_LE | ctz32(len_remain));
+                                MO_LE | ctz32(len_remain) | align);
             break;
 
         case 6:
-            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL | align);
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW);
@@ -4440,7 +4472,7 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        do_ldr(s, off, size, MO_ALIGN_16, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4450,7 +4482,7 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_ldr(s, off, size, a->rn, a->imm * size);
+        do_ldr(s, off, size, MO_ALIGN_2, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4460,7 +4492,7 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        do_str(s, off, size, MO_ALIGN_16, a->rn, a->imm * size);
     }
     return true;
 }
@@ -4470,7 +4502,7 @@ static bool trans_STR_pri(DisasContext *s, arg_rri *a)
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
-        do_str(s, off, size, a->rn, a->imm * size);
+        do_str(s, off, size, MO_ALIGN_2, a->rn, a->imm * size);
     }
     return true;
 }
-- 
2.25.1

