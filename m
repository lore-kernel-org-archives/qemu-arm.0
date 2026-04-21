Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8538DEA7184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Rv-0008GP-6U; Tue, 21 Apr 2026 01:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Qx-0007vn-Jg
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:04 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Qv-0006KW-DR
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2b458ca2296so25980665ad.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748439; x=1777353239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdQBWzWrlCQOyL6REc2mM0GoH8jWUoG58/2k/M4dy88=;
 b=fE1medAYgFDAA2CglfSu7jqjxeeaROtwXGyI/iee/ORo8LvGkrwjCLe5ox3S6oI/Zz
 ey6X/2Dan/+Iu6pgFq+Rkza4jbXlheUyp4Fyug+44gPq84WuT/rPRBGelIeaAVJJa5fX
 6Zj8FMA4Zuev4QsTtoqQX91RnPhMQydyCbkECv84Fa9cZJgfDN99V1+ayYPd1jVuimS5
 6CWIwfLJjX/L84hTyCDzDVpDizWG5ras06P0SoDJELTeQX1rVUI3T4O028TD9zFXYIHl
 hkCLllHk1AzMyAQfk9blOPe6u80/6m2jOoPdRUE836E26TYFPxu0YPJfr4KvrKL0vbMt
 pfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748439; x=1777353239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qdQBWzWrlCQOyL6REc2mM0GoH8jWUoG58/2k/M4dy88=;
 b=asupe3/HKm+LRSb4zIQI7LDMUR3LDrvw/bhVqXEiZV2qzk7V74AprIsALo+Q75yrbl
 b3gB0ZlF1+TDwuy5KgHaLFzCshbQKycBd33Y1qSuAyOLsMxjUmfc9Fxms33KZ47ETGpA
 QAJa8RKfcl26LR1vlU8lyrYsj8VBOM1deA8mHcdPJgFGbd85C5flQdXnlnsAh+5uSfsk
 uIZYACxm3S1byVS5XWg/YyZoHeO6ghZr6nAtuL6jFdYrPIsPiPEX4UlqHG+b9Hqzozlm
 1idTOjbmPtdrdHGJ6hXzBrqsIanV9H6tGKnlT5fkGev8dBpXaMGoLJ04jlgD/MdIq5GJ
 j/vQ==
X-Gm-Message-State: AOJu0YyAFeRGT94Kw1aOSpMqkUhzgivpZ7zZjnlJq3dYvqcAe1eNM1d/
 UdS+T6R6gYXeOdfgVUoVZ1dzkY8Z/9Um5GRHHghtQyKwnyt2Dh9D3e4qeWTdJEBfkMM=
X-Gm-Gg: AeBDievXe4VLzPhhcBNM4zeWpK6PX03Z8qaUZ7OtuwXgEZfDHn7LXNzWeP8LRGzNeTc
 UDPcwwy6Y1YETk+J20nTjbGtiGtcBJF4IeqxfHS0nbWyIN8E9IOct/bZozl4K0ClMD8sGwYWEB6
 NVJEFr9PQpeqc0UzL0qryZEAnSj63EjoSVzg4hwh8T6nmzCSLsGYgSW99VFXaPdb+n6AFi6K7RP
 ENHXUeTip+r2je0VIUXo9Q4EDuajl431UcpPHZR0QNWW7ouCdFHzmQn0qDSKlo9aToc8Rir7DDR
 sQPM9OacFIIKES8o8lth8h0lyY40ALOOiIX3adVjMWr2vVahYKTF6xB3xzk+0LvGPDrXMo/Rb9n
 KHQ8r2d5we8uYDdi6tOIATYSBSoGt8zIOLKYdcuAI8DhCKelFOEuuGEBoCB4BFoMFdC91xCHieJ
 E+vW6YUMXWo2cZKyIdtnOGyt0lNMwAjsxsP9HPFDvTSwRSs2SN7To=
X-Received: by 2002:a17:903:166e:b0:2b0:a957:304 with SMTP id
 d9443c01a7336-2b5f9e85b42mr178861405ad.6.1776748439179; 
 Mon, 20 Apr 2026 22:13:59 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:13:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/37] target/arm: Implement FEAT_FAMINMAX for SME
Date: Tue, 21 Apr 2026 15:13:12 +1000
Message-ID: <20260421051346.41106-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


