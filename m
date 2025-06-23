Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509834dyb;
        Mon, 23 Jun 2025 05:19:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVk3c6ggwxxDs2K7ZwGdg3qS25Vq1wEPg5IeRVbUHsb9luI/AMnTDYM0Jb4DsDTO77YWEcAFHyrI5pY4w==@linaro.org
X-Received: by 2002:a05:6000:1a8f:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a6d12d5316mr11691199f8f.35.1750681194926;
        Mon, 23 Jun 2025 05:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681194; cv=none;
        d=google.com; s=arc-20240605;
        b=dlfZdTJObzKfMCkm2izaliHu9hG2sw8+HNdZwmj5mi4u4CK6PuZjno7tSRmvaWMjDn
         saGTheviKslsjPZiUI9pfqr9wQHrDN7Gxy27RdgvqG/i4bnB+ZLteN2WGJxIHiLrb5aI
         dUME61fiYpiZKEi19G9+3jeuHTxks5xPPeJQHiUCNjszxw8kQj03MKH6J4eaIvM+kOkr
         c+fTz78z1QFUTbuc56u72UC/w++kjL7Qhy+Amf4q4GZkj6Se8OPkKqUgVm/LJLj+Vkik
         En6VL51IsqPVChFcDUMRvxs+Lz3EgusfyHkXmqqSKOH9OADJe8hJKB3P9FjnrfJu8pP3
         NXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=n9TcP7uZ8sj3k25ApWupc8E4+ydRbD8zQYT0ugNh7kc=;
        fh=a/STOxpX1tYimYiHU3IP7rz/sPTlf+hQBmJbeJNptJE=;
        b=gR6IIPraVQ9EDxYtUXAQ6YLaAd2j6Kdv1Hs4K7S3E61uCKtHtOSh9+9CGnbenFslq0
         kPGmXM1fY42HeYhTXgRShNDheZ+J+YrNiB2RGINIHD2FvaJyNpEG4p0qwdCFb4TDIv04
         dWWVhq4tpXZjWg4Q0mholFm32h42Vziyl+v8zny1fSFsJlZcyWTSW2t/8UGai96xXSrI
         lGJC0wDawGEQtVEJ7zzhtGdM/VDMx+WPvutwfyKp0fydZIC3Bf35UfoKqmKaqle/Unej
         UoTupNWvJdNYloTw2rtYM/Op79qYANJA4Q4dohhqguMnkvlHEKqTBtfeI4pMwgfwpi8z
         0HRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OGZEiS2M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d143b01bsor1774602f8f.4.2025.06.23.05.19.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OGZEiS2M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681194; x=1751285994; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9TcP7uZ8sj3k25ApWupc8E4+ydRbD8zQYT0ugNh7kc=;
        b=OGZEiS2M5c2BhKOXNqiFONyITsVw2olGkBnPAoNXtLvXpXXWn4VprDtlLPYWKwTQ+w
         hPH1XQF07kejS5eO0y/VNPmtEbIb2gmEwhuATCU9DLSxHz5CPlG29Zd2czSjBW9+MMN5
         2F38scRCHj0k1APl6KcW5/lgjAfKerTlyoI+iSqruHoL+TgH8zM9Q/pM0y0L8r50sJCR
         fRMnYrbHA3CamAJqcV9Lt2wc26uurvM8NGK0wPd8kFmHyOx7Nw2eiWARJHQQcqU/Cuyx
         g2fkVHnOv9UTy8tSCIcH8jjzpfK9XP8pVzMhBRf07ti+UImkOzDednejMr+15NUmRFwT
         LJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681194; x=1751285994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9TcP7uZ8sj3k25ApWupc8E4+ydRbD8zQYT0ugNh7kc=;
        b=cV0Rg/w8avhR9rrLNo2K9kXmuOmQfJD6ee7TYihEnPCGZkLi9GGGHXVs8cYJe+wa17
         z9/UMH8uOe5o5G2ty69x7wy/OS3zhBksddUkb0vTM1tnWrozxk47FOGA/PITKKhlc62X
         ujQ1eA4MKJF1xEU4hO2a0PHaVkUs6DoUtxNnKaRpNcLnWEdI9eMyTdRyeg3FEIoxqKU3
         n007p4HvX6aUEByLqV4n00zl9rtpGEq92dbbt4NGesqtDyXNyZV/n7pjl8loMC9vSQRj
         cnsc0xgac6M+JDt6nSSsYpAnUvgUMJr/X1CcPC4Lss5jLlJZZH74tFhd+jG/nEDEiPFH
         gKRg==
X-Forwarded-Encrypted: i=1; AJvYcCWpryVx7toZyKAe6YErEQUtH/sGHtITKhB2scDPPZxY+okTzb/fS9ODRdiYXWg6C4WqSxYhGq4U8IBozA==@linaro.org
X-Gm-Message-State: AOJu0YwdeOqYpxRZIAvYXARAT5yzYXQnLWK9AGXlx4t1EbSYEu9jocjL
	j8XkqxWJom5SPvbffgIdSy8HMKSafIpZO6GhrNfbbKXCy2qVEpKhoVgCd43BXViIJnseUQ==
X-Gm-Gg: ASbGncuHNd8pWCY2aF2HS04snykWsHkCIozcq1p5pbHHD0rKz6e52ulQNWs5fo2lsYL
	1b661+LzhXWykZ4hQhbShHI03B92X+P8MJ9KtWEQrhLHJ+nq2vsTGX6i4eOc3XkiQbUqXfKNEn9
	sNuam0B3dYL8nUsWgsXVT97dzODbb6kh8d8WKfjeTgWDzzXHOul4WRqIQeqefxTdb6vlg17Cv57
	AQSjkYmzfNVKA7sDGbJHwFz0LyLVFqHg54MBRL8IWuyt19N0a53xRGutcpv8UAg0ftyi66fnyWb
	ECktaOpYbQgiM3nnQ0MpjvrRiBPyQPpt3j8OFG98PC5eICR1PHke9E0QyfJGtEAYudX3PEWS8Qz
	0IoKuyA0axZt3whHzUKOPEZXoxhXGEQyr2GXf
X-Google-Smtp-Source: AGHT+IEHiq/SjlZG6KJQYhM0dN6HzIW1qJU45zGcdqrFfg265NhL0FAhAnfqOQcq/6jydwJBpJn65g==
X-Received: by 2002:adf:e187:0:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3a6d129ccdbmr8492187f8f.16.1750681194323;
        Mon, 23 Jun 2025 05:19:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10385sm9537215f8f.17.2025.06.23.05.19.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 13/26] target/arm: Create GTimers *after* features finalized / accel realized
Date: Mon, 23 Jun 2025 14:18:32 +0200
Message-ID: <20250623121845.7214-14-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3eGHRjkSLb4E

Call generic (including accelerator) cpu_realize() handlers
*before* setting @gt_cntfrq_hz default

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 65 ++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e5b70f5de81..ab5fbd9b40b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1985,26 +1985,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -2051,7 +2031,40 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
 
@@ -2072,18 +2085,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
