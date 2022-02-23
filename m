X-Received: by 2002:a17:90a:178d:b0:1b9:75ce:34d8 with SMTP id q13-20020a17090a178d00b001b975ce34d8mr11436143pja.228.1645655523583;
        Wed, 23 Feb 2022 14:32:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655523; cv=none;
        d=google.com; s=arc-20160816;
        b=wUGwl7+xm3BfMcv7CGR4A67kC8HMma9ID0NlmcnWqgqQtPSaKE0hcwGd7gR8FX16QM
         tuxeSWmlL3iBf6W9hsFdeRH6BDQEvehnwao4K/wpXeDGfOcaXGtpWycaHx/H5/Yk+buk
         4RrIafj4xK8WJ1h3UwSmrf2ptVMmiytS4FNQy4o53Km1UCM2tPokq3ILKQu2Gk9M2IYc
         Kn7M5WMOX9ge0JEhsswmVowDEkB/pabymIjch2pJ/raRHHwXj6a1rfpyQDvY8cD+P+14
         KpqMqeUq2cPfbfXr4NnOGYQvkHYRvM1zOYrJ14HwE8V8TIb5ltHdFwVME0RjDv8b84t2
         iZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
        b=VPwQjed48QNzD1gcmYfaNS8L0Og//koDMOZE0OfpAbV2dUbskgsCxafo8mPWO1GL50
         nr51MeyP6sngtFw9Pn/+KrkPIhBUBo1ZeELX7uqvqfL4LKQ7zTeuDC4diDiRGlpVBFbc
         ddFJShpQY+OvuMCEiWByArBc00jQITKgAQxqcTbfgaCx6dPyRBovh4Kc29PCDZ1t/t4G
         SOFDKSQ0IHQo6uZ8IIj23lyc5Q+9w6S8ecADY6Uvfjup6QpukCTCyXw06mNm2TrG2Ked
         hXx/rDJtqxILzCd1Bes/H/T4KP+/CZNqmEKAqLl6d9M+91AHC4YohhTQqpgPJV0sttWu
         r+Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWPSZzl1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u4sor578008pfg.60.2022.02.23.14.32.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:32:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWPSZzl1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
        b=nWPSZzl1BCWj/NZFxKS0xZWxznh190caDQn90GNbYNatDKrYpUUZ3tmS4mTitmHWkE
         AG+o+jKuOmr+O5p96aQWAW/3vlYCRsjsKjWmZ2kmvc0pRcoYv7pCjgHd1KhAdetf3Q7C
         oYeiOyArEHmyEbapSM+Jtla6f6/ghxgR2NE9rmRe5OUCXR2dQGv2jPpV+XT0Qrx+Z6ct
         n2qXuKa/nBKsuxKLtNdh9jfKGIjNmdSnVoDO4GFck3++1YGDmXyS2bTTlkhRy2NpH3RO
         dCzBZ/FEzAtY7R2DqizVc6YUjHvd5ns/BsTwCc9gZIFZiFi7caXsjbG42OfotEjcrU48
         pl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
        b=oZKtBVwZdN+BT4/myNA34ul7QDmBoIX+8zlcRKSBrX/WB6jtpHy+WZclh+tyh7aHtr
         J+87bR85g3DDzNdzOqoCYZQVXoYafh0BRYEDQXiwavXiijbEcYVGni43hyTG1AwZQwxG
         gBc+rlkHtOE2oen2jjBvsdWzOhQVRPKVnSHgx5Gt+xLal5kvshlX4gZO1iWXhSLIKF7C
         A/keslx34Cy78gpJ1yAX2hl8quYLoJ91bOS9Tj4edM5NA+WQKWxoUKi9LRogtdKiTG0H
         dEt7NBJNwQr6HnMFt9wqAS5iLpiEoJMmLmjsbhjDX/iJ8CtR5sM40YFYCtsldsZqStIw
         ilRQ==
X-Gm-Message-State: AOAM5334KQQg/tH05hlXqwP2QA/6sfCfe9ySHm1+CGlLG3ja5tIXPhT2
	udw87wIUO8ET+6nAAuB8MXs/dKJZ
X-Google-Smtp-Source: ABdhPJzdvp4M0CYcaaD1NMp+5V42ZMV/tr1v7F3yUcuDyunIzXZhdl1kdcx6YZqq7gfB9O5upxPf/w==
X-Received: by 2002:a63:af02:0:b0:375:57f0:8af1 with SMTP id w2-20020a63af02000000b0037557f08af1mr1400927pge.188.1645655523076;
        Wed, 23 Feb 2022 14:32:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:32:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 14/17] target/arm: Validate tlbi TG matches translation granule in use
Date: Wed, 23 Feb 2022 12:31:34 -1000
Message-Id: <20220223223137.114264-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PKFCtjYdB+aS

For FEAT_LPA2, we will need other ARMVAParameters, which themselves
depend on the translation granule in use.  We might as well validate
that the given TG matches; the architecture "does not require that
the instruction invalidates any entries" if this is not true.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e455397fb5..3a7f5cf6f0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4520,12 +4520,16 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
                                      uint64_t value)
 {
     unsigned int page_size_granule, page_shift, num, scale, exponent;
+    /* Extract one bit to represent the va selector in use. */
+    uint64_t select = sextract64(value, 36, 1);
+    ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true);
     TLBIRange ret = { };
 
     page_size_granule = extract64(value, 46, 2);
 
-    if (page_size_granule == 0) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
+    /* The granule encoded in value must match the granule in use. */
+    if (page_size_granule != (param.using64k ? 3 : param.using16k ? 2 : 1)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
                       page_size_granule);
         return ret;
     }
@@ -4537,7 +4541,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
 
     ret.length = (num + 1) << (exponent + page_shift);
 
-    if (regime_has_2_ranges(mmuidx)) {
+    if (param.select) {
         ret.base = sextract64(value, 0, 37);
     } else {
         ret.base = extract64(value, 0, 37);
-- 
2.25.1
