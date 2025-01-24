Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp937632njk;
        Fri, 24 Jan 2025 08:47:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9z7Y83JZ2O9Il3486jpJx2u9JFiay8quGjq6mpP7TcJinLvvLX+FhbJiLZ1/LgpFJTkW4a6qlH10Gag==@linaro.org
X-Google-Smtp-Source: AGHT+IEBJAevNVuR5/7PPrStygFX4jzCZu1tbYsZmViraTwo7cDrlgtaet9Bto0ONW5bZgt8NfyK
X-Received: by 2002:a05:6102:570d:b0:4b6:d108:cac1 with SMTP id ada2fe7eead31-4b6d11811f8mr17963071137.9.1737737254971;
        Fri, 24 Jan 2025 08:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737254; cv=none;
        d=google.com; s=arc-20240605;
        b=B4vTZCV1sNomjyinjv8RJZo/jP2IU4ARGsGxK0+fhwvDpcvMixT66fIV17YqgeoCfK
         frpI4sC/EWPfiueqUC0pPd3S22l4K1k1/uTjs5tBeH02PQxbFoEjMoUZ5fN10FCoHvjw
         /puNK4LSu+6MOwvoGA/LOBzft3uT9w3guMZUBvaKat/N8w9AfRnOMthwXy6scjoVpo8P
         dH9OFfq6P3Rsbqex5qkzCPX04zwtNWeThj8+NjfxA96LUFjNvEvHfgH71sLl0QhdMznP
         gtnos8amiIvPfHDNE2ETv+qGwkYLmwt3d/97kmKr+apykThgLvuXkcGESAKMm0HUV+ZX
         vTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xCeU+LpcSryg5lQ4AtUsxFm/b07YhdAnNy4h4JOSVJ8=;
        fh=LhfnHoM05m6tkUDjX/Pq9kxNuwZmdj3KslqlW6YaN3A=;
        b=CpyGnsjfHtHH3zCD6HQTjg/DcoNvCf0CdjNjR3bj0nZBBdoBkh4UGcByLyhAL1joEz
         4C102jBAES+bOpCIDd0pDGpKBWaBpHmnwELavAzhWUSSsyoEVaA8cMrlpPOg4oJDQF1i
         zzLH/y51sy54Q0xX+blTnu1dC22YzjVDP4B0MCr2XVQtq6QanuQjnfFBvodc9UJwSnTs
         bcLDl2CLQVetYJRe4Ht3Q9r4zAVCzrvpeqHu55cxBNuW7PEWkWw4Wo/aREiAqmEc1q+A
         h8OTBplTnIGFW+Y5LqsQNEW9zAbyp0tn1ypbnlUZ5mXLY9YF18eTZepFogUp8UOdTl1A
         hjIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jdpXH+DP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b7099e11a5si769969137.473.2025.01.24.08.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:47:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jdpXH+DP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMgu-0007Db-2V; Fri, 24 Jan 2025 11:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZa-00065Z-3g
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:30:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZS-0005rD-K0
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:30:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso15353985e9.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736207; x=1738341007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xCeU+LpcSryg5lQ4AtUsxFm/b07YhdAnNy4h4JOSVJ8=;
 b=jdpXH+DPMjvvIWElio+xHOBN4syCyDgu6NcT74/DhVrqqe+nvfXjyRRTVsUb7M3hPU
 5HrORUx079jZgAoMhFSRQZg734ohfPKHJZynkXqli/ts3adeB82PsVsosuo8xN4JulGl
 AbAMp/6B5Yy0LEKnFPNRJ6FgQ9U+zzBiJcwLd03X9M2FpHNIkUM7hiikQnXJs2arLpfz
 Z8snTo483KO0NSSh6jPMuVLewQXmGX88gU/m0vU8zVx448Lq/Mc48ndIRU6ZN14NExuZ
 NxtiuYVr5WJiPy3tThrhd4IO1e4xzkXqh+qHHwUl1Y8Ol0PmfVAU7h/ExnQ0KOrAFFEg
 L2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736207; x=1738341007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xCeU+LpcSryg5lQ4AtUsxFm/b07YhdAnNy4h4JOSVJ8=;
 b=X7FQJGhDwTfdP2QniTs3yv9q+J0XqjRYlPzKSAEsxsCtxEtV3ihuKt95rC6KFnlUPj
 0+sehUJP1hzH4IwqoXyVn2W1IrRcTLxhFRM+De6Uf4n5Jsxf5cCBizHj+EjawdM6AOri
 MZTxH7652IFktUedC6eWwqTPjaL5Y2bZ2OgPmqnu3i2UwTzFHGWNiDoTuDCoMmGYCKN7
 njn4qFHg18RxbQN4PI1GnDNd6OZPugWXv3AdaFXx5B5ZnCroawruucs62an2dc6/L508
 YW6JtoIFW2GOya2XoIRsyNv6AwAe1VixOJGh2IfxKjUCZqTny5MMBPW9cl2vTPByNiKR
 o18g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFmWoig5R+qEyH5zE+fg70v6x7wbJI0GMiXcJ+DhWy3Y5r7BrkQ9QNuExR8HKKv9nb949KZXW4iFEA@nongnu.org
X-Gm-Message-State: AOJu0YwyS5lftaAn4gBu5sL9CpFxh2/0WpwhlkQCiDAX7PFPYoNeYLGK
 aiqLDo22atBDDi7jN5oQH1RL7LGqcSX+6ddPsxNUFPF1rzQmW7YgAmyAGG7KYlWqk6CIcf5GQla
 r
