Received: by 10.28.71.27 with SMTP id u27csp5137321wma;
        Tue, 27 Feb 2018 10:40:08 -0800 (PST)
X-Google-Smtp-Source: AG47ELsoMASSvDw5rgkdFMw0kDew5nL/jwY66E0MmmKZdCo++qz7FH4Xww6Q33FiIMcrYnVOHv8F
X-Received: by 10.223.198.199 with SMTP id c7mr5701283wrh.125.1519756808274;
        Tue, 27 Feb 2018 10:40:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519756808; cv=none;
        d=google.com; s=arc-20160816;
        b=dw6spwPMADYseQ9rFacpvQkY2GR9nQjD0HpCUGabMf8ATh096Oquws0ZfTzKdJayG9
         +aHzbeh6o6b535nKOId396wY/OW6C3KknUOpw6z9XKWNeLui8mhz5ep1hWSvGra7dvLS
         53VlgOOxHdU3RdfGNc5BGMAVEGRFGtkpXm5vZ3huqGIG5SJUiB1O/c6NhrPmblBNgmlV
         rDPhOLqhOZrUuNLB8gfPW+wG4uO9LfVziP2YyGFvsG8tNd0iCwFMYt0wn9TeAuBV+3ci
         3P25B+f6c+IHzDNn2YUFlzdclLuDQUoJEm6zeK7CssntOxg7Qt6yRWvx2HUN8t5EUeyG
         qxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=KM6GQpdLJoyo8W+SgjgBlSbS/pg5qiV81KtOLY/46+U=;
        b=pe/wE/BgIzUekiFjHabQV0d99RlZ1O1IywI+pIzgHNECESg1YxR06vf4IZ5ZrpaSGW
         SGpnxEORHugdDDIesegiILKsKvunvzCJMHwwEahTLwc9lZyLfErucRChYcs3bxMPqbfK
         8IOlTSxeRL96E/3tPDyJsvIlpBzJpBUwTYeZOBIe1bpPBoW63ICBFCng9i4IkC8XrusL
         sm/YflPBWl5v6mV/6CwOMZ7LoNyyn2Lm+6THyy2+aL60qSs31y30l2kQG8tJmbu+aFsS
         9kg772q9T9FQ2vwR0JwxAdXhURLkSBP3iQQhsYNdQFooWYJJ3W0BBM2BRfL+xNBVXLgw
         vQKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id g21si46614wmd.91.2018.02.27.10.40.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2018 10:40:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eqkAQ-0007f8-U3; Tue, 27 Feb 2018 18:39:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] linux-user: Report AArch64 FP16 support via hwcap bits
Date: Tue, 27 Feb 2018 18:39:58 +0000
Message-Id: <20180227183958.15167-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-TUID: 79DV0QkM0l/U

Set the appropriate Linux hwcap bits to tell the guest binary if we
have implemented half-precision floating point support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is intended to go after Alex's FP16 stuff since it
uses the ARM_FEATURE_V8_FP16 bit that defines.
There is as yet no kernel definition of an AArch32 hwcap
bit to report FP16.

Based-on: <20180227143852.11175-1-alex.bennee@linaro.org>

 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8bb9a2c3e8..80f1b32fbe 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -551,6 +551,8 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SM3, ARM_HWCAP_A64_SM3);
     GET_FEATURE(ARM_FEATURE_V8_SM4, ARM_HWCAP_A64_SM4);
     GET_FEATURE(ARM_FEATURE_V8_SHA512, ARM_HWCAP_A64_SHA512);
+    GET_FEATURE(ARM_FEATURE_V8_FP16,
+                ARM_HWCAP_A64_FPHP | ARM_HWCAP_A64_ASIMDHP);
 #undef GET_FEATURE
 
     return hwcaps;
-- 
2.16.2
