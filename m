Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5059543ejc;
        Thu, 31 Aug 2023 05:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdebJlSw/kwrOKxPhG8hmpvpWRn4OydRIMVf3OrLkvY+ppTzrWW+Y00/XNnCmSKQLte76D
X-Received: by 2002:a05:6870:8990:b0:1ba:2c95:a168 with SMTP id f16-20020a056870899000b001ba2c95a168mr6015540oaq.35.1693485628901;
        Thu, 31 Aug 2023 05:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693485628; cv=none;
        d=google.com; s=arc-20160816;
        b=JhtxI4Q2fyfyx3Gnbdr71IZCaanJ1ALFZ8nEaO6iQAjfLaxBdniLAmK/V4s6rPSXrb
         GNaDdMBu0p6CcsiUh5wvAk3mTDh/57PxJOy4QvxAKJzAt2CYvH41eFtZTJGzq0Uev93G
         eAT/AfXOhj8Pc2XT2ZSysQFHYumdKHc23LzBiWIDu/6K4mKYuQN5NBjE2H2of7xfyBDI
         fdMzsik8mVrwKAz0h6q+OhfKRLoFCJ0YwR8AJ/s5owZJ80Vhb7c6MTrdpqW+9M5hP8oV
         lLnS8PppHq5/3CKWJx7h/WruoiApdzPuzNpUEIOHouS4joXLaCvTbuXWIlbprFC5If1U
         fd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ON2VzY6yk0sq0uTEmjiWoXVWNkT2I/cR6atCGuI5Shc=;
        fh=ZmtjI5NZxuQHscZb+jg+lKi3cobjdKea+DPcFuQLEQ8=;
        b=O11cI0dfIxqGjK+9Nufb7go2Oi30FiBtENQlywtVn4pFVCQHMBF9N1tCZxJmIRlmsT
         bdaT94KCNy2RY5vvbto5utjyBH3Ezc4D+/NZD2riETo/BC/jsoyXtuXIUVyX6VJAL3q9
         venUYKd5HykHPhVZGKHjx9NB4npkPi1RMHDq98exr0cAwtIhmHVodBQL+OucWirdX4iv
         yQbz5Lf1A9zOStckt/l8rqxfNHmHVr/cKoFG8/796n5+SSkwfm8KnAqN7TnNiuotUVRB
         iEF9+hAEfLnsiIdTyDSBd2q4VNgt7CI8zAZoD5S6rEpbUut242l5Wr2WNoUPiYoUdH9r
         HNnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s30-20020a0cb31e000000b0063d8019d1f2si789509qve.448.2023.08.31.05.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbgxh-0007tl-6q; Thu, 31 Aug 2023 08:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxb-0007qI-Q7; Thu, 31 Aug 2023 08:39:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxY-0008Cc-UW; Thu, 31 Aug 2023 08:39:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rc12L480xz4x2Z;
 Thu, 31 Aug 2023 22:39:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc12J2Ck4z4wxW;
 Thu, 31 Aug 2023 22:39:36 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 3/7] aspeed/smc: Wire CS lines at reset
Date: Thu, 31 Aug 2023 14:39:18 +0200
Message-ID: <20230831123922.105200-4-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831123922.105200-1-clg@kaod.org>
References: <20230831123922.105200-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /SfdXYe5z2xC

Currently, a set of default flash devices is created at machine init
and drives defined on the QEMU command line are associated to the FMC
and SPI controllers in sequence :

   -drive file<file>,format=raw,if=mtd
   -drive file<file1>,format=raw,if=mtd

The CS lines are wired in the same creation loop. This makes a strong
assumption on the ordering and is not very flexible since only a
limited set of flash devices can be defined : 1 FMC + 1 or 2 SPI,
which is less than what the SoC really supports.

A better alternative would be to define the flash devices on the
command line using a blockdev attached to a CS line of a SSI bus :

    -blockdev node-name=fmc0,driver=file,filename=./flash.img
    -device mx66u51235f,cs=0x0,bus=ssi.0,drive=fmc0

However, user created flash devices are not correctly wired to their
SPI controller and consequently can not be used by the machine. Fix
that and wire the CS lines of all available devices when the SSI bus
is reset.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 5 +----
 hw/ssi/aspeed_smc.c | 8 ++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b922a2c491cc..cd92cf9ce0bb 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -307,17 +307,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
 
     for (i = 0; i < count; ++i) {
         DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
-        qemu_irq cs_line;
         DeviceState *dev;
 
         dev = qdev_new(flashtype);
         if (dinfo) {
             qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
         }
+        qdev_prop_set_uint8(dev, "cs", i);
         qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
-
-        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
-        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
     }
 }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 72811693224d..2a4001b774a2 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -692,6 +692,14 @@ static void aspeed_smc_reset(DeviceState *d)
         memset(s->regs, 0, sizeof s->regs);
     }
 
+    for (i = 0; i < asc->cs_num_max; i++) {
+        DeviceState *dev = ssi_get_cs(s->spi, i);
+        if (dev) {
+            qemu_irq cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
+            qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
+        }
+    }
+
     /* Unselect all peripherals */
     for (i = 0; i < asc->cs_num_max; ++i) {
         s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
-- 
2.41.0

