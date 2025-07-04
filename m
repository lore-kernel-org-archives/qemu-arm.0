Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1260230dyc;
        Fri, 4 Jul 2025 07:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIoXHCqAn3MOa2EGAeOCZw3PTGipBeiPxQyYX9y+cxNpFNmbrvAArIdWy3Smzq/Sygf93GHGttdtNi4A==@linaro.org
X-Google-Smtp-Source: AGHT+IHoD+zFvQeklraQ6RuDY74BHqCDLbzq5I3TzfpWC4cOviCBiRN55yrSMkUk0ekuDydbVQuN
X-Received: by 2002:a05:6214:2467:b0:6fa:bb26:1459 with SMTP id 6a1803df08f44-702c6d0e4fbmr40069556d6.7.1751639962076;
        Fri, 04 Jul 2025 07:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639962; cv=none;
        d=google.com; s=arc-20240605;
        b=A9uwBQVP2a1AUaE9293fPOFV98sXzxQunoN58ItL/OFv35GIkUS5EMY5253BfdzY/W
         gfhArM0zTkTbkIHdA8XVXgOjnUhmQA8gp+Szca80mFKViHG+MpSBHmnbzrD/0TE9KqMC
         eLcucrd2UR40b0+jnpTdLVT65WE5F0+wKSRHRTmYbWksThfq26bbG7cFnqU6Hd8mZcj1
         9tBrglk1HAkYXJ/ierwqIy1x2SYA87jABe0rlvtxfQiwe/hcL1lM33J1ApqiKNzQ9w3P
         uOQEVEbrqkMAGXiqYJqCeiFzmYkblVymYoa92b2AyIHtjij+zniXHMmseKPHfAX+RdyX
         Lr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gi6h0jJCLM5pMa8O5xWfVi3XLDkwV2ixos8pzzU5jpA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=MABDHXT/sUePqFUAGA4156tHNsSf3I99OZABd3xk9fEehrQBEUegrGZDeXCXgZMHsU
         LUDrtHn/k6Wh7nXILuPLJCGY7uW/zSepay0INbgp469fWVpQ7qyfjG9ROabUYvcbN2Nv
         IZMAp4oHIeTZsAn1+2p+LSmuNSN0tM4kbjaGWTxjhuJT9M/TIpmhiVSvkKlPFZrRkGGX
         i2Ebc91IgUSFf24/mc4yufx4GMCMkO+q1LheTOw805uVIhnL9IKdcPuVnlR824WnJ9Pb
         ZfeXV61ZnTxD1CyhQT5UmOSJDfoWy9Mm4LOV0M9rJE8GOoMbsgBtfbD0e6QIksed9T5V
         PeKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLsqyt7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbeebcd6si228783585a.523.2025.07.04.07.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLsqyt7I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhOe-0001un-UT; Fri, 04 Jul 2025 10:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLj-0003wR-U4
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:18 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLg-0007tO-Ss
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:11 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ef60dbaefbso852871fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639107; x=1752243907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gi6h0jJCLM5pMa8O5xWfVi3XLDkwV2ixos8pzzU5jpA=;
 b=PLsqyt7IA/Da8uyKP60K3RvxE1Ezi3VtsG3HaRqA4YWeuSMfF3Us6Q7pyr2W1xd7U2
 8hRuWKXDK/bGxRV/3uw3M63dNEwxWWzR43hFYWuEHNMfRQar8cMXY0MFv5KwhUO2wPtC
 Ant3/fKUjf1Lk1mDqDQt2D3sT7bEv71LDW3o02jxTsqKVXd4BPy2w4il0CaZqPtiYdrD
 nHRnFmZ6xQbx164ACFuKUkIksqtDuewpuk2+jrYdn9loGI2Z7D2IGyHEOcUBBF1A6YOP
 5XlzI5k13d0+bnNXQT1RTImGVcGdBU1kIRMPjT2wTcLwyNVEw9zeA2DUQaiWQ8YKdycH
 1Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639107; x=1752243907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gi6h0jJCLM5pMa8O5xWfVi3XLDkwV2ixos8pzzU5jpA=;
 b=Pt1aQhs12awVQD5M77FWnGpXBmCJ+7Gyepey59og7PXqkFHOOQHJymvfTaTyxzwMBf
 el9XPMh8VzzMjdt5n68cnk29o3VYbuPzUx4sKh2zKi4hxCIzoYy5A3DRLn469411IzAd
 Jw4lAEez2S0ahxZJrS95kAAdGSXincpTuSOf1LW8XRvy7aWfPfuIqRt2OmSkOaidz1Hx
 1/f3p7J3GPUMlfbXB6+anpOwscw73gI1gI/1iXdWUGdQKAJqPel/Qvpv5d6PbBiA5U1H
 uQFgBHHX2YQPpFEIqVys17kGTBNsvl9VdYR6N8+3+5BpLV/IO3Ui/rQzGvUNQKY4LcPh
 XLbQ==
