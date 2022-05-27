Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1260008lfh;
        Fri, 27 May 2022 13:07:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/P4yyb88FcQ/8RVb6xedgGwLDMzNMOPQc/BxTayCIrLlHGeUiJcooQ8SWNUZ1RxbLbSBP
X-Received: by 2002:a05:622a:4d3:b0:2f3:f775:b274 with SMTP id q19-20020a05622a04d300b002f3f775b274mr34647709qtx.223.1653682066140;
        Fri, 27 May 2022 13:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682066; cv=none;
        d=google.com; s=arc-20160816;
        b=KaQjRBtcmtlTfXFaqN/VkTQItZgPrKiVB6CFOmc2zHRIRLB8cLh34LN1oou1HwwMpG
         a8SXfBE6eDfU0a424Cwh/zZPH2iJBhxKfTV5WJU4Gj2G4blorKEUD16WU6xDbIRvTqM2
         SaG8B2rLzzSVLlHCvxnEjOSTaZHpLSI1Xtb4M2Y2etnmlU4/D3j/eqeSShNldNzsWShv
         FfRtiJUvh9wEPfNnbCoAS+qV0XRfKR24TUbElGVI6D2r31T7h0x+YRCQCGmUM56U3nGa
         uhiS/n4vCEeJYbKvpQ9Jd6qQoEzwXQz1m8/WW0AZj45yzgiks8j0WKy7Lvnp5yIBUvaj
         KiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=raHQbqzS3SPQ0s3aNLkfpyxLHIpS0txyantVzv7wE6E=;
        b=QWp6nYvdIXFkB7Yx62EscePLRJgTz6Xx8AMtw6EBVFcOCuJ3gUsn0LeVEm2zqPlgo2
         7rneulM6ND+lSIYasR9Y+oifA7HP0vnNA6lB67kn2f4ZrwGAwXQagmohzKqOH3lLGEPY
         PneZsxeOlIrt0Cz4tk7a2+jAlVIyVY/APw5jgFsBq2DR+50A6GRJVY4c0RWzs2jfZr7O
         G6JFxff7iafo9+qslhx4Ko9PChm9zHPVLM9YKZ1gKgej/UkRGoNl3WeynXBV9d+cJ/RI
         wGbQ7xYpWzweP65EPhd3QNUYpdn2FE1kEmxdFrTiczb8fLky5ncH0r19buvTXCfe1QYL
         nRcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTiNtkfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020a05622a019100b002fb6f6814b5si3490401qtw.148.2022.05.27.13.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BTiNtkfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugFN-00088K-LT
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefU-0001i2-PB
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:38 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefT-0005Kl-5y
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:36 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h13so4985974pfq.5
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raHQbqzS3SPQ0s3aNLkfpyxLHIpS0txyantVzv7wE6E=;
 b=BTiNtkfBo+tL7vIuSo3uYZ0oqZ9WLFIDyCwrWdanTeQcnyfBDxrX+NQ7hL2+mdMWot
 IZU3pBSvqkZJYEn3WbxFiOgx7mWS83+atiVQ+G7UqP486rqUdTBwYN6NQYz+7EsxUfgT
 hmCPKlm1DrlSFPOa6O3LiGgETe601jg5c4iGnGJUNaXbQ4BKyoBUwVt/BuofwQ8nOVgD
 //Aepg4Cl1M9js1FehfR+eTnhRMdKK4Pt09fOC25nfzFoTqTrDqxtWLG8APJ7Xkx+3se
 UR5PvtQIZb/dK2UmHg0IgKBXptsTdho50hBQxNz2FPeUi9YfTT5drk5m2rH6P1zaaPiA
 chqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raHQbqzS3SPQ0s3aNLkfpyxLHIpS0txyantVzv7wE6E=;
 b=HCMWwWLUFgEnhMp8N94EgPgF57LQ7zErW7xPy1AUqCBeEQeZXofXxwksYeKeLl+tLD
 F5SR53m9l+A6QHzH5LzXfyM9kbxRq1LMJD0Pp3/I4fxj0lLnLnExGTcEm95/O3MY81mX
 5YD0RFDRfTXMMxo1GOx7yxjGEzLJHkmy25b4XXFr0N1oyEDNQoe7ZGYvw1z6ON2zWheY
 MsdBvGAr/ONJJzKag8ugf/Pp2dcS2FEpFVBv7Ksj/i0EomiQMujDi8OjJ0KxD86oZ1Nb
 JlhJsU4bzLp+Lb+XvtjWzRYI2Hd0icwjyS83RSBf7aNuVtDsOfuOlSS4MwwYAACCDDmk
 vqNg==
