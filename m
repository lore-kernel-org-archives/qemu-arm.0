Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6585505ejq;
        Mon, 15 May 2023 08:17:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ692UJXp7OpTRjfwZn+cEbUJ381ZCeY30xXs3zXNAkq5jtzU5IODzEIZkfpputfWeO5KXwf
X-Received: by 2002:a05:6214:624:b0:621:463e:f337 with SMTP id a4-20020a056214062400b00621463ef337mr35019689qvx.9.1684163862145;
        Mon, 15 May 2023 08:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163862; cv=none;
        d=google.com; s=arc-20160816;
        b=lkCFehLvMvBPrb4qdXl6KLYlU73cV6C4a+/6b3t+0ob214pduy96f8lOWxl+Qm0Czp
         If2W+WqN92bKO6Q3mHP2afnrZwLOI8dBYJbpPxCDpR6Ztsra0qhIYSx46PjpXNGBSPhO
         7n08nL5lshu9YC+EjLY13QJZ30cpDjwwR3V6RRubXmSD68d3jol8DhE1m6AZ9LdRpTwj
         INr2ntfeIhgoRMrmJ86o8y8OpqLW/9Oh9YhIcmhF70jNAN11k70zkz2mjWw3Q7jYfDGC
         g7n5GWtUcaqEHHbOBWdGInST2OhI7r0fPZnrcx18z5v9NKpdaRLHLOHr3Q2dvUdcSE/T
         Qlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a3C62E7I5KSH6hopm1N3+kJjnyiF8W6DIOatywqt9qE=;
        b=LJdM5AEQG68tajqc+Yy5D+2G06Mk10XgsdQV5KLhSLK8DK2t0lIindGyl8sKXea4AD
         yl4eLuBBN/zDaspeIxDkyVsvvm2YiZ9cbViQpSm5l15JYprQvSc1Vjuj7L8IpkYsa4Zq
         +pTndRDLOTq0Rd2Lht9nHbzOMsNjgOkXjVp4fptuSRFHheZAyxZE0TemJ8GFpKk23YJR
         yPY2OeszQ7hBhX4fSpFE+/OIfvxHpb2H0CAvRyjyeqgaNuLAQQW/FW0JraKcK2MU/STc
         FkQ0Cui0twFddevVXNzWCiUCbK2I2eQVFH7UVNi0lwjoZJYEDmZhwoZnFWvNtCYP3uRj
         /6NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcvh4loy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a05622a028900b003eebe989fdbsi9950421qtw.468.2023.05.15.08.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcvh4loy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZLV-0000Wo-J0; Mon, 15 May 2023 10:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZK4-0005oT-LS
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:13 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJs-00062b-OV
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aaf2ede38fso124301305ad.2
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161419; x=1686753419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3C62E7I5KSH6hopm1N3+kJjnyiF8W6DIOatywqt9qE=;
 b=kcvh4loy5A+0KhiHPS28qq4x7z0Isll6eS2rML2ZU/gSpriYoEF9BahWdJ0w1nG7X/
 imkfTW/oopVyrTDbxhDctOAs3HzXbJHeG1e8EBEDrbKsKlVNDix3dl1sVodXrTXlbyoO
 3paDA2eqQL8ySpIWItxUhG/Phd8OXL/c+BDF2AjnJEmusPsLXqucO5gpbQHziLU/JODh
 2KAY4cU73TGc0qS2jA75wOD/Gv14C9mUaILz8P489RftO6qWXAc1b0ToHSKKs0EupQHH
 J90xTO/3sI2aObEO60vryMXXB5n+9bT3CkXrSHPPfgj/HFL2oicl4HkdkrNaRY+SqRCx
 2mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161419; x=1686753419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3C62E7I5KSH6hopm1N3+kJjnyiF8W6DIOatywqt9qE=;
 b=Y/BKxg4REEb8RGAh3XPMSSvTa4YXjy06wDvOY495GyiVUK4GCAvl8MRyYv6OBaIJoa
 kLCqrJk2/i0NlQP+oMj+uAfeQDTnidAcWtFdm948HZU9EM4pymYzQDvvR1rr6sFdhQIu
 pifor2/iSZS2ERMXz8tAD5WElpS2COf/P0Ch7j+pgusqFfFqYpczpOPeQxpmpmIhULrE
 0fCJ3anglGQPaeSQq0rzbnQCNmS5VUo//UPsdrRwQuRA0icPE0If2gXbH1RAmGxJv1xf
 cGvC8shxKpzcfgjUWpw+rEAB+JHIstr54ZKyFsZYV8zy3ZXZhjjjvw6+0eAZLRIqD24D
 rCgg==
