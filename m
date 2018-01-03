Received: by 10.223.134.117 with SMTP id 50csp12241372wrw;
        Wed, 3 Jan 2018 10:41:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBot9s+N7CspwElZjAXhGJOSTTsfIC9sLErTKO1uNzTInO/qi/1cZ2zTM/o+szXgtA0GjBszh
X-Received: by 10.13.214.79 with SMTP id y76mr2091470ywd.157.1515004873006;
        Wed, 03 Jan 2018 10:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515004873; cv=none;
        d=google.com; s=arc-20160816;
        b=AgGEuftoPC1srOP40KOn6s7POBPqQ/tCRVsr49yjCpRPu+3Es5RbOmgXPj0BnVeeeB
         5OEZLwa5AN8VfawGbL2NgIhHw22ko5KnUTy5/nXlDJBGawHplrLPpENPSOY7EL6hDSjg
         5LbYgeSZ9H2ZPd0FFJ//sjXgz9eyRQBzwFOMRb8eLMageNLS9h2W1uCqYy+t4NNktCzl
         uSHZNtFcQc0rtoan8uNLe2CZw4I8oqiEtxufS5RP1153QdVzz7wKwIN7QuIgZvNZJp+u
         +cKSuTfRmvQTNKjvb5BISQdSQ2YTWi0+b4wCzwfe8AQOW+OKrZUGedVG0kyQ1X3Br7C4
         Nh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
        b=F95t95/p6c+VhmQz/fuovureEXk8rwvrKAhGB+FM7qnRGx7sQ65MZEBIJ+cBHRhcoL
         Z/Hl8QeycuthM59vnY85g82KxWafvyMqVqANB8EyoWLqqXp/fltZWrLiy8Q8tVuPhx88
         6LMc5sVM8NS7nwRxhQzhZRfZDYGK0phtbUfeKMCxslB9BElDDuV8yQpXuxjrcXYW3W3N
         utPeCx0lWqOPxZhRfmJarbFxpie7UREX3CseQM3nO7c09JYjyM3D+F4WZS5Z46Z/YjTy
         6gJjvqUTsVf3VN0C4NR7O1FxXCyB0gSkpbVfZC++nRf38C77B+SRnkILWs4ZOUzd8w50
         zr9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ntd5PpxN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si341603ybe.241.2018.01.03.10.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 10:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ntd5PpxN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWnyS-00009V-DK
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 13:41:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsT-0003LL-5U
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsQ-0007S2-6s
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:01 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsQ-0007Rv-2O; Wed, 03 Jan 2018 13:34:58 -0500
Received: by mail-qk0-x244.google.com with SMTP id g123so2660738qka.3;
	Wed, 03 Jan 2018 10:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
	b=Ntd5PpxNi49HPxh07DkychvVCh9xqS8AwZ2nflVX2QUkXQx6I5rvvLTQI0rf/VMOVn
	L8gbdFgmEocqohukhR98ow8bDmwhjY5wfHzJ8hYX6Qg+ryFkpFJ7uNC34tI6iM0+aEbo
	iVDkimq8WEzuCNHqLtohvprsFRJkEeKuE0YQgNlHw0G5cqY/eX44sGJuOt3BNZ+DV4rf
	mqJQoEEjiVFO0N2ltR9IW1Es/mJXxEPudAyV8IND8HFfFBzvjP0vyV5URXcWpC6qCzNn
	v9YR/JqWy01XDOo/6ZegNu2OUlbNWWQh+7RCLCV5LrBGSgLRGp+OLMSy93jDlL09nBAN
	XzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
	b=PvDpQ5ojPCKvgqcZFsQEuJSlvl1dGBkj69k1e//gevZtVxh+IBHc3fv2z2HmN8e3UM
	+eCV6xAWji8tPnxE23vEdqqy3v79eoRwEfJt1RjXAcausXBtcAfkpbInqXomZCUuRWQB
	dlK7ngT06gLe/k15a9aIBWroPwqrCPDdvuTkgP8qPDJNemSBTwETHlEyYHsqPRAbkxow
	Txxo4BkzNLUYTXn2aPo+T618ik5XCcDXEheJuOs+EZGMRJOEUcuR7UPYXc5/kBq07P56
	XEdsl3sdVI3SpvehW4NaDKDIlXFPloma+Rm0bobGd2dFiZ/MIKcacgNzPTjLnSSE0A2o
	2qHQ==
X-Gm-Message-State: AKGB3mLiRB5+kTHx6lua+koHsrDZ3bRMUch9eRCRHwu3nSjYbdvwL7ou
	rfmcAYc7mw4cTuP1Nv9+aBY=
X-Received: by 10.55.44.66 with SMTP id s63mr2992644qkh.335.1515004497570;
	Wed, 03 Jan 2018 10:34:57 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 185sm992854qkd.1.2018.01.03.10.34.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 10:34:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed,  3 Jan 2018 15:34:04 -0300
Message-Id: <20180103183418.23730-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103183418.23730-1-f4bug@amsat.org>
References: <20180103183418.23730-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v4 11/25] hw/arm/xilinx_zynq: implement SDHCI
 Spec v2
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gnL9UO+U35W6

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

