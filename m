Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877871njc;
        Fri, 20 Jun 2025 06:08:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnujvx8kAz3C5CYwKhjT/Nd39OnpUz8eJjOWN57uMIgK5nQiqIK+p0v0wJshhH3kFzwPJhVMfjAlrI2A==@linaro.org
X-Received: by 2002:a05:600c:3b1a:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-453653b043amr29958165e9.12.1750424889281;
        Fri, 20 Jun 2025 06:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424889; cv=none;
        d=google.com; s=arc-20240605;
        b=Ff/kegM3Qpe2VO2YWtRwq6cFSbfxnLO9psws+6G9dX284yPYJuiIhze7OLAFm1svWz
         1DsStoaGtudL+jcdgH855Z19Qcp7sKEte6rmfoHaDF1IwCP8VeabnjGDWPooystBLV+A
         63g5bSVDIryOVEb2N5NZRQMMaLBXlLz/QvTAwJjNkgFVlYQFFnGejPYB93494EjQ5rvh
         pq9AjvFHZ/T5Z/yJZwBT6SHV4Tq/dwLpL6z5jMR/WFZSagAnWywPGuR1xeryG6DLcbSi
         tvqmRXlQXRcqTTvyUXkRUHks9EQh47DyE6oy2TwkQVttP+wyM1/1A6sigO0UPaye4Itd
         a6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gcjg3QhSmhnYtUxzgWM8ifLgGs9HqCTQt/fl8y8J7b4=;
        fh=AYCBdKD6UaV0zNjhgPpx1OsqQMU+gDhD9R3xXDV+r80=;
        b=QrbWIdsp2tRjJcAvuyKo6bHLB2w1w8PJIhJsq2CZ9JfoIuAWxQGGB5/YsOFjPPaDuL
         wHaTAo9zIEacbWlnjLFx4HfqnfmoBGJcaaLl5C62CTpp0vHTCYYt74c2/QOoAHmdqLUT
         RqIRR1xcKH97USALy1z4emZRw0DvEAvMgLJTYirbTb5ik1Ueadp6ubdYyBb+k+MDdk6U
         zPagTj9gLbqoF82idBRBPFK2JWiVJOixA2y5H/C89QVqIH8nS+sIkpVZkvJpdLiWIF8l
         wjBIUXeDGPpAbsLWpGUOp/AlNtZGFYlDL6Vt6BZbdJ+p7z+bT3WlldcSnpJdRuQeTOyN
         LbHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=edqYg4FJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453647070e9sor5490635e9.9.2025.06.20.06.08.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=edqYg4FJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424889; x=1751029689; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcjg3QhSmhnYtUxzgWM8ifLgGs9HqCTQt/fl8y8J7b4=;
        b=edqYg4FJkXXfH/WqEzlxb159JqjMwFN2NFCGPdFEZhpXF0/lE6VmPi1an8C5TSRiLQ
         k54gee6m2rfzn441x+W2dMowuKpDxa5S5+E8NbkmmzuGpiWxqTOvZu9pxL1s9ZpUwYCB
         sM7NSAbaCRtI+iOz0bCv512Nb4ATl59MMXk6opqlDVhvZd44q0DRUYGzgOrY2buM6UTt
         e3RTEizAOc5oXUUuKIhVKqAGF0PKoXh5TSG9r3fDw2x5t0tfBYI+EfP4+kAUN7X6nSUL
         1TwsO04y4USPLWVuwx+6YmJgTRMFBrM3crk0//BJHeFkyHP4YA0IeSYb8qrim/fy5/Un
         CZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424889; x=1751029689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcjg3QhSmhnYtUxzgWM8ifLgGs9HqCTQt/fl8y8J7b4=;
        b=YzOqkjleTYjbfkjEe+iEebGjkTJp6bynsq8/mXaiDixwNCDA84xnouW0FQcF2M7HWU
         6dL8TrgjtnxJyPLHrSqgzEHNdBfQBa8iYi88z5kQ0vgE8It1OKnRCY0ZLVtfz8g2aWsW
         ZhG7rglwBP/NFF7fypv5ve61/nhx/wu3cc+OokHZDWO46ODuCM3FGLv3tojVylhjREtc
         NktUfO2bcqimZFH4gmJQMEkNpPwJcwo37xLzDUV76nZNrvusej8z6/ygOEoTNu3m05JE
         bBArOY8miiYy/sTpxrRnyGHi18XzAlsbIBG9CUM+72tKu+Y6LjI/4eGZKJQt9zf3Lh5H
         HjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyPG7AOB3IvvgfzOQDkHx4qpCvi2FGNtX6tcG07TQCJB0uRYrWwoV/qHVFndnAJxt7AgKXEmp0V5VX+Q==@linaro.org
X-Gm-Message-State: AOJu0YwTFIqQqY9MDoSNyDpG7sToeC4nyeaBFM3waUfnzhcLyKmebGX5
	GhYKrAVjq7a94b0TIv/52iUqgHu9a5JEuVHNnPwicrivvOAd/tE/bEEkkZWroFP7NtjHWA==
X-Gm-Gg: ASbGnct8Mr+W1y1ApdzaeGkMmZgSm1yw9ta9cyC/5ylikt2u58cKtQj9bF1fFk8QW+1
	8eZ9FRecmtrTlXROJsSKblAIquBsyH22jUxnCfpsSUFSgx7+0yaxFEpjJrtHT2mYFq4m8RXATa+
	RcYrspvPMehhd8WbAnXqI4wvuDhXdfKL8ytsKSqXFI46gp3apfpbHrV3YSD+I1DoAOBH9igSh9g
	fYyI5parnlHLA2IkRibUFn9JnMjt6WGxu2/fjly+1dTyfhKQM1VKVM3nhHwyPAwEmrHPKtFjLQh
	h8NjLql4AY76T+FqBk96oPUOCmt9OHe+8BZAVDgWgzKvrJRSd0OQUAySvnhTUF+0psppDzG5TYD
	cUvHuXB9CHf9wxQL2qCaCadjHpEUt60xrD4cx
X-Google-Smtp-Source: AGHT+IGlMawwPYBTI6F+HQ5fZwO6wtFZQ3ofGqTbh9NR6Oep2MJV2fe7y9qs/PunxZNaedQy8sLILg==
X-Received: by 2002:a05:6000:1a8e:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a6d12db6d0mr2328685f8f.15.1750424888138;
        Fri, 20 Jun 2025 06:08:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190d13sm2038186f8f.90.2025.06.20.06.08.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:07 -0700 (PDT)
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
Subject: [PATCH v2 10/26] accel/hvf: Model PhysTimer register
Date: Fri, 20 Jun 2025 15:06:53 +0200
Message-ID: <20250620130709.31073-11-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kMA0ImVY50d4

Emulate PhysTimer dispatching to TCG, like we do with GIC registers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
