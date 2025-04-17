Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp511700njk;
        Wed, 16 Apr 2025 20:13:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrtMT2XJdeS6GoBJaLpslcHgzoeHLx3bnLU0zS+6jl/Aq+L7DP95LjqIIQf4z5r5nmI+ujTEZPiwqmXw==@linaro.org
X-Google-Smtp-Source: AGHT+IG0tNG2c/n/gzxZIRZGjJHjBIOpptwefZHL0SKEIp9K+wCDhtPobUrTKkrMHTFg/NvgA3zE
X-Received: by 2002:a05:620a:198f:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c9190852dbmr623595485a.57.1744859633345;
        Wed, 16 Apr 2025 20:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744859633; cv=none;
        d=google.com; s=arc-20240605;
        b=EeHsf831qggtEJ0GcWjiEGvqA22q0GQ8t6Hd/Ffmm0nxQDPhHDcbQj2Cz9SvpWnOEI
         TikLJ0STd5cUqi2xhsj8vPDd0p61xMS16mp6eYBEUrJxBM5uUg4kYPBnB0efrQ/huNTS
         BY2WtDdrxUPHYiFcGLqhcKR0hLyoZk+j65ezDTIaChRHsBmNOkV4adQJah0ZE3p+YuhK
         oqZguqyycNIEzkoXLBvsN8cGn/tLmDauGMPkXn8BqcdJIcxlwI8kU/W089enOTnr58V+
         z/58ukZgN4P1P6GTJryCXTl/9+ToGABg8FkUsNUX3Tag1AeERs8aRDJV8AFvSddpQTqY
         1JIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=4I0OHooL4f2at72YuHJ9BnmB90xYcNZDrSevD7YEJvE=;
        fh=mYa7DW7+LcAerod9KMiSdtH0/D1NqzuZXE0uoAi0+1E=;
        b=bpAv0W9pl/ghb1UP07TAiYAiyMWyeewwpuzYuoqg8ISslDk3ZxsvfFYfD5XvEAb6YS
         2MkWxFU6vRF3U47+FXDYbEH3xJEckqtBdRujxgt3oiGaSGv1m0xzAkzFvWPIRrj7Zxwe
         cENDiPoPbf2uKkekLueGeCNiXGTg2hPpeUJq02X9G0FH3csmapmo0RqvIa2TfUCiZkQ4
         23gNc8FLybJCJ20ueSjET5LoLhKSfNAXT2wYB+vsleRnxUZYURqC8a3sGmvrAm4oJH2k
         9wYXkYPuj9BfzfbtzaVaF/O9SxUDOSVOlEj07/hk98kS1hpxjhkSojOeaxPhyIf6U3hg
         XxEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a895deedsi1465385185a.146.2025.04.16.20.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 20:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u5Ffw-0000un-4w; Wed, 16 Apr 2025 23:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Ffu-0000tb-EW; Wed, 16 Apr 2025 23:12:26 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Fft-0000cO-2Z; Wed, 16 Apr 2025 23:12:26 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Apr
 2025 11:12:10 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Apr 2025 11:12:10 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v4 04/10] hw/arm/aspeed: Reuse rom_size variable for vbootrom
 setup
Date: Thu, 17 Apr 2025 11:12:01 +0800
Message-ID: <20250417031209.2647703-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e81mZdLOezdW

Move the declaration of "rom_size" to an outer scope in aspeed_machine_init()
so it can be reused for setting up the vbootrom region as well.

This avoids introducing a redundant local variable and ensures consistent
ROM sizing logic when both SPI boot and vbootrom are used.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/arm/aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e852bbc4cb..b70a120e62 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -381,6 +381,7 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedSoCClass *sc;
     int i;
     DriveInfo *emmc0 = NULL;
+    uint64_t rom_size;
     bool boot_emmc;
 
     bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
@@ -475,7 +476,7 @@ static void aspeed_machine_init(MachineState *machine)
         BlockBackend *fmc0 = dev ? m25p80_get_blk(dev) : NULL;
 
         if (fmc0 && !boot_emmc) {
-            uint64_t rom_size = memory_region_size(&bmc->soc->spi_boot);
+            rom_size = memory_region_size(&bmc->soc->spi_boot);
             aspeed_install_boot_rom(bmc, fmc0, rom_size);
         } else if (emmc0) {
             aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(emmc0), 64 * KiB);
-- 
2.43.0

