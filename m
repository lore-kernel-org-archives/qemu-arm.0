Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2597990ejm;
        Sun, 23 Apr 2023 22:47:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350aalYpVODwS1Bqz5lrfUHUJMSR6pO6X3dj/LPB0xtCnmFf7vo8XVazgyqO9W4eZwFpc7z4n
X-Received: by 2002:a05:622a:43:b0:3d2:a927:21bc with SMTP id y3-20020a05622a004300b003d2a92721bcmr20606617qtw.18.1682315263627;
        Sun, 23 Apr 2023 22:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315263; cv=none;
        d=google.com; s=arc-20160816;
        b=SNUGh6MEcZaz4DGj4zewki6suGnZKy6aPP97CI+RztLpRv645PD9ZiYd9C/q+64zh6
         z84I15BZlukEnuu0YWo+BglvN9nNzjdvcS0O9lZpUFnYEtTApIb4PZZAo1UGq9uK3VYS
         /4Q5Up2bFISTkvBsUBOSv7zmtHfZP8U5+hfLXs0zz+Ov3T/5UjWw+TeXEw6l69BkrYeu
         OaT1wuJ6Q/eA9nzf8fNlrWx6Djdw/MbKByMHkMLbXIWiRTHqhn1fIFuUQ8f/5gbV4Orz
         CrqmWm7dQ6VhJla/vy3luCUBfXFsKYr4RKWBMCBtL0YgMuCt3h47CopbhO1RmNB0D5nA
         nvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eTTppFvpCeQOyLgVasYHuYDrv+swYGMzo0e4SF2rHxM=;
        b=MsO2C/mBmY5tW4J9xZBk1La7lb0Yjk/y5x8siBfUBra9cSfS9pA2BIIp15qGjYwHNf
         vrPXhBEUWda/clkhhBPKI7fn4k2Z2k0+uvQGVOASSsOUMBTNYgIVtg3bT22z85sGSbIh
         uyGfXUOsD5MsC4/lOWJ7OZeafIz2EZgrnx0PTYfqYuvnnMeon5FwD14Zii6crq8HfdJr
         C/Xsv6V5LfGz6k89D2ZCqWofF4IJv3tpsX6Ls7jEU1fJIfYIKdI66YgkJIcEfXDaWmfM
         9dphWaXWk7iqXfAnEs1XOm6yjsWQQOugv40gTnoydBRGT+qhL8Dd3pbS1lXzbuCfrzqp
         uTpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HrKLf2/t";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de3-20020a05620a370300b0074df3ec8193si6577734qkb.515.2023.04.23.22.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HrKLf2/t";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp2Z-0001Pr-LW; Mon, 24 Apr 2023 01:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0P-00064T-B8
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0F-0005L5-OA
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so9376865e9.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315077; x=1684907077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTTppFvpCeQOyLgVasYHuYDrv+swYGMzo0e4SF2rHxM=;
 b=HrKLf2/t3FDOmOgY10zUvxxBO0MJrTaxEk5y+MqO4xy6XU6Je2VpIWa+m64bz0nPxM
 KhgY/nnKMlBGyV6cnMXa6I6sCIkXFU68ITiBwjsNgnuEcox7YlkZAPEgygknYeC36VFe
 afW0ED0DB2MW/MNASoOY1eQ0tcy3iFvXLb1XCY1Wp57EkK6MvSsh6m43b5/URFQyKZEm
 pCInQE/hnjG+I58OF/fziAUy3pPDxdsBaJTrz0VzhtULosXRbHjWwfDW4wlb7GHMAMEC
 3eTSPkqUwvIOPGpiVa/ll6ok9sKfZ9oAr/0zQAAlsLP1KGhZX6rwyQjnpgQ/SfFzjqDe
 JAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315077; x=1684907077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTTppFvpCeQOyLgVasYHuYDrv+swYGMzo0e4SF2rHxM=;
 b=TgEddckXBfg2LVMxIxbfiLYjJV4xm8bEL3orvFhNBxheEvk1bppvMHmPn496ATzopl
 RkwLWnSd3WJ9XiE9085SB4NHyJxtRBj+IvpSysQ7yliUobXfGtDlOViTcekrY4WyFz8t
 W02rOd6gosDoEQoAe6t75CawdMQzk7L3mi6B/FbX31ZTgBTCvekfCCVolz+WLDOQMNQd
 phjdajYLne5yIpSMizURr1lHWXLjcFlmZ2rVv6eVAqNshxpUdJEgkjZSX/3zjJ6aGeUr
 yUmMLeb6adLWIzw7GCXCCcDFaSdZ7Bo1bm0HopG29hcvW39uiAcQWqyQ/3oOqAdS4gyw
 3wVg==
