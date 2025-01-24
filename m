Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp930478njk;
        Fri, 24 Jan 2025 08:35:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyOpGDUK/qtzN0Wh4IobAC2teuZl4An6MVTCiB0cTsyZvVajd2zmCmVO3pA/hpAbyFV9bMTpNWsoMQow==@linaro.org
X-Google-Smtp-Source: AGHT+IFFGhjjF+Da2TN1/t5nR4DaeNCjzjUG4IrYiYKku+CpQd1CyhcrkCTawBiNk1AbjKHfqS83
X-Received: by 2002:a05:620a:4093:b0:7b6:6ee8:6c06 with SMTP id af79cd13be357-7be6323efeamr4582998885a.30.1737736515674;
        Fri, 24 Jan 2025 08:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736515; cv=none;
        d=google.com; s=arc-20240605;
        b=P2sIh+46YSwpXlZO3kvUjbNhWzUlDa5QgD1HGo+RsFgDXL+rO4bVy/SUtz/nwKBCu3
         0DQYeEw2Pr7trNIvfbPEpXX1Nmohvq1qlAcHticED6SuB4SrBIWRrsDMbA1PlGIHalHj
         1vOg8Ips6oOcSC3YF6sf+bJpDQ5x5RzmNoc6DU3LiErMwe34nH/o2GmybVuuiW7e8t32
         HVAxL11y7f1NVL8JK8UDZKr/dIRc8GFWnp5J430aQpfrGNnzUdYO0BtDLiziI6med1yQ
         wArxomOwE6Hwtqb/08jjtgl9qWqNJca1HGc0a0gkb/t7HviwZ/TpgrLPtB6DbWVywIEj
         +Cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=90zJmscshgzp9ZgdoGcA5ll/KJlD0eY0cc5R60hdHPs=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=IdfbQt+pNBDZG0FCGjbZTOg3nYKNIy5PVJJkBDccTEHVWXZHKIpnpWgipetsVKzaU/
         QUF8fcKoJmKYwRDpe5rXxqoPovpr5xjUCEbJyR6rVnfuMJzhd1rbSViY20WvRdzxQWBR
         9OmlpOFwPigHpeenVWmBgFORqPqrboN10/CnuhJNfGjtQVihgWgID+1K8xNp7EczdRwH
         L/GU2dQTfGessmqEv3FTALC0LT9I3Di5xhHNpdgOgAcMbzXcTc4ScFvYjLrXTzdY+f0C
         IrFS/hmM/iCZLlKEE6/cFf5YVQx5MB7/7KTlGIwl1SgzFMmT3WWWgSFg8irdMz4J4sbQ
         EnsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuWYvr1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee1300si263580085a.271.2025.01.24.08.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:35:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuWYvr1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMdU-0007oG-E5; Fri, 24 Jan 2025 11:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZO-0005vu-Ry
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:19 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZC-0005no-VP
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:02 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso16648375e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736196; x=1738340996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=90zJmscshgzp9ZgdoGcA5ll/KJlD0eY0cc5R60hdHPs=;
 b=RuWYvr1S3NUOPhXC8O10QG/OeR9E3Orxn84gacT8jyeexzIId6ks5Sua7nXwV5Y4vh
 2sn3N4NRSMSWkYQQuqQStnGZ0FRDXmIsTk1VWBN2W5my7nzWrxdPuLpfgBacQPXBVctY
 yzcqeUT8WrYaLJ+26VCitMHmxB6rsYT8TuII66pWxG0IIAaSSdQDMpC1an9Ys19hK3dQ
 8jehjPGM6WyKltCnaULzcEZ5Lbva0oXryk+HS8iaaG6BTF+/+g9OLqKFSuqR38EZmw/b
 fO5PnkRzSLf+DK40Kf64dE2ZtWXwLJKU47C0NZszFSMQBAe4G5F8zO0XExIQPo4w0Oac
 tXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736196; x=1738340996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=90zJmscshgzp9ZgdoGcA5ll/KJlD0eY0cc5R60hdHPs=;
 b=GRLqPnJKAtnGTqN076Y9CL3wpkTsmR4s7XXeyXvMx47+fGVFvtv7QsLGT7F6yFW9B8
 wzFdDPon9V1Q087OT+5yy1lmR0wQEnmsRnS8pmezU4IiOWtDXatyjpmJJ9xOtRAK7Yoe
 Y3Rh+Tcc7KPUDkCq/oc029YZsGRZm/RIQEjD0N+Dvsuf2E8zTCLbZyEYM5EaaHjNZigJ
 054zuU4KhJxH5tJcpsO9R8f7wSVYHmwTf4FZsfmNpZJ8vz+ymrKwy2J4JGfJFHICwTfu
 4P/nxX+vYiG01Y2/fH/cFBBgHCipVQjW6yE2PSDKmLwauJbb0EE30CI4Zqo2soWzel/C
 La1w==
