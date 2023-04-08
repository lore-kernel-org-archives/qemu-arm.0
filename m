Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649490ejb;
        Fri, 7 Apr 2023 19:45:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPMWimFlB5oAS/9HLQMzW2g6Hv7Wy0UHmdrdm3B151EpX64/Kxphh87MtFD+wXkz9e8O3y
X-Received: by 2002:ad4:5bac:0:b0:5e8:42d0:d74d with SMTP id 12-20020ad45bac000000b005e842d0d74dmr5790884qvq.29.1680921951216;
        Fri, 07 Apr 2023 19:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921951; cv=none;
        d=google.com; s=arc-20160816;
        b=BSQcn/jgThi8VHC5vVG1IZsXuAV73w06XB+024qfq26l1J8iOAoixWNiItJy4oI2UW
         F4h2kY1Z7YOiVh/nI1jPGuGls9Bl3KCud/Ccfz8mTV6btPVGZtGTYELoyrUxFAAUNdo8
         lUfK/z7jlgjSG9V+S3LFI/8zQyZA0YHRI0nYaP33A+Y3eLkGZtbIDY+LwxuUIKvf4cqT
         Y37pdGkOguigYy7Ijbg9TCxIpwP/K4O6taxzondFSlvxcEGEsEim5PzmV34rtdm1fYTx
         NoLU6Zrpy2LIER/Bh3LCjqTWwnhH/VkRy1Am8tkxMTI7BK8kP843eF/NOHZD5B41h655
         6oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mz8kJeRhmTsi9fcghAqDVd5txMxvTf7rUjSQ1DhbH08=;
        b=y58qNuB+/43UoIETVJIZnr6Ma51LyBxuBtU0pUZO4E2o7Lm/j+Nyh+innyhKRDsdh/
         yKVwJGFpajh4ICKSVb9ndxED5qofYbkSWFmUUHqtYF8ttv/s3DKYIoGociB2gX/oBXiW
         n6EXvyF97mcXyYax/QOj9lZuKcleqKj+SJj9R9RaSfSl44QecHiiVw7j+tsFoLKDGsai
         onzwP/P5scCOV29imRYOQME6y+nbbigtmPLYgnaDOEDWKDgFiLx6az3yYR45ZxtXlqiO
         jTdsyTm4fvkFuv3bI6qZOckY29Gsl0S/ildmyt4CBa7h6oT+GmM6ub6xlyZySu7R/h9o
         CoBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+GDurDA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq1-20020ad45961000000b0056ef111492fsi3856142qvb.245.2023.04.07.19.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+GDurDA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyZS-0001Sn-Ai; Fri, 07 Apr 2023 22:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ4-0008Ss-OZ
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:31 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYP-0005rx-2v
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:30 -0400
Received: by mail-pj1-x102e.google.com with SMTP id go23so3074687pjb.4
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mz8kJeRhmTsi9fcghAqDVd5txMxvTf7rUjSQ1DhbH08=;
 b=S+GDurDA0VvnMmpRdUOsGLgiffJkRryZzWtd1MP3foxG6NHE+IbWC2ezV+kptgEWgP
 zkQg93D0eGpWjb6jmUjsMbVw09P5pl+F8yrn+cc60qg6RjDI0USXvD9ysI2a5HQC5QrL
 mdIeYaM6m1mRoCOCx77x218Ag01boE8+XxqOpqWPG1lDEzAHul9tla4YDNUY+uZp4rW/
 7lU9H6b16KPmiS2UG3k2Ha14obSWM+RjCkh9hn+FMyIpzvbKFOvEfTMufNkJgIItygIV
 QyLhkbYbJwB0MimIusH+1ipG5+1Lz48DVCqqPUdXs++KCfV64Y8eC7o3cjpR6+2LhXQb
 ZLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mz8kJeRhmTsi9fcghAqDVd5txMxvTf7rUjSQ1DhbH08=;
 b=w/Q6Ll8IaefKbwfBauPH14+T54Tt47ouZDWec2akVKpVhRiH3LQ/evaaTwudHORlJ2
 9eCXdOfzzr1yLPm4yW9fpeU1um8MLQjbucO0Mr1xxHDTk66PnwZ1S8gB+BimJ9fJkW+O
 upHC4hJCfq5JC47/h2DjokBajuDz+zId/mIJ/R+YuR1QVgKexF/nTL5s8s3jpDyGk5Fo
 hgGnnM5H+0oySuco5+W1NykWq5CPHGn7JYJWWRX7bd2SupmdvWanO5mAFsPUCXLvLeoc
 m1QsLybv6t6Z9wS6qsVJ5Ls1jUvR8gQwP87hDqdfRbTJwhH57okMJVW52MyDyjaCH6oC
 zOvw==
X-Gm-Message-State: AAQBX9fRLrskWBAsJHujRCCZDElgLXOs5MT2LJCxGEy8CmX/iKG6KS5C
 Lucg0IXfGjKpeqaI/D1KhHvHFg==
X-Received: by 2002:a17:90b:1d11:b0:23d:158c:a60c with SMTP id
 on17-20020a17090b1d1100b0023d158ca60cmr4578828pjb.44.1680921827490; 
 Fri, 07 Apr 2023 19:43:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 35/42] tcg/ppc: Reorg tcg_out_tlb_read
