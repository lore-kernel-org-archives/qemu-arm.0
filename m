Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207071wrv;
        Fri, 26 Jul 2019 10:51:01 -0700 (PDT)
X-Received: by 2002:a17:90a:6546:: with SMTP id f6mr53011363pjs.11.1564163461696;
        Fri, 26 Jul 2019 10:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163461; cv=none;
        d=google.com; s=arc-20160816;
        b=lbHVks+wCKEehOLUkqdVDoTWtJPQcujrYwXntovoRf3aB9a8GvajV8Dn7UyjWIWZU9
         lCbhmZmzG8UA45L2FBuvcZSl21Bta7n1Tf1zbpxxbsQEI/hBOI5jstZH//2i14IDDY9V
         z4SV09JFzw/XvGYsh9Mydw+fpGZwkw2AH/HI473iiveA3rrcnfkiMA1uTnlDTKY6XrW0
         QIY9/j0h/U3aVQpHjYfW2mO6Cg42PWsSfIqqoD/lGr8KWY1SfAcQnuTLAy9BzCfmKIfD
         Pt8atV3p3l5Ao5hF+S+Ivt8Q2ACrbzHABkYuFxB8Fx2JjC0mhZYLlLncIdLY2Odn2Tz0
         0Jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=UQ07c4ep2Pcf/e+Y3eYe2vH+RAjRFAYTFfhUhpRt/AQ=;
        b=RHM1nDxdmywIY+0XgyWvKf+Iv6NHW+ldpcXki76R1QX8f5dzoee1MmHiuBHUyA3odz
         MKJp6wFnxHwQSRzWV3Ohsl2teqz5mPLe8KMUpXQWRuL0XOYNPDnDoxTOWYuE5GOOBKnY
         cmns6wner43JdbPiYkZJ4BG3fUpud/xBlO5NvS41VTifExwSHdPRWsSGYKAumRJ/6SAG
         ZDYXRnhakz42ZngeGfxPhzbiIPjFHQvABVEni8crcYNEjiAAxkLdyU5LqLFnBEriaPxU
         RkCC4TzYwh8Ev/8sZjIKV1sVX1gbGGVrDcF4IQVBZcDOZ52Aq2n+hIxYH5FijLPeQOFb
         eK3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0w6krZ0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o32sor65350172pld.12.2019.07.26.10.51.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0w6krZ0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UQ07c4ep2Pcf/e+Y3eYe2vH+RAjRFAYTFfhUhpRt/AQ=;
        b=w0w6krZ0XFNimoa4tsqekOt61XoTXIyXXy21HpBq+A2hST4ENC8fLgpJMNAXjiE1hD
         p9xQLUfXOQ45KE04NiCiWW1IQIOQ/2LnSv9MuJFCcqIQSOiQI7miDuXecMo/z3ylAT8z
         oRF0OCesIyhP8GhinVT2tjUYclunUlG3XymPuZ/dhtVQhzGplEkKkHszPYtZt55/MPKi
         CQG3M8jT74DbTa++vaRW206xXwZv0cb6Baa/8NP84zRnCBSjYIyshezo8nVvrvo1XE1O
         ULaggsk/8j5ShP0lcY6U9hy04hHQDNxIO7R28Ez2+GCtLR3cAzbhpRFqaxpP03HHr/DK
         dXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UQ07c4ep2Pcf/e+Y3eYe2vH+RAjRFAYTFfhUhpRt/AQ=;
        b=Q+b15nv0R+a9cJj0SV8H1pDtPOj15bnfOQOaaeUza4jtUTZR1NVtcWJJL41qBAEKUD
         NkbU8rDXgtGb4+MiHqV2uCXo81+uGUGKHr/UlJxrbGcacahjmIhCJqdY3RRfR2fzeiZO
         WyZBPKmODuZpYMazxpOqFit4dUWVFK18Y00eUCNrTiKo84fzmd0KdgsmuX63Q8Cs9A1O
         nPi8gQYAnU/ep9t7FcDU38vF8+wTYPnY9DR+dL5tPFrTMR5cEL/Y4Bl5WkMaG4wPcmsK
         uBguByDGQmksJsN4qswej1L47kESRxPdM1TGvgrcAGHFwwrxxVf7ShS0U5tr+pWbZ+EB
         Getw==
