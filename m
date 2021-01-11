Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2942139lfq;
        Mon, 11 Jan 2021 11:37:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOe+wnnL+kHFHiaq0VJfrInNPwgClR1xcfoDcQMBTuY/dpB5GQAWJBCqYEZz4M6BeLvkTO
X-Received: by 2002:a25:e910:: with SMTP id n16mr1805152ybd.269.1610393836535;
        Mon, 11 Jan 2021 11:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393836; cv=none;
        d=google.com; s=arc-20160816;
        b=tF93lrBeDelvfk2+BhxjO5HFqBSS0wLThr+hnt48dwpTMnhVFCXn2vq+wtIHvfuQZ0
         ECZudF3YC3A7O8K+yL9MLfdaV0C3sS5EcpLQbSyw9XYi3lsqq9zG2dKM7DxmEmiqpmaB
         doLlDX6XwYOeWTe/9dTGr8zGm0TR1BegJgoMADrOfFb2axZJ8Mr9rRj9QNa0qRCOFXzI
         ukMa6FvQGwsH9jBMa04/2flrOpSj7M1ulwn5nZD/4zJqE/83XeqDeFinCxFqbp8DIDQm
         NBIE7xIJPI5FjyhA6777xUbAM+RP05YEpdWrqUfwpTmXnXmvM+9+Pt/Htelp0EtOmcpB
         xmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JO2WcIYwslNZr+KcGb+B6wNh5fkUzsQjVxh2FB2A4YQ=;
        b=RB/mB/Nsfqw4fVy+AATtMzIGMyFRlQ0ccPxWOjzmgnsXBAkbwnCt9zFpM8YKHD9PI2
         Azw0xWLh6fzNzMol2NX++ZatOgayO0K0+O+1RZ6y8Ld573+9HMPFxEb8/t0rFKJFjRxE
         ML9qirS8Tjd+8o0jNtuZNc//q5S0MdADoewUT/hwI6O1D/cltrGdzy37JJZBwPdG5ugB
         EUlkQYQqhkMVsTbG/Gw8F1pF919UAyAERIgk4K/4Iq4GGzvoE69apm8Zuzl1KBdVezIK
         0t+Gevv0ZxemmYRBFem0I7SbNP1Z3mp6lSI/Io/w4NCKYk8BPbgJo3TX0sH7ote0HL6v
         9BmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CysioAwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d204si599137ybh.382.2021.01.11.11.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:37:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CysioAwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz307-00048s-SE
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S4-0006OM-Sn
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:05 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rz-0006Vn-TM
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:04 -0500
Received: by mail-pl1-x631.google.com with SMTP id r4so322255pls.11
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JO2WcIYwslNZr+KcGb+B6wNh5fkUzsQjVxh2FB2A4YQ=;
 b=CysioAwzI1YOBXgBK0uPZr2POaWjV7SWKpmHV9AtW70gdpNt5kdBmNOAH3XiAWbCl5
 jwYBp335qiTLGyK71p2GsE6+KHfgjVCU/ikxAOEXViumX6dxvZoIeFdw/VAuei2rQEQV
 J7h12+lbzloip4gdv8Ugp010N5kr6tyqyAEvDJbKTDKCX9FjfKvPN1Kpy/0s3aPmDx0P
 BdZo8RoswXrSPHyOwZtNinQHXBUmF6GuS/qJNzzdDWgGMfLnSct+G/GzVNQ8Hg9mxAiQ
 1ibgNvpyV4JTzacYtpVj0kUrSxFVxvEGiQp4A0nnimzcMC9I1iJcdSOkQMvIDN6/HwAW
 tUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JO2WcIYwslNZr+KcGb+B6wNh5fkUzsQjVxh2FB2A4YQ=;
 b=gk733pRPIfYyQs3qI8ImfjR8tvin6j4+62J0X28DL0yV1ZIBmxF7hOKob2UrrqGdQ2
 U5dE8QMp2TXamFwiitSaMZ1V53HlQvB2CKtNe+ZqiynqjUNAokO4O+0SINY/erfEiOFn
 B7KH21ri1s6qRY9eEVOoeg4djkBv9CwlPYHUvLuOTHM7cHwmWBSSatLFiXnERd9fZRrX
 VjmpyrziN+X6wFNzFKl5lOo7DWq0zKnGsfcbpNOPKdN0BtXSgCQfQDRf4f1WCKkjXTOK
 gkoowaZl76K3FCxCVgqz+bNpRDaF2wIApYOtFG/XZKyyKXkd8+q5FDTODPwj7/wJq85F
 /Ijw==
