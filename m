Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4196695njb;
        Wed, 11 Dec 2024 08:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZW9dXhcbDe/LV8G3qFnwyBk2atm9B5n85ab/InJvHhm0QEpbdl7DtBGhwEc7LdFVBVLLyqZmb6YEkhA==@linaro.org
X-Google-Smtp-Source: AGHT+IH8mlep7Fuv1iQiX9eYkglyWPyoyOlwiDnece+EDX0fnHpvJObZLEBfWrPY4k2qv9grY2Lj
X-Received: by 2002:a05:620a:4050:b0:7b6:6d5a:d51b with SMTP id af79cd13be357-7b6eb53b012mr480745385a.52.1733935333833;
        Wed, 11 Dec 2024 08:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935333; cv=none;
        d=google.com; s=arc-20240605;
        b=jE3Ar7DgecWf1egvULMLEAf6+UXOvp4P8ZZqnEu8SSXEC+DKCJDMy5+bYHwN1KRFwq
         1rbgPCCTy+Kb4xJROIFwpWQ1SAJ4XMw3bBCpJ3Cbw9xFRLju3+hHpWJ9imiSh6pNnLkF
         +EmJR3PDW4Fi+1vS6zm2h1GonqdfLlE8XChOsjnSHPJcQ+dMMcYjDb1GX7c4nr+Z/fLE
         GWUhxClQ/zRzhoi05dBSaZy1Xd4/wUlUpGcYvK1MLU6ZOwdqi6gCmskKCkXrxKBTLUiA
         Aiga5Fi1gI+lVnfIaDNF1t+6WymuyqUuivZgOZkjUf6TLdeOSEwLxQr/wSMMEjSsw77H
         GC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mRVN7Jp6kM6bWbbl7YqCIU2ZfmJptSK2PrHsw0aXels=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=T/JKSFJWqyC2TGo60FULts4QXjpeee1LKP5XYAjgIWr7YbgAG9WU5GuHeOsYyIFKe2
         JlX4RrpDA8le4hqrgIxn22brdcXKT8ikv6SxMI5C3h5g8cUwmK+jkZkn4BRQUiD7Ejlv
         fyovKLQfzIrjWUC27Qmu/gv4HXzBmSDKILEEMJMy6Aevmt436oRMuwqG8wXuYbDYbyBZ
         AqQhxW2Yba+iW2fcAj+uuik1wceR7dipTNBTaWlSdl/LurqbCICiG5DmfTiQpUvSK2I7
         JW6E+DXp+Bc3CAdudtgf1pMMHP30S2zbDb5npOvVKucDNislH4BbAF5IYltGMY6MuG9g
         IL5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Blp15WTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6e9c40ea7si298191885a.130.2024.12.11.08.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:42:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Blp15WTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPhE-0007I4-Bs; Wed, 11 Dec 2024 11:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgp-00061w-FF
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:35:55 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgl-00023h-JP
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:35:55 -0500
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6d8f99cb0d9so36190456d6.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934950; x=1734539750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mRVN7Jp6kM6bWbbl7YqCIU2ZfmJptSK2PrHsw0aXels=;
 b=Blp15WTKc8/8Zip3RBLmzpfzTum8NAqUZEF5HpCM+gp7FEJnV7vPXntSSjOQQT8PPX
 9gRl7bFb31nam0tfL/U9O5UNPnUMonL9w6AdsM5Y6gpJPAWffgv2vpV6UYCCqcUD8ehi
 qXKF81FrXxGL41f5foTrNVb8ET1+VMyjebjzNUd9opJNn81SuBz4a+QoSjmoyJ93AIl0
 /U6RSPladWYPFJLl7z7eugJE8kAmmynUk8dxGEro7vrVzdzk+Hed92osqgikLR1Rir4X
 e3J/XiRMqExYqnE7vK2JpxWrtyok0fENF3RJ0GKNGCqx8oXywS5Zk/DJP2Tl9uhn1d9l
 GhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934950; x=1734539750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mRVN7Jp6kM6bWbbl7YqCIU2ZfmJptSK2PrHsw0aXels=;
 b=NCTU+36ne7VBuo+zM/rxHdBGM7IIqgK4zPL7KjxBzgCavaBX/KahoE+pyYmnVHZY1l
 jFk19Al87iU7CFbIZukuKR9fHmK1ucf7i+htyP45RgvuTapHcNcxARBBCxfz2DvfkKYg
 fSKzoSuprSWTtSsi84lSvqY3K7U+o5PeU2kg59CDou2vciISJj1UH7PkS790VOQDuwWw
 rXQ/BI3Z0PozqVaxQZNig8pV3c9M6Okr6b8FHC2ZWLK66vK3GdY7R3aTGowFFdDcyv4s
 JR8qX75DWCCtNVbeF80Y/T3pSgpezBktuVYtmMsaRpklIAG+TDXmy3AWhAoyNv1Nrb1y
 JV/Q==
