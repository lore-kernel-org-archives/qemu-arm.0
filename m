Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878843njc;
        Fri, 20 Jun 2025 06:09:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGkmSlInNmGCa/ZwPUTFArmeedIMCtq0Nk6D6CyfWJsCU0uKmHLxpHcYSAF2AkMyOukQ3RM0cKVbB3ww==@linaro.org
X-Received: by 2002:a05:600c:820e:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-453658ba2d7mr29921715e9.18.1750424957221;
        Fri, 20 Jun 2025 06:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424957; cv=none;
        d=google.com; s=arc-20240605;
        b=a76us30JD+V6fUrqHGNMVqUJ602l86s+j8nOKTGVi8bZw5qif8vW8uwYhWJhQNixzI
         s6KteakWshOD6EYDs42dPc9/kXo6HEjxFy4qGu17Kc75SRJJDiZ7jHdb+onWZj2KjX6F
         fwYZq9JWY5wfna9qSTFLwVab9IbzsIXbSkU7N3n87GKDe7Eb45jV8/lGUozZXi6nmA/s
         ZDrk7XmpLVlFHi9/00bt0ePuMo3r5HO56nYw4eVP8UFKQTuJ5tNNVtld31SjSbPCcb0w
         2ayBywBDFSEPkqJQAJLO4qO6otAQpcTkdIbYiBd8iQrs2Vjihv/vzj2jW595iitEFwW1
         3t3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tlzGRKm85UWY2+8yyhfs+sQBrY+hIXBP3ETvuuIJ2dg=;
        fh=oJQkS14vHlp0Tru1tvjoU6dVt9OI3wtuX0Q6Elexq+A=;
        b=RAA8EWjqtlvSVscWuFFQeOGC/t7uXBKkAxJTqOy+ETjMh1tjKXLbXQDhxkW8t1hqRU
         qz5XxEfTTm4ZNkCk8Mo14tFIMrnNh6JxR28T8rai/aikctXVSvWQhqBH3X+gagTaUkHi
         US1Ciwfi+LvQWXiZvejEq1A3v1uIc4U982my8Uz+iy2L/MLfoj5p1fm/iB98X0K4JplY
         KpTSE+CJU1o3/wbLc3dKfqxV1JmsJfXzrjqwDYSmTx7O5HzcCHgy4vB54O6bWUgd6TRP
         B1zBxc1PbPqHPNtgwClpdDzYUZam7/26PkeLjVWz+ddu1cd8Bx7nbrmxyFj4iSfLVGHg
         QXZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4XDJo1H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d1156436sor780988f8f.7.2025.06.20.06.09.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4XDJo1H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424956; x=1751029756; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlzGRKm85UWY2+8yyhfs+sQBrY+hIXBP3ETvuuIJ2dg=;
        b=N4XDJo1HZir+hPVMw2qLzMjzYCfBnmkesZCYA0JGCUn4v7UcjsLZxQEScxHSPYSCUT
         L46FvCe5qrGVYh+rpf/WUrDP7/eXCzEXzdc/cyKvhzUEsxQFkz3GQRJ+/ceGIY1vo+jJ
         S2mWn5AxhAdY7AGBf38rk77bqCw1UFgX13EXeItskph6pebI46mHL7PaNMlE2Bbc8q34
         DvpkQtDO/jEMBZ/NPiH65ZGXgefmR8lm1YSWDcmTejFIgoc+FNO/KZaTdG5qJywpV1nY
         nKxaS0d+7XRduCTIc+E2vYYIKa2Q6MJdsVxA5EVl1C7XF2RM1ExYLEva9r1VbUJhNlqU
         9QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424956; x=1751029756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlzGRKm85UWY2+8yyhfs+sQBrY+hIXBP3ETvuuIJ2dg=;
        b=Elqfs5dnLd7DyfsGhVjD/s95OT1/qFr0emCKUtXLre075tTLNeopmeBWD/MTPoDkyl
         R0fQ3+4OChVynwALaZczM+udBzSGo3QM7V2cVlImOzHi7ax5GBMiGo9W9MVjCcWBSpt3
         OZ4NGWmG1YAgLrcwcXhCLBl0ywdM7AllKTqLhn1qezgELX8w31vAan9frutbluGuDlNl
         /u0qDAaikTuuwXeA/IF5+KsOGBpmnR8b9QpqyNq2KJv75trWZMbk/gtO8SBnSjQ2zwvE
         EYKfxOBRdJ4VeCb8PtAnGGv90K1wcpkIGq5PwLPjiPqNtfS6EIsnGw4mKgeHwUaeWVoN
         ZQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw59dfOBKLWPJklvAXrGzNFL2y+hRA8TdTN9qWSaCHU+LkjthPBdrc+2lmvKcagZwaKLXWeSmFUfpYiw==@linaro.org
