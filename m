Received: by 10.223.159.74 with SMTP id f10csp5537930wrg;
        Wed, 13 Dec 2017 12:54:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBovqphFC894Lptd3pxAXx/R1/mOhtaQNMX2VhX3bggTDfKc4+hJ3geBa1qg2NlAqiRxlVbTl
X-Received: by 10.129.229.14 with SMTP id s14mr2818983ywl.392.1513198479055;
        Wed, 13 Dec 2017 12:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513198479; cv=none;
        d=google.com; s=arc-20160816;
        b=onTYQp59PWLcmRv48k4JLz7fl5CmuqHSJjG31n/9oh1vh7MvNhIc/Se2zBNoW5Pg4S
         7WErCGmBHFMdelMmruCHRotlOTNo798ozFXPn1nHgszO5bLf3AASTUKoxTEQ7qXTGj+H
         tLZE2zo2XVkVQ0XiVrHY4PkizVo4tc8ct5mskr3msgrxYAWuH+G0oJjRx2proNO9oqsJ
         jMGu2zGMx8rZBLSJG8CxSVZ1lNgHyYVI1CFXBCGdd1aUvQW7tCNqNX9EPnmN2iwEeM6k
         5fd5JTt0WzQI2BXJF8UkP6FEnvQetWRfehFQjIVuFfmjQUpjgu0UtvTJKxY6y0wMrtC+
         GXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sO3kB1ctN8NFcmZjii81FfGWOyoLufxQdat3GfimeS4=;
        b=jbTK/EGoZSeeTeaEP/PmlApTVNYriflXs1kwJ2jLf+eQHajbSZ1Z1ujeyEgldD+egh
         JaibUnorsGNK4X5UHGyblcfcYHLka586aPDB16Tj73rcHv/6lGlI2gZe6CEWl8aA61bF
         b70L40WYSUTReHMDIijy4c4fB8vTzJSJ2XxVWQuvjlQayKd36sehiCWw+BzM5mA9L7Y7
         z+veas7V/G3+eXrdMThrFdm4fayomj3DbVKZvz0P2uGZLrCxzOfe7cS8khLZgZ6kz5tI
         NeXqTG6U+UYzArFKP4hleLkh3Gk1RovFWGAVw18XD5UMOK8gt6kU86vE+jJ3wmfbGqFe
         1gXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X28XX5w/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u84si493554ywb.462.2017.12.13.12.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 12:54:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X28XX5w/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePE34-0003Z8-GD
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 15:54:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDuR-0004ey-CA
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 15:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDuQ-0007X6-E8
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 15:45:43 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:41552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDuM-0007RS-Uq; Wed, 13 Dec 2017 15:45:39 -0500
Received: by mail-qt0-x242.google.com with SMTP id i40so5374723qti.8;
	Wed, 13 Dec 2017 12:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sO3kB1ctN8NFcmZjii81FfGWOyoLufxQdat3GfimeS4=;
	b=X28XX5w/DnumCWRp/8ImPJwCoMxmbCES575MyI/y/hK7AcHPwK0GvD1pVeFCFAsycP
	H5HVuzfcAHs0kS/t9NC6pb/wOAwqN3D06hwVjLg8VqwYLMMk1bCtVljhlzuOksooDtBN
	RgNYT7FTnY565neeWCBXny9NKghRWYkp8j5YpdNyKstgMXzWT/ptjwU9j8vCZyYItD1A
	felejYfc4+6LgFhjD6K1kAc+UfiHOIO/S6m+mlQ8YVHxtGONdXN5uGTuSjnemg/t4tdj
	8b3u7dDRcU8siIkp0HASfIXzRCFwEHAyVfRX5AovE6LEEdonFN5T3szDSeWdHvqrXs9R
	C+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sO3kB1ctN8NFcmZjii81FfGWOyoLufxQdat3GfimeS4=;
	b=TQKRz0uEGyNHKHV5r7OL6iaEtLRL3mpbmTaR1YjQGpE67AbVL0tP+Md8kdC/yFpmnD
	ZwfQ2taaYZKzCR2LXtyBZUDlcbXXCnSIPXFxpTr9tpZbBXXsmUoMprtWvT8wotwTUfUm
	yhvomJATtTZCD4HnXXDtX8HbNDFo3sBX1MKvwAoSQ45vCEsjy5ru2Oif+54Vxa2wmDOz
	w7UehvXtBZ7yrvNHZ0gHy3/hrEeJnuHryA8VsxPt+GjUoLwIqdcz520/XmLoUGp7eq45
	FMYP792yV8t8sagvRo7zZpirS05p/sRrc+fkISE63j989P/oqYDsE+ZaAfriyaesqEQl
	gfOg==
X-Gm-Message-State: AKGB3mJfcsR8GCQ/m7MX/xihs0QpdNIhWFx2jysp4BD5duzQNkHvaDDT
	TpuyVmOJXlaW2EWkPtvZL6M=
X-Received: by 10.200.22.210 with SMTP id y18mr12987095qtk.38.1513197938398;
	Wed, 13 Dec 2017 12:45:38 -0800 (PST)
Received: from x1.local ([138.117.48.211]) by smtp.gmail.com with ESMTPSA id
	n64sm1507938qkd.97.2017.12.13.12.45.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 12:45:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>
Date: Wed, 13 Dec 2017 17:44:36 -0300
Message-Id: <20171213204436.5379-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213204436.5379-1-f4bug@amsat.org>
References: <20171213204436.5379-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH 11/11] hw/arm/xilinx_zynq: use
 sdbus_create_slave() to name the different SD busses
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CDti/W/3Xof

Using the "bus-name" property we can now address any bus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xilinx_zynq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1836a4ed45..9275ae6daf 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -167,6 +167,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
     DeviceState *dev, *carddev;
     SysBusDevice *busdev;
+    SDBus *sdbus;
     DriveInfo *di;
     BlockBackend *blk;
     qemu_irq pic[64];
@@ -248,24 +249,28 @@ static void zynq_init(MachineState *machine)
     gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
 
     dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+    qdev_prop_set_string(dev, "sd-bus-name", "sd.0");
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0100000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[56-IRQ_OFFSET]);
 
     di = drive_get_next(IF_SD);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+    sdbus = (SDBus *)qdev_get_child_bus(dev, "sd.0");
+    carddev = sdbus_create_slave_no_init(sdbus, TYPE_SD_CARD);
     qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
 
     dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
+    qdev_prop_set_string(dev, "sd-bus-name", "sd.1");
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
 
     di = drive_get_next(IF_SD);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-    carddev = qdev_create(qdev_get_child_bus(dev, "sd-bus"), TYPE_SD_CARD);
+    sdbus = (SDBus *)qdev_get_child_bus(dev, "sd.1");
+    carddev = sdbus_create_slave_no_init(sdbus, TYPE_SD_CARD);
     qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
 
-- 
2.15.1

