Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4225607wrg;
        Tue, 11 Jun 2019 04:22:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyM+EaPegrBNBjubKsrMtyuRZeuwxLBBap31Ic9v6D3003MgdS+VWuAFMXofSvQyYgAzOhC
X-Received: by 2002:aed:21b1:: with SMTP id l46mr62879308qtc.281.1560252152378;
        Tue, 11 Jun 2019 04:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252152; cv=none;
        d=google.com; s=arc-20160816;
        b=X4Xna0fcQcdpVEzp7S8JtZdxxF5BmQVY0YJN74XuVL34Jou1cqMkyKnEUxIiYCjwhO
         nfbr8k9OjI2GZxUH6smNqWvCLgjSR78gTWuf+yUun5O0l+0aDWOnXt6bm6HYoiCYt1rN
         Lnnl48A01C/AOt/7V8JT34v5SmsNDkUvBpEMW4ce2P1Qum7UmFB6RwjaBKa+iLn4rNCy
         1GtE2M8a0FPoSy2j+nBvzSbCCXSB1SAWc7023Qg/gzuH0Vk8txEWwKkl1RyGh2uDC4hX
         uBBfVKQ2fDwI26iNiJyj1zoCVhos6HOK1F1JNS2wdx7dAX9lRQd0wMRkUFrlqtI9x41M
         itiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ofkFrPnbpYVeebJyYiTbSJ949rvcVU2W+f8AxYEMy4A=;
        b=YWpI/S4njEcvbUEzBvHaRslbMdTMN45MQ6lO0/iHWY9oJtYu5DDe7QCJlI56MiM80v
         QLd1F7lgb7ULwqZVP561e2WiouuhhvLr4ao2XqWCYFpyECBCGew/8BY9mjathqzDA3rY
         X0kjBOt67l39M1oIKK+cr1KOIdkUDYPP34cIUWD4tDOmA98kEGpmvLSdKz/fFyGUh8wN
         9C8e79I/aelEmiEjmgLGhO3aafbV89+X8obo7wLnvLBiGk16ahGuqMlrxy49/Z0rrgNT
         VZ6uR9efYfRT+QTd8tZKnW7oQErDa5+aw8Z8fpEdGPPj5rfY8yGxfsde1eh5pwsHfIWt
         yiuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kdGTT0PX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si2082415qvc.53.2019.06.11.04.22.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kdGTT0PX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haerH-00067w-P6
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39647)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQQ-0007dm-Cu
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQK-0007qk-NG
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:46 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50498)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007oL-Bu
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id c66so2437306wmf.0
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofkFrPnbpYVeebJyYiTbSJ949rvcVU2W+f8AxYEMy4A=;
 b=kdGTT0PXbPTBO3gtZMn09SAlzsZ9bKN6Hly6NMkY13XV8TzR+uc0BSazv1WtyQ88DG
 BNZCsaO8bqC2tiFEFgQS9eEvBysRvhYd8+fcVt6E+4jjz2WSpLODlDvwGlKhxOeaQfnw
 TmitRLeO+/0tfXZeCHoAWfmp0oIBaOIvi59FYqCuGvZqZAWJ/p+Z2vds30pXDPKMO16G
 Fq0b83/bPToFMdyY/m1MAWyp8ieWVkzjLxSkKNikDRagdzMFa3gH3sBTQsuLYsI/uQC7
 gd1eSha9OWKoMRxvcz2McDSYhs98D/eZFqLfW1/4zcRpaHJpE3USlggkJ0zpf/QwhSdy
 TPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofkFrPnbpYVeebJyYiTbSJ949rvcVU2W+f8AxYEMy4A=;
 b=SCraIKueFZ4KNnf6QMiwheAFd5wZlMZRJfGL/WiYDqosloTQJAYtZDbM9P3KSDbOvx
 L/+G88fqL8t+B/ss5Bcyt3czqtcjVC4Z5x5TbnrmubKGpXkgcf8aVyB5UT+oUv/uL+J/
 x7+gTL5rG7GuZaqQ2Ex36mzNU8EIVMtOh9GM5mun97NCz7/0u3vzMNgfOZz37PeNyyYN
 XV1Z/ndPj4ugUdKEg36dHlaFh8s3Z1GgK8Gx+cXMo+cV8+Qxsq75mOdTb8zrlP4ewis8
 e5XYeM67UjuLFMQjhBQeVe92A88Bu5ByCZ7evwJOrOgRVSO/GEHlfQPMQyFsbsF9dvD3
 J3tQ==
