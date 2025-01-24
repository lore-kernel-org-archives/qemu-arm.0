Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp930282njk;
        Fri, 24 Jan 2025 08:34:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX44oAasn73i7o9Qq5NrWiSCUp8mEZAca0WBBNMcZSOKKYElytEjcCta3gAm08lQZRYyXBvD5PP2DyXgg==@linaro.org
X-Google-Smtp-Source: AGHT+IHerD2aXTpXwGBMV1ZQuIMI7r0G8/A4eEDcsz1svPS4SvxNkDCiX9SP11E6XgRTfUtUMwqT
X-Received: by 2002:a05:622a:91:b0:467:451b:eb99 with SMTP id d75a77b69052e-46e12a884e6mr451726911cf.29.1737736498321;
        Fri, 24 Jan 2025 08:34:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736498; cv=none;
        d=google.com; s=arc-20240605;
        b=XGcwuob3x8QO5BS0nH54hdE74C+/LKZQKF0snLPyMwXHUHo+sRBBM7F9MJ8eX0MLE5
         3Pa0adAqitlRtJu5ZP89wfn9G3yh0zXx63eJPgBFYjhX9vNbE26lc85Aj8bshe8dGfcj
         /YVGKyPrSjrehs/at0+dspFFfVqSkDal78xz6NyaztFZ8+2inJVGVzFhVShwd7GFEQQS
         v6zY7Lw7UoCxsaUfNk5uz+kGd1mN7Xnx/vl3/TgZiGp//4Y2zYNJkTexkc8rD1k8OXQl
         y6snxYar1LzVHqHBLXps2Cuw4hQ049bBD/YdSXM13+H5FEs7ALf3XHjHyI/r6CgoJDZ2
         dNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=93LX+X4AXwM0qFxvemfPcv53qM21psrPMCC/rMN0XCs=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=QmZAOfL2MnW2qHdguxDZcZ9F7Cgd9wvPNUjG4VwmljjiGyMPI/yXzmyss1v7rHocy5
         xZ7YUci1Evrq1t1s+Oyd6+W7hKQ/pBw7cbVzQNimCegEXA02+QRLdGL1T9CMes4PqRiQ
         69NQCH3uaFObYicbPoHvjESXmfsjnY2LxZIUDYgW26QPWDvOWHsUUcibCRgG2wf3fBsQ
         z66DKdnJVtKMvXNUdFy8Z5JTKl5xklElDvwX2rAGMuPouwZYehNpfWi2vWxt/4fFplC4
         dVkytJVzEqDTaaTNC7rWXicSa+DPlIAX7KkqsbKSv0a/aL5rHbsxAIDJNLnQxEZK/Fkv
         1PYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfEd7mQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bcef94si26344821cf.665.2025.01.24.08.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:34:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfEd7mQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMc2-0003sB-91; Fri, 24 Jan 2025 11:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYf-0004NA-Fa
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:26 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYb-0005au-4q
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so16556535e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736160; x=1738340960; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=93LX+X4AXwM0qFxvemfPcv53qM21psrPMCC/rMN0XCs=;
 b=QfEd7mQs5rLXHUKJ25Va986mWNQbVrnmJaKT16JYY64+iqSNMIx1JHrVVQtXVHQ2pz
 lwouNGtWX3aJtOLNqz6h7IbOml2oIQ/3MpWyphWMctnmZSIIp8PLAmNuryRd3vnii7Oz
 7mKPuWemvmjlCSoL7+cRFu4On3zikReMlgWFQsKELr/Je+m/4scp9h+eZCsB94uFh0KF
 ud+kZ6URiri/shW1ZMhYSmWuFtoOh1CoXNCBrQk2rpob+tdDWVwg6bK6JHqqjFozaV0j
 LX5dOTIi0B8JAmCmcv7UJcvAgn80LHoFxXYN1PrDCvo6P1zkB5UdvkQ7tlA0lEyYzRda
 ZVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736160; x=1738340960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93LX+X4AXwM0qFxvemfPcv53qM21psrPMCC/rMN0XCs=;
 b=UcvTJjjbPULEOVwOwsvJ8YYCeWYnxBtTOzk7Nlma3LDKAoi0YuNRjMefr37OD4eEfY
 T00tz47QjryZ0ckl9jT233WZ3KldHLsr2RYJThTxf8WQdoxDX6KHy6NvP0xiQfIw+7AO
 CspeSh6XsqJHOzWku6EioGreiXWqvL6XGJfB+uZNeo154QeHkPluCulzAgdCqop5H6lq
 UHiAV57hsYP0FO3hFQGdSf26opOHoljNavMBDYfxNILtZnYH1cM9zHRXRJULCwhjiAe7
 gvtaiAjFnXX0SvaAWIXj7vUWjfNhRysJfvTz11KDwZIXffgc+IE3DW/H+UxjLrrNBSKJ
 fAlw==
