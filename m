X-Received: by 2002:a17:90a:ab08:b0:1b9:c59:82c3 with SMTP id m8-20020a17090aab0800b001b90c5982c3mr11338082pjq.95.1645655503945;
        Wed, 23 Feb 2022 14:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655503; cv=none;
        d=google.com; s=arc-20160816;
        b=aR93DYrkgeigwpUNUhI8NDDvLgtvOa4sAOCNiGDTkWFpmWtdCjhT5YWQnmH3Pqz4dj
         sDKLnWtgXzHnbstUYvJGrgRAv+CExOBn+UXbJsYkONZGjdJCxhvHJ8a1DIT2Qim6eSw+
         GBTKbFYmMWT4ZFxJNP2qjus7l4Pmy8cl+lfzPNg4YFzn6jl/kDQUPpOdEUkq4Ua3RiFr
         NsZ5+IZaYmop7tl411oWaxihVW1jprYzRidcBrN+bFd09q4jtKS1H1B+Zc8uk3e3wUIj
         8JVJSYmslw0p0tITPz0cXOMp3Xd+lak5fDaRNVkGq7TvtfMq/kro6dBiB9vg1rwQkNtQ
         91GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
        b=qDpJ86FSTge4VfPsVneh8l9gRSK9Ab4itHu7Iv45jA//V1Qqq6rkNzGOVQHsNjt/WJ
         S/zFMhSwQXfhjic+tfRpCJg7aPSLjYTYJxz5LcC32+mKDX8ajhn5ReN9oekyblc3jl8V
         IghcZk4Mfteub3DzKssrg4x+t7mDg7zdkAN82eF33aFd3m5i10WuhJ/qpbJMS1nTDnTK
         qYniBUjdGX34HjSbT3O2Us8FQ/znuYCzD9zNP8Vvj6CL6pX+ZxwxyQB6yetMMnZjDxkI
         yP2YQQqyObx7J0A7FvQQJpXlgR/GiUGgt9CBIryI5zHO+E5NpgTAdChDCOMKSO2uXDDw
         Z1vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jb8iHIsI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z10sor1350101plo.98.2022.02.23.14.31.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jb8iHIsI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
        b=Jb8iHIsIPgJb0kC0LfCP9SJnJck4aqWMbmw/XpGeid3EnFq4BbyLek50qTwCz4jzsL
         MbLEYLA9kl71q2MqYL45ut7A977P1YFzlla+viEkLLGv53epD6EbGxqsR5YlLaOzc5Y0
         2aiQAkjaUCgPaCIW/GMSfoI4py9OvHalkO2IQbrfzYd8jyGH4/qeXzLb4wlJSBkcIwhX
         s3HY8pubrIuFbaKlMonhNG7e+5DB0eClggee4SrKDdIkXjlLJLpshZj2CvwLMJQ1YcU1
         yMv4tTvk90wGhhqvx7765UA1NM1EF3NPU4qRSP2hw6E2eeDUQtDQiGdGY3xvCEYAd20+
         XTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
        b=lyFNXCR+rk8c53ii3K8de6o9D6Lp5Zr1jsyFSsaNTd/b3qjjmvhWDgbAfvgiGLX6tX
         kJPrTX2yXRUQqaMkAc8VjomaI9wY5E0jsW3YgKxwbbFhKjwNJ4xkL6YyF4ekdauNhKOc
         vTlzGQ+LeSLFH4kdnZwwfuvVEJaERkv1HwlH468/Y3GOPtJydCQ4M86nBgxJ16Nbj1zI
         qqh4eZ46BjTXGD0dkgB2MNTmT7CKxFiuSXZv9KA3jLUwpBLLJ6yRPEPzqzYwSkKlnoHk
         rp8YDZnKBQamv+XAid3cGf8BcYXJ4OLQ7Aev5Bb5bykMdvl6JuSbMfxSUHaRsNIaZ3ms
         ibpQ==
X-Gm-Message-State: AOAM533hlYyGrvpcfWM5x64UYnm1BPEcHYQdud1m/O71rviTY3HvkPI5
	zj/UCWRMvyh1UbA/EKickfrsfjHfHrfbaJrM
X-Google-Smtp-Source: ABdhPJyQT2mwJELw7spYq2ce9Y8IPCO1lNtgttw5A6uBgkG+gRYRwzkvrSpqwV+7z/E3M3nuHZv17w==
X-Received: by 2002:a17:903:11cc:b0:14d:a0d5:76f with SMTP id q12-20020a17090311cc00b0014da0d5076fmr1687482plh.109.1645655503471;
        Wed, 23 Feb 2022 14:31:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 02/17] target/arm: Set TCR_EL1.TSZ for user-only
Date: Wed, 23 Feb 2022 12:31:22 -1000
Message-Id: <20220223223137.114264-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r2nruV80y0LE

Set this as the kernel would, to 48 bits, to keep the computation
of the address space correct for PAuth.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c085dc10ee..e251f0df4b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
                 aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
+         * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
-- 
2.25.1
