Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2458464dye;
        Mon, 30 Jun 2025 06:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWo88oMg9BV5ZkiNFtlkGo0PsghTmstoX3BKTYfGKDtxeL0vudtcHSE/SunA2BvBW737toIRBBTzL0iag==@linaro.org
X-Received: by 2002:a05:600c:1e87:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-453900db0f6mr114630785e9.18.1751288991104;
        Mon, 30 Jun 2025 06:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751288991; cv=none;
        d=google.com; s=arc-20240605;
        b=DwBVqPPirUQNOBbJz6JIdj9e+fLJKFNsUfz3lq/82gD5WvbRM8jAUigg+N6N1EyEua
         WI6n+YvHs85iQ1uBkd5dnYNu6TqOoXztUlblqH09zQ1dXKs3qorXM+uJ2uRZ0i/8RROI
         yQ1A7pOQe1cs2ZzRJiq4mnSyafoiYfbByzwfLVkw8tjGunAeTmvjSNL9g5NIISQy5xwk
         hYiJ4j6yaV2WWb2UQMq/+VXExB1XWX/HIXclL8rLBuStGGYgRjSJx70jLgCAnfle4bKx
         AaQPYdKg1nBtTGv+OiHSizhGlNaOj8UOvqpbOd3CnR4rST4iVc3xNb9j0ogF4/DF5QBc
         vYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dBFvK7DiFhA2sEsL5eyFByettabJhzHGLaBLOapmzQs=;
        fh=5WQstX4I5/o2co6vzW5Mc5SD7G7UPUgEuD9tdP6uREo=;
        b=UdxDLRwrj62iVxjztNNFUuoN/qYSz2z5UJb2IHcaCViPj7PdnuT0vOo8g4IEGvAPtT
         kkx8aRhkKNguZMlThIce5bemun+u+Ma4fjVoe27kp4st9F57P9CgBlAQ8ZpmOxJrN1lc
         LhWkfNe2yaIqgqLfdoL59w6eQdGBl1Wn8OVSGwqZ3dv12RVfOQa5q6CwZV+XD0lf5QQf
         Qc0M/t3gr9zwZXOz3k+nYwVV6/wdOF+5vwKGHk3mgu4fSW1b5payQ/3LDPPlH2SldSAc
         kloq3Cb7KNAFeuwPmbedeRXhEY5q3skaCRarx3wR882XModnv1ebTBpTYql61PUWoTjn
         /kYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kjvi2zwx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a40a1f1sor39968545e9.8.2025.06.30.06.09.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kjvi2zwx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751288990; x=1751893790; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBFvK7DiFhA2sEsL5eyFByettabJhzHGLaBLOapmzQs=;
        b=Kjvi2zwxpv1iPXYdTkOH/69m6RCkj/84N8ZG4J+GuSyvmxl2+/a/+5Li8dEPpNtCmX
         NrXVggiKIE1MWmoGdgyvP8Izqf12ChJsEINNXs8NHKH7Bwynb2YnDZ96bhqgq9D1dgxJ
         mJViU8/QAW1uP985u0vmbT2xKqBcH54vk1vcbScn+nAtZkYCG4LY6IAT6twn0UoKJ4ua
         uclxAzN6qdaJzraWXNAor0Ej1k0pzOoDdcKZXSzQRv9HAthpMYCsP0SAqlpTD4OZnmpK
         10kzCrximnyA0UOz5W/YV+W/7SUtrfLkw/mN7j5IBzwRn6roU1XdsFqh7venW9JSriY+
         g2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288990; x=1751893790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBFvK7DiFhA2sEsL5eyFByettabJhzHGLaBLOapmzQs=;
        b=NxLRFP/cPhxPCk4DQbVK0J3QvXhiYcBOyFJNTsDWtRttZhnLjv2FlLpTBtgkPIKib5
         sSF1J4yI299zzsKxiHZThWA/XeHl6dl+sj4jwMgbWEFigCkW4xldlykZbENBr6VRRbeS
         BRrc0MtwyBrUBDcDj+e0/QSwRZ4oGScYLIKiId0UuUx3ZEiG25R0wlLWc7TZehjp9RjZ
         BQNniiNIdP+eRJWKvKcCac02jRD+T2dFoxnJmD0SPSiLmYn4VUw6P7630jDwYc6BbdUJ
         e51C8m8CeW4PEGfCpMcvHYMU4r8V7iPCTdOSdeReY4bSBy/IrN1lGr69IIxsvaQFo2Tw
         HY2g==
X-Forwarded-Encrypted: i=1; AJvYcCVdO1koIioieRygiQyKIdj+3VOuJPVZxRb9H+cjXByAAThxyapUSD5geof9j9oHAvxyK/+5zDgcZVuEcg==@linaro.org
X-Gm-Message-State: AOJu0YwwJ+RdDfgkoQpwivCzIAFq4S85dVLzr5LlNWtJYNrrVLGWWiAv
	+IcquP3R0aahIoP01PtyIhpu+Crzcd9DNU/5vnlU3gCnnEpBLtKacH/I4hWUcnHnz3ix5A==
X-Gm-Gg: ASbGncse/aTzWMY3v63BVXkdP7whs8jIF/MbuSfERnMJH2/uC26FlSHGt5ygQOcjA9A
	at4hJYhZ0sF+tYBKuS/HIFMsKaKq18gB9LxM/G5xteSV4v6q4UmbB5LRgwvBP701irtiDbjRDCU
	BrmQq3V7D4ZP5i6UwN4REr/ReooXudOIqDhi1orxtjKaZ182WQdJUzMj8jDPwyOFQue5CT4hLZ7
	O2DUK9bErxBwOyVXUxXbOmLP2GrUqgbkHqZecrNaWw9aE8LywUAg7QEGmubq/tFsWr/R7ds4b60
	MTpBt3NFqmH8C9EkGQ8RrUvRno0A1rDJTY0M+xpotG/dU8ufhzjoO9iJb7osS/vJIuFMZltvIBx
	uCxj948zJw8lf2ymkAORAhmJ3uZJAyJD1SKK/FW+EBMAUeBk=
X-Google-Smtp-Source: AGHT+IG5Ui0WZJV6aSilq/6/XRjwd5qwQLFqiHm+pw7RRWcHIEBBTfmNOBhvCo2f3RV+CzUCypmSfQ==
X-Received: by 2002:a05:600c:1c8b:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-45391431c04mr119049435e9.5.1751288990446;
        Mon, 30 Jun 2025 06:09:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8e1sm10247814f8f.88.2025.06.30.06.09.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 06:09:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/6] target/arm: Only allow disabling NEON when using TCG
Date: Mon, 30 Jun 2025 15:09:33 +0200
Message-ID: <20250630130937.3487-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130937.3487-1-philmd@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JjLhTtG7Jdio

Only allow disabling NEON when using TCG.

This avoids confusing user experience:

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither

  $ qemu-system-aarch64 -M virt -accel hvf \
                        -cpu host,neon=off,vfp=off,vfp-d32=off
  qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: Property 'host-arm-cpu.vfp-d32' not found

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ab5fbd9b40b..b6a8ba83a46 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1810,7 +1810,7 @@ static void arm_cpu_post_init(Object *obj)
 
     if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
         cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled() || qtest_enabled()) {
             qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
         }
     }
-- 
2.49.0
