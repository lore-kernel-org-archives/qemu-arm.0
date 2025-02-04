Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472434njb;
        Mon, 3 Feb 2025 16:23:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWBShW1BVioeoDitSMTbGEEpUao0VZ30IsxwnPPvPEdpA3FxJJ93BaDcG5S9Kjs/eA7S9q7JwXzKSsZdg==@linaro.org
X-Received: by 2002:a5d:588e:0:b0:385:f16d:48b4 with SMTP id ffacd0b85a97d-38c5209715fmr21748209f8f.40.1738628606090;
        Mon, 03 Feb 2025 16:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628606; cv=none;
        d=google.com; s=arc-20240605;
        b=LC/ICcN4sNZvoMXdPB1KRjS2KH2x+0XoD4gkaF7q5ZjYI6wp8pAobv9WBdlKUfHcJA
         Dm8KAeHgKOrYG447uCbq7LoAR7WA5WM0/O2i/9RdKKKfrhg1e1wQqdDMOJCBG9msYte5
         Bv/lMPbJhjjwYfbZJ81L6FA7IBxVqQdy8kY9XdDdm7Ax2rvATEXPoQ7f0jCI0FGarMCN
         1Sj6l0PEtDMjgcLwPQGzoQCyIKHlCV0B3rbOYhtkv5VQsbZ9kNUz7w1Gz1rAl7A5E9VB
         6x5ARIwApmaGILBYNRIFEjed3MvDnsPR6dTLKZvacLDVmyPnXBw88S84+ZPgNk8UOO7U
         hf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WpPlnEnDWFC/Ik2Y/thdSUt8XZtZU/cwYbfSseA7YMQ=;
        fh=/2XvTpU+0o7LpdMx7vMlxi5zJ0VGdesRTn4GG+XbZRc=;
        b=ZIYCbRVIgvFhFG7n5M6R8tc0lolWBeragFZkbGSUjwV2OW9ZcnaZ3EcWSt7pl27BDs
         lWF53TsGdf8CNVFJOUDdKFaYDa3Dkyp1EqBcpNaXqU+m54r+y5O+KFTqLSM3I7d3ADEQ
         PQwdMFYS6EF/+vbPA5L+cFj/GRqlRQe3vbNKqdY7yVH6f2D90swxeINLEBWAg+u244g6
         KhvLIxDrWm71L8uE3Gj1SOfvevnMTmXZSHo5ykkBFAB+T6FXCawJh1YSJkWiowGiHCaK
         mbc+OYLsUx04q40eKtOT94oMgx7pDW1hczOoF8QzyeP7l9C45apBEEEBjvPAqW3T2F9U
         1e6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RFkvMlhl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0dd5f9sor3881297f8f.1.2025.02.03.16.23.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RFkvMlhl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628605; x=1739233405; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpPlnEnDWFC/Ik2Y/thdSUt8XZtZU/cwYbfSseA7YMQ=;
        b=RFkvMlhlrm+RHGOnQ1rLvEuZ/PxYkO0BM4ScCojdISiR0gp/XhtSHXRgWHf2uAVBAm
         Vbc39YRhzjhD4HoEQEPVDq0BKzVtAgnRmCxsLXbIBbje3hAPeE2RmTCq/guYb6vg1A8D
         nR1REx+qv7bDDfVMQSx/4i5AuPiWpOmI4SAlKP2zYODlDYJz2zJ14Sz6001crzeW5FSp
         m5ZZhKvKMTwicR6YIYGREFTishyD/lqSGEn7U/Tj43PbVYj1AXejG4QgRQuI2hoNHHsB
         3sx/AZH1NquAeYT48jW2SmKux9MuQUq/U8WL7UVDo+OMvwC2bVlQ1D3UHjlK8iXIypmE
         rV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628605; x=1739233405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpPlnEnDWFC/Ik2Y/thdSUt8XZtZU/cwYbfSseA7YMQ=;
        b=ugDGZBa+01LnMEn+hU4FX7F8zg8FfcbHB/gXA1neC99LENgE5VIg/XCxxzhXtCQ4tE
         bzncX+5HKROQwpBxoKRDC/bi+9NgoG4YmCWkJT81+GLdgBgs/0mIdz4uolcwjMH558BO
         K6ncaEA5LAAIYUyTmMsfJIpNE8dCsmcU6tGt5DwTqlG23cbSklIAZtGEG9seNKs0ECw2
         0px0jjRfYNMuxPoV8iJoswMKxq9Li9CF7v3Zdb95AKJT3jbDYqitu4VztjjvtB71dY++
         FnqoZEHbGy0CgO1xYJFDziVDGfGfTCODKfDwoko3e+k7g9bc1qjYApkIGhI0fVKyHQ1k
         rU3g==
