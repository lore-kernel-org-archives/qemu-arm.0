Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775432njk;
        Mon, 27 Jan 2025 15:28:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUEoK6I1JlQR94/UC/IRXwOqRyZ0Ol4EPi3FfwJKHxX6flqAty9nt4BVlUDW56vIwCM8VgqLrqiDYuvw==@linaro.org
X-Google-Smtp-Source: AGHT+IG/Q+n0ZNz77cbT7RwhoKL4hcQ2eaWa7YKatDxWiHZejjET+3A1YITpa82LkndjJWFUsPkU
X-Received: by 2002:a05:622a:58e:b0:467:6cd9:3093 with SMTP id d75a77b69052e-46e12bc2747mr629186571cf.46.1738020539710;
        Mon, 27 Jan 2025 15:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020539; cv=none;
        d=google.com; s=arc-20240605;
        b=Ix8XossPg/EWcfuDpj6U1gDT/0NG37H0FLXl/2BIglCywZxNfAJ1UZqyCy0q1b6btP
         qhj0uZfi9D/bhV3bndSKOwWY7ygzRyNNJBa2J4kGWPr5XNw1TruKtRjOC7vxs6cXhBFO
         eStmATFhqAzCaeA3djCZNdlDE1lygKXslM3aPvHwZchbhRyRzYdbTE81+eRVYKc3fsK1
         IcyPCP/iYSOa3nXktOlEwiUFMVj5S0/0AUHbl6vBLEgS+vd6YR10eeeEwq+tcXb2+0Us
         AOZJtk2JcXOi0t3fQVpey+njNDGVjW1ea7CvdpDFnP9uDDc9lHQ/lYUdONkbe4KgMc1g
         qeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cEKr8gn5r7dTPdnjanNubYZRqYeexGmGHnTnYnhCaJY=;
        fh=VIVSOf23Az03uZKmoTPzBpyuFw1VcE18Qn1Zj8jpHcc=;
        b=MubfwfsH8v9BUPrGsylLTiBWnIyjgREToCtjrGa19mkbxqZNvtsDdRSWUJznusXIYj
         V7IvYP11lP8gX7dR3qZGIYWNwo1GI70DTZgvGiwAuI1LFh5HPGdiPtSytQ72hUBhJwjw
         l0KNQn0uoWNIzmxb+dfKoHO9F9ax0lo9XbeKTRQcBP7gWsi6rvCZR9cX2NPyoRmYTrdK
         cUWOXrrkM6A6GeZ8ExEjXS0ZUgJsAoK5v0AHtNo8lFwoPBLcB76lLmbTPM94DnN5h2aQ
         1p9UNXaRuu9lWJ1Itaoj3ltPiC+LzViZ/t6sE87qgbvpM/tCe1Lf8kZn8atGOkK1wsy6
         PMVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSlkFC3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df7259si117782816d6.238.2025.01.27.15.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:28:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSlkFC3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYUw-0006UA-1a; Mon, 27 Jan 2025 18:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUf-0006Ki-DE
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:14 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUb-0005Wf-N6
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:13 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2eeb4d643a5so8818459a91.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020368; x=1738625168; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEKr8gn5r7dTPdnjanNubYZRqYeexGmGHnTnYnhCaJY=;
 b=PSlkFC3Z2EqKhl6nuMtDF77SUd6tdoT41TluYEP0jltinzEL7jbdel9SCMJWZNLp3t
 cnSNyTnjhqni9bsIWSbG6Oi/XI3dPQXS8b+WW9y+IUl7B+/kyKrCF38wJT72L31lFQrr
 S3OKNbZXjX1MzujaYaoZAQBtgFmpoxq98EUw92Ul3ak2vSmq015UTueDAoHHELjRtrLe
 EjtHsdZUFj1YO6QddhNzw/TlgIygNdyC0GbxwjgX6uKSRLWn7eghP2Flzp4Ytw5MsrQB
 PayBUMqZYozXjVXf7inA3qNVO60ZblIHbKZ4eiy8Glz8q/rvqXAnGQqoLYZiHB2xOfZk
 +K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020368; x=1738625168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cEKr8gn5r7dTPdnjanNubYZRqYeexGmGHnTnYnhCaJY=;
 b=eQ2mkUjIh7dlDYLWjQepYtrqzXDKdYgl0URM861MqPbdhkM3UwhiSNBCAepUHQFkSG
 n9hzt3DPozrTCMDNsdmYPT22+ZOQTY4LD7alEL135zYDDg4T0iT5ha+ywP4Ya86mnbLQ
 ZsYUws0GTdIUBY+o45+36vHgEkjLmGH+O6mM55yQlB7dxTM1g6qrt9SezeAGq7w97YR6
 +WS6PozPO9Ipj/jVur5IfRB61uWJd8D0ybHD6/xInWF1n41BFPzCJ6NG/pmFglvvjcRx
 /qWJWDpFgm1bLLZI90dWGPWFGNLuLzxSuGkjGWZ1zugZb2zqVNd+dxjWSw8zGuY4iORA
 +moA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvg3O7B1W8JRL/lV3hhaMPKG+tIhy+cQPABUIfmPaIJC1AwX6n+WIhQtaiYIZo/qKuB6EYXDu+fA==@nongnu.org
