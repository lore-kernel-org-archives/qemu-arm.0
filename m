Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp248492njb;
        Thu, 27 Jun 2024 06:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVOBDG65Erb3uNPS+US4vqSU9RlCeRJwwxer0jWRbt80Z3YDZcf5qp2i/8/p9PjTFAR++ty3hbCt7iLDJJjjEnnWy9zwDG
X-Received: by 2002:a17:903:2302:b0:1f9:f83c:8b6f with SMTP id d9443c01a7336-1fa23f15ba8mr141537805ad.51.1719496710864;
        Thu, 27 Jun 2024 06:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719496710; cv=none;
        d=google.com; s=arc-20160816;
        b=QCrES6znDa6j+F3r8KaO5MtQ4NorRzcy3A4m3hzSbMPxJlGxhtLXnqVv8JHgWAnJNf
         69gd5DM5wcYD5JRRkr32Uharm8H8pbAKTqVgsRn97mi0laB+8ETJg/ScchNqV6YWBAQ2
         s+MwnIeZK3Z663do5ffTtrU+mnZ8RXGUSL3R3hZUUBCvC3Js+JWYSa3hE2p5GLvCcFsx
         R2S76rMZTb9X4SgumNfZ8fobvKBRmElA1gKAvHTgUpygfT8DN6JfeXTwqeLsz1h3C7oN
         9N4C1c+E81Ty+faOPMxVEObm6ao55CP2jOHbuXpPUdN+AqowpxjsdjzrvX8GrmN/9NPQ
         Fplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=xfjEm1QZECbrFVCphMYb79ZHnIFQxwHobg0g4KA/LWs=;
        fh=LWHneGzz5vIP9U5dX1s7/4zNPE0CPXETKs5hVMmgeFc=;
        b=qweTtUwF70hW7WaniFMDXcpeRu850Bxki+9sXm6wLFl/g1+6fucqNGU4QkH29DUEk1
         aa+9kXpw1+fCJbPYNvg4+LXABo64cj+nxPnzqY8348MqMkgXEbS6bdAxUfvMWEJPi1yM
         tRpmcn9ofYOYTgShET6s/A9BsBHm2Vl9XMDnnyKt2Oko611EhMEIuLMfuY0FObMwHzhB
         zZ7GlzN6Z+iJfc0Hh97EVjZcVx+ZFU16Go1HqPLMyrynH4guOSHSWrJY2B4qp45TdJgb
         n9LbCjJ8iXCCyEdFBfpw47YxQ3tACFmEgT4TbFE+nDKE9zP/RmO1egqcbaQ3i9PDndz7
         wJMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=FRDZAugr;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1faac90406esor6556015ad.12.2024.06.27.06.58.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 06:58:30 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=FRDZAugr;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719496710; x=1720101510; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfjEm1QZECbrFVCphMYb79ZHnIFQxwHobg0g4KA/LWs=;
        b=FRDZAugrvYJcbqw1HlBQwcbvbJQwyymBAAGaGT/B2xfhYp0k12VeyDeh9he95RHMaP
         XR0jeiHDfoLxjCQzULrgdh0UebhTW8OcvSZ/TAv5f1b688c/4G57RrGxIh34StM1w4Vd
         5ys0hqcZYueyKjnvo07Nbu5VsjZTEb/SvOnEU7jCjK3Ga6f3EFwZ1jzj45YybHfTmoGJ
         b02Ojo7tLrq2gWXSDXvMl1iSUkS7BLeL72LVlxicRvWeg9ifycY9s76bl4IuygaSzxBv
         KrS3FLq1ZryxXVPUJqYOVuuJGm7yuwbQVwofltie1VYVZZNeGewMgoiPGGe2yl3yWpqg
         plgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719496710; x=1720101510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfjEm1QZECbrFVCphMYb79ZHnIFQxwHobg0g4KA/LWs=;
        b=DzUSU9SGONS67pTOo9Ur7LZr7I1onWCSs+iQJqDNkULf/kPtNPH7ijD5sorL+YP1Ji
         PWNsPpxWgyhWYP+6clUufIBFmzENmQGG8qEeNtodsQMGdoYeyk+6t+T2tqLoMXRhWp6d
         umF22t268oqfWD9JCLy63oHcSLGOjbY4TuIaIhAYEdMcsV/0cAvgmTA8M8sWr4NzLh97
         t9uyrFepnFj1fZ08GQ4Y6FKt7PzjKrzwD8IHcYzHv8YRFGnlY56oV7afu9X9NxL1ohcT
         BVQUjP9YKY+1yIe7bW+xswVL6QvImyxV6zJpKzaDsUhBFVWyR7kKW3DkGW/GfaTJ/z83
         tU9g==