X-Gm-Message-State: AAQBX9cJV5q0cm4H+8tourmwmew0b06SdzcpHOxowIHV93yooizjVRYy
 IrtWBtKfisvaF+PHSH/vmCLiMXWANBIGOjJwgcEi7A==
X-Received: by 2002:a7b:cb96:0:b0:3f0:5519:9049 with SMTP id
 m22-20020a7bcb96000000b003f055199049mr7136363wmi.8.1682315076840; 
 Sun, 23 Apr 2023 22:44:36 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 52/57] tcg/ppc: Reorg tcg_out_tlb_read
Date: Mon, 24 Apr 2023 06:41:00 +0100
Message-Id: <20230424054105.1579315-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 5axfn1hAn0BK

Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
the normally allocated registers for the tlb load.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 84 ++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 33 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 042136fee7..6850ecbc80 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -68,6 +68,7 @@
 #else
 # define TCG_REG_TMP1   TCG_REG_R12
 #endif
+#define TCG_REG_TMP2    TCG_REG_R11
 
 #define TCG_VEC_TMP1    TCG_REG_V0
 #define TCG_VEC_TMP2    TCG_REG_V1
@@ -2015,13 +2016,11 @@ static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 /*
  * For the purposes of ppc32 sorting 4 input registers into 4 argument
  * registers, there is an outside chance we would require 3 temps.
- * Because of constraints, no inputs are in r3, and env will not be
- * placed into r3 until after the sorting is done, and is thus free.
  */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ra_gen = ldst_ra_gen,
     .ntmp = 3,
-    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
+    .tmp = { TCG_REG_TMP1, TCG_REG_TMP2, TCG_REG_R0 }
 };
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
@@ -2135,41 +2134,44 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
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
+    /* Load the (low part) TLB comparator into TMP2.  */
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
+                       TCG_REG_TMP1, cmp_off + 4 * HOST_BIG_ENDIAN);
         } else {
-            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
+            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
         }
     }
 
-    /* Load the TLB addend for use on the fast path.  Do this asap
-       to minimize any load use delay.  */
-    h->base = TCG_REG_R3;
-    tcg_out_ld(s, TCG_TYPE_PTR, h->base, TCG_REG_R3,
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
+    /* Clear the non-page, non-alignment bits from the address in R0. */
     if (TCG_TARGET_REG_BITS == 32) {
         /* We don't support unaligned accesses on 32-bits.
          * Preserve the bottom bits and thus trigger a comparison
@@ -2200,9 +2202,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         if (TARGET_LONG_BITS == 32) {
             tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
                         (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
-            /* Zero-extend the address for use in the final address.  */
-            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
-            addrlo = TCG_REG_R4;
         } else if (a_bits == 0) {
             tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
         } else {
@@ -2211,21 +2210,36 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
             tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, TARGET_PAGE_BITS, 0);
         }
     }
-    h->index = addrlo;
 
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+        /* Low part comparison into cr7. */
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
                     0, 7, TCG_TYPE_I32);
-        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
+
+        /* Load the high part TLB comparator into TMP2.  */
+        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2, TCG_REG_TMP1,
+                   cmp_off + 4 * !HOST_BIG_ENDIAN);
+
+        /* Load addend, deferred for this case. */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
+                   offsetof(CPUTLBEntry, addend));
+
+        /* High part comparison into cr6. */
+        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_TMP2, 0, 6, TCG_TYPE_I32);
+
+        /* Combine comparisons into cr7. */
         tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
     } else {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+        /* Full comparison into cr7. */
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2,
                     0, 7, TCG_TYPE_TL);
     }
 
     /* Load a pointer into the current opcode w/conditional branch-link. */
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
+
+    h->base = TCG_REG_TMP1;
 #else
     if (a_bits) {
         ldst = new_ldst_label(s);
@@ -2243,13 +2257,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     h->base = guest_base ? TCG_GUEST_BASE_REG : 0;
-    h->index = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        h->index = TCG_REG_TMP1;
-    }
 #endif
 
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        /* Zero-extend the guest address for use in the host address. */
+        tcg_out_ext32u(s, TCG_REG_R0, addrlo);
+        h->index = TCG_REG_R0;
+    } else {
+        h->index = addrlo;
+    }
+
     return ldst;
 }
 
@@ -3901,7 +3918,8 @@ static void tcg_target_init(TCGContext *s)
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

