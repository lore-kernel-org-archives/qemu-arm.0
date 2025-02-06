Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1778635njb;
        Thu, 6 Feb 2025 12:00:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUkGF6f4++M9IDPeEKpKlSUFA+Nv7pcjNsogBnLPkQVRAv/R5BxTNsWb74kRrpoDGk8VWINBIUEXJVEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGbhad92DG+BYbP568w2Y5g8NqlggtN4zPhbP+GEn9mdRNC2+0wxKwgT8CiETdupuUYKx22
X-Received: by 2002:a05:622a:258f:b0:467:83f1:71d2 with SMTP id d75a77b69052e-47167b02618mr8717891cf.45.1738872043046;
        Thu, 06 Feb 2025 12:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872043; cv=none;
        d=google.com; s=arc-20240605;
        b=FYl16i/gCdNvfWQC/Hf0IC5TiZ2XYgcuLA8keWP6ORDTBlJEoVHE5Nu7pg1hsN1503
         Oq/Xmr8v7NYBYO3o95KvBcXV4cpvEDx3bYsGcjM7CWhGsEQoqJjYFNQbwtFVOAfqJbx2
         ERMDTqRKVYmsHNakua0IKWqxlr6AFyNHW0ERafnNo40LT2G9LAlMckzJFqtKOIDUntoM
         bxeki+b1Vvc53CMlRMydOj1LlSCEg7cUvnl1zHpkRfNIo4/ABhDqoW8/2EzSIaI8FARn
         4qS+LdU1ZXNIagpKhFPyQHozIS+xR/wKZeaqpuAFX/Hy5E99Ys154ssw3Hw1N0QzU8fI
         QamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K5tXKYMmlQeTOHIIuJmBcFTC/N8oDPHGMZfDiIKqECc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=M4i1swUvuxvG3zSlwUqX2d/RSAAw0kWfRPFRFOTIG44bAg2Ww3Mz+0fS4VBHPzzVnH
         8FT+fzqg4fEJ4QcSSlJSkP0bElNXafAEsU1/NcjTcxnVqozLvn3qooHtGxww7F+aXJp0
         FWiA1Wu0o4TIxd7ipSUSEadyKDwIramBQLYIL4dZIoWYzbPDA9wfv2UBmMfGUZ89TZ1c
         Fr1hZJKx6LF/2IsvTquoxGNtGdIJvOEfvFCzUZ+R6GmT5BQlyv1myHa7A6Kwq4pabIZm
         eFcD1uxdJ8c8AaBxZYN9xr1JEwrHpdva0Q948zb1LY6V09oBlVeKzFvdBI1I8DG6hL1e
         42qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVRSLgjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bce556si16428261cf.558.2025.02.06.12.00.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVRSLgjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80r-00083L-1y; Thu, 06 Feb 2025 14:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80L-0007Gk-5B
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:41 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80H-0000ZI-8x
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:40 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21f3328f72aso15341585ad.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871856; x=1739476656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5tXKYMmlQeTOHIIuJmBcFTC/N8oDPHGMZfDiIKqECc=;
 b=SVRSLgjUAvzIoOd/9DhnVHr/hKB1eLehSekbsJkKFUR4fnK9zW96imdExtBo9dsoEw
 4MR45g3kMtq5je6/5SHBrM+pm1wUNOX+Ika1P5ZFUqkadFrMirXDpcxrARqXEu5CejZy
 8iQPgjma/cagecFKHI9H4qk0XCKhi/rax8OAoh9TRqdN3/RDzkg7zAFEzAPaELeG/SVD
 Cy67f7xk9kFkPPmuuRORIAJBLk1gJwpXZkpLhrDMynRr5KAdC3E3zFSCSJ/qF2u4HTLA
 cHTO6NUiwfcXfJzfgazLFFFqKqtJh1SueYLw+PYs/SIVAXaFkElJcDqnoZniMYqURCxV
 RT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871856; x=1739476656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5tXKYMmlQeTOHIIuJmBcFTC/N8oDPHGMZfDiIKqECc=;
 b=m5zdSm3w0Ekr+JgzNrCfa2BdIh/jF5/xUtn4Dgl/wPoLak08DUHrK4vp75I3FsbIMF
 up5kXr3SaxmQKZEyVjS+0PNndkanl6WT2Tj9dDBXnPOwsHtvYlPjzofxRiaWaIt2XXUI
 HYcWHpzZl3hgVuPY2/yw6oXYPt/iMAmBUiSBYOkbDF/2UPfSH7R1Wq4nQ6/q1nb3KhfX
 ClIOFdbG74uK2NHJ6rMcZ/BWBYYPURgKRLdUVfJ1Ute1Jl7N8LgU2mq4NIaOnrnmxDxq
 ZWSQX0eRNMznp42niuMjwL6fWaQonwg8INeT1aA8+UVPiOQDnxiaB910+/RV8pP9ULpa
 zE/w==