X-Gm-Message-State: AOJu0YzQe31iBq+1D8sPbpM7aNlcI6HJr+7Qv5xdtSbq+XH9d1XMJpp4
 4ra0fcCeZz1hhKZnA3dZtekROOUFOy7LvQHwJ72raN/mQNCkpliNVg5SfzXj2uc=
X-Gm-Gg: ASbGncuVmg5pKS/9OcuAmo79GQ1DGsPW3MxSA2/stkYFTYUZdqNldwoXT4dBhgMpKcH
 5iqR6oRC4iLUFyqxMxM1OozzjTHvX8Cjt6MEHHjFricK5PVm9ws+veRqMxUfkeZf5bKShKsms8e
 AhAUX8VuCg3XkDUA3udrRtefwEpP4nJhBOkZcCZAcEGO4gEeYlULGFXSz8H5/e4PtAhm14bXyS7
 f5uQ8JrPpT96MksccViE2gJZ216sFgeOI/x29WDKgqLPLCpduobCQXLWK2WEFsRIfSV4WrUj23K
 CFcKXNYS3feCjc4pz0ncsOq9ytcwLr4CqpKCizE=
X-Received: by 2002:a17:90b:3bc3:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-2f782d97961mr62019512a91.30.1738020368100; 
 Mon, 27 Jan 2025 15:26:08 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 03/22] target/arm: Rename FPST_FPCR_F16_A32 to FPST_A32_F16
Date: Mon, 27 Jan 2025 15:25:45 -0800
Message-ID: <20250127232604.20386-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: wQ+LF/QWyGNF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  6 +++---
 target/arm/tcg/translate-vfp.c | 24 ++++++++++++------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 2edb707b85..adf6eb8b91 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -676,7 +676,7 @@ static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
 typedef enum ARMFPStatusFlavour {
     FPST_A32,
     FPST_A64,
-    FPST_FPCR_F16_A32,
+    FPST_A32_F16,
     FPST_FPCR_F16_A64,
     FPST_FPCR_AH,
     FPST_FPCR_AH_F16,
@@ -696,7 +696,7 @@ typedef enum ARMFPStatusFlavour {
  *   for AArch32 non-FP16 operations controlled by the FPCR
  * FPST_A64
  *   for AArch64 non-FP16 operations controlled by the FPCR
- * FPST_FPCR_F16_A32
+ * FPST_A32_F16
  *   for AArch32 operations controlled by the FPCR where FPCR.FZ16 is to be used
  * FPST_FPCR_F16_A64
  *   for AArch64 operations controlled by the FPCR where FPCR.FZ16 is to be used
@@ -723,7 +723,7 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
     case FPST_A64:
         offset = offsetof(CPUARMState, vfp.fp_status_a64);
         break;
-    case FPST_FPCR_F16_A32:
+    case FPST_A32_F16:
         offset = offsetof(CPUARMState, vfp.fp_status_f16_a32);
         break;
     case FPST_FPCR_F16_A64:
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 4cc12a407b..8d9d1ab877 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -460,7 +460,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
     }
 
     if (sz == 1) {
-        fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+        fpst = fpstatus_ptr(FPST_A32_F16);
     } else {
         fpst = fpstatus_ptr(FPST_A32);
     }
@@ -527,7 +527,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     }
 
     if (sz == 1) {
-        fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+        fpst = fpstatus_ptr(FPST_A32_F16);
     } else {
         fpst = fpstatus_ptr(FPST_A32);
     }
