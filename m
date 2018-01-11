Received: by 10.28.173.206 with SMTP id w197csp1010757wme;
        Thu, 11 Jan 2018 13:02:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBosqkQYybZurKaTuUH6cIDvM++oKbzPdJYtN9vQLG2F+zmzpNXcKHt2RUMl2jXPSGE8i6Wcm
X-Received: by 10.37.131.204 with SMTP id v12mr10369676ybm.240.1515704529933;
        Thu, 11 Jan 2018 13:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704529; cv=none;
        d=google.com; s=arc-20160816;
        b=MNCH7jRG7ntd2nMDdUnCQn1yIU0CV0dxEUt4SsVcMDYwGKRFUpj4hyMhdHKQFR27aY
         AL3ghflKvgmkXzk7fQO370K2fv8uwYJubPl0YJ9UrhZY0yX3jP15e/+xAL/QU3cXqURh
         S3MGvCcx+/QV8iE4kn/RaPAw0jmVevg62ptxNjNUZ3ltXJQe4rQTPWKaGjML8B1v05dG
         Zm31gS2dq7P5NAPGX7fSg/Mz9Ub9EG3afFvvymmc3oMiXibi/gEnYE2DmYKcwie5l3Dz
         TVmpRKAtUmmFgDLor7KpF3fCql8S/6scMT4v6qo+6VshGX270q/75L+Fb5JH7cHQpILl
         x/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
        b=Lj7He2A7f03pIdJWyXzdJTaKSin3EcPQFRqjRespnBPqBHV3mVhMGF1umf5r70BD8t
         +9iJ+5RgKR/ykP2/cfDuziq2iECa5wR8yEXngWoFpF9zZG2jVtgw0DmeDRz9Uy4+5Muy
         xFhQgJuRpWMAiaYPGGbQvSAZD3JJjed5vOmG0nQkx3rd3cZy20bUEfMUHzieC3bRxAVZ
         bJkTV2/oS+Z8/t8760UTZobHQ5nOBKTudJ5XZFI0dBVds/116WSg2S2y97KGKKiLnkBc
         vMXYTZpNzH4u1ujdmaVC6sJTVUf1LsAwNguBIEgadl+REmjU94tzzNj22Adu9rnpJn3F
         cqGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sF3IJ5ui;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x136si2362173ywg.452.2018.01.11.13.02.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:02:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sF3IJ5ui;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZjzF-0001pH-6e
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:02:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjv0-00067w-A9
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:57:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuz-0002rb-D3
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:57:46 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:42575)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuv-0002nO-8w; Thu, 11 Jan 2018 15:57:41 -0500
Received: by mail-qk0-x244.google.com with SMTP id q1so6075660qkb.9;
	Thu, 11 Jan 2018 12:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
	b=sF3IJ5uiglCzQD0ZnWiBdgqM5j0Smoh2r3catB+GRqC0nPGPBH8161unS031Mq0PvP
	agdsA6ZIh4fijSjZE40kzwUeI9nI40OdgLl8Kf+exP+MCSmvD8WNNrbBs7eX6YzNpS+P
	KbJ7pdjUUuRlpTf4GLKUJ/MpQ/8FSGlBOVEeX+2UbjBFG0PljFHSn3EYwzclXP3L4Oc/
	+v0zL0W80AuTXxoPmIxhcqcvNkbLU7ncqYdmEA3pg8vCLfjlqk0V69c86u8LxHTb/xCX
	zYvDbyPaIqb5RFZedYr7BFDJJ8Ie7nxTVFGVsE2UQNofDLVeEbbDj8whHzKCJDN9Hj2b
	Ipcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
	b=VFepkkwEuRJ6dDTq10iYsW9TNlQ5EpetN7hb3MFPbEC4kCoRKSjb4hjyQ3lv/po91u
	l9sa5X/LNwdCZGyufmnyW2vkm5qpj4VwgyqY0gfnu624/eKqSM1aBO8D/IwFBeH8Vh/E
	LpI9flJrPClH32/cXdAs4yQjFXjZ8pJdmuC669JAgebPwC7W7VxFz7V8gjFBzCHw31WV
	bjzxYX7r62Gy3Z7pTWef8xVZXQFKEj45A9PFHFOEJGGtm1APxQ4s6ar9hPIgEwvRq23l
	TOjJ7Nc5TXzl8x8+09q8P+C63Qb0qE5jBltp2HkpIBCPyyYlCoH2emzXzmo/Lg+gtSVD
	Vpyw==
X-Gm-Message-State: AKwxytdq3WAeMsYEA5tjSmUNjp4/peDQM4qzDq1e4smyYPMxfpWcbDIH
	HXvVYEJs5XFFRml7CHffQoA=
X-Received: by 10.55.78.143 with SMTP id c137mr34951269qkb.122.1515704260696; 
	Thu, 11 Jan 2018 12:57:40 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:16 -0300
Message-Id: <20180111205626.23291-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v6 11/21] hw/arm/xilinx_zynq: implement SDHCI
 Spec v2
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZN7L4ri153t

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xilinx_zynq.c | 64 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1836a4ed45..9a106db7b7 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -165,10 +165,8 @@ static void zynq_init(MachineState *machine)
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
 
@@ -247,27 +245,45 @@ static void zynq_init(MachineState *machine)
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
+         *
+         * - SDMA (single operation DMA)
+         * - ADMA1 (4 KB boundary limited DMA)
+         * - ADMA2
+         *
+         * - up to seven functions in SD1, SD4, but does not support SPI mode
+         * - SD high-speed (SDHS) card
+         * - SD High Capacity (SDHC) card
+         *
+         * - Low-speed, 1 KHz to 400 KHz
+         * - Full-speed, 1 MHz to 50 MHz (25 MB/sec)
+         */
+        dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        qdev_prop_set_bit(dev, "adma1", true);
+        qdev_prop_set_bit(dev, "high-speed", true);
+        qdev_prop_set_uint16(dev, "max-block-length", 1024);
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
-- 
2.15.1

