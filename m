Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp940681njk;
        Fri, 24 Jan 2025 08:52:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGZeligPjAYUXIsZ5R5IkSpHtRC0hh98AMesFhuqkf7zwbcdk1s02pQ083faRfvNclSdxJpWxHPdU4OA==@linaro.org
X-Google-Smtp-Source: AGHT+IHwuPlupCOPtSVA0CFhnzgcr/Edv4lReIbT8smbRQPpbMVqjSfaW3KT8WvMnnwKhDBxHbsd
X-Received: by 2002:a05:622a:1a9f:b0:46a:389d:17b1 with SMTP id d75a77b69052e-46e12a996ebmr405700581cf.26.1737737563508;
        Fri, 24 Jan 2025 08:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737563; cv=none;
        d=google.com; s=arc-20240605;
        b=Gadh5dX3g/ggnq11c+LwfubXAgdUj87fOK2hA6fPvLdaA5gkmPq+dbAePkV5Myp41Y
         kpDACyiShJDTsXkNwwjraXBRXd7P9dFkg64aUKlRi50xEvRM+ajZVNJvu5qtENS5tyRi
         vqlnURv46mLhZVoei3et9cFy7pb1U3BvROy133l0iIVRRRcvh1+Ner7W4bgK16Oefmd5
         TBBOlPSksGHU2diGrFb/9cAkEsB6pBiQQw4YIp4AmBWuXjIxYdTFiZYlxpBqyO8APWvh
         TmTBos17sqCyGbAITMlLPDUNb0ZORp1XiCO+HGesMep1xPXBWRwYvC31nGpTFOmCNclV
         FAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OvRLjmTLeMLqpQAceAkdSOX3ePjKfhM6kYjWkG/iUUU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=D3OX8COj3lJsMdPdXDytGEFQLJnmSGQ7PKgcO72+N8ZCaXnKl8iMGUEws4pRmQ0FuM
         PySc5bRKh2AJu4bd7izzw+ShW0Rbx6v6p1X085KabGeAxl7K4MT6LOtbfMq5fulutQTU
         ip5AKw7tLcMWRExKhfbl9aijQMiFw1S1OB05BDPtKqWJcy68U7NXcE8yP9SeWP3TGZ7q
         htNkkOA4pCE1iJWs5RuDkcFEYMPpqXugiFVmSFDw6KDPdvUE/IWa+HeJsSwZ24iL9Zvz
         fjFpPkNLqFx4biX9tq3AIruk8O8rbgk45xbZpg2uJg+2VMleXGqzjHZok4/8zedBF9QX
         +3ZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P+rI1Ti9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205364b4csi26516886d6.142.2025.01.24.08.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P+rI1Ti9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMh4-0007US-9Y; Fri, 24 Jan 2025 11:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZh-0006BC-Nr
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZY-0005qs-FV
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso15854185e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736205; x=1738341005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OvRLjmTLeMLqpQAceAkdSOX3ePjKfhM6kYjWkG/iUUU=;
 b=P+rI1Ti9a+RvGvo5jfvgqHdwfrWKvI5TxnOtZsPaycGksyQhtNe05V3HAgkJq58oDw
 ITfmQwTyj8zC7m6BSg7TK2U0U3nxEvI+7j09PSrQv7AfsQjbxCzcFnnF5zzQs7fJE22T
 O+NfakfIhvgNPnZ1P2FdacywrEvTjOqbyaOS0HKwZ/BOwQrndqyDQ1CeAdpannn6zmja
 9AFcBOHiOwHevkBcLLVUWHdoICeh7jKuiLROObalWq7INMR4+9E/nq6W1xNtN53eQJ/S
 wdTnQrnSKoDCyOMW3xknjMwaIEqAW4kLLMKg8wFfZopFHDiWwC4gTiojNUOH4HirCOXj
 1SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736205; x=1738341005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvRLjmTLeMLqpQAceAkdSOX3ePjKfhM6kYjWkG/iUUU=;
 b=V3imvpm7Zdb79A8wRRrhowEuuIh1y6ijwfjIeNFFf6hTGtDU38V9MZPP85qCUygD7K
 b30hDmLMkG1T2MZwX2mzBoJxhDR7eiykKsYYv/bdJLcPh2bTT5M+nRtHXhUwVYJmqxKE
 Fogo4267sHyathclDo2z963pgL/4rQV9km3BsFR3C/cO1bQaSgW3hFPoxTUIjLIqblnz
 lQlB5yOCdtb9/UHONXS1B1b7EdrMAyYRalXxNN88xEydVzOsyfI2hvJN0Vy7UJ+rTr74
 DgLNf0PfQ7EgvWQzMTfEEOPB7xQdaGuoMox0ubK6ReXwooidb40YaXZIF8cP1unwHxLL
 WUng==
