Received: by 10.28.71.27 with SMTP id u27csp1034629wma;
        Fri, 9 Feb 2018 07:09:15 -0800 (PST)
X-Google-Smtp-Source: AH8x227lZustvrW6rny+1BwgeN9qUTBwis02KHd12fY5I8uFi54ZXoHhWqEgYvRStGAGpn+fYu5Y
X-Received: by 10.37.115.208 with SMTP id o199mr2069800ybc.212.1518188955663;
        Fri, 09 Feb 2018 07:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518188955; cv=none;
        d=google.com; s=arc-20160816;
        b=ezyhl9XhTlv1r5DIBNLspmHQ5Cb4M4BKNHRS2fyPnn4p2Dr3Ap6NpTqkcWlc8Rv3KJ
         fzYP/E9f5SvBnVAgh5xXjAgdFzo8iRvssTb4pwHYCfTas8pejiyvx/1ZYM/bDZ5VZ3Nl
         af6aBc7UdoOYLoOd7lPFYVs0EvJ+ewG+vxFTum416ndjAN5qaEb6KUEnI5XkOv2Qn+D6
         DjH3EKJ/DawSNk5fGuQEvV2kZQ7pZas3Q3gAWs9FDO+KfW99Hc+jj1RYmLYMhNbmv67e
         Pbj+k4P7hhNCebZJGYPQaMIumG//cgDYeyMkKFXqj4Q9mNIjfEBtgC97NqrIdbL6YfST
         X75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6I0eLeCnx4eW7xx/FEABgkNDEMBh/XvlA3Ez3K+OV/Q=;
        b=OOzfUNVYDAVBbfYlR6zda9ttBpPB1cGx49X0RJFgy9ZwATT3/8udA37z1gc02KvI+j
         TW8NIij/g4ApxLRrJayFHJb7cVjfLcwb7JW4KMk/DCEErZeW6etbVhReoFtY8oewH/Sz
         NT3W6wETR6c9mlACSqaLYN5U/Aa3SLPG9J+rryVXsllbtHPubJEHSreZj8vVLZ5vQAgO
         622BbDnu4O0N23raCGxGNvtbI5C6MaIPlsJOzqafwFpgLv7KIzi6GuQKFgrlTk84eIBu
         tK0XCqZrSq4NSlG3RN12O4BPIV0ioy7keIzO5e6x4p8EyWy663MNieT6EhOXOqlnV4MW
         mXuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rDqfizuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i67si435441ywd.256.2018.02.09.07.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:09:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rDqfizuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAId-0005Ie-1r
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:09:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5L-0002LM-RJ
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 09:55:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5G-0005aL-UT
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 09:55:31 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5E-0005Xe-5O; Fri, 09 Feb 2018 09:55:24 -0500
Received: by mail-qk0-x242.google.com with SMTP id c128so10273779qkb.4;
	Fri, 09 Feb 2018 06:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6I0eLeCnx4eW7xx/FEABgkNDEMBh/XvlA3Ez3K+OV/Q=;
	b=rDqfizuNjVrExvSn0QNf0SUJrYxB7xLebDQ6YTfbkvbcsUKkJ7HyA/rgDddZclFU/J
	xIH2l6d3tcuBGvUZfMws5GFwT6hcWH94K5jPIu6veLlp8VMDK9E5294rZnOJO7kB/iN6
	3cECc1S1jeln5bwyDqHCdSUc08M9CSWhYugThKowb9lEeN4o7U9O5aV1kU034mjeLBZw
	E7VbPVAW5UPI7U8mLQykN8y0fujFsr7KWqsKSe3pMD138YY4lX7LlPBxexJHkuo1jImJ
	h6ZFH5D9Tsfhu9/oQeDUYHNSgUe8nH1uit/AieaeWrM/pT6WV9g++wIncNyYnYaCTQv0
	+Bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6I0eLeCnx4eW7xx/FEABgkNDEMBh/XvlA3Ez3K+OV/Q=;
	b=UzLnbhsogDf2m5HSlFX9XdrVFMe0Ru+of72eno3r+Ay6tT6UO1/XowOX6DLBSnOCjD
	TwZFW7uSPfQD1Oo6Pp6XFJgUptRA+kPhr1tQlNQQwFFUcXmoTgc7v35ZceF1C3i5+frw
	4/S0na+6cnRrgkh3eIuOh8izRu8iZySJQSj34ZcXF9T1TtU6EVPNk/d9Pp8L3aaX+obY
	zOU/VyTdSlMDFYuPcZm/MECA791S/9/JnQ15Kbt8jSMn+MHMQ4+eqCLusxuHsHWj7z2h
	UpJj7aJa9M9wBbHkEmLuC/LH7wCjeO14zWDGR4kWGkmQ9dtaZ/EoOV9PaV9oB5ZUNX7B
	u0Sg==
X-Gm-Message-State: APf1xPDyJIzMZaSlmOUf0OQ5bpK/+yQFFla5V2aZ2CncQLFem9MGJYyq
	XZKfuwcjrMfhOEGWA12H/wz5bptm
X-Received: by 10.55.215.132 with SMTP id t4mr4422220qkt.64.1518188123528;
	Fri, 09 Feb 2018 06:55:23 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:16 -0300
Message-Id: <20180209145430.26007-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v12 16/30] hw/arm/xilinx_zynq: fix the
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
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zfUcebeEx+ML

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

