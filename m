Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB289C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:49:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFVs-0001Qd-U8; Tue, 21 Jul 2026 14:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUi-00010k-2d
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:11 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUc-0006bB-7t
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38df94d4dd8so6118837a91.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659621; x=1785264421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f1MyR0YlBgtED+/qnozxNwnJtMJGl7ehLr6zJ+FuVuk=;
 b=yt1rS4+SHPQPuLab/bPSS0M5Jo0sKC2WQGjbtE6O+cR2jPx32E+kKVA3MQ/Meu6GIN
 XhN+syG+74SUcr8150KGfiCAR03PJR68R5UA2/HM4ynrpwJFPW1JVQWe/gDqkl3EvTLz
 kbeihPJ3zrCCQbnnh9yU0O5xqaZAg3/ie9gd2c2795IkJiu7iyleQpBd5tEPENr8bpNv
 kjdSQ0r0PdqB8PDkBtjVK92qOreMxmLLSH5lvJQwwBVutwQrXIxTGUkOXYRBmOLW8tIM
 AA0XNDeR02SLRFeDtCwLz+9Lq3StQR6rMtGpxZSfn9GMdV0fMkeCfCPAhXQ5UvF2bxp2
 SnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659621; x=1785264421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=f1MyR0YlBgtED+/qnozxNwnJtMJGl7ehLr6zJ+FuVuk=;
 b=KYvZmcLlquI1w5Q3gGMzBIItY9Tsa89qZ4ZT4ZEP5YsgMLtdGZ8UUNrYrgPC4dx6oi
 KkIAv/pjel1Or7hYHGmYkIXGac1mWjKaFI5sQ028nfvMB8lPzuotJaVBkduRbPmm9yWb
 5o3YxdZIRcEkCPOyY8COR5Isq7HzDM7Bqz3nnuXnVI8WtaW3MJS7O43//lWrR/1uMOze
 pM7t4SSYXvzPe0d8NZj6Xz4WV9XewWyjXssu8iyCb6jpYSWqV5fkRnvV+BloQC+hFvKs
 ERLMwFg+NKYGnTbIU6UfWXFxz4RowSzsA9Rc/+1SpPs2dpyPcC49NCtVEanJ/4y7/AAt
 1Y2A==
X-Gm-Message-State: AOJu0Yy1SJ5qqN0xQgxYZxq0mVEEx25zn5hmbvBEjpGj9jJUiebm4Ohp
 ywvl/3ANLy0BgZMAJJpTnl4LYw/pFrNCnzBFkuzTRPswDnQ8BZeIu6iZwtGRMa+6jHk=
X-Gm-Gg: AR+sD13GrFXkKVHmDFoFqU6wVjsCEh0+wbUK5OfFkuNl/Jz9r3ptItEe5Gpq/lt9E+6
 x7fWbO/1E3Dz9+7slOZvfxjQlmnTVUN+PBxzQXCbRW1NAtvRE592iRkakCQMiCru4ZUrUKJ95Jo
 9sKpy3d/uzAO6oI0i++El4g/VQyApzzzG2V2slH1hjbzPUQs8q+tdGu27CZAY5/9ZnwkAc1C/Wb
 CeKS+3aUfOuqoazp1q4MZLUj2zroeyA7DtQAITMWL5aaBZ2RNVPoj4LYrti9cfNru3rlSeLQK2v
 WysgUvcSXQ1a2H7JEK8cymw0esBSLyIqSAM+BKZI8U+GligAE56hpPHZls78Ou5p07YhnRtxi+9
 i+easdj4NbprnamzFzK7pzZurU1beQhRFktJZImCpep1VYaJTpj0CmXD58WO4YS1aj5421fByGk
 NHE6bhsJE=
X-Received: by 2002:a17:90b:534d:b0:37f:a915:1c29 with SMTP id
 98e67ed59e1d1-38e4b42ebd6mr20136533a91.19.1784659620660; 
 Tue, 21 Jul 2026 11:47:00 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/20] target/arm: Remove DO_ZPZZ_FP from translate-sme.c
Date: Tue, 21 Jul 2026 11:46:37 -0700
Message-ID: <20260721184656.530230-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Expand the macro at each use site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 67 +++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index fc4cc8c479..ff6032a07f 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4415,13 +4415,6 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
  *** SVE Floating Point Arithmetic - Predicated Group
  */
 