X-Gm-Message-State: AOJu0YxRIH5MwQMmw02IxDfBn3UfjkLJwh5utX+cLKj7PsGbtOLO4ih2
 uzor+flJYbqb276wekRbY6cDJg16/3TE4XvFFy7pq9hXeyvD4Botx6/Ewej8rYDKBXE=
X-Gm-Gg: ASbGncvSOl2frU9CFrIknZ5ii3VWHZCrlcdZFxNkq6HZUVfevKZVORluYc3T7C3E4Oj
 XCUJwG8mESBbovUdSCZ4D17OznGW3jVleacLtmzUMhB3LyQ9SkatkuRZ1sxlgFKQtkJZB/9XlGD
 vR2xpSt56N2sRrvFKOj5GPUI1DnXFRbCdq3jAm4Y/bea546VnNo28+ZkGap/KuJjTDAPqAhZs8e
 RgaJhhWh+3NxziGRWJEf+c80P8TgADbIGf8zo1b0v3jngRkcBAcgK6eU/7sTBz8pDayNQijqWTk
 JN8U7X7SwV2+UHKspkUQsnDq4bMa/laeC5hZqrYoM8gGEqZPcvz83gDg19SIOYpzAKcnkcGnMAC
 cs8DaN2D7w1s4GaTF9FS4C9gc7LGwjd9mV2H3rEguH5Be7bVH
X-Received: by 2002:a05:6870:2046:b0:2e8:ec55:aafc with SMTP id
 586e51a60fabf-2f79205e860mr2242129fac.37.1751639107412; 
 Fri, 04 Jul 2025 07:25:07 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 049/108] target/arm: Implement SME2 BFMLA, BFMLS
