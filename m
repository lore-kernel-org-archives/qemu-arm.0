Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2649886lfb;
        Fri, 22 May 2020 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3MJcEzVYplrBGZ+9Q53uppvYMsxOB6+vR/PnCM5njqeFWTXEJ6XDD93syqGS7tTCXls1B
X-Received: by 2002:a0c:fc4e:: with SMTP id w14mr4091599qvp.147.1590159419887;
        Fri, 22 May 2020 07:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590159419; cv=none;
        d=google.com; s=arc-20160816;
        b=aE1qhbZcHEX1PXsjVG6NsK7gAGsO4P1qg6Nr7zy0K1yiwHE33+GP0khOTx886mR+tX
         xpnKcOPjoBc2Zylw+Uxv6i/5qQ7xeACwJP+DTSHqIU8D6CiLTj8J7aNEDBryDG15SCIX
         xyEoS0cyJ9283JbgpUdhQJwMVPJtmbodynmSmNom50qbLUxNiceN/TbCqBg1+7OK0KXG
         zn9Ws0iXEzajdGfqNssz1BOoIF+nUw6xjK7Gu99fs9exG88dm8XjQcydjb6KcYGe+B4Q
         PMwd14W/bbowfVO1ztahn1bS6vG5C4var0fAqodKnQU7U2wnlKP0gRShl5AejJoOYsOP
         aEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FoqQhIGM3HzHgFWnngxDVlaiVoPhQ6wjnnlrtKQGvR4=;
        b=Voa5jZwwpUBQ3v3lZxNYWZ7d3b1+wrOLnPdZ9Bo5LY7MyoiY1uV+DRdjmaEOShOJWF
         oVK3qb0g/3eLTU14wwkpb3BZYNBORFnnGv9F591pMGu9tZWcVjNueQ2BNkhEe/CPJAf/
         FK/AYc18FyjFXnpa7/36tfV08ydl1oidx1MMmV6pVCkEc4fORO4/HxguH2EzroIqhRHX
         6jLoQwMmjzJ7d8XfRsilpqMb8FEl2D5BZLhapiiTwzPQtd71D42alquufwt96TYkTeY1
         VVMmElXGfSLfYl98YLkUvRtR8conHrLvk0MHfiiCuYQqP2YInnvOksH6Jgsfs8v2Emcf
         tQcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHXvFu0a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si4895488qka.264.2020.05.22.07.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 07:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHXvFu0a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc96Z-0005Rr-Ag
	for alex.bennee@linaro.org; Fri, 22 May 2020 10:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc95D-0002Gm-2R
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:35 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc95C-0006U6-1v
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:55:34 -0400
Received: by mail-wr1-x443.google.com with SMTP id k13so10484173wrx.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoqQhIGM3HzHgFWnngxDVlaiVoPhQ6wjnnlrtKQGvR4=;
 b=ZHXvFu0amsNfQpEww09UipIe68TAoumZtDqP79Mt30Unqbez+ZS6JIiClhvQRlAJtw
 nbfNN36JugBh5gG7sw6C5UReV7OB/NxAJvtrFW+ZGlYFs9aeVg5MdXR2dmy53w08vFLX
 P7AWb8LbMS652t5YDGTJZeh2BrlS/NWwRGpDnaYDXDcpirGv3yitS4aBWkvNzIBdGkxs
 18+2zAhATqkwpNfbzh18lk/RzXsIq1YeKpxVHIzBJHSPdKrVLx0kLfoi7viSWoFYG382
 Tc48DnuDL9/087LPNGn/hV0AB1b0N+Y9Lg41is3AXsgToU9aA8k0pcpc/cYRJfw10kQA
 SpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoqQhIGM3HzHgFWnngxDVlaiVoPhQ6wjnnlrtKQGvR4=;
 b=FVN9lnTkvAGqlC2/j2DpTtjdiaL4a1fdxNOFNCKbWBSyTz2es//rVbw8p7ZK5pKVNr
 j3zQSeS+hqWZD8D2u3qfQXl0NiwvIveM/n864WYZFtFcJ3qyT5r+9W1oKDXnmQg/6iKS
 D694hGi3rOs4DVGOq98Ws4ScPp0vBo02aTsrNZmmpSUv9mxKypkgHmBUUJbs4Y2b9qR4
 hiJ/ZBR8MMPMkctayiRocxxElDFWA7miwcXkcqh53kHWgBUKMvZgI+cRGrUsmNdSAUzV
 kZDJMsUl0bunIZq4TkxKgnXkp9JCc/TGWzYCjlSvryHd3JkxRDWcC5UbMGsC0lPlcfcW
 jYCw==