X-Gm-Gg: ASbGncvdOuATobVcvmefv39NY7MMiM+D5n23fJnIuc/YVgblxeTxJ+Tf0lg4ArTia7f
 kQ1T6V8PCI+oma/gJApSW/THPV5Qeu2/hv3z7NbXNy2YaKSmG2D1KCNtF4hiPXHC9xTq0FaXy+a
 /nvyJ8DbkFaDI9s11eph3khEYkKdAHzZ3IB7DREHNkm8LTid55hBDFCdIxvSeUvwf3JbjVbOn2K
 LzXzsLJNnyoRU9SetEUI41T3pEPu3eBPUgoaOxbJ9Isj92NWSpMEOVWJtc0s5MG/Ds5QVZ9QJ4l
 FJrtFQv5VWE=
X-Received: by 2002:a05:600c:5110:b0:42c:b8c9:16c8 with SMTP id
 5b1f17b1804b1-438b885b8c1mr76545395e9.10.1737736207376; 
 Fri, 24 Jan 2025 08:30:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 70/76] target/arm: Implement increased precision FRECPE
Date: Fri, 24 Jan 2025 16:28:30 +0000
Message-Id: <20250124162836.2332150-71-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ok9wFLJwLQS6

Implement the increased precision variation of FRECPE.  In the
pseudocode this corresponds to the handling of the
"increasedprecision" boolean in the FPRecipEstimate() and
RecipEstimate() functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 54 +++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 1b7ecc14621..79e58c5bb2a 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -731,6 +731,33 @@ static int recip_estimate(int input)
     return r;
 }
 
+/*
+ * Increased precision version:
+ * input is a 13 bit fixed point number
+ * input range 2048 .. 4095 for a number from 0.5 <= x < 1.0.
+ * result range 4096 .. 8191 for a number from 1.0 to 2.0
+ */
+static int recip_estimate_incprec(int input)
+{
+    int a, b, r;
+    assert(2048 <= input && input < 4096);
+    a = (input * 2) + 1;
+    /*
+     * The pseudocode expresses this as an operation on infinite
+     * precision reals where it calculates 2^25 / a and then looks
+     * at the error between that and the rounded-down-to-integer
+     * value to see if it should instead round up. We instead
+     * follow the same approach as the pseudocode for the 8-bit
+     * precision version, and calculate (2 * (2^25 / a)) as an
+     * integer so we can do the "add one and halve" to round it.
+     * So the 1 << 26 here is correct.
+     */
+    b = (1 << 26) / a;
+    r = (b + 1) >> 1;
+    assert(4096 <= r && r < 8192);
+    return r;
+}
+
 /*
  * Common wrapper to call recip_estimate
  *
@@ -740,7 +767,8 @@ static int recip_estimate(int input)
  * callee.
  */
 
-static uint64_t call_recip_estimate(int *exp, int exp_off, uint64_t frac)
+static uint64_t call_recip_estimate(int *exp, int exp_off, uint64_t frac,
+                                    bool increasedprecision)
 {
     uint32_t scaled, estimate;
     uint64_t result_frac;
@@ -756,12 +784,22 @@ static uint64_t call_recip_estimate(int *exp, int exp_off, uint64_t frac)
         }
     }
 
-    /* scaled = UInt('1':fraction<51:44>) */
-    scaled = deposit32(1 << 8, 0, 8, extract64(frac, 44, 8));
-    estimate = recip_estimate(scaled);
+    if (increasedprecision) {
+        /* scaled = UInt('1':fraction<51:41>) */
+        scaled = deposit32(1 << 11, 0, 11, extract64(frac, 41, 11));
+        estimate = recip_estimate_incprec(scaled);
+    } else {
+        /* scaled = UInt('1':fraction<51:44>) */
+        scaled = deposit32(1 << 8, 0, 8, extract64(frac, 44, 8));
+        estimate = recip_estimate(scaled);
+    }
 
     result_exp = exp_off - *exp;
-    result_frac = deposit64(0, 44, 8, estimate);
+    if (increasedprecision) {
+        result_frac = deposit64(0, 40, 12, estimate);
+    } else {
+        result_frac = deposit64(0, 44, 8, estimate);
+    }
     if (result_exp == 0) {
         result_frac = deposit64(result_frac >> 1, 51, 1, 1);
     } else if (result_exp == -1) {
@@ -830,7 +868,7 @@ uint32_t HELPER(recpe_f16)(uint32_t input, float_status *fpst)
     }
 
     f64_frac = call_recip_estimate(&f16_exp, 29,
-                                   ((uint64_t) f16_frac) << (52 - 10));
+                                   ((uint64_t) f16_frac) << (52 - 10), false);
 
     /* result = sign : result_exp<4:0> : fraction<51:42> */
     f16_val = deposit32(0, 15, 1, f16_sign);
@@ -883,7 +921,7 @@ static float32 do_recpe_f32(float32 input, float_status *fpst, bool rpres)
     }
 
     f64_frac = call_recip_estimate(&f32_exp, 253,
-                                   ((uint64_t) f32_frac) << (52 - 23));
+                                   ((uint64_t) f32_frac) << (52 - 23), rpres);
 
     /* result = sign : result_exp<7:0> : fraction<51:29> */
     f32_val = deposit32(0, 31, 1, f32_sign);
@@ -941,7 +979,7 @@ float64 HELPER(recpe_f64)(float64 input, float_status *fpst)
         return float64_set_sign(float64_zero, float64_is_neg(f64));
     }
 
-    f64_frac = call_recip_estimate(&f64_exp, 2045, f64_frac);
+    f64_frac = call_recip_estimate(&f64_exp, 2045, f64_frac, false);
 
     /* result = sign : result_exp<10:0> : fraction<51:0>; */
     f64_val = deposit64(0, 63, 1, f64_sign);
-- 
2.34.1

