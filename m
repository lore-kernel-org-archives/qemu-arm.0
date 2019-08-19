Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3173249wrs;
        Mon, 19 Aug 2019 14:42:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUd+is4iGlB8aW80d8Csy1fdtUmig8rMhu0T+hucEyzgZv7u18pvhPDNFVIQdZZnVqzTSc
X-Received: by 2002:a05:620a:132e:: with SMTP id p14mr22987764qkj.498.1566250931554;
        Mon, 19 Aug 2019 14:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566250931; cv=none;
        d=google.com; s=arc-20160816;
        b=ResyQSX+GVQG3DbPbfu1itnHpIHp+W4OUf1VFDF8LjJwSOOnU8FkcBcJ6viPvx292b
         QcyLLojGcL5OhLaSwRjHC7KsfpgEm5MaraUghP6i14Wx/LluahTW2R3dOWFsPhJwfQIj
         q60K9YUpzkFAtMpassx5nnR44it44npAxsQHYRWcssK5nvINWTjTum46JUZepeHiHmox
         gcoHDfvsaHzjie//aKymxRofsohVTLQzSn8woapXXXiksVEmQV5q19fqAugRMo2zqfA0
         AT1VZD0/zxK2Pkz7k+sPXT4Ldt5hb7AOQJyqppsOazWDVMbXny5NQaDvSY9jVxxWIlnB
         upUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CTcKHXTSkonFgTQBSIs2aPmAFQHyFZz0bv/+Iu71uEU=;
        b=kq6vPSPjIg3luwJyFajBLcaFfV+AkrnuqA28zXpGKm2g4MMud5pGX1FZTFYEGPyB/1
         mUAbvYJJ0KItMzgK4y1X5kn3lybr5PHfb7kF8p+yi6wVrN+yYqWsjKwZUGEPc9Lbkrfj
         7nFAVw7FsAM69OFQwzspc0B71+fM2N+DqF9H/QcaYfNyrWxsm2vzRgVhmlgwjef4z6kg
         y3WPSE2Q83Gr8Q1/+1c5rGX8AbIiSp+MYmtKqEPiijqxKspdQgIIRfzy0LIpWg1/BVrX
         1dPE/4P7cTZd1cyoJf0EtAfa5qDKz9qHfWCuHNSQZdELlVm8kj7FXKaMM/NZP5Wcs9PB
         n7QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JWHyi6o9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i33si10079975qtc.292.2019.08.19.14.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JWHyi6o9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpPm-0006hf-IP
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLr-0001IU-KY
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLp-00060C-4m
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:07 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39885)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLo-0005zl-SK
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:05 -0400
Received: by mail-pf1-x433.google.com with SMTP id f17so1943637pfn.6
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CTcKHXTSkonFgTQBSIs2aPmAFQHyFZz0bv/+Iu71uEU=;
 b=JWHyi6o9Tu0e9m8VAeTEwXq0YyOxuTTzxek+RbG0YQXs00MTOEy1VVHepP/eOrLSeb
 ZqIIVifZVqTim8scB1SWqsVeURb01dNkCTdLNtAGdr6h79Usuxk06fmnVAZy8kgYnWmw
 2fuNT+32grZv0whE4bS6W6BeYqWFG/D+YnNUAof9Q6lHYdJdPFV/JgUmIAljxPP9ZLoN
 3oB7c+MhxQ28UafXldUZg6rBLGlueHzlFJzcCN5bVJ8/ggDlyInH27vXp35aSYIgHpJy
 ecA2RTolnOfCCMntGuSW9oz6v0k30T/gNg5BWd4mY6MZ2X6IdlaEvlOlSB96RjsKlBCY
 cSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CTcKHXTSkonFgTQBSIs2aPmAFQHyFZz0bv/+Iu71uEU=;
 b=cQq/p4tz4O/Had+u7h9pwl9M1H5yRSJXfxoI9CXla3mlPcjRZQX5K6/ZFpbeaTH5mL
 T3Xl5IPCIUGP5o8t8sbbSvcTAnYQPQJx4CNETSltovxWaUOlbfrYeXKVr9tyw1CG246R
 EQxWisjdOP/RjCdbqEoqohQ7x514JKP8V5QArpbE5jbpMzVOznmpnX/cYb0lRT9JWHll
 HX9mlXAAIUVxbSR5mCkLXf/4mfax4P4dxFz1KzmIB+8xzZ/w6wNOvudFSqxW9SemWnW1
 7Glx6hQiM995jV9SBL85UAJenv5AEJm1ei26XZ5W6c9XHhabD2C/CDavLv67acKdN+nC
 c0HQ==