X-Gm-Message-State: AC+VfDzThRqRmxEe/3QwfXAthSH5R2uN8220MIk3WtV9PTySxWHijwNJ
 XY3zYD9x/2diUUWd8QlvpR/80DKX2vH4zBVDoss=
X-Received: by 2002:a17:902:f547:b0:1ac:4a41:d38d with SMTP id
 h7-20020a170902f54700b001ac4a41d38dmr40019890plf.51.1684161419504; 
 Mon, 15 May 2023 07:36:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 53/54] tcg/ppc: Support 128-bit load/store
Date: Mon, 15 May 2023 07:33:12 -0700
Message-Id: <20230515143313.734053-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A8VhHZCQv1jP

Use LQ/STQ with ISA v2.07, and 16-byte atomicity is required.
Note that these instructions do not require 16-byte alignment.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-set.h |   2 +
 tcg/ppc/tcg-target-con-str.h |   1 +
 tcg/ppc/tcg-target.h         |   3 +-
 tcg/ppc/tcg-target.c.inc     | 115 +++++++++++++++++++++++++++++++----
 4 files changed, 108 insertions(+), 13 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
index f206b29205..bbd7b21247 100644
--- a/tcg/ppc/tcg-target-con-set.h
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -14,6 +14,7 @@ C_O0_I2(r, r)
 C_O0_I2(r, ri)
 C_O0_I2(v, r)
 C_O0_I3(r, r, r)
+C_O0_I3(o, m, r)
 C_O0_I4(r, r, ri, ri)
 C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
@@ -34,6 +35,7 @@ C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rZ, rZ)
 C_O1_I4(r, r, r, ri, ri)
 C_O2_I1(r, r, r)
+C_O2_I1(o, m, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rI, rZM, r, r)
 C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 094613cbcb..20846901de 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -9,6 +9,7 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
+REGS('o', ALL_GENERAL_REGS & 0xAAAAAAAAu)  /* odd registers */
 REGS('v', ALL_VECTOR_REGS)
 
 /*
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 0914380bd7..204b70f86a 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -149,7 +149,8 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
-#define TCG_TARGET_HAS_qemu_ldst_i128   0
+#define TCG_TARGET_HAS_qemu_ldst_i128   \
+    (TCG_TARGET_REG_BITS == 64 && have_isa_2_07)
 
 /*
  * While technically Altivec could support V64, it has no 64-bit store
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index b5c49895f3..c3a1527856 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -295,25 +295,27 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
 #define B      OPCD( 18)
 #define BC     OPCD( 16)
+
 #define LBZ    OPCD( 34)
 #define LHZ    OPCD( 40)
 #define LHA    OPCD( 42)
 #define LWZ    OPCD( 32)
 #define LWZUX  XO31( 55)
-#define STB    OPCD( 38)
-#define STH    OPCD( 44)
-#define STW    OPCD( 36)
-
-#define STD    XO62(  0)
-#define STDU   XO62(  1)
-#define STDX   XO31(149)
-
 #define LD     XO58(  0)
 #define LDX    XO31( 21)
 #define LDU    XO58(  1)
 #define LDUX   XO31( 53)
 #define LWA    XO58(  2)
 #define LWAX   XO31(341)
+#define LQ     OPCD( 56)
+
+#define STB    OPCD( 38)
+#define STH    OPCD( 44)
+#define STW    OPCD( 36)
+#define STD    XO62(  0)
+#define STDU   XO62(  1)
+#define STDX   XO31(149)
+#define STQ    XO62(  2)
 
 #define ADDIC  OPCD( 12)
 #define ADDI   OPCD( 14)
@@ -2020,7 +2022,18 @@ typedef struct {
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return true;
+    TCGAtomAlign aa;
+
+    if ((memop & MO_SIZE) <= MO_64) {
+        return true;
+    }
+
+    /*
+     * Reject 16-byte memop with 16-byte atomicity,
+     * but do allow a pair of 64-bit operations.
+     */
+    aa = atom_and_align_for_opc(tcg_ctx, memop, MO_ATOM_IFALIGN, true);
+    return aa.atom <= MO_64;
 }
 
 /*
@@ -2035,7 +2048,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits;
+    MemOp a_bits, s_bits;
 
     /*
      * Book II, Section 1.4, Single-Copy Atomicity, specifies:
@@ -2047,10 +2060,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * As of 3.0, "the non-atomic access is performed as described in
      * the corresponding list", which matches MO_ATOM_SUBALIGN.
      */
