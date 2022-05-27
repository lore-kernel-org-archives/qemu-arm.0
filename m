Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1251606lfh;
        Fri, 27 May 2022 12:50:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhtBBGomfYid+wXEOllF20XieXgCd7iKjTZHEwzZP+4qGKCWh+9Jy66553TgmVT3TzFluu
X-Received: by 2002:a05:622a:15c6:b0:2fb:7749:6e90 with SMTP id d6-20020a05622a15c600b002fb77496e90mr11455098qty.85.1653681042983;
        Fri, 27 May 2022 12:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681042; cv=none;
        d=google.com; s=arc-20160816;
        b=fvjJyA0raPKb4r4wGmX5a4bH5PIZC6Bl8HeXee1aatw1+2+Oy24SFCHsjAUg8txYfp
         TDiwdryfAA0c4Y9P0b3UA7AlmD0fh4iZZWFXV2zLkHCyKtwOZ2Ov+gHRrMffTjOiIQri
         zBF4yHdSEbyj8XzXipOqimpEHixS4iG2sPXOyeX+Ty/xy+G+5+owvu3zIcEbIv4KxD3s
         gNaC4pydKlfSJV492avHjSs1J30dU5uunRmfPjANdgm0qbdPR4qT5ivLCrxYpXHWVh5k
         E/J4aBZFQjVOZWwU9M1YJX/4mMzjnxIXQoCQMEHmEIUSQ/e1QbPgangDKYSTUjOrKlsF
         rPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6YhAzz0xYhVtXp3fDH0SG2Jz6Ow//546RJVTGOJ+fVE=;
        b=T5THf6EvWOoLF84hL/DHmvXFz7pIRgEcOuDc6Ydof9gk8m/oCfBJqJe52V7Deh3AMK
         ktOLUvzCeZ6WtxB0L4eqmmU6CiSODmDKmTyiwDOasUYl476fyFCEoxeIzbB0RxDgmyNe
         P/2yNGGuB7XBOvOmfBYGX9iSrUsKK2Do60xAcfp1TsNjo6i4+6jL04VJb3OJlzvkgvQ5
         WO2tvytnOrSCnWpGp9n2ICfUQDKL5Rlf3M0bU2yo7JM6e6JIECwQX7YmgiusdcZ9gkBS
         GrxyHTHqx5pFOXMHYRN3Kj8xnHCojWrmlkBBuqpZ+QVtEr7XGONZiPDyYlNirMpH94Fw
         EhWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5Pt93yL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n66-20020a37a445000000b006a58e28da39si2996917qke.643.2022.05.27.12.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5Pt93yL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufys-0001F6-F5
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecU-0003rU-UQ
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Kl-OJ
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:30 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f18so4850184plg.0
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YhAzz0xYhVtXp3fDH0SG2Jz6Ow//546RJVTGOJ+fVE=;
 b=B5Pt93yLrklLUvXQn8mi+5HQ6SJJSeoCvNxXSonuiVAwMvP6lTSOoHH8Zvjyd9MEUf
 03nq8XnHy0G/aw5ZjNTgw48ataSIloed2lHvvH0fvhrXA0hgSGZYJvNBH55BFdkkbWf8
 GmLi6YuQhnZAWLG9T6GnJQhzyXm02E2IPONIs7JqPeM1cYdifXYgJD8fIRmzsDSAmXF+
 Uf5Vj/dLQCQfrMAHJlMyZF0RYCcpY/4jJwDSrGP+mCKhH15UVlxEj6zu2fk5jxGLoRE7
 lAs+8rqzTzTtFjIIMLgmVMSyYtlS/xJcMajqKC2uFEiVFnvez5R9SCvKARydkjpt2e+s
 qU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YhAzz0xYhVtXp3fDH0SG2Jz6Ow//546RJVTGOJ+fVE=;
 b=YUUzayHvup++ABFG7MyRnY1bpThhpJ0CkVPsRwXvk0WDPxtYto5GB9GHGoB8zP58yW
 AlujSb8408NNelEGqMuQFb5SHBLZZDfq3aSMgU0JhpJ8/RMztBahBe1cU/P7LUFSSvOC
 3fIbp2O2Ced9nnBACM5LL21C8DJlHgEwaUEpZAS0r/y+y2AGyj+rCGpho5UO+9sgPLQf
 I3WtC0gZ61nEQH5ghCoOzNDa3LF4xGdD8D9R1Hbdm6ZtZoSaJiditAp8GgUS86CL8png
 8sZnmpNRdcEiDl2NtIrIFqz2wdgUgZsq86HuS5UpDjsMxGtkIC618XdNhUWn4JXV2d7m
 CXSg==