X-Gm-Message-State: AOJu0Ywj+S54Ju5+M2u2EDpk+pmdzS3W2+GzYOfjPX18vvjt2Nk91pfL
 wX7/ET2ppzuIUc3D+gVrhz3ef8pLAKkVy2S+a9hzAllwGCOKYS9g18w+Y85ug55LwMev0G2pU1t
 D
X-Gm-Gg: ASbGncts3ZCxRO7DfMj9GdC1pjCrXdWy/fQTxIZWV3/EngJ+5zxyUCXuCNMfKlk7fuP
 sJhcuFONhwqjXvfl0TCBanW5JlvxVDnfzhisV8ubpQyvUjl2JFKTRoInmEaoGBwVHSOZA6XbBpO
 1mKd51B8XFCcuSLhhb5/8xAd9N1mJCktMVIhVCNhLCNnbMw4FCav4K4CAGRfRhPxn0kdaLUTWOV
 IB1E0o7rkkM+Py1+ymzba/3v7IqosW6r9i3STd7ot2JgOly6tLFe4Lvt8gVgtvDJQaqUXozJ22K
 +eLevXscP6U=
X-Received: by 2002:a05:600c:4508:b0:431:547e:81d0 with SMTP id
 5b1f17b1804b1-438913e1c00mr334532585e9.11.1737736159695; 
 Fri, 24 Jan 2025 08:29:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 33/76] target/arm: Use FPST_FPCR_AH for FRECPE, FRECPS, FRECPX,
 FRSQRTE, FRSQRTS
Date: Fri, 24 Jan 2025 16:27:53 +0000
Message-Id: <20250124162836.2332150-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: e8o605egTT8H

For the instructions FRECPE, FRECPS, FRECPX, FRSQRTE, FRSQRTS, use
FPST_FPCR_AH or FPST_FPCR_AH_F16 when FPCR.AH is 1, so that they get
the required behaviour changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
select_fpst() is another function I'm not super happy wit hthe
naming of, because again it should only be used for the subset
of insns which have this particular behaviour, but the current
name kind of implies more generality than that. Suggestions welcome.
---
 target/arm/tcg/translate.h     |  13 ++++
 target/arm/tcg/translate-a64.c | 119 +++++++++++++++++++++++++--------
 target/arm/tcg/translate-sve.c |  30 ++++++---
 3 files changed, 127 insertions(+), 35 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d6edd8db76b..680ca52a181 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -746,6 +746,19 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     return statusptr;
 }
 
+/*
+ * Return the ARMFPStatusFlavour to use based on element size and
+ * whether FPCR.AH is set.
+ */
+static inline ARMFPStatusFlavour select_fpst(DisasContext *s, MemOp esz)
+{
+    if (s->fpcr_ah) {
+        return esz == MO_16 ? FPST_FPCR_AH_F16 : FPST_FPCR_AH;
+    } else {
+        return esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64;
+    }
+}
+
 /**
  * finalize_memop_atom:
  * @s: DisasContext
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 556da6d23cd..2a0c5e23e74 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -723,10 +723,10 @@ static void gen_gvec_op3_ool(DisasContext *s, bool is_q, int rd,
  * an out-of-line helper.
  */
 static void gen_gvec_op3_fpst(DisasContext *s, bool is_q, int rd, int rn,
-                              int rm, bool is_fp16, int data,
+                              int rm, ARMFPStatusFlavour fpsttype, int data,
                               gen_helper_gvec_3_ptr *fn)
 {
-    TCGv_ptr fpst = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
+    TCGv_ptr fpst = fpstatus_ptr(fpsttype);
     tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
                        vec_full_reg_offset(s, rn),
                        vec_full_reg_offset(s, rm), fpst,
@@ -5036,14 +5036,16 @@ typedef struct FPScalar {
     void (*gen_d)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_ptr);
 } FPScalar;
 