X-Gm-Message-State: APjAAAXM5HvFE17KGLXWZsWB6CSsKAmMlDKaO3Bu2XpDg82FiPecgpBR
 OQ53DjFaDtOdxXmJnF2FXl2urw==
X-Received: by 2002:a17:90a:3465:: with SMTP id
 o92mr22409284pjb.20.1566250683627; 
 Mon, 19 Aug 2019 14:38:03 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:52 -0700
Message-Id: <20190819213755.26175-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::433
Subject: [Qemu-arm] [PATCH v2 05/68] target/arm: Convert Data Processing
 (immediate)
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
X-TUID: lKThe4c+Pdls

Convert the modified immediate form of the data processing insns.
For A32, we can finally remove any code that was intertwined with
the register and register-shifted-register forms.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 449 +++++++++++------------------------------
 target/arm/a32.decode  |  29 +++
 target/arm/t32.decode  |  42 ++++
 3 files changed, 186 insertions(+), 334 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a32fe4b222..b5af38bf84 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -439,12 +439,6 @@ static void gen_add16(TCGv_i32 t0, TCGv_i32 t1)
     tcg_temp_free_i32(t1);
 }
 
-/* Set CF to the top bit of var.  */
-static void gen_set_CF_bit31(TCGv_i32 var)
-{
-    tcg_gen_shri_i32(cpu_CF, var, 31);
-}
-
 /* Set N and Z flags from var.  */
 static inline void gen_logic_CC(TCGv_i32 var)
 {
@@ -857,25 +851,6 @@ void arm_gen_test_cc(int cc, TCGLabel *label)
     arm_free_cc(&cmp);
 }
 
-static const uint8_t table_logic_cc[16] = {
-    1, /* and */
-    1, /* xor */
-    0, /* sub */
-    0, /* rsb */
-    0, /* add */
-    0, /* adc */
-    0, /* sbc */
-    0, /* rsc */
-    1, /* andl */
-    1, /* xorl */
-    0, /* cmp */
-    0, /* cmn */
-    1, /* orr */
-    1, /* mov */
-    1, /* bic */
-    1, /* mvn */
-};
-
 static inline void gen_set_condexec(DisasContext *s)
 {
     if (s->condexec_mask) {
@@ -7661,6 +7636,48 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
     arm_gen_test_cc(cond ^ 1, s->condlabel);
 }
 
+
+/*
+ * Constant expanders for the decoders.
+ */
+
+static int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+/* Return only the rotation part of T32ExpandImm.  */
+static int t32_expandimm_rot(DisasContext *s, int x)
+{
+    return x & 0xc00 ? extract32(x, 7, 5) : 0;
+}
+
+/* Return the unrotated immediate from T32ExpandImm.  */
+static int t32_expandimm_imm(DisasContext *s, int x)
+{
+    int imm = extract32(x, 0, 8);
+
+    switch (extract32(x, 8, 4)) {
+    case 0: /* XY */
+        /* Nothing to do.  */
+        break;
+    case 1: /* 00XY00XY */
+        imm *= 0x00010001;
+        break;
+    case 2: /* XY00XY00 */
+        imm *= 0x01000100;
+        break;
+    case 3: /* XYXYXYXY */
+        imm *= 0x01010101;
+        break;
+    default:
+        /* Rotated constant.  */
+        imm |= 0x80;
+        break;
+    }
+    return imm;
+}
+
 /*
  * Include the generated decoders.
  */
@@ -7816,23 +7833,82 @@ static bool op_s_rxr_shr(DisasContext *s, arg_s_rrr_shr *a,
     return store_reg_kind(s, a->rd, tmp2, kind);
 }
 
+/*
+ * Data-processing (immediate)
+ *
+ * Operate, with set flags, one register source,
+ * one rotated immediate, and a destination.
+ *
+ * Note that logic_cc && a->rot setting CF based on the msb of the
+ * immediate is the reason why we must pass in the unrotated form
+ * of the immediate.
+ */
+static bool op_s_rri_rot(DisasContext *s, arg_s_rri_rot *a,
+                         void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32),
+                         int logic_cc, StoreRegKind kind)
+{
+    TCGv_i32 tmp1, tmp2;
+    uint32_t imm;
+
+    imm = ror32(a->imm, a->rot);
+    if (logic_cc && a->rot) {
+        tcg_gen_movi_i32(cpu_CF, imm >> 31);
+    }
+    tmp2 = tcg_const_i32(imm);
+    tmp1 = load_reg(s, a->rn);
+
+    gen(tmp1, tmp1, tmp2);
+    tcg_temp_free_i32(tmp2);
+
+    if (logic_cc) {
+        gen_logic_CC(tmp1);
+    }
+    return store_reg_kind(s, a->rd, tmp1, kind);
+}
+
+static bool op_s_rxi_rot(DisasContext *s, arg_s_rri_rot *a,
+                         void (*gen)(TCGv_i32, TCGv_i32),
+                         int logic_cc, StoreRegKind kind)
+{
+    TCGv_i32 tmp;
+    uint32_t imm;
+
+    imm = ror32(a->imm, a->rot);
+    if (logic_cc && a->rot) {
+        tcg_gen_movi_i32(cpu_CF, imm >> 31);
+    }
+    tmp = tcg_const_i32(imm);
+
+    gen(tmp, tmp);
+    if (logic_cc) {
+        gen_logic_CC(tmp);
+    }
+    return store_reg_kind(s, a->rd, tmp, kind);
+}
+
 #define DO_ANY3(NAME, OP, L, K)                                         \
     static bool trans_##NAME##_rrri(DisasContext *s, arg_s_rrr_shi *a)  \
     { StoreRegKind k = (K); return op_s_rrr_shi(s, a, OP, L, k); }      \
     static bool trans_##NAME##_rrrr(DisasContext *s, arg_s_rrr_shr *a)  \
