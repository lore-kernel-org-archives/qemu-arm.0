Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206777wrv;
        Fri, 26 Jul 2019 10:50:43 -0700 (PDT)
X-Received: by 2002:a17:902:b949:: with SMTP id h9mr90111911pls.120.1564163443112;
        Fri, 26 Jul 2019 10:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163443; cv=none;
        d=google.com; s=arc-20160816;
        b=zmECt1yFQC2iEXHaI1nkYTcoAzUmrEbgQrLmoCGR670eoLbpUxVz10jG5JlZ7BOZ+p
         nWMKNl8KkkzMFjUi66HqFhqKrGr8hHnDN/cj/+pUe5yToRsprooDtTfikdCJeoDpY5+8
         vFFzA8m6bAQn86sKeFQwjSoPaWnvcbJs8xi5bfx3TBqaofpjVgyckEq1U7+8BNJXu9+p
         Zf1u1ZWpqHJ+eaz7Q52iokEVrgwWvQvAeisPnKMcAQKgrqRkpWlt7nzFzIizu2GR5wuT
         WvzGAMwBmwcdcm54onixrlbPyy2HRJSVt/c9MdzVTX4LKkTagR77ClSXHU5nY6LKwpFe
         7Dtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Pnib07gWtNaIz4hXa+LeNfIkt6V2ivnRlJh4fSqlOtg=;
        b=LvOQ+JUCVTHQI85GksYhvQrLCaU5zVveose3aU0bPKCOItFlPeFSy2wjN9tzZsZJGm
         BI8MzXE5dr2jwXS25jYxCxyMgzmQfwEkSIQ2pq2BWzW2wiX4dY+gCvnDYLcON4R4sUnm
         KDGVOzyYVoMM2MRPunn0elBNQLhUlmG/s+yQ30gKr2f6wzAmw8NoXtVhQ+0jZdV7A20T
         lQO6zjHovkbPXP29tNOvdgM1wWwJrRyThd92PH6UBm8nKgyYQoFq0ajPCWReYKvuw+dP
         eKxIVTSzzOQFoF/JnQaDmz+F4qZHr6gXLw3uQT85ln/dPCOj5DeW1WnHQ6QTnJuYKnhI
         sRBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yymeXIZo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f7sor35109054pfb.22.2019.07.26.10.50.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yymeXIZo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Pnib07gWtNaIz4hXa+LeNfIkt6V2ivnRlJh4fSqlOtg=;
        b=yymeXIZoGGWSsCTrKP+HCYXDSwRBBeCIMq4Mz+1ZRSsqYYuYyAHFTqVM7/UZVqagaw
         cYLawWwjccTvUpZcE6D7P8sp/narzyhkCsCBk0HkNwN2Z5AbkhN0x9nXEar4B4rIt3M8
         iHhcyjrmB1NMA9nJDtLOE1K9EleEN+/nU9i+704l6d1+RPamG3rDiOQet3vsoR4aHneN
         z1K7IZmrGFG6v+CqRGp21XnFVdFW1LJSzQey7maUCB/3NRE3czaxTLFxaqeQkSeyuSYR
         R1+m6ZXKkZ+5jslzWSc9QlJYhraVgGKsMKgS73u/+QAyB+Br1dBsDobT5wRNSci6XbRn
         D2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Pnib07gWtNaIz4hXa+LeNfIkt6V2ivnRlJh4fSqlOtg=;
        b=bUIe0VCmYrtvy12rhAAtvAvGe/Dzs8TdoVrsXfCiex9x0EJfaMN9t6Sf9Gle/rbf60
         0YgeJoP1PCTu989F4tScWwHqys8KwWtLw0Q3EuweDNLsvm9vcWg3I82oFYtq6VVmGPbE
         sxL8drLz0zs6Vd4mjTyiwAmjfqAT+B8wktUsWEOgrq1dFKFsKaXVKuT2W3HoaUM6rpx6
         Pm5+ycwHtEFg+rZd2/w/s8dpuWItGq/yGqhK+c7zJ+u2sw4a3+0+/SrzPVZ7qKR7732C
         LXdNruuJ35CeLK7wPgqrTgkDWV5tLtFhMxjixXwogzU4TelNeRkRkpVHIOcK4Zali+jy
         rfFg==
X-Gm-Message-State: APjAAAUlovMtDhBrj84ENsHyQR49qfqFU7AR+vZUQyGWkV4UfPPQneB3
	qMx0ngSFgU3g3IzcZ7vsSn47XdI2