-static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
+static bool do_fp3_scalar_with_fpsttype(DisasContext *s, arg_rrr_e *a,
+                                        const FPScalar *f,
+                                        ARMFPStatusFlavour fpsttype)
 {
     switch (a->esz) {
     case MO_64:
         if (fp_access_check(s)) {
             TCGv_i64 t0 = read_fp_dreg(s, a->rn);
             TCGv_i64 t1 = read_fp_dreg(s, a->rm);
-            f->gen_d(t0, t0, t1, fpstatus_ptr(FPST_FPCR_A64));
+            f->gen_d(t0, t0, t1, fpstatus_ptr(fpsttype));
             write_fp_dreg(s, a->rd, t0);
         }
         break;
@@ -5051,7 +5053,7 @@ static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
         if (fp_access_check(s)) {
             TCGv_i32 t0 = read_fp_sreg(s, a->rn);
             TCGv_i32 t1 = read_fp_sreg(s, a->rm);
-            f->gen_s(t0, t0, t1, fpstatus_ptr(FPST_FPCR_A64));
+            f->gen_s(t0, t0, t1, fpstatus_ptr(fpsttype));
             write_fp_sreg(s, a->rd, t0);
         }
         break;
@@ -5062,7 +5064,7 @@ static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
         if (fp_access_check(s)) {
             TCGv_i32 t0 = read_fp_hreg(s, a->rn);
             TCGv_i32 t1 = read_fp_hreg(s, a->rm);
-            f->gen_h(t0, t0, t1, fpstatus_ptr(FPST_FPCR_F16_A64));
+            f->gen_h(t0, t0, t1, fpstatus_ptr(fpsttype));
             write_fp_sreg(s, a->rd, t0);
         }
         break;
@@ -5072,6 +5074,18 @@ static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
     return true;
 }
 
+static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
+{
+    return do_fp3_scalar_with_fpsttype(s, a, f,
+                                       a->esz == MO_16 ?
+                                       FPST_FPCR_F16_A64 : FPST_FPCR_A64);
+}
+
+static bool do_fp3_scalar_ah(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
+{
+    return do_fp3_scalar_with_fpsttype(s, a, f, select_fpst(s, a->esz));
+}
+
 static const FPScalar f_scalar_fadd = {
     gen_helper_vfp_addh,
     gen_helper_vfp_adds,
@@ -5225,14 +5239,14 @@ static const FPScalar f_scalar_frecps = {
     gen_helper_recpsf_f32,
     gen_helper_recpsf_f64,
 };
-TRANS(FRECPS_s, do_fp3_scalar, a, &f_scalar_frecps)
+TRANS(FRECPS_s, do_fp3_scalar_ah, a, &f_scalar_frecps)
 
 static const FPScalar f_scalar_frsqrts = {
     gen_helper_rsqrtsf_f16,
     gen_helper_rsqrtsf_f32,
     gen_helper_rsqrtsf_f64,
 };
-TRANS(FRSQRTS_s, do_fp3_scalar, a, &f_scalar_frsqrts)
+TRANS(FRSQRTS_s, do_fp3_scalar_ah, a, &f_scalar_frsqrts)
 
 static bool do_fcmp0_s(DisasContext *s, arg_rr_e *a,
                        const FPScalar *f, bool swap)
@@ -5483,8 +5497,10 @@ TRANS(CMHS_s, do_cmop_d, a, TCG_COND_GEU)
 TRANS(CMEQ_s, do_cmop_d, a, TCG_COND_EQ)
 TRANS(CMTST_s, do_cmop_d, a, TCG_COND_TSTNE)
 
-static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a, int data,
-                          gen_helper_gvec_3_ptr * const fns[3])
+static bool do_fp3_vector_with_fpsttype(DisasContext *s, arg_qrrr_e *a,
+                                        int data,
+                                        gen_helper_gvec_3_ptr * const fns[3],
+                                        ARMFPStatusFlavour fpsttype)
 {
     MemOp esz = a->esz;
     int check = fp_access_check_vector_hsd(s, a->q, esz);
@@ -5493,11 +5509,26 @@ static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a, int data,
         return check == 0;
     }
 
-    gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
-                      esz == MO_16, data, fns[esz - 1]);
+    gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm, fpsttype,
+                      data, fns[esz - 1]);
     return true;
 }
 