X-Gm-Message-State: AOJu0YzPqxvFxaT/hZhCNgiOLz6sNzGLFhrpH0CGER7hEsXjMyBBXnuU
 rX7hwNMw86NkB0pOsuiTaLfje2zMCQ8ZVFIkCYq0r8mON7dQsGp2Mv2jHOoPQpv94jYGM8aOHgq
 Z
X-Gm-Gg: ASbGncs4K6A1FAHzY5XS8kMzftR3K2/MdLmdHpt9jt7ZQk7biaTQYOmxDmsHejlq5pj
 ZXZEFKjFn6oDsBoht2tlX08xPtMXESIsVFWPt2ZT0uYxfoBaNKmAKP65Jv/X4GQHvaPQOrriPrg
 wG2qc/QozA3C9TYyKy4TCEPFtsrI8Yp19sbDhm1n9jNJ27qQqq6NZstvYyssomAQ2wJDqZiTDy+
 dfBuMNk/GCghi1qWpOhkkKdi5KhE+ealVqWC2/UcUf9qKelKoDcKe0HRJW80XvUTK23dgWDqOXv
 6Qj/oH54cwfmX7/ESKZkYw==
X-Received: by 2002:a05:600c:3d97:b0:436:f960:3427 with SMTP id
 5b1f17b1804b1-4389142745amr264698565e9.22.1737736205502; 
 Fri, 24 Jan 2025 08:30:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 69/76] target/arm: Plumb FEAT_RPRES frecpe and frsqrte through
 to new helper
Date: Fri, 24 Jan 2025 16:28:29 +0000
Message-Id: <20250124162836.2332150-70-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YTc/qVQeD9/L

FEAT_RPRES implements an "increased precision" variant of the single
precision FRECPE and FRSQRTE instructions from an 8 bit to a 12
bit mantissa. This applies only when FPCR.AH == 1. Note that the
halfprec and double versions of these insns retain the 8 bit
precision regardless.

In this commit we add all the plumbing to make these instructions
call a new helper function when the increased-precision is in
effect. In the following commit we will provide the actual change
in behaviour in the helpers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h      |  5 +++++
 target/arm/helper.h            |  4 ++++
 target/arm/tcg/translate-a64.c | 34 ++++++++++++++++++++++++++++++----
 target/arm/tcg/translate-sve.c | 16 ++++++++++++++--
 target/arm/tcg/vec_helper.c    |  2 ++
 target/arm/vfp_helper.c        | 32 ++++++++++++++++++++++++++++++--
 6 files changed, 85 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7bf24c506b3..525e4cee12f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -597,6 +597,11 @@ static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, MOPS);
 }
 
+static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, RPRES);
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0a8b4c946e1..dbad1f5d741 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -245,9 +245,11 @@ DEF_HELPER_4(vfp_muladdh, f16, f16, f16, f16, fpst)
 
 DEF_HELPER_FLAGS_2(recpe_f16, TCG_CALL_NO_RWG, f16, f16, fpst)
 DEF_HELPER_FLAGS_2(recpe_f32, TCG_CALL_NO_RWG, f32, f32, fpst)
+DEF_HELPER_FLAGS_2(recpe_rpres_f32, TCG_CALL_NO_RWG, f32, f32, fpst)
 DEF_HELPER_FLAGS_2(recpe_f64, TCG_CALL_NO_RWG, f64, f64, fpst)
 DEF_HELPER_FLAGS_2(rsqrte_f16, TCG_CALL_NO_RWG, f16, f16, fpst)
 DEF_HELPER_FLAGS_2(rsqrte_f32, TCG_CALL_NO_RWG, f32, f32, fpst)
+DEF_HELPER_FLAGS_2(rsqrte_rpres_f32, TCG_CALL_NO_RWG, f32, f32, fpst)
 DEF_HELPER_FLAGS_2(rsqrte_f64, TCG_CALL_NO_RWG, f64, f64, fpst)
 DEF_HELPER_FLAGS_1(recpe_u32, TCG_CALL_NO_RWG, i32, i32)
 DEF_HELPER_FLAGS_1(rsqrte_u32, TCG_CALL_NO_RWG, i32, i32)