X-Gm-Message-State: APjAAAUe7d1fx0vp++HjvKXOBuQ2wX3/2lKdAwnsjGmFjBUMj6xakRPW
	AyZaqRctYXpQTSx5TZh2rUNBcgnx
X-Google-Smtp-Source: APXvYqxtZvlFLweBxbX5bcGSdCdLV4Su80h9LHkB5KYwDGGslPz6D2Y3T5z6vzD7VKTZcztAMBb+Ig==
X-Received: by 2002:a17:902:f301:: with SMTP id gb1mr95883003plb.292.1564163461023;
        Fri, 26 Jul 2019 10:51:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 23/67] target/arm: Convert Synchronization primitives
Date: Fri, 26 Jul 2019 10:49:48 -0700
Message-Id: <20190726175032.6769-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: SOdnn8oO1A+G

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 560 ++++++++++++++++++++++-------------------
 target/arm/a32.decode  |  48 ++++
 target/arm/t32.decode  |  46 ++++
 3 files changed, 396 insertions(+), 258 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 73cb624ebd..74e54b7efb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8890,6 +8890,302 @@ DO_LDST(STRH, store, MO_UW)
 
 #undef DO_LDST
 
+/*
+ * Synchronization primitives
+ */
+
+static bool op_swp(DisasContext *s, arg_SWP *a, TCGMemOp opc)
+{
+    TCGv_i32 addr, tmp;
+    TCGv taddr;
+
+    opc |= s->be_data;
+    addr = load_reg(s, a->rn);
+    taddr = gen_aa32_addr(s, addr, opc);
+    tcg_temp_free_i32(addr);
+
+    tmp = load_reg(s, a->rt2);
+    tcg_gen_atomic_xchg_i32(tmp, taddr, tmp, get_mem_index(s), opc);
+    tcg_temp_free(taddr);
+
+    store_reg(s, a->rt, tmp);
+    return true;
+}
+
+static bool trans_SWP(DisasContext *s, arg_SWP *a)
+{
+    return op_swp(s, a, MO_UL | MO_ALIGN);
+}
+
+static bool trans_SWPB(DisasContext *s, arg_SWP *a)
+{
+    return op_swp(s, a, MO_UB);
+}
+
+/*
+ * Load/Store Exclusive and Load-Acquire/Store-Release
+ */
+
+static bool op_strex(DisasContext *s, arg_STREX *a, TCGMemOp mop, bool rel)
+{
+    TCGv_i32 addr;
+
+    if (rel) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    }
+
+    addr = tcg_temp_local_new_i32();
+    load_reg_var(s, addr, a->rn);
+    tcg_gen_addi_i32(addr, addr, a->imm);
+
+    gen_store_exclusive(s, a->rd, a->rt, a->rt2, addr, mop);
+    tcg_temp_free_i32(addr);
+    return true;
+}
+
+static bool trans_STREX(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+    return op_strex(s, a, MO_32, false);
+}
+
+static bool trans_STREXD_a32(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_6K || (a->rt & 1)) {
+        return false;
+    }
+    a->rt2 = a->rt + 1;
+    return op_strex(s, a, MO_64, false);
+}
+
+static bool trans_STREXD_t32(DisasContext *s, arg_STREX *a)
+{
+    return op_strex(s, a, MO_64, false);
+}
+
+static bool trans_STREXB(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_6K) {
+        return false;
+    }
+    return op_strex(s, a, MO_8, false);
+}
+
+static bool trans_STREXH(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_6K) {
+        return false;
+    }
+    return op_strex(s, a, MO_16, false);
+}
+
+static bool trans_STLEX(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_strex(s, a, MO_32, true);
+}
+
+static bool trans_STLEXD_a32(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_8 || (a->rt & 1)) {
+        return false;
+    }
+    a->rt2 = a->rt + 1;
+    return op_strex(s, a, MO_64, true);
+}
+
+static bool trans_STLEXD_t32(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_strex(s, a, MO_64, true);
+}
+
+static bool trans_STLEXB(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_strex(s, a, MO_8, true);
+}
+
+static bool trans_STLEXH(DisasContext *s, arg_STREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_strex(s, a, MO_16, true);
+}
+
+static bool op_stl(DisasContext *s, arg_STL *a, TCGMemOp mop)
+{
+    TCGv_i32 addr, tmp;
+
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    addr = load_reg(s, a->rn);
+
+    tmp = load_reg(s, a->rt);
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
+
+    tcg_temp_free_i32(tmp);
+    tcg_temp_free_i32(addr);
+    return true;
+}
+
+static bool trans_STL(DisasContext *s, arg_STL *a)
+{
+    return op_stl(s, a, MO_UL);
+}
+
+static bool trans_STLB(DisasContext *s, arg_STL *a)
+{
+    return op_stl(s, a, MO_UB);
+}
+
+static bool trans_STLH(DisasContext *s, arg_STL *a)
+{
+    return op_stl(s, a, MO_UW);
+}
+
+static bool op_ldrex(DisasContext *s, arg_LDREX *a, TCGMemOp mop, bool acq)
+{
+    TCGv_i32 addr;
+
+    addr = tcg_temp_local_new_i32();
+    load_reg_var(s, addr, a->rn);
+    tcg_gen_addi_i32(addr, addr, a->imm);
+
+    gen_load_exclusive(s, a->rt, a->rt2, addr, mop);
+    tcg_temp_free_i32(addr);
+
+    if (acq) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+    }
+    return true;
+}
+
+static bool trans_LDREX(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+    return op_ldrex(s, a, MO_32, false);
+}
+
+static bool trans_LDREXD_a32(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_6K || (a->rt & 1)) {
+        return false;
+    }
+    a->rt2 = a->rt + 1;
+    return op_ldrex(s, a, MO_64, false);
+}
+
+static bool trans_LDREXD_t32(DisasContext *s, arg_LDREX *a)
+{
+    return op_ldrex(s, a, MO_64, false);
+}
+
+static bool trans_LDREXB(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_6K) {
+        return false;
+    }
+    return op_ldrex(s, a, MO_8, false);
+}
+
+static bool trans_LDREXH(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_6K) {
+        return false;
+    }
+    return op_ldrex(s, a, MO_16, false);
+}
+
+static bool trans_LDAEX(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_ldrex(s, a, MO_32, true);
+}
+
+static bool trans_LDAEXD_a32(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_8 || (a->rt & 1)) {
+        return false;
+    }
+    a->rt2 = a->rt + 1;
+    return op_ldrex(s, a, MO_64, true);
+}
+
+static bool trans_LDAEXD_t32(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_ldrex(s, a, MO_64, true);
+}
+
+static bool trans_LDAEXB(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_ldrex(s, a, MO_8, true);
+}
+
+static bool trans_LDAEXH(DisasContext *s, arg_LDREX *a)
+{
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    return op_ldrex(s, a, MO_16, true);
+}
+
+static bool op_lda(DisasContext *s, arg_LDA *a, TCGMemOp mop)
+{
+    TCGv_i32 addr, tmp;
+
+    if (!ENABLE_ARCH_8) {
+        return false;
+    }
+    addr = load_reg(s, a->rn);
+
+    tmp = tcg_temp_new_i32();
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | s->be_data);
+    disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
+    tcg_temp_free_i32(addr);
+
+    store_reg(s, a->rt, tmp);
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    return true;
+}
+
+static bool trans_LDA(DisasContext *s, arg_LDA *a)
+{
+    return op_lda(s, a, MO_UL);
+}
+
+static bool trans_LDAB(DisasContext *s, arg_LDA *a)
+{
+    return op_lda(s, a, MO_UB);
+}
+
+static bool trans_LDAH(DisasContext *s, arg_LDA *a)
+{
+    return op_lda(s, a, MO_UW);
+}
+
 /*
  * Legacy decoder.
  */