-    { StoreRegKind k = (K); return op_s_rrr_shr(s, a, OP, L, k); }
+    { StoreRegKind k = (K); return op_s_rrr_shr(s, a, OP, L, k); }      \
+    static bool trans_##NAME##_rri(DisasContext *s, arg_s_rri_rot *a)   \
+    { StoreRegKind k = (K); return op_s_rri_rot(s, a, OP, L, k); }
 
 #define DO_ANY2(NAME, OP, L, K)                                         \
     static bool trans_##NAME##_rxri(DisasContext *s, arg_s_rrr_shi *a)  \
     { StoreRegKind k = (K); return op_s_rxr_shi(s, a, OP, L, k); }      \
     static bool trans_##NAME##_rxrr(DisasContext *s, arg_s_rrr_shr *a)  \
-    { StoreRegKind k = (K); return op_s_rxr_shr(s, a, OP, L, k); }
+    { StoreRegKind k = (K); return op_s_rxr_shr(s, a, OP, L, k); }      \
+    static bool trans_##NAME##_rxi(DisasContext *s, arg_s_rri_rot *a)   \
+    { StoreRegKind k = (K); return op_s_rxi_rot(s, a, OP, L, k); }
 
 #define DO_CMP2(NAME, OP, L)                                            \
     static bool trans_##NAME##_xrri(DisasContext *s, arg_s_rrr_shi *a)  \
     { return op_s_rrr_shi(s, a, OP, L, STREG_NONE); }                   \
     static bool trans_##NAME##_xrrr(DisasContext *s, arg_s_rrr_shr *a)  \
-    { return op_s_rrr_shr(s, a, OP, L, STREG_NONE); }
+    { return op_s_rrr_shr(s, a, OP, L, STREG_NONE); }                   \
+    static bool trans_##NAME##_xri(DisasContext *s, arg_s_rri_rot *a)   \
+    { return op_s_rri_rot(s, a, OP, L, STREG_NONE); }
 
 DO_ANY3(AND, tcg_gen_and_i32, a->s, STREG_NORMAL)
 DO_ANY3(EOR, tcg_gen_xor_i32, a->s, STREG_NORMAL)
