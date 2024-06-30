Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004329njm;
        Sun, 30 Jun 2024 12:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwsHQKwcsp+Gj+IM2zut+unSh5nlYp+BZ4nYEm7gl1uvWmsT3Qh+BFthxJ/f9KXmXFbMZhYXK6uwJ32ccQiGyg9p9d9pt9
X-Received: by 2002:a05:6a20:7052:b0:1be:ccc0:283c with SMTP id adf61e73a8af0-1bef625d7eemr5237422637.62.1719774063594;
        Sun, 30 Jun 2024 12:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774063; cv=none;
        d=google.com; s=arc-20160816;
        b=b64jeOq7OsyksX2ksJ3p7MlfIXETTNuI28YPi9HjYNdoOGNZ7nwruytzSzjvefqjei
         9Rx9ns7aii6JwOaDdKm8riQYDdEIeO1KzE+g6MMNqTWQev/mj6xk3hVBZMKAGHzGdLdJ
         KlNjQNYNBINnoPltHxORpfhtepn2137s4KCUC3Ob4mpyXgcH66ZYB+THuqjwtqtcygRN
         /lC6G27CcAIhunKfp0UQe0xswtbHBv1qAo8U0qC4HQ3oGYhMWk7A4pt8smUg04upcuAn
         oyOuNhZl8ZN1ECAulWeGpwh1SA1kqUgyYt4/NJfzQgnxeTXPjh/rZPv0JnGamdrzmByF
         ryBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RGOc0p/wwE/PuqcJ9S9lIVymEvPJ2X+gCQchQONAjmE=;
        fh=s3zNHTqZOXBLgxyef0iHvxQgBpf66sIUDHCQ/cSukeg=;
        b=FJnTbu4bHQ7ycyQ4D13f/qIBBLdqj+hQ9Ziw7NfrenRM6YGajPdK9ak1auRagK1phY
         sF0IuR+oXfye7LNMjIOrdVsEtl8XZDfDy8yxsu6HE9Z01pG2Muiu8BAZLt+irywt9Fg3
         sGodCX1rbCTL0XbjR2k9vCPmIbH0X33WIkMaQaKuQOtRDiBPXSnAUXGheSgYEclcS73h
         ngWzB6sckVmfNRRO7fmxtTDeu7ckpt0+JN7l+1ioNMmRGqyebP5zPvhLlPtPxOyKxJRW
         iVbZRjIgDM/hCjIsB5lGgo0cqsN7cLolox0utB5JxLWO1841KpeKn9UY0Xd+d9hw6zUY
         A/+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gloXn91G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70803ed31fdsor3319987b3a.12.2024.06.30.12.01.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gloXn91G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774062; x=1720378862; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGOc0p/wwE/PuqcJ9S9lIVymEvPJ2X+gCQchQONAjmE=;
        b=gloXn91GCZyePnI6zLEEES8Ubfgxu1gafA+NGaC5VDLhhENXWfPxCkVOtVVUOr1c3l
         bOEdvfBJRUa0e0p1N7BN8lXqt4nzSS7XpcjJyNSkT1FK3yOVRWnXeMWsO/KuTtVtS0qi
         YhpnPRQrfgkXqGSY/AnBoqkQDXPWta5eGdCmnLaUFNtPC8ZGfmDgVkxAnb8LUbb2ZTU4
         hiCnnxMvBOsyYckR8D/BCTzEKmJpI3bEcjKxHVHQUyZDmOqi60ukKb9u+axGTX+m2wUv
         JN6RUf5Muuucvsbbap8PvtSvPGefXzwLawx+iqWX4U93d3sqpJoeW/b3KWb/5kh8BDuA
         VFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774062; x=1720378862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGOc0p/wwE/PuqcJ9S9lIVymEvPJ2X+gCQchQONAjmE=;
        b=NEfbTKYVLmqp9PpZ4K3+hv+Offa4nZPnJesuw7rPtB5EbNL48IQP640lJQAGgB54vV
         E6ifR+CvzbAwS7Ts9S3I1IjkWNB3kOxdMopHM4kGP5DwqlgCGyst2pojItTWEwaV0VMa
         F+SxtyqbTmdkE4/Eo0O7uVOmnb4uqx/jAR80VjcleQFeO70BZlov5H150V/iSS2AznLQ
         VBiVKdZoAV/7jQmuDr1TV+m5ntvR45wS+ijr7dE/oGgJCJeZua+dyxyii0A0Yrqv3Srr
         I2i+Qqi3Hmu9AbSRD4VemXZKL27u/FfezWCiO7m6JUhrstLQfRXKAXxVP5aOd4gmt4NQ
         UCSg==
X-Forwarded-Encrypted: i=1; AJvYcCU4sAo2BQgR1AETxirn1mYYTmvXWrzJi6WyW5kPkADZ8TUws+ZhXbyCgzTYkbMpT6iIJF4u+171DJrsMcU5KkbNdpnM3J18
X-Gm-Message-State: AOJu0YxKTLy651qfZXo6zXhtG+ZFOtqN2XLPR0kMePQ4oFIU2wnMsrhB
	sxGYJNdCscIUijTsUnioF8XPJy3VSpwe5HcTNT7JqrdfjoWS983PsEMCSBkHPpOiRA==
X-Google-Smtp-Source: AGHT+IGOwn/Wjlvb0Lp7hBSnoPc6xk/p/n49YaGfx8MZBEyqvZ8aRawi6YB7EhFLpclWGQRn3NTs6Q==
X-Received: by 2002:a05:6a20:da97:b0:1be:f8e0:abac with SMTP id adf61e73a8af0-1bef8e0adb8mr6733442637.45.1719774061910;
        Sun, 30 Jun 2024 12:01:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:01:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 10/14] tests/tcg/arm: Use -fno-integrated-as for test-arm-iwmmxt
Date: Sun, 30 Jun 2024 12:00:46 -0700
Message-Id: <20240630190050.160642-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: w3eAHTK82q15

Clang does not support IWMXT instructions.
Fall back to the external assembler.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/arm/Makefile.target | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 0a1965fce7..95f891bf8c 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -8,6 +8,11 @@ ARM_SRC=$(SRC_PATH)/tests/tcg/arm
 # Set search path for all sources
 VPATH 		+= $(ARM_SRC)
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-fno-integrated-as, CROSS_CC_HAS_FNIA)) 3> config-cc.mak
+-include config-cc.mak
+
 float_madds: CFLAGS+=-mfpu=neon-vfpv4
 
 # Basic Hello World
@@ -17,7 +22,8 @@ hello-arm: LDFLAGS+=-nostdlib
 
 # IWMXT floating point extensions
 ARM_TESTS += test-arm-iwmmxt
-test-arm-iwmmxt: CFLAGS+=-marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16
+# Clang assembler does not support IWMXT, so use the external assembler.
+test-arm-iwmmxt: CFLAGS += -marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16 $(CROSS_CC_HAS_FNIA)
 test-arm-iwmmxt: test-arm-iwmmxt.S
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
-- 
2.34.1
