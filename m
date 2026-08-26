Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC43C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:42:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHdq-0008Si-BT; Wed, 26 Aug 2026 13:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdm-0008Ov-6E
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:22 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdj-0004jl-7D
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:21 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1592721b3a.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766138; x=1788370938; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tcz0wIfQo3DFtV2Oz7/bwwlzR8aHIEOhrSSeC4BTYes=;
 b=DTgfknpecyEoU+b7FgJBceIaYUO0u0vmLsmeBHjs3PFciRumaGfuzlSpBbvkGABg4A
 rVuvsPS2qO9aH98XtBmKIy0tM7IZry9HkTHcJW5xrXFqdl2oBT/4W8mws7VjqV83jaeZ
 9nYGF6r07cJ7K+6ocMzTWkC1U7KIy9jzjQCm4JXwBIaOhjl8vEhu+4nyLC8nGcozlC5n
 BR1LTjQdSlLQSDfvQhfCpTLK8X975OU781T++OGY3WVyL1poCSpErS900xz+mxe2OT79
 fGrZ+x9vF/QCTr7LW8gIdDD+SXxRmFOnPv8ypqtX9juk7S5Nqr+BM88EWhoY2+wXvYiX
 eSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766138; x=1788370938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tcz0wIfQo3DFtV2Oz7/bwwlzR8aHIEOhrSSeC4BTYes=;
 b=DMqB0jbdgs3C02MZLr0UgOYEcUkJTJsGjyv0R4pJY7C3sIjJLyKJ/YbQWOlqQwGbV8
 apKc5SSbqzsH+4TiBKE5sRiCDb2HudHnhniC+RbbMXJbOKuoZW1CEDRpY+h85v+fSDHc
 NVonAIjmoDarevXUpGv/mSoqd/X5+LG+znhlR72FXXDYpfC0J9iocxs7Oameu4IA4YSx
 EZkC2yWr9Waz5bh2uE/Vh79jaTQeyB9Mg5rSyxooJtbf3NHrO0SqBU0oS95V9w8mbrdq
 TfxdLSQd0wpfMtCfFiAtZrKsZEROKAZDSFUBiLxthTkT8K1lHz27v402ptDGWpuWsjGd
 5mbw==
X-Gm-Message-State: AFuF++kyF+wq/woG+CoyKhZo+ZmaJ+r8DNxh/Sz9CCtijXkkP5hG6e+w
 TAs887IVC4sdMQIIHQOj0FB0YWN3qXZuiF2GpN+7EKhE6JBp3zJnIds4yIxxq5YNrgY=
X-Gm-Gg: AR+sD11QXzcptJ8K+CEppHrqCuvov+aSdQ41TU/giCalMAWxxB5xsR46M50X3ldGAnx
 d7DyT52C49AJ+7rVTSqhwcUxQ/UhMPSx26Jndn9HDRd+yONyvBxrgrpTqkMAr9bSsEoSLtPELMt
 4XUP0eSbOFR3n34yZObnVsTgjlCt2XcRXmWnfE4a8Bw9rf6VKc96fsti9F2ZxNxsX0yOzekuezU
 rkH7BnYk3PfBsmXYVjPOyLTayEiBxbQy7tNdAEYDx51Hbmzl1UomEOYA+Uhv01vPbZpNqbLxZDn
 vF3kRKPLn3Vdt7+qeaY6dRxBY2RGahCWtFhp6YT7YMpFzCGmY4hp7PenN2nyH3nIc1jZFC9wHvn
 gllz2q2NF0c2SiUvgmyKX5Zm3DT0dzGaSF0FCabmIZfq9+RN6aaTJarKEASgVIfU7Ph1DEEAjRB
 BkD4UNt1OuT6Po/ynZhLsLB5QOELsFuT8Ji7J3BmgInvsJW4ozd8D4Glki9cm6yY3ykUJLFKxoL
 gcJltUMeGq00cCLLQ==
