Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142672njb;
        Sat, 1 Feb 2025 08:42:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVI+r6ygLSG98wAh/g3h267efMPhwByO98bp4ulmGYdyNRploGmRh/t+TdgwYfj3qtVTCTqRdPdk3Z19Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGG82qqw03oZx5k7HzlHrG7cYzoBbvtLJx8r+N1lJyG/aFf7qYCoTljOP+hYFltIWPWwHdW
X-Received: by 2002:a05:620a:28d5:b0:7bc:e736:27f2 with SMTP id af79cd13be357-7bffcd14bb0mr2348648185a.18.1738428140801;
        Sat, 01 Feb 2025 08:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428140; cv=none;
        d=google.com; s=arc-20240605;
        b=SbM/orh4JEKyeMuBb0uza2PhVEl+T1lFvGNhTgZvQ0YBnXjXi1dET2VdEIi/cKTDfn
         aBYH21vLfKDwu+oCUHMke6bmyGYCP2EZqfOr5n+OfB1wGywcl0n52Gg8R69T8bHZn9eC
         t8KA6vfLvWyNEIV8ceBMKEMAJbZn5Pt1ZQzpgQf5jPiqjKjwc0V1Jgc9CdK7eFO2p7sx
         ceXBeUQx5XCY3Es4jutC39Zd55c7oUtWtTd0+bjOnkYQTmsfTgxPXuWXEzbEqN5ddNsa
         MKDPUDX15VNCfcJG9qVDPEVXzGCm1v2H7oBSjyvIR3+26iqbVejjTEQ+v6KmHWxn+/oA
         YhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p175KOBCspR6sJ7cGBvZI+vAolOTcRFZh7D1rDS5sGc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=RXF0pxceIQjd/hTNe0zLsmFut/txmgEL0P+1xe3m/RRs4KJWcMUpYqij1y9Yrlxf6R
         jMfkqbkFCv44kXnXkFzbZtqrwTPHKCKHt4v73pXyOtUHhoLywgMs3D1hnqJYOixoQcj7
         EO4tsk320pHPQKn/zvCJMSj74++q8AU1hieVENoYwxPgy+0Krb6zJJils8jZdKnPRMui
         74WVTVLk/5gOU3w5Bg8xWnOvvJ5G2LLfxC49ZMtnxJZSsWyTxeVzk8qcEIpe+NYzJupP
         XLI8tPRV75U5yLT1stRJe1ybW2H9tnczGfaux1I4nwyODmcwpAw+mG5LM5vHbRuI++YE
         uYAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paCzhOzV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e254838329si61515856d6.119.2025.02.01.08.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paCzhOzV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGZ9-0000SB-U0; Sat, 01 Feb 2025 11:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYi-0007Qr-GE
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:31 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYg-0001Kt-Ro
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38637614567so1351113f8f.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428085; x=1739032885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p175KOBCspR6sJ7cGBvZI+vAolOTcRFZh7D1rDS5sGc=;
 b=paCzhOzVbPsUFnCns5lMM055fZCrby+HKir9wixARcIA3UnuZlVJpgLnZU5vWvxGJp
 ZrNhDP5tBz07h+53MBN0WnieeOAjK4OfMUCB6cIKpuxDsiw1jNC1rcS/8+ZecurlS0IQ
 2SPEWaBtmJl2/BGojLrdio/HD05yfKV2SCwqIoAq9P57Ve7s5Agm4R09o3AoVlaQyB8P
 MVKkhMNdmkEE1U/xCe4z18tO+4NQJStWM03q6YyRtYcm0zjQVYvtEHKjIh64kW+i9OOh
 IbY8E4l6ohdhRF6cvjgNU9DSLjF2z4yEKr/SpkJWjWe9oEVABGeBbkEOcdTtmSPXmMds
 z2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428085; x=1739032885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p175KOBCspR6sJ7cGBvZI+vAolOTcRFZh7D1rDS5sGc=;
 b=H4ZCy209jdBvCy1A2LtWWtY//ucIhF8mRKoS/YQsjiZKLWa/5m/GUXINLr9R9B5wuy
 0u0qRpjQg4onoNZ6eePm6RT1P4RGhdkxXN/k+S10OM2AzETbfekvtfAl46CEwK2T6WT5
 YFG0l7kThfLXpe+x5jdTj78w2a/4jIJfwplh6V+PvJ/3zUnmWkbV5dQbl1B8HkLkPan5
 LP13npyA0KLmew8FvxhvaF6EJSBnaPlCIpoR4JtilLUmUGTiLEWMnm3v5wtual71gsT3
 J+++27YL24kJbhrlL7c4MLELtAOEsQGuv+EXWDYCiGCcVnSS1lAyqSo+lF+q0s7THuKl
 YA7w==
