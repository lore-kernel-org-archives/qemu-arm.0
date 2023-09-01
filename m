Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496495ejc;
        Fri, 1 Sep 2023 02:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Jf+rnqxO2feI6B2yGRqxq+JnRCgaaYE5kkI4Il4nym3NwBikk7eWmoUEA33xj5lSncTV
X-Received: by 2002:a05:620a:2091:b0:76f:456:3916 with SMTP id e17-20020a05620a209100b0076f04563916mr1871434qka.43.1693561481184;
        Fri, 01 Sep 2023 02:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561481; cv=none;
        d=google.com; s=arc-20160816;
        b=TgblQDiamm8bQ8X6nqna71vBLXUl4oksGU64YKaoI84ZuBinXTJBRrJ5fXTH+gluyU
         JhuV4Ge5gdIS87rSEvyvlIxzlqO31MFrbyBMidn8NJ0s3jozqEPm0ScpLQRTYWkT1F2r
         AspQAKc39/ZYwC0vMG6f8f662BPgv1iZhfF94Ix3PENmYN3GquiofYh8smByGtjzJvSX
         zfqLjNGGC4+Wqvc4GSaE0jbcbsfy4IitUkjxdT+zTDh7QnitTbjVWUi5wRxUVx4urgod
         WkRxA40aqXOT/pPtkmun5bUbfNO92zONCKY6sLSOj6uE3gTwe680ceiCzUTPbMxSaZD/
         V1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ON2VzY6yk0sq0uTEmjiWoXVWNkT2I/cR6atCGuI5Shc=;
        fh=mvgX9fHDajzR32GFB0oGHVCpUskYzLFjgR7dhiEaFlU=;
        b=oBBD7KrolYm9Sqwl0USyBkTBH7HpP4ZEkBpifnz8HiFFNCho7UmRINVTNR8hUDDsEu
         wQY4HzT1THKxPibtnc4dtisz179sGB3Z7fnkkge7MoE4bGNErfKeyevzYKi3E1NAYBxl
         QhYMCwSnHG5AOE3u8P1u6hm57g7v+2bLVQsNYIJeEqSXH8EARpdkKHPRr484+ldJN/ts
         COH9wAfdUqp1KjUyPeyy1LSWDngx7OWi3lq1UeNqe+FwQpQChwOvY5ts9rYRvtthVwi5
         76EWoGkOYWVTVu18s0jIqb8ddeASHRNxOonZxfJAyPfG27LjNHe0lsKxgNzjUrw59dBJ
         LbpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pz19-20020a05620a641300b00767dd2ffcdesi2055519qkn.149.2023.09.01.02.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc0g5-0001u0-8D; Fri, 01 Sep 2023 05:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fx-0001mK-Fq; Fri, 01 Sep 2023 05:42:49 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fq-0002z1-Ov; Fri, 01 Sep 2023 05:42:49 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3g2bVJz4x2Y;
 Fri,  1 Sep 2023 19:42:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3d61yTz4wy9;
 Fri,  1 Sep 2023 19:42:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 08/26] aspeed/smc: Wire CS lines at reset
Date: Fri,  1 Sep 2023 11:41:56 +0200
Message-ID: <20230901094214.296918-9-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: 7RwJUo6LD9X6

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

