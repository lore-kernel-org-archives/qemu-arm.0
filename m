Received: by 10.28.4.212 with SMTP id 203csp1053440wme;
        Thu, 10 May 2018 07:01:42 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqKRLXwhU8uzZhZol+4aaX9wUxmJO0dG0GYb+piVuQdTec6E9Kse76JL0TaFit2ce7pTKKK
X-Received: by 2002:a1c:58ce:: with SMTP id m197-v6mr1284408wmb.110.1525960902925;
        Thu, 10 May 2018 07:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525960902; cv=none;
        d=google.com; s=arc-20160816;
        b=tx8B250BxXcwjUGix8QJkR1QTXFfOP6/NlBgWjfOa0iyfCd1kBmA4NA+QOuQ4/KQxl
         BxvohSOH5CCrFpTz7C/NXrqg1UVmwKg0G8QnSsIuKFwO2MkpZtDEI/4Gvb7n6uuz49Td
         BWfwZaeh66fzv9tb5vhZ4nSBBCDaVuJokDCv7Bdoz1WPcw3t157cfmSHxW4722ZiQFmB
         0DKKtgMLaYXEhmWzEurcNyk4b4ns35a4GgBt419vNbps2hUa25HZAZs40NTuXAcbnpHA
         +Ia3SKzTWKsU27uNzRCwTfqYSJRXCEphfMTk2zpsPLqPcZmfAiOdQ97QhdUVV1MTCLKn
         P4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=WTBh2ZEHdmYheTN8DSe6+SivjfO8GXR0Fp/4es2yneA=;
        b=H0yxP5DjRpbGFt+8+ihcpwcVrTcY5BV8RpzEk1WWw+9zc4zpyKmWFqzogS9lE2jO3N
         z/XB/cXe0M9+ytY9Yv8g1ss2jXvJY01uiF2mQAzII7b4HvM2oQq0GucocKEm+F69SbDp
         3USWSYBdfgqR9js494AzeBD4aO95PODa5y2g/CD6iqJlILN+hikggAJpMbvX8Hrg+yif
         T+38r1KbyoTm4cf8zntXkLwjfsrs3EIZHxoCb3FexA6p4YtZeKqcLKDlD8tmzX6s1mAx
         ufnXPS7K/8zJMP5pXjyM1FcrvEDmAgyKRjNiWIRjz1w/9gIjrR7pahpdzotCnkM0O4/S
         6+VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id z126-v6si998964wmd.221.2018.05.10.07.01.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 07:01:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fGm8b-0003Hu-U0; Thu, 10 May 2018 15:01:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] fpu/softfloat: Don't set Invalid for float-to-int(MAXINT)
Date: Thu, 10 May 2018 15:01:41 +0100
Message-Id: <20180510140141.12120-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-TUID: XKX8ggyFytuL

In float-to-integer conversion, if the floating point input
converts exactly to the largest or smallest integer that
fits in to the result type, this is not an overflow.
In this situation we were producing the correct result value,
but were incorrectly setting the Invalid flag.
For example for Arm A64, "FCVTAS w0, d0" on an input of
0x41dfffffffc00000 should produce 0x7fffffff and set no flags.

Fix the boundary case to take the right half of the if()
statements.

This fixes a regression from 2.11 introduced by the softfloat
refactoring.

Cc: qemu-stable@nongnu.org
Fixes: ab52f973a50
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 8401b37bd4..9bcaaebe4f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1368,14 +1368,14 @@ static int64_t round_to_int_and_pack(FloatParts in, int rmode,
             r = UINT64_MAX;
         }
         if (p.sign) {
-            if (r < -(uint64_t) min) {
+            if (r <= -(uint64_t) min) {
                 return -r;
             } else {
                 s->float_exception_flags = orig_flags | float_flag_invalid;
                 return min;
             }
         } else {
-            if (r < max) {
+            if (r <= max) {
                 return r;
             } else {
                 s->float_exception_flags = orig_flags | float_flag_invalid;
-- 
2.17.0