X-Gm-Message-State: AOJu0YyxRKHR56Bb1HoDEMeDdh15flQHqQ6V2Dfrpffp+RIu/WkVDxIW
 PqS1x4g5ouuVUaY1alkZLgGJH6Z6rakpsAL9FwYe5cuMQtp/p3rveesACqaiOd8RbtfzTmLwvUi
 N
X-Gm-Gg: ASbGnctWpt5Kgb+ji/QADcVZUJ4Z/m/TrPN60cXzUjnFtVCOofjngm/b1U5zWKCB7IA
 XIrvYzv20cjAs31UCha+R3L2mFYJrS0KhNOh5S3EoG79WC3zgU3Bs8aLowhfPkzNco4urnzYNbW
 N14V5aadofLz9nHU35SjbXD17SNB59oL1popOwPrW0eUZCuuOOgl1KL7TamVttnJzLbHnTOI3Hi
 XuBKIKgeXUU92Qu9iC25yks7QLg3ZD9lfVYcuoauyOEnhBKNjleWBwuYa8ghKz+K0Ycn7OA8Cdp
 1cr8SMW7LFOMpfi/f36H
X-Received: by 2002:a5d:64c4:0:b0:38a:615c:8223 with SMTP id
 ffacd0b85a97d-38c51931023mr13630550f8f.10.1738428085416; 
 Sat, 01 Feb 2025 08:41:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 55/69] target/arm: Implement increased precision FRSQRTE
Date: Sat,  1 Feb 2025 16:39:58 +0000
Message-Id: <20250201164012.1660228-56-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: Ox5NhFh+R8JV

Implement the increased precision variation of FRSQRTE.  In the
pseudocode this corresponds to the handling of the
"increasedprecision" boolean in the FPRSqrtEstimate() and
RecipSqrtEstimate() functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c | 77 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 13 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index d88a0aba6a3..66a482a9add 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1015,8 +1015,36 @@ static int do_recip_sqrt_estimate(int a)
     return estimate;
 }
 
+static int do_recip_sqrt_estimate_incprec(int a)
+{
+    /*
+     * The Arm ARM describes the 12-bit precision version of RecipSqrtEstimate
+     * in terms of an infinite-precision floating point calculation of a
+     * square root. We implement this using the same kind of pure integer
+     * algorithm as the 8-bit mantissa, to get the same bit-for-bit result.
+     */
+    int64_t b, estimate;
 
-static uint64_t recip_sqrt_estimate(int *exp , int exp_off, uint64_t frac)
+    assert(1024 <= a && a < 4096);
+    if (a < 2048) {
+        a = a * 2 + 1;
+    } else {
+        a = (a >> 1) << 1;
+        a = (a + 1) * 2;
+    }
+    b = 8192;
+    while (a * (b + 1) * (b + 1) < (1ULL << 39)) {
+        b += 1;
+    }
+    estimate = (b + 1) / 2;
+
+    assert(4096 <= estimate && estimate < 8192);
+
+    return estimate;
+}
+
+static uint64_t recip_sqrt_estimate(int *exp , int exp_off, uint64_t frac,
+                                    bool increasedprecision)
 {
     int estimate;
     uint32_t scaled;
@@ -1029,17 +1057,32 @@ static uint64_t recip_sqrt_estimate(int *exp , int exp_off, uint64_t frac)
         frac = extract64(frac, 0, 51) << 1;
     }
 
