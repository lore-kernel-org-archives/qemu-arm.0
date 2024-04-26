Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp636579ejb;
        Fri, 26 Apr 2024 12:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsWJNdLAhAqGIY3QQNQCmAmmlh+aLNKWgIo1w4caReCDyikeSG90c82xCG3FGvWBQ0KoKTddlEAe3p4oAKJkndKWfpbtlp
X-Received: by 2002:a2e:92cc:0:b0:2dd:bd92:63c with SMTP id k12-20020a2e92cc000000b002ddbd92063cmr2173025ljh.42.1714160565892;
        Fri, 26 Apr 2024 12:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160565; cv=none;
        d=google.com; s=arc-20160816;
        b=WmOqmRptLXFBDM9FFE1fODeBKPBnVBUS/kYeD9RMmZ5O6PwwR4vR3r6TUfLcq/B56s
         etha1sSh8TnNfAr/K1chhYwVpPcHiw7e5ENlqknO4uZwqdaOrASxuwEBfBvYPls6PLid
         wIsto1q4NC7VXPJ0+MnxRr8IM2T5eVa4sQFqqt+t6+B9tl831SBG8+/hTPn2o47qPki0
         Qhqnj+XhAf60LleHCsZOPVjo0Iw3SpwMaLvtgHBvM1jiHBUyQuHuf//xhsEOxCNXBa30
         +oDda3/FT6oeh3ftYQE6oo26LqSACFcKsquTdb5XtASgBJFzoZlAeJZ97LV/nT3DO+Mn
         mlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t0nMCqhYKzp5r2ZnGbDu0d0x6qlsj2uY/rxTdGpirtw=;
        fh=Ms1Joq9smtta8VY2Wj9LJ9L4thsPyCDTGbuTY5hkSjU=;
        b=Zw6DzODRlyb8kpGquXB5KFpBmyErxZysVz8zxsV3HqBRmS83HmZIWEDrNGT0cpBx4c
         pdoLuLICqmW+VKZBTHtO3boE+R48sykvCX3Pyx2Ct72DmY1ED6hgLTCJzP6A+9oCj+WG
         zRFs05UW0KsT+auXl5OLMAw6z1iRel3gdlfci/6j94c+0Z1pFd6Pj6jdV8W/Srt0dk+8
         ApSspMLLjeZxxJyQlImFazlnweePXUUrXRHkeTSHjYTsWtHJudajcPl4QK9veefUbozW
         Xe+9EaKss2fTF9BDxlPdWaERAKFPKMv+AqFbuH6NPGjj7x5YPdPOUAQGQOBpD22UaFlz
         8amw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FybzDQe6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c68-20020a509fca000000b0056e03f421ebsor4480721edf.10.2024.04.26.12.42.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Apr 2024 12:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FybzDQe6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714160565; x=1714765365; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0nMCqhYKzp5r2ZnGbDu0d0x6qlsj2uY/rxTdGpirtw=;
        b=FybzDQe6EnrTeASvFcLT1Ufgf/8IdiV6HSheRMvAEdwxzbPy9Ijx6++I3jcnuPjp8p
         b4l9U1YOAcreoG9y0LkJwNLr+2lhb1ADzz1FUnPla6fxYy0Yllnvz8t6W/t6xyDHhQkd
         dCFsqf4atwKq7UO8ZhweYtM3OKu+LhaNgHf/eS0JwGf5+rIB3ETpAewjqBNRU7KZwCTr
         Hy4SlZZddEFww5p+CrzhWSioqXEnkbSliMx9RPhikhnWN9HIhUOoeRcX2wPTXWuuVyV8
         zXgBx7DSCddFSxX8MuqF0WC9+fNduTewRj1L1utcrWt65Aibp7+SI/EU24JrgpjR1jxd
         vSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714160565; x=1714765365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0nMCqhYKzp5r2ZnGbDu0d0x6qlsj2uY/rxTdGpirtw=;
        b=AEB6NvltM3c90uG38FyVk9gpWJh6cyFEdMBOdEFQehKkh7zIywwnRwxnqA8yXK9g31
         tAd0qhP68QJgJEdHHmglrzkLGvc62nrTOUiS2YwTpd0Js8SED0Ipwpe5I8vB/RRAVV3V
         peO+vH/0G0GYQtxcJhixeUX69Uik6a3OlvBqKvRKqN7Ckar4csWM5ZcSXjGtMJ4aOdO+
         JpdmY2J5yWEVSThrF8hiwpfmdSrpkr219xyLBcDzH0eLYDhAh456JoqdJf2s4zGD5Gg3
         6UQUec7nL2PRv/Xa1pwqte1fx1pw9I6SjM9yFQwl2LMPlWlW5wnZDkjgrBbSB4wscsDY
         1aIg==
X-Forwarded-Encrypted: i=1; AJvYcCVLRROcam+1jFLNd7ZC1dz7bP51NpyQ4Z1aG3OOqoAsr5N9C+KLVKi6nEUL9x1YjSJvVxqU1vNc4OB+7A2n0AKdFAnclHtz
X-Gm-Message-State: AOJu0Yz4gwxHQqsNKxtwDWBuMPm2orFHUjZEOTYMtm9nYzk+UY2j1oy5
	2jDW/DdZIaCxfep1F3nNKUY35uKfMB5IiRcQCAOFOzsXMecxAXErNYuObBMDwAw1Lw==
X-Google-Smtp-Source: AGHT+IHy1tLGCW7Nem/jvC7aOudNiOgNhqRxkuX/J7UTcovAnA7B/AIFC8TXFy/FYnitwiaNryc9TQ==
X-Received: by 2002:a50:a6dc:0:b0:572:6b03:607 with SMTP id f28-20020a50a6dc000000b005726b030607mr44695edc.42.1714160565256;
        Fri, 26 Apr 2024 12:42:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr. [176.184.11.147])
        by smtp.gmail.com with ESMTPSA id cf8-20020a0564020b8800b0056c24df7a78sm10395889edb.5.2024.04.26.12.42.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Apr 2024 12:42:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 07/38] gdbstub: Simplify #ifdef'ry in helpers.h
Date: Fri, 26 Apr 2024 21:41:27 +0200
Message-ID: <20240426194200.43723-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aPlgi0FFu/Le

Slightly simplify by checking NEED_CPU_H definition in header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240322161439.6448-2-philmd@linaro.org>
---
 include/gdbstub/helpers.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index 6b97610f48..6277a858a1 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -12,7 +12,10 @@
 #ifndef _GDBSTUB_HELPERS_H_
 #define _GDBSTUB_HELPERS_H_
 
-#ifdef COMPILING_PER_TARGET
+#ifndef COMPILING_PER_TARGET
+#error "gdbstub helpers should only be included by target specific code"
+#endif
+
 #include "cpu.h"
 
 /*
@@ -96,8 +99,4 @@ static inline uint8_t *gdb_get_reg_ptr(GByteArray *buf, int len)
 #define ldtul_p(addr) ldl_p(addr)
 #endif
 
-#else
-#error "gdbstub helpers should only be included by target specific code"
-#endif
-
 #endif /* _GDBSTUB_HELPERS_H_ */
-- 
2.41.0
