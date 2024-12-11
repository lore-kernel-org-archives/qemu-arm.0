Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193858njb;
        Wed, 11 Dec 2024 08:37:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAfTiw3feXuAXEdm1wDB77F9fVhExDIOXgfA+QQwV4mqqwudtu16O5aF7tzKliyED8xIwLW2q09h7hCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFORcWgazFF+3GSE1gZ8wfODNH+mEPq/NbMLan10VlHmVVXfEB4rehpoI+aoF+YoNAhG22q
X-Received: by 2002:a05:6214:1c47:b0:6d8:7d63:f424 with SMTP id 6a1803df08f44-6dae29eff6emr5612496d6.12.1733935073006;
        Wed, 11 Dec 2024 08:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935072; cv=none;
        d=google.com; s=arc-20240605;
        b=YqtY+exWzLMXZz9pjop0+JFw8AhCt2cStJoez0cwh/IbYeKOostIV9t+9Q+O5K0Ovv
         BArEtpHzan/kQyJKBhHAjEDBVzOa7CkhLUDRnvpsXuMzaa2d7j/OI1QXK12cGnKJwCm6
         zmSvTORoLyCX1Yd+WMX2WhYXsOEKzJISxmsKtJOiFdHIJAwKNMSJwVkXb7q9OJPhFxjJ
         OCyYezsbY1L208dqlEjAApNuPdLH8uZ/IDcqaCLgthXcCKDmxZxcThdxwKJmde7jxKhh
         ybNxQIkG1n2SZX+bVIhcu8CQkEpakAJxOlXtJ22zG+pw5veSdE7Ef2jc8KlaEubBLyK3
         TCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h9jQSwq7lR/Eg53AlnqkWC3Nk0mGhQSS5bECu5mg0fo=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=UpjQ47qb3VOuZxS6jyQXNHroULoutHeu8SXiCB8bO9jymDfq8KZw4uxL1ngVLFfHgd
         B9S8I9xjtlB2gJxlDgFtSe8SgR1KNqPlCo0up7Fq1DXq4Jh+WA/GiX321ZDmmt23gOMb
         gYUq6eljw5hkFKQ0x4wkNeQLshxIl8BmbG0sOKfPcBQKJMQneY3xh3sQYSMZnVQXntVb
         K6umioQe2JFcT/DROPaK8exOzfy6PMi27Q21QP7ReQWCuxllOJZpVLr1rc3gZs9PYauJ
         RdZugcrp6Q7VKZEwjiQOPJXfk1H8qj9cIr+CDbYQU2joEriJEHFSHvoRSGdM2duV3/9B
         eRug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zywVREdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6dd259bc5si636567285a.656.2024.12.11.08.37.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zywVREdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPhU-0000Se-Gw; Wed, 11 Dec 2024 11:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhP-0008WN-UY
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:31 -0500
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhN-0002C1-Nt
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:31 -0500
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6d900c27af7so44382646d6.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934988; x=1734539788; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9jQSwq7lR/Eg53AlnqkWC3Nk0mGhQSS5bECu5mg0fo=;
 b=zywVREdw71KSLU4TnymldYFgHnko/Z+ZMLRo0PSAyLM3ZbZ2h6bXlk239e72ZmMCQA
 22GReijbSRjD1mnBaE0jPTxFk7DRSq6T9Lz5uzqGhQlezl8Hhye25o0trorS/uCFFTfG
 C8fgDrYW8EIpnJ1eKfmIfC9YNo6aTTZ4QM2XSxGowhsV4+UrZyRH3dOxS4dQHAx+w98/
 6FeNjnFSAjXf4/xYb/OE40Nq++0pFAXnJPIvPPZdN3I00Uixs+wWXiGhJLaFtqk9ijgD
 Uu3Ww7UOxz9soRupdnqdwEjqazUx5Re41TMVWOAp7HhQxr2tREBdZt0xy6ofMm43DweI
 b1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934988; x=1734539788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9jQSwq7lR/Eg53AlnqkWC3Nk0mGhQSS5bECu5mg0fo=;
 b=rnPMkjDlQU62BGhS2aRUAqbbG7IAK1wUxUbWYkwakXpntATGoclbqJt+PfUx9JKgye
 tFlaldq9CSBMb4P/lc4q/1bxmELMhxmZv7ex/pj2GSY7hK8SuBKycTdS4gaaEtOJ0Sj3
 PDizbtoOXRCGLwfZmp+r1CDCHZjIw3HPttP54/kqcW4DvD9cbU3w9Z2Bp4/F5F4GDXdM
 f7nWjssoH8OW7ZeyxOTlF7iey/+qZLWiMcZYVhidawu7p0aLzTc0fUo0jtK1+kPjbpBO
 jOSux9DDlQiYRR1NuQehuWD4TzNX0slKloYXZTqroMPNW/2Mm8xktvNxO6jqssK681go
 wvrQ==