X-Gm-Message-State: AOAM530whICop8bviJtXpe3cBovHDCxthhd3H3yEpnLNM7+ft50RF69W
 LzdcDzb93m6zR42PTTLlfrG3aQ==
X-Received: by 2002:a17:902:8c85:b029:dc:2f27:c684 with SMTP id
 t5-20020a1709028c85b02900dc2f27c684mr1180231plo.44.1610391718381; 
 Mon, 11 Jan 2021 11:01:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/30] target/arm: Use finalize_memop for aa64 gpr
 load/store
Date: Mon, 11 Jan 2021 09:01:07 -1000
Message-Id: <20210111190113.303726-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: VsBqo8K1JACZ

In the case of gpr load, merge the size and is_signed arguments;
otherwise, simply convert size to memop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 78 ++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 45 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 69d401da21..5d93fcf25b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -880,19 +880,19 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
  * Store from GPR register to memory.
  */
 static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
-                             TCGv_i64 tcg_addr, int size, int memidx,
+                             TCGv_i64 tcg_addr, MemOp memop, int memidx,
                              bool iss_valid,
                              unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    g_assert(size <= 3);
-    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->be_data + size);
+    memop = finalize_memop(s, memop);
+    tcg_gen_qemu_st_i64(source, tcg_addr, memidx, memop);
 
     if (iss_valid) {
         uint32_t syn;
 
         syn = syn_data_abort_with_iss(0,
-                                      size,
+                                      (memop & MO_SIZE),
                                       false,
                                       iss_srt,
                                       iss_sf,
@@ -903,37 +903,28 @@ static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
 }
 
 static void do_gpr_st(DisasContext *s, TCGv_i64 source,
-                      TCGv_i64 tcg_addr, int size,
+                      TCGv_i64 tcg_addr, MemOp memop,
                       bool iss_valid,
                       unsigned int iss_srt,
                       bool iss_sf, bool iss_ar)
 {
-    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s),
+    do_gpr_st_memidx(s, source, tcg_addr, memop, get_mem_index(s),
                      iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
 /*
  * Load from memory to GPR register
  */
-static void do_gpr_ld_memidx(DisasContext *s,
-                             TCGv_i64 dest, TCGv_i64 tcg_addr,
-                             int size, bool is_signed,
-                             bool extend, int memidx,
+static void do_gpr_ld_memidx(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
+                             MemOp memop, bool extend, int memidx,
                              bool iss_valid, unsigned int iss_srt,
                              bool iss_sf, bool iss_ar)
 {
-    MemOp memop = s->be_data + size;
-
-    g_assert(size <= 3);
-
-    if (is_signed) {
-        memop += MO_SIGN;
-    }
-
+    memop = finalize_memop(s, memop);
     tcg_gen_qemu_ld_i64(dest, tcg_addr, memidx, memop);
 
-    if (extend && is_signed) {
-        g_assert(size < 3);
+    if (extend && (memop & MO_SIGN)) {
+        g_assert((memop & MO_SIZE) <= MO_32);
         tcg_gen_ext32u_i64(dest, dest);
     }
 
@@ -941,8 +932,8 @@ static void do_gpr_ld_memidx(DisasContext *s,
         uint32_t syn;
 
         syn = syn_data_abort_with_iss(0,
-                                      size,
-                                      is_signed,
+                                      (memop & MO_SIZE),
+                                      (memop & MO_SIGN) != 0,
                                       iss_srt,
                                       iss_sf,
                                       iss_ar,
@@ -951,14 +942,12 @@ static void do_gpr_ld_memidx(DisasContext *s,
     }
 }
 
-static void do_gpr_ld(DisasContext *s,
-                      TCGv_i64 dest, TCGv_i64 tcg_addr,
-                      int size, bool is_signed, bool extend,
+static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
+                      MemOp memop, bool extend,
                       bool iss_valid, unsigned int iss_srt,
                       bool iss_sf, bool iss_ar)
 {
-    do_gpr_ld_memidx(s, dest, tcg_addr, size, is_signed, extend,
-                     get_mem_index(s),
+    do_gpr_ld_memidx(s, dest, tcg_addr, memop, extend, get_mem_index(s),
                      iss_valid, iss_srt, iss_sf, iss_ar);
 }
 
@@ -2687,7 +2676,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, size);
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false, true, rt,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -2800,8 +2789,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         /* Only unsigned 32bit loads target 32bit registers.  */
         bool iss_sf = opc != 0;
 
-        do_gpr_ld(s, tcg_rt, clean_addr, size, is_signed, false,
-                  true, rt, iss_sf, false);
+        do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                  false, true, rt, iss_sf, false);
     }
     tcg_temp_free_i64(clean_addr);
 }
@@ -2960,11 +2949,11 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
             /* Do not modify tcg_rt before recognizing any exception
              * from the second load.
              */
-            do_gpr_ld(s, tmp, clean_addr, size, is_signed, false,
-                      false, 0, false, false);
+            do_gpr_ld(s, tmp, clean_addr, size + is_signed * MO_SIGN,
+                      false, false, 0, false, false);
             tcg_gen_addi_i64(clean_addr, clean_addr, 1 << size);
-            do_gpr_ld(s, tcg_rt2, clean_addr, size, is_signed, false,
-                      false, 0, false, false);
+            do_gpr_ld(s, tcg_rt2, clean_addr, size + is_signed * MO_SIGN,
+                      false, false, 0, false, false);
 
             tcg_gen_mov_i64(tcg_rt, tmp);
             tcg_temp_free_i64(tmp);
@@ -3095,8 +3084,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
             do_gpr_st_memidx(s, tcg_rt, clean_addr, size, memidx,
                              iss_valid, rt, iss_sf, false);
         } else {
-            do_gpr_ld_memidx(s, tcg_rt, clean_addr, size,
-                             is_signed, is_extended, memidx,
+            do_gpr_ld_memidx(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                             is_extended, memidx,
                              iss_valid, rt, iss_sf, false);
         }
     }
@@ -3200,9 +3189,8 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
             do_gpr_st(s, tcg_rt, clean_addr, size,
                       true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size,
-                      is_signed, is_extended,
-                      true, rt, iss_sf, false);
+            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                      is_extended, true, rt, iss_sf, false);
         }
     }
 }