@@ -9182,172 +9478,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x0:
         case 0x1:
             /* multiplies, extra load/stores */
-            sh = (insn >> 5) & 3;
-            if (sh == 0) {
-                if (op1 == 0x0) {
-                    /* Multiply and multiply accumulate.  */
-                    /* All done in decodetree.  Reach here for illegal ops.  */
-                    goto illegal_op;
-                } else {
-                    rn = (insn >> 16) & 0xf;
-                    rd = (insn >> 12) & 0xf;
-                    if (insn & (1 << 23)) {
-                        /* load/store exclusive */
-                        bool is_ld = extract32(insn, 20, 1);
-                        bool is_lasr = !extract32(insn, 8, 1);
-                        int op2 = (insn >> 8) & 3;
-                        op1 = (insn >> 21) & 0x3;
-
-                        switch (op2) {
-                        case 0: /* lda/stl */
-                            if (op1 == 1) {
-                                goto illegal_op;
-                            }
-                            ARCH(8);
-                            break;
-                        case 1: /* reserved */
-                            goto illegal_op;
-                        case 2: /* ldaex/stlex */
-                            ARCH(8);
-                            break;
-                        case 3: /* ldrex/strex */
-                            if (op1) {
-                                ARCH(6K);
-                            } else {
-                                ARCH(6);
-                            }
-                            break;
-                        }
-
-                        addr = tcg_temp_local_new_i32();
-                        load_reg_var(s, addr, rn);
-
-                        if (is_lasr && !is_ld) {
-                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-                        }
-
-                        if (op2 == 0) {
-                            if (is_ld) {
-                                tmp = tcg_temp_new_i32();
-                                switch (op1) {
-                                case 0: /* lda */
-                                    gen_aa32_ld32u_iss(s, tmp, addr,
-                                                       get_mem_index(s),
-                                                       rd | ISSIsAcqRel);
-                                    break;
-                                case 2: /* ldab */
-                                    gen_aa32_ld8u_iss(s, tmp, addr,
-                                                      get_mem_index(s),
-                                                      rd | ISSIsAcqRel);
-                                    break;
-                                case 3: /* ldah */
-                                    gen_aa32_ld16u_iss(s, tmp, addr,
-                                                       get_mem_index(s),
-                                                       rd | ISSIsAcqRel);
-                                    break;
-                                default:
-                                    abort();
-                                }
-                                store_reg(s, rd, tmp);
-                            } else {
-                                rm = insn & 0xf;
-                                tmp = load_reg(s, rm);
-                                switch (op1) {
-                                case 0: /* stl */
-                                    gen_aa32_st32_iss(s, tmp, addr,
-                                                      get_mem_index(s),
-                                                      rm | ISSIsAcqRel);
-                                    break;
-                                case 2: /* stlb */
-                                    gen_aa32_st8_iss(s, tmp, addr,
-                                                     get_mem_index(s),
-                                                     rm | ISSIsAcqRel);
-                                    break;
-                                case 3: /* stlh */
-                                    gen_aa32_st16_iss(s, tmp, addr,
-                                                      get_mem_index(s),
-                                                      rm | ISSIsAcqRel);
-                                    break;
-                                default:
-                                    abort();
-                                }
-                                tcg_temp_free_i32(tmp);
-                            }
-                        } else if (is_ld) {
-                            switch (op1) {
-                            case 0: /* ldrex */
-                                gen_load_exclusive(s, rd, 15, addr, 2);
-                                break;
-                            case 1: /* ldrexd */
-                                gen_load_exclusive(s, rd, rd + 1, addr, 3);
-                                break;
-                            case 2: /* ldrexb */
-                                gen_load_exclusive(s, rd, 15, addr, 0);
-                                break;
-                            case 3: /* ldrexh */
-                                gen_load_exclusive(s, rd, 15, addr, 1);
-                                break;
-                            default:
-                                abort();
-                            }
-                        } else {
-                            rm = insn & 0xf;
-                            switch (op1) {
-                            case 0:  /*  strex */
-                                gen_store_exclusive(s, rd, rm, 15, addr, 2);
-                                break;
-                            case 1: /*  strexd */
-                                gen_store_exclusive(s, rd, rm, rm + 1, addr, 3);
-                                break;
-                            case 2: /*  strexb */
-                                gen_store_exclusive(s, rd, rm, 15, addr, 0);
-                                break;
-                            case 3: /* strexh */
-                                gen_store_exclusive(s, rd, rm, 15, addr, 1);
-                                break;
-                            default:
-                                abort();
-                            }
-                        }
-                        tcg_temp_free_i32(addr);
-
-                        if (is_lasr && is_ld) {
-                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-                        }
-                    } else if ((insn & 0x00300f00) == 0) {
-                        /* 0bcccc_0001_0x00_xxxx_xxxx_0000_1001_xxxx
-                        *  - SWP, SWPB
-                        */
-
-                        TCGv taddr;
-                        TCGMemOp opc = s->be_data;
-
-                        rm = (insn) & 0xf;
-
-                        if (insn & (1 << 22)) {
-                            opc |= MO_UB;
-                        } else {
-                            opc |= MO_UL | MO_ALIGN;
-                        }
-
-                        addr = load_reg(s, rn);
-                        taddr = gen_aa32_addr(s, addr, opc);
-                        tcg_temp_free_i32(addr);
-
-                        tmp = load_reg(s, rm);
-                        tcg_gen_atomic_xchg_i32(tmp, taddr, tmp,
-                                                get_mem_index(s), opc);
-                        tcg_temp_free(taddr);
-                        store_reg(s, rd, tmp);
-                    } else {
-                        goto illegal_op;
-                    }
-                }
-            } else {
-                /* Extra load/store (register) instructions */
-                /* All done in decodetree.  Reach here for illegal ops.  */
-                goto illegal_op;
-            }
+            /* All done in decodetree.  Reach here for illegal ops.  */
+            goto illegal_op;
             break;
         case 0x4:
         case 0x5:
@@ -9994,15 +10126,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     }
                     goto illegal_op;
                 }
-                addr = tcg_temp_local_new_i32();
-                load_reg_var(s, addr, rn);
-                tcg_gen_addi_i32(addr, addr, (insn & 0xff) << 2);
-                if (insn & (1 << 20)) {
-                    gen_load_exclusive(s, rs, 15, addr, 2);
-                } else {
-                    gen_store_exclusive(s, rd, rs, 15, addr, 2);
-                }
-                tcg_temp_free_i32(addr);
+                /* Load/store exclusive, in decodetree */
+                goto illegal_op;
             } else if ((insn & (7 << 5)) == 0) {
                 /* Table Branch.  */
                 if (rn == 15) {
@@ -10029,89 +10154,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tcg_gen_addi_i32(tmp, tmp, s->pc_read);
                 store_reg(s, 15, tmp);
             } else {
-                bool is_lasr = false;
-                bool is_ld = extract32(insn, 20, 1);
-                int op2 = (insn >> 6) & 0x3;
-                op = (insn >> 4) & 0x3;
-                switch (op2) {
-                case 0:
-                    goto illegal_op;
-                case 1:
-                    /* Load/store exclusive byte/halfword/doubleword */
-                    if (op == 2) {
-                        goto illegal_op;
-                    }
-                    ARCH(7);
-                    break;
-                case 2:
-                    /* Load-acquire/store-release */
-                    if (op == 3) {
-                        goto illegal_op;
-                    }
-                    /* Fall through */
-                case 3:
-                    /* Load-acquire/store-release exclusive */
-                    ARCH(8);
-                    is_lasr = true;
-                    break;
-                }
-
-                if (is_lasr && !is_ld) {
-                    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-                }
-
-                addr = tcg_temp_local_new_i32();
-                load_reg_var(s, addr, rn);
-                if (!(op2 & 1)) {
-                    if (is_ld) {
-                        tmp = tcg_temp_new_i32();
-                        switch (op) {
-                        case 0: /* ldab */
-                            gen_aa32_ld8u_iss(s, tmp, addr, get_mem_index(s),
-                                              rs | ISSIsAcqRel);
-                            break;
-                        case 1: /* ldah */
-                            gen_aa32_ld16u_iss(s, tmp, addr, get_mem_index(s),
-                                               rs | ISSIsAcqRel);
-                            break;
-                        case 2: /* lda */
-                            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s),
-                                               rs | ISSIsAcqRel);
-                            break;
-                        default:
-                            abort();
-                        }
-                        store_reg(s, rs, tmp);
-                    } else {
-                        tmp = load_reg(s, rs);
-                        switch (op) {
-                        case 0: /* stlb */
-                            gen_aa32_st8_iss(s, tmp, addr, get_mem_index(s),
-                                             rs | ISSIsAcqRel);
-                            break;
-                        case 1: /* stlh */
-                            gen_aa32_st16_iss(s, tmp, addr, get_mem_index(s),
-                                              rs | ISSIsAcqRel);
-                            break;
-                        case 2: /* stl */
-                            gen_aa32_st32_iss(s, tmp, addr, get_mem_index(s),
-                                              rs | ISSIsAcqRel);
-                            break;
-                        default:
-                            abort();
-                        }
-                        tcg_temp_free_i32(tmp);
-                    }
-                } else if (is_ld) {
-                    gen_load_exclusive(s, rs, rd, addr, op);
-                } else {
-                    gen_store_exclusive(s, rm, rs, rd, addr, op);
-                }
-                tcg_temp_free_i32(addr);
-
-                if (is_lasr && is_ld) {
-                    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-                }
+                /* Load/store exclusive, load-acq/store-rel, in decodetree */
+                goto illegal_op;
             }
         } else {
             /* Load/store multiple, RFE, SRS.  */
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 9789042ca0..1267cebaf4 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -39,6 +39,8 @@
 &mrs_bank        rd r sysm
 &ldst_rr         p w u rn rt rm shimm shtype
 &ldst_ri         p w u rn rt imm
+&strex           rn rd rt rt2 imm
+&ldrex           rn rt rt2 imm
 
 # Data-processing (register)
 
@@ -342,3 +344,49 @@ STRT_ri          .... 010. .0.0 .... .... ............        @ldst_ri12_p0w1
 STRBT_ri         .... 010. .1.0 .... .... ............        @ldst_ri12_p0w1
 LDRT_ri          .... 010. .0.1 .... .... ............        @ldst_ri12_p0w1
 LDRBT_ri         .... 010. .1.1 .... .... ............        @ldst_ri12_p0w1
+
+# Synchronization primitives
+
+@swp             ---- .... .... rn:4 rt:4 .... .... rt2:4
+
+SWP              .... 0001 0000 .... .... 0000 1001 ....      @swp
+SWPB             .... 0001 0100 .... .... 0000 1001 ....      @swp
+
+# Load/Store Exclusive and Load-Acquire/Store-Release
+#
+# Note rt2 for STREXD/LDREXD is set by the helper after checking rt is even.
+
+@strex           ---- .... .... rn:4 rd:4 .... .... rt:4 \
+                 &strex imm=0 rt2=15
+@ldrex           ---- .... .... rn:4 rt:4 .... .... .... \
+                 &ldrex imm=0 rt2=15
+@stl             ---- .... .... rn:4 .... .... .... rt:4 \
+                 &ldrex imm=0 rt2=15
+
+STREX            .... 0001 1000 .... .... 1111 1001 ....      @strex
+STREXD_a32       .... 0001 1010 .... .... 1111 1001 ....      @strex
+STREXB           .... 0001 1100 .... .... 1111 1001 ....      @strex
+STREXH           .... 0001 1110 .... .... 1111 1001 ....      @strex
+
+STLEX            .... 0001 1000 .... .... 1110 1001 ....      @strex
+STLEXD_a32       .... 0001 1010 .... .... 1110 1001 ....      @strex
+STLEXB           .... 0001 1100 .... .... 1110 1001 ....      @strex
+STLEXH           .... 0001 1110 .... .... 1110 1001 ....      @strex
+
+STL              .... 0001 1000 .... 1111 1100 1001 ....      @stl
+STLB             .... 0001 1100 .... 1111 1100 1001 ....      @stl
+STLH             .... 0001 1110 .... 1111 1100 1001 ....      @stl
+
+LDREX            .... 0001 1001 .... .... 1111 1001 1111      @ldrex
+LDREXD_a32       .... 0001 1011 .... .... 1111 1001 1111      @ldrex
+LDREXB           .... 0001 1101 .... .... 1111 1001 1111      @ldrex
+LDREXH           .... 0001 1111 .... .... 1111 1001 1111      @ldrex
+
+LDAEX            .... 0001 1001 .... .... 1110 1001 1111      @ldrex
+LDAEXD_a32       .... 0001 1011 .... .... 1110 1001 1111      @ldrex
+LDAEXB           .... 0001 1101 .... .... 1110 1001 1111      @ldrex
+LDAEXH           .... 0001 1111 .... .... 1110 1001 1111      @ldrex
+
+LDA              .... 0001 1001 .... .... 1100 1001 1111      @ldrex
+LDAB             .... 0001 1101 .... .... 1100 1001 1111      @ldrex
+LDAH             .... 0001 1111 .... .... 1100 1001 1111      @ldrex
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 0d379ed0d9..62bcf60d57 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -36,6 +36,8 @@
 &mrs_bank        !extern rd r sysm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
+&strex           !extern rn rd rt rt2 imm
+&ldrex           !extern rn rt rt2 imm
 
 # Data-processing (register-shifted register)
 
@@ -392,3 +394,47 @@ LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+
+# Load/Store Exclusive and Load-Acquire/Store-Release
+
+@strex_i         .... .... .... rn:4 rt:4 rd:4 .... .... \
+                 &strex rt2=15 imm=%imm8x4
+@strex_0         .... .... .... rn:4 rt:4 .... .... rd:4 \
+                 &strex rt2=15 imm=0
+@strex_d         .... .... .... rn:4 rt:4 rt2:4 .... rd:4 \
+                 &strex imm=0
+
+@ldrex_i         .... .... .... rn:4 rt:4 .... .... .... \
+                 &ldrex rt2=15 imm=%imm8x4
+@ldrex_0         .... .... .... rn:4 rt:4 .... .... .... \
+                 &ldrex rt2=15 imm=0
+@ldrex_d         .... .... .... rn:4 rt:4 rt2:4 .... .... \
+                 &ldrex imm=0
+
+STREX            1110 1000 0100 .... .... .... .... ....      @strex_i
+STREXB           1110 1000 1100 .... .... 1111 0100 ....      @strex_0
+STREXH           1110 1000 1100 .... .... 1111 0101 ....      @strex_0
+STREXD_t32       1110 1000 1100 .... .... .... 0111 ....      @strex_d
+
+STLEX            1110 1000 1100 .... .... 1111 1110 ....      @strex_0
+STLEXB           1110 1000 1100 .... .... 1111 1100 ....      @strex_0
+STLEXH           1110 1000 1100 .... .... 1111 1101 ....      @strex_0
+STLEXD_t32       1110 1000 1100 .... .... .... 1111 ....      @strex_d
+
+STL              1110 1000 1100 .... .... 1111 1010 1111      @ldrex_0
+STLB             1110 1000 1100 .... .... 1111 1000 1111      @ldrex_0
+STLH             1110 1000 1100 .... .... 1111 1001 1111      @ldrex_0
+
+LDREX            1110 1000 0101 .... .... 1111 .... ....      @ldrex_i
+LDREXB           1110 1000 1101 .... .... 1111 0100 1111      @ldrex_0
+LDREXH           1110 1000 1101 .... .... 1111 0101 1111      @ldrex_0
+LDREXD_t32       1110 1000 1101 .... .... .... 0111 1111      @ldrex_d
+
+LDAEX            1110 1000 1101 .... .... 1111 1110 1111      @ldrex_0
+LDAEXB           1110 1000 1101 .... .... 1111 1100 1111      @ldrex_0
+LDAEXH           1110 1000 1101 .... .... 1111 1101 1111      @ldrex_0
+LDAEXD_t32       1110 1000 1101 .... .... .... 1111 1111      @ldrex_d
+
+LDA              1110 1000 1101 .... .... 1111 1010 1111      @ldrex_0
+LDAB             1110 1000 1101 .... .... 1111 1000 1111      @ldrex_0
+LDAH             1110 1000 1101 .... .... 1111 1001 1111      @ldrex_0
-- 
2.17.1