@@ -1433,7 +1433,7 @@ static bool do_vfp_3op_hp(DisasContext *s, VFPGen3OpSPFn *fn,
     /*
      * Do a half-precision operation. Functionally this is
      * the same as do_vfp_3op_sp(), except:
-     *  - it uses the FPST_FPCR_F16_A32
+     *  - it uses the FPST_A32_F16
      *  - it doesn't need the VFP vector handling (fp16 is a
      *    v8 feature, and in v8 VFP vectors don't exist)
      *  - it does the aa32_fp16_arith feature test
@@ -1456,7 +1456,7 @@ static bool do_vfp_3op_hp(DisasContext *s, VFPGen3OpSPFn *fn,
     f0 = tcg_temp_new_i32();
     f1 = tcg_temp_new_i32();
     fd = tcg_temp_new_i32();
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
 
     vfp_load_reg16(f0, vn);
     vfp_load_reg16(f1, vm);
@@ -2122,7 +2122,7 @@ static bool do_vfm_hp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
         /* VFNMA, VFNMS */
         gen_vfp_negh(vd, vd);
     }
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
     gen_helper_vfp_muladdh(vd, vn, vm, vd, fpst);
     vfp_store_reg32(vd, a->vd);
     return true;
@@ -2424,7 +2424,7 @@ DO_VFP_2OP(VNEG, dp, gen_vfp_negd, aa32_fpdp_v2)
 
 static void gen_VSQRT_hp(TCGv_i32 vd, TCGv_i32 vm)
 {
-    gen_helper_vfp_sqrth(vd, vm, fpstatus_ptr(FPST_FPCR_F16_A32));
+    gen_helper_vfp_sqrth(vd, vm, fpstatus_ptr(FPST_A32_F16));
 }
 
 static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
@@ -2706,7 +2706,7 @@ static bool trans_VRINTR_hp(DisasContext *s, arg_VRINTR_sp *a)
 
     tmp = tcg_temp_new_i32();
     vfp_load_reg16(tmp, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
     gen_helper_rinth(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
@@ -2779,7 +2779,7 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
 
     tmp = tcg_temp_new_i32();
     vfp_load_reg16(tmp, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
     tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
     gen_restore_rmode(tcg_rmode, fpst);
@@ -2859,7 +2859,7 @@ static bool trans_VRINTX_hp(DisasContext *s, arg_VRINTX_sp *a)
 
     tmp = tcg_temp_new_i32();
     vfp_load_reg16(tmp, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
     gen_helper_rinth_exact(tmp, tmp, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
@@ -2983,7 +2983,7 @@ static bool trans_VCVT_int_hp(DisasContext *s, arg_VCVT_int_sp *a)
 
     vm = tcg_temp_new_i32();
     vfp_load_reg32(vm, a->vm);
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
     if (a->s) {
         /* i32 -> f16 */
         gen_helper_vfp_sitoh(vm, vm, fpst);
@@ -3105,7 +3105,7 @@ static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
     vd = tcg_temp_new_i32();
     vfp_load_reg32(vd, a->vd);
 
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
     shift = tcg_constant_i32(frac_bits);
 
     /* Switch on op:U:sx bits */
@@ -3273,7 +3273,7 @@ static bool trans_VCVT_hp_int(DisasContext *s, arg_VCVT_sp_int *a)
         return true;
     }
 
-    fpst = fpstatus_ptr(FPST_FPCR_F16_A32);
+    fpst = fpstatus_ptr(FPST_A32_F16);
     vm = tcg_temp_new_i32();
     vfp_load_reg16(vm, a->vm);
 
-- 
2.43.0