-    if (*exp & 1) {
-        /* scaled = UInt('01':fraction<51:45>) */
-        scaled = deposit32(1 << 7, 0, 7, extract64(frac, 45, 7));
+    if (increasedprecision) {
+        if (*exp & 1) {
+            /* scaled = UInt('01':fraction<51:42>) */
+            scaled = deposit32(1 << 10, 0, 10, extract64(frac, 42, 10));
+        } else {
+            /* scaled = UInt('1':fraction<51:41>) */
+            scaled = deposit32(1 << 11, 0, 11, extract64(frac, 41, 11));
+        }
+        estimate = do_recip_sqrt_estimate_incprec(scaled);
     } else {
-        /* scaled = UInt('1':fraction<51:44>) */
-        scaled = deposit32(1 << 8, 0, 8, extract64(frac, 44, 8));
+        if (*exp & 1) {
+            /* scaled = UInt('01':fraction<51:45>) */
+            scaled = deposit32(1 << 7, 0, 7, extract64(frac, 45, 7));
+        } else {
+            /* scaled = UInt('1':fraction<51:44>) */
+            scaled = deposit32(1 << 8, 0, 8, extract64(frac, 44, 8));
+        }
+        estimate = do_recip_sqrt_estimate(scaled);
     }
-    estimate = do_recip_sqrt_estimate(scaled);
 
     *exp = (exp_off - *exp) / 2;
-    return extract64(estimate, 0, 8) << 44;
+    if (increasedprecision) {
+        return extract64(estimate, 0, 12) << 40;
+    } else {
+        return extract64(estimate, 0, 8) << 44;
+    }
 }
 
 uint32_t HELPER(rsqrte_f16)(uint32_t input, float_status *s)
@@ -1078,7 +1121,7 @@ uint32_t HELPER(rsqrte_f16)(uint32_t input, float_status *s)
 
     f64_frac = ((uint64_t) f16_frac) << (52 - 10);
 
-    f64_frac = recip_sqrt_estimate(&f16_exp, 44, f64_frac);
+    f64_frac = recip_sqrt_estimate(&f16_exp, 44, f64_frac, false);
 
     /* result = sign : result_exp<4:0> : estimate<7:0> : Zeros(2) */
     val = deposit32(0, 15, 1, f16_sign);
@@ -1127,12 +1170,20 @@ static float32 do_rsqrte_f32(float32 input, float_status *s, bool rpres)
 
     f64_frac = ((uint64_t) f32_frac) << 29;
 
-    f64_frac = recip_sqrt_estimate(&f32_exp, 380, f64_frac);
+    f64_frac = recip_sqrt_estimate(&f32_exp, 380, f64_frac, rpres);
 
-    /* result = sign : result_exp<4:0> : estimate<7:0> : Zeros(15) */
+    /*
+     * result = sign : result_exp<7:0> : estimate<7:0> : Zeros(15)
+     * or for increased precision
+     * result = sign : result_exp<7:0> : estimate<11:0> : Zeros(11)
+     */
     val = deposit32(0, 31, 1, f32_sign);
     val = deposit32(val, 23, 8, f32_exp);
-    val = deposit32(val, 15, 8, extract64(f64_frac, 52 - 8, 8));
+    if (rpres) {
+        val = deposit32(val, 11, 12, extract64(f64_frac, 52 - 12, 12));
+    } else {
+        val = deposit32(val, 15, 8, extract64(f64_frac, 52 - 8, 8));
+    }
     return make_float32(val);
 }
 
@@ -1176,7 +1227,7 @@ float64 HELPER(rsqrte_f64)(float64 input, float_status *s)
         return float64_zero;
     }
 
-    f64_frac = recip_sqrt_estimate(&f64_exp, 3068, f64_frac);
+    f64_frac = recip_sqrt_estimate(&f64_exp, 3068, f64_frac, false);
 
     /* result = sign : result_exp<4:0> : estimate<7:0> : Zeros(44) */
     val = deposit64(0, 61, 1, f64_sign);
-- 
2.34.1

