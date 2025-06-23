Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509628dyb;
        Mon, 23 Jun 2025 05:19:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTFQIgJ9tlLUDaWD62C7yp+1EgQaZA0FkWFZSvVG51hICBRdM+K9zPvzWoJW27Sv46PMQ0YG1zWY8I3g==@linaro.org
X-Received: by 2002:a05:600c:1c92:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4537ab1d451mr1365335e9.13.1750681179507;
        Mon, 23 Jun 2025 05:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681179; cv=none;
        d=google.com; s=arc-20240605;
        b=NresD5+p4scOh6PlRVQH1d6/Cdt4icDdjyyHa89sYuWcskbSTfVwV16sb8Jt9hzRbt
         aipSkAKMbM+gW8w7OxM44OP0QB8bNy54ChgIbm1VbJb51wJ5m2jTP562gk+SjjFgzIgM
         rlQeA0oSsNwkeYB3cz4Yt+9nssDD8Rv8iSzRaCrmvu6Vg32+pwI0h/ez84m67IldeAqM
         4jyngXstM0Krc7+mAgRGCuKhJGYO8PWlOAmlC3++Idnv2MO/IgNiQFE5idhD/ccNB1Gr
         M44wkSFMHuQPwV53RnF4xPq4oX8pN3UPUPxUD3mOzvdusnlG/JeyvbaER42TjHX4+owC
         O/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=48R2YiPamWEGXpLD/SMOVBFSdD9dMYPDAhGM9B3qv/Y=;
        fh=aWcmXeVVBkcUwKJJwQf9RG0oFbalFXR7U+bzCHFfQ5w=;
        b=YbQVRwFltfzcgk7m8OAmwlXxb15WrzYTzK9Ucij/bBVr+ApPXwf8aAlvNRgN7KayY/
         UZErdReegpe0p7a6nBYV90mcLN8zRshSo0xPRYbKi8LF2xjO0w0Om7kFbn8+DzoIJRWQ
         lbxA7CEIjpQE8RXyQJ149X1U6WUAExq1JGDZ0nxaUt6I7s3sOr/6UvfVbcLIst2xHAzp
         4g0/AT1h84v9ZmdBbClcHPKz62fWW2/rlNDFZGCJ0gN8wQ0s0CX0mbUr8kS/EBFvgviS
         suePQRusTiDJcG8CZASJkG6SF365kuuDYCliu8HHy5gF3WOGTVjpqj0f6T45A/AOvf6L
         bgfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bq0rytmS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d1437540sor2450636f8f.4.2025.06.23.05.19.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bq0rytmS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681179; x=1751285979; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48R2YiPamWEGXpLD/SMOVBFSdD9dMYPDAhGM9B3qv/Y=;
        b=Bq0rytmSPCbBrH2PLhveWzS+fFOiHhVHDwYC2ETGxYKby7nxg2eqtiQD4ivRNNnxGp
         GmoIqlBHZco6CrTB+Zgu7wbIkXWU2yvpkufVnkcTAvo47KjgMj3+Wanp7uHWEMY/HF6v
         8HOttqQyncplViLWJ5N0EPMooq7zK5FNCcgtOxL5Wc6U4Nd+ncfqCW9Sc4OdZpRLwHYV
         F5/0Rfz0brASWJUw22AoN0BgbWmOoNQxajnKg+QJol+ahdzbjW9nUGBlaKXgKZBOhfzY
         Slu1y0a0rAVvQi8HHKZympnm2tzdAeEbfi28eiWF5kZ6SqgrbJuODbKcXLAeqZmz28wj
         AqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681179; x=1751285979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48R2YiPamWEGXpLD/SMOVBFSdD9dMYPDAhGM9B3qv/Y=;
        b=oWlC5grHjGK0E3MKe+c4olkjaqxNnp1oFLnDmgx+fEU0QP8hKUd1QM0HJm9bVj7x5o
         LNoAy5mrl/VzCpGdM3OKNaKWceMRREMlazCmrYm085AIA+LqKQ45VD6MMBfx4I9yvM4/
         KNuQks7L0sobQvztmtfqmMA8mj+OPl+xksub+yHYvgTKCA5eFXtWP2bAJW/zJ/fYfh68
         umsJXPTjiRMQBCLFvgp/6v8ZpqxbQOfr31LtkU1/njnYMVKQhmCdnuBQ67WbJQAjhtz+
         hNw8JuihsBmTfl8PLFab+mxc+oSdkJv2klvYrOjyRfbYPm+y7gdnq+JEc554qmp3L2SL
         +6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW7zZ2YisEtD2N2RXLiJmo5kHOPGV9+9p1vUlGS9gNpFUitxUYKHzJP0E6B+xYCpEDbASnQIeZJzjTAGw==@linaro.org
