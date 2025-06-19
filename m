Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252988njc;
        Thu, 19 Jun 2025 06:14:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhgo227S/cKekkdth+OEBqlMP76TNSGkgoAOpGkDY6EF+qiuQZ5JemxNWwa97/PW1DAQoXN4cmoEHhKQ==@linaro.org
X-Received: by 2002:a5d:64ee:0:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a5723a2dafmr16024452f8f.29.1750338861910;
        Thu, 19 Jun 2025 06:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338861; cv=none;
        d=google.com; s=arc-20240605;
        b=GQ8tbqsiNGWFATUdioa0NRUcerYxuWchlSkcuBih/JVeEDl0+Jo0H+ywWpuHrow/nj
         0lyNNqrzfv0br204dcU0WM5UU/e4EjpGCdiBs7GBs5qpbLbMY5lDa4xc/MITEqSGfNCc
         v64FmRoOUoSeLhgwtdvCJctiUCNlAhnKW0Gz13jgtmlRjkw/OPzAtXmp2hKgxDzFm988
         uStgU0oG95TI83LFgM9B1XPjwNf47sRL9PPT8k+TXnrjOzJsfGq0IqvG301mJKowp85I
         Czyc+VSabpMGVW6ipimRrathFGOLxINAAWZ/I1qfP1Ezhs2SGBqe4lnV+KtwcN34cggj
         yU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MgE23ZXjPhbz5eEFEhot27ybZ4s2rDCHGkAaeKo3otQ=;
        fh=GxI5QdFXae1RNx52KG4V3TWrr0oopr4rbP7rbQWW/7A=;
        b=cID04q00pTFII49vxZk54lMCqKNdWRjvAL7sIm/AJxUe4XAfqDgUsGD/eh9v2arF7G
         YZ2xOafxfEMPlVoAVb9opcY16iHdA5lJQsAr7kWG4ur4puHa1WSdYPX+BvKIbDI5dYwp
         yiJz4UyGs50P/tTkAb4p74t9PbcMXqZ/mGnJ1yDuFXTfCvSnybsNDb+il8Qw7Jt1tuc6
         Ay+eltk0EsYAUBRKamTGCCCxAQRb1oJRdiuskOxtWaHq1mQ5iHrjcUDglo08IA+a9TsI
         WVBf/aTqiaB6juZuNfQToAVfLcDw0sDIWKsOXAFOjq3MswFC4mY+lGRww0zOtXQbx3QL
         LZaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvpdnTJm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a5619f7f55sor5218584f8f.8.2025.06.19.06.14.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvpdnTJm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338861; x=1750943661; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgE23ZXjPhbz5eEFEhot27ybZ4s2rDCHGkAaeKo3otQ=;
        b=xvpdnTJmMgRYwHQ3uFcEkAYZagLwRW30B+gjzE9VxCSuYnl3bGtOd42qrArIUPf1+s
         ndc+xU6K7y4HxKkzpIw1/DYWyhpwMA/xHIvf+Qh8raFlqJhohQo9au7apDjHUDxEEEDE
         x09QA4GnuDyZnLGaJpvOwrvBQlYkQyuPiVqv5k2EVEwXqoFvg+yYpkRIrLtaFWnk1ZG6
         LlcEl9SssiH3X+QAIzDVa1xXS+9TDziLlVZhRuCLdy5UneY6BweQNPU1dzPLCTqQOFkZ
         g9OO+7tiudCucI+7iyZzCMWQpuvCvmZsXuCelh8qAxxWwVGcZJiLsk3RbMa2WqYqvLrI
         Jelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338861; x=1750943661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgE23ZXjPhbz5eEFEhot27ybZ4s2rDCHGkAaeKo3otQ=;
        b=e309VyVXG9DNQqLtNTAUWGp7bSmIl2jgZLEISYAB6wHOkHrEnjn06MtkSTxI6EQPcW
         /RfoXtTKvOH2yihq7aBw0MPHfvaF4W6JktnSLWEzro+uFXSUIXnWBDkdDkObdhVk5VrE
         g7JOUp2koZlUllA+Quz7P6jyvEB4rRyRFfL9UPncYmf0O5QNmPSurgdlvjUxGRrgr5oS
         V3W7pkgsp26C7gXFDUo8X2origUY/s9awklvpAu0rszk+lmkOW1XDqQ/cNVQtLA/A/yb
         cbuKJL3ATdjCnEoegRfuXQet02EzKEIG3NzE5aGcA7JYidjgzjuCNowioH9NbD5qPGUK
         PUhw==
