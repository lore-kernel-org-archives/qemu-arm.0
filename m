Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878164njc;
        Fri, 20 Jun 2025 06:08:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTMksq322EK2/6xfUZ3yfvUBb/uXOcPslz0zQUXSeWiJLRuIDUnyVHEfGt+QbtShr0xCc5PWxIbJB4Sg==@linaro.org
X-Received: by 2002:a05:600c:a41:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-453659b89c5mr20554345e9.28.1750424906780;
        Fri, 20 Jun 2025 06:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424906; cv=none;
        d=google.com; s=arc-20240605;
        b=SFNai7BOa8Iaiipwj6HXhinNqnPvhfvy+yti2wVw3Gr1ddlS5ivrh/EHkCExGij1TT
         hSWJ/OSTVUGFxhAYKwmJRcUe0mRxwL6GMI8yx67EwKTGvejRZOefI5ppDOp2JQ2iXXEZ
         4Svsz7s8nvRL+A7VG1jxHStPKubZZnJ5emFeQLRQEpdtWWu2sxCXT8It+pdAwmezTWcp
         Imws1VOfRPumYLPwy0CDS14xKK/ZjBUHAnSVlCFxO/0GvFAudZU7NQbrddl57F7M/LUU
         HSPFNBOnk/Ccy9IbOIeLP+YftRUXTwIPxjGlb6DshXhAa0CyvFwf3MMx8ZAabEBxQ2mL
         x5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qbJkhz3jwM/7an+ncj+kPtqJZzlzC4z2AtmZHXah0xc=;
        fh=PugqZQ1sPpptYCDHHtcTEUfNB07Z56IA6t9hUcoAcuE=;
        b=YQO3yxwCRJ3e+wVRSMbeGFcTGcwWUTZCnLxjlBBIWH91zI+XGKUNYW0xEeK05W/5m3
         wASvCH+YfEcLEaPGpRDbX2KtV4K1mpnAbmgfp5bif1rfHyX+tc/Gw0ps3igMbcDw+yCp
         4E1rbHDLG8dTXY3Cmn3Xn1VSRxvG0/c5BiCnXe6yGv71wz0gu7wLt+XNE48UxYMcw6uC
         UIxRiglOx0HsfkMHNu4mzNer16i/KR0JEvKZ2TTadZUdlf+gJhZM6BVC/DgqlO+bkzzf
         sBA0p5tjKzx1vjklWqKBajqO0JkBIh4HVn6hL2MqsAo/xOvpGVh3l8fZ3rcVDIZMnLaX
         J50Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kNhS7/Ut";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646de86bsor7902185e9.5.2025.06.20.06.08.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kNhS7/Ut";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424906; x=1751029706; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbJkhz3jwM/7an+ncj+kPtqJZzlzC4z2AtmZHXah0xc=;
        b=kNhS7/UtOAdWRlxArU/iuYsIu/o7qSDSeA/Zqma6XN/RjjjYkqpVrhbrnkv5H7n7P3
         gAX9749Whikqn43K4apdSbE1J+lPRNYv54lsajFq/QB/Bb07P/PxZoKEwUdOS/DFvKJh
         gazHbAvXwLhdPK29dT7D9rP/vJ2FHPFcIC76PuJ9zuNKylimkyZKYLX4Q0ex3BxDDAlX
         iCYIShFZ84ht+PMsc3w1Ajwjuni5cJtfuhaO3MpctLyD3N5Oh2AwMlwL6haPJz50lfRK
         0+YU7LugPB9cqHHHDxAUwFf4bkn0PFMjqysUWXcWqvwNyFCKD92KuRgbON92RcCUm1iG
         VwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424906; x=1751029706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbJkhz3jwM/7an+ncj+kPtqJZzlzC4z2AtmZHXah0xc=;
        b=K2/JSdp8jt+XpzrM3jLmfk0tjYPRXrSpDqiq5ezXDnLKKBqLGIVGz+3Xm85loqgw3W
         /Bqe8NwXltjYpLL9hC7yx+rD7Y1CYJf0cNtFL5q1ynxniX/w9Asg4yg0xmZ+pWSbSsBk
         nzyQMLFH7VpjquNwNz+96K/sonSw3dd2j4NalXFcG2RaoTDqR5X8yNDw3EbRGR5r1LkM
         FTnoNuARVhINnVl6bOJJiE1zq2M88SpD2q9fUjWxb51+MPS5DXdXYb9FD8w5TtwiC/zX
         12rfF7Crlbk7NUwm9/wSNdQ0oGb5kt8E6lt+c806U/ed6wsGb5K3vGuqgdkRjgbqgpic
         0TnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Y87cvg1Rc27i4aswwkuPBIEQZOtJZi5kV19Qqt8UA3NSUkyATkubHjrda43v9RV3f9rcYwxxnOhR8w==@linaro.org
X-Gm-Message-State: AOJu0YzffjCU/cqJBhTyOEZPvpo+xtvPAFUiKNVa71hgsd869ykKA/d8
	IGa1Exm8mvva39Ppmqopq2tG47Kyxz1bnXPjkqjWbZ/dwdK0/PAmmn6T2nPMa/o2WjkqUQ==
X-Gm-Gg: ASbGncvRABXaU4eCmlM+QqxrpHQV4Be/kfrr7KaMMlcaeGSylA6oBXzntjEq4tI9p3I
	9SYCxGydiWuuRVidntGh9NanPm7hc0yE2YgqmmMy0AeYP5iD9E6Lvbp7dREM0sW8jQnWESOyIiw
	BvUVAm6epgG64v7rWmG+XnHaVRgh3kMvDhB7Q+0KKgxi7zSl7EaspPY7DtS42zVHAWFYtjBrwlR
	pn0RufBXE4EmaJ5qbbIGc288NKFcV7G9CG0VgLoCN4vAG3Iw6Y9NiFvu98C+mSove2y5LJoZdvB
	Bx1mpX5c9qx2KrPdJKmkpH1p58pt68aIzuUYzQo5y+Yy4fyAAZvwap0iWGdomgOwM6eOXd/SivI
	23M2xetgRlPLH0QuL3y28a6G3F8YyhnPehcIB
X-Google-Smtp-Source: AGHT+IEovICPCvjwxdsOFxQYVKyO0QusibpDDvB3y28q9auAAPau9mFOJbflgaPhOt3KoclCZXn79Q==
X-Received: by 2002:a05:600c:1d0b:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-453654cb826mr25614575e9.13.1750424906120;
        Fri, 20 Jun 2025 06:08:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm59776775e9.26.2025.06.20.06.08.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 13/26] target/arm: Create GTimers *after* features finalized / accel realized
Date: Fri, 20 Jun 2025 15:06:56 +0200
Message-ID: <20250620130709.31073-14-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yYWQxVGZxDAb

Call generic (including accelerator) cpu_realize() handlers
*before* setting @gt_cntfrq_hz default

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