X-Google-Smtp-Source: APXvYqzMC68nScuPaEoaVr1EtKcqD6x1ie9iGYiOXBsgsqzssW35xct6u32wSWBnNkWgyeWwxTaRzA==
X-Received: by 2002:a62:2d3:: with SMTP id 202mr23838214pfc.131.1564163442663;
        Fri, 26 Jul 2019 10:50:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 07/67] target/arm: Introduce add_reg_for_lit
Date: Fri, 26 Jul 2019 10:49:32 -0700
Message-Id: <20190726175032.6769-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: /ePk7BeAeBf1

Used only on the thumb side so far, but will be more obvious
once we start unifying the implementation of A32+T32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c |  34 +------
 target/arm/translate.c         | 163 +++++++++++++++------------------
 2 files changed, 76 insertions(+), 121 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index e7389bc057..4066b2febf 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -941,14 +941,7 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
         offset = -offset;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
-    tcg_gen_addi_i32(addr, addr, offset);
+    addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
         gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
@@ -983,14 +976,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
         offset = -offset;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
-    tcg_gen_addi_i32(addr, addr, offset);
+    addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
         gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
@@ -1029,13 +1015,7 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
         return true;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
+    addr = add_reg_for_lit(s, a->rn, 0);
     if (a->p) {
         /* pre-decrement */
         tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
@@ -1112,13 +1092,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
         return true;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
+    addr = add_reg_for_lit(s, a->rn, 0);
     if (a->p) {
         /* pre-decrement */
         tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a48e9a90f8..5e2dd8bb16 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -214,6 +214,23 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
     return tmp;
 }
 
+/*
+ * Create a new temp, incremented by OFS, except PC is aligned but not
+ * incremented for thumb.  This is used for load/store for which use of
+ * PC implies (literal), or ADD that implies ADR.
+ */
+static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    if (reg == 15) {
+        tcg_gen_movi_i32(tmp, (s->pc_read & ~3) + ofs);
+    } else {
+        tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
+    }
+    return tmp;
+}
+
 /* Set a CPU register.  The source must be a temporary and will be
    marked as dead.  */
 static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
@@ -9468,16 +9485,12 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                  */
                 bool wback = extract32(insn, 21, 1);
 
-                if (rn == 15) {
-                    if (insn & (1 << 21)) {
-                        /* UNPREDICTABLE */
-                        goto illegal_op;
-                    }
-                    addr = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(addr, s->pc_read & ~3);
-                } else {
-                    addr = load_reg(s, rn);
+                if (rn == 15 && (insn & (1 << 21))) {
+                    /* UNPREDICTABLE */
+                    goto illegal_op;
                 }
+
+                addr = add_reg_for_lit(s, rn, 0);
                 offset = (insn & 0xff) * 4;
                 if ((insn & (1 << 23)) == 0) {
                     offset = -offset;
@@ -10683,27 +10696,15 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         store_reg(s, rd, tmp);
                     } else {
                         /* Add/sub 12-bit immediate.  */
-                        if (rn == 15) {
-                            offset = s->pc_read & ~(uint32_t)3;
-                            if (insn & (1 << 23))
-                                offset -= imm;
-                            else
-                                offset += imm;
-                            tmp = tcg_temp_new_i32();
-                            tcg_gen_movi_i32(tmp, offset);
-                            store_reg(s, rd, tmp);
+                        if (insn & (1 << 23)) {
+                            imm = -imm;
+                        }
+                        tmp = add_reg_for_lit(s, rn, imm);
+                        if (rn == 13 && rd == 13) {
+                            /* ADD SP, SP, imm or SUB SP, SP, imm */
+                            store_sp_checked(s, tmp);
                         } else {
-                            tmp = load_reg(s, rn);
-                            if (insn & (1 << 23))
-                                tcg_gen_subi_i32(tmp, tmp, imm);
-                            else
-                                tcg_gen_addi_i32(tmp, tmp, imm);
-                            if (rn == 13 && rd == 13) {
-                                /* ADD SP, SP, imm or SUB SP, SP, imm */
-                                store_sp_checked(s, tmp);
-                            } else {
-                                store_reg(s, rd, tmp);
-                            }
+                            store_reg(s, rd, tmp);
                         }
                     }
                 }
@@ -10817,60 +10818,51 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
         }
         memidx = get_mem_index(s);
