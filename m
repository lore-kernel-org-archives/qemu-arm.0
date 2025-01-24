Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp932504njk;
        Fri, 24 Jan 2025 08:38:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXQQqKyJWwpv3jhpvDPEI3bmzVDvt0Uc0KavpY4DP16Gn9A+ntx9Gj1D0m9jnH3U+2lmeiA9H7veTF3g==@linaro.org
X-Google-Smtp-Source: AGHT+IGDF0CvMwAXJB5J/unoS9VwNqSmy5qlH+kDlXaiKmTGLUSvH9R+XN7Wf9Md2WLwbr4T1fb0
X-Received: by 2002:a05:6102:6c8:b0:4b1:16f8:efc4 with SMTP id ada2fe7eead31-4b690be6e30mr26928909137.12.1737736717941;
        Fri, 24 Jan 2025 08:38:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736717; cv=none;
        d=google.com; s=arc-20240605;
        b=I78J0lRjJidGpGN1okO2P55+WaxyBAPofPAaCKqZ3NEusO8O1EmTy0+O4pIbaShKnZ
         XYIq2yXUInXK3pfvgNKPuwuNxf4qSKt76dbRe7Un3RDyr9UpwXmCGGw616BA+pAHKDIr
         5dQVb6kdS2aCYLeKIlHWHrj6sqvNERgaEBiUrJXPH7F1v2BF+5R+o1LzuGfD0b7A3jAv
         JKosjDDiJVV8KUx6gSB+QFbEaaa37NgoFil+h4qsDUN6doTuHKoUWJ92XqmadHoTfxfX
         IILJQAtGfTMi8jkdxsUFsJpAXaLPF/0Ke2QVDyk/83fS0WaSsxQZF1QwCZeknOaZkye3
         GWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X6N3L7NtFa1YnMZAHkrZh5oUiZiJF+Z8u0edD1E7tQY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Nkti/WW3uoAtdQaSPru0aZ1yrdrL1OoI66MW5cC2XSUjhZVh8/UiHnxsAmxjHqWbxC
         G4mtWPb02M16rJlKiv5N0VlEko/FfKIcWtoJNLHTxCGB/qUHByxlveCbjnAlrJo1aTjD
         2DCgXvmI9YXfwZxw4kG7ECU5a2SFmx81SnHtBKkRiHE7JwHEalDdIjiEe64oDuvoBBWZ
         Fr4B4FRmULu8UW4fJtMNkXc1bHc5z/81kkUZQvJVFA38Tn9rJU8MyGUvF84qX2GYDxhz
         d7OxbFnoK0VITKADweypPFswdRkkBDSYmKtoN+eJ6gTvxtJNjy+vNmpc2dDzFdbDVKpi
         Jr/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZ8NJYD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7099834f4si864923137.221.2025.01.24.08.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:38:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZ8NJYD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMc7-0004Wm-2l; Fri, 24 Jan 2025 11:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ1-0005jB-UP
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:51 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYy-0005j2-Su
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso15851655e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736183; x=1738340983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X6N3L7NtFa1YnMZAHkrZh5oUiZiJF+Z8u0edD1E7tQY=;
 b=YZ8NJYD0t23fvRbR7pNNocpO9BoyB+mlZKCWHidIhk0icP07MbbwoTPRIpxY+iADTZ
 bcF7jSE1bv+4ljGWq/A72niCNgte7XWoG1id/talpsmNayU41BNsP62U02bTD6sR/EIu
 KRntLWUp7cWAkxB5uRRt4bD79wo0JHGSyxL47dIR6SHv0DjqBWDD/LWp0s5Y5yqR1BZr
 LF+/tGBF6NEbHtDvYAbDIYHXN+9MOa5szRC86zj1+2zUOVgqKjOynf9aAweLMrSourvR
 17d3eComRiKg3L8V4Vn9veGOEbmXPCr5zecS6Rngpi7vMdGQasEmJLcBrfg62NQNDSEw
 DE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736183; x=1738340983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6N3L7NtFa1YnMZAHkrZh5oUiZiJF+Z8u0edD1E7tQY=;
 b=jfthWb9EgEdoQ9Hnx9HBRzFzSDIixEV8zwEIb/R+7LPZIms0IcSmL+oULo1uP9F5XG
 AO3hZlAYIh8LLADRtx+WddMn7PUVaR3Avb3vrPIEdn0X3iuNmtvTY0OSNN1lmAReWwrX
 +SGQAzujK51i/kje5FFESHpnAOcpXPCJm67MmeoYVUzA9r3urJsFlx3eF+qNVD7BPzTk
 fJPPglm0V/xLbZgscA1VenqXafVIZ1efWqDCe4sELWW7q2FIDpN+qNi/2SmKKr2OV54u
 +HuSN+51cVMeijuZNCiYWLOeFGlg91lqJDyV5azGVz2if+Ih/0BdFtfXK9EKeiAlWQKM
 2xVA==
