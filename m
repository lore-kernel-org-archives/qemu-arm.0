Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9215CCD4F49
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:34:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPY-0007ml-BL; Sat, 16 May 2026 20:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOZ-00078l-Nh
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:17 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOU-0004mo-O4
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:14 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c7980c060cfso397089a12.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977806; x=1779582606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h37zckXYDzucFKJfi7Vv2YlpkD6qilhmC3tWvPQ5Lng=;
 b=Tkr9olVLaM3oYjb+75Oa9uMcFBZvxj6wrvMEYTdrS+lu6EuLcYjINuACLfkGjQZTMx
 jtjrwIpyvSiQf0SWoTDkftLRhPVbBDCe9wXE9t3zRu9gRxyC2LvMmqyyB/me5e4wDa7+
 UY2L3l5kR5ap3u7dhxC7Qfw2hR0UIWg2pQU6qvr6fBED1T/wxJrL2OhgLjy8GazHJSTA
 AuVVzgnJbSEZWD4MpukmVITe4JClLG9sfRnX6d5r6yg01oPYv5q2n4+ndNss5SK+z34s
 I6ITrwa9lfQeJ9byZdeZAOSv0mlf16nbTRkAIw6UDIEdodN/yvchi7/6zeFHVnBL455y
 utvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977806; x=1779582606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h37zckXYDzucFKJfi7Vv2YlpkD6qilhmC3tWvPQ5Lng=;
 b=dukS4jH/uqFAIOXBjinbzNQdJMpqyPMs8c7CvnLvSD0H8Kgbvnn+rfLRzYQmWr6r05
 31l/wa26Kc49vmObH1sUcHvZrGHlbroHAiPpZkWVufuuQUx6wqEwycewhvz33UbIoVsr
 h3gzff4edY6PHKLkXSYxxxxabKEVP5AvNftVqwsDPx+zVRnJFbmBWJD6EOLLFfsA17ki
 K3bcjBvJJyaayEcv2idsnmRHllXS15cNsx4zkab8RzU2+RjJB1AMWM+qSkwheltKv4nS
 tce+ADc1I3K+/ng4hkO1nax1RAF9u5T3REaeGUgbRzDZ4WQtUccIud8tXQV0RCJO/Pof
 mPnw==
X-Gm-Message-State: AOJu0Yx8MQivmDqqlwjovqUZNr/X4GLrLM6FTLuzwDEdOrxWEXd5JXa2
 DM+TIs0EgYgCMoO19n14CnfC/EyYGVFfqTK4TcEOFoq+2o2QGUwD2ElGEOh5Nq1oLgOh4YYys/L
 I7HEy
X-Gm-Gg: Acq92OEYh1SJtwJ5GtqQcgdGGJNRrTfmal3u1sfAebwb/n0S/NyxkOnxARgfHN2LHIO
 kMnNwytEBJgaC1kO0OdbnYD6oe9zHuMZ+gbotlQSUKg+QN4DRXXFfW5SGTtgR9sYYSsA5soltvw
 c7FRaEE6jj3qwQ1LyYF1E8KD9xDbmpOByBTBDyUi+GdYtxsGa0h/rsqlhdO3rywCerv6GN3BQNf
 bHSHtX0DaVUumREA+kQ67M4A5EpopI6G1WxxcWFaCINkGxVLLmsgFjz4FRW5e9e9oyxTKDcilXu
 nHQpcLkdBcre9J+GTbde2DJgfoirQ0x4WJNX+JZMiC0dAn3hfnfRUNEQlLbScIR/HInvFBN0fla
 FYMaSHRrrF6P4uTX0unAr/gLDYWcSwWzHL8s9TlUt8ac39UC9qKHuC7zNoG66ti/E1cu99lA8wI
 bNuIKgt3HBTpb0/eUdSspjvdGrhoPxgCWHZsFu0gg=
X-Received: by 2002:aa7:88cb:0:b0:837:b5b6:1b97 with SMTP id
 d2e1a72fcca58-83f33c24142mr10791609b3a.12.1778977806001; 
 Sat, 16 May 2026 17:30:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 04/63] target/arm: Implement FEAT_FAMINMAX for SME
Date: Sat, 16 May 2026 17:29:03 -0700
Message-ID: <20260517003002.321430-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
index 21a1f941dd..21b91b1503 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1593,6 +1593,11 @@ static inline bool isar_feature_aa64_sme2_f64f64(const ARMISARegisters *id)
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


