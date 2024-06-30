Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004297njm;
        Sun, 30 Jun 2024 12:00:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoEe8qDKccpIXdj34A9xaJCHLoa3qEvKiCB08FbLK096wIax98aUEEpIA70uAg7UGuk0qaejkjGdE47P9UwZJBImRn6bxI
X-Received: by 2002:a9d:6d90:0:b0:700:ce71:3d51 with SMTP id 46e09a7af769-7020764add1mr5242727a34.20.1719774059317;
        Sun, 30 Jun 2024 12:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774059; cv=none;
        d=google.com; s=arc-20160816;
        b=dZqkRkJg24YULFhklz+uZinS+/7wVrhd2ttctraxtXxSGhj+ZfrBH6OHXIgQ/mwC5j
         NkmRWci5q2fvPRTeDAe6U9kSHirh/kNdgM97UdKN7RqIdJHVMJ59RsusPXAT8VNbhenK
         o2j4Q4PYmEluqb4zsyB8g887VISxu/csBnOayekO1Jhz2qyWpf1FlxlvdN8cR4FW7gD8
         XHGGsXr+i4CPUyYyhXiGnPPBjkO9O2tG8IjtyOHWexgjXv7Yp+99Z/hwguAR107Wf0Sw
         rsejomxY6aVEuUNbPrffvpi/XYRCLM5wA9tNOPDQCZji4kIQ4J+2zFusMQfipwxNrIxH
         ciFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ReYEdzUuGbLvXjnnQQZUg5KF5S6M41MyN/EfMs2ZLfY=;
        fh=7nlxC3RLwznWXi/O7d02FnD+YqTwmQ9GZn2vsiFjjpM=;
        b=VTuZ2wNkE8Nq9/y3jXtyHnCkT5QYq3mPVMd6J2WFpgYVdNgUyJGRfpex4AJDtxA0PP
         A66S0CEsNwpFgdZHEDP6ofCXS6AkinAWma/SqoZ/2/sinYjltmUT9o0WDZ3EDxJ/duz/
         fv+D81Kz4Hm4O0wyxN411+CuQGgR0e2z77J4oONOVQi75hOtzfUFzu5R54G3qImlyG7/
         LtqsW0BQLj2PH2599zW/h9M6GrvHxYhAwQOQJH6XgzXMF30/vX7mTl7kgBh4n1XddQ7v
         t3fl83EW+V70JZUmu2dwQr7ijGFvx7CQmryGV3dk//OLLs140Ri84HWrjGobZT012cEq
         zCNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fqlh8DZH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-70200718238sor1765975a34.19.2024.06.30.12.00.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fqlh8DZH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774059; x=1720378859; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReYEdzUuGbLvXjnnQQZUg5KF5S6M41MyN/EfMs2ZLfY=;
        b=fqlh8DZHUlbNY0LEAu6wIsTiOBB6pgIxvWwQpvgpWfWGk9l7+SE9kYpVmIxw0VrCUC
         xIDUVWz5qQHdn6dcSmbljIXj7ZLcKq+6IEHOmRUFwPLR3QJoxS6NKA0BgHHS03w3D5IP
         oD7bCsK87sBwjUMnPAyjE+IeV2wC9p3GbuJT32nUcAq3u1uvGOBaNELS35HgRnXeVcuq
         QvN8Bb/1H0pJFexdedMJC6jLJNOoQks5pOwkCzO03GRoW6hQ/Bq8Yk/Z/wLtPNIuWS40
         WDOvxRV7zBOtRtZZHTzRYVfKtvgkxpG6LBVaTU06jGVsRtmRr/kVa1/kxK9M2ud6Gakh
         /P9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774059; x=1720378859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReYEdzUuGbLvXjnnQQZUg5KF5S6M41MyN/EfMs2ZLfY=;
        b=cFqc34lZY4glMPK0gUmF5b2XcnNIUWfux+YbO1y3TzJYLEKUxteKyTGsXOCaesxPJi
         0HMdpEWA99I7fwcfAUKB5RpTRt7AemNrGWV1IyEsZyvkf3XfYq7CsqP/H9xhI416vXz4
         kvykhA/RVOxbMNp5TXVATC0vjZYRy0QwiWeFHqB7mlpDu/C0h2o+h0+mkxfecImiyDiz
         SQIG2UXDBERkAJk8XCT0flcNZWGHdDf6r5aORp80+s1GuThwtZe9Bsgx7FciKMcmY4iP
         BeYez7AnRLId/RNV+dWU8HBpGiZQ/I5RNBoDDFuYX6EXQO+sICaG4QWuMT6vNDMPrPJ/
         LZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCX9ma6q2z5ZQsGUGh550FMGN10rlA8zHcbH75zx9piEpeuF8mYr19fCasXPlB1QGqkbVp1KeJoOIjKn0jlYE3AtPGSO1IAR
X-Gm-Message-State: AOJu0YwRuqkg/NDGmSHFF6q0h2/CELUgwqoVKIKjS4/qjspd86QJMaOO
	nQRmHFiUJ9Gu0RLD7Fr9SCf4432FXv0HtuWmKTzTh/CH2cFwm8FLTrQxUN+DaxF0Nw==
X-Google-Smtp-Source: AGHT+IEaFqbdBqYAeeaC/8pCwmgYa3JqNFMA4/gJps8LTFbP6Jci/K2QyrqwuZ4l2EZFl4jjJxweuQ==
X-Received: by 2002:a05:6358:b10e:b0:1a5:a3b3:ada7 with SMTP id e5c5f4694b2df-1a6ace912demr431806855d.25.1719774058266;
        Sun, 30 Jun 2024 12:00:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 06/14] tests/tcg/aarch64: Do not use x constraint
Date: Sun, 30 Jun 2024 12:00:42 -0700
Message-Id: <20240630190050.160642-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WOL0f/U8KtzF

From: Akihiko Odaki <akihiko.odaki@daynix.com>

clang version 18.1.6 does not support x constraint for AArch64.
Use w instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240627-tcg-v2-5-1690a813348e@daynix.com>
---
 tests/tcg/arm/fcvt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 7ac47b564e..f631197287 100644
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
2.34.1