X-Received: by 2002:a05:6a00:1bc8:b0:845:31a6:d84d with SMTP id
 d2e1a72fcca58-85372b9f5a4mr15240254b3a.7.1787766137639; 
 Wed, 26 Aug 2026 10:42:17 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 01/25] target/arm: Split zdn in do_z2z_n1 and do_z2z_n1_fpst
Date: Wed, 26 Aug 2026 10:41:48 -0700
Message-ID: <20260826174213.614571-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Rename from z2z to zzz to indicate zd and zn may not overlap.
During decode, retain z2z name and duplicate the same field
into zd and zn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 71 +++++++++++++++++-----------------
 target/arm/tcg/sme.decode      |  8 ++--
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 768b76f01ec..e3b96914dad 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -659,31 +659,30 @@ TRANS_FEAT(BMOPA, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_bmopa_s)
 TRANS_FEAT(SMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_smopa2_s)
 TRANS_FEAT(UMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_umopa2_s)
 
-static bool do_z2z_n1(DisasContext *s, arg_z2z_en *a, GVecGen3Fn *fn)
+static bool do_zzz_n1(DisasContext *s, arg_zzz_en *a, GVecGen3Fn *fn)
 {
-    int esz, dn, vsz, mofs, n;
-    bool overlap = false;
+    int esz = a->esz, vsz, mofs;
+    int overlap = -1;
 
     if (!sme_sm_enabled_check(s)) {
         return true;
     }
 
-    esz = a->esz;
-    n = a->n;
-    dn = a->zdn;
     mofs = vec_full_reg_offset(s, a->zm);
     vsz = streaming_vec_reg_size(s);
 
-    for (int i = 0; i < n; i++) {
-        int dofs = vec_full_reg_offset(s, dn + i);
+    for (int i = 0, n = a->n; i < n; i++) {
+        int dofs = vec_full_reg_offset(s, a->zd + i);
+        int nofs = vec_full_reg_offset(s, a->zn + i);
         if (dofs == mofs) {
-            overlap = true;
+            overlap = i;
         } else {
-            fn(esz, dofs, dofs, mofs, vsz, vsz);
+            fn(esz, dofs, nofs, mofs, vsz, vsz);
         }
     }
-    if (overlap) {
-        fn(esz, mofs, mofs, mofs, vsz, vsz);
+    if (overlap >= 0) {
+        int nofs = vec_full_reg_offset(s, a->zn + overlap);
+        fn(esz, mofs, nofs, mofs, vsz, vsz);
     }
     return true;
 }
@@ -710,14 +709,14 @@ static void gen_sme2_urshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, 0, fns[vece]);
 }
 