X-Gm-Message-State: AOJu0YzpfG0F9qhcUpOHcKn07vjBaj1JLIN6oMVsUEA4623Rff4/XfRP
 HdQwhNYIUhQJKqdpZCB7xqVOXnJm2k+R72O5JfFldw8nQXgHRYCAdymyj7Ge5c2cfG/ZKciF4R4
 H
X-Gm-Gg: ASbGncuJxY/IuYAz72bBLEcKxq/irav6q9mUjrTKIKqFXRFlCDgt4dI6zvAV8LLPOHB
 3Y7vJyUvQLdmDL4f7ST7kmYJoejldy1mgLurqBIa0sVnTeL0C4vi3UvQ7K+IjroFdAJz1hBzpUh
 kafi0TRUvV+buvIO+ZB9aisEI1hER2jhlFY0HWAvwRqE8NCsuonj2McsbMuZiE4F8m4ssKM8I2C
 u3F7dN+PLSXjddE3ybvH+vCPrFNUcjyklu3sI+OgrWOjrZPw2Da3Fi1iz7agWHEmQNBk+ebBx+1
 ZTpEPF7Wbi0=
X-Received: by 2002:a05:600c:3d97:b0:436:f960:3427 with SMTP id
 5b1f17b1804b1-4389142745amr264687805e9.22.1737736183482; 
 Fri, 24 Jan 2025 08:29:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 52/76] target/arm: Implement FPCR.AH handling of negation of
 NaN
Date: Fri, 24 Jan 2025 16:28:12 +0000
Message-Id: <20250124162836.2332150-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: xzyZMFeE9TNh

FPCR.AH == 1 mandates that negation of a NaN value should not flip
its sign bit.  This means we can no longer use gen_vfp_neg*()
everywhere but must instead generate slightly more complex code when
FPCR.AH is set.

Make this change for the scalar FNEG and for those places in
translate-a64.c which were previously directly calling
gen_vfp_neg*().

This change in semantics also affects any other instruction whose
pseudocode calls FPNeg(); in following commits we extend this
change to the other affected instructions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 125 ++++++++++++++++++++++++++++++---
 1 file changed, 114 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9d164b80c22..085b29ee536 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -839,6 +839,74 @@ static void gen_gvec_op4_fpst(DisasContext *s, bool is_q, int rd, int rn,
                        is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
 }
 
