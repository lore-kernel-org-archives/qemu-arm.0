Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D893DF588C9
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3S0-0008L3-Tc; Tue, 21 Apr 2026 01:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rb-00082u-Dd
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:45 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RU-0006VC-KY
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:38 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-c76c60c7502so1751636a12.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748475; x=1777353275; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7V3cChxtG3x49nUgjSHcR9O7ZWwgxyibx9DFKFeEU6A=;
 b=vDdYnR2WQde9ryZWc2xdipl0CyYUhb0kdmUJHGlltcg91rVhJUWKGb0dhvrmdVIK/0
 ljwozi30gAvfimv3C5QOp2pMP46cwHwgukaEm91ezsy4/tKBlCcwqlb1H9vL71oMdRGx
 VDtYhHd4LuuZekplJjtRiganx6qS6udVVAhkTwpLCF/J3yWl3vZfeQgL/XCz2kzBpgjQ
 7S4ndjF0S+SR9aiLW6UmN2gXR4gBYL4IOdKt2ly5Nlv7W7/KcXbpx30DVCG4/aD7xsSJ
 ho5Y7Yn56uav2Y5kKa0TvGEuWTcEzQ86Fph14DaivHUBc44dHdmkO1h77rS3InVcyAln
 uDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748475; x=1777353275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7V3cChxtG3x49nUgjSHcR9O7ZWwgxyibx9DFKFeEU6A=;
 b=OQ++RMZ0QV9rUavnoe58YwNsMtIME4/MTnE2mqYJY+gG3T43vtbIKcDK1Tvix6Q8Bp
 OGCabh+/mAbLQdZ5wO4Wsnap2HEitdQzjDFmISNna1uiU5ecS5X2Mn8thTuNT17cnMwp
 az1K3cUpk89Jz5G2LiE5s0m4dZkWTXOuoN35dJHvHEyN7kOQStJkmcQwzdfOMi28uWv7
 xRkYylo9f85SeqhwRkONaLEgR267URh+Mocf4GkClv9WsfqOcPgeMeczQDGFxdlxIUAz
 qNY1pH+Tv1KZXyqVaZeVXLKg0i76pWddEFmotwhRQkCA1e5duLwkUxm0AezTfXs7tOxc
 3S2g==
X-Gm-Message-State: AOJu0Yw8ss/VIjWank0aolJkD8nSydIv5WpNU+IMbBjl2zyiTFpml8Xf
 8SugYeujqiKETOl/JTjcqRFm/T8NEDiJSOp8JPxZYzxWaEsZXVkWJ9F6pZAyn2fDa2oD5WZQKV4
 JPCmzNIs=
X-Gm-Gg: AeBDiespTn38cgCr249pQDSdgUX3qQI1i8dAIZcwB9Arkk1N/BtRZ9P/rFAoeavDSny
 bnGBFAriI0kTLn0SzjYgXRVp+6lUBgsehRQMu2NTxtOLFwzLdnv7TZDdMhhVmoGw+NlwxSq/3sY
 2IyTOAxDTx5fx0LK/fkiGGFPVQrgqNchwNH3Qe1hQp5BhWLQMT8oCksiPkBl04WWODZ2Q0aKWRD
 IDnNiwyN8yh2yQAbicLJb6pKsLfO8xtsSnZX5U877JmMUvba9nnFQEcoemV+nENeP0xVq3Yi5Tt
 ovHw7OHd0kQCriDiYYjD8KAtW3x2I6pyn4Q8vcy0kSwHCvYZ82Zkt8GyvesvDkXC/uUnKJCvM+M
 exSjWop8zvArZK4OfsTNQhck3OCrvpNQLYJAj+WolPsoSOr+k1uOFF57+gXvreyIAWnT/hrasV8
 2FJiSFMT/63DJpM18G2YiYRlIi82FgRP3vzKU2agB1
X-Received: by 2002:a17:903:1aaf:b0:2b2:4fc1:f653 with SMTP id
 d9443c01a7336-2b5f9da4c95mr140202665ad.3.1776748474700; 
 Mon, 20 Apr 2026 22:14:34 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 18/37] target/arm: Implement FSCALE for SME
Date: Tue, 21 Apr 2026 15:13:27 +1000
Message-ID: <20260421051346.41106-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sme.c | 15 +++++++++++++--
 target/arm/tcg/sme.decode      |  6 ++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 87d16b57dd..8a6e5d555b 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1603,6 +1603,11 @@ static inline bool isar_feature_aa64_sme2_faminmax(const ARMISARegisters *id)
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_faminmax(id);
 }
 
+static inline bool isar_feature_aa64_sme2_f8cvt(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_f8cvt(id);
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_i8mm(id);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index ca6b130cfe..c6a8eec32c 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -706,9 +706,12 @@ static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
 {
     int esz = a->esz, n, dn, vsz, mofs;
     bool overlap = false;
-    gen_helper_gvec_3_ptr *fn;
+    gen_helper_gvec_3_ptr *fn = fns[esz];
     TCGv_ptr fpst;
 
+    if (fn == NULL) {
+        return false;
+    }
     /* These insns use MO_8 to encode BFloat16. */
     if (esz == MO_8 && !dc_isar_feature(aa64_sme_b16b16, s)) {
         return false;
@@ -718,7 +721,6 @@ static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
     }
 
     fpst = fpstatus_ptr(esz == MO_16 ? FPST_A64_F16 : FPST_A64);
-    fn = fns[esz];
     n = a->n;
     dn = a->zdn;
     mofs = vec_full_reg_offset(s, a->zm);
@@ -830,6 +832,15 @@ static gen_helper_gvec_3_ptr * const f_vector_famin[4] = {
 };
 TRANS_FEAT(FAMIN_nn, aa64_sme2_faminmax, do_z2z_nn_fpst, a, f_vector_famin)
 
+static gen_helper_gvec_3_ptr * const f_vector_fscale[4] = {
+    NULL,
+    gen_helper_gvec_fscale_h,
+    gen_helper_gvec_fscale_s,
+    gen_helper_gvec_fscale_d,
+};
+TRANS_FEAT(FSCALE_n1, aa64_sme2_f8cvt, do_z2z_n1_fpst, a, f_vector_fscale)
+TRANS_FEAT(FSCALE_nn, aa64_sme2_f8cvt, do_z2z_nn_fpst, a, f_vector_fscale)
+
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
                       GVecGen3FnVar *fn)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 9dec7318a4..ee874be1a6 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -250,6 +250,9 @@ ADD_n1         1100000 1 .. 10 .... 1010.0 11000 .... 0    @z2z_4x1
 SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_2x1
 SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
 
+FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_2x1
+FSCALE_n1      1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
+
 ### SME2 Multi-vector Multiple Vectors SVE Destructive
 
 %zm_ax2         17:4 !function=times_2
@@ -291,6 +294,9 @@ FAMAX_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 0    @z2z_4x4
 FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_2x2
 FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
 
+FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_2x2
+FSCALE_nn      1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
+
 ### SME2 Multi-vector Multiple and Single Array Vectors
 
 &azz_n          n off rv zn zm
-- 
2.43.0


