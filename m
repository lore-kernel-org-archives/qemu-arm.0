Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3788917dye;
        Wed, 2 Jul 2025 05:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWgmG9TXyg+gKBNnpiyrNXiG3y/Qy1dz+7oI4qgBMJ7JXY1swCaNEZco4GNpv5kCMKsC/ZgIaERzbC7g==@linaro.org
X-Google-Smtp-Source: AGHT+IHbPDJp3OOWV3wWnOoP17Jci7qhNN9gWf4qACbhsjTr4UwlldJjQiqcaQukxb5yAoeqXNzR
X-Received: by 2002:a05:6214:5d82:b0:6fa:abd2:f2bb with SMTP id 6a1803df08f44-702b201644dmr34011876d6.8.1751460887517;
        Wed, 02 Jul 2025 05:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460887; cv=none;
        d=google.com; s=arc-20240605;
        b=Hcl15F1SYxlUpjRuvRWrKHGOFs3RdzhElcczkLzY6gV7M2U8soQQKthw/OMts6lpIQ
         /Nt559f/5axS7O2rIzaT07fpzaV9MmGtcMEvpPxO+qRUhSj2GV2y8j730Fzn4/i/aQIF
         DJ0NegU4brlAtTC+VxMPrgsLYRnB/Jisfhl4mWGkgQoH8AjN9KR3O9VAlhBrhbLC7V2f
         MlHQWdfVNwU/rjeNZfrXKjltA5QN+kxfZsh+nEN6M2Mx+887CTrypo7YFLJJVNNcm9mu
         IJYA5R0ZjiSxY66nPkMi3heRfVP/nFM9CHU7Gf/uRGQ8/gEr0YW3uRh9Sj8FXshGHe+Z
         j9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BetRDS8kkp6nmhqyj4FBx1q2luREYqTuIuf/DGCbtB0=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=k9vdRPW9wMSK0wmSI/Dt0da3Eai1u5b8JIQ5ma9OEqrfPQw38/hBO93CerdGYYhoZX
         3BUUbHRK9V2VKHVfFe3SSD+NJO5XhckiLnkdbwNq6PK7X0uPIp+z5Xay0Nd9ZhOxjiSJ
         h/TUZwCzKR5KwBGk1wo9482amdRFd4cKWrsp1ZpdAkJYhzNFdufJffnfEUPrEXUL0Iog
         pLVeSuGGrTvOeBi5BgSmAmsS7cnHXKI4bA3VZJ37eKgNegEpI7J3iRyQdFzU61zNUrAj
         uC7cwQIirnK9+OVNRyoO8xGJ68yX6md33Dt1nc8ED99RI67wbi2O2Ob1L4Zf77bLg5kh
         EH0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBdyGqAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7736b048si137570176d6.302.2025.07.02.05.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBdyGqAK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwjq-0004Wv-KR; Wed, 02 Jul 2025 08:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgS-0008Qx-9Z
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:29 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgA-00019c-6M
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:28 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2ea65f5a0easo3849026fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459699; x=1752064499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BetRDS8kkp6nmhqyj4FBx1q2luREYqTuIuf/DGCbtB0=;
 b=MBdyGqAKjRsENZIVkGWh/KHNHsxdQaaOKetrqr//iMJvAU5IqfKN2wQrFNM97NB/Tl
 xbStDLqySRftfLsaC6L8HU/rcu2GvtOmeJeaT7iDPBvW/5RK2PU7Ytjr1OdNMkVBOaDV
 8FbP2Aoa9tFdn8GE8ewfNKcGT/lQSvJT/LrEqBY0ojz8slkxZdEf1R0QYDQWNIInlznU
 A38cKkty07e+VeKXbk3G3XBTFs9BjOnmPuBfUE+vjhI8clz/r96dYtNQctoXWt/NkKK/
 t5szB1qBixZxlIxbOZQhb9NJfkDQWkaMHPAFCqu5YGCMRNB9nnqrw7xc346XU3nuWItX
 sY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459699; x=1752064499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BetRDS8kkp6nmhqyj4FBx1q2luREYqTuIuf/DGCbtB0=;
 b=A2JvhaPlNZ1Rxi5nQa1044TA5qeziH46rd23rOy1rFeOw01YEGuP3yxdHT7IULgdh8
 qV8AarHxJ+SZ7NxXO3r0ANcVdMtSzkGlMIdTjEE48FODfKT554VdBtMlSdJFC9NVjee/
 8o+KoOZoX0+1OD4eZiarcHsbJBRD6q9c34/iGX7cPzCPzz01vfQZUfR1kVxlsHQUngiu
 SDzDRF0q7N0Bn1zciXmc4eLch7Lp2cE8p/QY2EhOedBgqFVNySqQQdoJxDR8giPFF97q
 oXbv+bR2VFu/A+KBtR075vnzUgvyhExxFcasIiefAvanM2W2+pH/6x6NK9AItxlVzM/k
 Ldcw==