+/*
+ * When FPCR.AH == 1, NEG and ABS do not flip the sign bit of a NaN.
+ * These functions implement
+ *   d = floatN_is_any_nan(s) ? s : floatN_chs(s)
+ * which for float32 is
+ *   d = (s & ~(1 << 31)) > 0x7f800000UL) ? s : (s ^ (1 << 31))
+ * and similarly for the other float sizes.
+ */
+static void gen_vfp_ah_negh(TCGv_i32 d, TCGv_i32 s)
+{
+    TCGv_i32 abs_s = tcg_temp_new_i32(), chs_s = tcg_temp_new_i32();
+
+    gen_vfp_negh(chs_s, s);
+    gen_vfp_absh(abs_s, s);
+    tcg_gen_movcond_i32(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i32(0x7c00),
+                        s, chs_s);
+}
+
+static void gen_vfp_ah_negs(TCGv_i32 d, TCGv_i32 s)
+{
+    TCGv_i32 abs_s = tcg_temp_new_i32(), chs_s = tcg_temp_new_i32();
+
+    gen_vfp_negs(chs_s, s);
+    gen_vfp_abss(abs_s, s);
+    tcg_gen_movcond_i32(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i32(0x7f800000UL),
+                        s, chs_s);
+}
+
+static void gen_vfp_ah_negd(TCGv_i64 d, TCGv_i64 s)
+{
+    TCGv_i64 abs_s = tcg_temp_new_i64(), chs_s = tcg_temp_new_i64();
+
+    gen_vfp_negd(chs_s, s);
+    gen_vfp_absd(abs_s, s);
+    tcg_gen_movcond_i64(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i64(0x7ff0000000000000ULL),
+                        s, chs_s);
+}
+
+static void gen_vfp_maybe_ah_negh(DisasContext *dc, TCGv_i32 d, TCGv_i32 s)
+{
+    if (dc->fpcr_ah) {
+        gen_vfp_ah_negh(d, s);
+    } else {
+        gen_vfp_negh(d, s);
+    }
+}
+
+static void gen_vfp_maybe_ah_negs(DisasContext *dc, TCGv_i32 d, TCGv_i32 s)
+{
+    if (dc->fpcr_ah) {
+        gen_vfp_ah_negs(d, s);
+    } else {
+        gen_vfp_negs(d, s);
+    }
+}
+
+static void gen_vfp_maybe_ah_negd(DisasContext *dc, TCGv_i64 d, TCGv_i64 s)
+{
+    if (dc->fpcr_ah) {
+        gen_vfp_ah_negd(d, s);
+    } else {
+        gen_vfp_negd(d, s);
+    }
+}
+
 /* Set ZF and NF based on a 64 bit result. This is alas fiddlier
  * than the 32 bit equivalent.
  */
@@ -5252,12 +5320,35 @@ static void gen_fnmul_d(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_ptr s)
     gen_vfp_negd(d, d);
 }
 
+static void gen_fnmul_ah_h(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_mulh(d, n, m, s);
+    gen_vfp_ah_negh(d, d);
+}
+
+static void gen_fnmul_ah_s(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_muls(d, n, m, s);
+    gen_vfp_ah_negs(d, d);
+}
+
+static void gen_fnmul_ah_d(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_ptr s)
+{
+    gen_helper_vfp_muld(d, n, m, s);
+    gen_vfp_ah_negd(d, d);
+}
+
 static const FPScalar f_scalar_fnmul = {
     gen_fnmul_h,
     gen_fnmul_s,
     gen_fnmul_d,
 };
