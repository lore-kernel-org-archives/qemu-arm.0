Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A54FB44A5
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:31:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Bm-0005kx-1k; Fri, 24 Apr 2026 00:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Bj-0005gI-UP
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:48 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Be-0002XW-It
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:47 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-42321c8b8f5so6146891fac.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005038; x=1777609838; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdQBWzWrlCQOyL6REc2mM0GoH8jWUoG58/2k/M4dy88=;
 b=CRMk5ZXob1Q76iOJU3ZI8aVrdcCor0ebzKV2kSmhM+D9AST8VnGfO6F9gzLXAzC0rx
 Fzv80ZNU9BQisWIIuYRE4QtK737J+1re65+z0cf3oxtW20fJ1NaqugP4uV7pDor75n65
 mAdxWheziHU75d0R7QKwDKUxF/It75JPAk/WjnEfBQngAGV59UygTv0yiyOyTcG19Yh9
 JQZYHlY0dsQ5C0RXyByZl/sRtWcoRGGpg0yJOBuWt3h+sXrtVYi7xRQznvP1d0oJ0UCe
 ldrg13etKp0Z+FRvcselMGOg2cPB6VmyDq1N7eneYdAVqNObvrOmFgTJyYCclcUZP4hs
 JHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005038; x=1777609838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qdQBWzWrlCQOyL6REc2mM0GoH8jWUoG58/2k/M4dy88=;
 b=pUPH5bLj0hS2t70uOQKhEC4v/YItSRXp1Bvyk7EtLKjpTqmXvacAcfJqwMyTqGgoM8
 NuPLqL6i495VzJ4CWxCZJlVKbrEEyEwFRqRLn7sp94w5YSh0U1uom+R90yXAJQul5zVD
 tZapoUXTw88Nv7oTq0JvMB4DuZ0cj+OmiTELKPai7eHkkgtLKUelubNWc2InRQ2iJq+Z
 M750RLMTK97ERWXw1yvTF+GV08bJ0wFGOfoHOQip5hp3db9v0FWQLPXR9/xaJ4A/feZf
 xwJenmdSxf7J723rTr7Q9IpUfqND4uBO6iArbHOJ61NNaZ82TgSI6ZUT2FLqFXV9he/e
 thDQ==
X-Gm-Message-State: AOJu0Ywleebyi7PEC1ND8A9AmA9dlsE/EZ2M/IzJcpBTuwFzFQhYO+Nx
 CHt5voOcXtYCpg+0S30aCz/nhspiNTQs2O6Ct1G+EmTPJnICZ5foNCDlNhGwNkvyy4I=
X-Gm-Gg: AeBDietwsY4z8Ki7UbqzmIJtJiNhvVJQs5eCPy16egVb26aoqrSTavqAOxSy+UMHygL
 5MclZBNvwcPkPFBkOz234k5NxdayIcsC37z9RIm3h0ewIH+dLjGxOxpf+9DrvdW2qj1FL24mTTe
 zdiNq8yOL1RsFVz9Ri//lmyGQ4/1INTuwyxs5PrLQ44feu1wb0oGePpGq9FR+jXZizif8UZpn8o
 g2Lt5eZSESDFBBpma/JDMlQf7AkVVI88wFDfWaSisU2rKM6dTD7y/H5LmYkcTzV+XfqDronbMvr
 QhuzXGWAc33/D6U5BDwN34pK9GPGCy5p24C79DFvMQGaWpRkETxDLy9XvufYPFjgeeAB8fwyTcE
 +Zd8dYDANcgv1rlEgINHXRm/SkR3+YTD0sRGUlyFhgkQ9PtfumE4lcC044tEG/re2yrX49Xpf8u
 RpJtIdfNu9bWxf4h57ScandnZvPwLWHMyaaDCWTr3m5Otl/uUAOEnvhUM10lJmzg==
X-Received: by 2002:a05:6870:9f04:b0:423:3af4:de45 with SMTP id
 586e51a60fabf-42aa3000168mr17110089fac.26.1777005037683; 
 Thu, 23 Apr 2026 21:30:37 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:30:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 03/40] target/arm: Implement FEAT_FAMINMAX for SME
Date: Fri, 24 Apr 2026 14:29:37 +1000
Message-ID: <20260424043014.46305-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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

Since there is no bfloat16 variant of FAMINMAX,
check for missing function pointer in do_z2z_nn_fpst.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sme.c | 23 +++++++++++++++++++++--
 target/arm/tcg/sme.decode      |  5 +++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7c96b26788..a2ce38faa3 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1574,6 +1574,11 @@ static inline bool isar_feature_aa64_sme2_f64f64(const ARMISARegisters *id)
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_sme_f64f64(id);
 }
 
+static inline bool isar_feature_aa64_sme2_faminmax(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_faminmax(id);
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_i8mm(id);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7d25ac5a51..ca6b130cfe 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "helper-a64.h"
 #include "helper-sme.h"
 #include "helper-sve.h"
 #include "translate.h"
@@ -741,9 +742,12 @@ static bool do_z2z_nn_fpst(DisasContext *s, arg_z2z_en *a,
                            gen_helper_gvec_3_ptr * const fns[4])
 {
     int esz = a->esz, n, dn, dm, vsz;
-    gen_helper_gvec_3_ptr *fn;
+    gen_helper_gvec_3_ptr *fn = fns[esz];
     TCGv_ptr fpst;
 
+    if (fn == NULL) {
+        return false;
+    }
     if (esz == MO_8 && !dc_isar_feature(aa64_sme_b16b16, s)) {
         return false;
     }
@@ -752,7 +756,6 @@ static bool do_z2z_nn_fpst(DisasContext *s, arg_z2z_en *a,
     }
 
     fpst = fpstatus_ptr(esz == MO_16 ? FPST_A64_F16 : FPST_A64);
-    fn = fns[esz];
     n = a->n;
     dn = a->zdn;
     dm = a->zm;
@@ -811,6 +814,22 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
 TRANS_FEAT(FMINNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fminnm)
 TRANS_FEAT(FMINNM_nn, aa64_sme2, do_z2z_nn_fpst, a, f_vector_fminnm)
 
+static gen_helper_gvec_3_ptr * const f_vector_famax[4] = {
+    NULL,
+    gen_helper_gvec_famax_h,
+    gen_helper_gvec_famax_s,
+    gen_helper_gvec_famax_d,
+};
+TRANS_FEAT(FAMAX_nn, aa64_sme2_faminmax, do_z2z_nn_fpst, a, f_vector_famax)
+
+static gen_helper_gvec_3_ptr * const f_vector_famin[4] = {
+    NULL,
+    gen_helper_gvec_famin_h,
+    gen_helper_gvec_famin_s,
+    gen_helper_gvec_famin_d,
+};
+TRANS_FEAT(FAMIN_nn, aa64_sme2_faminmax, do_z2z_nn_fpst, a, f_vector_famin)
+
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
                       GVecGen3FnVar *fn)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 6bb9aa2a90..9dec7318a4 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -286,6 +286,11 @@ URSHL_nn       1100000 1 .. 1 ..... 1011.0 10001 .... 1    @z2z_4x4
 SQDMULH_nn     1100000 1 .. 1 ..... 1011.1 00000 .... 0    @z2z_2x2
 SQDMULH_nn     1100000 1 .. 1 ..... 1011.1 00000 .... 0    @z2z_4x4
 
+FAMAX_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 0    @z2z_2x2
+FAMAX_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 0    @z2z_4x4
+FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_2x2
+FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
+
 ### SME2 Multi-vector Multiple and Single Array Vectors
 
 &azz_n          n off rv zn zm
-- 
2.43.0


