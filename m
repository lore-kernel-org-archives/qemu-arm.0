Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2156846njk;
        Sun, 1 Dec 2024 07:20:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZuCK/pbuee9ArFsEn+Q9ioWriVdP9roAHtR1iaHUv+Bk/1OmZhSMI+Dmj5W07WS5De0hB+Ih4mb05og==@linaro.org
X-Google-Smtp-Source: AGHT+IGBCuMYUBfYS8Dlxqyz2qxkFn3LKua5XFmSHFGW63cIJoPKLOyn0lusZjw+z3+uKtubdJ5i
X-Received: by 2002:a05:6214:da1:b0:6d8:8390:15db with SMTP id 6a1803df08f44-6d883901bbemr215979446d6.6.1733066446424;
        Sun, 01 Dec 2024 07:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066446; cv=none;
        d=google.com; s=arc-20240605;
        b=bv3rVFITwpLpQs1uIW1+lkHlU2MjPNd/qSiMnBjeq/rkHJlyjYu4LWlf2IheK/B6hP
         1Aol1eUhyLkH8XdnSL5KXDX7MFboMT1lXhl21WjY6/njnl4cmLufO5WgY2TZY/89a9yA
         7IV00EWA4wz2kVEpSwOBirqdPQnvTFLPlLVKZa13VKcJIUrwzaqzd6Mnvwgp/Fet5zIx
         PxGHQZQ6tiawKZBd17tmpI2edJk2auCnmBlN0x9ZwlQqhAwaS5hYh75UPEzlPtDCfe0u
         Ze0MA9rvxcaC8Sw7atoRCHEgeJGxcm84gthEnV29NM0MJ/gmOwnBoGAc511PNId7wjY2
         mAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lwW/5/8rsv/KazcWcKKLho0rlCDYz+qNIE0WaYL5Pt0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=a0Mo0cNySvy9j263wy5CKD9wJOg7kDlyShm/l1f1kvdmVmAEV/PPnNyWGF9XHvHvly
         ALLAuZtZv8Bas+zGKiPFN4xFt8kfOIruoXwR62ifkmZLeLzFmGNFXYNRhgP9yLH35Tnr
         CsDek3UKIHP7WeHvDik8aB6s+PFlw3yvJ1gzJTyV+gCgfskTLSS5T6uKakDIc1Go9ZUN
         /oPcuOome97CVqoFa3d/w3YYFHTPk0+6G86w5zWKERqC67s9gpay5cyyYWffF8YCp9WV
         N7PZ77D7XdUrXFU1+NnSSSw3IvcmVsJOg3zBWGRrZfMA8YOkFORGnh/zP/D3WjgqXTm+
         fgxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y5/KR5W2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d89129fd58si44467626d6.173.2024.12.01.07.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y5/KR5W2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlbj-0004yx-2l; Sun, 01 Dec 2024 10:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaW-0008PE-Ri
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:21 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaU-0005HH-Gw
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:20 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5eede9695ffso1698149eaf.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065817; x=1733670617; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwW/5/8rsv/KazcWcKKLho0rlCDYz+qNIE0WaYL5Pt0=;
 b=y5/KR5W2fkSrfPk8zpIOF5ctifru19MxsgcerUyRDdSyx2OTWVIlFjp2NKcTZgX0ls
 9fYZqEhAu7CmvG9LsTyCgt1ykkkU3batnYXgRf0Ijl4ADMKN7rQ4CkA9RR/szP/dVEy9
 04Tod/1FOh7IeBQeBybMnMfSOwyTOXQzyDQj5eVOOS7MtFvw/d/nCxwdyVkjupIE7V2V
 zVYe9T2QsIkhUpTl5sJFhD4rtq89fE5vhgAurZg7phmAPYmLnzhf3xX44E2/Xw4cTQKo
 BFZpKwP9QF1u5GuYop3/dYmpn0VCZhaolgUdY0fAV4LzYHgZIAuhDkesdtOmSDL07KCN
 QkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065817; x=1733670617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwW/5/8rsv/KazcWcKKLho0rlCDYz+qNIE0WaYL5Pt0=;
 b=ExU70Z+t94oE/6k4G4uVVcGls3F1gkDyfr4hJg65skH7wQSBQneUk0twhNJJGrp0e9
 y8mdFDSi6HGBzcuHJZKodchOxtpoxR/gUvkgMtUDLSmx+ErKlp+As4DwZ4EUtxX7U8NW
 7M9M+exKa6iVR10bK0zzIQWtXpkv+m6yqm4s7JzgRuV4gyLVs7K+oIrB3RyestPq3PbJ
 UD49VkmviPaEKXpzejPvbrUihf+7iqkXrbLQfjk7M0az585kiSY3zz9B3cE1B7Jg7JnQ
 uxDaxVZsduulhFrIfedzL4HFA76hZ39b7gB6LihjKgpg0IkNYaAyFVzBftuN0yhWDI3M
 wTGw==