X-Gm-Message-State: AOJu0YzIcQeIECz8SFewIZ/9RC+NtxGsMGdgW+tl8ssSyI3Gks9Mprke
 7TFCkSGjtVtHdqPmj2QqZEmNj/2t6OVCCnX0KdCOEVQmSZtJZbFSegV0IEx2Y+Y=
X-Gm-Gg: ASbGnctEEAJpRjew/XULo+vxqVW4TjailqHewiLJN5rQCEt73d8WcUluCozoLsJdvtx
 waOH/BsG1Lit8fcbEULZWJJbJKhMvo3Y+LYnUWC3SlW2SA+2L2qStpPSiNhGZ8iU0PkfP/J9FH9
 IdKQyvN4H9AF2BRNEuJMNskywO3egWTe8uvPPQSDoawccyvsQdbLQXBILBt0elhqq7LmraFvlF4
 Ruz7uHryQdV3B50i1fIE5WOCTmgv/9NrwDWNvLHqExCa3ChvE0jXxLn+cBIxA==
X-Received: by 2002:a05:6214:ca7:b0:6d8:8e0f:8c0f with SMTP id
 6a1803df08f44-6dae29f0f37mr7670656d6.18.1733934988433; 
 Wed, 11 Dec 2024 08:36:28 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 50/69] target/arm: Convert FCVTN, BFCVTN to decodetree
Date: Wed, 11 Dec 2024 10:30:17 -0600
Message-ID: <20241211163036.2297116-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
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
X-TUID: MAzLjPpitVlG

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 89 ++++++++++++++++++----------------
 target/arm/tcg/a64.decode      |  5 ++
 2 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7b76945b0a..d4d19c9caa 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9051,6 +9051,49 @@ TRANS(SQXTUN_v, do_2misc_narrow_vector, a, f_scalar_sqxtun)
 TRANS(SQXTN_v, do_2misc_narrow_vector, a, f_scalar_sqxtn)
 TRANS(UQXTN_v, do_2misc_narrow_vector, a, f_scalar_uqxtn)
 