X-Gm-Message-State: AOJu0YyE//DAGzVxWDbqzmr0W9gxzkiLCnCmLKvXEY2h73CRCIrcmp6Z
 rvP9hqcD0KoYjPJ+9i8RxSgzsXCoLDiXlXJ8h3sE/bAORYclr+yQ5rGtOQKgbDfKh2mnE31DHdC
 J
X-Gm-Gg: ASbGncswAj+vhXIHoZbhzZ4N3coUT1jB5WkjkAr7+u2olAxabKFQjged+kPIZp/7933
 xRCalY0xY2IDEJnP3LZTdvY+bI8EchPiC0NMkOg/U8ihTS7HnbY8Odnz+zQ2xhBjyObc2p9OG3g
 Umco5STgC/IQJSAYhjWujFKu0f2LoPgHXHHhl7WSKxsLbAtG0UWcS+4bWiAbxgXvYDkM7GhDXNB
 mvh03QFuwu2Oa67cv6uD8YR4TUgcowkC8rp4terK/J6GU3rXIFB7mRwoDn7a2WDOQlLuZlGJCU7
 3rCQaBJVweiUuZIKhKEYDCrvPhgIdivWJsyk/gKKWryPqSU=
X-Received: by 2002:a05:6a21:9211:b0:1e8:a374:ced7 with SMTP id
 adf61e73a8af0-1ee03a5b269mr1458169637.23.1738871855969; 
 Thu, 06 Feb 2025 11:57:35 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 26/61] target/arm: Implement SME2 Multiple and Single SVE
 Destructive
Date: Thu,  6 Feb 2025 11:56:40 -0800
Message-ID: <20250206195715.2150758-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b/z45ZBWSk8n

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  13 ++++
 target/arm/tcg/vec_internal.h  |   4 ++
 target/arm/tcg/helper-a64.c    |   2 +
 target/arm/tcg/translate-sme.c | 115 +++++++++++++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    |   7 ++
 target/arm/tcg/sme.decode      |  40 ++++++++++++
 6 files changed, 181 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index ecd06f2cd1..cdd7058aed 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -160,3 +160,16 @@ DEF_HELPER_FLAGS_6(sme2_smopa2_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme2_umopa2_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmax_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmin_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmax_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmin_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxnum_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_fminnum_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 6b93b5aeb9..205f85b8d3 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -300,4 +300,8 @@ static inline float64 float64_maybe_ah_chs(float64 a, bool fpcr_ah)
     return fpcr_ah && float64_is_any_nan(a) ? a : float64_chs(a);
 }
 
+/* Not actually called directly as a helper, but uses similar machinery. */
+bfloat16 helper_sme2_ah_fmax_b16(bfloat16 a, bfloat16 b, float_status *fpst);
+bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 32f0647ca4..9685ef65a0 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -399,6 +399,8 @@ AH_MINMAX_HELPER(vfp_ah_mind, float64, float64, min)
 AH_MINMAX_HELPER(vfp_ah_maxh, dh_ctype_f16, float16, max)
 AH_MINMAX_HELPER(vfp_ah_maxs, float32, float32, max)
 AH_MINMAX_HELPER(vfp_ah_maxd, float64, float64, max)