@@ -3285,8 +3273,8 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
             do_gpr_st(s, tcg_rt, clean_addr, size,
                       true, rt, iss_sf, false);
         } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size, is_signed, is_extended,
-                      true, rt, iss_sf, false);
+            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
+                      is_extended, true, rt, iss_sf, false);
         }
     }
 }
@@ -3373,7 +3361,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
          * full load-acquire (we only need "load-acquire processor consistent"),
          * but we choose to implement them as full LDAQ.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, false,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false,
                   true, rt, disas_ldst_compute_iss_sf(size, false, 0), true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
@@ -3446,7 +3434,7 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
                                 is_wback || rn != 31, size);
 
     tcg_rt = cpu_reg(s, rt);
-    do_gpr_ld(s, tcg_rt, clean_addr, size, /* is_signed */ false,
+    do_gpr_ld(s, tcg_rt, clean_addr, size,
               /* extend */ false, /* iss_valid */ !is_wback,
               /* iss_srt */ rt, /* iss_sf */ true, /* iss_ar */ false);
 
@@ -3531,8 +3519,8 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
          * Load-AcquirePC semantics; we implement as the slightly more
          * restrictive Load-Acquire.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, is_signed, extend,
-                  true, rt, iss_sf, true);
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size + is_signed * MO_SIGN,
+                  extend, true, rt, iss_sf, true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
 }
-- 
2.25.1

