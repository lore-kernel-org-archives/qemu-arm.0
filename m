Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788187ejb;
        Thu, 25 May 2023 16:27:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5v61L2SrmYYg1u7c66kR5sbN9aO/LdW/tkq85N8/F5x3ND1OZR0NM3m4GVLY2Qqwm/WVJv
X-Received: by 2002:a05:622a:1211:b0:3f3:7869:d2e1 with SMTP id y17-20020a05622a121100b003f37869d2e1mr171461qtx.17.1685057251054;
        Thu, 25 May 2023 16:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057251; cv=none;
        d=google.com; s=arc-20160816;
        b=QfMJvsbQS/U8cp2rKXL666pkp2tP74cC8UBIfsOJllz4oHxfo3Hg9F50ecONqY/HJz
         djj3qvFI5Vv6bkF0WyKTFV3QaNqsXOTroVFd/ZVd8W9Ryt1ea3GZHrIaqVn9rbmGOKjG
         Wv7aOkyVcu3Lcr83uWN3z7+gMN5w3rnLNeCUTeouIYUe9drzHoCNwru9OLbpfDDEZBUI
         ChyRlqPncTZXDPOvXp3k2fsxHtYd9cd4Aib4nkggpL+pvFOqW6Vi6syLQMzOM4OJlcM8
         PbyjPt1EHO2ItPBCzNIYMipSG4O0PXKvafF5WfwEMTOmTcjPEzVGnRQuChNxq1d40hKu
         XVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BYK7f1Pw/I321noMCBsCUrAN7CJvgDgyb0P7aQ+L6OI=;
        b=GQSbQ/UUe9j/mIOxwbXTjc30OpAGetOqm2NNaVI5Ozeza2pEHl/6WoYrgT1KpTUVoy
         vMFL2FvSl92MaRnJ5YjeWYDAI3ukj230UoNpuEX3sbmNHleowJkpE7hL+aSvnS9qL655
         934RC3AJ94TZqZkpMb7nm5uq9/pnLC5oer0Z1TiOb4RB5JqYVqCrmPHap/gI9ifE+UME
         8mhVagq1Jtw0WVQR3Zr+RfOehTWBeFC0CrM0A39+06NM6EmsYNsf8hTlIliXmFwzEpOx
         LAY+hwGkxOoZO4ZXynZAO6jrelKlGIcZZnfKo0jquF7m6M8UguTwTJHcCFbPV6/wEL6R
         SmNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hy5CcB2f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt52-20020a05620a47b400b007593ee10007si928310qkb.273.2023.05.25.16.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hy5CcB2f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q2KLb-0005sl-Ia; Thu, 25 May 2023 19:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLX-0005pd-Sp
 for qemu-devel@nongnu.org; Thu, 25 May 2023 19:26:15 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLV-0005nJ-15
 for qemu-devel@nongnu.org; Thu, 25 May 2023 19:26:15 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ae408f4d1aso1082775ad.0
 for <qemu-devel@nongnu.org>; Thu, 25 May 2023 16:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057168; x=1687649168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYK7f1Pw/I321noMCBsCUrAN7CJvgDgyb0P7aQ+L6OI=;
 b=hy5CcB2foxnz4wh/u+gmXwIozc8kgUXPKaW3HlT2lsN3xu1SEZInyMEqSF8P9pPLuY
 iKza4anwcwVmpTl9DcUk2HCUgSBpAo1DbAdjq7LYUBrIKu3n9I9mOWGbYd3iCx94Fg0V
 4KfFLiUB7yjoQsUQKE0jPT/OurGf6MGYctgvD2oaexmEsy4E950LeGeozid9AoQ/TuJc
 UJJ6wbhKSBEdF3yfr+WHrTS7iKvBp2EwuUS858R8clOW+hgjKJBDf+AtESs5qoAAfaCg
 xykWwtNzF1sQ8o2Z37vig1FfaZ0NEpgLqQ5JITklkLnLdN6LWNkt89L8j6hssiqhqwu7
 91ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057168; x=1687649168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYK7f1Pw/I321noMCBsCUrAN7CJvgDgyb0P7aQ+L6OI=;
 b=TwQgxeLgjut6KFKF75YtLPAn1UirEDiZHUeJxlzKwurMzWkZOUPwsco/8nBD8VGON5
 QSnEtMQtlsFK9OcOISUGCJjvjGfmsy8ts1HxLS0/P0ScRXCGJRETJmrqIAbbemvlNnJn
 fJDgxqZRzNNwzLnWUNVi4Y8k+JxKHVb0lZLloQfsqSRu2mY3Hd+HHrIOxcwv0lGNJ/it
 Xd21pkGIqnB2s+M5B7Q04K8MIcJsZRB10aYD5jweFXDR5HYETM1bIHebbec3Seci5Opv
 tBw1gOi6yt7+labK+Wf13dFe0HGElol9IMIf5+AlAJD4sjNRLgHw9GoARkhMrXMNUFNK
 FMyQ==
X-Gm-Message-State: AC+VfDwdLFlsxbRNirNjXfd5PswkBZVWzqlVkjGerCMDA0PFzXwbVcEl
 X81WEfMomGPtzIA5kUct+o0Exm7VRBPhNfyj3xA=