+static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a, int data,
+                          gen_helper_gvec_3_ptr * const fns[3])
+{
+    return do_fp3_vector_with_fpsttype(s, a, data, fns,
+                                       a->esz == MO_16 ?
+                                       FPST_FPCR_F16_A64 :FPST_FPCR_A64);
+}
+
+static bool do_fp3_vector_ah(DisasContext *s, arg_qrrr_e *a, int data,
+                             gen_helper_gvec_3_ptr * const f[3])
+{
+    return do_fp3_vector_with_fpsttype(s, a, data, f,
+                                       select_fpst(s, a->esz));
+}
+
 static gen_helper_gvec_3_ptr * const f_vector_fadd[3] = {
     gen_helper_gvec_fadd_h,
     gen_helper_gvec_fadd_s,
@@ -5622,14 +5653,14 @@ static gen_helper_gvec_3_ptr * const f_vector_frecps[3] = {
     gen_helper_gvec_recps_s,
     gen_helper_gvec_recps_d,
 };
-TRANS(FRECPS_v, do_fp3_vector, a, 0, f_vector_frecps)
+TRANS(FRECPS_v, do_fp3_vector_ah, a, 0, f_vector_frecps)
 
 static gen_helper_gvec_3_ptr * const f_vector_frsqrts[3] = {
     gen_helper_gvec_rsqrts_h,
     gen_helper_gvec_rsqrts_s,
     gen_helper_gvec_rsqrts_d,
 };
-TRANS(FRSQRTS_v, do_fp3_vector, a, 0, f_vector_frsqrts)
+TRANS(FRSQRTS_v, do_fp3_vector_ah, a, 0, f_vector_frsqrts)
 
 static gen_helper_gvec_3_ptr * const f_vector_faddp[3] = {
     gen_helper_gvec_faddp_h,
@@ -6385,7 +6416,8 @@ static bool do_fp3_vector_idx(DisasContext *s, arg_qrrx_e *a,
     }
 
     gen_gvec_op3_fpst(s, a->q, a->rd, a->rn, a->rm,
-                      esz == MO_16, a->idx, fns[esz - 1]);
+                      esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64,
+                      a->idx, fns[esz - 1]);
     return true;
 }
 
@@ -8394,8 +8426,9 @@ typedef struct FPScalar1 {
     void (*gen_d)(TCGv_i64, TCGv_i64, TCGv_ptr);
 } FPScalar1;
 