+AH_MINMAX_HELPER(sme2_ah_fmax_b16, bfloat16, bfloat16, max)
+AH_MINMAX_HELPER(sme2_ah_fmin_b16, bfloat16, bfloat16, min)
 
 /* 64-bit versions of the CRC helpers. Note that although the operation
  * (and the prototypes of crc32c() and crc32() mean that only the bottom
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 57c7aacb6d..0e05153924 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -511,3 +511,118 @@ TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_usmop
 TRANS_FEAT(BMOPA, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_bmopa_s)
 TRANS_FEAT(SMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_smopa2_s)
 TRANS_FEAT(UMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_umopa2_s)
+
+static bool do_z2z_n1(DisasContext *s, arg_z2z_en *a, GVecGen3Fn *fn)
+{
+    int esz, dn, vsz, mofs, n;
+    bool overlap = false;
+
+    if (!sme_sm_enabled_check(s)) {
+        return true;
+    }
+
+    esz = a->esz;
+    n = a->n;
+    dn = a->zdn;
+    mofs = vec_full_reg_offset(s, a->zm);
+    vsz = streaming_vec_reg_size(s);
+
+    for (int i = 0; i < n; i++) {
+        int dofs = vec_full_reg_offset(s, dn + i);
+        if (dofs == mofs) {
+            overlap = true;
+        } else {
+            fn(esz, dofs, dofs, mofs, vsz, vsz);
+        }
+    }
+    if (overlap) {
+        fn(esz, mofs, mofs, mofs, vsz, vsz);
+    }
+    return true;
+}
+
+TRANS_FEAT(ADD_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_add)
+TRANS_FEAT(SMAX_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_smax)
+TRANS_FEAT(SMIN_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_smin)
+TRANS_FEAT(UMAX_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_umax)
+TRANS_FEAT(UMIN_n1, aa64_sme2, do_z2z_n1, a, tcg_gen_gvec_umin)
+TRANS_FEAT(SRSHL_n1, aa64_sme2, do_z2z_n1, a, gen_gvec_srshl)
+TRANS_FEAT(URSHL_n1, aa64_sme2, do_z2z_n1, a, gen_gvec_urshl)
+TRANS_FEAT(SQDMULH_n1, aa64_sme2, do_z2z_n1, a, gen_gvec_sve2_sqdmulh)
+
+static bool do_z2z_n1_fpst(DisasContext *s, arg_z2z_en *a,
+                           gen_helper_gvec_3_ptr * const fns[4])
+{
+    int esz = a->esz, n, dn, vsz, mofs;
+    bool overlap = false;
+    gen_helper_gvec_3_ptr *fn;
+    TCGv_ptr fpst;
+
+    /* These insns use MO_8 to encode BFloat16. */
+    if (esz == MO_8 && !dc_isar_feature(aa64_sme2_b16b16, s)) {
+        return false;
+    }
+    if (!sme_sm_enabled_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(esz == MO_16 ? FPST_A64_F16 : FPST_A64);
+    fn = fns[esz];
+    n = a->n;
+    dn = a->zdn;
+    mofs = vec_full_reg_offset(s, a->zm);
+    vsz = streaming_vec_reg_size(s);
+
+    for (int i = 0; i < n; i++) {
+        int dofs = vec_full_reg_offset(s, dn + i);
+        if (dofs == mofs) {
+            overlap = true;
+        } else {
+            tcg_gen_gvec_3_ptr(dofs, dofs, mofs, fpst, vsz, vsz, 0, fn);
+        }
+    }
+    if (overlap) {
+        tcg_gen_gvec_3_ptr(mofs, mofs, mofs, fpst, vsz, vsz, 0, fn);
+    }
+    return true;
+}
+
+static gen_helper_gvec_3_ptr * const f_vector_fmax[2][4] = {
+    { gen_helper_gvec_fmax_b16,
+      gen_helper_gvec_fmax_h,
+      gen_helper_gvec_fmax_s,
+      gen_helper_gvec_fmax_d },
+    { gen_helper_gvec_ah_fmax_b16,
+      gen_helper_gvec_ah_fmax_h,
+      gen_helper_gvec_ah_fmax_s,
+      gen_helper_gvec_ah_fmax_d },
+};
+TRANS_FEAT(FMAX_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmax[s->fpcr_ah])
+
+static gen_helper_gvec_3_ptr * const f_vector_fmin[2][4] = {
+    { gen_helper_gvec_fmin_b16,
+      gen_helper_gvec_fmin_h,
+      gen_helper_gvec_fmin_s,
+      gen_helper_gvec_fmin_d },
+    { gen_helper_gvec_ah_fmin_b16,
+      gen_helper_gvec_ah_fmin_h,
+      gen_helper_gvec_ah_fmin_s,
+      gen_helper_gvec_ah_fmin_d },
+};
+TRANS_FEAT(FMIN_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmin[s->fpcr_ah])
+
+static gen_helper_gvec_3_ptr * const f_vector_fmaxnm[4] = {
+    gen_helper_gvec_fmaxnum_b16,
+    gen_helper_gvec_fmaxnum_h,
+    gen_helper_gvec_fmaxnum_s,
+    gen_helper_gvec_fmaxnum_d,
+};
+TRANS_FEAT(FMAXNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fmaxnm)
+
+static gen_helper_gvec_3_ptr * const f_vector_fminnm[4] = {
+    gen_helper_gvec_fminnum_b16,
+    gen_helper_gvec_fminnum_h,
+    gen_helper_gvec_fminnum_s,
+    gen_helper_gvec_fminnum_d,
+};
+TRANS_FEAT(FMINNM_n1, aa64_sme2, do_z2z_n1_fpst, a, f_vector_fminnm)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 986eaf8ffa..671777ce52 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1515,6 +1515,13 @@ DO_3OP(gvec_ah_fmin_h, helper_vfp_ah_minh, float16)
 DO_3OP(gvec_ah_fmin_s, helper_vfp_ah_mins, float32)
 DO_3OP(gvec_ah_fmin_d, helper_vfp_ah_mind, float64)
 
