Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463993njm;
        Sat, 29 Jun 2024 01:56:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRT6VrwyWyFr+auiS4h2KCyT8IJhuXiVyJ9XIn26xNQUoMFbtany5gF5jM97iwQOq6kMKoxF8DRSzSY9e6qBg12i3PJMfI
X-Received: by 2002:a05:6870:20b:b0:251:2685:c9f5 with SMTP id 586e51a60fabf-25db3407590mr407993fac.21.1719651413794;
        Sat, 29 Jun 2024 01:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651413; cv=none;
        d=google.com; s=arc-20160816;
        b=dY1IOMj3YZTexFOESH684azAgGofdl39pkWDlB00V1pxiXAl9k3RNuo7YuV7Ee2pLY
         IINXZYVE0C5ahtZ0NXbRXjV7EfjEZjiJuMlsKeLxPld1QT/I6liMrDD3HVZ/7ViU7ISD
         rqPE45gRjyUoMJ1rBQZxi70JJM+vM6njX65eZAfQMbK4AunSoH7MxGHSRh6PZ58Sh9hl
         EnsRB82mGVoPgLgbKW9t7dqqwoBAgQoM0QexnVqYGD/WrjkjY2z6Fk/ZVWsTr6ddNwed
         iEcmFDK36goHZyizzsWVPDdZkKCtHrB8RGDZ32IYotpoiS8+D6naqGV2BHrUl+SXu6l9
         mEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=z8HgGEOBQa+ts6D6zeqb5tjF5rvOazu3EqyYr1aPQyY=;
        fh=GnkptNrfolxTGbODp9XTJwzD2XZR2KpVOWi2KucisP8=;
        b=SDnfNxpSMmV3SXzHFvYsPiyUIRW3kt8VlpeT/wmuNCp3moWU8G5wb3tUP8IcMnX5Xk
         3hpFwOVFm16h07tqgTrL+OCp016C729r9xPxPP8qEVYkEJKKjLmGV7Oj656owDQdGkg5
         OYM4IXB+5roz8J6wPEV62GV1hnyQR8YBqCC3iX1VxoyPwDfFpw9ApiYv7xGPJMmf628x
         XjIH2gkAW6blNCEkINrgabhSujP07dxofWSV2zhQJMEYqnZ82jqdTiBLJJe2QiFp2bKM
         KZzuG8Qt4vtpBMgTWYzuXXdHyDdFoAu/H6rKTAWiRGkY2zBJuDYoN8NXwd8kFGdkBq+k
         gBKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=goZgYBTL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-25d8deb25f3sor1646302fac.0.2024.06.29.01.56.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:53 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=goZgYBTL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651413; x=1720256213; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8HgGEOBQa+ts6D6zeqb5tjF5rvOazu3EqyYr1aPQyY=;
        b=goZgYBTLWDDfiBUPadv20PdWm4024ESFQNWWGnm0EEBJ8ugtdNXiuVj3qCRDdCYtO6
         uaQI1vgf2iRg/kHgs8DgjV+QsQ8YZUF092UPsurg2NNMgJKo5XP59SytWUQykbIB1e/I
         khW/5u4p+a+sqcx9f8YKtFNje/4J/4u9td0vr7m8OuznNX+qFzutrBgTfp8G1Zt2uR7Q
         LDTd6s+ufzK3dTGgyW5pwfSd+HJvJj11DbcRsX2dRQYFY7+b5vgCh6KE/ct9Zix2Qmyo
         8dxd7l/CStZNxWmtd2Gut8S+SZxXqmjLmN0Ht5IIznKxkOGvMltEkDTyqfdhwoLic4A2
         aimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651413; x=1720256213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8HgGEOBQa+ts6D6zeqb5tjF5rvOazu3EqyYr1aPQyY=;
        b=XRB+D8ZV7gOPa+cHCzsQxkIalue8Y5tzjUW+rcb8PVvAVJTRxEQ9cx5oQbHzeN+NN+
         qN9ob9oLa7Yioc7iPWK2004l3ooR34By1n5cc9x11w4Wx6QNY0pmsJjAw1yD7KtSxYQ6
         SU499gku1DMzAgE89Y/MjDrnzU0/iOc4b9Vy9ZxOIyeKCAl1imeNhyN37JDd9xCBsWRF
         dsrnJVQSbMETimXH73kp4Pr1+5Ug2NOm9uEr6nhrwUuW2G8DCnKOgFtHuM1j9l4eJWGj
         +3lXK3ybNJA7G9UImGgrRIcHehSW49HpY4N3yb3MuxX87SYlHhm7fF0l+Jk6GIIdENvs
         Pdvg==
X-Forwarded-Encrypted: i=1; AJvYcCXNKugZKEXRHUqyjBSktDm5qSselNyHLCsHy1P2p5sLU7G9ZW2P4wkWQDlc8zySD56HDZ5L8B2L3yH/pA4LA4y3WLBt4R8h
X-Gm-Message-State: AOJu0YztOG1Un4VrRsaet8JvvWV0s6ySS3iiLWTdEo01GJAD9TD9fcyX
	6LFfbJhNZVcpoLn159ogzBHQloSdKAjwIHTsc6R7Hv1oweJAPqs16hzYvKsCf0U=
X-Google-Smtp-Source: AGHT+IG8ZwO6MrrDO7Z72RbL3yoQXd7KyuMYXHm1G0w3fOjKBz5jjYNFdokqBupgz4xk2mjkg/x+YQ==
X-Received: by 2002:a05:6870:1654:b0:25c:b7f4:39ad with SMTP id 586e51a60fabf-25db362fdc4mr361788fac.58.1719651413378;
        Sat, 29 Jun 2024 01:56:53 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70802567926sm2864444b3a.54.2024.06.29.01.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:53 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 17:56:32 +0900
Subject: [PATCH v3 6/7] tests/tcg/aarch64: Do not use x constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-tcg-v3-6-fa57918bdf09@daynix.com>
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
In-Reply-To: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: ta4WGpwGHq/c

clang version 18.1.6 does not support x constraint for AArch64.
Use w instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/arm/fcvt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 7ac47b564e24..f631197287a1 100644
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