X-Gm-Message-State: AOJu0Yw9TTiCABH7vsEA4skYtAAQQ5UXUHvF/24SdPRgLpKMr++8fhLd
 bzAN4tzdIPzbWL/6jS7aiHgXrfi4/5h8HesjD/MRNj58AnuAiKkNE7243LlZNMA=
X-Gm-Gg: ASbGncsCpkPpmXAwuLs+aqdLSqjAgokFQESMa3n7yaTGbSAOcuZLGSHI+S83hm+H+Qi
 3s/uQ6dYse1sCjK85MQUtcAvEgexjyDn3yJrpadDw9J+wNUjIBNhAXH+Eb0KGJqsSkkwwQxHIKE
 vs43UI3bni3EYb/4UdXQRCzEgprCum3yf86yU8WiU5S/QaQgib+5aqy3f8oy+SAekXzOIAuhi2+
 L0EHCQTxezVXhcfIo6cVSTS8TQxdtKqxiHP7kOJCIXsM/acVgOcYT7hQ1OZwtSIDVAKrNrQaYZO
 0SVO81aqzhqOvl5WPtkzx81c6J1Ca1fmRpTe
X-Received: by 2002:a05:6820:1acc:b0:5f2:9aa:5821 with SMTP id
 006d021491bc7-5f20a14f39amr12525831eaf.2.1733065817216; 
 Sun, 01 Dec 2024 07:10:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 60/67] target/arm: Convert [US]CVTF (vector) to decodetree
Date: Sun,  1 Dec 2024 09:05:59 -0600
Message-ID: <20241201150607.12812-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
X-TUID: eb5l1fW3USs4