X-Gm-Message-State: AOJu0YwFdYt+R9o69DxkFzauOmolexQa5vtGI8misJuAqxYL5nNTuWdE
	uVaa27gRarvPvGUGM6hICbj0CN9hEWYR+XCqaIMxIgWuJ5lkVNLaoc2sldPwQNQz0hZnKQ==
X-Gm-Gg: ASbGnctAXdikAZugEnvN4+/jyB+iYWfWvMIyxLCg3TqHEoDuB3WZpgaKQeglzQY1ATX
	o/+1uLlWjOvaqimOiRUb4XwvzJno9Z4diPrPdPMKHsM519WNLWf/rRfDj+OGSraoc0r1z2hSaLD
	K2VjAnkkNVmqrDgOGOa0AwwUj6pxxNM40g8joigcQ6wMMcyvoS3K5aFn2L6Mju07ErgBMwHzOYn
	yUC00sQYePAQFL7Shd2oj93QYX171G+XcUncl5+baIpHUKFlUVjbaiC7ilE3rSvPxPHh0Rp5wQ9
	TKYUOdr9T7oIHfVYm+MJ/UqHzDf7wcgBvJx19hY/lgeoaeM0bMVkwLQAFm+b9htryY+KaQOIvyC
	Zndezs9YaqW9nOIHRq35foz+z0JTyFGTWHxnqccSUwWraQc8=
X-Google-Smtp-Source: AGHT+IEXe4I5B9Ke/lPmm6yKL911KIFc6TFDbUCkl0BXXwXmGDLjh6AfC57olDM6XbzOca+1lNc8Xg==
X-Received: by 2002:a05:6000:41c5:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a6d12c4483mr9863735f8f.7.1750681178908;
        Mon, 23 Jun 2025 05:19:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e2036094sm2260909f8f.99.2025.06.23.05.19.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:38 -0700 (PDT)
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
Subject: [PATCH v3 10/26] accel/hvf: Model PhysTimer register
Date: Mon, 23 Jun 2025 14:18:29 +0200
Message-ID: <20250623121845.7214-11-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VDAFZff8MhAd

Emulate PhysTimer dispatching to TCG, like we do with GIC registers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bf59b17dcb9..5169bf6e23c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -187,6 +187,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
 #define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
+#define SYSREG_CNTP_CVAL_EL0  SYSREG(3, 3, 14, 2, 2)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -198,6 +199,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_PMCEID0_EL0    SYSREG(3, 3, 9, 12, 6)
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
+#define SYSREG_CNTP_TVAL_EL0  SYSREG(3, 3, 14, 2, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
 
 #define SYSREG_ICC_AP0R0_EL1     SYSREG(3, 0, 12, 8, 4)
@@ -1326,16 +1328,15 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
     }
 
     switch (reg) {
-    case SYSREG_CNTPCT_EL0:
-        *val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-              gt_cntfrq_period_ns(arm_cpu);
-        return 0;
     case SYSREG_OSLSR_EL1:
         *val = env->cp15.oslsr_el1;
         return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+    case SYSREG_CNTP_TVAL_EL0:
+    case SYSREG_CNTPCT_EL0:
     case SYSREG_ICC_AP0R0_EL1:
     case SYSREG_ICC_AP0R1_EL1:
     case SYSREG_ICC_AP0R2_EL1:
@@ -1639,16 +1640,12 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         return 0;
-    case SYSREG_CNTP_CTL_EL0:
-        /*
-         * Guests should not rely on the physical counter, but macOS emits
-         * disable writes to it. Let it do so, but ignore the requests.
-         */
-        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
-        return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+    case SYSREG_CNTP_CVAL_EL0:
+    case SYSREG_CNTP_TVAL_EL0:
     case SYSREG_ICC_AP0R0_EL1:
     case SYSREG_ICC_AP0R1_EL1:
     case SYSREG_ICC_AP0R2_EL1:
-- 
2.49.0
