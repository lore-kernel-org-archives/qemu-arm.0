Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206976wrv;
        Fri, 26 Jul 2019 10:50:55 -0700 (PDT)
X-Received: by 2002:a63:4612:: with SMTP id t18mr83635801pga.85.1564163455365;
        Fri, 26 Jul 2019 10:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163455; cv=none;
        d=google.com; s=arc-20160816;
        b=RQrQE2T7PzaOeBmHGQEu15lv9kcGrKq8s6cBCFqUm6zXV8k6Vak2zQBmBB/LyIV5wE
         lNbieh6/hfChqXfhNM0hQzT4KkJXOgRzsCXni9pfxlny6unfCQLWwT2dQIep+HI566ni
         b2SZA6VB2kjTsl//6GzHNmjdl/aKGyTKqZU5aiYUc7yz9RLR0AMuMwlzvwsfVjUFi5kp
         9Gx1t7ltydoUNbIA73Uq5bTEtAuc/zz7aaMs2K+d+ubkByw9ReUP+xWHceLdFNcH+M90
         bPuNPD8pqEjGeReCcfAp/KWz2nl4WBGXrf6RxumWdBUOfgH5N3V5iCOBiu93PPMfb4DX
         dXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Ko4pYTSBEN/+JP+TS7Nhd6jgGRonS+CZaYZwT+yeEyg=;
        b=NGlA9AufGLUUZD5aqjLOyP3HNgatTGgUBOxwf9P8sEUjhr+r+jYTOQfCryBrYVCilx
         LQ7/VRY4L69boHuu2bzWXnLx5v9IH+m1EPMC2Er4PKhDJ7QvBIdhqYRf0MY8Ga9/DaDF
         zyVVJte5bwKe2rK3SdjgKAm/zgH8CZr5wg/xSxE1mQJJkOH8AK255xCzTIem71A6R8FG
         qlw8hLvhe3nEH899aAaDFTPr3+4wIkGXBtaIHUNn+GxP25ZjZPY2ety9Lj2AY3NbceH4
         bv1Xa7KlZSOhXhocn2Nc2Og+HxS6tsSOSmfvDaCuT1R0o38lOMSffwQp0MSMkcA4rjFP
         BxYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SG6P8pI8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o6sor32669486pgp.76.2019.07.26.10.50.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SG6P8pI8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ko4pYTSBEN/+JP+TS7Nhd6jgGRonS+CZaYZwT+yeEyg=;
        b=SG6P8pI8qkJAEgA7PTPQrZHh/YV0zDxbwIhBxnbXnakas53rMcPWnIo2TZKRf3EPKM
         RaP0nIfYs2firqBy8Nr8pxwntotEVYidfrH+W5g7i3eg+gPiwzpzT4fuHaStKxuquVbi
         PpvV6E1JJj9lVdMbyQgZc7TZJIjf3AtdKxjlJ9yuozJFFv9+WeWgDTCbY6KFWCNdxaON
         w/1V/4hOEGHBupFyETJGyeA0sGA9KQGM6e4NLxgVNygjt4NcPRIbrUv5+V8UhIF4DhTI
         qQ69GYNWA/0sCncSBbKQw+fNieabe3fReIHclfVqFFCKUdYuax1Q9OyVmdOtVjklkKar
         KRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ko4pYTSBEN/+JP+TS7Nhd6jgGRonS+CZaYZwT+yeEyg=;
        b=AJd8Cag+h5qI6uF1yD8zzC4CU0/13EqyFA1U052WXYrKfQD7WdpT59Wgh0vXAYEQRY
         bN7b5h5RKg//6IgGdTEhnix65GCy51mraWL5WtttSO8c+Zow2LdYDNucKE8uAvlFVfh0
         AjQmW6W9wu36Cui4+j665o7NzlYs9bry+tletfqtGd2UjkqhtZqqhrEyDAlJHRqoWz2X
         jrgMlxcvBW499qtYNzumDqU+5qWJEAcGWFE5Evz1cFfCTWA7Waqf40ddkNmLwquxnnDt
         DRnXVP8xMFkDp9qSeMnBNUHg9Z9dEeO7566hg6YB3t1uVD5sDQKP1CbPJyNyKrCYAeXi
         9qyw==
