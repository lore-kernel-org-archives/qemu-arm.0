Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1B8CD98C9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:26:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX23D-000499-M3; Tue, 09 Jun 2026 15:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21C-0003Cb-BT
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:21:58 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX20t-0003zs-DZ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:21:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-36baec934b6so3909149a91.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032874; x=1781637674; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVjmzdyr5Lm6lgVp2HxXwqT/cVK11tOws/vdOSgu1Mg=;
 b=nnSj6WRduA9Ydh66/gVZtZznGi3hELQ+au8hIBaoEixVOdPEak5ls5Tf8lK1fz4m6I
 dBe+MaqIA9HaDRu+ivL5QB033bBzk86G2rdA16+Yxy4hgleKSUcY+lTZwQkjNlGmxiGL
 MC2EZGuturPltHVPgpp6U6JE7kEm2SFEu/Ypn032rwzVnvqL7myu+mzNa5rX2SviP+0Y
 C6mW9eXR8jCyEAOQvcgo+JyOay3jdnX8+DAu6yWE831NlwErKzuRBm78jUlWp7qcLQ+6
 la3oN5V+hNzJpW+0Jb2IRUmhV0q0zsGE5bXA98a0qGDg2quawkjbiNOx4YkGLkt+GSxW
 vQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032874; x=1781637674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xVjmzdyr5Lm6lgVp2HxXwqT/cVK11tOws/vdOSgu1Mg=;
 b=pT7hqqe3MA8zymFXAg/YapjIRo9W3RDSvQWKAh3tK9Rtl0+JEYsdOSQE2feilYy1vZ
 4RyHi+Ui0OoXO0/ll/mazuUIOeZWXJUn2n1YBzYEr1M+3aCcRWYi7ecHO1+rNsn8d3iI
 EIIc2RlVuEVBEG5AW52bxPgrKZPsl/RrxX1SQ61AragPs71lcFkgVFP5xmTjUcbB8r/9
 EGiz52mL1gFJTE333cypmneu4dAajBx2TZgdRaaApyhZUPgF5ckGy8WO9+jqrptNSDCM
 eFVjz3VGz42iv74OxtxDKi962pe8NYHbPaNpdI0QHHjm85TGEf1/qur3IaYM9AqIM9Ww
 VpTw==
X-Gm-Message-State: AOJu0YzENQPUBcfIlpRPoQVDIWLtsAvd+RI9W1h2xMNj/ypBhXxU/JeA
 1SVlJt7bgj1238Hhurw0JW1y1bjXse8Sc6JtD0NNVOY4ULHpoV/S38+JPFhN/QuiN3iyLYwLFRJ
 8PdqVk80=
X-Gm-Gg: Acq92OEOH7SP32JoAqvh8UK3nupFX4oYyuad770JYNLveIV3vknMbCM/3lcMLXOYtk2
 fJxoBKwx3hUy63IQQJgD6yFdhi6lNT0WLOU15HuGraqAP7eUjO0eM0NY/zo4UUvamB8/4ZqdWTe
 I72BOMeRs6XISHi81IJ94iFGMJobqORSl+yPgIKapGeZjDhVZ/baTBGIb5nr123yAJPdYMfGfLJ
 vk90GxDESjNV56w8mdeoUCkpRJGGZBoBW/qCspz2PQ/xM3oowuAuEhZcS6V+y/tLHgiqp9p8m/e
 Cu6p6Tb2NBQl64VUrVj3aQ7GweBn9QFmBKITjIzAqohl1OYySlPm3EWODjCxBQF9bFUKEZE/D9P
 suR9t6x9+tdA351jNWL+W0O3VKpcnIzjtCD13Rv5dn38G4oIXHFG0cce6JkZPnPjUqMLqZkUVai
 4WyFLkxCZEzO+Y129geTG3g5+qnumlZd6ca6YOvN8=
X-Received: by 2002:a17:903:1b6c:b0:2ba:6601:8e3d with SMTP id
 d9443c01a7336-2c1ec513601mr183184395ad.9.1781032874135; 
 Tue, 09 Jun 2026 12:21:14 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 04/45] target/arm: Generalize TRANS_FEAT_STREAMING_SME2
Date: Tue,  9 Jun 2026 12:20:28 -0700
Message-ID: <20260609192110.752384-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
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

Rename to TRANS_FEAT_STREAMING_IF and add a new parameter.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