Date: Fri,  7 Apr 2023 19:43:07 -0700
Message-Id: <20230408024314.3357414-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: YmzeOL7fQP9X

Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
the normally allocated registers for the tlb load.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 83 +++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 35 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 383464b408..7195c0b817 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -68,6 +68,7 @@
 #else
 # define TCG_REG_TMP1   TCG_REG_R12
 #endif
+#define TCG_REG_TMP2    TCG_REG_R11
 
 #define TCG_VEC_TMP1    TCG_REG_V0
 #define TCG_VEC_TMP2    TCG_REG_V1
@@ -2007,10 +2008,11 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
 
-/* Perform the TLB load and compare.  Places the result of the comparison
-   in CR7, loads the addend of the TLB into R3, and returns the register
-   containing the guest address (zero-extended into R4).  Clobbers R0 and R2. */
-
+/*
+ * Perform the TLB load and compare.  Places the result of the comparison
+ * in CR7, loads the addend of the TLB into TMP1, and returns the register
+ * containing the guest address (zero-extended into TMP2).  Clobbers R0.
+ */
 static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
                                TCGReg addrlo, TCGReg addrhi,
                                int mem_index, bool is_read)
@@ -2026,40 +2028,44 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
     unsigned a_bits = get_alignment_bits(opc);
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_AREG0, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R4, TCG_AREG0, table_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, mask_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_AREG0, table_off);
 
     /* Extract the page index, shifted into place for tlb index.  */
     if (TCG_TARGET_REG_BITS == 32) {
-        tcg_out_shri32(s, TCG_REG_TMP1, addrlo,
+        tcg_out_shri32(s, TCG_REG_R0, addrlo,
                        TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     } else {
-        tcg_out_shri64(s, TCG_REG_TMP1, addrlo,
+        tcg_out_shri64(s, TCG_REG_R0, addrlo,
                        TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     }
-    tcg_out32(s, AND | SAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_TMP1));
+    tcg_out32(s, AND | SAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_R0));
 
-    /* Load the TLB comparator.  */
+    /* Load the (low part) TLB comparator into TMP2. */
     if (cmp_off == 0 && TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
         uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || TARGET_LONG_BITS == 32
                         ? LWZUX : LDUX);
-        tcg_out32(s, lxu | TAB(TCG_REG_TMP1, TCG_REG_R3, TCG_REG_R4));
+        tcg_out32(s, lxu | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
     } else {
-        tcg_out32(s, ADD | TAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_R4));
+        tcg_out32(s, ADD | TAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_TMP2));
         if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP1, TCG_REG_R3, cmp_off + 4);
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R4, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2,
+                       TCG_REG_TMP1, cmp_off + 4);
         } else {
-            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
         }
     }
 
-    /* Load the TLB addend for use on the fast path.  Do this asap
-       to minimize any load use delay.  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_REG_R3,
-               offsetof(CPUTLBEntry, addend));
+    /*
+     * Load the TLB addend for use on the fast path.
+     * Do this asap to minimize any load use delay.
+     */
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+    }
 
-    /* Clear the non-page, non-alignment bits from the address */
+    /* Clear the non-page, non-alignment bits from the address into R0. */
     if (TCG_TARGET_REG_BITS == 32) {
         /* We don't support unaligned accesses on 32-bits.
          * Preserve the bottom bits and thus trigger a comparison
@@ -2090,9 +2096,6 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
         if (TARGET_LONG_BITS == 32) {
             tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
                         (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
-            /* Zero-extend the address for use in the final address.  */
-            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
-            addrlo = TCG_REG_R4;
         } else if (a_bits == 0) {
             tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
         } else {
@@ -2102,16 +2105,27 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
         }
     }
 
+    /* Full or low part comparison into cr7. */
+    tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2, 0, 7, TCG_TYPE_I32);
+
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
-                    0, 7, TCG_TYPE_I32);
-        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
+        /* High part comparison into cr6. */
+        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R0, TCG_REG_TMP1, cmp_off);
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, addrhi, 0, 6, TCG_TYPE_I32);
+
+        /* Load addend, deferred for this case. */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+
+        /* Combine comparisons into cr7. */
         tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
-    } else {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
-                    0, 7, TCG_TYPE_TL);
     }
 
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        /* Zero-extend the address for use in the final address.  */
+        tcg_out_ext32u(s, TCG_REG_TMP2, addrlo);
+        return TCG_REG_TMP2;
+    }
     return addrlo;
 }
 
@@ -2179,11 +2193,9 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     /*
      * For the purposes of ppc32 sorting 4 input registers into 4 argument
      * registers, there is an outside chance we would require 3 temps.
-     * Because of constraints, no inputs are in r3, and env will not be
-     * placed into r3 until after the sorting is done, and is thus free.
      */
     tcg_out_st_helper_args(s, lb, tcg_out_mflr, -1, TCG_REG_TMP1,
-                           TCG_REG_R0, TCG_REG_R3);
+                           TCG_REG_TMP2, TCG_REG_R0);
 
     tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
@@ -2285,7 +2297,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
 
-    rbase = TCG_REG_R3;
+    rbase = TCG_REG_TMP1;
 #else  /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -2366,7 +2378,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
     label_ptr = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
 
-    rbase = TCG_REG_R3;
+    rbase = TCG_REG_TMP1;
 #else  /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -3934,7 +3946,8 @@ static void tcg_target_init(TCGContext *s)
 #if defined(_CALL_SYSV) || TCG_TARGET_REG_BITS == 64
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_R13); /* thread pointer */
 #endif
-    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1); /* mem temp */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP1);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP2);
     if (USE_REG_TB) {
-- 
2.34.1

