Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287937lfk;
        Wed, 9 Feb 2022 20:05:12 -0800 (PST)
X-Received: by 2002:a17:902:7582:: with SMTP id j2mr5470719pll.115.1644465912346;
        Wed, 09 Feb 2022 20:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465912; cv=none;
        d=google.com; s=arc-20160816;
        b=h4El/Sd++JPnRwxMgsTFEqa3fYYBsR0puAeOlDPVSDUAJvZ3OUNECj4qeG4QXQREcj
         M0SQGhwUNLMdSP50cefTgAQxd82S3TU6xWwLq6EjDcBYoLFl4LQKoRk16vCkmLfdKl0J
         RkSqn4hxKalNIaEGYAAyw1ITai67VbBZ8FOVK1v/ESOysKLS1BlpIkdnTe8Ztkmvzn9V
         sDsEO4X6eW73+PgDMxBudhF4KaBIFFjDSeCjR43eh1H9SF07K5PhUdz/zX5YpPRPzUrv
         x2JczlOWon6ChITev4ORdRyKtCsGxRtjzw+gK0xdF+oexnWHcjNJKEv3SRe/CFPZCRWI
         MWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/PyGX3z0esgQKjWtAq0OXlyQ3FBYa3KsBIg46iOmGfg=;
        b=wyEQ3S/+WFZIMDBNlHQWdRThXJZO9ixXnGT9Y/Fz+tsQxhIFHBjEg32Q0QDqLeBX4Q
         NNjrOXjD8wd7V6w7DBfkoEBeHUN6nJ2vOWUOnORO3PzuZVIHshvu+xDbT9se4Y18GLLg
         w9lcXp9jd5l0vatkGRGQbKHYgl3YnP/QENnOr8EHFCB6HHaYVKCeRb0NGu9tagoQEl0F
         ByGxGYHVk5OajSLF9XTNnql/IiFPY07ug8WZSnx6za8QhdbUGVwdwvl1Pf/ixMFQ7qmz
         cvWzhoNHXYg78Rw7UNohdIYoT4igXfBaOhL3LHYWqJJhvsPzG8Wn12D9+atipqG21MBU
         5dyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kfqC3NK4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ml1sor186058pjb.37.2022.02.09.20.05.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kfqC3NK4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/PyGX3z0esgQKjWtAq0OXlyQ3FBYa3KsBIg46iOmGfg=;
        b=kfqC3NK4ri29kF9NBPjhhpz6IjztxGGBsIcc2ETKQDQVMot/koXli4OmLUFxRRQdf6
         4fPCqGpCdyHxBjxgkX5fpmzdI+4n6xHK1Dbfpz2UMBEwq0MIjUInvqnZVzXhAzkcRy0w
         avttEZx4P4phkTLj6EtCAL4Sb9IFwISptCpcweYvX70tpCJi2Tg2nSnqI16q7Ig+2ILw
         K7OvAh23uar0xAKByTOcWDbqR1hlRqcPWMzrIliaZleexRI1KDAzUk101vd1q2kyRJTD
         RaNws58VWuIkaXJVSm0w4cmLlvWAKl1TNmGYgQX8BVp9LqlAyWlADlie3Rni/P5KvDdb
         5FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/PyGX3z0esgQKjWtAq0OXlyQ3FBYa3KsBIg46iOmGfg=;
        b=hR7HrWnyjmLdKr0CQGdppa1L2H5QH+AE6ib9fAgAtgty7aQhnOVSMgyt4DbUF4yFJt
         KFa5RqJK1Q7mhN0sbyFF+PRJ1hOB8UNhUx3ziBKb7Xp+so25gF30/PT+UsFZU3kRK6Sl
         AR1TvOZip4yZ23E7bBmTwyZNkzFIgXIo9xPwFOIoeDlwNtQU96FdguTDtsMzhJh8LQnI
         7RunZGsH7wJZCZR5wl/Te/Dk5fdkqkFfplHQXXzBY+mtwoafZhKAEpehif57IPg1ZseA
         dI/Lb4ly+Z4/EzWaYL6e4JBt9ZAQI3p0OEDaDx5KcHM4tjGBoJ3Sl0CgAGAtJ08vO9xk
         kjDg==
X-Gm-Message-State: AOAM531MPOoZuDd2fNl7CT6T3+kXiP+lHAP0kRvAgaaHXwBio6eQwsUj
	dQoXojb/R4ouGZcZpsbj8v2Wbbns
X-Google-Smtp-Source: ABdhPJxdORFKGt+AH+E+Z1p3QTMgjDJlZZiIFKYSfNOSKjfZPvQgifrV+te5bdK7mhZSV1uAGckLOw==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr744294pjj.132.1644465911851;
        Wed, 09 Feb 2022 20:05:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:05:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 14/15] target/arm: Validate tlbi TG matches translation granule in use
Date: Thu, 10 Feb 2022 15:04:22 +1100
Message-Id: <20220210040423.95120-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: P05JfPJVY4Hw

For FEAT_LPA2, we will need other ARMVAParameters, which themselves
depend on the translation granule in use.  We might as well validate
that the given TG matches; the architecture "does not require that
the instruction invalidates any entries" if this is not true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e2551e693b..771de959dd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4518,12 +4518,16 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
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
@@ -4535,7 +4539,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
 
     ret.length = (num + 1) << (exponent + page_shift);
 
-    if (regime_has_2_ranges(mmuidx)) {
+    if (param.select) {
         ret.base = sextract64(value, 0, 37);
     } else {
         ret.base = extract64(value, 0, 37);
-- 
2.25.1