X-Gm-Message-State: AOJu0YyOgKH4Qo5wU1HAy9Ju3Zd4QcO+4NbWyiMNSqRye7acAubw1Gp6
	5Ie38GP/mRLiZfTKz+7NIMDnvm3BLshQCdWLmf47+8OAJYIpQ0Segfq3gpZZ7n4Af7peGg==
X-Gm-Gg: ASbGnctR63kOujzURGxjQA/b1R1JbL6+KkHTPqNle6OrUfP9a/DVGvGeA/Pjk+thpqD
	Z0ZrIRpcp2WWUjYVQn2xix92mQW+gUgvdKX4tEtGIGweyJ5ut2kLqFTOEjs5n1nQQp/ejvJgFEy
	wNrV9cYeQPLKoWLX/9qOnNQAiL2/UnlCV+V0VEHP+0XNlfAwhGLSWfOnYwOyiLPKPorprMv9OyQ
	3o42ldKSx4PU1R2BPgHXMkQOtKv2+zpyEch6AlOUirQPSK2fZ2MQjk1eBWw6jJIqExdj4a+pvuL
	PuHlAfSphcgdNvreFXHSPfeW7ByMsjOsPargmn9rF+HHmeEZD/YIz1Epvd+jm9UMVpiX6O3kMK9
	APnbYwXKQDrQoKdFqgZtdbEL7K7Kc8SrPp0Qn
X-Google-Smtp-Source: AGHT+IF5uD/3snOQ4X+aLRPk1Xt/Xd4ZmVTTd6N1+20oIyEGbROy1hmGwi9rA/PwtOTLyfKem3s2JA==
X-Received: by 2002:a05:6000:248a:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3a6d13129c6mr2233188f8f.51.1750424956479;
        Fri, 20 Jun 2025 06:09:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d2236452sm1791926f8f.59.2025.06.20.06.09.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:09:15 -0700 (PDT)
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
Subject: [PATCH v2 22/26] hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
Date: Fri, 20 Jun 2025 15:07:05 +0200
Message-ID: <20250620130709.31073-23-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YjFrdWtZb3h4

Define RAMLIMIT_BYTES using the TiB definition and display
the error parsed with size_to_str():

  $ qemu-system-aarch64-unsigned -M sbsa-ref -m 9T
  qemu-system-aarch64-unsigned: sbsa-ref: cannot model more than 8 TiB of RAM

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index deae5cf9861..15c1ff4b140 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -53,8 +54,7 @@
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 
-#define RAMLIMIT_GB 8192
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
+#define RAMLIMIT_BYTES (8 * TiB)
 
 #define NUM_IRQS        256
 #define NUM_SMMU_IRQS   4
@@ -756,7 +756,9 @@ static void sbsa_ref_init(MachineState *machine)
     sms->smp_cpus = smp_cpus;
 
     if (machine->ram_size > sbsa_ref_memmap[SBSA_MEM].size) {
-        error_report("sbsa-ref: cannot model more than %dGB RAM", RAMLIMIT_GB);
+        char *size_str = size_to_str(RAMLIMIT_BYTES);
+
+        error_report("sbsa-ref: cannot model more than %s of RAM", size_str);
         exit(1);
     }
 
-- 
2.49.0