X-Gm-Message-State: AOJu0Yy1YYnKepwI7dnUO9Xd40hES4V4FVqglzO1djK4F1nwoizSRRtA
 VBaNePSfrr7bztDIBhl2Cti47hpQOxHfV7N7hdG1FP6zLfFLdiTgCHofuIMwRjM=
X-Gm-Gg: ASbGncvZnKghJtFf+Ri1UNFMkTcmCyLmxwr5qZB0Z7DyavRL+1bhHgaajd9uszSopaT
 Dkf/VH4AA7KGXrHyr2nfNAg1ShSrKM6ymuRX5EjY6+4qr+qltdg3n8t5JUHktATQ5/C0MaW7OuI
 jBccvuhVBfajQhd1KhDlVrVOaw1oRl94ubr3jeqpeMWbobgmuOsO2J+Ui9kbqIrU/cigUt/F3PN
 LVIy/hD9+w16D6Pa2LihpxbICVlABeDCpKNcrYLeQQo89F/oC5MiGYfgl09fg==
X-Received: by 2002:a05:6214:2aad:b0:6d8:8a8f:75b0 with SMTP id
 6a1803df08f44-6d934aee40emr59078736d6.14.1733934950677; 
 Wed, 11 Dec 2024 08:35:50 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:35:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 46/69] target/arm: Convert handle_2misc_pairwise to
 decodetree
Date: Wed, 11 Dec 2024 10:30:13 -0600
Message-ID: <20241211163036.2297116-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DDhnw9FWzcVI