X-Gm-Message-State: AOAM532P0+jLKZ5ensxszfCiMgFE/Y528o6A3ELpPOymsEvSPd4Uj9WQ
 ViQ4Bg023C3yKEkVT6VnxAd6YGtSkYzS7Q==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr38112574pgw.489.1653675993792; 
 Fri, 27 May 2022 11:26:33 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 091/114] target/arm: Use TRANS_FEAT for FRECPE, FRSQRTE
Date: Fri, 27 May 2022 11:18:44 -0700
Message-Id: <20220527181907.189259-92-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: O/TxpFGt9Jbc

Rename do_zz_fp to gen_gvec_fpst_arg_zz, and move up.
Split out gen_gvec_fpst_zz as a helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 77 ++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4a9ecd5e72..2f7651249a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -152,6 +152,32 @@ static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
     return true;
 }
 
+static bool gen_gvec_fpst_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
+                             int rd, int rn, int data,
+                             ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
+                                 arg_rr_esz *a, int data)
+{
+    return gen_gvec_fpst_zz(s, fn, a->rd, a->rn, data,
+                            a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs. */
 static bool gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int rm, int data)
@@ -3627,48 +3653,17 @@ DO_VPZ(FMAXV, fmaxv)
  *** SVE Floating Point Unary Operations - Unpredicated Group
  */
 
-static void do_zz_fp(DisasContext *s, arg_rr_esz *a, gen_helper_gvec_2_ptr *fn)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+static gen_helper_gvec_2_ptr * const frecpe_fns[] = {
+    NULL,                     gen_helper_gvec_frecpe_h,
+    gen_helper_gvec_frecpe_s, gen_helper_gvec_frecpe_d,
+};
+TRANS_FEAT(FRECPE, aa64_sve, gen_gvec_fpst_arg_zz, frecpe_fns[a->esz], a, 0)
 
-    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
-                       vec_full_reg_offset(s, a->rn),
-                       status, vsz, vsz, 0, fn);
-    tcg_temp_free_ptr(status);
-}
-
-static bool trans_FRECPE(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2_ptr * const fns[3] = {
-        gen_helper_gvec_frecpe_h,
-        gen_helper_gvec_frecpe_s,
-        gen_helper_gvec_frecpe_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        do_zz_fp(s, a, fns[a->esz - 1]);
-    }
-    return true;
-}
-
-static bool trans_FRSQRTE(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2_ptr * const fns[3] = {
-        gen_helper_gvec_frsqrte_h,
-        gen_helper_gvec_frsqrte_s,
-        gen_helper_gvec_frsqrte_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        do_zz_fp(s, a, fns[a->esz - 1]);
-    }
-    return true;
-}
+static gen_helper_gvec_2_ptr * const frsqrte_fns[] = {
+    NULL,                      gen_helper_gvec_frsqrte_h,
+    gen_helper_gvec_frsqrte_s, gen_helper_gvec_frsqrte_d,
+};
+TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_arg_zz, frsqrte_fns[a->esz], a, 0)
 
 /*
  *** SVE Floating Point Compare with Zero Group
-- 
2.34.1

