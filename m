Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5180810ejb;
        Tue, 7 Feb 2023 02:08:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+yQ9P66txafopHbZKrb5b1cFDXrVcockP9eTBCs020zIsHvi/C+4xgha9MtgumeIh/U4RM
X-Received: by 2002:a05:6214:622:b0:537:708d:3ff6 with SMTP id a2-20020a056214062200b00537708d3ff6mr3456007qvx.25.1675764504946;
        Tue, 07 Feb 2023 02:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764504; cv=none;
        d=google.com; s=arc-20160816;
        b=k6NRJXe7R466OLh5GVsn/PYEUe0flI9ZA20tf2OV1m+YORYppCVz9bWmnLqDzvlPjx
         CQYEg6B2+pw48ycqrIycb6Ty2T1gFZx3Ca9McNmM24z2qhCEk9XXEokOQ6TgRkMDmh+W
         tXM4MNOCowJtUtbjKufe/9bOYWTtMsw2LxpPlrG2o+IJiVcYJ2kSPtWtT2N/t/65dER5
         sQb3CPtev9YOCsPYR50LDvfCcyzOM9Ex70CDpMd3LDqiDa3CGPLA/RL/qdPf5zllz6om
         Do8So8tAFMsJFIwx1nEBwNiilu9ygFbgmjQK4e7sFz3GLxtoST13oQd+bFM9BvqZd38I
         trZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=xdIR+94JdJ9nETQd/TF0YS0NjjAXQS7a+hbEjd+SRiM=;
        b=qZ5EssbO1rcUtEbEJhE2BBOxGSMfYllvtK//DJbPFWHLi5G2+lB10n1qr7O996LyOm
         cjsTPvbb4DbcEeUA0R59vxx4ovWgb75MZgj2cblCie8YZm0vPkX+bTYk3gtqz40BkuH9
         CcVmzOIiAINu4JVPJkLSzR2+Xl6zWAfvJ9CKIQHLqXERvGCf+wNyaiue9pm5EW7Gsrzz
         F2n/na6UVrH0npG81NB+lXo7l3h4xyhwE9VapG4IolbD0LzfHIDZlhHK3gc7LufgSiT0
         /WPWuTCYTgdSAXmp47biFMYuHoYBDqvSbBRmhQn9NEv9QaE9q6MvolRl6lvTW/ewwj5B
         DFFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a0ce38e000000b0056bfa655111si4165832qvl.27.2023.02.07.02.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:08:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPKta-0000Qd-PY; Tue, 07 Feb 2023 05:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtS-0000P3-Ge; Tue, 07 Feb 2023 05:08:06 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtQ-0002M8-Fe; Tue, 07 Feb 2023 05:08:06 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zMw61fzz4xxJ;
 Tue,  7 Feb 2023 21:07:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zMv0Ynjz4wgv;
 Tue,  7 Feb 2023 21:07:54 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/25] tests/avocado: Truncate M2S-FG484 SOM SPI flash to 16MiB
Date: Tue,  7 Feb 2023 11:07:21 +0100
Message-Id: <20230207100744.698694-3-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ocxZQKuAcudQ

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The M2S-FG484 SOM uses a 16 MiB SPI flash (Spansion
S25FL128SDPBHICO).  Since the test asset is bigger,
truncate it to the correct size to avoid when running
the test_arm_emcraft_sf2 test:

  qemu-system-arm: device requires 16777216 bytes, block backend provides 67108864 bytes

Add comment regarding the M2S-FG484 SOM hardware in
hw/arm/msf2-som.c.

Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/msf2-som.c                   | 5 ++++-
 tests/avocado/boot_linux_console.py | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index a6df473ec9..7b3106c790 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -1,6 +1,9 @@
 /*
  * SmartFusion2 SOM starter kit(from Emcraft) emulation.
  *
+ * M2S-FG484 SOM hardware architecture specification:
+ *   https://www.emcraft.com/jdownloads/som/m2s/m2s-som-ha.pdf
+ *
  * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
@@ -87,7 +90,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
 
     /* Attach SPI flash to SPI0 controller */
     spi_bus = qdev_get_child_bus(dev, "spi0");
-    spi_flash = qdev_new("s25sl12801");
+    spi_flash = qdev_new("s25sl12801"); /* Spansion S25FL128SDPBHICO */
     qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
     if (dinfo) {
         qdev_prop_set_drive_err(spi_flash, "drive",
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 13e6688624..258f2ee897 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -400,6 +400,8 @@ def test_arm_emcraft_sf2(self):
         spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
         spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
 
+        file_truncate(spi_path, 16 << 20) # Spansion S25FL128SDPBHICO is 16 MiB
+
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE
         self.vm.add_args('-kernel', uboot_path,
-- 
2.39.1