X-Gm-Message-State: AOAM530FxJxW0g4ANL+lnWzYVlTQhSvRlJBpucUENE2TQHj3RtYY3Swh
 oXK2YP9Z2vp1ywSK8nYa5Tme8rDCeaIdvQ==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr2072583wru.117.1590159332270; 
 Fri, 22 May 2020 07:55:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y8sm1100561wmc.37.2020.05.22.07.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] target/arm: Convert VCVT fixed-point ops to decodetree
Date: Fri, 22 May 2020 15:55:19 +0100
Message-Id: <20200522145520.6778-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522145520.6778-1-peter.maydell@linaro.org>
References: <20200522145520.6778-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 25ptq9Ka6WMM

Convert the VCVT fixed-point conversion operations in the
Neon 2-regs-and-shift group to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       | 11 +++++
 target/arm/translate-neon.inc.c | 49 +++++++++++++++++++++
 target/arm/translate.c          | 75 +--------------------------------
 3 files changed, 62 insertions(+), 73 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 9dd13d13254..e217d51670d 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -249,6 +249,10 @@ VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
 @2reg_shll_b     .... ... . . . 001 shift:3  .... .... 0 . . . .... \
                  &2reg_shift vm=%vm_dp vd=%vd_dp size=0 q=0
 
+# We use size=0 for fp32 and size=1 for fp16 to match the 3-same encodings.
+@2reg_vcvt       .... ... . . . 1 ..... .... .... . q:1 . . .... \
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=0 shift=%neon_rshift_i5
+
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_d
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_s
 VSHR_S_2sh       1111 001 0 1 . ...... .... 0000 . . . 1 .... @2reg_shr_h
@@ -362,3 +366,10 @@ VSHLL_S_2sh      1111 001 0 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_b
 VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_s
 VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_h
 VSHLL_U_2sh      1111 001 1 1 . ...... .... 1010 . 0 . 1 .... @2reg_shll_b
+
+# VCVT fixed<->float conversions
+# TODO: FP16 fixed<->float conversions are opc==0b1100 and 0b1101
+VCVT_SF_2sh      1111 001 0 1 . ...... .... 1110 0 . . 1 .... @2reg_vcvt
+VCVT_UF_2sh      1111 001 1 1 . ...... .... 1110 0 . . 1 .... @2reg_vcvt
+VCVT_FS_2sh      1111 001 0 1 . ...... .... 1111 0 . . 1 .... @2reg_vcvt
+VCVT_FU_2sh      1111 001 1 1 . ...... .... 1111 0 . . 1 .... @2reg_vcvt
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 5678bfd0d4d..8d1c58eddc2 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1768,3 +1768,52 @@ static bool trans_VSHLL_U_2sh(DisasContext *s, arg_2reg_shift *a)
     };
     return do_vshll_2sh(s, a, widenfn[a->size], true);
 }