X-Gm-Message-State: APjAAAVCLbfP6m76xpBVwrDmUlLclQRS/Q0HVqibdqQoOclK/XvdtYsp
	pFvS+sXMfaRBtQBt6z9Bb/HIw8U+
X-Google-Smtp-Source: APXvYqz5UrlbhbO4rJtCAg8yQ4nD4k2tky8+5u5/uudZomYs0v7EbRHXZLB+AEx0EB0UxqMyMELmQg==
X-Received: by 2002:a63:5402:: with SMTP id i2mr65383463pgb.414.1564163454738;
        Fri, 26 Jul 2019 10:50:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 18/67] target/arm: Convert MRS/MSR (banked, register)
Date: Fri, 26 Jul 2019 10:49:43 -0700
Message-Id: <20190726175032.6769-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: CQQdHfDmNdJu

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 226 ++++++++++++++++++-----------------------
 target/arm/a32.decode  |  14 +++
 target/arm/t32.decode  |  40 ++++++--
 3 files changed, 142 insertions(+), 138 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 36c815caf3..fa0c048b38 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8362,6 +8362,93 @@ static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
     return true;
 }
 
+/*
+ * Miscellaneous instructions
+ */
+
+static bool trans_MRS_bank(DisasContext *s, arg_MRS_bank *a)
+{
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    gen_mrs_banked(s, a->r, a->sysm, a->rd);
+    return true;
+}
+
+static bool trans_MSR_bank(DisasContext *s, arg_MSR_bank *a)
+{
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    gen_msr_banked(s, a->r, a->sysm, a->rn);
+    return true;
+}
+
+static bool trans_MRS_reg(DisasContext *s, arg_MRS_reg *a)
+{
+    TCGv_i32 tmp;
+
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    if (a->r) {
+        if (IS_USER(s)) {
+            gen_illegal_op(s);
+            return true;
+        }
+        tmp = load_cpu_field(spsr);
+    } else {
+        tmp = tcg_temp_new_i32();
+        gen_helper_cpsr_read(tmp, cpu_env);
+    }
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
+static bool trans_MSR_reg(DisasContext *s, arg_MSR_reg *a)
+{
+    TCGv_i32 tmp;
+    uint32_t mask = msr_mask(s, a->mask, a->r);
+
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    tmp = load_reg(s, a->rn);
+    if (gen_set_psr(s, mask, a->r, tmp)) {
+        gen_illegal_op(s);
+    }
+    return true;
+}
+
+static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
+{
+    TCGv_i32 tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    tmp = tcg_const_i32(a->sysm);
+    gen_helper_v7m_mrs(tmp, cpu_env, tmp);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
+static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
+{
+    TCGv_i32 addr, reg;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    addr = tcg_const_i32((a->mask << 10) | a->sysm);
+    reg = load_reg(s, a->rn);
+    gen_helper_v7m_msr(cpu_env, addr, reg);
+    tcg_temp_free_i32(addr);
+    tcg_temp_free_i32(reg);
+    gen_lookup_tb(s);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8643,46 +8730,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         sh = (insn >> 4) & 0xf;
         rm = insn & 0xf;
         switch (sh) {
-        case 0x0: /* MSR, MRS */
-            if (insn & (1 << 9)) {
-                /* MSR (banked) and MRS (banked) */
-                int sysm = extract32(insn, 16, 4) |
-                    (extract32(insn, 8, 1) << 4);
-                int r = extract32(insn, 22, 1);
-
-                if (op1 & 1) {
-                    /* MSR (banked) */
-                    gen_msr_banked(s, r, sysm, rm);
-                } else {
-                    /* MRS (banked) */
-                    int rd = extract32(insn, 12, 4);
-
-                    gen_mrs_banked(s, r, sysm, rd);
-                }
-                break;
-            }
-
-            /* MSR, MRS (for PSRs) */
-            if (op1 & 1) {
-                /* PSR = reg */
-                tmp = load_reg(s, rm);
-                i = ((op1 & 2) != 0);
-                if (gen_set_psr(s, msr_mask(s, (insn >> 16) & 0xf, i), i, tmp))
-                    goto illegal_op;
-            } else {
-                /* reg = PSR */
-                rd = (insn >> 12) & 0xf;
-                if (op1 & 2) {
-                    if (IS_USER(s))
-                        goto illegal_op;
-                    tmp = load_cpu_field(spsr);
-                } else {
-                    tmp = tcg_temp_new_i32();
-                    gen_helper_cpsr_read(tmp, cpu_env);
-                }
-                store_reg(s, rd, tmp);
-            }
-            break;
+        case 0x0:
+            /* MSR/MRS (banked/register) */
+            /* All done in decodetree.  Illegal ops already signalled.  */
+            g_assert_not_reached();
         case 0x1:
             if (op1 == 1) {
                 /* branch/exchange thumb (bx).  */
@@ -10559,40 +10610,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 } else {
                     op = (insn >> 20) & 7;
                     switch (op) {
-                    case 0: /* msr cpsr.  */
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            tmp = load_reg(s, rn);
-                            /* the constant is the mask and SYSm fields */
-                            addr = tcg_const_i32(insn & 0xfff);
-                            gen_helper_v7m_msr(cpu_env, addr, tmp);
-                            tcg_temp_free_i32(addr);
-                            tcg_temp_free_i32(tmp);
-                            gen_lookup_tb(s);
-                            break;
-                        }
-                        /* fall through */
-                    case 1: /* msr spsr.  */
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-
-                        if (extract32(insn, 5, 1)) {
-                            /* MSR (banked) */
-                            int sysm = extract32(insn, 8, 4) |
-                                (extract32(insn, 4, 1) << 4);
-                            int r = op & 1;
-
-                            gen_msr_banked(s, r, sysm, rm);
-                            break;
-                        }
-
-                        /* MSR (for PSRs) */
-                        tmp = load_reg(s, rn);
-                        if (gen_set_psr(s,
-                              msr_mask(s, (insn >> 8) & 0xf, op == 1),
-                              op == 1, tmp))
-                            goto illegal_op;
-                        break;
+                    case 0: /* msr cpsr, in decodetree  */
+                    case 1: /* msr spsr, in decodetree  */
+                        goto illegal_op;
                     case 2: /* cps, nop-hint.  */
                         /* nop hints in decodetree */
                         /* Implemented as NOP in user mode.  */
@@ -10684,61 +10704,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         }
                         gen_exception_return(s, tmp);
                         break;
-                    case 6: /* MRS */
-                        if (extract32(insn, 5, 1) &&
-                            !arm_dc_feature(s, ARM_FEATURE_M)) {
-                            /* MRS (banked) */
-                            int sysm = extract32(insn, 16, 4) |
-                                (extract32(insn, 4, 1) << 4);
-
-                            gen_mrs_banked(s, 0, sysm, rd);
-                            break;
-                        }
-
-                        if (extract32(insn, 16, 4) != 0xf) {
-                            goto illegal_op;
-                        }
-                        if (!arm_dc_feature(s, ARM_FEATURE_M) &&
-                            extract32(insn, 0, 8) != 0) {
-                            goto illegal_op;
-                        }
-
-                        /* mrs cpsr */
-                        tmp = tcg_temp_new_i32();
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            addr = tcg_const_i32(insn & 0xff);
-                            gen_helper_v7m_mrs(tmp, cpu_env, addr);
-                            tcg_temp_free_i32(addr);
-                        } else {
-                            gen_helper_cpsr_read(tmp, cpu_env);
-                        }
-                        store_reg(s, rd, tmp);
-                        break;
-                    case 7: /* MRS */
-                        if (extract32(insn, 5, 1) &&
-                            !arm_dc_feature(s, ARM_FEATURE_M)) {
-                            /* MRS (banked) */
-                            int sysm = extract32(insn, 16, 4) |
-                                (extract32(insn, 4, 1) << 4);
-
-                            gen_mrs_banked(s, 1, sysm, rd);
-                            break;
-                        }
-
-                        /* mrs spsr.  */
-                        /* Not accessible in user mode.  */
-                        if (IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-
-                        if (extract32(insn, 16, 4) != 0xf ||
-                            extract32(insn, 0, 8) != 0) {
-                            goto illegal_op;
-                        }
-
-                        tmp = load_cpu_field(spsr);
-                        store_reg(s, rd, tmp);
-                        break;
+                    case 6: /* MRS, in decodetree */
+                    case 7: /* MSR, in decodetree */
+                        goto illegal_op;
                     }
                 }
             } else {
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 4cefba6f0e..50449fa8ec 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -29,6 +29,10 @@
 &s_rrrr          s rd rn rm ra
 &rrrr            rd rn rm ra
 &rrr             rd rn rm
+&msr_reg         rn r mask
+&mrs_reg         rd r
+&msr_bank        rn r sysm
+&mrs_bank        rd r sysm
 
 # Data-processing (register)
 
@@ -177,3 +181,13 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
   MSR_imm        .... 0011 0010 .... 1111 .... .... ....      @msr_i r=0
 }
 MSR_imm          .... 0011 0110 .... 1111 .... .... ....      @msr_i r=1
+
+# Miscellaneous instructions
+
+%sysm            8:1 16:4
+
+MRS_bank         ---- 0001 0 r:1 00 .... rd:4 001. 0000 0000  &mrs_bank %sysm
+MSR_bank         ---- 0001 0 r:1 10 .... 1111 001. 0000 rn:4  &msr_bank %sysm
+
+MRS_reg          ---- 0001 0 r:1 00 1111   rd:4 0000 0000 0000  &mrs_reg
+MSR_reg          ---- 0001 0 r:1 10 mask:4 1111 0000 0000 rn:4  &msr_reg
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index b4f0a9632d..40a2c520c1 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -26,6 +26,10 @@
 &s_rrrr          !extern s rd rn rm ra
 &rrrr            !extern rd rn rm ra
 &rrr             !extern rd rn rm
+&msr_reg         !extern rn r mask
+&mrs_reg         !extern rd r
+&msr_bank        !extern rn r sysm
+&mrs_bank        !extern rd r sysm
 
 # Data-processing (register-shifted register)
 
@@ -170,16 +174,34 @@ QDSUB            1111 1010 1000 .... 1111 .... 1011 ....      @rndm
 
 # Branches and miscellaneous control
 
+%msr_sysm        4:1 8:4
+%mrs_sysm        4:1 16:4
+
 {
-  YIELD          1111 0011 1010 1111 1000 0000 0000 0001
-  WFE            1111 0011 1010 1111 1000 0000 0000 0010
-  WFI            1111 0011 1010 1111 1000 0000 0000 0011
+  {
+    YIELD        1111 0011 1010 1111 1000 0000 0000 0001
+    WFE          1111 0011 1010 1111 1000 0000 0000 0010
+    WFI          1111 0011 1010 1111 1000 0000 0000 0011
 
-  # TODO: Implement SEV, SEVL; may help SMP performance.
-  # SEV          1111 0011 1010 1111 1000 0000 0000 0100
-  # SEVL         1111 0011 1010 1111 1000 0000 0000 0101
+    # TODO: Implement SEV, SEVL; may help SMP performance.
+    # SEV        1111 0011 1010 1111 1000 0000 0000 0100
+    # SEVL       1111 0011 1010 1111 1000 0000 0000 0101
 
-  # The canonical nop ends in 0000 0000, but the whole rest
-  # of the space is "reserved hint, behaves as nop".
-  NOP            1111 0011 1010 1111 1000 0000 ---- ----
+    # The canonical nop ends in 0000 0000, but the whole rest
+    # of the space is "reserved hint, behaves as nop".
+    NOP          1111 0011 1010 1111 1000 0000 ---- ----
+  }
+  # Note that the v7m insn overlaps both the normal and banked insn.
+  {
+    MRS_bank     1111 0011 111 r:1 .... 1000 rd:4   001. 0000  \
+                 &mrs_bank sysm=%mrs_sysm
+    MRS_reg      1111 0011 111 r:1 1111 1000 rd:4   0000 0000  &mrs_reg
+    MRS_v7m      1111 0011 111 0   1111 1000 rd:4   sysm:8
+  }
+  {
+    MSR_bank     1111 0011 100 r:1 rn:4 1000 ....   001. 0000  \
+                 &msr_bank sysm=%msr_sysm
+    MSR_reg      1111 0011 100 r:1 rn:4 1000 mask:4 0000 0000  &msr_reg
+    MSR_v7m      1111 0011 100 0   rn:4 1000 mask:2 00 sysm:8
+  }
 }
-- 
2.17.1