This includes SADDLP, UADDLP, SADALP, UADALP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.h    |  2 -
 target/arm/tcg/helper-a64.c    | 18 --------
 target/arm/tcg/translate-a64.c | 84 +++-------------------------------
 target/arm/tcg/a64.decode      |  5 ++
 4 files changed, 11 insertions(+), 98 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index f811bb85dc..ac7ca190fa 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -41,8 +41,6 @@ DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
 DEF_HELPER_FLAGS_3(rsqrtsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
-DEF_HELPER_FLAGS_1(neon_addlp_u8, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_FLAGS_1(neon_addlp_u16, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_2(frecpx_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
 DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 9b3c407be3..3de564e0fe 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -306,24 +306,6 @@ float64 HELPER(rsqrtsf_f64)(float64 a, float64 b, void *fpstp)
     return float64_muladd(a, b, float64_three, float_muladd_halve_result, fpst);
 }
 
-uint64_t HELPER(neon_addlp_u8)(uint64_t a)
-{
-    uint64_t tmp;
-
-    tmp = a & 0x00ff00ff00ff00ffULL;
-    tmp += (a >> 8) & 0x00ff00ff00ff00ffULL;
-    return tmp;
-}
-
-uint64_t HELPER(neon_addlp_u16)(uint64_t a)
-{
-    uint64_t tmp;
-
-    tmp = a & 0x0000ffff0000ffffULL;
-    tmp += (a >> 16) & 0x0000ffff0000ffffULL;
-    return tmp;
-}
-
 /* Floating-point reciprocal exponent - see FPRecpX in ARM ARM */
 uint32_t HELPER(frecpx_f16)(uint32_t a, void *fpstp)
 {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f57b5e2855..717d30dd5b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8956,6 +8956,10 @@ static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 TRANS(CLS_v, do_gvec_fn2_bhs, a, gen_gvec_cls)
 TRANS(CLZ_v, do_gvec_fn2_bhs, a, gen_gvec_clz)
 TRANS(REV64_v, do_gvec_fn2_bhs, a, gen_gvec_rev64)
+TRANS(SADDLP_v, do_gvec_fn2_bhs, a, gen_gvec_saddlp)
+TRANS(UADDLP_v, do_gvec_fn2_bhs, a, gen_gvec_uaddlp)
+TRANS(SADALP_v, do_gvec_fn2_bhs, a, gen_gvec_sadalp)
+TRANS(UADALP_v, do_gvec_fn2_bhs, a, gen_gvec_uadalp)
 
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
@@ -9885,73 +9889,6 @@ static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
     }
 }
 
-static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
-                                  bool is_q, int size, int rn, int rd)
-{
-    /* Implement the pairwise operations from 2-misc:
-     * SADDLP, UADDLP, SADALP, UADALP.
-     * These all add pairs of elements in the input to produce a
-     * double-width result element in the output (possibly accumulating).
-     */
-    bool accum = (opcode == 0x6);
-    int maxpass = is_q ? 2 : 1;
-    int pass;
-    TCGv_i64 tcg_res[2];
-
-    if (size == 2) {
-        /* 32 + 32 -> 64 op */
-        MemOp memop = size + (u ? 0 : MO_SIGN);
-
-        for (pass = 0; pass < maxpass; pass++) {
-            TCGv_i64 tcg_op1 = tcg_temp_new_i64();
-            TCGv_i64 tcg_op2 = tcg_temp_new_i64();
-
-            tcg_res[pass] = tcg_temp_new_i64();
-
-            read_vec_element(s, tcg_op1, rn, pass * 2, memop);
-            read_vec_element(s, tcg_op2, rn, pass * 2 + 1, memop);
-            tcg_gen_add_i64(tcg_res[pass], tcg_op1, tcg_op2);
-            if (accum) {
-                read_vec_element(s, tcg_op1, rd, pass, MO_64);
-                tcg_gen_add_i64(tcg_res[pass], tcg_res[pass], tcg_op1);
-            }
-        }
-    } else {
-        for (pass = 0; pass < maxpass; pass++) {
-            TCGv_i64 tcg_op = tcg_temp_new_i64();
-            NeonGenOne64OpFn *genfn;
-            static NeonGenOne64OpFn * const fns[2][2] = {
-                { gen_helper_neon_addlp_s8,  gen_helper_neon_addlp_u8 },
-                { gen_helper_neon_addlp_s16,  gen_helper_neon_addlp_u16 },
-            };
-
-            genfn = fns[size][u];
-
-            tcg_res[pass] = tcg_temp_new_i64();
-
-            read_vec_element(s, tcg_op, rn, pass, MO_64);
-            genfn(tcg_res[pass], tcg_op);
-
-            if (accum) {
-                read_vec_element(s, tcg_op, rd, pass, MO_64);
-                if (size == 0) {
-                    gen_helper_neon_addl_u16(tcg_res[pass],
-                                             tcg_res[pass], tcg_op);
-                } else {
-                    gen_helper_neon_addl_u32(tcg_res[pass],
-                                             tcg_res[pass], tcg_op);
-                }
-            }
-        }
-    }
-    if (!is_q) {
-        tcg_res[1] = tcg_constant_i64(0);
-    }
-    for (pass = 0; pass < 2; pass++) {
-        write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-    }
-}
-
 static void handle_shll(DisasContext *s, bool is_q, int size, int rn, int rd)
 {
     /* Implement SHLL and SHLL2 */
@@ -10011,17 +9948,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
 
         handle_2misc_narrow(s, false, opcode, u, is_q, size, rn, rd);
         return;
-    case 0x2: /* SADDLP, UADDLP */
-    case 0x6: /* SADALP, UADALP */
-        if (size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_2misc_pairwise(s, opcode, u, is_q, size, rn, rd);
-        return;
     case 0x13: /* SHLL, SHLL2 */
         if (u == 0 || size == 3) {
             unallocated_encoding(s);
@@ -10203,9 +10129,11 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x0: /* REV64, REV32 */
     case 0x1: /* REV16 */
+    case 0x2: /* SADDLP, UADDLP */
     case 0x3: /* SUQADD, USQADD */
     case 0x4: /* CLS, CLZ */
     case 0x5: /* CNT, NOT, RBIT */
+    case 0x6: /* SADALP, UADALP */
     case 0x7: /* SQABS, SQNEG */
     case 0x8: /* CMGT, CMGE */
     case 0x9: /* CMEQ, CMLE */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 05f1bc99b5..f3488766b2 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1662,3 +1662,8 @@ CMLT0_v         0.00 1110 ..1 00000 10101 0 ..... .....     @qrr_e
 REV16_v         0.00 1110 001 00000 00011 0 ..... .....     @qrr_b
 REV32_v         0.10 1110 0.1 00000 00001 0 ..... .....     @qrr_bh
 REV64_v         0.00 1110 ..1 00000 00001 0 ..... .....     @qrr_e
+
+SADDLP_v        0.00 1110 ..1 00000 00101 0 ..... .....     @qrr_e
+UADDLP_v        0.10 1110 ..1 00000 00101 0 ..... .....     @qrr_e
+SADALP_v        0.00 1110 ..1 00000 01101 0 ..... .....     @qrr_e
+UADALP_v        0.10 1110 ..1 00000 01101 0 ..... .....     @qrr_e
-- 
2.43.0