@@ -680,10 +682,12 @@ DEF_HELPER_FLAGS_4(gvec_vrintx_s, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_4(gvec_frecpe_h, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(gvec_frecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(gvec_frecpe_rpres_s, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(gvec_frecpe_d, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_4(gvec_frsqrte_h, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(gvec_frsqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_4(gvec_frsqrte_rpres_s, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(gvec_frsqrte_d, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_4(gvec_fcgt0_h, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0b57e35f999..3e2fe46464f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8909,7 +8909,14 @@ static const FPScalar1 f_scalar_frecpe = {
     gen_helper_recpe_f32,
     gen_helper_recpe_f64,
 };
-TRANS(FRECPE_s, do_fp1_scalar_ah, a, &f_scalar_frecpe, -1)
+static const FPScalar1 f_scalar_frecpe_rpres = {
+    gen_helper_recpe_f16,
+    gen_helper_recpe_rpres_f32,
+    gen_helper_recpe_f64,
+};
+TRANS(FRECPE_s, do_fp1_scalar_ah, a,
+      s->fpcr_ah && dc_isar_feature(aa64_rpres, s) ?
+      &f_scalar_frecpe_rpres : &f_scalar_frecpe, -1)
 
 static const FPScalar1 f_scalar_frecpx = {
     gen_helper_frecpx_f16,
@@ -8923,7 +8930,14 @@ static const FPScalar1 f_scalar_frsqrte = {
     gen_helper_rsqrte_f32,
     gen_helper_rsqrte_f64,
 };
-TRANS(FRSQRTE_s, do_fp1_scalar_ah, a, &f_scalar_frsqrte, -1)
+static const FPScalar1 f_scalar_frsqrte_rpres = {
+    gen_helper_rsqrte_f16,
+    gen_helper_rsqrte_rpres_f32,
+    gen_helper_rsqrte_f64,
+};
+TRANS(FRSQRTE_s, do_fp1_scalar_ah, a,
+      s->fpcr_ah && dc_isar_feature(aa64_rpres, s) ?
+      &f_scalar_frsqrte_rpres : &f_scalar_frsqrte, -1)
 
 static bool trans_FCVT_s_ds(DisasContext *s, arg_rr *a)
 {
@@ -9954,14 +9968,26 @@ static gen_helper_gvec_2_ptr * const f_frecpe[] = {
     gen_helper_gvec_frecpe_s,
     gen_helper_gvec_frecpe_d,
 };
-TRANS(FRECPE_v, do_gvec_op2_ah_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frecpe)
+static gen_helper_gvec_2_ptr * const f_frecpe_rpres[] = {
+    gen_helper_gvec_frecpe_h,
+    gen_helper_gvec_frecpe_rpres_s,
+    gen_helper_gvec_frecpe_d,
+};
+TRANS(FRECPE_v, do_gvec_op2_ah_fpst, a->esz, a->q, a->rd, a->rn, 0,
+      s->fpcr_ah && dc_isar_feature(aa64_rpres, s) ? f_frecpe_rpres : f_frecpe)
 
 static gen_helper_gvec_2_ptr * const f_frsqrte[] = {
     gen_helper_gvec_frsqrte_h,
     gen_helper_gvec_frsqrte_s,
     gen_helper_gvec_frsqrte_d,
 };
-TRANS(FRSQRTE_v, do_gvec_op2_ah_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frsqrte)
+static gen_helper_gvec_2_ptr * const f_frsqrte_rpres[] = {
+    gen_helper_gvec_frsqrte_h,
+    gen_helper_gvec_frsqrte_rpres_s,
+    gen_helper_gvec_frsqrte_d,
+};
+TRANS(FRSQRTE_v, do_gvec_op2_ah_fpst, a->esz, a->q, a->rd, a->rn, 0,
+      s->fpcr_ah && dc_isar_feature(aa64_rpres, s) ? f_frsqrte_rpres : f_frsqrte)
 
 static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 26bdda8f96e..454f7ff9008 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3626,13 +3626,25 @@ static gen_helper_gvec_2_ptr * const frecpe_fns[] = {
     NULL,                     gen_helper_gvec_frecpe_h,
     gen_helper_gvec_frecpe_s, gen_helper_gvec_frecpe_d,
 };
-TRANS_FEAT(FRECPE, aa64_sve, gen_gvec_fpst_ah_arg_zz, frecpe_fns[a->esz], a, 0)
+static gen_helper_gvec_2_ptr * const frecpe_rpres_fns[] = {
+    NULL,                           gen_helper_gvec_frecpe_h,
+    gen_helper_gvec_frecpe_rpres_s, gen_helper_gvec_frecpe_d,
+};
+TRANS_FEAT(FRECPE, aa64_sve, gen_gvec_fpst_ah_arg_zz,
+           s->fpcr_ah && dc_isar_feature(aa64_rpres, s) ?
+           frecpe_rpres_fns[a->esz] : frecpe_fns[a->esz], a, 0)
 
 static gen_helper_gvec_2_ptr * const frsqrte_fns[] = {
     NULL,                      gen_helper_gvec_frsqrte_h,
     gen_helper_gvec_frsqrte_s, gen_helper_gvec_frsqrte_d,
 };
-TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_ah_arg_zz, frsqrte_fns[a->esz], a, 0)
+static gen_helper_gvec_2_ptr * const frsqrte_rpres_fns[] = {
+    NULL,                            gen_helper_gvec_frsqrte_h,
+    gen_helper_gvec_frsqrte_rpres_s, gen_helper_gvec_frsqrte_d,
+};
+TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_ah_arg_zz,
+           s->fpcr_ah && dc_isar_feature(aa64_rpres, s) ?
+           frsqrte_rpres_fns[a->esz] : frsqrte_fns[a->esz], a, 0)
 
 /*
  *** SVE Floating Point Compare with Zero Group
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index c720b435d58..b369c9f45b3 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1237,10 +1237,12 @@ void HELPER(NAME)(void *vd, void *vn, float_status *stat, uint32_t desc)  \
 
 DO_2OP(gvec_frecpe_h, helper_recpe_f16, float16)
 DO_2OP(gvec_frecpe_s, helper_recpe_f32, float32)
+DO_2OP(gvec_frecpe_rpres_s, helper_recpe_rpres_f32, float32)
 DO_2OP(gvec_frecpe_d, helper_recpe_f64, float64)
 
 DO_2OP(gvec_frsqrte_h, helper_rsqrte_f16, float16)
 DO_2OP(gvec_frsqrte_s, helper_rsqrte_f32, float32)
+DO_2OP(gvec_frsqrte_rpres_s, helper_rsqrte_rpres_f32, float32)
 DO_2OP(gvec_frsqrte_d, helper_rsqrte_f64, float64)
 
 DO_2OP(gvec_vrintx_h, float16_round_to_int, float16)
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 50a8a659577..1b7ecc14621 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -839,7 +839,11 @@ uint32_t HELPER(recpe_f16)(uint32_t input, float_status *fpst)
     return make_float16(f16_val);
 }
 
-float32 HELPER(recpe_f32)(float32 input, float_status *fpst)
+/*
+ * FEAT_RPRES means the f32 FRECPE has an "increased precision" variant
+ * which is used when FPCR.AH == 1.
+ */
+static float32 do_recpe_f32(float32 input, float_status *fpst, bool rpres)
 {
     float32 f32 = float32_squash_input_denormal(input, fpst);
     uint32_t f32_val = float32_val(f32);
@@ -888,6 +892,16 @@ float32 HELPER(recpe_f32)(float32 input, float_status *fpst)
     return make_float32(f32_val);
 }
 
+float32 HELPER(recpe_f32)(float32 input, float_status *fpst)
+{
+    return do_recpe_f32(input, fpst, false);
+}
+
+float32 HELPER(recpe_rpres_f32)(float32 input, float_status *fpst)
+{
+    return do_recpe_f32(input, fpst, true);
+}
+
 float64 HELPER(recpe_f64)(float64 input, float_status *fpst)
 {
     float64 f64 = float64_squash_input_denormal(input, fpst);
@@ -1033,7 +1047,11 @@ uint32_t HELPER(rsqrte_f16)(uint32_t input, float_status *s)
     return make_float16(val);
 }
 
-float32 HELPER(rsqrte_f32)(float32 input, float_status *s)
+/*
+ * FEAT_RPRES means the f32 FRSQRTE has an "increased precision" variant
+ * which is used when FPCR.AH == 1.
+ */
+static float32 do_rsqrte_f32(float32 input, float_status *s, bool rpres)
 {
     float32 f32 = float32_squash_input_denormal(input, s);
     uint32_t val = float32_val(f32);
@@ -1078,6 +1096,16 @@ float32 HELPER(rsqrte_f32)(float32 input, float_status *s)
     return make_float32(val);
 }
 
+float32 HELPER(rsqrte_f32)(float32 input, float_status *s)
+{
+    return do_rsqrte_f32(input, s, false);
+}
+
+float32 HELPER(rsqrte_rpres_f32)(float32 input, float_status *s)
+{
+    return do_rsqrte_f32(input, s, true);
+}
+
 float64 HELPER(rsqrte_f64)(float64 input, float_status *s)
 {
     float64 f64 = float64_squash_input_denormal(input, s);
-- 
2.34.1

