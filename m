Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756593njj;
        Sat, 3 May 2025 22:31:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNCpWOQozawZ7F4k+NQ8+AwDimWsy7+9DXdlvFN3iG7wz+s8Da9pVMA6lFS4gudrkWG9COFgy8++aHgQ==@linaro.org
X-Received: by 2002:a05:6a00:448a:b0:736:d297:164 with SMTP id d2e1a72fcca58-7406f08c282mr3934309b3a.1.1746336587845;
        Sat, 03 May 2025 22:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336587; cv=none;
        d=google.com; s=arc-20240605;
        b=RA2aRiOJ6Wae/XExUSyWW8Ss8HaTLZDN9ISga0lY/WSH6YaCoaP/EbkD0Okhqjp1Zs
         08NdbFMT0L2KANvxwEUmNZrRmWqWw4XKidz7k0UeoHYiLJ23NK7Toq2jRJLMSfygyZpA
         kal7ZC2KCprDfjHWSwFNnLcfdbSNHNHBmqr4B1h3Rv3uCZsbrDpjSMzYYZWKV2EQQ4tj
         N/VV44k68JvX90EgGPk4ONZMYcqNFTAS7q57snKKHYSGAquUfEclbcPEs6v/K/MgOWnb
         l8tGSOaQGjrtV5N9nO00JgktOE35A5+XlO3OXZ7zruEdBcbI1fJTMWUqHIc9a0arbU9f
         AXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YoA0Kgl2rygvKGIkAwhDx+FIBh00kPrYN/3sfHQDQ5M=;
        fh=HY1txn8EP6/ZwNq7nbboIopp1+9W4zZBIw9veENzhXI=;
        b=MTD07tvNoNMFJ7MfPDP6cDTVv4EKSrzkTg5ksQYlhRXag5AMleTYi7U0nA/uCo0bsG
         FOHvXQKX3/z9bg2/NKXteKzR+aQHv6QzoZuBJo5GxidGkbX3KJm/aXDKNVuUaiAYmAri
         JHWJ/Vvgw7Bthtexax7XSV/O4VN1C5/GoewdMumEzt0T6DPY5fe0CaixJkmgcHi2qqUH
         Quk9hSKNkzSShicuXYqDk/q8dkm4hyPIICUomNYBKhKh+7x7WoFqp/Iloas6G3qS/ZSP
         pN2+Mt0rAbhsSD1FawBL2TeEOpJDCX9LvIkh4qrqq82Z6TjwWcw46mXB4AEaYhmm4cp7
         FajA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGmhMlFA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74067525f7esor1084431b3a.2.2025.05.03.22.29.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGmhMlFA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336587; x=1746941387; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoA0Kgl2rygvKGIkAwhDx+FIBh00kPrYN/3sfHQDQ5M=;
        b=mGmhMlFAeMKI80tCuJj+6U3pSi63CAt5JOuABaX7nW/1+MogITnWj2HxujwqGkcwvq
         MgF8ir+mjIznvwtXTXQYrAIZ+6p9zt+7k6ZoEq9/wSogEtLTcnC0XK+YikJOHFQE3Dh2
         EeyYQG+AhEJ264Q5aFN2MhLnYWNUPCzEJs5CmB2XAcuKE3zkxjX/DYfPzejUT4rgRe2Y
         eB1bW/R7ZOWYJ6gfQXmbH4I1VPzdKHJVlUs0ohwueUAv8DnYEl5O6D/mGp3ICXEELmlZ
         OUHGPctzMyuYYJVz2vfhXKGqPdSLehssdav+UKGAlX7kuJ+TydIM82leKFuFbyIm7O/1
         d6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336587; x=1746941387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoA0Kgl2rygvKGIkAwhDx+FIBh00kPrYN/3sfHQDQ5M=;
        b=H0NJ/Ar3M1sHazLnnoU7enr2BeEuO4XMkXjntH4EY+vNPkk77OQAqOprBeYouZDRj7
         aOBpwJYXhNDRhesfD4wV1oed5VQP4hYU2tVOpwCWCXrtfLy6IPjKXKt2ErSxA9DTMCPQ
         oUSWgpn1SfPozXmyKp38z/5IYFXwfktwgMspLg9L8DzQE14ONF3eA9w4t8VEFE0VX5B/
         gxGH+ZTWOQzkGQ7wEmfU/QdSvKVHm6dt8685+HkmIHIstnHuxXPzyHBvnfQG+wJTPLGj
         Jyeqo3ttFxYBD8FXb0CDmuMhIN8vK+FDezmCyHUyzCQoH/0gYDGRFkQQ5/yzyzoVNbEZ
         uijg==
X-Forwarded-Encrypted: i=1; AJvYcCWaBcXLyn1wrn2v+yyq1+yCZykoYNHaPMG8D25Mczwp5MDC/oe7dexr74ALOHS4UeAs9srvEbKvjW2CBA==@linaro.org
X-Gm-Message-State: AOJu0Ywl/1FC/E65uN410JzxdKlxKiTi9zHGP1GnltE95csKDuZTUiOI
	0tRct6EPhFqWD994+o6K39kXdln2fbFCvknLi/6LpNkBxgVka0m00cyM1zvD8Ei4NA==
X-Gm-Gg: ASbGncua76977V81UNKltv47DuQBgpXZpQMUy0YwRvk9ISeetqJcCgrfhr7YA3XiwFJ
	KRdbS0aj6vMvowbJmBn4qqmTvTxt4g/5fmOvib35wrSsPgyAiQWpSoiIeNV3wFvgASaefKimlz4
	JIPemJpoFnWrHBPeV9lVKlOvvbX74BgMDgvVaVMcP2HQomULdoDz+4ABWr2DGem513LfmqQ45Ci
	AZ4ew0u7kd6kpe3eUyCp+qjw9W9A8qUOsxq5/oO3CkOxCJmYiC2Trd7UvBoLJa8IcAjKJhxw411
	QIGw2TOkzAzewjxsOJ3Hy32KdmkC2LA0iOl30dvz
X-Google-Smtp-Source: AGHT+IH3vm9MpG2MZs9UPMSWDERbKRH/7rBr8oV4iU4Hz/r/vqw8nSgxVg2rOHV0XUqnb0ez/kKhKg==
X-Received: by 2002:a05:6a20:c90a:b0:1f5:5b77:3818 with SMTP id adf61e73a8af0-20e97abe098mr4252718637.27.1746336587445;
        Sat, 03 May 2025 22:29:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:47 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 31/40] target/arm/ptw: replace target_ulong with int64_t
Date: Sat,  3 May 2025 22:29:05 -0700
Message-ID: <20250504052914.3525365-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 682yex9Hyvgd

sextract64 returns a signed value.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d0a53d0987f..424d1b54275 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
-    target_ulong page_size;
+    uint64_t page_size;
     uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
@@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        target_ulong top_bits = sextract64(address, inputsize,
+        uint64_t top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-- 
2.47.2