X-Gm-Message-State: AOJu0YzTd+3Uvh6Rp7LljyX3W7FqVgYtxJzbTm+Uu4UXTdvzXud7wAz4
 19ESjg8QtovpwJUDCN++MwAFeOdgQiV3vrtV/1fw4IP0MAQCNCJ/eemkx97Q2yXlc8M=
X-Gm-Gg: ASbGncuJwyqPjfo/yGQ3BynLP9UogCWtlU7Skem+0687Khzf/FZyKKNbsACaZ1ZwILJ
 U4EAzOZtn6R77i8YZ4huZZIgZRn9byY2TwrSV5jc3fLR5IfmxY3MFmMb5ZIvIwGY7QIRgG31YYt
 bwKK8IaeFLuDTdZUj0wdZpUEO/SmZUQHRM+w0+jCyx6l3TLgec7KLvh8mP5rWIUpG9IrbwcE40E
 s3U3IFBAB5FWfgmSLO5lWRZKGxknCEGrRKTQFWEebUsimNUcTUVw5I4TTFsl/R0SWSg608T/3Qy
 v56ef1MfgUmhaR8n0a3KOcQgKWDWg9Caro5e4gwTIW/U2DnkVIiMnfyuWE3liTb/euyDog==
X-Received: by 2002:a05:6870:469f:b0:2da:b440:5b1 with SMTP id
 586e51a60fabf-2f6472a5f71mr1780832fac.5.1751459699525; 
 Wed, 02 Jul 2025 05:34:59 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 38/97] target/arm: Implement SME2 FMLA, FMLS