Remove handle_simd_intfp_conv and handle_simd_shift_intfp_conv
as these were the last insns decoded by those functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |   3 +
 target/arm/tcg/translate-a64.c | 201 ++++++---------------------------
 target/arm/tcg/vec_helper.c    |   7 +-
 target/arm/tcg/a64.decode      |  22 ++++
 4 files changed, 66 insertions(+), 167 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f2cfee40de..b227ac54d9 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -658,6 +658,9 @@ DEF_HELPER_FLAGS_4(gvec_vcvt_uh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rz_hs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rz_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_vcvt_sd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_ud, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_us, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ea178f85c2..26ae38b99e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9305,141 +9305,44 @@ TRANS_FEAT(FRINT64Z_v, aa64_frint, do_fp1_vector, a,
            &f_scalar_frint64, FPROUNDING_ZERO)
 TRANS_FEAT(FRINT64X_v, aa64_frint, do_fp1_vector, a, &f_scalar_frint64, -1)
 
-/* Common vector code for handling integer to FP conversion */
-static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
-                                   int elements, int is_signed,
-                                   int fracbits, int size)
+static bool do_gvec_op2_fpst(DisasContext *s, MemOp esz, bool is_q,
+                             int rd, int rn, int data,
+                             gen_helper_gvec_2_ptr * const fns[3])
 {
-    TCGv_ptr tcg_fpst = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-    TCGv_i32 tcg_shift = NULL;
+    int check = fp_access_check_vector_hsd(s, is_q, esz);
+    TCGv_ptr fpst;
 
-    MemOp mop = size | (is_signed ? MO_SIGN : 0);
-    int pass;
-
-    if (fracbits || size == MO_64) {
-        tcg_shift = tcg_constant_i32(fracbits);
+    if (check <= 0) {
+        return check == 0;
     }
 
-    if (size == MO_64) {
-        TCGv_i64 tcg_int64 = tcg_temp_new_i64();
-        TCGv_i64 tcg_double = tcg_temp_new_i64();
-
-        for (pass = 0; pass < elements; pass++) {
-            read_vec_element(s, tcg_int64, rn, pass, mop);
-
-            if (is_signed) {
-                gen_helper_vfp_sqtod(tcg_double, tcg_int64,
-                                     tcg_shift, tcg_fpst);
-            } else {
-                gen_helper_vfp_uqtod(tcg_double, tcg_int64,
-                                     tcg_shift, tcg_fpst);
-            }
-            if (elements == 1) {
-                write_fp_dreg(s, rd, tcg_double);
-            } else {
-                write_vec_element(s, tcg_double, rd, pass, MO_64);
-            }
-        }
-    } else {
-        TCGv_i32 tcg_int32 = tcg_temp_new_i32();
-        TCGv_i32 tcg_float = tcg_temp_new_i32();
-
-        for (pass = 0; pass < elements; pass++) {
-            read_vec_element_i32(s, tcg_int32, rn, pass, mop);
-
-            switch (size) {
-            case MO_32:
-                if (fracbits) {
-                    if (is_signed) {
-                        gen_helper_vfp_sltos(tcg_float, tcg_int32,
-                                             tcg_shift, tcg_fpst);
-                    } else {
-                        gen_helper_vfp_ultos(tcg_float, tcg_int32,
-                                             tcg_shift, tcg_fpst);
-                    }
-                } else {
-                    if (is_signed) {
-                        gen_helper_vfp_sitos(tcg_float, tcg_int32, tcg_fpst);
-                    } else {
-                        gen_helper_vfp_uitos(tcg_float, tcg_int32, tcg_fpst);
-                    }
-                }
-                break;
-            case MO_16:
-                if (fracbits) {
-                    if (is_signed) {
-                        gen_helper_vfp_sltoh(tcg_float, tcg_int32,
-                                             tcg_shift, tcg_fpst);
-                    } else {
-                        gen_helper_vfp_ultoh(tcg_float, tcg_int32,
-                                             tcg_shift, tcg_fpst);
-                    }
-                } else {
-                    if (is_signed) {
-                        gen_helper_vfp_sitoh(tcg_float, tcg_int32, tcg_fpst);
-                    } else {
-                        gen_helper_vfp_uitoh(tcg_float, tcg_int32, tcg_fpst);
-                    }
-                }
-                break;
-            default:
-                g_assert_not_reached();
-            }
-
-            if (elements == 1) {
-                write_fp_sreg(s, rd, tcg_float);
-            } else {
-                write_vec_element_i32(s, tcg_float, rd, pass, size);
-            }
-        }
-    }
-
-    clear_vec_high(s, elements << size == 16, rd);
+    fpst = fpstatus_ptr(esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn), fpst,
+                       is_q ? 16 : 8, vec_full_reg_size(s),
+                       data, fns[esz - 1]);
+    return true;
 }
 