-TRANS_FEAT(ADD_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_add)
-TRANS_FEAT(SMAX_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_smax)
-TRANS_FEAT(SMIN_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_smin)
-TRANS_FEAT(UMAX_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_umax)
-TRANS_FEAT(UMIN_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_umin)
-TRANS_FEAT(SRSHL_n1, aa64_sme2, do_z2z_n1, a, gen_sme2_srshl)
-TRANS_FEAT(URSHL_n1, aa64_sme2, do_z2z_n1, a, gen_sme2_urshl)
-TRANS_FEAT(SQDMULH_n1, aa64_sme2, do_z2z_n1, a, gen_gvec_sve2_sqdmulh)
+TRANS_FEAT(ADD_n1, aa64_sme2, do_zzz_n1, a, tcg_gen_gvec_add)
+TRANS_FEAT(SMAX_n1, aa64_sme2, do_zzz_n1, a, tcg_gen_gvec_smax)
+TRANS_FEAT(SMIN_n1, aa64_sme2, do_zzz_n1, a, tcg_gen_gvec_smin)
+TRANS_FEAT(UMAX_n1, aa64_sme2, do_zzz_n1, a, tcg_gen_gvec_umax)
+TRANS_FEAT(UMIN_n1, aa64_sme2, do_zzz_n1, a, tcg_gen_gvec_umin)
+TRANS_FEAT(SRSHL_n1, aa64_sme2, do_zzz_n1, a, gen_sme2_srshl)
+TRANS_FEAT(URSHL_n1, aa64_sme2, do_zzz_n1, a, gen_sme2_urshl)
+TRANS_FEAT(SQDMULH_n1, aa64_sme2, do_zzz_n1, a, gen_gvec_sve2_sqdmulh)
 
 static bool do_z2z_nn(DisasContext *s, arg_z2z_en *a, GVecGen3Fn *fn)
 {
@@ -750,11 +749,11 @@ TRANS_FEAT(SRSHL_nn, aa64_sme2, do_z2z_nn, a, gen_sme2_srshl)
 TRANS_FEAT(URSHL_nn, aa64_sme2, do_z2z_nn, a, gen_sme2_urshl)
 TRANS_FEAT(SQDMULH_nn, aa64_sme2, do_z2z_nn, a, gen_gvec_sve2_sqdmulh)
 
-static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
+static bool do_zzz_n1_fpst(DisasContext *s, arg_zzz_en *a,
                            gen_helper_gvec_3_ptr * const fns[4])
 {
-    int esz = a->esz, n, dn, vsz, mofs;
-    bool overlap = false;
+    int esz = a->esz, vsz, mofs;
+    int overlap = -1;
     gen_helper_gvec_3_ptr *fn = fns[esz];
     TCGv_ptr fpst;
 
@@ -770,21 +769,21 @@ static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
     }
 
     fpst = fpstatus_ptr(esz == MO_16 ? FPST_A64_F16 : FPST_A64);
-    n = a->n;
-    dn = a->zdn;
     mofs = vec_full_reg_offset(s, a->zm);
     vsz = streaming_vec_reg_size(s);
 
-    for (int i = 0; i < n; i++) {
-        int dofs = vec_full_reg_offset(s, dn + i);
+    for (int i = 0, n = a->n; i < n; i++) {
+        int dofs = vec_full_reg_offset(s, a->zd + i);
+        int nofs = vec_full_reg_offset(s, a->zn + i);
         if (dofs == mofs) {
-            overlap = true;
+            overlap = i;
         } else {
-            tcg_gen_gvec_3_ptr(dofs, dofs, mofs, fpst, vsz, vsz, 0, fn);
+            tcg_gen_gvec_3_ptr(dofs, nofs, mofs, fpst, vsz, vsz, 0, fn);
         }
     }
-    if (overlap) {
-        tcg_gen_gvec_3_ptr(mofs, mofs, mofs, fpst, vsz, vsz, 0, fn);
+    if (overlap >= 0) {
+        int nofs = vec_full_reg_offset(s, a->zn + overlap);
+        tcg_gen_gvec_3_ptr(mofs, nofs, mofs, fpst, vsz, vsz, 0, fn);
     }
     return true;
 }
@@ -831,7 +830,7 @@ static gen_helper_gvec_3_ptr * const f_vector_fmax[2][4] = {
       gen_helper_gvec_ah_fmax_s,
       gen_helper_gvec_ah_fmax_d },
 };
-TRANS_FEAT(FMAX_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmax[s->fpcr_ah])
+TRANS_FEAT(FMAX_n1, aa64_sme2, do_zzz_n1_fpst, a, f_vector_fmax[s->fpcr_ah])
 TRANS_FEAT(FMAX_nn, aa64_sme2, do_z2z_nn_fpst, a, f_vector_fmax[s->fpcr_ah])
 
 static gen_helper_gvec_3_ptr * const f_vector_fmin[2][4] = {
@@ -844,7 +843,7 @@ static gen_helper_gvec_3_ptr * const f_vector_fmin[2][4] = {
       gen_helper_gvec_ah_fmin_s,
       gen_helper_gvec_ah_fmin_d },
 };
-TRANS_FEAT(FMIN_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmin[s->fpcr_ah])
+TRANS_FEAT(FMIN_n1, aa64_sme2, do_zzz_n1_fpst, a, f_vector_fmin[s->fpcr_ah])
 TRANS_FEAT(FMIN_nn, aa64_sme2, do_z2z_nn_fpst, a, f_vector_fmin[s->fpcr_ah])
 
 static gen_helper_gvec_3_ptr * const f_vector_fmaxnm[4] = {
@@ -853,7 +852,7 @@ static gen_helper_gvec_3_ptr * const f_vector_fmaxnm[4] = {
     gen_helper_gvec_fmaxnum_s,
     gen_helper_gvec_fmaxnum_d,
 };
-TRANS_FEAT(FMAXNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmaxnm)
+TRANS_FEAT(FMAXNM_n1, aa64_sme2, do_zzz_n1_fpst, a, f_vector_fmaxnm)
 TRANS_FEAT(FMAXNM_nn, aa64_sme2, do_z2z_nn_fpst, a, f_vector_fmaxnm)
 
 static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
@@ -862,7 +861,7 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
     gen_helper_gvec_fminnum_s,
     gen_helper_gvec_fminnum_d,
 };
-TRANS_FEAT(FMINNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fminnm)
+TRANS_FEAT(FMINNM_n1, aa64_sme2, do_zzz_n1_fpst, a, f_vector_fminnm)
 TRANS_FEAT(FMINNM_nn, aa64_sme2, do_z2z_nn_fpst, a, f_vector_fminnm)
 
 static gen_helper_gvec_3_ptr * const f_vector_famax[4] = {
@@ -887,7 +886,7 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[4] = {
     gen_helper_gvec_fscale_s,
     gen_helper_gvec_fscale_d,
 };
-TRANS_FEAT(FSCALE_n1, aa64_sme2_f8cvt, do_z2z_n1_fpst, a, f_vector_fscale)
+TRANS_FEAT(FSCALE_n1, aa64_sme2_f8cvt, do_zzz_n1_fpst, a, f_vector_fscale)
 TRANS_FEAT(FSCALE_nn, aa64_sme2_f8cvt, do_z2z_nn_fpst, a, f_vector_fscale)
 
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index e8176fffdbf..30946330ffe 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -220,11 +220,13 @@ UMOPA2_s        1010000 1 10 0 ..... ... ... ..... . 10 ..      @op_32
 %zd_ax2         1:4 !function=times_2
 %zd_ax4         2:3 !function=times_4
 
+&zzz_en         zd zn zm esz n
 &z2z_en         zdn zm esz n
+
 @z2z_2x1        ....... . esz:2 .. zm:4 ....0. ..... .... . \
-                &z2z_en n=2 zdn=%zd_ax2
+                &zzz_en n=2 zd=%zd_ax2 zn=%zd_ax2
 @z2z_4x1        ....... . esz:2 .. zm:4 ....1. ..... ...0 . \
-                &z2z_en n=4 zdn=%zd_ax4
+                &zzz_en n=4 zd=%zd_ax4 zn=%zd_ax4
 
 SMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 0    @z2z_2x1
 SMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 0    @z2z_4x1
@@ -990,8 +992,6 @@ UZP_2           11000001 esz:2 1 zm:5 110100 zn:5 .... 1    \
 UZP_2           11000001 00    1 zm:5 110101 zn:5 .... 1    \
                 &zzz_e zd=%zd_ax2 esz=4
 
-&zzz_en         zd zn zm esz n
-
 FCLAMP          11000001 esz:2 1 zm:5 110000 zn:5 .... 0    \
                 &zzz_en zd=%zd_ax2 n=2
 FCLAMP          11000001 esz:2 1 zm:5 110010 zn:5 ...0 0    \
-- 
2.53.0


