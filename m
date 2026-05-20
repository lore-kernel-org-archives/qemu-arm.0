Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98481CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:28:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZD-0007Yu-HF; Wed, 20 May 2026 14:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYw-00079Y-2f
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYr-0000YQ-LW
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-36a15ed5119so1709411a91.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301348; x=1779906148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y6DH3r9Ocq03Ogkj6tuyQRJbavLOUiuWZWmOrpPJ69o=;
 b=L0943LJkapJSYudz8HWxPNjbXx0sajkxSYTv5/3Mj9xx1C23ZkQrh+e9El9TFpiAUe
 kBzgA8yG4GBHNCjIbBDNOe18StFScHzcpn0yhefXuOByfNouKSIsOGnaJODwY+lCrztQ
 iqf4KZMroyO/fgu7HMrVxtjRTXxsEVUG/6vQZt077MoX6wAHraf4e3WP9azFy5XPwzVX
 MpEHRAFKadxYlSURN22k6X88Vo9XwRljtswx1iOnVJk/6vPa7X9HlnN/kw4MJkX/iCNM
 J2J6yPHn6i6kRZt5udBOuOimTWXKDEuuUEWyRiozZZC1LUivaiorprbVgZNnStIAzXm4
 JUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301348; x=1779906148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y6DH3r9Ocq03Ogkj6tuyQRJbavLOUiuWZWmOrpPJ69o=;
 b=hFkNKSrk02SIkrwtS3evVoZpH7dO3UXRZEzkRjqMHDpxg8aAXk7/toLzLN+4aAd4HT
 lOYUFdrmIEXajIEPfE+/E6iDl5AQz92OlZuEeqH6JcKveqsKCddubFOB99FNy2eb4c6f
 TKJDnNm7pwc3gcmI6ttm1yHDgiT+TeDYjw5fvzo8ARTXYIe9CGA8MdMdDoe6yG/D2TSa
 AdWr2WhhksnDJniKPjxFE9r45Y/5TLJHNqe8pUP3f5TtnitwqtleDNOiun/tirvrFkEu
 MKFb6hXWCfP1Jr/7YO3Hc9FNHZVzKGIxV/Vpa7WW9PSMOiUKsQ2aWwuLUH++pAxYluUb
 HQKg==
X-Gm-Message-State: AOJu0Yy0zgCRCV00reuSGSznDDVHFeDrrQM4DwItZv+Pjs7nyMYND0of
 wKjyb4YbG3koMfGtV0JQP6UwOoFDmwgYc9eWQs9qK57vSJQ6wAVPJ442QZ5xin9Yozk=
X-Gm-Gg: Acq92OFUxvAMWwEIZ+yQwPaeR5s664UHtanknK6PxEsZvKk+oumYX4ewO57c6qIlArG
 yFYAtHQwRuUjNo4FwH9VsOFvafRMJDoZQd9o+YfDxFLZ+/izFPOYzQr9Tojov1OE8cwxcgF+VMn
 aiOkiHZ52O5Mn5ZUH13+DhKr4cLjrJkL0fYyV8JGMvKqsebKBB8ghfFYwM4ZcdNBm4PVByjyVp7
 hKypH2RO2xmELq6yXtdCB7XdbQ8InDGGR9L8Z/ji5hC3ND8CJEhBkeVAW1F0HQL65eBuy2FsA79
 YnokiD/2nmqirBgUPGjgVCjErfD0QXka8WmD2s42HHz6cDsZjwdmUUR7YaJZ9ceUZkhNWB1NPg+
 zoX+EmmjaCvXvNE6k0D92Ee3mOXj35SV/QfFDIe2HskLxiDJICeh78Ngc3LmjW3dVaug+jub0RD
 CvWQxe7BSxsXiPMQG4HjjBIMx9jLMV
X-Received: by 2002:a17:90b:2fc4:b0:367:bf59:6f99 with SMTP id
 98e67ed59e1d1-36951cb8825mr25386362a91.26.1779301347547; 
 Wed, 20 May 2026 11:22:27 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 19/64] target/arm: Implement FSCALE for AdvSIMD
Date: Wed, 20 May 2026 11:21:28 -0700
Message-ID: <20260520182213.872945-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
index 5c3f51eed3..b647399b18 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -349,6 +349,10 @@ float32 float32_famin(float32, float32, float_status *);
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
index dce5e0505e..7d403adfba 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -177,3 +177,19 @@ DO_3OP(gvec_famax_s, float32_famax, float32)
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