X-Gm-Message-State: APjAAAVP64RiXCl8Jxr7qC+ID2pgYGRILHPQCqqhkv5Um23hqQjuFOTs
 wg5+mksXU3pWzxtwNjiZ5jf1emGAJlpTag==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr18046649wmh.16.1560250477579; 
 Tue, 11 Jun 2019 03:54:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:50 +0100
Message-Id: <20190611105351.9871-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v2 41/42] target/arm: Convert float-to-integer
 VCVT insns to decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EXyv25R1X/CP

Convert the float-to-integer VCVT instructions to decodetree.
Since these are the last unconverted instructions, we can
delete the old decoder structure entirely now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c |  72 ++++++++++
 target/arm/translate.c         | 241 +--------------------------------
 target/arm/vfp.decode          |   6 +
 3 files changed, 80 insertions(+), 239 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index db07fdd8736..8216dba796e 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2578,3 +2578,75 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
     tcg_temp_free_ptr(fpst);
     return true;
 }
+
+static bool trans_VCVT_sp_int(DisasContext *s, arg_VCVT_sp_int *a)
+{
+    TCGv_i32 vm;
+    TCGv_ptr fpst;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(false);
+    vm = tcg_temp_new_i32();
+    neon_load_reg32(vm, a->vm);
+
+    if (a->s) {
+        if (a->rz) {
+            gen_helper_vfp_tosizs(vm, vm, fpst);
+        } else {
+            gen_helper_vfp_tosis(vm, vm, fpst);
+        }
+    } else {
+        if (a->rz) {
+            gen_helper_vfp_touizs(vm, vm, fpst);
+        } else {
+            gen_helper_vfp_touis(vm, vm, fpst);
+        }
+    }
+    neon_store_reg32(vm, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+static bool trans_VCVT_dp_int(DisasContext *s, arg_VCVT_dp_int *a)
+{
+    TCGv_i32 vd;
+    TCGv_i64 vm;
+    TCGv_ptr fpst;
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(false);
+    vm = tcg_temp_new_i64();
+    vd = tcg_temp_new_i32();
+    neon_load_reg64(vm, a->vm);
+
+    if (a->s) {
+        if (a->rz) {
+            gen_helper_vfp_tosizd(vd, vm, fpst);
+        } else {
+            gen_helper_vfp_tosid(vd, vm, fpst);
+        }
+    } else {
+        if (a->rz) {
+            gen_helper_vfp_touizd(vd, vm, fpst);
+        } else {
+            gen_helper_vfp_touid(vd, vm, fpst);
+        }
+    }
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i64(vm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6046bb32247..1e6b0fa769e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1418,9 +1418,7 @@ static inline void gen_vfp_##name(int dp, int neon) \
     tcg_temp_free_ptr(statusptr); \
 }
 
-VFP_GEN_FTOI(toui)
 VFP_GEN_FTOI(touiz)
-VFP_GEN_FTOI(tosi)
 VFP_GEN_FTOI(tosiz)
 #undef VFP_GEN_FTOI
 
@@ -1612,33 +1610,7 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
 }
 
 #define tcg_gen_ld_f32 tcg_gen_ld_i32
-#define tcg_gen_ld_f64 tcg_gen_ld_i64
 #define tcg_gen_st_f32 tcg_gen_st_i32
-#define tcg_gen_st_f64 tcg_gen_st_i64
-
-static inline void gen_mov_F0_vreg(int dp, int reg)
-{
-    if (dp)
-        tcg_gen_ld_f64(cpu_F0d, cpu_env, vfp_reg_offset(dp, reg));
-    else
-        tcg_gen_ld_f32(cpu_F0s, cpu_env, vfp_reg_offset(dp, reg));
-}
-
-static inline void gen_mov_F1_vreg(int dp, int reg)
-{
-    if (dp)
-        tcg_gen_ld_f64(cpu_F1d, cpu_env, vfp_reg_offset(dp, reg));
-    else
-        tcg_gen_ld_f32(cpu_F1s, cpu_env, vfp_reg_offset(dp, reg));
-}
-
-static inline void gen_mov_vreg_F0(int dp, int reg)
-{
-    if (dp)
-        tcg_gen_st_f64(cpu_F0d, cpu_env, vfp_reg_offset(dp, reg));
-    else
-        tcg_gen_st_f32(cpu_F0s, cpu_env, vfp_reg_offset(dp, reg));
-}
 
 #define ARM_CP_RW_BIT   (1 << 20)
 
@@ -2983,9 +2955,6 @@ static void gen_neon_dup_high16(TCGv_i32 var)
  */
 static int disas_vfp_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, op, delta_d, delta_m, bank_mask;
-    int dp, veclen;
-
     if (!arm_dc_feature(s, ARM_FEATURE_VFP)) {
         return 1;
     }
@@ -3005,214 +2974,8 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             return 0;
         }
     }