X-Forwarded-Encrypted: i=1; AJvYcCWf+Odj08B8H2nqeUQ/zIw6azeYeO0p/oXDXdM8jweOzJK8dOtfiuKGOdFCHp2bBI2rkzHRQ94b9eZDK751MrQr53mQVJQ0
X-Gm-Message-State: AOJu0Yy07faK61iyQwdu8aX3dHv3m0aT3p/ZKb6qQmdDZDHiQfX/E0Rn
	5RBemELVQ389niWJ3BaSuLezL0u50IhSfLFafYOBfHqY+t/rA1Gh5NLgFNsuh0U=
X-Google-Smtp-Source: AGHT+IFqsrJNhhU+ItZ1RtuSfKHh3Oqhi7BuzNUGYuUMcdRiFhYGaJCECMYQ9rOAyZURrOQKDlKCiw==
X-Received: by 2002:a17:903:2342:b0:1fa:7e0:d69a with SMTP id d9443c01a7336-1fa23f15bf5mr149519925ad.46.1719496710476;
        Thu, 27 Jun 2024 06:58:30 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1faac8f5a71sm13506705ad.109.2024.06.27.06.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:58:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 27 Jun 2024 22:58:06 +0900
Subject: [PATCH v2 5/6] tests/tcg/aarch64: Do not use x constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-tcg-v2-5-1690a813348e@daynix.com>
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
In-Reply-To: <20240627-tcg-v2-0-1690a813348e@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: //f7/igv8VGj

clang version 18.1.6 does not support x constraint for AArch64.
Use w instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/arm/fcvt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 05a27b2d0710..157790e67961 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -126,7 +126,7 @@ static void convert_single_to_half(void)
         asm("vcvtb.f16.f32 %0, %1" : "=t" (output) : "x" (input));
 #else
         uint16_t output;
-        asm("fcvt %h0, %s1" : "=w" (output) : "x" (input));
+        asm("fcvt %h0, %s1" : "=w" (output) : "w" (input));
 #endif
         print_half_number(i, output);
     }
@@ -149,7 +149,7 @@ static void convert_single_to_double(void)
 #if defined(__arm__)
         asm("vcvt.f64.f32 %P0, %1" : "=w" (output) : "t" (input));
 #else
-        asm("fcvt %d0, %s1" : "=w" (output) : "x" (input));
+        asm("fcvt %d0, %s1" : "=w" (output) : "w" (input));
 #endif
         print_double_number(i, output);
     }
@@ -244,7 +244,7 @@ static void convert_double_to_half(void)
         /* asm("vcvtb.f16.f64 %0, %P1" : "=t" (output) : "x" (input)); */
         output = input;
 #else
-        asm("fcvt %h0, %d1" : "=w" (output) : "x" (input));
+        asm("fcvt %h0, %d1" : "=w" (output) : "w" (input));
 #endif
         print_half_number(i, output);
     }
@@ -267,7 +267,7 @@ static void convert_double_to_single(void)
 #if defined(__arm__)
         asm("vcvt.f32.f64 %0, %P1" : "=w" (output) : "x" (input));
 #else
-        asm("fcvt %s0, %d1" : "=w" (output) : "x" (input));
+        asm("fcvt %s0, %d1" : "=w" (output) : "w" (input));
 #endif
 
         print_single_number(i, output);
@@ -335,7 +335,7 @@ static void convert_half_to_double(void)
         /* asm("vcvtb.f64.f16 %P0, %1" : "=w" (output) : "t" (input)); */
         output = input;
 #else
-        asm("fcvt %d0, %h1" : "=w" (output) : "x" (input));
+        asm("fcvt %d0, %h1" : "=w" (output) : "w" (input));
 #endif
         print_double_number(i, output);
     }
@@ -357,7 +357,7 @@ static void convert_half_to_single(void)
 #if defined(__arm__)
         asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" ((uint32_t)input));
 #else
-        asm("fcvt %s0, %h1" : "=w" (output) : "x" (input));
+        asm("fcvt %s0, %h1" : "=w" (output) : "w" (input));
 #endif
         print_single_number(i, output);
     }
@@ -380,7 +380,7 @@ static void convert_half_to_integer(void)
         /* asm("vcvt.s32.f16 %0, %1" : "=t" (output) : "t" (input)); v8.2*/
         output = input;
 #else
-        asm("fcvt %s0, %h1" : "=w" (output) : "x" (input));
+        asm("fcvt %s0, %h1" : "=w" (output) : "w" (input));
 #endif
         print_int64(i, output);
     }

-- 
2.45.2