-        if (rn == 15) {
-            addr = tcg_temp_new_i32();
-            /* PC relative.  */
-            imm = s->pc_read & 0xfffffffc;
-            if (insn & (1 << 23))
-                imm += insn & 0xfff;
-            else
-                imm -= insn & 0xfff;
-            tcg_gen_movi_i32(addr, imm);
+        imm = insn & 0xfff;
+        if (insn & (1 << 23)) {
+            /* PC relative or Positive offset.  */
+            addr = add_reg_for_lit(s, rn, imm);
+        } else if (rn == 15) {
+            /* PC relative with negative offset.  */
+            addr = add_reg_for_lit(s, rn, -imm);
         } else {
             addr = load_reg(s, rn);
-            if (insn & (1 << 23)) {
-                /* Positive offset.  */
-                imm = insn & 0xfff;
-                tcg_gen_addi_i32(addr, addr, imm);
-            } else {
-                imm = insn & 0xff;
-                switch ((insn >> 8) & 0xf) {
-                case 0x0: /* Shifted Register.  */
-                    shift = (insn >> 4) & 0xf;
-                    if (shift > 3) {
-                        tcg_temp_free_i32(addr);
-                        goto illegal_op;
-                    }
-                    tmp = load_reg(s, rm);
-                    if (shift)
-                        tcg_gen_shli_i32(tmp, tmp, shift);
-                    tcg_gen_add_i32(addr, addr, tmp);
-                    tcg_temp_free_i32(tmp);
-                    break;
-                case 0xc: /* Negative offset.  */
-                    tcg_gen_addi_i32(addr, addr, -imm);
-                    break;
-                case 0xe: /* User privilege.  */
-                    tcg_gen_addi_i32(addr, addr, imm);
-                    memidx = get_a32_user_mem_index(s);
-                    break;
-                case 0x9: /* Post-decrement.  */
-                    imm = -imm;
-                    /* Fall through.  */
-                case 0xb: /* Post-increment.  */
-                    postinc = 1;
-                    writeback = 1;
-                    break;
-                case 0xd: /* Pre-decrement.  */
-                    imm = -imm;
-                    /* Fall through.  */
-                case 0xf: /* Pre-increment.  */
-                    writeback = 1;
-                    break;
-                default:
+            imm = insn & 0xff;
+            switch ((insn >> 8) & 0xf) {
+            case 0x0: /* Shifted Register.  */
+                shift = (insn >> 4) & 0xf;
+                if (shift > 3) {
                     tcg_temp_free_i32(addr);
                     goto illegal_op;
                 }
+                tmp = load_reg(s, rm);
+                tcg_gen_shli_i32(tmp, tmp, shift);
+                tcg_gen_add_i32(addr, addr, tmp);
+                tcg_temp_free_i32(tmp);
+                break;
+            case 0xc: /* Negative offset.  */
+                tcg_gen_addi_i32(addr, addr, -imm);
+                break;
+            case 0xe: /* User privilege.  */
+                tcg_gen_addi_i32(addr, addr, imm);
+                memidx = get_a32_user_mem_index(s);
+                break;
+            case 0x9: /* Post-decrement.  */
+                imm = -imm;
+                /* Fall through.  */
+            case 0xb: /* Post-increment.  */
+                postinc = 1;
+                writeback = 1;
+                break;
+            case 0xd: /* Pre-decrement.  */
+                imm = -imm;
+                /* Fall through.  */
+            case 0xf: /* Pre-increment.  */
+                writeback = 1;
+                break;
+            default:
+                tcg_temp_free_i32(addr);
+                goto illegal_op;
             }
         }
 
@@ -11066,10 +11058,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         if (insn & (1 << 11)) {
             rd = (insn >> 8) & 7;
             /* load pc-relative.  Bit 1 of PC is ignored.  */
-            val = s->pc_read + ((insn & 0xff) * 4);
-            val &= ~(uint32_t)2;
-            addr = tcg_temp_new_i32();
-            tcg_gen_movi_i32(addr, val);
+            addr = add_reg_for_lit(s, 15, (insn & 0xff) * 4);
             tmp = tcg_temp_new_i32();
             gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s),
                                rd | ISSIs16Bit);
@@ -11447,16 +11436,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
          *  - Add PC/SP (immediate)
          */
         rd = (insn >> 8) & 7;
-        if (insn & (1 << 11)) {
-            /* SP */
-            tmp = load_reg(s, 13);
-        } else {
-            /* PC. bit 1 is ignored.  */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, s->pc_read & ~(uint32_t)2);
-        }
         val = (insn & 0xff) * 4;
-        tcg_gen_addi_i32(tmp, tmp, val);
+        tmp = add_reg_for_lit(s, insn & (1 << 11) ? 13 : 15, val);
         store_reg(s, rd, tmp);
         break;
 
-- 
2.17.1