X-Gm-Message-State: AOAM531uHdzk2xzlFHpy652PcuBDtqsSAFXuO/R3Ni2ibhKogfqquSDg
 VY1mndC6kmt263P500VlnJRntw==
X-Received: by 2002:a17:90a:de15:b0:1df:63dd:9cfc with SMTP id
 m21-20020a17090ade1500b001df63dd9cfcmr9823262pjv.200.1653675799093; 
 Fri, 27 May 2022 11:23:19 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 077/114] target/arm: Introduce gen_gvec_{ptr,fpst}_zzzz
Date: Fri, 27 May 2022 11:18:30 -0700
Message-Id: <20220527181907.189259-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7m2ZkRB7xeMX

Use these for the several varieties of floating-point
multiply-add instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 140 ++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 87 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b8bd1047b0..a799ce3110 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -205,6 +205,35 @@ static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
+/* Invoke an out-of-line helper on 4 Zregs, plus a pointer. */
+static bool gen_gvec_ptr_zzzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                              int rd, int rn, int rm, int ra,
+                              int data, TCGv_ptr ptr)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           ptr, vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_zzzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                               int rd, int rn, int rm, int ra,
+                               int data, ARMFPStatusFlavour flavour)
+{
+    TCGv_ptr status = fpstatus_ptr(flavour);
+    bool ret = gen_gvec_ptr_zzzz(s, fn, rd, rn, rm, ra, data, status);
+    tcg_temp_free_ptr(status);
+    return ret;
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -3485,24 +3514,15 @@ DO_SVE2_RRXR_ROT(CDOT_zzxw_d, gen_helper_sve2_cdot_idx_d)
 
 static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
 {
-    static gen_helper_gvec_4_ptr * const fns[3] = {
+    static gen_helper_gvec_4_ptr * const fns[4] = {
+        NULL,
         gen_helper_gvec_fmla_idx_h,
         gen_helper_gvec_fmla_idx_s,
         gen_helper_gvec_fmla_idx_d,
     };
-
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, (a->index << 1) | sub,
-                           fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
+                              (a->index << 1) | sub,
+                              a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
 static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
@@ -4040,26 +4060,18 @@ static bool trans_FCMLA_zpzzz(DisasContext *s, arg_FCMLA_zpzzz *a)
 
 static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCMLA_zzxz *a)
 {
-    static gen_helper_gvec_4_ptr * const fns[2] = {
+    static gen_helper_gvec_4_ptr * const fns[4] = {
+        NULL,
         gen_helper_gvec_fcmlah_idx,
         gen_helper_gvec_fcmlas_idx,
+        NULL,
     };
 
-    tcg_debug_assert(a->esz == 1 || a->esz == 2);
     tcg_debug_assert(a->rd == a->ra);
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz,
-                           a->index * 4 + a->rot,
-                           fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+
+    return gen_gvec_fpst_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra,
+                              a->index * 4 + a->rot,
+                              a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
 /*
@@ -7327,17 +7339,7 @@ static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
         return false;
     }
 
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR);
 }
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
@@ -7535,16 +7537,9 @@ static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           cpu_env, vsz, vsz, (sel << 1) | sub,
-                           gen_helper_sve2_fmlal_zzzw_s);
-    }
-    return true;
+    return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzzw_s,
+                             a->rd, a->rn, a->rm, a->ra,
+                             (sel << 1) | sub, cpu_env);
 }
 
 static bool trans_FMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
@@ -7572,17 +7567,9 @@ static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           cpu_env, vsz, vsz,
-                           (a->index << 2) | (sel << 1) | sub,
-                           gen_helper_sve2_fmlal_zzxw_s);
-    }
-    return true;
+    return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzxw_s,
+                             a->rd, a->rn, a->rm, a->ra,
+                             (a->index << 2) | (sel << 1) | sub, cpu_env);
 }
 
 static bool trans_FMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
@@ -7625,19 +7612,8 @@ static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
-        unsigned vsz = vec_full_reg_size(s);
-
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, sel,
-                           gen_helper_gvec_bfmlal);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal,
+                              a->rd, a->rn, a->rm, a->ra, sel, FPST_FPCR);
 }
 
 static bool trans_BFMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
@@ -7655,19 +7631,9 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        TCGv_ptr status = fpstatus_ptr(FPST_FPCR);
-        unsigned vsz = vec_full_reg_size(s);
-
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, (a->index << 1) | sel,
-                           gen_helper_gvec_bfmlal_idx);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
+    return gen_gvec_fpst_zzzz(s, gen_helper_gvec_bfmlal_idx,
+                              a->rd, a->rn, a->rm, a->ra,
+                              (a->index << 1) | sel, FPST_FPCR);
 }
 
 static bool trans_BFMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
-- 
2.34.1

