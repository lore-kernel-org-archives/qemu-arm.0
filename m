Received: by 10.28.71.27 with SMTP id u27csp1055115wma;
        Wed, 7 Feb 2018 10:32:11 -0800 (PST)
X-Google-Smtp-Source: AH8x224nKgbTtx1DUG3WKNnplxkRdWwp2WOp1AbOe2zJikIXm5CVqP03z5zotfU/9NZFF+h8LOp9
X-Received: by 10.37.229.67 with SMTP id c64mr4682799ybh.131.1518028331680;
        Wed, 07 Feb 2018 10:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518028331; cv=none;
        d=google.com; s=arc-20160816;
        b=D71PHKlPcB0xl4wRQ4g9bWeqkFWBGvm50V+W84CSM3xKAZoZeJC5cPPhfJUxmYn4oT
         2s+RDF85IBdTOfP4YWQc1B8J1h31SFYzeMb9tMzuX+Tn5S/5Z2MOYCEVYwovkOAEteMA
         95icjxuuDcUd+IUi7jdsDCHEufQ4myhFd350MHgwi9nfBAtL0wv/UvvXKW0UqKJMhvJn
         RxMzC0daFOSUOllolPDvv7zD4l3pDpn1WYnStNatS6OGOIw+gmt3T58fMiVFC5u2rhK4
         I8lfN/9/I37ZpGeA4+j7VhJdgQMmQfshX+B/RK7+CXJJt1OzP3cGP32otG49kiCGVhg8
         LRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ock4UlQiXSIb1+bjGBvPGEVA5R9CjG92nk3F3M888HQ=;
        b=O49AL+Be8cr+jqvMwg4vR6SlYG0DQFCqLo/FSo7rsq97nrWHkPCpsYIxb51zLdwkbv
         MbZZxy59/upwqZ0Jg7i45pDLW0GepBMAtscSvV2hGFA+qo8IebckBb6Y8e0V5UYt9jn9
         KTb/JeB1KrRGYlfVWoyfrbj2XmzVhH4Eo9zIafxxk36hbos0SFhaYNUtWig+6RcuYc4J
         u8VY1wdHOtZcIIXY/vAzxjFp2UAuTDPz8orSOTOEBQSbD+02k3niNV1oNCgD/Bmv25w9
         KzjomXddCsA8RY2q8OqbGLVH7yhcFL41oXTCriWBjSr1VJ6AOb8ePGUx8xLjJTYTzx/7
         zkgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBVpUlu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si346435ywa.330.2018.02.07.10.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 10:32:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iBVpUlu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejUVv-0004ar-2C
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 13:32:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKd-0002Wa-3j
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 13:20:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKb-0005Iu-OY
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 13:20:31 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKb-0005If-Im; Wed, 07 Feb 2018 13:20:29 -0500
Received: by mail-qk0-x242.google.com with SMTP id c4so11990qkm.2;
	Wed, 07 Feb 2018 10:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ock4UlQiXSIb1+bjGBvPGEVA5R9CjG92nk3F3M888HQ=;
	b=iBVpUlu0bOBXi2TSqBfncNlqUFd4HI32OLq8w/mhdWqu6CdAhi/VfC8GT28Gxosq6P
	4hWBrA0/YCzCRtKtYcgzmw3l4qOZs1Vv0v7X3hp73Zrjs/me6umjWcfaeh4xxKbDa1St
	ar2Koe/FTgkN8Ua/fkPXFiblQKTdPJ9+KuDdn0bj+Jfruzsgd8r+AuhAqO3ZY88CR7uJ
	WBaQ0dT4TCSx0bc3ZCoKoA3ScYyKep1lSP1uPOilD3PoUNaphrwYoGbZuOvPh6aOyaPO
	xViAviprW5GX/9gSv/pWwCloDd6Zs6kNi2e01F4B05jvQCh56xV7Q+KdKG8T8DRfuD/G
	fLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ock4UlQiXSIb1+bjGBvPGEVA5R9CjG92nk3F3M888HQ=;
	b=APhHAcxPqOg3cFRJ7fRLP4sMOBVNcramNNeuHn1WmsBacOMFAAl5zYpqLjNQsv5C5O
	VLlKTSyu4axPCq+PfDoPjCjoRvNusimP7YgwqaTEnJqpGTUTXgRKCbK4p/1dNBo0L30d
	zrXid9Vwi29zdUg9R3aWEHX9BMQbc0lCw/tb7pGWhOJEgNQQSZNg4VTQcDM3bZIA44Zd
	eBno3boJFGgfa3IgNex1xiZKwzmgAtRqgzwfS1tHpM4351e+FtuwNXMtcOwZTRWrYzdh
	bARK0HWVkCEr1r9FtU0LzSYlZRBNvjg/BbVo788uk+TSQ+4dsd4BKKOAslpD8q9Bcp1I
	GyIg==
X-Gm-Message-State: APf1xPChqDj1m6kpf6llwL+XNlpdWhYujQq5oZQpHGUnL31xesWdkVgI
	V1djIpxCC8L7uGFHZ5wDZetYqxtH
X-Received: by 10.55.79.83 with SMTP id d80mr7529842qkb.339.1518027629101;
	Wed, 07 Feb 2018 10:20:29 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id f7sm1426248qtm.21.2018.02.07.10.20.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 10:20:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  7 Feb 2018 15:19:29 -0300
Message-Id: <20180207181929.8701-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180207181929.8701-1-f4bug@amsat.org>
References: <20180207181929.8701-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v10 16/16] hw/arm/xilinx_zynq: fix the
 capabilities register to match the datasheet
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y6cGAuxTwzyx

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

