Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463931njm;
        Sat, 29 Jun 2024 01:56:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEYtibYWTtjk8jnKo7JvA5qRCQ9IWgxe5Ouo8GdPZY6DxTxOxn3tk/KMnQFGHrftBDItR2sNl2IvY2WZkmFyb1j+0sQOoH
X-Received: by 2002:a05:6808:1783:b0:3d6:ad60:3a56 with SMTP id 5614622812f47-3d6b50c0ad8mr627024b6e.38.1719651395798;
        Sat, 29 Jun 2024 01:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651395; cv=none;
        d=google.com; s=arc-20160816;
        b=axhJrvFpV6NdU4ZXWkheQtscEjKVwdxCmi8GxyRKLX8Zm9Zdv0xt6D8nTKPehERPRD
         Xu50UEUxlynAMnXRfG/gwd9a3Pu4cRFvP3RG0ugIdqD+yHcPXqRxyArCwANlPY21vYWA
         WnO5XJ+9vnJqHsnbvbiR91q1dNqyA/i22eY4oobt1wBVAKJ8Zleg6+6BkKNYx6BeGl1l
         z1E+fwoV71wmVnqAsCKphDBPogyh5zX0ql81G9v9vJxscRHfkGmbvSKQaPD1cXtiIykq
         Dps+R12zTmYcOHagoGvh25WfOdFsjYz5su9t/s1TxMJ0c6Mfg57eqiqIwv1kSV/i5J4H
         Turw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=uV36Gt3F0NFarV2rkaJX1rYzyXO0vgzu3txrDL4RZ9o=;
        fh=sQDHSvoFGQa4xEK0fmCVtUp6UjcfWaz3JO4OzjeyYQ4=;
        b=tWc7PZ8expsf2qI/VtdqYNzeVFqplLHJzMcBqStmSj8aynzyj6qk+47GebaFqC7s7v
         rgfTYukK66kZZEHE8YteRgVOKEd+UNNpe6zJ+MobY+5IUTIhc1IcuEzciORtULrRSjP0
         FGx8yAyO+xUiz6XaJSL0WxicnphJklmSAL6XYlYfnRBSLmEYVcDIjQ5uxyab1/+Zqbqp
         vIVyfbrUYfo1e2y5xGYhYPOQvayfmlYpVP2nOrp6qtuQrz86o8eySsdC5+k4hd7WsPO1
         3qjel5W/NwQnS1rn4V+wIcGGsAd+eITppG9fQeW3o3YkTaAwENamCdZduXAbpg46O+pF
         /4tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=wrg7DYeK;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d567735a00sor2593288b6e.6.2024.06.29.01.56.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:35 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=wrg7DYeK;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651395; x=1720256195; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV36Gt3F0NFarV2rkaJX1rYzyXO0vgzu3txrDL4RZ9o=;
        b=wrg7DYeK/LS//+UOUJIDSaOEJyT4QaOIGFpaorveTzwljzZqnVTtOzG52jlzhMYLJx
         ZptjRLbSJDw7TTF6oUmuzTikIwazFld4wJy93IUFSohbiToypkioQrF8e1PJylVBDKmL
         EFmTDqjyKU370eC22NCwerLy0fy7tRGb4q/+v0zssKDKFgn1Qo8aPaquzs203mdSL/D9
         t848LT6N6PKTYkRjPac4v7ohp7fSAeDtqmIXKJ1oOhL4kA5KZlTZRkcjRgwwUtmf731m
         YRhHPpQ5fez+xTsegkxYu/AV+yf0SpvdlDse/wCYXV+tyPh1OqlWfxNSuIUB/jXJ+zpc
         I5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651395; x=1720256195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uV36Gt3F0NFarV2rkaJX1rYzyXO0vgzu3txrDL4RZ9o=;
        b=EMHA2Hdj2YjECdqT4Nhib9xqXvwnGGs7LUSnDOPrshoV5AGXY9XIad4kl+rcfB90Da
         GXAKWSSchA9S++6T75R5n6nFHOLOEoi2ka0wctU9y7XIK89RZJBOOPlP3TynTIi50xRh
         oNhqEl5TgNt1MVMs5Cr7cmWxck1/6pFcakm5kghfFWwR3hA7lm6ErNz52tNUooGYQhtX
         T0Me2GsjW6k+6TsnuyNWZVTXTz+l+d3An8XZdwavlnGPZrWoI6XUYtNkoFO1l7zkjMEt
         +2+b+2MdfLfKNI0nPMgX4abpWqpH+rks5U/P/XiHoX0hsufiV4tI69tKlmLuVP3tkhUR
         wr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxN1UBGwdrARWxYUDhePlSqU06e7DvvXxYFo/Zqg3MBkpz6QQvd02obqnem8lekm4x0eI/Lho6/XJMbKJdL70P1yffUOhj
X-Gm-Message-State: AOJu0YwYMUjilj3oY3qSaJwjjdnZ6eZFs9rqhRe2+Jg9n+apPKxQUOUW
	nMJAZzmAmhPtsBUL5RcrjJZ59MgbKjb9afwriIpECHM2AnPBKv9i35gOyfHGnn8=
X-Google-Smtp-Source: AGHT+IHp6po7/G9WybAOHrGE72hCCzpTgJQt4bM9E0JvKIFkPN+wRZh/Wsv6OaWcEj/cQJBQc/YfUg==
X-Received: by 2002:a05:6358:2809:b0:19f:436b:f6b9 with SMTP id e5c5f4694b2df-1a6acef67cfmr47311755d.32.1719651395347;
        Sat, 29 Jun 2024 01:56:35 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c91d3ea47asm2889625a91.53.2024.06.29.01.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 29 Jun 2024 17:56:27 +0900
Subject: [PATCH v3 1/7] tests/tcg/aarch64: Use -fno-integrated-as
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240629-tcg-v3-1-fa57918bdf09@daynix.com>
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
In-Reply-To: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: HmF1yanNtVs9

clang version 18.1.6 does not respect -Wa,-march=armv9-a+sme without
-fno-integrated-as. Use it when available.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/aarch64/Makefile.target | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 70d728ae9af7..05f98c80c88d 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -20,6 +20,9 @@ run-fcvt: fcvt
 
 config-cc.mak: Makefile
 	$(quiet-@)( \
+		if $(call cc-test, -fno-integrated-as); then fno_integrated_as=-fno-integrated-as; else \
+		fno_integrated_as=; fi; \
+		$(call cc-option,-fno-integrated-as,            CROSS_CC_HAS_FNO_INTEGRATED_AS); \
 	    $(call cc-option,-march=armv8.1-a+sve,          CROSS_CC_HAS_SVE); \
 	    $(call cc-option,-march=armv8.1-a+sve2,         CROSS_CC_HAS_SVE2); \
 	    $(call cc-option,-march=armv8.2-a,              CROSS_CC_HAS_ARMV8_2); \
@@ -27,7 +30,7 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
 	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
-	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fno_integrated_as, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
 -include config-cc.mak
 
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
@@ -69,6 +72,9 @@ endif
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
 AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
+ifneq ($(CROSS_CC_HAS_FNO_INTEGRATED_AS),)
+sme-%: CFLAGS += -fno-integrated-as
+endif
 endif
 
 # System Registers Tests

-- 
2.45.2