X-Forwarded-Encrypted: i=1; AJvYcCVqH0YPp3x8c6MnHQFTm3+iVszL3pDditX4V1q/6Nw97mt7qJXTvX4qySfrj/W1LPXzGEJI23mMUfK7wg==@linaro.org
X-Gm-Message-State: AOJu0YzarP75XkFFDdzNWwOONS8QpbQlD1U9RlJyNpreU6D/3AoWyb0C
	SLgKq/pmfbaoitrUcmPBy1BBu3BGDF+5/h3j7TaVh/O4z3zhdWrWMAzh2foRLWvWEQ==
X-Gm-Gg: ASbGncuJtlaq2VH1tvfAGWboBkk0sHoZ7hLd4WXlIydB9Ql6Z2tj/DxO6Ap5+LGv+ak
	GPMdUP5cBz9/D0blhLuaplRIRW0DLRh+I5h5aaARR6R4k7z3lpIOVWbutdgD9K0f8zj9/JflgbN
	F8w0U3EVq9xoxJN7+X1/wuOFFWlxTNYgn08VVufEDuzmmWoZSqYxOVgv8NkGioWaPTdEEwQJmDc
	fDNMIIz8GdqejYKE/EXbiiXOtOiGMLSrKPnC5tXzhv5C3fbPWoWUyhY6SNVPmZsBNMqaz3o9SC5
	8GnlGi6c/T2yctStoCvboNYx/P4RHbJgqXJA8yd2hQ/crznWV2wkBiyy8NVZG+3kng==
X-Google-Smtp-Source: AGHT+IFXxjdiX1jXLTjFtTEgAoBvG3NXn1OkUcQYFs5o3H1ayhaOYKZLsiFB8Nd03rQGcAki3/kgcw==
X-Received: by 2002:a5d:6d86:0:b0:385:df43:2179 with SMTP id ffacd0b85a97d-38c51967fd9mr16644540f8f.17.1738628605611;
        Mon, 03 Feb 2025 16:23:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f5a5sm175171855e9.40.2025.02.03.16.23.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 07/12] hw/arm/raspi: Check ramsize is within chipset aperture
Date: Tue,  4 Feb 2025 01:22:35 +0100
Message-ID: <20250204002240.97830-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tfQXtk0qqjIw

Add the 'max_ramsize' field to the soc_property[] array,
corresponding to the maximum DRAM size a SoC can map.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 68332fba027..d44277001ee 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -76,11 +76,12 @@ typedef enum RaspiProcessorId {
 static const struct {
     const char *type;
     int cores_count;
+    uint64_t max_ramsize;
 } soc_property[] = {
-    [PROCESSOR_ID_BCM2835] = {TYPE_BCM2835, 1},
-    [PROCESSOR_ID_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS},
-    [PROCESSOR_ID_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS},
-    [PROCESSOR_ID_BCM2838] = {TYPE_BCM2838, BCM283X_NCPUS},
+    [PROCESSOR_ID_BCM2835] = {TYPE_BCM2835, 1,              512 * MiB},
+    [PROCESSOR_ID_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS,  1 * GiB},
+    [PROCESSOR_ID_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS,  1 * GiB},
+    [PROCESSOR_ID_BCM2838] = {TYPE_BCM2838, BCM283X_NCPUS,  8 * GiB},
 };
 
 static const struct {
@@ -133,6 +134,11 @@ static int cores_count(uint32_t board_rev)
     return soc_property[board_processor_id(board_rev)].cores_count;
 }
 
+static uint64_t ramsize_max(uint32_t board_rev)
+{
+    return soc_property[board_processor_id(board_rev)].max_ramsize;
+}
+
 static const char *board_type(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
@@ -294,6 +300,7 @@ void raspi_base_machine_init(MachineState *machine,
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
+    uint64_t max_ramsize;
 
     if (machine->ram_size != ram_size) {
         char *size_str = size_to_str(ram_size);
@@ -301,6 +308,12 @@ void raspi_base_machine_init(MachineState *machine,
         g_free(size_str);
         exit(1);
     }
+    max_ramsize = ramsize_max(board_rev);
+    if (ram_size > max_ramsize) {
+        g_autofree char *max_ramsize_str = size_to_str(max_ramsize);
+        error_report("At most %s of RAM can be used", max_ramsize_str);
+         exit(1);
+    }
 
     /* FIXME: Remove when we have custom CPU address space support */
     memory_region_add_subregion_overlap(get_system_memory(), 0,
-- 
2.47.1
