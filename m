Received: by 10.28.71.27 with SMTP id u27csp2301021wma;
        Thu, 8 Feb 2018 09:01:51 -0800 (PST)
X-Google-Smtp-Source: AH8x226fbvMr96akkmMXbj3fTGCwjArgeD2D+UtiDTCIV+nz7Bi2uN3WBX/25N3U7dUg8b/wpKMc
X-Received: by 10.13.206.4 with SMTP id q4mr1064794ywd.150.1518109311866;
        Thu, 08 Feb 2018 09:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518109311; cv=none;
        d=google.com; s=arc-20160816;
        b=yHVSEvPiPtglwcRjSwQ9QMFTsPf51zNpmRF+5+WOpUHQPO5FOG3kbItT5kAsRYefMo
         50pSCg/IzUfr7s9MqmLXP8LzfXFwwZBgzpjaBmgJgoEaQ44KsJ8VP2iX522qi47/+xMA
         2QysZ6L1syMUwwgT/jgVuzqxHMvuwgvTGMHnm8fEBvmT+vkxJHBbaUJZdo7Sd14NBx+A
         G0cZ58PAaXYApDqiVU56efbgBZjvAghIcMyGHRXlDw2fNq/GW61OVfi6NIVidMIbPmqv
         TmDB9geo/4YYva/zSatp2j5Urm3B5C+LhDFlOBQgox3QCkBUvPBoSmUOowqv8duqQM9o
         t85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ock4UlQiXSIb1+bjGBvPGEVA5R9CjG92nk3F3M888HQ=;
        b=VWWnPLXPh2Ryf9pGUPUgetiA/XYXO0Olluv1GguNOER7GvR/kefEo/I/IdpfgP7+cz
         bLdvrdV1uJkyWGuLcZthOCJZVXdaXaScD/B9fFaiAQ/13cXBJO+maOMXl+YbRgdWnVd5
         jlAhhKwzQ4bEkNTvvk4beqsS/1u4A4GRYL2d/usW3SjphKOZm/qWGLgIIqPAG4e+fG/K
         Lsx20rnGdDykyO+E8VRYu2c5PhO10KMG0frfDK2z7UMew4o2ePdYFvQGUv0dMPBrF9fu
         cET907lY4ENRUnQreLAIUnmOTjN1svRTBkl69ggfGKN0eKN+Xw0tNl/baY++nPoiWsA+
         vLng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gL1Pr4NO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 187si65158ybg.202.2018.02.08.09.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gL1Pr4NO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpa3-0001ul-6o
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:01:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpO0-0008IN-Kz
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNz-0004Eo-No
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:24 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNv-0004CC-Cm; Thu, 08 Feb 2018 11:49:19 -0500
Received: by mail-qk0-x241.google.com with SMTP id c4so4137140qkm.2;
	Thu, 08 Feb 2018 08:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ock4UlQiXSIb1+bjGBvPGEVA5R9CjG92nk3F3M888HQ=;
	b=gL1Pr4NOc1mEnQTEkiNCcvQWYlgBqkNCJha1w/8N55wGIIxzqHAWMw7Mbxn9KX6SN5
	S3IUJpyW5PY3FORTtHGA9z2mDZINEzQjHbXwl/Hkd/IBLaVVVEelNvNRPiyRUiqMWS6T
	5TVo1iegP5U3vvh1d1rFhbk4565epxp9hdpOWN0wecazD4GkTVvtwEc/QrIPy4/oDYFO
	fVfepo0Pho7XfyDpv2zTSj1lbwXMIMpgZH2n4oy1ML61jp0Lw/Qmvmsp+Hd9scNRbn4N
	NneaBHNV5QLhyz+I9AYHPwrQq7J3bkLBw7WbMikGj8c2flWP2hOo+ko52KxVgqc08fAy
	ZzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ock4UlQiXSIb1+bjGBvPGEVA5R9CjG92nk3F3M888HQ=;
	b=Tz5bL3wdN9/RPNpan2Ya6LaPZ8Mw+W25y7FG5/ctafPdE+OzxnZDwiPUfwVBrCbiuJ
	H5cMOIyA9p2f0mnPkduUGJytfbxQZg3jBUZkpX9zmEH6WzUlVF9+HOnjR9m5CWYdr9Lz
	IiP4iC7qpU+1V5VsMMzQyRC1LJI6BNkbk+v/QUwca8Wq+k6/4ISBsgAZcaiMgyGJ+4cl
	K0Avjerhe6Dl69YQoo0jh3hsYDYlgHRY59QEktml23ni/pCIGcQWtUkmtF/8irWngSCp
	WWXlZg85l3TwukN3VPBAQ60k4+10mc3Ck4vUWysoK1dIpcio9+XI4esfSEtEoGNgVtZi
	tnpg==
X-Gm-Message-State: APf1xPDeK73Ke3GLpS3tjARYqjFlYqjXoJRCXatdLz+4plS5RJJBNxE9
	8VGZ99OfhXprZwapOHgSBU8=
X-Received: by 10.55.137.132 with SMTP id l126mr1830880qkd.295.1518108558768; 
	Thu, 08 Feb 2018 08:49:18 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:04 -0300
Message-Id: <20180208164818.7961-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v11 16/30] hw/arm/xilinx_zynq: fix the
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1J6QS5Uk8Qyt

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
index ee12c4be7b..3f3370e224 100644
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