+
+static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
+                      NeonGenTwoSingleOPFn *fn)
+{
+    /* FP operations in 2-reg-and-shift group */
+    TCGv_i32 tmp, shiftv;
+    TCGv_ptr fpstatus;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpstatus = get_fpstatus_ptr(1);
+    shiftv = tcg_const_i32(a->shift);
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        tmp = neon_load_reg(a->vm, pass);
+        fn(tmp, tmp, shiftv, fpstatus);
+        neon_store_reg(a->vd, pass, tmp);
+    }
+    tcg_temp_free_ptr(fpstatus);
+    tcg_temp_free_i32(shiftv);
+    return true;
+}
+
+#define DO_FP_2SH(INSN, FUNC)                                           \
+    static bool trans_##INSN##_2sh(DisasContext *s, arg_2reg_shift *a)  \
+    {                                                                   \
+        return do_fp_2sh(s, a, FUNC);                                   \
+    }
+
+DO_FP_2SH(VCVT_SF, gen_helper_vfp_sltos)
+DO_FP_2SH(VCVT_UF, gen_helper_vfp_ultos)
+DO_FP_2SH(VCVT_FS, gen_helper_vfp_tosls_round_to_zero)
+DO_FP_2SH(VCVT_FU, gen_helper_vfp_touls_round_to_zero)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ef39c89f10a..9cc44e6258e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5193,7 +5193,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int q;
     int rd, rn, rm, rd_ofs, rn_ofs, rm_ofs;
     int size;
-    int shift;
     int pass;
     int u;
     int vec_size;
@@ -5234,78 +5233,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         return 1;
     } else if (insn & (1 << 4)) {
         if ((insn & 0x00380080) != 0) {
-            /* Two registers and shift.  */
-            op = (insn >> 8) & 0xf;
-
-            switch (op) {
-            case 0: /* VSHR */
-            case 1: /* VSRA */
-            case 2: /* VRSHR */
-            case 3: /* VRSRA */
-            case 4: /* VSRI */
-            case 5: /* VSHL, VSLI */
-            case 6: /* VQSHLU */
-            case 7: /* VQSHL */
-            case 8: /* VSHRN, VRSHRN, VQSHRUN, VQRSHRUN */
-            case 9: /* VQSHRN, VQRSHRN */
-            case 10: /* VSHLL, including VMOVL */
-                return 1; /* handled by decodetree */
-            default:
-                break;
-            }
-
-            if (insn & (1 << 7)) {
-                /* 64-bit shift. */
-                if (op > 7) {
-                    return 1;
-                }
-                size = 3;
-            } else {
-                size = 2;
-                while ((insn & (1 << (size + 19))) == 0)
-                    size--;
-            }
-            shift = (insn >> 16) & ((1 << (3 + size)) - 1);
-            if (op >= 14) {
-                /* VCVT fixed-point.  */
-                TCGv_ptr fpst;
-                TCGv_i32 shiftv;
-                VFPGenFixPointFn *fn;
-
-                if (!(insn & (1 << 21)) || (q && ((rd | rm) & 1))) {
-                    return 1;
-                }
-
-                if (!(op & 1)) {
-                    if (u) {
-                        fn = gen_helper_vfp_ultos;
-                    } else {
-                        fn = gen_helper_vfp_sltos;
-                    }
-                } else {
-                    if (u) {
-                        fn = gen_helper_vfp_touls_round_to_zero;
-                    } else {
-                        fn = gen_helper_vfp_tosls_round_to_zero;
-                    }
-                }
-
-                /* We have already masked out the must-be-1 top bit of imm6,
-                 * hence this 32-shift where the ARM ARM has 64-imm6.
-                 */
-                shift = 32 - shift;
-                fpst = get_fpstatus_ptr(1);
-                shiftv = tcg_const_i32(shift);
-                for (pass = 0; pass < (q ? 4 : 2); pass++) {
-                    TCGv_i32 tmpf = neon_load_reg(rm, pass);
-                    fn(tmpf, tmpf, shiftv, fpst);
-                    neon_store_reg(rd, pass, tmpf);
-                }
-                tcg_temp_free_ptr(fpst);
-                tcg_temp_free_i32(shiftv);
-            } else {
-                return 1;
-            }
+            /* Two registers and shift: handled by decodetree */
+            return 1;
         } else { /* (insn & 0x00380080) == 0 */
             int invert, reg_ofs, vec_size;
 
-- 
2.20.1

