Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp248513njb;
        Thu, 27 Jun 2024 06:58:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQDNEiGMRBdlMzVzg/YIpu0zj+vsMR24kTL4fJ/l0CcCYvn3KmAZdfIFl2YON9xmCw8kwFLRfq5XwYu+8ZgtSJtI7ty+S3
X-Received: by 2002:a17:90b:46d4:b0:2c7:3e4c:e782 with SMTP id 98e67ed59e1d1-2c8503bf4e3mr13214070a91.0.1719496714086;
        Thu, 27 Jun 2024 06:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719496714; cv=none;
        d=google.com; s=arc-20160816;
        b=M/crAJw4biQee/96P04bFJZnrPHLargnB/eT2w6V2+NsaI2ViFFo0LrZsNB0RxuQHV
         K4OC+HnTQqMPeFnUs1lnjssz78q8DGLtvaMqCcrpvA+XccO8gsE49IYFJVJQkjfm9ki2
         UI/0ysi80VCLimWUt/zIYwKTClgGuIkVtVvK5e+TAnqc7LuTPMkRJ0jyV2WHTnZmJI6Q
         kSgdhujrbPGP0MT3cn7ZZ2KwfHMZzM+PHMEc9nDNrxgi0apgsf3fE9ByONyZJ5tzn+Ie
         sCBAzU2CZuMjhj7KhEhfe1LFNnYDOA0JCGsiwNbuXfA+DMu04EIsKxmYZjinlNDSixfq
         /Nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=BSj5UfHR8CwIYmczT5ogPQso3k+OuOQGUbx+sqgpj6I=;
        fh=6mwEeiXp1Tz8zfywtULVvIJ6MGafxGu8Gn7lr7p6200=;
        b=FvNBUzPjnk5h/6Bn4KnHzJ0knWkTMYZfDUaEL4RBZawZ7hMd9eUGj5OzQ5+aebP3x1
         WwWX2j6aFCi731YkqNH4QXzp606oeir1+fiQZvUhUJjjs5WFlkjApyTrkWputhJ4ROsa
         MyKwJ+AlDEiSIHIL4pyYQNdXSdn5DaSwqfdZqbzhqOvtWLrguewtTYuNuy6hMmPsEmo8
         F1AXEsq/xQPrmkWU/TZtUv55NcOKLxygiHqT6sR8SoC0zGHyCJc6fbhqO5GmV9VcVPoA
         rTXUiGQwMbmFO+NEAAJxUlO+M4MectPQD07G91+wBuOaQoA71tlWZiR49RnkRG7Gpc5r
         TN3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Qa2OAPRV;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2c8ffb5ccb6sor523724a91.8.2024.06.27.06.58.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 06:58:34 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Qa2OAPRV;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719496713; x=1720101513; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSj5UfHR8CwIYmczT5ogPQso3k+OuOQGUbx+sqgpj6I=;
        b=Qa2OAPRVHRbjVxvgM6/4TlnT4C56srVWkBdtYYlihpnesea5hCu7S3L6YEetL/bmc9
         OHtWdr/XIf7PR3QT9kZJgplo5N+eoY29SGc+CjrhFkslyMRj85ghjqviMTIikGBjzBHF
         7ILPgifrV4rd1oGP3O8U7o+hVv3bv8mTjYeBN13FzL11osMiVmA3iTa1Oiiy2Qg88MqT
         FUX+fOw7Ev2rI9zxKdM/mjfaZ/dRah/cxU55VbKKEWH1BW2JeDTzmXHcM33tgUps9gqj
         uhNchuMhv2LaJ3vaI8Iz1R8CwYZW1fZ2Q9PvA5h8/EKV5tjbZPXBg9ABxFm0yVz3DP9r
         EfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719496713; x=1720101513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSj5UfHR8CwIYmczT5ogPQso3k+OuOQGUbx+sqgpj6I=;
        b=T9LZ20DocCsyalccRyHhaE//60Rbe8Uf0mbHNc1kptukoJOV8mtT4tPTzCIzgyRySz
         x+W+vz9I//kJlu+uFKDZg+sehJE+83/XKBfEFaeKFpihniAOe4k60/oTrJ2ZmkFZS6lf
         PK96U/5Bzo9ZZtc1UPaL8GYQx54/hXVNM1PyjeIf8FSszu4QYOEAFDoEreUImMWEU2RO
         bJIzvZzZ3LfB6hYLT/Fqj0UCJQ6f6nVmhRUAJva15bKA03guL15lW2rmJaVHT+rlI5c2
         bYIdfRem651+1HyB7s6rIoXqYFlk2ncc65cBKrD+VOMBMTNrVrO5UMY4BAbC1RN3YrJS
         GiIg==
X-Forwarded-Encrypted: i=1; AJvYcCXLQPq/LpBYKhuyhNDo4kKDwYIKGNUvxnWg4XFS6Og6F3hCBqKKjrfLvV/2+t41omHnK9mdZg+sVrZP810C5aEqlbGv0VaL
X-Gm-Message-State: AOJu0YxxTtIwZRescKLMnY9LUJ1AYxuU9AMJ3D+9qCSyPYYWJYka2vcK
	ZKCjSghBBzQwyCtx79dbLDGTcgoOBT8Vmu13+jTIOk5cqPBL5rZasrKnT5bPBQV7POfLMf5cS2k
	BbNQ=
X-Google-Smtp-Source: AGHT+IEf4dsZHvExAcW6pneOlMn11MrDMqgHOtHTcuA5J99ZmovY/grAUEHy5xK7aX7my2rfIvTWpg==
X-Received: by 2002:a17:90a:ba83:b0:2c7:c6a1:42d9 with SMTP id 98e67ed59e1d1-2c85067fd85mr10909047a91.49.1719496713609;
        Thu, 27 Jun 2024 06:58:33 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c8d81d29desm3636081a91.53.2024.06.27.06.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:58:33 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 27 Jun 2024 22:58:07 +0900
Subject: [PATCH v2 6/6] tests/tcg/arm: Manually bit-cast half-precision
 numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-tcg-v2-6-1690a813348e@daynix.com>
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
In-Reply-To: <20240627-tcg-v2-0-1690a813348e@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: IDWuindKl6t1

clang version 18.1.6 does not allow specifying an integer as the value
of a single-precision register. Manually bit-cast into float with vmov
first.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/arm/fcvt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 157790e67961..14c9bb669c91 100644
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
