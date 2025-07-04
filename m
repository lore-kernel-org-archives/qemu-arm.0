Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1267203dyc;
        Fri, 4 Jul 2025 07:52:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGDbQq+DhIV5BoXQ9wt4YsCv5Bb04fdR5KAavPII9toa4h/PYWQsrI8W/ZF1p+JiJCYNch1U9OF6uKYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFhbrw5iLNhHvogf4a2PsTso2m+aVZx5L1K7G4gSdzvGtRkuPZnlChd9lp7Qr+c13QMfBk0
X-Received: by 2002:a05:620a:46a8:b0:7d4:6138:bd58 with SMTP id af79cd13be357-7d5df193718mr321579185a.52.1751640733612;
        Fri, 04 Jul 2025 07:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640733; cv=none;
        d=google.com; s=arc-20240605;
        b=DgsLEU2Lmydarbsg068J4ipIj6IQ/xfXYGbk/84CZqUBfAlJyYB4QPN8Ba/NTsGk4e
         6N7oRo2OkUXqIT1dTQM2GcD3gqegaA0Qzk0KTujRzaqxRHOI70cOE7K9lVqLO5aj7d8/
         nMKqPmU7Q19gggzXJgc0jwrkXP5UMfLtzL0zGOXZ5UPML5ebv6EPXWLW6L9UakD1OEJS
         6MOsf3nVOxoNIbStjE+i3VI5MKbatBeR8znfM2lW3sPXoFhp81tbaFv/H4Xhnd9bYyo9
         Vku1fOTrY0ZhsKHSrV0D9V7sI/wPZJh0camNrgUTFz3PaZ5JJKAUFaqjF/nH1rhPUw2h
         XobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LMdweUCeXr0ws90t7Pfr3ZnPLeSvedfSjs9EhIvlp+U=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=NhdmoGgEOB4EMcdi7yc98rtQ6P0vUKXv9HVfSxxLyKiiL2d5ZMFkjh9GDhBm2ZghA5
         BzLt9WkRLeEiEp8ajjzm357OOudXrwwRWFjSf5+puUm8+jCPFI6AhltXbY59Jhj5thVH
         D0wMrX5XyXXueU6GHzgdvBymXb2Cpy5j7SRwHe2nm7XmebrHMRJp2x9AogTwh5+YAHvv
         Vvd+g6V04BFOj87DTvCgLO3yY3ze4uFnBO8Uy5aQBKqURBjnl4Jdbu9g5nYFLMRy0t+6
         ii7dDiPeAhRjL4d1qcwCAbqV5Y20ukTjmXO2a6yTrCXwI0B3Gzqk6WXMx5vbtnGvFfw7
         sK4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zbj04D9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbed6da8si215369385a.436.2025.07.04.07.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zbj04D9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhL3-0001kx-Is; Fri, 04 Jul 2025 10:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIR-0005Nn-Ic
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:47 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIP-00064p-RN
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:47 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2eff5d1c7efso814128fac.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638905; x=1752243705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMdweUCeXr0ws90t7Pfr3ZnPLeSvedfSjs9EhIvlp+U=;
 b=Zbj04D9jXpN0WQk/OUr8G1nC6actZ2wzaVw2Ls26iPwn5FnFEb3lNYz8VOVRkNbJ98
 Y/SxRDsO2u7lsi2omPei0ZxAfOrNLEAK+mvGoeeVdCcAyTAwB/PStyu+a4/Ic3eStU62
 OliLZih+P8cujHeSWsamLUMK47RnN/e9YWnOvuEdqIC32jVW+M5sbE95m81BvGHjftmG
 I8GtODwBXxEn3SGicYSan3xGp1vSZ0xwBJQ77UG/44K71OUY7YI/S8l5PTD5WgHTSaQK
 iFpCfHGoctfUtrKSPbCJRR4AiXCI7+uK/grjqut5C+jFYK0jiBiJ59+Od/zaYPsbdmQh
 lkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638905; x=1752243705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMdweUCeXr0ws90t7Pfr3ZnPLeSvedfSjs9EhIvlp+U=;
 b=Pgkbk0pA0odhv4jVPTsNQ/6twKrSgxk16bLJe8dc/dHbZUFNJ6ZyNmaDdEdHGZADyd
 Q3GnO0bNsiF4O5N2gP3vd9QT4oA9EWgO/JAiwI63ZgLzD/7N3IK6pMiMLsbkY0lmIycl
 umJ2IkO4gIUY8J3ppe33KHOa2+wioc9+DMjGMVOZGgl58G24HEuvkatJ+z837CuRuh2f
 Q7mPfObbE65W2L8smtHFXGAZ3eX77rHbcvvue7Bhku1DyTQxrMrrrbWnpprjtq5KSmuj
 wVC65jRmTq2dfBv4wV3xUGrD9Z2SYuT3Jm3nxV1DPw5V8R92HizvpJKlmqoKJN2XQAj3
 quvQ==
