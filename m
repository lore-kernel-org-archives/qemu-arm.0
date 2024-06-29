Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp464013njm;
        Sat, 29 Jun 2024 01:56:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZFgJvRDExYRPiJT0UIjvTW8eagI4Y2iRxcSyf9WpFnn5LU2tXmZz+a2HTKa+KWtwmaMSGaMzzEOvlPa0aSteMp9V2bKQp
X-Received: by 2002:a05:6830:16d4:b0:700:d37f:3517 with SMTP id 46e09a7af769-702075cb18bmr636557a34.8.1719651417555;
        Sat, 29 Jun 2024 01:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651417; cv=none;
        d=google.com; s=arc-20160816;
        b=0zWOjIFHBTfKnTCBNC5ewn3roZWLRhODQRm4EZBaT2ACEIlIcUFD2opjZc1198C+I2
         ALBbnkH1BeRym27EmFgA5awubrI0SJWNqQsV+MH9zuuK+U+Wck8W/K6BVgNr2y8iwARB
         zGBSZk1ss3GNtq20ejLyczlKDhyTm/rLxx0nN9bRHoSVQXQG8j5yg/DP+3FiL92sLjBN
         TFE28HWej+fW0+4+7r2iyMv3wzm49AbHA3EMeBuOd87gWMGRxXGnkBpUhBimw0Co3cZN
         xbtitD4v/sx/AcwPYOoiwz8InuHbjgrdRy1DCericp7IGow1/JPfCaTV5HOmqiN50Slk
         QXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=97jsLhmY2R6dVuT9X3mKtbkZTIY+9tQnPelHksLdIPM=;
        fh=KOC8+8pfcGUxXvyVi+mT38qKppvH0jdZ4K4kx3JWz+Q=;
        b=UR0Qk8Ed/TqdhF3cMKdGp4ux1+KCIMu5XeNfg2rnjwL0UM7z3/UNikPTzjQid68MDJ
         WBHBv2FXgaJLPZ5mgZtIC9SlHTrN5yhmQQ6i3yyAEuGPG6fLsg21Gjo8SjgZIkmt9Elc
         bPgxkMy41UtOCOmf9RsiBTvJwd2SeKXD8eyGv+/eCeWNHQu+NM/9PxFdU1ddw+tAhLOT
         Jnk0J5ANYPE/8a2tfzbcoh2XpmOye4kAz++NoegqtOZItMvIcmTjszJYlBK+M/yfTHkX
         afh7WHJhZ8GLEvMn5uAj1fJ6MmQ7c/UaFglA+naFLZN4GaIKTKz1FbSL/43BGW8goE8r
         mCSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=0Sb6sW6b;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-701efcbf096sor2153783a34.21.2024.06.29.01.56.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:57 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=0Sb6sW6b;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651417; x=1720256217; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97jsLhmY2R6dVuT9X3mKtbkZTIY+9tQnPelHksLdIPM=;
        b=0Sb6sW6bzDZSK4AsfxkI20958QIAKIlGVJpWM9BEK+MdiWCz0/Y0T/+HwZTH98lK8H
         EWWH2lW2NFIyUsJa2HHRPnyM4v6TL8PDiE7RqDvYHgdVXV1e+JJS8EaAGBrfVY3mmW2v
         Y+1/FfZaC2nMf/Epy7Qkys9/O4Ihe7EAdhArVhyT5CVLoqfyfzI2zktDVptfbhe5TNc5
         X6crFhB3IKVFQjynbK7ynVheMxCx6vyi/0KCMlg/W26A/rfLNDoTtM54J6hegW6udvW8
         37jaab6FthnaMYtdH/gOtEN4du9vBhOaqsEwbnCn06nJe25ty3wGn2uZkX01EQwlfrxO
         dTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651417; x=1720256217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97jsLhmY2R6dVuT9X3mKtbkZTIY+9tQnPelHksLdIPM=;
        b=IeDWu1bNJvyHE2Jj7oQBf6NZoeI4eE5S6dCyNbddnDRKgGDTYiO/HsVl9/gbTqjuWQ
         XXh7DUp6zgGKuHYpOXc3CKWu0YgwMYO10Itqb11r8okHUgP59geFzCEm6UQyF5Ht5tKV
         EsxIvdB8Dd2grCnMptMQnHZaKAfyQVCGxGubDICItMblvYTwMx3qt+NLbCDRtwjkV9sj
         lS2aV2l9uAoF37nfqlQOnfYhuNC8HCHG8JNDBpaZZJRK21393qxx81CbJXgHgfX1QWYM
         8jCIqotd+2UbP+RK6szxDdv6h6+0NBXrDuxzs1yseO2mVPU0Gw9LnXRO7J800yvo+Prg
         rbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuXj1ocF7SMVPEzQbxAmmby/fG9Vxba/mTsog62YjHBATGO3tFI9EIn85NX/OC6KD7QyTy3uopGQ8wU7Oe2tBjl+tS/Fai
X-Gm-Message-State: AOJu0Yzo0BE+NQKfqW3Hd0l9j7Gh2MEvjomwuoGllC7pFLjfl0edT2pp
	nEcQgmqqZqIM+P5Mytfa5FeO75+ubdbDj9fhcQYNQFif9mxpmqS5VRSGu2RC3hI=
X-Google-Smtp-Source: AGHT+IFUK5Ft5geL5LSQlYzYQXX94NSA6wv+C23mYJ4J9rBGh2QyE8cwS4D5yI/1RyWhIHqRBZRaPQ==
X-Received: by 2002:a05:6358:50c7:b0:1a4:558c:e135 with SMTP id e5c5f4694b2df-1a6acf43ec9mr41934655d.30.1719651417166;
        Sat, 29 Jun 2024 01:56:57 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c91ce17cc1sm2916847a91.5.2024.06.29.01.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 17:56:33 +0900
Subject: [PATCH v3 7/7] tests/tcg/arm: Manually bit-cast half-precision
 numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-tcg-v3-7-fa57918bdf09@daynix.com>
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
In-Reply-To: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: BcwrsLNULjYZ

clang version 18.1.6 does not allow specifying an integer as the value
of a single-precision register. Manually bit-cast into float with vmov
first.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/arm/fcvt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index f631197287a1..5263f607b59c 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -355,7 +355,9 @@ static void convert_half_to_single(void)
 
         print_half_number(i, input);
 #if defined(__arm__)
-        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" ((uint32_t)input));
+        float tmp;
+        asm("vmov %0, %1" : "=w" (tmp) : "r" (input));
+        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" (tmp));
 #else
         asm("fcvt %s0, %h1" : "=w" (output) : "w" (input));
 #endif

-- 
2.45.2