+static void gen_fcvtn_hs(TCGv_i64 d, TCGv_i64 n)
+{
+    TCGv_i32 tcg_lo = tcg_temp_new_i32();
+    TCGv_i32 tcg_hi = tcg_temp_new_i32();
+    TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
+    TCGv_i32 ahp = get_ahp_flag();
+
+    tcg_gen_extr_i64_i32(tcg_lo, tcg_hi, n);
+    gen_helper_vfp_fcvt_f32_to_f16(tcg_lo, tcg_lo, fpst, ahp);
+    gen_helper_vfp_fcvt_f32_to_f16(tcg_hi, tcg_hi, fpst, ahp);
+    tcg_gen_deposit_i32(tcg_lo, tcg_lo, tcg_hi, 16, 16);
+    tcg_gen_extu_i32_i64(d, tcg_lo);
+}
+
+static void gen_fcvtn_sd(TCGv_i64 d, TCGv_i64 n)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    gen_helper_vfp_fcvtsd(tmp, n, tcg_env);
+    tcg_gen_extu_i32_i64(d, tmp);
+}
+
+static ArithOneOp * const f_vector_fcvtn[] = {
+    NULL,
+    gen_fcvtn_hs,
+    gen_fcvtn_sd,
+};
+TRANS(FCVTN_v, do_2misc_narrow_vector, a, f_vector_fcvtn)
+
+static void gen_bfcvtn_hs(TCGv_i64 d, TCGv_i64 n)
+{
+    TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    gen_helper_bfcvt_pair(tmp, n, fpst);
+    tcg_gen_extu_i32_i64(d, tmp);
+}
+
+static ArithOneOp * const f_vector_bfcvtn[] = {
+    NULL,
+    gen_bfcvtn_hs,
+    NULL,
+};
+TRANS_FEAT(BFCVTN_v, aa64_bf16, do_2misc_narrow_vector, a, f_vector_bfcvtn)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9633,33 +9676,6 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
         tcg_res[pass] = tcg_temp_new_i64();
 
         switch (opcode) {
-        case 0x16: /* FCVTN, FCVTN2 */
-            /* 32 bit to 16 bit or 64 bit to 32 bit float conversion */
-            if (size == 2) {
-                TCGv_i32 tmp = tcg_temp_new_i32();
-                gen_helper_vfp_fcvtsd(tmp, tcg_op, tcg_env);
-                tcg_gen_extu_i32_i64(tcg_res[pass], tmp);
-            } else {
-                TCGv_i32 tcg_lo = tcg_temp_new_i32();
-                TCGv_i32 tcg_hi = tcg_temp_new_i32();
-                TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
-                TCGv_i32 ahp = get_ahp_flag();
-
-                tcg_gen_extr_i64_i32(tcg_lo, tcg_hi, tcg_op);
-                gen_helper_vfp_fcvt_f32_to_f16(tcg_lo, tcg_lo, fpst, ahp);
-                gen_helper_vfp_fcvt_f32_to_f16(tcg_hi, tcg_hi, fpst, ahp);
-                tcg_gen_deposit_i32(tcg_lo, tcg_lo, tcg_hi, 16, 16);
-                tcg_gen_extu_i32_i64(tcg_res[pass], tcg_lo);
-            }
-            break;
-        case 0x36: /* BFCVTN, BFCVTN2 */
-            {
-                TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
-                TCGv_i32 tmp = tcg_temp_new_i32();
-                gen_helper_bfcvt_pair(tmp, tcg_op, fpst);
-                tcg_gen_extu_i32_i64(tcg_res[pass], tmp);
-            }
-            break;
         case 0x56:  /* FCVTXN, FCVTXN2 */
             {
                 /*
@@ -9675,6 +9691,8 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
         default:
         case 0x12: /* XTN, SQXTUN */
         case 0x14: /* SQXTN, UQXTN */
+        case 0x16: /* FCVTN, FCVTN2 */
+        case 0x36: /* BFCVTN, BFCVTN2 */
             g_assert_not_reached();
         }
 
@@ -10088,21 +10106,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 unallocated_encoding(s);
                 return;
             }
-            /* fall through */
-        case 0x16: /* FCVTN, FCVTN2 */
-            /* handle_2misc_narrow does a 2*size -> size operation, but these
-             * instructions encode the source size rather than dest size.
-             */
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_2misc_narrow(s, false, opcode, 0, is_q, size - 1, rn, rd);
-            return;
-        case 0x36: /* BFCVTN, BFCVTN2 */
-            if (!dc_isar_feature(aa64_bf16, s) || size != 2) {
-                unallocated_encoding(s);
-                return;
-            }
             if (!fp_access_check(s)) {
                 return;
             }
@@ -10155,6 +10158,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             break;
         default:
+        case 0x16: /* FCVTN, FCVTN2 */
+        case 0x36: /* BFCVTN, BFCVTN2 */
             unallocated_encoding(s);
             return;
         }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 295329448f..456912cd7c 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -21,6 +21,7 @@
 
 %rd             0:5
 %esz_sd         22:1 !function=plus_2
+%esz_hs         22:1 !function=plus_1
 %esz_hsd        22:2 !function=xor_2
 %hl             11:1 21:1
 %hlm            11:1 20:2
@@ -74,6 +75,7 @@
 @qrr_b          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=0
 @qrr_h          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=1
 @qrr_bh         . q:1 ...... . esz:1 ...... ...... rn:5 rd:5  &qrr_e
+@qrr_hs         . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=%esz_hs
 @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
 
 @qrrr_b         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=0
@@ -1676,3 +1678,6 @@ XTN             0.00 1110 ..1 00001 00101 0 ..... .....     @qrr_e
 SQXTUN_v        0.10 1110 ..1 00001 00101 0 ..... .....     @qrr_e
 SQXTN_v         0.00 1110 ..1 00001 01001 0 ..... .....     @qrr_e
 UQXTN_v         0.10 1110 ..1 00001 01001 0 ..... .....     @qrr_e
+
+FCVTN_v         0.00 1110 0.1 00001 01101 0 ..... .....     @qrr_hs
+BFCVTN_v        0.00 1110 101 00001 01101 0 ..... .....     @qrr_h
-- 
2.43.0