X-Gm-Message-State: AOJu0YynU8V986noEBlnLOOaFHh2aLMTgt/bSP70hyDa5hOVRvCS4Bxs
 eDjvJfvZkglFEbnxOklOkcn7rPUGU4Q3+TUfdnxCNjVlOxgPh/KHz1zTerugC6goQCMOpG7I0ay
 4
X-Gm-Gg: ASbGncvXrDYnTJn3mWKQPk0INuDRBD6M6l9Ki3K/9xJmr4dsbNy0zZj1d6JK0N3FeCB
 EEw5R5IZkkvta4T8z21kS5RZBheGZYtNIpqibNIiEsUcl9p4N7pEa/FrE92WCTYvHazoDOMTljr
 lVkEVnfj0PfYQGrkG8mdr0MyZUNAyT+xqtO4DxETx1WkOK7aiUnvWrpe8vQ6vXGueKtpxZBcIxs
 pgi3TCoAYhG1Uzg9akCY5KZc+GMQU5IsLRpkR+eURqvL+75Dj4GF4uf5W+PfAA3S6PHGTHtlK0T
 Vh9IUV1fhDM=
X-Received: by 2002:a5d:47c7:0:b0:388:da10:ff13 with SMTP id
 ffacd0b85a97d-38c11e4af44mr20629251f8f.21.1737736196287; 
 Fri, 24 Jan 2025 08:29:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 62/76] target/arm: Handle FPCR.AH in FRECPS and FRSQRTS vector
 insns
Date: Fri, 24 Jan 2025 16:28:22 +0000
Message-Id: <20250124162836.2332150-63-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: 2Qnva2ndhAXb

