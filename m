Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp864829lfb;
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOAeBUvGKs/8sHBCE7AwoJi1A11WtHw90YLlj3Z4Sv6ZlU1QweEBbESBpiFbB9xE6bZXwH
X-Received: by 2002:aa7:8641:0:b029:198:44d5:14f2 with SMTP id a1-20020aa786410000b029019844d514f2mr4205665pfo.29.1606340195370;
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606340195; cv=none;
        d=google.com; s=arc-20160816;
        b=i8riwTkramDFzg1MsX3amN/F9c4Ocx1sVWzrtRy0kCMm2aL3rxUfF7p7/xI9TQx1o4
         5cQW1E+HFr9zY4s6nx17hHxFomfBxYDJRbMmyHki24mq+Rb+fGC11cJ0u/b0FLWHad+t
         KtNaS4gTBNyAmf9KmMwMoiG1Xo4dL17AGH0/3Kaam7e+o8eWKtZQYHEJWK+kX65bOdC8
         1c1ZnkoRKzZHWSZy4DYq+9SXqzzpIjwhwP8Wu2O9ludbvULcjIB4eynH+9LUBmt+D9yX
         4EifQv8E22nKq9/BS7N8Q1NnIsEkSXl6Eg9Amf7aumf27eK3tCVfTGsL079GdmDdiqRu
         pYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=3uziBAMog/sEGFYGWVS2QkLO0tPqFi3gn6secFja0bs=;
        b=oDLNlfmeDe0rm3JpzNOznkYk6XBbsMz1vG+NUwNBveUJ9g5asRXQomdiZpqt+twOZZ
         hefP5NXA7PXzV+VqmgToQVlxPHvTBQ6ifr1BNJf3jjmENQe0XvOGjzn0ne8bH9wvarAU
         DrLPDYv/DZaI9qVwgsa1CJq5PrWs4dR22wjegnW83Mn5bTh+FI9Qhs+AVKk4qRgB6xNJ
         yVVGE3a8LxZfwuaXtqRc9vzXDdA5lInPj+cQBBzdM7vfyLVCXjMj4c19FY8css/YhRPx
         /4yG7935K9sKt2NKcEhrdOW6QfNMQzmm4soFryCAT8pxruwAaddf4wWEAtafgco8VPMG
         qvnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=YO6+aZlR;
       dkim=pass header.i=@keithp.com header.s=mail header.b=GXFg3FeP;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id u15si3259537pgo.305.2020.11.25.13.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=YO6+aZlR;
       dkim=pass header.i=@keithp.com header.s=mail header.b=GXFg3FeP;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 179693F2E28C;
	Wed, 25 Nov 2020 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340194; bh=X4hIM5LaBzi6bmbdhBPAXlHvcdNLVM4OJv26kvDk8og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YO6+aZlRWsLi69HaWWeCe205Mqpf0zpt6SkYMFTzcJo18ObzuvESQ0N7EO64PAIKf
	 eH4TC+FN/icNxTu9zM2pH1/9CmGzQhGVmrV7gPjaFy67Sv8yzuOHNUDliExlbcf/zr
	 LogfOAwQdwH1AZjSlS9ho/07KBlrwqXGbz+6fUxD7zjoqlng37xEcFkcXAr91yfJH3
	 gATVtIBsjP0nANTTTGDRQjhQsOax97CixK/vkwTiCIckzm6oMvYfz+mgI08uLuN2fO
	 VG6tO2y6P1gVWR5Bwo4ueH91ohmXfIu0u/pgd7lY7ctngtnq+w+pXtwQR8MlqagR9O
	 YN7gH7T1abybA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1eugfL796m84; Wed, 25 Nov 2020 13:36:33 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id D7D113F2E28E;
	Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340191; bh=X4hIM5LaBzi6bmbdhBPAXlHvcdNLVM4OJv26kvDk8og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GXFg3FePa/UjrsJNhHi2cYnldYMPTkueZ0f3FnFWinzynk4LJURqsTVyt8okKKy7e
	 fde9Wus8OFw3y5bq8vF+ND6tSRkqGqJ8ejrbWvBOzb7fNqBQLXaaqm34mBjeOY55VZ
	 eEjB9q4eYCRnpgnWarC6/dwnNuBFGT4uhNDzjyD8L+x77fljcGANDqGl9DCa8mGHMo
	 IoWJpjnqdMp3WmEydX0w2a8YlgFaimAxGX0NhNzInkig5FePgicvYImW+X6gIu8orb
	 CagLmOqTcqafg6Y/CPNT6AH9YY0RA7L2PJSm4Ad3m0qVJeOFgjYnPBobg86KRBu2PZ
	 YVAImv5yAJbUA==
Received: by keithp.com (Postfix, from userid 1000)
	id B199F15821C7; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 7/8] semihosting: Implement SYS_TMPNAM
Date: Wed, 25 Nov 2020 13:36:16 -0800
Message-Id: <20201125213617.2496935-8-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eSh06efXTeAP

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index c84b0d906b..9a04d98e4e 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -830,6 +830,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     CPUArchState *env = cs->env_ptr;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
+    target_ulong ul_ret;
     char * s;
     int nr;
     uint32_t ret;
@@ -993,8 +994,24 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
-        return -1;
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        if (asprintf(&s, "/tmp/qemu-%x%02x", getpid(),
+                     (int) (arg1 & 0xff)) < 0) {
+            return -1;
+        }
+        ul_ret = (target_ulong) -1;
+
+        /* Make sure there's enough space in the buffer */
+        if (strlen(s) < arg2) {
+            char *output = lock_user(VERIFY_WRITE, arg0, arg2, 0);
+            strcpy(output, s);
+            unlock_user(output, arg0, arg2);
+            ul_ret = 0;
+        }
+        free(s);
+        return ul_ret;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.29.2