Date: Fri,  4 Jul 2025 08:20:12 -0600
Message-ID: <20250704142112.1018902-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-TUID: NM0TMNIjjJWZ

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h        |  9 +++++++++
 target/arm/tcg/translate-sme.c | 14 ++++++++++++++
 target/arm/tcg/vec_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 18 ++++++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index b741470b51..37dd384659 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -799,14 +799,17 @@ DEF_HELPER_FLAGS_5(gvec_fmls_nf_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i
 DEF_HELPER_FLAGS_5(gvec_vfma_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfma_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfma_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_bfmla, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_vfms_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfms_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfms_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_bfmls, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_ah_vfms_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_ah_vfms_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_ah_vfms_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_bfmls, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
@@ -838,6 +841,8 @@ DEF_HELPER_FLAGS_6(gvec_fmla_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(gvec_fmla_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(gvec_bfmla_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_6(gvec_fmls_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
@@ -845,6 +850,8 @@ DEF_HELPER_FLAGS_6(gvec_fmls_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(gvec_fmls_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(gvec_bfmls_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_6(gvec_ah_fmls_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
@@ -852,6 +859,8 @@ DEF_HELPER_FLAGS_6(gvec_ah_fmls_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(gvec_ah_fmls_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(gvec_ah_bfmls_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_uqadd_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 5f51369609..3f9a80248a 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1038,6 +1038,15 @@ TRANS_FEAT(FMLA_nn_d, aa64_sme2_f64f64, do_fmla, a, true, FPST_ZA,
 TRANS_FEAT(FMLS_nn_d, aa64_sme2_f64f64, do_fmla, a, true, FPST_ZA,
            s->fpcr_ah ? gen_helper_gvec_ah_vfms_d : gen_helper_gvec_vfms_d)
 
+TRANS_FEAT(BFMLA_n1, aa64_sme_b16b16, do_fmla, a, false, FPST_ZA,
+           gen_helper_gvec_bfmla)
+TRANS_FEAT(BFMLS_n1, aa64_sme_b16b16, do_fmla, a, false, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_bfmls : gen_helper_gvec_bfmls)
+TRANS_FEAT(BFMLA_nn, aa64_sme_b16b16, do_fmla, a, true, FPST_ZA,
+           gen_helper_gvec_bfmla)
+TRANS_FEAT(BFMLS_nn, aa64_sme_b16b16, do_fmla, a, true, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_bfmls : gen_helper_gvec_bfmls)
+
 static bool do_fmla_nx(DisasContext *s, arg_azx_n *a,
                        ARMFPStatusFlavour fpst, gen_helper_gvec_4_ptr *fn)
 {
@@ -1058,6 +1067,11 @@ TRANS_FEAT(FMLA_nx_d, aa64_sme2_f64f64, do_fmla_nx, a, FPST_ZA,
 TRANS_FEAT(FMLS_nx_d, aa64_sme2_f64f64, do_fmla_nx, a, FPST_ZA,
            s->fpcr_ah ? gen_helper_gvec_ah_fmls_idx_d : gen_helper_gvec_fmls_idx_d)
 
+TRANS_FEAT(BFMLA_nx, aa64_sme_b16b16, do_fmla_nx, a, FPST_ZA,
+           gen_helper_gvec_bfmla_idx)
+TRANS_FEAT(BFMLS_nx, aa64_sme_b16b16, do_fmla_nx, a, FPST_ZA,
+           s->fpcr_ah ? gen_helper_gvec_ah_bfmls_idx : gen_helper_gvec_bfmls_idx)
+
 /*
  * Expand array multi-vector single (n1), array multi-vector (nn),
  * and array multi-vector indexed (nx), for integer accumulate.
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 4b7de5016e..51bfd767a3 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1608,6 +1608,12 @@ static float16 float16_muladd_f(float16 dest, float16 op1, float16 op2,
     return float16_muladd(op1, op2, dest, 0, stat);
 }
 
+static bfloat16 bfloat16_muladd_f(bfloat16 dest, bfloat16 op1, bfloat16 op2,
+                                  float_status *stat)
+{
+    return bfloat16_muladd(op1, op2, dest, 0, stat);
+}
+
 static float32 float32_muladd_f(float32 dest, float32 op1, float32 op2,
                                  float_status *stat)
 {
@@ -1626,6 +1632,12 @@ static float16 float16_mulsub_f(float16 dest, float16 op1, float16 op2,
     return float16_muladd(float16_chs(op1), op2, dest, 0, stat);
 }
 
+static bfloat16 bfloat16_mulsub_f(bfloat16 dest, bfloat16 op1, bfloat16 op2,
+                                  float_status *stat)
+{
+    return bfloat16_muladd(bfloat16_chs(op1), op2, dest, 0, stat);
+}
+
 static float32 float32_mulsub_f(float32 dest, float32 op1, float32 op2,
                                  float_status *stat)
 {
@@ -1644,6 +1656,12 @@ static float16 float16_ah_mulsub_f(float16 dest, float16 op1, float16 op2,
     return float16_muladd(op1, op2, dest, float_muladd_negate_product, stat);
 }
 
+static bfloat16 bfloat16_ah_mulsub_f(bfloat16 dest, bfloat16 op1, bfloat16 op2,
+                                     float_status *stat)
+{
+    return bfloat16_muladd(op1, op2, dest, float_muladd_negate_product, stat);
+}
+
 static float32 float32_ah_mulsub_f(float32 dest, float32 op1, float32 op2,
                                  float_status *stat)
 {
@@ -1677,14 +1695,19 @@ DO_MULADD(gvec_fmls_nf_s, float32_mulsub_nf, float32)
 DO_MULADD(gvec_vfma_h, float16_muladd_f, float16)
 DO_MULADD(gvec_vfma_s, float32_muladd_f, float32)
 DO_MULADD(gvec_vfma_d, float64_muladd_f, float64)
+DO_MULADD(gvec_bfmla, bfloat16_muladd_f, bfloat16)
 
 DO_MULADD(gvec_vfms_h, float16_mulsub_f, float16)
 DO_MULADD(gvec_vfms_s, float32_mulsub_f, float32)
 DO_MULADD(gvec_vfms_d, float64_mulsub_f, float64)
+DO_MULADD(gvec_bfmls, bfloat16_mulsub_f, bfloat16)
 
 DO_MULADD(gvec_ah_vfms_h, float16_ah_mulsub_f, float16)
 DO_MULADD(gvec_ah_vfms_s, float32_ah_mulsub_f, float32)
 DO_MULADD(gvec_ah_vfms_d, float64_ah_mulsub_f, float64)
+DO_MULADD(gvec_ah_bfmls, bfloat16_ah_mulsub_f, bfloat16)
+
+#undef DO_MULADD
 
 /* For the indexed ops, SVE applies the index per 128-bit vector segment.
  * For AdvSIMD, there is of course only one such vector segment.
@@ -1803,14 +1826,17 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va,                  \
 DO_FMLA_IDX(gvec_fmla_idx_h, float16, H2, 0, 0)
 DO_FMLA_IDX(gvec_fmla_idx_s, float32, H4, 0, 0)
 DO_FMLA_IDX(gvec_fmla_idx_d, float64, H8, 0, 0)
+DO_FMLA_IDX(gvec_bfmla_idx, bfloat16, H2, 0, 0)
 
 DO_FMLA_IDX(gvec_fmls_idx_h, float16, H2, INT16_MIN, 0)
 DO_FMLA_IDX(gvec_fmls_idx_s, float32, H4, INT32_MIN, 0)
 DO_FMLA_IDX(gvec_fmls_idx_d, float64, H8, INT64_MIN, 0)
+DO_FMLA_IDX(gvec_bfmls_idx, bfloat16, H2, INT16_MIN, 0)
 
 DO_FMLA_IDX(gvec_ah_fmls_idx_h, float16, H2, 0, float_muladd_negate_product)
 DO_FMLA_IDX(gvec_ah_fmls_idx_s, float32, H4, 0, float_muladd_negate_product)
 DO_FMLA_IDX(gvec_ah_fmls_idx_d, float64, H8, 0, float_muladd_negate_product)
+DO_FMLA_IDX(gvec_ah_bfmls_idx, bfloat16, H2, 0, float_muladd_negate_product)
 
 #undef DO_FMLA_IDX
 
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 962ffae3d6..b3dd3bffc3 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -370,16 +370,22 @@ USMLALL_n1_s    11000001 001 1 .... 0 .. 000 ..... 0010 .   @azz_nx1_o1x4 n=4
 SUMLALL_n1_s    11000001 001 0 .... 0 .. 000 ..... 1010 .   @azz_nx1_o1x4 n=2
 SUMLALL_n1_s    11000001 001 1 .... 0 .. 000 ..... 1010 .   @azz_nx1_o1x4 n=4
 
+BFMLA_n1        11000001 011 0 .... 0 .. 111 ..... 00 ...   @azz_nx1_o3 n=2
 FMLA_n1_h       11000001 001 0 .... 0 .. 111 ..... 00 ...   @azz_nx1_o3 n=2
 FMLA_n1_s       11000001 001 0 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=2
 FMLA_n1_d       11000001 011 0 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=2
+
+BFMLA_n1        11000001 011 1 .... 0 .. 111 ..... 00 ...   @azz_nx1_o3 n=4
 FMLA_n1_h       11000001 001 1 .... 0 .. 111 ..... 00 ...   @azz_nx1_o3 n=4
 FMLA_n1_s       11000001 001 1 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=4
 FMLA_n1_d       11000001 011 1 .... 0 .. 110 ..... 00 ...   @azz_nx1_o3 n=4
 
+BFMLS_n1        11000001 011 0 .... 0 .. 111 ..... 01 ...   @azz_nx1_o3 n=2
 FMLS_n1_h       11000001 001 0 .... 0 .. 111 ..... 01 ...   @azz_nx1_o3 n=2
 FMLS_n1_s       11000001 001 0 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=2
 FMLS_n1_d       11000001 011 0 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=2
+
+BFMLS_n1        11000001 011 1 .... 0 .. 111 ..... 01 ...   @azz_nx1_o3 n=4
 FMLS_n1_h       11000001 001 1 .... 0 .. 111 ..... 01 ...   @azz_nx1_o3 n=4
 FMLS_n1_s       11000001 001 1 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=4
 FMLS_n1_d       11000001 011 1 .... 0 .. 110 ..... 01 ...   @azz_nx1_o3 n=4
@@ -484,16 +490,22 @@ UMLSLL_nn_d     11000001 111 ...01 0 .. 000 ...00 1100 .    @azz_4x4_o1x4
 USMLALL_nn_s    11000001 101 ....0 0 .. 000 ....0 0010 .    @azz_2x2_o1x4
 USMLALL_nn_s    11000001 101 ...01 0 .. 000 ...00 0010 .    @azz_4x4_o1x4
 
+BFMLA_nn        11000001 111 ....0 0 .. 100 ....0 01 ...    @azz_2x2_o3
 FMLA_nn_h       11000001 101 ....0 0 .. 100 ....0 01 ...    @azz_2x2_o3
 FMLA_nn_s       11000001 101 ....0 0 .. 110 ....0 00 ...    @azz_2x2_o3
 FMLA_nn_d       11000001 111 ....0 0 .. 110 ....0 00 ...    @azz_2x2_o3
+
+BFMLA_nn        11000001 111 ...01 0 .. 100 ...00 01 ...    @azz_4x4_o3
 FMLA_nn_h       11000001 101 ...01 0 .. 100 ...00 01 ...    @azz_4x4_o3
 FMLA_nn_s       11000001 101 ...01 0 .. 110 ...00 00 ...    @azz_4x4_o3
 FMLA_nn_d       11000001 111 ...01 0 .. 110 ...00 00 ...    @azz_4x4_o3
 
+BFMLS_nn        11000001 111 ....0 0 .. 100 ....0 11 ...    @azz_2x2_o3
 FMLS_nn_h       11000001 101 ....0 0 .. 100 ....0 11 ...    @azz_2x2_o3
 FMLS_nn_s       11000001 101 ....0 0 .. 110 ....0 01 ...    @azz_2x2_o3
 FMLS_nn_d       11000001 111 ....0 0 .. 110 ....0 01 ...    @azz_2x2_o3
+
+BFMLS_nn        11000001 111 ...01 0 .. 100 ...00 11 ...    @azz_4x4_o3
 FMLS_nn_h       11000001 101 ...01 0 .. 100 ...00 11 ...    @azz_4x4_o3
 FMLS_nn_s       11000001 101 ...01 0 .. 110 ...00 01 ...    @azz_4x4_o3
 FMLS_nn_d       11000001 111 ...01 0 .. 110 ...00 01 ...    @azz_4x4_o3
@@ -652,16 +664,22 @@ SUMLALL_nx_s    11000001 0001 .... 1 .. 0.. ...01 10 ...    @azx_4x1_i4_o1
 @azx_4x1_i3_o3  ........ .... zm:4 . .. ... ..... .. off:3  \
                 &azx_n n=4 rv=%mova_rv zn=%zn_ax4 idx=%idx3_10_3
 
+BFMLA_nx        11000001 0001 .... 0 .. 1.. ....1 0 ....    @azx_2x1_i3_o3
 FMLA_nx_h       11000001 0001 .... 0 .. 1.. ....0 0 ....    @azx_2x1_i3_o3
 FMLA_nx_s       11000001 0101 .... 0 .. 0.. ....0 00 ...    @azx_2x1_i2_o3
 FMLA_nx_d       11000001 1101 .... 0 .. 00. ....0 00 ...    @azx_2x1_i1_o3
+
+BFMLA_nx        11000001 0001 .... 1 .. 1.. ...01 0 ....    @azx_4x1_i3_o3
 FMLA_nx_h       11000001 0001 .... 1 .. 1.. ...00 0 ....    @azx_4x1_i3_o3
 FMLA_nx_s       11000001 0101 .... 1 .. 0.. ...00 00 ...    @azx_4x1_i2_o3
 FMLA_nx_d       11000001 1101 .... 1 .. 00. ...00 00 ...    @azx_4x1_i1_o3
 
+BFMLS_nx        11000001 0001 .... 0 .. 1.. ....1 1 ....    @azx_2x1_i3_o3
 FMLS_nx_h       11000001 0001 .... 0 .. 1.. ....0 1 ....    @azx_2x1_i3_o3
 FMLS_nx_s       11000001 0101 .... 0 .. 0.. ....0 10 ...    @azx_2x1_i2_o3
 FMLS_nx_d       11000001 1101 .... 0 .. 00. ....0 10 ...    @azx_2x1_i1_o3
+
+BFMLS_nx        11000001 0001 .... 1 .. 1.. ...01 1 ....    @azx_4x1_i3_o3
 FMLS_nx_h       11000001 0001 .... 1 .. 1.. ...00 1 ....    @azx_4x1_i3_o3
 FMLS_nx_s       11000001 0101 .... 1 .. 0.. ...00 10 ...    @azx_4x1_i2_o3
 FMLS_nx_d       11000001 1101 .... 1 .. 00. ...00 10 ...    @azx_4x1_i1_o3
-- 
2.43.0

