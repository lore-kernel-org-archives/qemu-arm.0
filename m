Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46403CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcHy-0006ZR-7d; Tue, 02 Jun 2026 23:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHv-0006Wm-TA
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:03 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHt-0003Z8-1j
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:03 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c85825bbc4fso2593571a12.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457340; x=1781062140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDSEo7AlNyR3UZ/e5Dc4qcTeFTg+nzJ1GWgJ7fB21G8=;
 b=YS4K0TBdPX3Phix7YnFBcW3kKGv2ymMi4w6uiQOi1Ud2xkAsBWJqFcDjRXQ4OoJXu0
 AVt1NSHj+Xi1zVTU7Wtplq1xB8gvRqyPzRq4laNU3GuyM7snFb3aJdLrerjThufuL1kG
 EW841BCLbn10/FDqRpBzpnzFD3mlklf4/8iRRppgJcObIrC08y6Ufi6s2YyHo2G+wLVv
 W40723gFunutSZPSYZpIJ6lB/xSunTBsU1CY/2JD6h1826Rhpr+gkd76sj16htJ+oEGg
 O1UwuXpzfWBPHYwbDJOY7Jd29H4fPAji2lmCL2a3jVCA9z9hsMM5AOelMcVb1icdoCCu
 Q/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457340; x=1781062140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MDSEo7AlNyR3UZ/e5Dc4qcTeFTg+nzJ1GWgJ7fB21G8=;
 b=EahMtRnMM50cZoNeoSgbDd1Rz3WF45COgjS+Sv9NbmNTtkuHjmnn7tlyrei75x94za
 SL+5Bf1xtJPOQufp8W6u3V2GWJe/vqaQ2lLhGQzWrVo+eCFL/TF6mdaB6GnCYLAIOTGO
 OL7u6NgieuUEUnquf+9BAQ43aDb7wBosMJB6T3g1IDSt8QysyMX8jz31zxTOytkWlW/z
 R6pAfkC72IkpHfoZNcE2OvFi0Uvzrk3x+UNFYzMdhaSGj2ecdjxBHok6wiGE1YCja0id
 COwLqB1Gd+AAhQ76iQAcamBKbBx5lNkhB+90bqVsXkLycCmdrp0AbSjIyn6avtx0GYdO
 v+kw==
X-Gm-Message-State: AOJu0YzaCkMJ3fDwQ2APfDGgwcDJds67h0A1RGs3/4AIJmkHvoQ7r5wy
 Yq1TBhPm6LbacjNr0DO0h9JnKdFThNXxkIuqeltPTyVwKgCBv5IVFRc7mnTccUkeeus=
X-Gm-Gg: Acq92OG4vOVeykxIAmx+oEYcTZw2TlLzbotaaHLJ62aH1uontHE/Ky4AmJzV5Sgfl4w
 5ThErG0lYmvg5TE/EhqW8uGLiJ3uJKcJD7XjI7ZpKZKbBIF9gdt2V9YDniFzoQYEJYV3Y+fgQrt
 O/RU5oNSz7ernhgOrnNKXOaWApIuYPob2Soh3KOzuMQ1yw0WNJD2ktU2dWVF/CYwAPhe+MKHYcp
 CyuIDOY6cVpxd+6pu5HCeWcihyEXYFyngSOlCT9ocrAj5kWWCurTauU0eSPwrxewMcOsSgAW/Al
 2wOWVCCRxazuX5wdSsnpKynNdPO5QEEtr7xb5yqd6ot6bUb976nI9exQm3j1xcDRrA/V+DEiOt9
 BV9m6n2alWQafx/75EFA/TSxcoumff7NLctgNjHoBKlnTFZrzZhpb8sOr5h6hW2g0702oKFnUOF
 WSAzjvQIB+ZLaLg1wq8dVmdaqB2iTJS1azaKYA7Lc=
X-Received: by 2002:a05:6a00:883:b0:842:6ec3:2352 with SMTP id
 d2e1a72fcca58-84284dc02cfmr1568185b3a.18.1780457339462; 
 Tue, 02 Jun 2026 20:28:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:28:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 04/45] target/arm: Generalize TRANS_FEAT_STREAMING_SME2
Date: Tue,  2 Jun 2026 20:28:13 -0700
Message-ID: <20260603032855.106930-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Rename to TRANS_FEAT_STREAMING_IF and add a new parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  6 +++---
 target/arm/tcg/translate-sve.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d4bcc5bad4..beaffe914e 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -877,12 +877,12 @@ static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
 
 /*
  * For SVE insns which are only valid in Streaming SVE mode when
- * SME2 is implemented
+ * FEAT_STREAM is implemented.
  */
-#define TRANS_FEAT_STREAMING_SME2(NAME, FEAT, FUNC, ...)          \
+#define TRANS_FEAT_STREAMING_IF(NAME, FEAT, FEAT_STREAM, FUNC, ...) \
     static bool trans_##NAME(DisasContext *s, arg_##NAME *a)      \
     {                                                             \
-        s->is_nonstreaming = !dc_isar_feature(aa64_sme2, s);      \
+        s->is_nonstreaming = !dc_isar_feature(FEAT_STREAM, s);    \
         return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
     }
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index fb9d379184..997d6b0451 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4261,9 +4261,9 @@ static gen_helper_gvec_4_ptr * const sve2_famax_zpzz_fns[4] = {
     gen_helper_sve2_famax_s,
     gen_helper_sve2_famax_d
 };
-TRANS_FEAT_STREAMING_SME2(FAMAX, aa64_sme2_or_sve2_faminmax,
-                          gen_gvec_fpst_arg_zpzz,
-                          sve2_famax_zpzz_fns[a->esz], a)
+TRANS_FEAT_STREAMING_IF(FAMAX, aa64_sme2_or_sve2_faminmax, aa64_sme2,
+                        gen_gvec_fpst_arg_zpzz,
+                        sve2_famax_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve2_famin_zpzz_fns[4] = {
     NULL,
@@ -4271,9 +4271,9 @@ static gen_helper_gvec_4_ptr * const sve2_famin_zpzz_fns[4] = {
     gen_helper_sve2_famin_s,
     gen_helper_sve2_famin_d
 };
-TRANS_FEAT_STREAMING_SME2(FAMIN, aa64_sme2_or_sve2_faminmax,
-                          gen_gvec_fpst_arg_zpzz,
-                          sve2_famin_zpzz_fns[a->esz], a)
+TRANS_FEAT_STREAMING_IF(FAMIN, aa64_sme2_or_sve2_faminmax, aa64_sme2,
+                        gen_gvec_fpst_arg_zpzz,
+                        sve2_famin_zpzz_fns[a->esz], a)
 
 typedef void gen_helper_sve_fp2scalar(TCGv_ptr, TCGv_ptr, TCGv_ptr,
                                       TCGv_i64, TCGv_ptr, TCGv_i32);
-- 
2.43.0