@@ -7905,6 +7981,11 @@ static bool trans_ORN_rrri(DisasContext *s, arg_s_rrr_shi *a)
     return op_s_rrr_shi(s, a, tcg_gen_orc_i32, a->s, STREG_NORMAL);
 }
 
+static bool trans_ORN_rri(DisasContext *s, arg_s_rri_rot *a)
+{
+    return op_s_rri_rot(s, a, tcg_gen_orc_i32, a->s, STREG_NORMAL);
+}
+
 #undef DO_ANY3
 #undef DO_ANY2
 #undef DO_CMP2
@@ -8442,182 +8523,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     } else if (((insn & 0x0e000000) == 0 &&
                 (insn & 0x00000090) != 0x90) ||
                ((insn & 0x0e000000) == (1 << 25))) {
-        int set_cc, logic_cc, shiftop;
-
-        op1 = (insn >> 21) & 0xf;
-        set_cc = (insn >> 20) & 1;
-        logic_cc = table_logic_cc[op1] & set_cc;
-
-        /* data processing instruction */
-        if (insn & (1 << 25)) {
-            /* immediate operand */
-            val = insn & 0xff;
-            shift = ((insn >> 8) & 0xf) * 2;
-            val = ror32(val, shift);
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, val);
-            if (logic_cc && shift) {
-                gen_set_CF_bit31(tmp2);
-            }
-        } else {
-            /* register */
-            rm = (insn) & 0xf;
-            tmp2 = load_reg(s, rm);
-            shiftop = (insn >> 5) & 3;
-            if (!(insn & (1 << 4))) {
-                shift = (insn >> 7) & 0x1f;
-                gen_arm_shift_im(tmp2, shiftop, shift, logic_cc);
-            } else {
-                rs = (insn >> 8) & 0xf;
-                tmp = load_reg(s, rs);
-                gen_arm_shift_reg(tmp2, shiftop, tmp, logic_cc);
-            }
-        }
-        if (op1 != 0x0f && op1 != 0x0d) {
-            rn = (insn >> 16) & 0xf;
-            tmp = load_reg(s, rn);
-        } else {
-            tmp = NULL;
-        }
-        rd = (insn >> 12) & 0xf;
-        switch(op1) {
-        case 0x00:
-            tcg_gen_and_i32(tmp, tmp, tmp2);
-            if (logic_cc) {
-                gen_logic_CC(tmp);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x01:
-            tcg_gen_xor_i32(tmp, tmp, tmp2);
-            if (logic_cc) {
-                gen_logic_CC(tmp);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x02:
-            if (set_cc && rd == 15) {
-                /* SUBS r15, ... is used for exception return.  */
-                if (IS_USER(s)) {
-                    goto illegal_op;
-                }
-                gen_sub_CC(tmp, tmp, tmp2);
-                gen_exception_return(s, tmp);
-            } else {
-                if (set_cc) {
-                    gen_sub_CC(tmp, tmp, tmp2);
-                } else {
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                }
-                store_reg_bx(s, rd, tmp);
-            }
-            break;
-        case 0x03:
-            if (set_cc) {
-                gen_sub_CC(tmp, tmp2, tmp);
-            } else {
-                tcg_gen_sub_i32(tmp, tmp2, tmp);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x04:
-            if (set_cc) {
-                gen_add_CC(tmp, tmp, tmp2);
-            } else {
-                tcg_gen_add_i32(tmp, tmp, tmp2);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x05:
-            if (set_cc) {
-                gen_adc_CC(tmp, tmp, tmp2);
-            } else {
-                gen_add_carry(tmp, tmp, tmp2);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x06:
-            if (set_cc) {
-                gen_sbc_CC(tmp, tmp, tmp2);
-            } else {
-                gen_sub_carry(tmp, tmp, tmp2);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x07:
-            if (set_cc) {
-                gen_sbc_CC(tmp, tmp2, tmp);
-            } else {
-                gen_sub_carry(tmp, tmp2, tmp);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x08:
-            if (set_cc) {
-                tcg_gen_and_i32(tmp, tmp, tmp2);
-                gen_logic_CC(tmp);
-            }
-            tcg_temp_free_i32(tmp);
-            break;
-        case 0x09:
-            if (set_cc) {
-                tcg_gen_xor_i32(tmp, tmp, tmp2);
-                gen_logic_CC(tmp);
-            }
-            tcg_temp_free_i32(tmp);
-            break;
-        case 0x0a:
-            if (set_cc) {
-                gen_sub_CC(tmp, tmp, tmp2);
-            }
-            tcg_temp_free_i32(tmp);
-            break;
-        case 0x0b:
-            if (set_cc) {
-                gen_add_CC(tmp, tmp, tmp2);
-            }
-            tcg_temp_free_i32(tmp);
-            break;
-        case 0x0c:
-            tcg_gen_or_i32(tmp, tmp, tmp2);
-            if (logic_cc) {
-                gen_logic_CC(tmp);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        case 0x0d:
-            if (logic_cc && rd == 15) {
-                /* MOVS r15, ... is used for exception return.  */
-                if (IS_USER(s)) {
-                    goto illegal_op;
-                }
-                gen_exception_return(s, tmp2);
-            } else {
-                if (logic_cc) {
-                    gen_logic_CC(tmp2);
-                }
-                store_reg_bx(s, rd, tmp2);
-            }
-            break;
-        case 0x0e:
-            tcg_gen_andc_i32(tmp, tmp, tmp2);
-            if (logic_cc) {
-                gen_logic_CC(tmp);
-            }
-            store_reg_bx(s, rd, tmp);
-            break;
-        default:
-        case 0x0f:
-            tcg_gen_not_i32(tmp2, tmp2);
-            if (logic_cc) {
-                gen_logic_CC(tmp2);
-            }
-            store_reg_bx(s, rd, tmp2);
-            break;
-        }
-        if (op1 != 0x0f && op1 != 0x0d) {
-            tcg_temp_free_i32(tmp2);
-        }
+        /* Data-processing (reg, reg-shift-reg, imm).  */
+        /* All done in decodetree.  Reach here for illegal ops.  */
+        goto illegal_op;
     } else {
         /* other instructions */
         op1 = (insn >> 24) & 0xf;
@@ -9517,82 +9425,6 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
     return true;
 }
 
-/* Generate code for a Thumb-2 data processing operation.  If CONDS is nonzero
-   then set condition code flags based on the result of the operation.
-   If SHIFTER_OUT is nonzero then set the carry flag for logical operations
-   to the high bit of T1.
-   Returns zero if the opcode is valid.  */
-
-static int
-gen_thumb2_data_op(DisasContext *s, int op, int conds, uint32_t shifter_out,
-                   TCGv_i32 t0, TCGv_i32 t1)
-{
-    int logic_cc;
-
-    logic_cc = 0;
-    switch (op) {
-    case 0: /* and */
-        tcg_gen_and_i32(t0, t0, t1);
-        logic_cc = conds;
-        break;
-    case 1: /* bic */
-        tcg_gen_andc_i32(t0, t0, t1);
-        logic_cc = conds;
-        break;
-    case 2: /* orr */
-        tcg_gen_or_i32(t0, t0, t1);
-        logic_cc = conds;
-        break;
-    case 3: /* orn */
-        tcg_gen_orc_i32(t0, t0, t1);
-        logic_cc = conds;
-        break;
-    case 4: /* eor */
-        tcg_gen_xor_i32(t0, t0, t1);
-        logic_cc = conds;
-        break;
-    case 8: /* add */
-        if (conds)
-            gen_add_CC(t0, t0, t1);
-        else
-            tcg_gen_add_i32(t0, t0, t1);
-        break;
-    case 10: /* adc */
-        if (conds)
-            gen_adc_CC(t0, t0, t1);
-        else
-            gen_adc(t0, t1);
-        break;
-    case 11: /* sbc */
-        if (conds) {
-            gen_sbc_CC(t0, t0, t1);
-        } else {
-            gen_sub_carry(t0, t0, t1);
-        }
-        break;
-    case 13: /* sub */
-        if (conds)
-            gen_sub_CC(t0, t0, t1);
-        else
-            tcg_gen_sub_i32(t0, t0, t1);
-        break;
-    case 14: /* rsb */
-        if (conds)
-            gen_sub_CC(t0, t1, t0);
-        else
-            tcg_gen_sub_i32(t0, t1, t0);
-        break;
-    default: /* 5, 6, 7, 9, 12, 15. */
-        return 1;
-    }
-    if (logic_cc) {
-        gen_logic_CC(t0);
-        if (shifter_out)
-            gen_set_CF_bit31(t1);
-    }
-    return 0;
-}
-
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
@@ -10867,60 +10699,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     }
                 }
             } else {
-                /*
-                 * 0b1111_0x0x_xxxx_0xxx_xxxx_xxxx
-                 *  - Data-processing (modified immediate)
-                 */
-                int shifter_out = 0;
-                /* modified 12-bit immediate.  */
-                shift = ((insn & 0x04000000) >> 23) | ((insn & 0x7000) >> 12);
-                imm = (insn & 0xff);
-                switch (shift) {
-                case 0: /* XY */
-                    /* Nothing to do.  */
-                    break;
-                case 1: /* 00XY00XY */
-                    imm |= imm << 16;
-                    break;
-                case 2: /* XY00XY00 */
-                    imm |= imm << 16;
-                    imm <<= 8;
-                    break;
-                case 3: /* XYXYXYXY */
-                    imm |= imm << 16;
-                    imm |= imm << 8;
-                    break;
-                default: /* Rotated constant.  */
-                    shift = (shift << 1) | (imm >> 7);
-                    imm |= 0x80;
-                    imm = imm << (32 - shift);
-                    shifter_out = 1;
-                    break;
-                }
-                tmp2 = tcg_temp_new_i32();
-                tcg_gen_movi_i32(tmp2, imm);
-                rn = (insn >> 16) & 0xf;
-                if (rn == 15) {
-                    tmp = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(tmp, 0);
-                } else {
-                    tmp = load_reg(s, rn);
-                }
-                op = (insn >> 21) & 0xf;
-                if (gen_thumb2_data_op(s, op, (insn & (1 << 20)) != 0,
-                                       shifter_out, tmp, tmp2))
-                    goto illegal_op;
-                tcg_temp_free_i32(tmp2);
-                rd = (insn >> 8) & 0xf;
-                if (rd == 13 && rn == 13
-                    && (op == 8 || op == 13)) {
-                    /* ADD(S) SP, SP, imm or SUB(S) SP, SP, imm */
-                    store_sp_checked(s, tmp);
-                } else if (rd != 15) {
-                    store_reg(s, rd, tmp);
-                } else {
-                    tcg_temp_free_i32(tmp);
-                }
+                /* Data-processing (modified immediate) */
+                /* All done in decodetree.  Reach here for illegal ops.  */
+                goto illegal_op;
             }
         }
         break;
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 8e0fb06d05..286adcbf89 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -24,6 +24,7 @@
 
 &s_rrr_shi       s rd rn rm shim shty
 &s_rrr_shr       s rn rd rm rs shty
+&s_rri_rot       s rn rd imm rot
 
 # Data-processing (register)
 
@@ -76,3 +77,31 @@ ORR_rrrr         .... 000 1100 . .... .... .... 0 .. 1 ....   @s_rrr_shr
 MOV_rxrr         .... 000 1101 . 0000 .... .... 0 .. 1 ....   @s_rxr_shr
 BIC_rrrr         .... 000 1110 . .... .... .... 0 .. 1 ....   @s_rrr_shr
 MVN_rxrr         .... 000 1111 . 0000 .... .... 0 .. 1 ....   @s_rxr_shr
+
+# Data-processing (immediate)
+
+%a32extrot       8:4 !function=times_2
+
+@s_rri_rot       ---- ... .... s:1 rn:4 rd:4 .... imm:8 \
+                 &s_rri_rot rot=%a32extrot
+@s_rxi_rot       ---- ... .... s:1 .... rd:4 .... imm:8 \
+                 &s_rri_rot rot=%a32extrot rn=0
+@S_xri_rot       ---- ... .... .   rn:4 .... .... imm:8 \
+                 &s_rri_rot rot=%a32extrot rd=0 s=1
+
+AND_rri          .... 001 0000 . .... .... ............       @s_rri_rot
+EOR_rri          .... 001 0001 . .... .... ............       @s_rri_rot
+SUB_rri          .... 001 0010 . .... .... ............       @s_rri_rot
+RSB_rri          .... 001 0011 . .... .... ............       @s_rri_rot
+ADD_rri          .... 001 0100 . .... .... ............       @s_rri_rot
+ADC_rri          .... 001 0101 . .... .... ............       @s_rri_rot
+SBC_rri          .... 001 0110 . .... .... ............       @s_rri_rot
+RSC_rri          .... 001 0111 . .... .... ............       @s_rri_rot
+TST_xri          .... 001 1000 1 .... 0000 ............       @S_xri_rot
+TEQ_xri          .... 001 1001 1 .... 0000 ............       @S_xri_rot
+CMP_xri          .... 001 1010 1 .... 0000 ............       @S_xri_rot
+CMN_xri          .... 001 1011 1 .... 0000 ............       @S_xri_rot
+ORR_rri          .... 001 1100 . .... .... ............       @s_rri_rot
+MOV_rxi          .... 001 1101 . 0000 .... ............       @s_rxi_rot
+BIC_rri          .... 001 1110 . .... .... ............       @s_rri_rot
+MVN_rxi          .... 001 1111 . 0000 .... ............       @s_rxi_rot
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index f0a73fa003..50cbe48cc8 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -21,6 +21,7 @@
 
 &s_rrr_shi       !extern s rd rn rm shim shty
 &s_rrr_shr       !extern s rn rd rm rs shty
+&s_rri_rot       !extern s rn rd imm rot
 
 # Data-processing (register)
 
@@ -67,3 +68,44 @@ RSB_rrri         1110101 1110 . .... 0 ... .... .... ....     @s_rrr_shi
 
 MOV_rxrr         1111 1010 0 shty:2 s:1 rm:4 1111 rd:4 0000 rs:4 \
                  &s_rrr_shr rn=0
+
+# Data-processing (immediate)
+
+%t32extrot       26:1 12:3 0:8  !function=t32_expandimm_rot
+%t32extimm       26:1 12:3 0:8  !function=t32_expandimm_imm
+
+@s_rri_rot       ....... .... s:1 rn:4 . ... rd:4 ........ \
+                 &s_rri_rot imm=%t32extimm rot=%t32extrot
+@s_rxi_rot       ....... .... s:1 .... . ... rd:4 ........ \
+                 &s_rri_rot imm=%t32extimm rot=%t32extrot rn=0
+@S_xri_rot       ....... .... .   rn:4 . ... .... ........ \
+                 &s_rri_rot imm=%t32extimm rot=%t32extrot s=1 rd=0
+
+{
+  TST_xri        1111 0.0 0000 1 .... 0 ... 1111 ........     @S_xri_rot
+  AND_rri        1111 0.0 0000 . .... 0 ... .... ........     @s_rri_rot
+}
+BIC_rri          1111 0.0 0001 . .... 0 ... .... ........     @s_rri_rot
+{
+  MOV_rxi        1111 0.0 0010 . 1111 0 ... .... ........     @s_rxi_rot
+  ORR_rri        1111 0.0 0010 . .... 0 ... .... ........     @s_rri_rot
+}
+{
+  MVN_rxi        1111 0.0 0011 . 1111 0 ... .... ........     @s_rxi_rot
+  ORN_rri        1111 0.0 0011 . .... 0 ... .... ........     @s_rri_rot
+}
+{
+  TEQ_xri        1111 0.0 0100 1 .... 0 ... 1111 ........     @S_xri_rot
+  EOR_rri        1111 0.0 0100 . .... 0 ... .... ........     @s_rri_rot
+}
+{
+  CMN_xri        1111 0.0 1000 1 .... 0 ... 1111 ........     @S_xri_rot
+  ADD_rri        1111 0.0 1000 . .... 0 ... .... ........     @s_rri_rot
+}
+ADC_rri          1111 0.0 1010 . .... 0 ... .... ........     @s_rri_rot
+SBC_rri          1111 0.0 1011 . .... 0 ... .... ........     @s_rri_rot
+{
+  CMP_xri        1111 0.0 1101 1 .... 0 ... 1111 ........     @S_xri_rot
+  SUB_rri        1111 0.0 1101 . .... 0 ... .... ........     @s_rri_rot
+}
+RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
-- 
2.17.1

