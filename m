Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004336njm;
        Sun, 30 Jun 2024 12:01:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0YnYA3lEOSX1Dc5O8uKINJx8P80IaIJb3rL2qxH+XkJeA+sCE5RNmFh6fc7sYGT18dnLAxgc7gHzz0UvX1hg6O0YEyVLc
X-Received: by 2002:a05:6808:d47:b0:3d2:15a6:4015 with SMTP id 5614622812f47-3d6b38aa5a9mr4470397b6e.24.1719774064283;
        Sun, 30 Jun 2024 12:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774064; cv=none;
        d=google.com; s=arc-20160816;
        b=wAgE7AZgWlixhbZPz+vhj/YyR9gDrD+HNwq5tz9vnTRX7ayPySCpqRuAJeyXp77jhb
         ZormQElZ0Plf1AqBUOFRBsrmtBXpWe+BXy3giO/Z47KJWj6nC46SAV9G7XUDTIzwaAOB
         9NPYYKz8dwQtRNh0NT5y39VzcZ44os0Rcrx+W07lzACJzo7dN5TV/aOhf71s+8BxJ9AO
         nNVkNliPKMJ8aFKGKSg9QFT+LE3sgI/gWVy4qa0oKrrwR83GJlnG5/TS6lUAR0Ew23HU
         jMyMJVMKn7d1ycSKc6ITmy5VPa50shAHUu8rVyWUZB2fG8o666VEzpPbP+7ellMrpaGI
         Q+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z6AjjP28A+nmFWpUBGHe4AhBkZ8znn8UyBjn33WhQ6U=;
        fh=Qm6sCkldNP27eKYHYGOh8ZvdyyBjXXSwIQW32wsFgII=;
        b=ffJWYQ0cFR7FV7hAFukQKShVyHVJaTJeWyHq1M+A+CuPCS5feXRVgAY0xPqpUOQT47
         36p0dQs1ZQhSzja19v86toHGQc8F/DTeqp16EGAtu7uAL3K1IW81UCHU2kV8TvjGguJu
         WchJj8S0K0/ciCv2Uirn16GXiFq71ueK7RUpxLs0pMy2lcrhvIlH6vqrSf2V3+hvQSN7
         lwGsNuaF8ZSZcWRUXLEe5dsUK453jeW0MCsG3PUWfKjF0nRK2c1ne92YjpxEVg7LyG8+
         kPCpgnTVOkcKpF1Z3I07AFBcFuLMb84R/XiselRPT7N0Z8w2vOBzLLO9WctHlCl5QpUT
         MW8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BL8w0z0Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d567737cdesor3900223b6e.8.2024.06.30.12.01.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BL8w0z0Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774064; x=1720378864; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6AjjP28A+nmFWpUBGHe4AhBkZ8znn8UyBjn33WhQ6U=;
        b=BL8w0z0ZomdJ0T1baqQbw9LGgxvU77Hdkx3IyKC9BjJxXY2z/rcPFQvDKWaQM5QA4C
         i2Rm1LJmdkDD/ExARy2zmgCgoTWkZoV8Gj1GN32eV0vQ8QvM9CqIYNa3/Ci3ZHXf4+NZ
         ibZVy+uZDhY6O+NHaHyzgF/pHJYy6tQXDh9zGnql3xu1W4e27IoqNrccmXGHDl1PEY9H
         ELrJBQzgU+kTk1pzI/bHKx+S1jt3n9ZNy7/fZ4VIyrXw3k+1pMcEmuvc/jSDmUbPIeBi
         cMfhkVUqs2dLEUX2bilard1/SaPUo/ekBB62E822pGHr7UPv4FDuuDyx1/D8Lg8aypJH
         c8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774064; x=1720378864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6AjjP28A+nmFWpUBGHe4AhBkZ8znn8UyBjn33WhQ6U=;
        b=HESv4ek1jWCJSbiCxjBUPmoFKqLtQabYJgU6q0/mza+V5ZqRrS+0n8nFyofJLjmQnd
         NhCDeWlc/SJM4KgbjJFgEymrubZCDE/yKCb6DZtlpv1ZTXNnjUM0irGbPnwDjOGJeYJ8
         isLWto409OTR1iZe5vfpslp1cFXsDdDGf0U8G0Avl5l9yJsvjkdtKD0XLdC5GDfg0vMy
         b4/WILt10SHesKVlkR7EUvuelHK9YEZYXN/wvhd7E6pCEdt5PrFhtyMKfGdOEpbsdQFw
         EThjOGzyJ9DlaR+lUlEww+bd+CnZIvnb/yWU2QzK9W8DDBKWtw9W5gYmLFzmInqdiYfb
         Iyag==
X-Forwarded-Encrypted: i=1; AJvYcCXjnzGAJbSAFQ7EHkwH+o1CZ3p28IYSJoZtki/DpHpRXWx2MzPDKOsdeeQbbH7bglvT97arAhFD+NpQrvj5YsJakSVJBkfN
X-Gm-Message-State: AOJu0YybSaSD0Z8sQR2H78KtFuwmZEcNcPtRmErm92/MCknqh0O9qbVt
	7M7R4xEOegStekCHQb9yr11xVGo7JCfkaYul+WSGvDhKgytp3WJjiw4xbSM62em88A==
X-Google-Smtp-Source: AGHT+IEZqdtxlGnwVXN8pJTqay1KPgU6I77AvumxWecEDGBS+BHnRJ1bsngNFcAotBi3/eWXzTC86A==
X-Received: by 2002:a05:6358:910e:b0:1a1:d75e:9bd2 with SMTP id e5c5f4694b2df-1a6acef5f3fmr249892155d.30.1719774063571;
        Sun, 30 Jun 2024 12:01:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:01:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 12/14] tests/tcg/arm: Use -march and -mfpu for fcvt
Date: Sun, 30 Jun 2024 12:00:48 -0700
Message-Id: <20240630190050.160642-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /+pKpUCjrhKf

Clang requires the architecture to be set properly
in order to assemble the half-precision instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/arm/Makefile.target | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 95f891bf8c..8e287191af 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -29,8 +29,8 @@ test-arm-iwmmxt: test-arm-iwmmxt.S
 
 # Float-convert Tests
 ARM_TESTS += fcvt
-fcvt: LDFLAGS+=-lm
-# fcvt: CFLAGS+=-march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
+fcvt: LDFLAGS += -lm
+fcvt: CFLAGS += -march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
 run-fcvt: fcvt
 	$(call run-test,fcvt,$(QEMU) $<)
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
-- 
2.34.1