-
-    if (extract32(insn, 28, 4) == 0xf) {
-        /*
-         * Encodings with T=1 (Thumb) or unconditional (ARM): these
-         * were all handled by the decodetree decoder, so any insn
-         * patterns which get here must be UNDEF.
-         */
-        return 1;
-    }
-
-    /*
-     * FIXME: this access check should not take precedence over UNDEF
-     * for invalid encodings; we will generate incorrect syndrome information
-     * for attempts to execute invalid vfp/neon encodings with FP disabled.
-     */
-    if (!vfp_access_check(s)) {
-        return 0;
-    }
-
-    dp = ((insn & 0xf00) == 0xb00);
-    switch ((insn >> 24) & 0xf) {
-    case 0xe:
-        if (insn & (1 << 4)) {
-            /* already handled by decodetree */
-            return 1;
-        } else {
-            /* data processing */
-            bool rd_is_dp = dp;
-            bool rm_is_dp = dp;
-            bool no_output = false;
-
-            /* The opcode is in bits 23, 21, 20 and 6.  */
-            op = ((insn >> 20) & 8) | ((insn >> 19) & 6) | ((insn >> 6) & 1);
-            rn = VFP_SREG_N(insn);
-
-            switch (op) {
-            case 0 ... 14:
-                /* Already handled by decodetree */
-                return 1;
-            case 15:
-                switch (rn) {
-                case 0 ... 23:
-                case 28 ... 31:
-                    /* Already handled by decodetree */
-                    return 1;
-                default:
-                    break;
-                }
-            default:
-                break;
-            }
-
-            if (op == 15) {
-                /* rn is opcode, encoded as per VFP_SREG_N. */
-                switch (rn) {
-                case 0x18: /* vcvtr.u32.fxx */
-                case 0x19: /* vcvtz.u32.fxx */
-                case 0x1a: /* vcvtr.s32.fxx */
-                case 0x1b: /* vcvtz.s32.fxx */
-                    rd_is_dp = false;
-                    break;
-
-                default:
-                    return 1;
-                }
-            } else if (dp) {
-                /* rn is register number */
-                VFP_DREG_N(rn, insn);
-            }
-
-            if (rd_is_dp) {
-                VFP_DREG_D(rd, insn);
-            } else {
-                rd = VFP_SREG_D(insn);
-            }
-            if (rm_is_dp) {
-                VFP_DREG_M(rm, insn);
-            } else {
-                rm = VFP_SREG_M(insn);
-            }
-
-            veclen = s->vec_len;
-            if (op == 15 && rn > 3) {
-                veclen = 0;
-            }
-
-            /* Shut up compiler warnings.  */
-            delta_m = 0;
-            delta_d = 0;
-            bank_mask = 0;
-
-            if (veclen > 0) {
-                if (dp)
-                    bank_mask = 0xc;
-                else
-                    bank_mask = 0x18;
-
-                /* Figure out what type of vector operation this is.  */
-                if ((rd & bank_mask) == 0) {
-                    /* scalar */
-                    veclen = 0;
-                } else {
-                    if (dp)
-                        delta_d = (s->vec_stride >> 1) + 1;
-                    else
-                        delta_d = s->vec_stride + 1;
-
-                    if ((rm & bank_mask) == 0) {
-                        /* mixed scalar/vector */
-                        delta_m = 0;
-                    } else {
-                        /* vector */
-                        delta_m = delta_d;
-                    }
-                }
-            }
-
-            /* Load the initial operands.  */
-            if (op == 15) {
-                switch (rn) {
-                default:
-                    /* One source operand.  */
-                    gen_mov_F0_vreg(rm_is_dp, rm);
-                    break;
-                }
-            } else {
-                /* Two source operands.  */
-                gen_mov_F0_vreg(dp, rn);
-                gen_mov_F1_vreg(dp, rm);
-            }
-
-            for (;;) {
-                /* Perform the calculation.  */
-                switch (op) {
-                case 15: /* extension space */
-                    switch (rn) {
-                    case 24: /* ftoui */
-                        gen_vfp_toui(dp, 0);
-                        break;
-                    case 25: /* ftouiz */
-                        gen_vfp_touiz(dp, 0);
-                        break;
-                    case 26: /* ftosi */
-                        gen_vfp_tosi(dp, 0);
-                        break;
-                    case 27: /* ftosiz */
-                        gen_vfp_tosiz(dp, 0);
-                        break;
-                    default: /* undefined */
-                        g_assert_not_reached();
-                    }
-                    break;
-                default: /* undefined */
-                    return 1;
-                }
-
-                /* Write back the result, if any.  */
-                if (!no_output) {
-                    gen_mov_vreg_F0(rd_is_dp, rd);
-                }
-
-                /* break out of the loop if we have finished  */
-                if (veclen == 0) {
-                    break;
-                }
-
-                if (op == 15 && delta_m == 0) {
-                    /* single source one-many */
-                    while (veclen--) {
-                        rd = ((rd + delta_d) & (bank_mask - 1))
-                             | (rd & bank_mask);
-                        gen_mov_vreg_F0(dp, rd);
-                    }
-                    break;
-                }
-                /* Setup the next operands.  */
-                veclen--;
-                rd = ((rd + delta_d) & (bank_mask - 1))
-                     | (rd & bank_mask);
-
-                if (op == 15) {
-                    /* One source operand.  */
-                    rm = ((rm + delta_m) & (bank_mask - 1))
-                         | (rm & bank_mask);
-                    gen_mov_F0_vreg(dp, rm);
-                } else {
-                    /* Two source operands.  */
-                    rn = ((rn + delta_d) & (bank_mask - 1))
-                         | (rn & bank_mask);
-                    gen_mov_F0_vreg(dp, rn);
-                    if (delta_m) {
-                        rm = ((rm + delta_m) & (bank_mask - 1))
-                             | (rm & bank_mask);
-                        gen_mov_F1_vreg(dp, rm);
-                    }
-                }
-            }
-        }
-        break;
-    case 0xc:
-    case 0xd:
-        /* Already handled by decodetree */
-        return 1;
-    default:
-        /* Should never happen.  */
-        return 1;
-    }
-    return 0;
+    /* If the decodetree decoder didn't handle this insn, it must be UNDEF */
+    return 1;
 }
 
 static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index c3223a124ac..ea24365bb4c 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -234,3 +234,9 @@ VCVT_fix_sp  ---- 1110 1.11 1.1. .... 1010 .1.0 .... \
              vd=%vd_sp imm=%vm_sp opc=%vcvt_fix_op
 VCVT_fix_dp  ---- 1110 1.11 1.1. .... 1011 .1.0 .... \
              vd=%vd_dp imm=%vm_sp opc=%vcvt_fix_op
+
+# VCVT float to integer (VCVT and VCVTR): Vd always single; Vd depends on size
+VCVT_sp_int  ---- 1110 1.11 110 s:1 .... 1010 rz:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VCVT_dp_int  ---- 1110 1.11 110 s:1 .... 1011 rz:1 1.0 .... \
+             vd=%vd_sp vm=%vm_dp
-- 
2.20.1