Handle the FPCR.AH "don't negate the sign of a NaN" semantics
in the vector versions of FRECPS and FRSQRTS, by implementing
new vector wrappers that call the _ah_ scalar helpers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 ++++++++++++++
 target/arm/tcg/translate-a64.c | 21 ++++++++++++++++-----
 target/arm/tcg/translate-sve.c |  7 ++++++-
 target/arm/tcg/vec_helper.c    |  8 ++++++++
 4 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 29c70f054af..a2e96a498dd 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -980,6 +980,20 @@ DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_ah_recps_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_recps_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_recps_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_5(gvec_ah_rsqrts_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_rsqrts_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_rsqrts_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ah_fmax_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_ah_fmax_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 977a1589e53..3fe8e041093 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5778,10 +5778,11 @@ static bool do_fp3_vector_2fn(DisasContext *s, arg_qrrr_e *a, int data,
     return do_fp3_vector(s, a, data, s->fpcr_ah ? fah : fnormal);
 }
 
-static bool do_fp3_vector_ah(DisasContext *s, arg_qrrr_e *a, int data,
-                             gen_helper_gvec_3_ptr * const f[3])
+static bool do_fp3_vector_ah_2fn(DisasContext *s, arg_qrrr_e *a, int data,
+                                 gen_helper_gvec_3_ptr * const fnormal[3],
+                                 gen_helper_gvec_3_ptr * const fah[3])
 {
-    return do_fp3_vector_with_fpsttype(s, a, data, f,
+    return do_fp3_vector_with_fpsttype(s, a, data, s->fpcr_ah ? fah : fnormal,
                                        select_fpst(s, a->esz));
 }
 
@@ -5924,14 +5925,24 @@ static gen_helper_gvec_3_ptr * const f_vector_frecps[3] = {
     gen_helper_gvec_recps_s,
     gen_helper_gvec_recps_d,
 };
-TRANS(FRECPS_v, do_fp3_vector_ah, a, 0, f_vector_frecps)
+static gen_helper_gvec_3_ptr * const f_vector_ah_frecps[3] = {
+    gen_helper_gvec_ah_recps_h,
+    gen_helper_gvec_ah_recps_s,
+    gen_helper_gvec_ah_recps_d,
+};
+TRANS(FRECPS_v, do_fp3_vector_ah_2fn, a, 0, f_vector_frecps, f_vector_ah_frecps)
 
 static gen_helper_gvec_3_ptr * const f_vector_frsqrts[3] = {
     gen_helper_gvec_rsqrts_h,
     gen_helper_gvec_rsqrts_s,
     gen_helper_gvec_rsqrts_d,
 };
-TRANS(FRSQRTS_v, do_fp3_vector_ah, a, 0, f_vector_frsqrts)
+static gen_helper_gvec_3_ptr * const f_vector_ah_frsqrts[3] = {
+    gen_helper_gvec_ah_rsqrts_h,
+    gen_helper_gvec_ah_rsqrts_s,
+    gen_helper_gvec_ah_rsqrts_d,
+};
+TRANS(FRSQRTS_v, do_fp3_vector_ah_2fn, a, 0, f_vector_frsqrts, f_vector_ah_frsqrts)
 
 static gen_helper_gvec_3_ptr * const f_vector_faddp[3] = {
     gen_helper_gvec_faddp_h,
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 0696192148c..eef3623fd3a 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3741,7 +3741,12 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
         NULL, gen_helper_gvec_##name##_h,                           \
         gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
     };                                                              \
-    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_ah_arg_zzz, name##_fns[a->esz], a, 0)
+    static gen_helper_gvec_3_ptr * const name##_ah_fns[4] = {       \
+        NULL, gen_helper_gvec_ah_##name##_h,                        \
+        gen_helper_gvec_ah_##name##_s, gen_helper_gvec_ah_##name##_d    \
+    };                                                              \
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_ah_arg_zzz,            \
+               s->fpcr_ah ? name##_ah_fns[a->esz] : name##_fns[a->esz], a, 0)
 
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index aa42c50f9fe..bf6f6a97636 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1498,6 +1498,14 @@ DO_3OP(gvec_rsqrts_h, helper_rsqrtsf_f16, float16)
 DO_3OP(gvec_rsqrts_s, helper_rsqrtsf_f32, float32)
 DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
 
+DO_3OP(gvec_ah_recps_h, helper_recpsf_ah_f16, float16)
+DO_3OP(gvec_ah_recps_s, helper_recpsf_ah_f32, float32)
+DO_3OP(gvec_ah_recps_d, helper_recpsf_ah_f64, float64)
+
+DO_3OP(gvec_ah_rsqrts_h, helper_rsqrtsf_ah_f16, float16)
+DO_3OP(gvec_ah_rsqrts_s, helper_rsqrtsf_ah_f32, float32)
+DO_3OP(gvec_ah_rsqrts_d, helper_rsqrtsf_ah_f64, float64)
+
 DO_3OP(gvec_ah_fmax_h, helper_vfp_ah_maxh, float16)
 DO_3OP(gvec_ah_fmax_s, helper_vfp_ah_maxs, float32)
 DO_3OP(gvec_ah_fmax_d, helper_vfp_ah_maxd, float64)
-- 
2.34.1

