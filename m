Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183743njb;
        Tue, 4 Feb 2025 04:50:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVz1F/ld5SYqsOKV9RA4wLZhj41HXsy5GjQTXPSpylHrhdUfVNDfs0ux5tRWoX5To9fKG7kda4Xw8uULw==@linaro.org
X-Received: by 2002:a5d:47ab:0:b0:38d:b0fe:8c99 with SMTP id ffacd0b85a97d-38db0fe8d27mr537661f8f.48.1738673420238;
        Tue, 04 Feb 2025 04:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673420; cv=none;
        d=google.com; s=arc-20240605;
        b=Pjp6w3y2XSzPa84QjinDpgR6BXNDjjkvNCTXS90V8FLnqjyqmY8aGLMvkGzOYW4IhR
         s1oM8Z/dpgz7pnXCZ8/wn7QLyA0d9w596g9OGGEzt4mmXmoolYanGHHG2NCthclMqCyI
         /PTeIpRfvVj7isF9pKPAuipWMue4BiOgq6MFOmS2t0XoqPyK5E9GwN/bZUFgj54MvpfV
         m8jB75Qm2NAEKQRSwtOI7XF4Rc3j/2XjLMAmDKeQuMHDhdXjUYzPJGoD2bXz/e+Ch7Zv
         2ub5FsjrpwI/yoOO3AYFUnSsRHxihV3ZDIxZWxWobNCQ4No4xAnvzNAukgHJxpjauDDs
         PX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=09VHH1K+AfyKzHK84Dwim4tocdMil186/qzqBE0PsZE=;
        fh=yCzvRwXa5kuBn7YeCoRqsuPMfdiDg0ekKF79YArli3k=;
        b=Y8kGWN4nI+fYMQk/R0Hosp2abx2pqWk4C3cT0lsBxDCMKS9vUk9WiWZMrH4JVwdzBP
         sJDlqCiDXyhROBHUy5/usnZ0rrQ3dWqYWhV6YpiKPwwsq8xD2OTeAEUY9NAvgY+DfUAO
         LBQR6COXEP19ljm+9gPv/0bCY5/MZUb7WzIkIomqAkp6KhrJKqxt8pH0KaBBxi5ZEdwV
         Y+3cbKj40ZtCLlt16Sk35GLWhcVIKpGjdGBe1YzeKyNX2KyDVXyA7wECdPFbg/g7S1BQ
         C5o+Wmz4/Jnnp/RSc0gPhtSt4izVr0Qhkz92qqTe3VDNt69RzicNiF6TKjlwzH3T4g/h
         fr1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/rc75OA";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38db012da10sor166021f8f.9.2025.02.04.04.50.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/rc75OA";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673420; x=1739278220; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09VHH1K+AfyKzHK84Dwim4tocdMil186/qzqBE0PsZE=;
        b=S/rc75OAJIlA7W5z1mpd6vGdwQ2sG2+chOvtflxcsuZfLh3igu+IUh6FJFl60jDdK5
         jvCf0lB7h+2Pc0fhUNFK1Guqq/gups1rAgOghXChoFNNwQzUXnbwTxuH1ujM/5uMP7mg
         SDRTv8p8kmUPf/C5HzlPldZKD2ZR7xepqONwAjgUt278dastbI4xr3KnEfq73Th/TGuX
         dF5ZGjw2j7SBJcLRHak6UCesiVAkcekJQLDf0leJS4dxTJSM8zRpyUYSaETUXuT3N7UB
         ON89BgqmBzdTF/FgcN959qJ3ZZVuq0p+n6TSK1aCr+K4qikgiTxiG+JzCKR3kh1DKCFc
         e6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673420; x=1739278220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09VHH1K+AfyKzHK84Dwim4tocdMil186/qzqBE0PsZE=;
        b=UEN2xGtZRp53R5ppeJDG5qOUqNB00fWdOQCEt5ksrHgTwcfp7lMUH8eBEU73qScbyz
         1BUh8DtUBp60tDB9QIiFss+8OTFPFRmsyoGbYcTZCEBFjW3Ou/Ljuv+LKo62cyRaRvy/
         nGl6pvW5KWUDemnK77ga9V90mnB1gNPJ9TWKwFFH3e0Y7s1OjBFvwnXtYb+60a4KZmNA
         gclkoL6ODGaR7ikgkWN56VLp7i/EFWkg1xoBruiC4lWnog55VKAnW8wlxdCCldhmqR/s
         +mSikmG+SMDjr+hCuDwLw6dF5K/NtRwZzfQIGP85MX/ppVQ636j98rLxI1vmJ4WZM9I2
         C2mA==
X-Forwarded-Encrypted: i=1; AJvYcCWm8pxhPakQxbxeEm0/U/7GTTFJl2ux5YktTcafU62j9yhMwomjJQInkDbLtHo+6GbdvJI4/HyLyO5rAg==@linaro.org
X-Gm-Message-State: AOJu0YySILHJUMy6jhHsW5AzVIu4OBS9XK+UpXaqV0v/RNbSEA1I7Tb5
	V3wp/SBSIVAu57LSvYDdpPDuT5KyCKYt1b302V89frxZB4GgPIC5XhiHP5aVBWSWBw==
X-Gm-Gg: ASbGncsEiS7E8D9znWs6vyelCin+C9DWVwfGDEG+CiDZTC/OpRC7F2ES6SPOV4YbV3p
	2ZxsA8zy3tVFitk22CT8rOJrS3DT7jcsihXn2P6l5XnCKJFLGANGmS8cfV/7RvkCd9LgyQGDgTx
	XMszU6l4dQ6H0PhQaVLOrWf0PGZ0Y1x3YatkHJNJAyWf8gqOdjVrdJzSKUlFI/Tj6bq24bnswVK
	0gVpVxCuUKzm/yTGMgahvajdwEZYu/fz1AnrC7bGLrEYYQTqrnXYfIVf1Yj940pic+64Dd8fgzg
	+AV348t4WX5DRlq2BF5l9Q==
X-Google-Smtp-Source: AGHT+IGyz8/6HdawodkAOlH5PK8Zn2lvjzDTYof2mfxaGdU5rwm+uLFeWzG0EqbBJJ3xZ/3JXd2Djg==
X-Received: by 2002:a5d:5412:0:b0:38a:9f7d:9339 with SMTP id ffacd0b85a97d-38c51a693c0mr16853944f8f.28.1738673419704;
        Tue, 04 Feb 2025 04:50:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 8/9] hw/arm: enable secure EL2 timers for virt machine
Date: Tue,  4 Feb 2025 12:50:08 +0000
Message-Id: <20250204125009.2281315-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: U96+6wEmked5

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99e0a68b6c5..c00a6e410cd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -873,6 +873,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
             [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
             [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
             [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
+            [GTIMER_S_EL2_PHYS] = ARCH_TIMER_S_EL2_IRQ,
+            [GTIMER_S_EL2_VIRT] = ARCH_TIMER_S_EL2_VIRT_IRQ,
         };
 
         for (unsigned irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
-- 
2.34.1