X-Forwarded-Encrypted: i=1; AJvYcCW7QVq4JrI61CZXARzEq5gzhpNeGNMlsRP3eNLKaEWGjTBB3r9kf6JmbLgN3j1STb8RzRudxqqSFez9qg==@linaro.org
X-Gm-Message-State: AOJu0YwNpzAF88Ypv6j0I1dWA1YZ61y+kp3TLX9fvad62GyqUpJRudzs
	vTcou6z0Uf7jOTRwRERKo/lD5IoRNG6U2cg5KtbpXrytbdIznfm5owNpAQvJjeN2xXWluQ==
X-Gm-Gg: ASbGncvN52y5/vMQzURSi8bn4yS4lvVTgHBOIOYGCV04C+8/ZgYsn71mWIHsAPPykXb
	ChmC7eXwOZ2M6UfEJtw9NO7HQAPyZ60jt4jmQtCAdig+cgXqe6Yi6rFIXzIHc8XRAQHbL0jna++
	W+pFEkQvCJHYIVr5gTNxVckDIrKQq+wnQJECJdzV6W4haQ7hZzeIYLKuU01MBA2AFPONMsMQPFY
	OHbZol/QwJD5OxHM8uCW14E6OAjHOpDGmGMTaUY51hF7d1825Nc2GBlQ6VJFtpfobqArwmQ0ON/
	mA6VwlssO28ETHzRkQFu3nip9tgR2/InsG15hUqZOSYq54Yga+CUm0do1fzjgSDn8oyQB0cvVb3
	g/LjGbg7nF95L67C3uKwYEcnvbPpeHP3qRXfM
X-Google-Smtp-Source: AGHT+IG/UYI2TYIa9RXcwUa0fUfFK7JoPAY2HMaE1zI4A9LwhSOJHHI/mUd44vJwEgaSqgrYnYu8MA==
X-Received: by 2002:a05:6000:4021:b0:3a4:f5f6:b4ab with SMTP id ffacd0b85a97d-3a5723a2e2bmr16674306f8f.30.1750338861305;
        Thu, 19 Jun 2025 06:14:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535b683b49sm29415425e9.1.2025.06.19.06.14.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 11/20] target/arm: Create GTimers *after* features finalized / accel realized
Date: Thu, 19 Jun 2025 15:13:10 +0200
Message-ID: <20250619131319.47301-12-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: r+yM7MIUPYeo

Call generic (including accelerator) cpu_realize() handlers
*before* setting @gt_cntfrq_hz default

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 65 ++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c99981d88f8..102f45442a9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1986,26 +1986,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!cpu->gt_cntfrq_hz) {
-        /*
-         * 0 means "the board didn't set a value, use the default". (We also
-         * get here for the CONFIG_USER_ONLY case.)
-         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
-         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
-         * which gives a 16ns tick period.
-         *
-         * We will use the back-compat value:
-         *  - for QEMU CPU types added before we standardized on 1GHz
-         *  - for versioned machine types with a version of 9.0 or earlier
-         */
-        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
-            cpu->backcompat_cntfrq) {
-            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
-        } else {
-            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
-        }
-    }
-
 #ifndef CONFIG_USER_ONLY
     /* The NVIC and M-profile CPU are two halves of a single piece of
      * hardware; trying to use one without the other is a command line
@@ -2052,7 +2032,40 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             return;
         }
     }
+#endif
 
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    arm_cpu_finalize_features(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    if (!cpu->gt_cntfrq_hz) {
+        /*
+         * 0 means "the board didn't set a value, use the default". (We also
+         * get here for the CONFIG_USER_ONLY case.)
+         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
+         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
+         * which gives a 16ns tick period.
+         *
+         * We will use the back-compat value:
+         *  - for QEMU CPU types added before we standardized on 1GHz
+         *  - for versioned machine types with a version of 9.0 or earlier
+         */
+        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
+            cpu->backcompat_cntfrq) {
+            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
+        } else {
+            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
+        }
+    }
     {
         uint64_t scale = gt_cntfrq_period_ns(cpu);
 
@@ -2073,18 +2086,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    arm_cpu_finalize_features(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
 #ifdef CONFIG_USER_ONLY
     /*
      * User mode relies on IC IVAU instructions to catch modification of
-- 
2.49.0