-#define DO_ZPZZ_FP(NAME, FEAT, name) \
-    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = { \
-        NULL,                  gen_helper_##name##_h,           \
-        gen_helper_##name##_s, gen_helper_##name##_d            \
-    };                                                          \
-    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
-
 #define DO_ZPZZ_AH_FP(NAME, FEAT, name, ah_name)                        \
     static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
         NULL,                  gen_helper_##name##_h,                   \
@@ -4464,9 +4457,33 @@ DO_ZPZZ_AH_FP_B16(FMAX_zpzz, aa64_sme_or_sve, sve_fmax, sve_ah_fmax)
 DO_ZPZZ_FP_B16(FMINNM_zpzz, aa64_sme_or_sve, sve_fminnum)
 DO_ZPZZ_FP_B16(FMAXNM_zpzz, aa64_sme_or_sve, sve_fmaxnum)
 DO_ZPZZ_AH_FP(FABD, aa64_sme_or_sve, sve_fabd, sve_ah_fabd)
-DO_ZPZZ_FP(FSCALE, aa64_sme_or_sve, sve_fscalbn)
-DO_ZPZZ_FP(FDIV, aa64_sme_or_sve, sve_fdiv)
-DO_ZPZZ_FP(FMULX, aa64_sme_or_sve, sve_fmulx)
+
+static gen_helper_gvec_4_ptr * const sve_fscalbn_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve_fscalbn_h,
+    gen_helper_sve_fscalbn_s,
+    gen_helper_sve_fscalbn_d,
+};
+TRANS_FEAT(FSCALE, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fscalbn_zpzz_fns[a->esz], a)
+
+static gen_helper_gvec_4_ptr * const sve_fdiv_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve_fdiv_h,
+    gen_helper_sve_fdiv_s,
+    gen_helper_sve_fdiv_d,
+};
+TRANS_FEAT(FDIV, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fdiv_zpzz_fns[a->esz], a)
+
+static gen_helper_gvec_4_ptr * const sve_fmulx_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve_fmulx_h,
+    gen_helper_sve_fmulx_s,
+    gen_helper_sve_fmulx_d,
+};
+TRANS_FEAT(FMULX, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fmulx_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve2_famax_zpzz_fns[4] = {
     NULL,
@@ -8057,9 +8074,33 @@ TRANS_FEAT_NONSTREAMING(HISTCNT, aa64_sve2, gen_gvec_ool_arg_zpzz,
 TRANS_FEAT_NONSTREAMING(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
                         a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
 
-DO_ZPZZ_FP(FADDP, aa64_sme_or_sve2, sve2_faddp_zpzz)
-DO_ZPZZ_FP(FMAXNMP, aa64_sme_or_sve2, sve2_fmaxnmp_zpzz)
-DO_ZPZZ_FP(FMINNMP, aa64_sme_or_sve2, sve2_fminnmp_zpzz)
+static gen_helper_gvec_4_ptr * const sve_faddp_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve2_faddp_zpzz_h,
+    gen_helper_sve2_faddp_zpzz_s,
+    gen_helper_sve2_faddp_zpzz_d,
+};
+TRANS_FEAT(FADDP, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpzz,
+           sve_faddp_zpzz_fns[a->esz], a)
+
+static gen_helper_gvec_4_ptr * const sve_fmaxnmp_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve2_fmaxnmp_zpzz_h,
+    gen_helper_sve2_fmaxnmp_zpzz_s,
+    gen_helper_sve2_fmaxnmp_zpzz_d,
+};
+TRANS_FEAT(FMAXNMP, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpzz,
+           sve_fmaxnmp_zpzz_fns[a->esz], a)
+
+static gen_helper_gvec_4_ptr * const sve_fminnmp_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve2_fminnmp_zpzz_h,
+    gen_helper_sve2_fminnmp_zpzz_s,
+    gen_helper_sve2_fminnmp_zpzz_d,
+};
+TRANS_FEAT(FMINNMP, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpzz,
+           sve_fminnmp_zpzz_fns[a->esz], a)
+
 DO_ZPZZ_AH_FP(FMAXP, aa64_sme_or_sve2, sve2_fmaxp_zpzz, sve2_ah_fmaxp_zpzz)
 DO_ZPZZ_AH_FP(FMINP, aa64_sme_or_sve2, sve2_fminp_zpzz, sve2_ah_fminp_zpzz)
 
-- 
2.43.0


