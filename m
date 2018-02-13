Received: by 10.28.71.27 with SMTP id u27csp677079wma;
        Mon, 12 Feb 2018 20:19:41 -0800 (PST)
X-Google-Smtp-Source: AH8x224jvqvhO0LzEKr3whwj9CigxPrNP8B/H+sxHFm70asrWCbV8cjV28hn5KDodaUimxoW+TrV
X-Received: by 10.37.96.212 with SMTP id u203mr3873142ybb.17.1518495581204;
        Mon, 12 Feb 2018 20:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518495581; cv=none;
        d=google.com; s=arc-20160816;
        b=mZHHCj+baWo5h7LyhmcwY8sLBhqUoeRHXpBneQW9m2t32gb8pKzTE1W+ZuV0Ia4Opm
         Po19FLliuMeuUzaiMfW7dBctKOJxTfSOFhfZqghyBBLWfyXTYQu8mC3H/RMuMB3i/VSP
         1SId4Y4Wn5MnJT1MC+rOuYUVjBWcFEMPGwXBdfjJPPBrq8rwOnTs/R+ffZK7GDtVA+By
         ghY9icUpciIukbWwjR2Lqtwa5kLvI/uQVG/UKfDET2utiEBkTxGdAyR9NYTexZY+2209
         Bmuyj4xwcDYyZZyq/2wkcwdkwjr+YHyUwyLDSPWB0/e7G24SfrQy00RCaaOjq1AExW7h
         XHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6I0eLeCnx4eW7xx/FEABgkNDEMBh/XvlA3Ez3K+OV/Q=;
        b=WoXfs1Pr/3dvB7E7sh7a+6mCBtEay9xhhYRDtZHqhQoPv7dqftvuwRobYkNWaLYyU7
         xoOqaP2dKZg47k3rYkHUTjqzVU8QlAeCKAbF0RB8NoJmhYOl0w4A22lFJ1R3vpk1k234
         pLna3PrPGgSMlkp6+8m6Kb+ePHjg9fbL+YKwCGKq1XkGEGGbrr81H/7PFncXmmP3Jg6z
         vRcC69eRA/VueUcgPuG3bgBbWM7U0PWANsgSHPnYuMYjhZbPIzVN+CKwNJtLZb8pWnbN
         m460Hmq/CrH293Gri7UUTgUVku/mZzP6MeUYc896ylTBMi3uDDoMWno6dlabOz/O7tba
         DqCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j9yA8RV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s63si1763860yba.752.2018.02.12.20.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j9yA8RV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elS4C-0001n3-Fi
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:19:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRu7-0001GY-AR
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 23:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRu6-0007rf-62
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 23:09:15 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRu3-0007qE-FM; Mon, 12 Feb 2018 23:09:11 -0500
Received: by mail-qk0-x241.google.com with SMTP id c128so21065666qkb.4;
	Mon, 12 Feb 2018 20:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6I0eLeCnx4eW7xx/FEABgkNDEMBh/XvlA3Ez3K+OV/Q=;
	b=j9yA8RV7Ko/lrpTp31+xiCGBcv6NNSvB93jDgLiFaRcJmZt9uChe2llie4InDlrTBO
	1oXCsPTA3oVSxcLj6BTPxRKfj59jg6UkKbTshZLc1TiydtL9gruCBbrzr590P8Z15Jwq
	wjrqIVFJpIRRJNwbymqsqX4I0w9fUou+NCdmeXZFouTxDNM3qI0kF7ozHthlgxE8FyOv
	RpwxQiyS8kMC1rVMu1Q0ala/TXCitISp4RsKlPkyOkGvOiqAqHpdtwkvFCNXXegCZqAA
	K/v8Y2cuL4KLVsbrDyZ9tiNiBXqZAY8nsxyxOXfe9jQk/rUP+Rv4dt3OdGcVRD3ebugw
	5OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6I0eLeCnx4eW7xx/FEABgkNDEMBh/XvlA3Ez3K+OV/Q=;
	b=cuVo1W+MfC1zgpR7DY+ak3PBqecPT52HNqvkJnBCvMcctQBXqEU+q6sJlMLFDOwM3K
	DbnvG6vTqmcYnP9sxCo0m7koxCEMMIRKrCZDvATH3BKC63DyEQZfp/PFNXchaFP7+/HI
	Peo5EkNNOs3tBMXKtZKtaRyIOm/PFY2/PrMtmz5/l0qJ/vl25QpgT1c9A1QyLlgGwLsq
	7r+UGlExfOD52OpDNcObnhAjaidqSJuShHmaRIG1cykqs8X2q9j8/2a+2zJJ+JxjKCYd
	bFdt8V52mlPOAhg3VUk6j5kSNOxWAiC69lN5J+T9VqSxTXWcm0xC+y8xYhC8+t6lcOz2
	+m3g==