-/* UCVTF/SCVTF - Integer to FP conversion */
-static void handle_simd_shift_intfp_conv(DisasContext *s, bool is_scalar,
-                                         bool is_q, bool is_u,
-                                         int immh, int immb, int opcode,
-                                         int rn, int rd)
-{
-    int size, elements, fracbits;
-    int immhb = immh << 3 | immb;
+static gen_helper_gvec_2_ptr * const f_scvtf_v[] = {
+    gen_helper_gvec_vcvt_sh,
+    gen_helper_gvec_vcvt_sf,
+    gen_helper_gvec_vcvt_sd,
+};
+TRANS(SCVTF_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, 0, f_scvtf_v)
+TRANS(SCVTF_vf, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, a->shift, f_scvtf_v)
 
-    if (immh & 8) {
-        size = MO_64;
-        if (!is_scalar && !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-    } else if (immh & 4) {
-        size = MO_32;
-    } else if (immh & 2) {
-        size = MO_16;
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            unallocated_encoding(s);
-            return;
-        }
-    } else {
-        /* immh == 0 would be a failure of the decode logic */
-        g_assert(immh == 1);
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (is_scalar) {
-        elements = 1;
-    } else {
-        elements = (8 << is_q) >> size;
-    }
-    fracbits = (16 << size) - immhb;
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    handle_simd_intfp_conv(s, rd, rn, elements, !is_u, fracbits, size);
-}
+static gen_helper_gvec_2_ptr * const f_ucvtf_v[] = {
+    gen_helper_gvec_vcvt_uh,
+    gen_helper_gvec_vcvt_uf,
+    gen_helper_gvec_vcvt_ud,
+};
+TRANS(UCVTF_vi, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, 0, f_ucvtf_v)
+TRANS(UCVTF_vf, do_gvec_op2_fpst,
+      a->esz, a->q, a->rd, a->rn, a->shift, f_ucvtf_v)
 
 /* FCVTZS, FVCVTZU - FP to fixedpoint conversion */
 static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
@@ -9890,10 +9793,6 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x1c: /* SCVTF / UCVTF */
-        handle_simd_shift_intfp_conv(s, false, is_q, is_u, immh, immb,
-                                     opcode, rn, rd);
-        break;
     case 0x1f: /* FCVTZS/ FCVTZU */
         handle_simd_shift_fpint_conv(s, false, is_q, is_u, immh, immb, rn, rd);
         return;
@@ -9911,6 +9810,7 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     case 0x12: /* SQSHRN / UQSHRN */
     case 0x13: /* SQRSHRN / UQRSHRN */
     case 0x14: /* SSHLL / USHLL */
+    case 0x1c: /* SCVTF / UCVTF */
         unallocated_encoding(s);
         return;
     }
@@ -9990,21 +9890,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         opcode |= (extract32(size, 1, 1) << 5) | (u << 6);
         size = is_double ? 3 : 2;
         switch (opcode) {
-        case 0x1d: /* SCVTF */
-        case 0x5d: /* UCVTF */
-        {
-            bool is_signed = (opcode == 0x1d) ? true : false;
-            int elements = is_double ? 2 : is_q ? 4 : 2;
-            if (is_double && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_simd_intfp_conv(s, rd, rn, elements, is_signed, 0, size);
-            return;
-        }
         case 0x2c: /* FCMGT (zero) */
         case 0x2d: /* FCMEQ (zero) */
         case 0x2e: /* FCMLT (zero) */
@@ -10087,6 +9972,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x1f: /* FRINT64Z */
         case 0x5e: /* FRINT32X */
         case 0x5f: /* FRINT64X */
+        case 0x1d: /* SCVTF */
+        case 0x5d: /* UCVTF */
             unallocated_encoding(s);
             return;
         }
@@ -10252,24 +10139,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     fpop = deposit32(fpop, 6, 1, u);
 
     switch (fpop) {
-    case 0x1d: /* SCVTF */
-    case 0x5d: /* UCVTF */
-    {
-        int elements;
-
-        if (is_scalar) {
-            elements = 1;
-        } else {
-            elements = (is_q ? 8 : 4);
-        }
-
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_simd_intfp_conv(s, rd, rn, elements, !u, 0, MO_16);
-        return;
-    }
-    break;
     case 0x2c: /* FCMGT (zero) */
     case 0x2d: /* FCMEQ (zero) */
     case 0x2e: /* FCMLT (zero) */
@@ -10323,6 +10192,8 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x58: /* FRINTA */
     case 0x59: /* FRINTX */
     case 0x79: /* FRINTI */
+    case 0x1d: /* SCVTF */
+    case 0x5d: /* UCVTF */
         unallocated_encoding(s);
         return;
     }
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 282dba4bfd..aa85cea0ca 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2505,12 +2505,15 @@ DO_3OP_PAIR(gvec_uminp_s, MIN, uint32_t, H4)
         clear_tail(d, oprsz, simd_maxsz(desc));                         \
     }
 
