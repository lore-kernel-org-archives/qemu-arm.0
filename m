Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389FECD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPm-0008Hq-Hp; Sat, 16 May 2026 20:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOm-0007EK-H6
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOh-00052N-Vl
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:28 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-836ed29d1e5so408821b3a.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977822; x=1779582622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ab0YMMyLPu3b50iAah8B/e/2jI2Hs3Msxzymw79EzNY=;
 b=TDSip8+v4mcCJRFo8Zzgf2XS+i2X9nXeV3W/DzxwGeMCTyDsYV7DPVlAYQofzpd0U/
 6wxo5QTOJk4PfhbnuApdVOtrgx8Aj0djcOxuRu+vvT65nXMRkRkNHfA1YnhCFwEyT2i5
 vNfEbHxGkh8U50azGaU0nVKK+9/rezxzAEEVHlWUbbdTIWceoolCSMl+uZz+53108Q2Q
 BLcTZWIplD2GY9aVbzTERM6O8PRZDR9Huc5PnI1czhD80djYASXlYBPNq87bsD08nvqj
 p0Bls62NjtmOrUJ8QkDs9vXAutha7WG4nTk53COrkNCInSezGQwVv0jGlagmUj5aINc1
 eU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977822; x=1779582622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ab0YMMyLPu3b50iAah8B/e/2jI2Hs3Msxzymw79EzNY=;
 b=fdOpeC2IDK4hlxreSBXNE4WByGyVPP55scficTVl/Qsy2JmcbvINa2mbjdPKj5ue1n
 CnTKV5OCK1kujOII8aT7cmiwx8w3rMqVUpHKCp1DbkuFhwN1H4jVtqmC2LRrfpw5yb6Y
 u8970J7lGgKjO95bdK72zFQIWeW6/jDkduD7vHYkXxjpvkudhS1a7I7nkbk9O7/9kpK1
 CaxaPV2yv/a1vhmHj+v8dMbh9z6u/esaZRLBhYm984+4VzaoHjesTzYw6PwzmpZrPaBK
 IGefABtQirk5Ye8NNcw5JXoLAUxTig30y301p4OgGiHxtsL2r4lNFbJSZFGiFlBUBv4d
 mRWA==
X-Gm-Message-State: AOJu0YxBdji2NSVmZHgV/aboFpAi2T8UNa+u0GnI+PHt7v0Z7v2rfFeh
 RCo5kBcfE0aLlmLP2eWye60Wr0iRXMGm4eZT/1PLvYOyNLD4wUPnY+HHXeLS6K//CwM=
X-Gm-Gg: Acq92OHEshQ87WBwbt3eHCdNdOnL/3qXSseTsckjpFIvF1DwNmeKtW6I119Zqne/TOu
 4VZkZGqPpeDv1+x+kVldwIKqp8hKqcrMd1vOdxAKJeR0DCaYOtbNVWWOGnlk0xbt8PfLIeyLtmP
 7qZa/n8lqwRN5ykALMyE6mfgth3Qa2Xfs1RQrkcB33DziybJo57Ln1tgE4scjWQqqZqFD9GwnUy
 nJOiYNJ6J9jveFkPP6EtZmvKYJjWFHs6B0jMbilgpAj8wMOR4yowylnjcYlZCL9Aim9k5O1frBU
 FvOW38e5kFerSs1ZzRHRxne7yi6Jswq5hK9/NekIDM/IFU69bZKRp7yNcCVwMuA9tk0YGSPS4Sz
 kWdwBlMdMvYQEPk1howEdjRGutBLzs5vOZNS9DRj25WR2RP52MRDsadfMLcPUeeIkhJ9C/J9VEe
 U59Q6LpeCjsqE1PtWgDjrl5nP1XP4UMglEiJ+Mnj0=
X-Received: by 2002:a05:6a00:a257:b0:83b:b0c2:17ea with SMTP id
 d2e1a72fcca58-83f33de53e6mr10153314b3a.37.1778977820431; 
 Sat, 16 May 2026 17:30:20 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 19/63] target/arm: Implement FSCALE for AdvSIMD
Date: Sat, 16 May 2026 17:29:18 -0700
Message-ID: <20260517003002.321430-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64-defs.h |  4 ++++
 target/arm/tcg/vec_internal.h    |  4 ++++
 target/arm/tcg/translate-a64.c   |  7 +++++++
 target/arm/tcg/vec_helper64.c    | 16 ++++++++++++++++
 target/arm/tcg/a64.decode        |  3 +++
 5 files changed, 34 insertions(+)

diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index 215df1201b..b7880f773e 100644
--- a/target/arm/tcg/helper-a64-defs.h
+++ b/target/arm/tcg/helper-a64-defs.h
@@ -152,6 +152,10 @@ DEF_HELPER_FLAGS_5(gvec_famin_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32
 DEF_HELPER_FLAGS_5(gvec_famax_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_famin_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fscale_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fscale_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fscale_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(exception_return, void, env, i64)
 #endif
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index cc2691b2f6..68b1116171 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -345,6 +345,10 @@ float32 float32_famin(float32, float32, float_status *);
 float64 float64_famax(float64, float64, float_status *);
 float64 float64_famin(float64, float64, float_status *);
 
+#define float16_fscale  float16_scalbn
+#define float32_fscale  float32_scalbn
+float64 float64_fscale(float64, int64_t, float_status *);
+
 /*
  * Decode helper functions for predicate as counter.
  */
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d2a4b0fadc..ac18ceeeab 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6496,6 +6496,13 @@ static gen_helper_gvec_3_ptr * const f_vector_famin[3] = {
 };
 TRANS_FEAT(FAMIN, aa64_faminmax, do_fp3_vector, a, 0, f_vector_famin)
 
+static gen_helper_gvec_3_ptr * const f_vector_fscale[3] = {
+    gen_helper_gvec_fscale_h,
+    gen_helper_gvec_fscale_s,
+    gen_helper_gvec_fscale_d,
+};
+TRANS_FEAT(FSCALE, aa64_f8cvt, do_fp3_vector, a, 0, f_vector_fscale)
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
index 4a5b0782d1..2f481ac489 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -174,3 +174,19 @@ DO_3OP(gvec_famax_s, float32_famax, float32)
 DO_3OP(gvec_famin_s, float32_famin, float32)
 DO_3OP(gvec_famax_d, float64_famax, float64)
 DO_3OP(gvec_famin_d, float64_famin, float64)
+
+float64 float64_fscale(float64 n, int64_t m, float_status *s)
+{
+    /*
+     * Given the 'int' parameter of float64_scalbn, we have to saturate
+     * the 'int64_t' parameter of the operation to some value.  Since
+     * float64 has an 11-bit exponent, saturating to 12 bits is sufficient
+     * to ensure that DBL_TRUE_MIN can be made to overflow.
+     */
+    int sat_m = MIN(MAX(m, -0xfff), 0xfff);
+    return float64_scalbn(n, sat_m, s);
+}
+
+DO_3OP(gvec_fscale_h, float16_fscale, int16_t)
+DO_3OP(gvec_fscale_s, float32_fscale, int32_t)
+DO_3OP(gvec_fscale_d, float64_fscale, int64_t)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 666a293540..02c7264cb9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1198,6 +1198,9 @@ FAMAX           0.00 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
 FAMIN           0.10 1110 110 ..... 00011 1 ..... ..... @qrrr_h
 FAMIN           0.10 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
 
+FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
+FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0