+    s_bits = opc & MO_SIZE;
     h->aa = atom_and_align_for_opc(s, opc,
                                    have_isa_3_00 ? MO_ATOM_SUBALIGN
                                                  : MO_ATOM_IFALIGN,
-                                   false);
+                                   s_bits == MO_128);
     a_bits = h->aa.align;
 
 #ifdef CONFIG_SOFTMMU
@@ -2060,7 +2074,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    unsigned s_bits = opc & MO_SIZE;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -2303,6 +2316,70 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
+static TCGLabelQemuLdst *
+prepare_host_addr_index_only(TCGContext *s, HostAddress *h, TCGReg addr_reg,
+                             MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst;
+
+    ldst = prepare_host_addr(s, h, addr_reg, -1, oi, true);
+
+    /* Compose the final address, as LQ/STQ have no indexing. */
+    if (h->base != 0) {
+        tcg_out32(s, ADD | TAB(TCG_REG_TMP1, h->base, h->index));
+        h->index = TCG_REG_TMP1;
+        h->base = 0;
+    }
+
+    return ldst;
+}
+
+static void tcg_out_qemu_ldst_i128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                                   TCGReg addr_reg, MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+    bool need_bswap;
+    uint32_t insn;
+
+    ldst = prepare_host_addr_index_only(s, &h, addr_reg, oi, is_ld);
+    need_bswap = get_memop(oi) & MO_BSWAP;
+
+    if (h.aa.atom == MO_128) {
+        tcg_debug_assert(!need_bswap);
+        tcg_debug_assert(datalo & 1);
+        tcg_debug_assert(datahi == datalo - 1);
+        insn = is_ld ? LQ : STQ;
+        tcg_out32(s, insn | TAI(datahi, h.index, 0));
+    } else {
+        TCGReg d1, d2;
+
+        if (HOST_BIG_ENDIAN ^ need_bswap) {
+            d1 = datahi, d2 = datalo;
+        } else {
+            d1 = datalo, d2 = datahi;
+        }
+
+        if (need_bswap) {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 8);
+            insn = is_ld ? LDBRX : STDBRX;
+            tcg_out32(s, insn | TAB(d1, 0, h.index));
+            tcg_out32(s, insn | TAB(d2, h.index, TCG_REG_R0));
+        } else {
+            insn = is_ld ? LD : STD;
+            tcg_out32(s, insn | TAI(d1, h.index, 0));
+            tcg_out32(s, insn | TAI(d2, h.index, 8));
+        }
+    }
+
+    if (ldst) {
+        ldst->type = TCG_TYPE_I128;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
@@ -2853,6 +2930,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                             args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], true);
+        break;
+
     case INDEX_op_qemu_st_i32:
         if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
             tcg_out_qemu_st(s, args[0], -1, args[1], -1,
@@ -2874,6 +2956,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                             args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], false);
+        break;
 
     case INDEX_op_setcond_i32:
         tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
@@ -3709,6 +3795,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
                 : C_O0_I4(r, r, r, r));
 
+    case INDEX_op_qemu_ld_i128:
+        return C_O2_I1(o, m, r);
+    case INDEX_op_qemu_st_i128:
+        return C_O0_I3(o, m, r);
+
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_mul_vec:
-- 
2.34.1