+DO_VCVT_FIXED(gvec_vcvt_sd, helper_vfp_sqtod, uint64_t)
+DO_VCVT_FIXED(gvec_vcvt_ud, helper_vfp_uqtod, uint64_t)
 DO_VCVT_FIXED(gvec_vcvt_sf, helper_vfp_sltos, uint32_t)
 DO_VCVT_FIXED(gvec_vcvt_uf, helper_vfp_ultos, uint32_t)
-DO_VCVT_FIXED(gvec_vcvt_rz_fs, helper_vfp_tosls_round_to_zero, uint32_t)
-DO_VCVT_FIXED(gvec_vcvt_rz_fu, helper_vfp_touls_round_to_zero, uint32_t)
 DO_VCVT_FIXED(gvec_vcvt_sh, helper_vfp_shtoh, uint16_t)
 DO_VCVT_FIXED(gvec_vcvt_uh, helper_vfp_uhtoh, uint16_t)
+
+DO_VCVT_FIXED(gvec_vcvt_rz_fs, helper_vfp_tosls_round_to_zero, uint32_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_fu, helper_vfp_touls_round_to_zero, uint32_t)
 DO_VCVT_FIXED(gvec_vcvt_rz_hs, helper_vfp_toshh_round_to_zero, uint16_t)
 DO_VCVT_FIXED(gvec_vcvt_rz_hu, helper_vfp_touhh_round_to_zero, uint16_t)
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 197555555e..bb94374f22 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1786,3 +1786,25 @@ FRINT32Z_v      0.00 1110 0.1 00001 11101 0 ..... .....     @qrr_sd
 FRINT32X_v      0.10 1110 0.1 00001 11101 0 ..... .....     @qrr_sd
 FRINT64Z_v      0.00 1110 0.1 00001 11111 0 ..... .....     @qrr_sd
 FRINT64X_v      0.10 1110 0.1 00001 11111 0 ..... .....     @qrr_sd
+
+SCVTF_vi        0.00 1110 011 11001 11011 0 ..... .....     @qrr_h
+SCVTF_vi        0.00 1110 0.1 00001 11011 0 ..... .....     @qrr_sd
+
+UCVTF_vi        0.10 1110 011 11001 11011 0 ..... .....     @qrr_h
+UCVTF_vi        0.10 1110 0.1 00001 11011 0 ..... .....     @qrr_sd
+
+&fcvt_q         rd rn esz q shift
+@fcvtq_h        . q:1 . ...... 001 .... ...... rn:5 rd:5    \
+                &fcvt_q esz=1 shift=%fcvt_f_sh_h
+@fcvtq_s        . q:1 . ...... 01 ..... ...... rn:5 rd:5    \
+                &fcvt_q esz=2 shift=%fcvt_f_sh_s
+@fcvtq_d        . q:1 . ...... 1 ...... ...... rn:5 rd:5    \
+                &fcvt_q esz=3 shift=%fcvt_f_sh_d
+
+SCVTF_vf        0.00 11110 ....... 111001 ..... .....       @fcvtq_h
+SCVTF_vf        0.00 11110 ....... 111001 ..... .....       @fcvtq_s
+SCVTF_vf        0.00 11110 ....... 111001 ..... .....       @fcvtq_d
+
+UCVTF_vf        0.10 11110 ....... 111001 ..... .....       @fcvtq_h
+UCVTF_vf        0.10 11110 ....... 111001 ..... .....       @fcvtq_s
+UCVTF_vf        0.10 11110 ....... 111001 ..... .....       @fcvtq_d
-- 
2.43.0