-TRANS(FNMUL_s, do_fp3_scalar, a, &f_scalar_fnmul, a->rn)
+static const FPScalar f_scalar_ah_fnmul = {
+    gen_fnmul_ah_h,
+    gen_fnmul_ah_s,
+    gen_fnmul_ah_d,
+};
+TRANS(FNMUL_s, do_fp3_scalar_2fn, a, &f_scalar_fnmul, &f_scalar_ah_fnmul, a->rn)
 
 static const FPScalar f_scalar_fcmeq = {
     gen_helper_advsimd_ceq_f16,
@@ -6399,7 +6490,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
 
             read_vec_element(s, t2, a->rm, a->idx, MO_64);
             if (neg) {
-                gen_vfp_negd(t1, t1);
+                gen_vfp_maybe_ah_negd(s, t1, t1);
             }
             gen_helper_vfp_muladdd(t0, t1, t2, t0, fpstatus_ptr(FPST_FPCR_A64));
             write_fp_dreg_merging(s, a->rd, a->rd, t0);
@@ -6413,7 +6504,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
 
             read_vec_element_i32(s, t2, a->rm, a->idx, MO_32);
             if (neg) {
-                gen_vfp_negs(t1, t1);
+                gen_vfp_maybe_ah_negs(s, t1, t1);
             }
             gen_helper_vfp_muladds(t0, t1, t2, t0, fpstatus_ptr(FPST_FPCR_A64));
             write_fp_sreg_merging(s, a->rd, a->rd, t0);
@@ -6430,7 +6521,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
 
             read_vec_element_i32(s, t2, a->rm, a->idx, MO_16);
             if (neg) {
-                gen_vfp_negh(t1, t1);
+                gen_vfp_maybe_ah_negh(s, t1, t1);
             }
             gen_helper_advsimd_muladdh(t0, t1, t2, t0,
                                        fpstatus_ptr(FPST_FPCR_F16_A64));
@@ -6913,10 +7004,10 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             TCGv_i64 ta = read_fp_dreg(s, a->ra);
 
             if (neg_a) {
-                gen_vfp_negd(ta, ta);
+                gen_vfp_maybe_ah_negd(s, ta, ta);
             }
             if (neg_n) {
-                gen_vfp_negd(tn, tn);
+                gen_vfp_maybe_ah_negd(s, tn, tn);
             }
             fpst = fpstatus_ptr(FPST_FPCR_A64);
             gen_helper_vfp_muladdd(ta, tn, tm, ta, fpst);
@@ -6931,10 +7022,10 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             TCGv_i32 ta = read_fp_sreg(s, a->ra);
 
             if (neg_a) {
-                gen_vfp_negs(ta, ta);
+                gen_vfp_maybe_ah_negs(s, ta, ta);
             }
             if (neg_n) {
-                gen_vfp_negs(tn, tn);
+                gen_vfp_maybe_ah_negs(s, tn, tn);
             }
             fpst = fpstatus_ptr(FPST_FPCR_A64);
             gen_helper_vfp_muladds(ta, tn, tm, ta, fpst);
@@ -6952,10 +7043,10 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             TCGv_i32 ta = read_fp_hreg(s, a->ra);
 
             if (neg_a) {
-                gen_vfp_negh(ta, ta);
+                gen_vfp_maybe_ah_negh(s, ta, ta);
             }
             if (neg_n) {
-                gen_vfp_negh(tn, tn);
+                gen_vfp_maybe_ah_negh(s, tn, tn);
             }
             fpst = fpstatus_ptr(FPST_FPCR_F16_A64);
             gen_helper_advsimd_muladdh(ta, tn, tm, ta, fpst);
@@ -8544,6 +8635,13 @@ static bool do_fp1_scalar_int(DisasContext *s, arg_rr_e *a,
     return true;
 }
 
+static bool do_fp1_scalar_int_2fn(DisasContext *s, arg_rr_e *a,
+                                  const FPScalar1Int *fnormal,
+                                  const FPScalar1Int *fah)
+{
+    return do_fp1_scalar_int(s, a, s->fpcr_ah ? fah : fnormal, true);
+}
+
 static const FPScalar1Int f_scalar_fmov = {
     tcg_gen_mov_i32,
     tcg_gen_mov_i32,
@@ -8563,7 +8661,12 @@ static const FPScalar1Int f_scalar_fneg = {
     gen_vfp_negs,
     gen_vfp_negd,
 };
-TRANS(FNEG_s, do_fp1_scalar_int, a, &f_scalar_fneg, true)
+static const FPScalar1Int f_scalar_ah_fneg = {
+    gen_vfp_ah_negh,
+    gen_vfp_ah_negs,
+    gen_vfp_ah_negd,
+};
+TRANS(FNEG_s, do_fp1_scalar_int_2fn, a, &f_scalar_fneg, &f_scalar_ah_fneg)
 
 typedef struct FPScalar1 {
     void (*gen_h)(TCGv_i32, TCGv_i32, TCGv_ptr);
-- 
2.34.1

