Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209923lfo;
        Tue, 1 Mar 2022 14:00:25 -0800 (PST)
X-Received: by 2002:a17:902:7895:b0:14b:6b63:b3fa with SMTP id q21-20020a170902789500b0014b6b63b3famr27408484pll.156.1646172025232;
        Tue, 01 Mar 2022 14:00:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172025; cv=none;
        d=google.com; s=arc-20160816;
        b=lP/wJKE9bgi8A7jt03xbMpY6I19tAT0JqOSg1wEOtznOik2cTaGEh1i21aiqevl/Eu
         qNLIAmNn29O12xb/Z92su+JNcXMYyszUCTKGKMAYwsyXcaxCpIN2a6d8XqfibFw5EG/A
         W3iMvSmOVrcPcQbTWwDiDH7gAhjmrnWB3DKedF0c7NMskRdc1E9N3DhbcIdNh2o1vbvE
         lV/mSrXU3ljFslRpJRPX1d+bbPE8FPy0bW6useoBo7sT9T+gfOnzs8okDjYNGG+Z4iA4
         xPD0+8HjCt9EYzl9P/+KwrEj1itYnGnRLd6CoKs7CgFxqceIIzP7uKHHI27HFl3F8YKt
         gJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
        b=E9op20S/BzS+vx585nRwD3HvoMmvdXVaMXyVUMGx6xCjqiSSZU1BnA5ym3omn6K5Ip
         pTTmuXC6cB7nbv9cIZHUex0fnZ8o7/AZL+kg8ueQRW1EzuNntdPy3N+TmEnfWE1HsCde
         UplmzgP9ToPW7cvKRVI6J6AX60wzHB2P816Rtcxj3dLhVX+W+IySxLgWbf96Kr+W1mAH
         npiX8kL2xkyGN0gSAFnOaaGEyXjKoAi6ON9RrQ+5uAqcZspVthRt0wyIfKM5Hl94lVLp
         PNYRZHZQBdkDo4SaYrzV1IJ4vnnZd32ENDh0G7GjuPKAo99xQBbIrpYJCOOF4qN1l28O
         FtMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9uQd+Bd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k38-20020a635626000000b00373d9816da6sor8096537pgb.57.2022.03.01.14.00.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:25 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9uQd+Bd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
        b=P9uQd+BdqGTZoNjJTkEoT791LDyZo+Oj0K1NYCqCUgd+0+XDDTII2RZ8AVqLUe0ZRo
         8At3d44SYIuYRD8xuNIUBi6SJeJHz8ndIIZKu3IBPCLn5MLA6oJk0BrlUXyLQggC2UYm
         NEEflUTNywky58oWCAA+XQ+cUjUvexun1gwvaN9xonC7n2A7GUPGBgbFJYMPKWm+blS4
         oc1XOsfbotBpBjNIFhV/Hjb9gH2g/q/tmCBuNnzIpnyQy+3dDp4SXpOuJhMXGDuTJurQ
         ZerktgMKgfG3sy1oAexIdoZwlQNAgAK/o6lJjCOtbB233Ym/PUzHQXTv9W7MAn23xGd/
         3Djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFTKQrLiJ3VwSgvkt/IhaEgBVQ3+b8tLX7nUBsUG9rM=;
        b=G3XRhiMqVbl+WzGMuBVQpQpMet33wkAvU31aPAvDfojc+B+BSuntVnT+l5ckRxoKcv
         14ffleBH3Bn8BeOpD2oEDMffmSrnDtb/M6M/wjjj5LNAoh09WB34g+/BniPj2nNZmcFK
         0pDSXPE0GPzNOuAiUReLplkKYhuF/CWtN1L5layHuCLd4G0V5G/YcAKlzZRbcvZmu8mT
         7wA5xzdygIQTB//2qktw4fQNsHtPX8kMOZDd4Vihi+ZPfAnRY1DG5vHYgilDpaea5QPL
         Da+XP3Ge0g4ccZjs9PzTQv6d7IoIqk1hPA9bEi10rqm6QZfG8/3jQlgmVsOBlUeC3qZV
         mq3Q==
X-Gm-Message-State: AOAM531/IVz8O/H7k037hTmasaph6eEYz1WGbD9l8QVWXgnnvyeFdKHR
	wILAzqHHGceJ6Z50g36hqFxhDOuh
X-Google-Smtp-Source: ABdhPJyRcISYU/7qW1rlLZsHyaEDMprDLPFsHy5nt+k1QyBfkho6CL1xoCjZCmonLmizjG/lLNjUoQ==
X-Received: by 2002:a63:114:0:b0:34d:efd0:762a with SMTP id 20-20020a630114000000b0034defd0762amr23191092pgb.71.1646172024683;
        Tue, 01 Mar 2022 14:00:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 14/18] target/arm: Validate tlbi TG matches translation granule in use
Date: Tue,  1 Mar 2022 11:59:54 -1000
Message-Id: <20220301215958.157011-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Pf7GfJ3e4Tby

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
