Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253459njc;
        Thu, 19 Jun 2025 06:15:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFTtK3GdTPad/CJf9THtP07d0i8mPRIpbt2XUmoiuO1VearhtNfaiCNsxNWcVZZlpP9d4J/LC1cvQ4mQ==@linaro.org
X-Received: by 2002:a05:600c:3545:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-4533cac150emr190731465e9.27.1750338903280;
        Thu, 19 Jun 2025 06:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338903; cv=none;
        d=google.com; s=arc-20240605;
        b=O+3epedM3HtfV2EGwOauPxUvCQWqO6s1jsYuXxTHvhxBImmxLYhCO2IqeAReWWmdDL
         riTK1XUfdJZszZLaa9d4ZUQE27BLAD7FecHQ7JzPgXdGbz88LdMp19T+CUSBbslTj/7J
         aN6xjV/NTg2PbR2fBRh/JIMCqrfxAE4Avo8WURtsMFGO5auClRLjYi0xIE81gBPR8RMz
         Yf8mzYOt5v7ucTAVoD/TiYui0NU5gRR7eMcAo30TB8ssMip9INjRt6ij0BG8W6j0RHNl
         Iv8lM81kzx8Cu/rLvBtjKYG+6N+VVsk2w4wF3oBl+HWI/4H03PoTFJwhOjp17D/rezYL
         kkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZOrY1FO5kcbv6yzuU6OsNlHS46/lwsOolLM8hoDx0Ks=;
        fh=gnGXSq52tGpBTybB91aUsl2JnqchkLavOIdkbPIxbZg=;
        b=SEe2Wry2UpIpkskkNHyFaF6JjwMHtTkK87ISPRxX880t5BSphnqsjI5wl2sZXmG+1Z
         EpIsqQKA3Q1S8urPeG+GJD/DFJRBLaQGQtSpJTtjyITSYvRfEP8gLcIt109kskp/yCni
         XT6xgnxjBsudAGaK6Npv2cJkvVUr/k+m0fVTts3/6sU32Lyn2DlOEyt3S2BIHUo3fgXA
         HbIPE9Wp0GYl1UIMm2H9brdA6GC+YoAinJ5c3b1GVNgALmQw7Z+4CrEHwZ+qO3uCmfTo
         7VXninlTgbFCVyPJcHV60/5CdJZuPOw1lzVYVaYMhIdXRgXH55dv/iAb0j2ZUzBlQdTM
         5pCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UZFa7D/X";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45338898b44sor62559055e9.3.2025.06.19.06.15.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UZFa7D/X";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338903; x=1750943703; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOrY1FO5kcbv6yzuU6OsNlHS46/lwsOolLM8hoDx0Ks=;
        b=UZFa7D/XI4y3AfRcbbH38wQpU4fiiGKgax98kijXbWQFoQW/NEO66QCgFgLe81otIO
         It7/RqKSoUukrDbINf0jM7xOaQ8gNceLscCqrCAYttSopAw/fGhVSSSCLwDWCB6M/7n/
         +hBMhdZQaCxXJPW6aZmqI1TiraN6N0QhXUeYWXgNdBPJxOcRD9oePFYp3pmtEkxbrPIX
         yIAIDdFxVjpzZqC6N5qz7DNK3UxFBV46JwMNpaAI6Y23aPJ0tvaMa4zDRCSUN5KQmCQQ
         WIs68UvsS9qu44tkQimaahELvOLI4ylsai20mVvMGQIVaUbs5SSEAMotpSICw/GHI3LU
         nQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338903; x=1750943703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOrY1FO5kcbv6yzuU6OsNlHS46/lwsOolLM8hoDx0Ks=;
        b=DpO8by8h1NftOoZWLru968HN+YWtgAZjOBpFRS+yCFaFk/Mg85bqquWRBmcum0UB/+
         gW/DTdAMWfTZISECOKMwi32JRwB7mTm/ux9gMPDVvhoxjz+YUYZAVJ7wQduA0irSbeDX
         owqyedX2GOwKin+ZgrHg5L+Tz+RV22pE9yTZ49SuhUWdoBUv1sNiVecUWuMEXIGZSRQd
         OLQDTUZPteaOfGOtT/PanaTy4TxTHGlmr6hRbLJuQ6Q22RxcuChaoeDdu0hqCt9RviyZ
         NV7i2NEth+joX9bmQwGmbihbbJxtcajgBfYn8gdVAN6I+tMw8BlwmyhlSQxPVvrFim17
         mCpg==
X-Forwarded-Encrypted: i=1; AJvYcCVPMj+R4wqg1m/qEV7zL9oqvkUJ4o74y1HpIo1/60ltdNGyfYdYjZP8c8HfTfXJ713IgrFxF82JxpMatg==@linaro.org
X-Gm-Message-State: AOJu0Yw8GRNo2EFKt8LZiIAkl3iUNmG3krWjOOt/om+rJFMfVLP9JFpc
	EeCwGYe6jIBtckYIGyqTDY8IQbTNdWB2X5rFQAn61LegDdFafvVN5O19/N53kfVpQiWkNw==
X-Gm-Gg: ASbGncuipYofd7d6C8FpTdmN1vNvHLC3rfh9hIGA1HZI2mvJKwxNkI3OjdbE7w+3SPo
	8pFxBkqZ4zFRxX2H99tx2MKXLQR8wr6T3GV0QMn6slXzwdwz2OFF6mNS7nyVtPzn2bue9m52P5g
	cBeTPcwvWlU9aJzqGX+tQfMIWJ5iqaZcqTplRdhcDWRDpl8pmP+msOqhYpGUW1IO4nNgTRkXb1S
	hPlpwXLOP50mrVDf/IkbTv5c7fs0mx+87oDuJy9OMWNFOZZX8EbqBNNWqHsf+cc3PXTERHhCq2y
	lw45BPA58+db1wwK/7Yoj7fhT4j5NTae4YrfVpoy1aKJRheg3XcIbdhWEYKH+ORZ+ibZKVRZWl3
	Mup9dZkrwTjNMybQoT903wybg1nL82kuQmNIN
X-Google-Smtp-Source: AGHT+IFFj/4N5XELq/kLhF7E4qci2bJJhqg8HElhpm3KcUTcYoBlJ+rjYJOiQKm4H1fVjPvPjGO1Uw==
X-Received: by 2002:a05:600c:a01:b0:453:6150:de41 with SMTP id 5b1f17b1804b1-4536150e073mr16395235e9.17.1750338902687;
        Thu, 19 Jun 2025 06:15:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8bb6sm28841155e9.25.2025.06.19.06.15.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:15:02 -0700 (PDT)
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
Subject: [PATCH 19/20] hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
Date: Thu, 19 Jun 2025 15:13:18 +0200
Message-ID: <20250619131319.47301-20-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: spfSv08ekwHK

Define RAMLIMIT_BYTES using the TiB definition and display
the error parsed with size_to_str():

  $ qemu-system-aarch64-unsigned -M sbsa-ref -m 9T
  qemu-system-aarch64-unsigned: sbsa-ref: cannot model more than 8 TiB of RAM

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index deae5cf9861..3b7d4e7bf1d 100644
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
+        g_autofree char *size_str = size_to_str(RAMLIMIT_BYTES);
+
+        error_report("sbsa-ref: cannot model more than %s of RAM", size_str);
         exit(1);
     }
 
-- 
2.49.0