X-Gm-Message-State: APf1xPCGYhzjRjKyzTTdcji9A9cAZppf1TLJscpemzExGF8G+2G8GFWX
	uLDZ9380Oo/iHFTt0o38wJ0GoEAX
X-Received: by 10.55.24.34 with SMTP id j34mr17325123qkh.294.1518494950894;
	Mon, 12 Feb 2018 20:09:10 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:07:55 -0300
Message-Id: <20180213040809.26021-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v13 16/30] hw/arm/xilinx_zynq: fix the
 capabilities register to match the datasheet
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kBxZtDxHGveT

checking Xilinx datasheet "UG585" (v1.12.1)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/xilinx_zynq.c | 53 ++++++++++++++++++++++++++++------------------------
 tests/sdhci-test.c   |  5 +++++
 2 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1836a4ed45..0f76333770 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -61,6 +61,8 @@ static const int dma_irqs[8] = {
 #define SLCR_XILINX_UNLOCK_KEY  0xdf0d
 #define SLCR_XILINX_LOCK_KEY    0x767b
 
+#define ZYNQ_SDHCI_CAPABILITIES 0x69ec0080  /* Datasheet: UG585 (v1.12.1) */
+
 #define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
                         extract32((x), 12,  4) << 16)
 
@@ -165,10 +167,8 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
-    DeviceState *dev, *carddev;
+    DeviceState *dev;
     SysBusDevice *busdev;
-    DriveInfo *di;
-    BlockBackend *blk;
     qemu_irq pic[64];
     int n;
 
@@ -247,27 +247,32 @@ static void zynq_init(MachineState *machine)
     gem_init(&nd_table[0], 0xE000B000, pic[54-IRQ_OFFSET]);
     gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
 
-    dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
-
-    di = drive_get_next(IF_SD);
-    blk = di ? blk_by_legacy_dinfo(di) : NULL;
-    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
-    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
-    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
-
-    dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
-
-    di = drive_get_next(IF_SD);
-    blk = di ? blk_by_legacy_dinfo(di) : NULL;
-    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
-    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
-    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+    for (n = 0; n < 2; n++) {
+        int hci_irq = n ? 79 : 56;
+        hwaddr hci_addr = n ? 0xE0101000 : 0xE0100000;
+        DriveInfo *di;
+        BlockBackend *blk;
+        DeviceState *carddev;
+
+        /* Compatible with:
+         * - SD Host Controller Specification Version 2.0 Part A2
+         * - SDIO Specification Version 2.0
+         * - MMC Specification Version 3.31
+         */
+        dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        qdev_prop_set_uint64(dev, "capareg", ZYNQ_SDHCI_CAPABILITIES);
+        qdev_init_nofail(dev);
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFFSET]);
+
+        di = drive_get_next(IF_SD);
+        blk = di ? blk_by_legacy_dinfo(di) : NULL;
+        carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+        object_property_set_bool(OBJECT(carddev), true, "realized",
+                                 &error_fatal);
+    }
 
     dev = qdev_create(NULL, TYPE_ZYNQ_XADC);
     qdev_init_nofail(dev);
diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 24feea744a..898c43ff4f 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -41,6 +41,11 @@ static const struct sdhci_t {
     /* Exynos4210 */
     { "arm",    "smdkc210",
         {0x12510000, 2, 0,  {1, 0x5e80080} } },
+
+    /* Zynq-7000 */
+    { "arm",    "xilinx-zynq-a9",   /* Datasheet: UG585 (v1.12.1) */
+        {0xe0100000, 2, 0,  {1, 0x69ec0080} } },
+
 };
 
 typedef struct QSDHCI {
-- 
2.16.1