X-Received: by 2002:a17:902:bc43:b0:1af:de3d:bbe6 with SMTP id
 t3-20020a170902bc4300b001afde3dbbe6mr510098plz.2.1685057168278; 
 Thu, 25 May 2023 16:26:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/20] target/arm: Hoist finalize_memop out of do_fp_{ld,
 st}
Date: Thu, 25 May 2023 16:25:49 -0700
Message-Id: <20230525232558.1758967-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: aTFEgxoVb0y1

We are going to need the complete memop beforehand,
so let's not compute it twice.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 43 ++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 24e255aa34..02dbf76feb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -915,15 +915,14 @@ static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
 /*
  * Store from FP register to memory
  */
-static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
+static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, MemOp mop)
 {
     /* This writes the bottom N bits of a 128 bit wide vector to memory */
     TCGv_i64 tmplo = tcg_temp_new_i64();
-    MemOp mop = finalize_memop_asimd(s, size);
 
     tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
 
-    if (size < MO_128) {
+    if ((mop & MO_SIZE) < MO_128) {
         tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         TCGv_i64 tmphi = tcg_temp_new_i64();
@@ -939,14 +938,13 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 /*
  * Load from memory to FP register
  */
-static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
+static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, MemOp mop)
 {
     /* This always zero-extends and writes to a full 128 bit wide vector */
     TCGv_i64 tmplo = tcg_temp_new_i64();
     TCGv_i64 tmphi = NULL;
-    MemOp mop = finalize_memop_asimd(s, size);
 
-    if (size < MO_128) {
+    if ((mop & MO_SIZE) < MO_128) {
         tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         TCGv_i128 t16 = tcg_temp_new_i128();
@@ -2775,6 +2773,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     int size = 2;
     TCGv_i64 tcg_rt, clean_addr;
+    MemOp memop;
 
     if (is_vector) {
         if (opc == 3) {
@@ -2785,6 +2784,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         if (!fp_access_check(s)) {
             return;
         }
+        memop = finalize_memop_asimd(s, size);
     } else {
         if (opc == 3) {
             /* PRFM (literal) : prefetch */
@@ -2792,19 +2792,19 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         }
         size = 2 + extract32(opc, 0, 1);
         is_signed = extract32(opc, 1, 1);
+        memop = finalize_memop(s, size + is_signed * MO_SIGN);
     }
 
     tcg_rt = cpu_reg(s, rt);
 
     clean_addr = tcg_temp_new_i64();
     gen_pc_plus_diff(s, clean_addr, imm);
+
     if (is_vector) {
-        do_fp_ld(s, rt, clean_addr, size);
+        do_fp_ld(s, rt, clean_addr, memop);
     } else {
         /* Only unsigned 32bit loads target 32bit registers.  */
         bool iss_sf = opc != 0;
-        MemOp memop = finalize_memop(s, size + is_signed * MO_SIGN);
-
         do_gpr_ld(s, tcg_rt, clean_addr, memop, false, true, rt, iss_sf, false);
     }
 }
@@ -2941,16 +2941,18 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
                                 (wback || rn != 31) && !set_tag, 2 << size);
 
     if (is_vector) {
+        MemOp mop = finalize_memop_asimd(s, size);
+
         if (is_load) {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, mop);
         } else {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, mop);
         }
         tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
         if (is_load) {
-            do_fp_ld(s, rt2, clean_addr, size);
+            do_fp_ld(s, rt2, clean_addr, mop);
         } else {
-            do_fp_st(s, rt2, clean_addr, size);
+            do_fp_st(s, rt2, clean_addr, mop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
@@ -3072,6 +3074,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         if (!fp_access_check(s)) {
             return;
         }
+        memop = finalize_memop_asimd(s, size);
     } else {
         if (size == 3 && opc == 2) {
             /* PRFM - prefetch */
@@ -3088,6 +3091,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         is_store = (opc == 0);
         is_signed = !is_store && extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
+        memop = finalize_memop(s, size + is_signed * MO_SIGN);
     }
 
     switch (idx) {
@@ -3120,7 +3124,6 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     }
 
     memidx = is_unpriv ? get_a64_user_mem_index(s) : get_mem_index(s);
-    memop = finalize_memop(s, size + is_signed * MO_SIGN);
 
     clean_addr = gen_mte_check1_mmuidx(s, dirty_addr, is_store,
                                        writeback || rn != 31,
@@ -3128,9 +3131,9 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
 
     if (is_vector) {
         if (is_store) {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, memop);
         } else {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, memop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
@@ -3236,9 +3239,9 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
 
     if (is_vector) {
         if (is_store) {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, memop);
         } else {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, memop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
@@ -3322,9 +3325,9 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
 
     if (is_vector) {
         if (is_store) {
-            do_fp_st(s, rt, clean_addr, size);
+            do_fp_st(s, rt, clean_addr, memop);
         } else {
-            do_fp_ld(s, rt, clean_addr, size);
+            do_fp_ld(s, rt, clean_addr, memop);
         }
     } else {
         TCGv_i64 tcg_rt = cpu_reg(s, rt);
-- 
2.34.1

