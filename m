Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07914EA7184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:17:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Ry-0008Ir-4I; Tue, 21 Apr 2026 01:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RV-00081O-40
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RS-0006Tq-6z
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2b24fdac394so36276295ad.3
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748472; x=1777353272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mdqYSYvyNpmf3YSAjo2AYikrIIkpiycHh+h6wUIhrr0=;
 b=xG10FSVJR394xNSPsUYPpjrK3dgDe5M8aWv/PCBZVfWY2/sjqgqS19IlelHUfNRqjx
 JnjGqReHCEZNt79+27WKTLi5aTbp715TWl+Y1dz70QS7JtbiwBe6XqtHHaPreKkVHse5
 bzj730NO7J1uZJeh1ELkGFOfLW4MHRpz9CbxFswAO3r2BoUGvZgEGjzwCLB3s/hnTTqe
 Z6U6z+mfmBCiUiVcaaPCgbSaVY6Mn7ovuK3lLRRMmGgSZdI/RrjTrgoXNNCAJgORagW9
 cOd+OliK0hN2NB3uFqGDWSvzemv+26x5WNMpV/DVfyJYGAyqryOMUMldBpbfB9cHCgTL
 CEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748472; x=1777353272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mdqYSYvyNpmf3YSAjo2AYikrIIkpiycHh+h6wUIhrr0=;
 b=Ud87r67g/UAuxgiPm5d3Gyi39yd0uUpsSwY4LRP+8D9dBn+44EViFwy5as676u+/yw
 6LWOZu2sp+Na9YktK2wKarA8F7DxzgNwxiCpdIOOttfuaA42cjrR91iPVZxgP3uTy+Tl
 9gc6bC45cZjJF7dRvKpnR3+3PpTXiKQXNTjmrhRNPiblJg6Y9gj57Hw8m36Z8FAtaFbT
 InJ+IFDZz2T8aFc2i2EPU1Ba1hqTxGIKjXjuoHtXQEof/vXO9hVmnyKAY38B5OhCruqo
 NN6Z98MqIm+XUXUOcC3hIGAanrgHoHVDHgoI3sz1JuPg8XcF87OmOqECHp7JVigvXedL
 d9ow==
X-Gm-Message-State: AOJu0YyDKGUuNW9fKECW+uNUQ7R11mmpteUTMZ3vAi7802Bw4yL6qXO2
 g+3v1FQt+Wh0HsAxBnl02k4PEvYOhqHBQt9bKGo2OZb6Inu3KEj5foOef2/S2vTBCFKuSBoojlR
 W92aRdXE=
X-Gm-Gg: AeBDieuqPDIRFR+i7/jN4EKURd9SMIWUi7NaQCAmsFY/0RZmTWERwbGB464xOuGT7/s
 ERzR3Wo6bXLPBhVpPzP9SYOxfH5J843j4D17ro2eLBn3E8xKz3IoJeuGMW3SO4SSmXpEWqeETlv
 HdouX0QQ9Ht8UWCXQFdfaa7H23w/DI3G5BW7TFHaVeR/pN7T2zxbokoRJ0hqTJfxTr1ITV6zD6t
 r8GRcSMx2eVHG6CGa89IbkF8catqRHFrdweZuUe6mKoUedJvSFbhKkJQP+PPpzDKSAuyXFLSAaf
 XdfRS97/+4LftszSZCfnw7nIuFdce3M/aEgQvky1uB+IhF9ahSEGfiJxQusvgZtIifJtkGfapaZ
 hiFWcg08kcVWbHK1h3uZnnNPRMyiD+s80wBctlIkyURLgTegX3nvyGz//627zJedCrO2V3gZXu5
 8HwmimlFAkABaASgGwtl/pcCh//FOevwsOr6/HbtWi
X-Received: by 2002:a17:903:987:b0:2b2:3dd9:c5f5 with SMTP id
 d9443c01a7336-2b5fa0044d9mr197243625ad.36.1776748472332; 
 Mon, 20 Apr 2026 22:14:32 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/37] target/arm: Implement FSCALE for AdvSIMD
Date: Tue, 21 Apr 2026 15:13:26 +1000
Message-ID: <20260421051346.41106-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
index eb270cf58b..08ba8a98a1 100644
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
index d132e051ca..515c0fb2e0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6495,6 +6495,13 @@ static gen_helper_gvec_3_ptr * const f_vector_famin[3] = {
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
index b5ad67b5e0..5479d98daf 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -175,3 +175,19 @@ DO_3OP(gvec_famax_s, float32_famax, float32)
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