-static bool do_fp1_scalar(DisasContext *s, arg_rr_e *a,
-                          const FPScalar1 *f, int rmode)
+static bool do_fp1_scalar_with_fpsttype(DisasContext *s, arg_rr_e *a,
+                                        const FPScalar1 *f, int rmode,
+                                        ARMFPStatusFlavour fpsttype)
 {
     TCGv_i32 tcg_rmode = NULL;
     TCGv_ptr fpst;
@@ -8407,7 +8440,7 @@ static bool do_fp1_scalar(DisasContext *s, arg_rr_e *a,
         return check == 0;
     }
 
-    fpst = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
+    fpst = fpstatus_ptr(fpsttype);
     if (rmode >= 0) {
         tcg_rmode = gen_set_rmode(rmode, fpst);
     }
@@ -8438,6 +8471,20 @@ static bool do_fp1_scalar(DisasContext *s, arg_rr_e *a,
     return true;
 }
 
+static bool do_fp1_scalar(DisasContext *s, arg_rr_e *a,
+                          const FPScalar1 *f, int rmode)
+{
+    return do_fp1_scalar_with_fpsttype(s, a, f, rmode,
+                                       a->esz == MO_16 ?
+                                       FPST_FPCR_F16_A64 : FPST_FPCR_A64);
+}
+
+static bool do_fp1_scalar_ah(DisasContext *s, arg_rr_e *a,
+                             const FPScalar1 *f, int rmode)
+{
+    return do_fp1_scalar_with_fpsttype(s, a, f, rmode, select_fpst(s, a->esz));
+}
+
 static const FPScalar1 f_scalar_fsqrt = {
     gen_helper_vfp_sqrth,
     gen_helper_vfp_sqrts,
@@ -8492,21 +8539,21 @@ static const FPScalar1 f_scalar_frecpe = {
     gen_helper_recpe_f32,
     gen_helper_recpe_f64,
 };
-TRANS(FRECPE_s, do_fp1_scalar, a, &f_scalar_frecpe, -1)
+TRANS(FRECPE_s, do_fp1_scalar_ah, a, &f_scalar_frecpe, -1)
 
 static const FPScalar1 f_scalar_frecpx = {
     gen_helper_frecpx_f16,
     gen_helper_frecpx_f32,
     gen_helper_frecpx_f64,
 };
-TRANS(FRECPX_s, do_fp1_scalar, a, &f_scalar_frecpx, -1)
+TRANS(FRECPX_s, do_fp1_scalar_ah, a, &f_scalar_frecpx, -1)
 
 static const FPScalar1 f_scalar_frsqrte = {
     gen_helper_rsqrte_f16,
     gen_helper_rsqrte_f32,
     gen_helper_rsqrte_f64,
 };
-TRANS(FRSQRTE_s, do_fp1_scalar, a, &f_scalar_frsqrte, -1)
+TRANS(FRSQRTE_s, do_fp1_scalar_ah, a, &f_scalar_frsqrte, -1)
 
 static bool trans_FCVT_s_ds(DisasContext *s, arg_rr *a)
 {
@@ -9361,9 +9408,10 @@ TRANS_FEAT(FRINT64Z_v, aa64_frint, do_fp1_vector, a,
            &f_scalar_frint64, FPROUNDING_ZERO)
 TRANS_FEAT(FRINT64X_v, aa64_frint, do_fp1_vector, a, &f_scalar_frint64, -1)
 
-static bool do_gvec_op2_fpst(DisasContext *s, MemOp esz, bool is_q,
-                             int rd, int rn, int data,
-                             gen_helper_gvec_2_ptr * const fns[3])
+static bool do_gvec_op2_fpst_with_fpsttype(DisasContext *s, MemOp esz,
+                                           bool is_q, int rd, int rn, int data,
+                                           gen_helper_gvec_2_ptr * const fns[3],
+                                           ARMFPStatusFlavour fpsttype)
 {
     int check = fp_access_check_vector_hsd(s, is_q, esz);
     TCGv_ptr fpst;
@@ -9372,7 +9420,7 @@ static bool do_gvec_op2_fpst(DisasContext *s, MemOp esz, bool is_q,
         return check == 0;
     }
 
-    fpst = fpstatus_ptr(esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
+    fpst = fpstatus_ptr(fpsttype);
     tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
                        vec_full_reg_offset(s, rn), fpst,
                        is_q ? 16 : 8, vec_full_reg_size(s),
@@ -9380,6 +9428,23 @@ static bool do_gvec_op2_fpst(DisasContext *s, MemOp esz, bool is_q,
     return true;
 }
 
+static bool do_gvec_op2_fpst(DisasContext *s, MemOp esz, bool is_q,
+                             int rd, int rn, int data,
+                             gen_helper_gvec_2_ptr * const fns[3])
+{
+    return do_gvec_op2_fpst_with_fpsttype(s, esz, is_q, rd, rn, data, fns,
+                                          esz == MO_16 ? FPST_FPCR_F16_A64 :
+                                          FPST_FPCR_A64);
+}
+
+static bool do_gvec_op2_ah_fpst(DisasContext *s, MemOp esz, bool is_q,
+                                int rd, int rn, int data,
+                                gen_helper_gvec_2_ptr * const fns[3])
+{
+    return do_gvec_op2_fpst_with_fpsttype(s, esz, is_q, rd, rn, data,
+                                          fns, select_fpst(s, esz));
+}
+
 static gen_helper_gvec_2_ptr * const f_scvtf_v[] = {
     gen_helper_gvec_vcvt_sh,
     gen_helper_gvec_vcvt_sf,
@@ -9489,14 +9554,14 @@ static gen_helper_gvec_2_ptr * const f_frecpe[] = {
     gen_helper_gvec_frecpe_s,
     gen_helper_gvec_frecpe_d,
 };
-TRANS(FRECPE_v, do_gvec_op2_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frecpe)
+TRANS(FRECPE_v, do_gvec_op2_ah_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frecpe)
 
 static gen_helper_gvec_2_ptr * const f_frsqrte[] = {
     gen_helper_gvec_frsqrte_h,
     gen_helper_gvec_frsqrte_s,
     gen_helper_gvec_frsqrte_d,
 };
-TRANS(FRSQRTE_v, do_gvec_op2_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frsqrte)
+TRANS(FRSQRTE_v, do_gvec_op2_ah_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frsqrte)
 
 static bool trans_FCVTL_v(DisasContext *s, arg_qrr_e *a)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index fc7f0d077a5..8ed8677baa8 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -137,11 +137,11 @@ static bool gen_gvec_fpst_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
     return true;
 }
 
-static bool gen_gvec_fpst_arg_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
-                                 arg_rr_esz *a, int data)
+static bool gen_gvec_fpst_ah_arg_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
+                                    arg_rr_esz *a, int data)
 {
     return gen_gvec_fpst_zz(s, fn, a->rd, a->rn, data,
-                            a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
+                            select_fpst(s, a->esz));
 }
 
 /* Invoke an out-of-line helper on 3 Zregs. */
@@ -194,6 +194,13 @@ static bool gen_gvec_fpst_arg_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
                              a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64);
 }
 
+static bool gen_gvec_fpst_ah_arg_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                                     arg_rrr_esz *a, int data)
+{
+    return gen_gvec_fpst_zzz(s, fn, a->rd, a->rn, a->rm, data,
+                             select_fpst(s, a->esz));
+}
+
 /* Invoke an out-of-line helper on 4 Zregs. */
 static bool gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int ra, int data)
