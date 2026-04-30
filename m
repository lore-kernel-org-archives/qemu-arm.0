Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA28FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9M-0006Ji-Ek; Wed, 29 Apr 2026 20:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9K-0006IM-4O
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:02 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9I-00068W-75
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82f431c0ab6so189391b3a.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508459; x=1778113259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4YvroQ+OX1f6mxsnmADZcQbu7faHJd4ipBsXfUGJ1g8=;
 b=Y5UEW88NcsolbicbcZDAnZFOMJM9E5Mu080yZeALGdVa/9mq14vsKBRSh48KxrtF7n
 J8hhmtZIQnInLvocs+sPVpUNWDiS45PjwWsJh2rSTmEcrziInujSEAb0hN8mWGtMIXRJ
 mutpaNtk+62FeqH11IrqPl56gJcaTaDBNnkrHHUT2vN81V/OibxDO1z6jZ0HWW91o6x4
 IYKlh7gS7v79F/5mbo09fCPN+PdDRHMWCS7OlzhXNMf3xenVXoi8AbHHvsIcdqwrpSiR
 tsLpaL2CP4J2VGqxCqKP9JKMteY/dEK4su69n2lgpL2GJ19FBX3CDRlaQ8kIpZFFQ5BT
 yIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508459; x=1778113259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4YvroQ+OX1f6mxsnmADZcQbu7faHJd4ipBsXfUGJ1g8=;
 b=YELOdv7rsLSPXcm1FY7A5DtuO6putP+FRTi1fPtyL0NIBBkNHYRJ6kQHO+lNCaiLy9
 lWXo0E1/J0Qr8kbND0Tgta0IX2fIq8t3tOgv2FLAHR4RyRMlUz8arqnfxmMEDAflIWBF
 vgFzcg92CAi1rm0ThGHnXw8PW3WEaMlam5kecAjo6VR0Ht826+uC0muJTQYOy0lxBsCw
 +9R1FLgplGkZM+xpT85XMj6kbHcqBzwCIO4p6/cR+RgX790dOm2emqn6CKh3a3DugALc
 Yw/NaTvBwf6RloNCamedPYyGuLOIl8T3ZVg6uVDl2eAqhkn3SVcsc/pKdmm1ps2+7+GR
 gMNg==
X-Gm-Message-State: AOJu0Ywt2Jx/a8e4QhMIxk/8QHNnLd75v3KAiZ78ZixN5w6V42pZDyGJ
 5X3ArF843Ds1BG5eAvQcijw9094+fokqEtNVLBHwxA79RBCZUWScJtaslao1wlV3GScXVEfD7og
 6BON+1NE=
X-Gm-Gg: AeBDievutUQr08p8+McYgzskwpOR+of8zW9KGJB5DfzOo1WtU4jCw8HQWka7HTdq5nI
 GIGB+1lMf2bQNnNNu7m5nLNN6dDo/ydS/9MVJodGQ6es/qraVdfiVzHlzKlKGpIr0G75qno5ugg
 Iu3eBCWZ9A6FxLauFq1fCF1Rax4N3ThHph/g6xmUZ7R3yQxGEH12NqhyFIGPba9Dx+r6Zh3CtBf
 8+zSCVySnsvPRjBeGx2b4OH5fgwZrG9qeJ7D/TSFw5k/f5jy7XA/9kwXH7gCOXs5+cHkBdSbslK
 PeYBSy4tdyJqOgP84QaIhOw+65pKBRfzYXpM++NkC8IVzc70tHBaoUiJz1w94dKuTCA5GwmJppK
 hyUBDZ4itBvMrCIHTfH17ba26xi4q9HlrrQchZzhvg2fVf0OJ+StfTw0fvR4ptaE8wQZSUDtHD8
 kbloLsjmTC8GNJfEdHLRsnpAArH5ohTzQSOooMy5g6
X-Received: by 2002:a05:6a00:2d85:b0:829:8c23:f70e with SMTP id
 d2e1a72fcca58-834fdd5e0cdmr845409b3a.45.1777508458781; 
 Wed, 29 Apr 2026 17:20:58 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:20:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 03/47] target/arm: Implement FEAT_FAMINMAX for SME
Date: Thu, 30 Apr 2026 10:20:02 +1000
Message-ID: <20260430002046.59739-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
index f84b451626..e297bc0a0e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1579,6 +1579,11 @@ static inline bool isar_feature_aa64_sme2_f64f64(const ARMISARegisters *id)
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
index 08254b088e..a67501226f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "helper-a64.h"
 #include "helper-sme.h"
 #include "helper-sve.h"
 #include "translate.h"
@@ -742,9 +743,12 @@ static bool do_z2z_nn_fpst(DisasContext *s, arg_z2z_en *a,
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
@@ -753,7 +757,6 @@ static bool do_z2z_nn_fpst(DisasContext *s, arg_z2z_en *a,
     }
 
     fpst = fpstatus_ptr(esz == MO_16 ? FPST_A64_F16 : FPST_A64);
-    fn = fns[esz];
     n = a->n;
     dn = a->zdn;
     dm = a->zm;
@@ -812,6 +815,22 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
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