+DO_3OP(gvec_fmax_b16, bfloat16_max, bfloat16)
+DO_3OP(gvec_fmin_b16, bfloat16_min, bfloat16)
+DO_3OP(gvec_fmaxnum_b16, bfloat16_maxnum, bfloat16)
+DO_3OP(gvec_fminnum_b16, bfloat16_minnum, bfloat16)
+DO_3OP(gvec_ah_fmax_b16, helper_sme2_ah_fmax_b16, bfloat16)
+DO_3OP(gvec_ah_fmin_b16, helper_sme2_ah_fmin_b16, bfloat16)
+
 #endif
 #undef DO_3OP
 
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 36f369d02a..005f87777b 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -169,3 +169,43 @@ UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
 BMOPA           1000000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
 SMOPA2_s        1010000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
 UMOPA2_s        1010000 1 10 0 ..... ... ... ..... . 10 ..      @op_32
+
+### SME2 Multi-vector Multiple and Single SVE Destructive
+
+%zd_ax2         1:4 !function=times_2
+%zd_ax4         2:3 !function=times_4
+
+&z2z_en         zdn zm esz n
+@z2z_2x1        ....... . esz:2 .. zm:4 ....0. ..... .... . \
+                &z2z_en n=2 zdn=%zd_ax2
+@z2z_4x1        ....... . esz:2 .. zm:4 ....1. ..... ...0 . \
+                &z2z_en n=4 zdn=%zd_ax4
+
+SMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 0    @z2z_2x1
+SMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 0    @z2z_4x1
+UMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 1    @z2z_2x1
+UMAX_n1        1100000 1 .. 10 .... 1010.0 00000 .... 1    @z2z_4x1
+SMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 0    @z2z_2x1
+SMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 0    @z2z_4x1
+UMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 1    @z2z_2x1
+UMIN_n1        1100000 1 .. 10 .... 1010.0 00001 .... 1    @z2z_4x1
+
+FMAX_n1        1100000 1 .. 10 .... 1010.0 01000 .... 0    @z2z_2x1
+FMAX_n1        1100000 1 .. 10 .... 1010.0 01000 .... 0    @z2z_4x1
+FMIN_n1        1100000 1 .. 10 .... 1010.0 01000 .... 1    @z2z_2x1
+FMIN_n1        1100000 1 .. 10 .... 1010.0 01000 .... 1    @z2z_4x1
+FMAXNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 0    @z2z_2x1
+FMAXNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 0    @z2z_4x1
+FMINNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 1    @z2z_2x1
+FMINNM_n1      1100000 1 .. 10 .... 1010.0 01001 .... 1    @z2z_4x1
+
+SRSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 0    @z2z_2x1
+SRSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 0    @z2z_4x1
+URSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 1    @z2z_2x1
+URSHL_n1       1100000 1 .. 10 .... 1010.0 10001 .... 1    @z2z_4x1
+
+ADD_n1         1100000 1 .. 10 .... 1010.0 11000 .... 0    @z2z_2x1
+ADD_n1         1100000 1 .. 10 .... 1010.0 11000 .... 0    @z2z_4x1
+
+SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_2x1
+SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
-- 
2.43.0