Date: Wed,  2 Jul 2025 06:33:11 -0600
Message-ID: <20250702123410.761208-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
X-TUID: 5S/ngdZ8LALq

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 95 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 48 +++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 070cebc573..5f51369609 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -815,6 +815,47 @@ TRANS_FEAT(SUB_azz_nn_d, aa64_sme2_i16i64, do_azz_nn, a, MO_64, tcg_gen_gvec_sub
  */
 #define FPST_ENV  -1
 
+static bool do_azz_fp(DisasContext *s, int nreg, int nsel,
+                      int rv, int off, int zn, int zm,
+                      int data, int shsel, bool multi, int fpst,
+                      gen_helper_gvec_3_ptr *fn)
+{
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int vstride = svl / nreg;
+        TCGv_ptr t_za = get_zarray(s, rv, off, nreg, nsel);
+        TCGv_ptr t, ptr;
+
+        if (fpst >= 0) {
+            ptr = fpstatus_ptr(fpst);
+        } else {
+            ptr = tcg_env;
+        }
+        t = tcg_temp_new_ptr();
+
+        for (int r = 0; r < nreg; ++r) {
+            TCGv_ptr t_zn = vec_full_reg_ptr(s, zn);
+            TCGv_ptr t_zm = vec_full_reg_ptr(s, zm);
+
+            for (int i = 0; i < nsel; ++i) {
+                int o_za = (r * vstride + i) * sizeof(ARMVectorReg);
+                int desc = simd_desc(svl, svl, data | (i << shsel));
+
+                tcg_gen_addi_ptr(t, t_za, o_za);
+                fn(t, t_zn, t_zm, ptr, tcg_constant_i32(desc));
+            }
+
+            /*
+             * For multiple-and-single vectors, Zn may wrap.
+             * For multiple vectors, both Zn and Zm are aligned.
+             */
+            zn = (zn + 1) % 32;
+            zm += multi;
+        }
+    }
+    return true;
+}
+
 static bool do_azz_acc_fp(DisasContext *s, int nreg, int nsel,
                           int rv, int off, int zn, int zm,
                           int data, int shsel, bool multi, int fpst,
@@ -963,6 +1004,60 @@ static bool do_vdot(DisasContext *s, arg_azx_n *a, gen_helper_gvec_4_ptr *fn)
 TRANS_FEAT(FVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_fvdot_idx_h)
 TRANS_FEAT(BFVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_bfvdot_idx)
 
+static bool do_fmla(DisasContext *s, arg_azz_n *a, bool multi,
+                    ARMFPStatusFlavour fpst, gen_helper_gvec_3_ptr *fn)
+{
+    return do_azz_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                     0, 0, multi, fpst, fn);
+}
+
+TRANS_FEAT(FMLA_n1_h, aa64_sme_f16f16, do_fmla, a, false, FPST_ZA_F16,
+           gen_helper_gvec_vfma_h)
+TRANS_FEAT(FMLS_n1_h, aa64_sme_f16f16, do_fmla, a, false, FPST_ZA_F16,
+           s->fpcr_ah ? gen_helper_gvec_ah_vfms_h : gen_helper_gvec_vfms_h)
+TRANS_FEAT(FMLA_nn_h, aa64_sme_f16f16, do_fmla, a, true, FPST_ZA_F16,
+           gen_helper_gvec_vfma_h)
+TRANS_FEAT(FMLS_nn_h, aa64_sme_f16f16, do_fmla, a, true, FPST_ZA_F16,
+           s->fpcr_ah ? gen_helper_gvec_ah_vfms_h : gen_helper_gvec_vfms_h)
+
+TRANS_FEAT(FMLA_n1_s, aa64_sme2, do_fmla, a, false, FPST_ZA,
+           gen_helper_gvec_vfma_s)
+TRANS_FEAT(FMLS_n1_s, aa64_sme2, do_fmla, a, false, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_vfms_s : gen_helper_gvec_vfms_s)
+TRANS_FEAT(FMLA_nn_s, aa64_sme2, do_fmla, a, true, FPST_ZA,
+           gen_helper_gvec_vfma_s)
+TRANS_FEAT(FMLS_nn_s, aa64_sme2, do_fmla, a, true, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_vfms_s : gen_helper_gvec_vfms_s)
+
+TRANS_FEAT(FMLA_n1_d, aa64_sme2_f64f64, do_fmla, a, false, FPST_ZA,
+           gen_helper_gvec_vfma_d)
+TRANS_FEAT(FMLS_n1_d, aa64_sme2_f64f64, do_fmla, a, false, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_vfms_d : gen_helper_gvec_vfms_d)
+TRANS_FEAT(FMLA_nn_d, aa64_sme2_f64f64, do_fmla, a, true, FPST_ZA,
+           gen_helper_gvec_vfma_d)
+TRANS_FEAT(FMLS_nn_d, aa64_sme2_f64f64, do_fmla, a, true, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_vfms_d : gen_helper_gvec_vfms_d)
+
+static bool do_fmla_nx(DisasContext *s, arg_azx_n *a,
+                       ARMFPStatusFlavour fpst, gen_helper_gvec_4_ptr *fn)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                         a->idx, 0, false, fpst, fn);
+}
+
+TRANS_FEAT(FMLA_nx_h, aa64_sme_f16f16, do_fmla_nx, a, FPST_ZA_F16,
+           gen_helper_gvec_fmla_idx_h)
+TRANS_FEAT(FMLS_nx_h, aa64_sme_f16f16, do_fmla_nx, a, FPST_ZA_F16,
+           s->fpcr_ah ? gen_helper_gvec_ah_fmls_idx_h : gen_helper_gvec_fmls_idx_h)
+TRANS_FEAT(FMLA_nx_s, aa64_sme2, do_fmla_nx, a, FPST_ZA,
+           gen_helper_gvec_fmla_idx_s)
+TRANS_FEAT(FMLS_nx_s, aa64_sme2, do_fmla_nx, a, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_fmls_idx_s : gen_helper_gvec_fmls_idx_s)
+TRANS_FEAT(FMLA_nx_d, aa64_sme2_f64f64, do_fmla_nx, a, FPST_ZA,
+           gen_helper_gvec_fmla_idx_d)
+TRANS_FEAT(FMLS_nx_d, aa64_sme2_f64f64, do_fmla_nx, a, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_fmls_idx_d : gen_helper_gvec_fmls_idx_d)
+
 /*
  * Expand array multi-vector single (n1), array multi-vector (nn),
  * and array multi-vector indexed (nx), for integer accumulate.
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 934e4a802e..962ffae3d6 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -370,6 +370,20 @@ USMLALL_n1_s    11000001 001 1 .... 0 .. 000 ..... 0010 .   @azz_nx1_o1x4 n=4
 SUMLALL_n1_s    11000001 001 0 .... 0 .. 000 ..... 1010 .   @azz_nx1_o1x4 n=2
 SUMLALL_n1_s    11000001 001 1 .... 0 .. 000 ..... 1010 .   @azz_nx1_o1x4 n=4
 
+FMLA_n1_h       11000001 001 0 .... 0 .. 111 ..... 00 ...   @azz_nx1_o3 n=2
+FMLA_n1_s       11000001 001 0 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=2
+FMLA_n1_d       11000001 011 0 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=2
+FMLA_n1_h       11000001 001 1 .... 0 .. 111 ..... 00 ...   @azz_nx1_o3 n=4
+FMLA_n1_s       11000001 001 1 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=4
+FMLA_n1_d       11000001 011 1 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=4
+
+FMLS_n1_h       11000001 001 0 .... 0 .. 111 ..... 01 ...   @azz_nx1_o3 n=2
+FMLS_n1_s       11000001 001 0 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=2
+FMLS_n1_d       11000001 011 0 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=2
+FMLS_n1_h       11000001 001 1 .... 0 .. 111 ..... 01 ...   @azz_nx1_o3 n=4
+FMLS_n1_s       11000001 001 1 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=4
+FMLS_n1_d       11000001 011 1 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -470,6 +484,20 @@ UMLSLL_nn_d     11000001 111 ...01 0 .. 000 ...00 1100 .    @azz_4x4_o1x4
 USMLALL_nn_s    11000001 101 ....0 0 .. 000 ....0 0010 .    @azz_2x2_o1x4
 USMLALL_nn_s    11000001 101 ...01 0 .. 000 ...00 0010 .    @azz_4x4_o1x4
 
+FMLA_nn_h       11000001 101 ....0 0 .. 100 ....0 01 ...    @azz_2x2_o3
+FMLA_nn_s       11000001 101 ....0 0 .. 110 ....0 00 ...    @azz_2x2_o3
+FMLA_nn_d       11000001 111 ....0 0 .. 110 ....0 00 ...    @azz_2x2_o3
+FMLA_nn_h       11000001 101 ...01 0 .. 100 ...00 01 ...    @azz_4x4_o3
+FMLA_nn_s       11000001 101 ...01 0 .. 110 ...00 00 ...    @azz_4x4_o3
+FMLA_nn_d       11000001 111 ...01 0 .. 110 ...00 00 ...    @azz_4x4_o3
+
+FMLS_nn_h       11000001 101 ....0 0 .. 100 ....0 11 ...    @azz_2x2_o3
+FMLS_nn_s       11000001 101 ....0 0 .. 110 ....0 01 ...    @azz_2x2_o3
+FMLS_nn_d       11000001 111 ....0 0 .. 110 ....0 01 ...    @azz_2x2_o3
+FMLS_nn_h       11000001 101 ...01 0 .. 100 ...00 11 ...    @azz_4x4_o3
+FMLS_nn_s       11000001 101 ...01 0 .. 110 ...00 01 ...    @azz_4x4_o3
+FMLS_nn_d       11000001 111 ...01 0 .. 110 ...00 01 ...    @azz_4x4_o3
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
@@ -617,3 +645,23 @@ USMLALL_nx_s    11000001 0001 .... 1 .. 0.. ...01 00 ...    @azx_4x1_i4_o1
 SUMLALL_nx_s    11000001 0000 .... . .. ... ..... 101 ..    @azx_1x1_i4_o2
 SUMLALL_nx_s    11000001 0001 .... 0 .. 0.. ....1 10 ...    @azx_2x1_i4_o1
 SUMLALL_nx_s    11000001 0001 .... 1 .. 0.. ...01 10 ...    @azx_4x1_i4_o1
+
+%idx3_10_3      10:2 3:1
+@azx_2x1_i3_o3  ........ .... zm:4 . .. ... ..... .. off:3  \
+                &azx_n n=2 rv=%mova_rv zn=%zn_ax2 idx=%idx3_10_3
+@azx_4x1_i3_o3  ........ .... zm:4 . .. ... ..... .. off:3  \
+                &azx_n n=4 rv=%mova_rv zn=%zn_ax4 idx=%idx3_10_3
+
+FMLA_nx_h       11000001 0001 .... 0 .. 1.. ....0 0 ....    @azx_2x1_i3_o3
+FMLA_nx_s       11000001 0101 .... 0 .. 0.. ....0 00 ...    @azx_2x1_i2_o3
+FMLA_nx_d       11000001 1101 .... 0 .. 00. ....0 00 ...    @azx_2x1_i1_o3
+FMLA_nx_h       11000001 0001 .... 1 .. 1.. ...00 0 ....    @azx_4x1_i3_o3
+FMLA_nx_s       11000001 0101 .... 1 .. 0.. ...00 00 ...    @azx_4x1_i2_o3
+FMLA_nx_d       11000001 1101 .... 1 .. 00. ...00 00 ...    @azx_4x1_i1_o3
+
+FMLS_nx_h       11000001 0001 .... 0 .. 1.. ....0 1 ....    @azx_2x1_i3_o3
+FMLS_nx_s       11000001 0101 .... 0 .. 0.. ....0 10 ...    @azx_2x1_i2_o3
+FMLS_nx_d       11000001 1101 .... 0 .. 00. ....0 10 ...    @azx_2x1_i1_o3
+FMLS_nx_h       11000001 0001 .... 1 .. 1.. ...00 1 ....    @azx_4x1_i3_o3
+FMLS_nx_s       11000001 0101 .... 1 .. 0.. ...00 10 ...    @azx_4x1_i2_o3
+FMLS_nx_d       11000001 1101 .... 1 .. 00. ...00 10 ...    @azx_4x1_i1_o3
-- 
2.43.0