X-Gm-Message-State: AOJu0YxAb7pOgBcu/APTMzzqAvJinbXN6jZKOcbn2ARgerHDd8RQV7N9
 T0Z2zFBf9uoibyc69bKxRgTsDBPkYcBv6xtWWuG16LJwWAkebniYXvtC0DYMT036OEva8LAlgOZ
 NoUkYbpo=
X-Gm-Gg: ASbGnctqz9xnpwTj/06B+KdRr9giDOVi2C78ajwz31u60GwDqk4xZZQcF8q4sXjInsM
 67SmFIzm7lx/BJE3B8XGOpUsfP1vVN+vrZAg25Aq1ghm2oDEU9OmfyjEhGQrbBuJYpGNrJnFjSU
 amSHJFNh0BHmER/qaG+zEOBIhX5URCRFao0dhGilvPQMBk6TSVfzEn7Tv4LpZukpdE6z6DN3EKC
 gC8bjEP2DxsBam6el+u/a70lgYr+o3UrKSzjw8++kEjmWX7fCEoCoBqzKiTwTU/H6uZUQTaGdhE
 29JN5jGGe8IDsmfICCR8D8HD/l1GHU4m0BOTNZGmm57hzdObClXivd+o6+4ikmL8R6ccWltILr7
 eh7p5Z9LaK4VwZ37D+yZeRzB6iwbVmCdge8OiEkpJFHKHjl7x
X-Received: by 2002:a05:6870:d907:b0:2e9:93c6:6e4a with SMTP id
 586e51a60fabf-2f796d8020fmr1716287fac.38.1751638904659; 
 Fri, 04 Jul 2025 07:21:44 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 029/108] target/arm: Introduce gen_gvec_sve2_sqdmulh
Date: Fri,  4 Jul 2025 08:19:52 -0600
Message-ID: <20250704142112.1018902-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Bpu35KWmWzjH

To be used by both SVE2 and SME2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  4 ++++
 target/arm/tcg/gengvec64.c     | 11 +++++++++++
 target/arm/tcg/translate-sve.c |  8 +-------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index 8a9f4b2053..993dde61a4 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -225,6 +225,10 @@ void gen_gvec_usqadd_qc(unsigned vece, uint32_t rd_ofs,
                         uint32_t rn_ofs, uint32_t rm_ofs,
                         uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_sve2_sqdmulh(unsigned vece, uint32_t rd_ofs,
+                           uint32_t rn_ofs, uint32_t rm_ofs,
+                           uint32_t opr_sz, uint32_t max_sz);
+
 void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs,
                  int len, int rn, int imm, MemOp align);
 void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs,
diff --git a/target/arm/tcg/gengvec64.c b/target/arm/tcg/gengvec64.c
index 2617cde0a5..2429cab1b8 100644
--- a/target/arm/tcg/gengvec64.c
+++ b/target/arm/tcg/gengvec64.c
@@ -369,3 +369,14 @@ void gen_gvec_usqadd_qc(unsigned vece, uint32_t rd_ofs,
     tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
                    rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
+
+void gen_gvec_sve2_sqdmulh(unsigned vece, uint32_t rd_ofs,
+                           uint32_t rn_ofs, uint32_t rm_ofs,
+                           uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+    };
+    tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, 0, fns[vece]);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index d2cd298b5b..7e304245c6 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -5948,6 +5948,7 @@ TRANS_FEAT(MOVPRFX_z, aa64_sve, do_movz_zpz, a->rd, a->rn, a->pg, a->esz, false)
  */
 
 TRANS_FEAT(MUL_zzz, aa64_sve2, gen_gvec_fn_arg_zzz, tcg_gen_gvec_mul, a)
+TRANS_FEAT(SQDMULH_zzz, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_sve2_sqdmulh, a)
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
     gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
@@ -5966,13 +5967,6 @@ TRANS_FEAT(UMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
 TRANS_FEAT(PMUL_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
            gen_helper_gvec_pmul_b, a, 0)
 
-static gen_helper_gvec_3 * const sqdmulh_zzz_fns[4] = {
-    gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
-    gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
-};
-TRANS_FEAT(SQDMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
-           sqdmulh_zzz_fns[a->esz], a, 0)
-
 static gen_helper_gvec_3 * const sqrdmulh_zzz_fns[4] = {
     gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
     gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
-- 
2.43.0