@@ -3597,13 +3604,13 @@ static gen_helper_gvec_2_ptr * const frecpe_fns[] = {
     NULL,                     gen_helper_gvec_frecpe_h,
     gen_helper_gvec_frecpe_s, gen_helper_gvec_frecpe_d,
 };
-TRANS_FEAT(FRECPE, aa64_sve, gen_gvec_fpst_arg_zz, frecpe_fns[a->esz], a, 0)
+TRANS_FEAT(FRECPE, aa64_sve, gen_gvec_fpst_ah_arg_zz, frecpe_fns[a->esz], a, 0)
 
 static gen_helper_gvec_2_ptr * const frsqrte_fns[] = {
     NULL,                      gen_helper_gvec_frsqrte_h,
     gen_helper_gvec_frsqrte_s, gen_helper_gvec_frsqrte_d,
 };
-TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_arg_zz, frsqrte_fns[a->esz], a, 0)
+TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_ah_arg_zz, frsqrte_fns[a->esz], a, 0)
 
 /*
  *** SVE Floating Point Compare with Zero Group
@@ -3707,11 +3714,18 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
     };                                                              \
     TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_arg_zzz, name##_fns[a->esz], a, 0)
 
+#define DO_FP3_AH(NAME, name) \
+    static gen_helper_gvec_3_ptr * const name##_fns[4] = {          \
+        NULL, gen_helper_gvec_##name##_h,                           \
+        gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
+    };                                                              \
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_ah_arg_zzz, name##_fns[a->esz], a, 0)
+
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
 DO_FP3(FMUL_zzz, fmul)
-DO_FP3(FRECPS, recps)
-DO_FP3(FRSQRTS, rsqrts)
+DO_FP3_AH(FRECPS, recps)
+DO_FP3_AH(FRSQRTS, rsqrts)
 
 #undef DO_FP3
 
@@ -3993,7 +4007,7 @@ static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     gen_helper_sve_frecpx_s, gen_helper_sve_frecpx_d,
 };
 TRANS_FEAT(FRECPX, aa64_sve, gen_gvec_fpst_arg_zpz, frecpx_fns[a->esz],
-           a, 0, a->esz == MO_16 ? FPST_FPCR_F16_A64 : FPST_FPCR_A64)
+           a, 0, select_fpst(s, a->esz))
 
 static gen_helper_gvec_3_ptr * const fsqrt_fns[] = {
     NULL,                   gen_helper_sve_fsqrt_h,
-- 
2.34.1

