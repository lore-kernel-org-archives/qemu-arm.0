Received: by 10.28.173.206 with SMTP id w197csp2620512wme;
        Mon, 8 Jan 2018 07:53:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBos9Dk21+jV9eTthEtgsCfYmKOwccBArloUvLa1dxJ9gCFKoHRBoBu7c3DD8+NZbKiEisrXR
X-Received: by 10.13.253.135 with SMTP id n129mr3738960ywf.44.1515426821829;
        Mon, 08 Jan 2018 07:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426821; cv=none;
        d=google.com; s=arc-20160816;
        b=BWfYXOzoRPnbJg1VX/GgTiXTBYSv1vMCtSD9zhWjENiOCwew18oyOMloN6flVx0b7Y
         Jep5YRV0cEa0l+0vyRfU3B/5nv6Z+sfQzY/FsBiwEJMpmvvlvZEU5Hbz3ux+QPYTEXDF
         kSoLrm7Bqd//Bn+CspPPaKAMJ6lRteqJu9gOKIMnKYEi9OzDH0JPwubNus4WAIvrQKHd
         zaluFDGr6ok0J55pewrplgfIvFbznPaK1FuWAwCKi4ejVZDzuF/i1VDwzLhSWeveG+pS
         DDNIrF/+ja9rBACSODs6FP3kGtCUiMbTldPVO4ycKCdBKee0a0HH6Ys89mAqxIs/JYH3
         pxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dctjlJrLf/olfOPXWL5Ft0nhp9i7UsrVEwFlGfD+eoA=;
        b=b6M9QhCmv1LZRTM4ojiVa6VBs2foQx9ZogorLi0EdVbtHY/hekBxFd1L2GwKcQeeQf
         /mmBWUCFPA6SqC11/u5ZYAybIfOs+1gLK64iaMcUGSJ+VRXonIEFSl9ri2NutecKHlG2
         +nJw0KK4rnGEn31BWsodO8sDJ2eejyRb6nIhILDwulb/xluYLe65UR3CSKrOW6uXSjpo
         fnJ1vV21UPYCMXUFzz/YbVuRdThM10iziUrbnHXolNiEXvEuV4K04iaCWpkqij6gAnsk
         ag3+Vpy++qfvEObWerK0lFT98A6cWsOn7msBKH0tNH0PRnydLEYEsLSt2uPJ6t82gqCf
         x8sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KKaCCKSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x8si2541979ybk.126.2018.01.08.07.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KKaCCKSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZk4-0001ZQ-I5
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:53:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbF-00022X-71
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbE-0007fi-9D
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:33 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbC-0007eO-1Z; Mon, 08 Jan 2018 10:44:30 -0500
Received: by mail-qt0-x243.google.com with SMTP id k19so14107212qtj.6;
	Mon, 08 Jan 2018 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dctjlJrLf/olfOPXWL5Ft0nhp9i7UsrVEwFlGfD+eoA=;
	b=KKaCCKSLJr7NSOI6QZ72TsA+Rb1MA0kZrdi456ruSnsJqsX34UfBU60L4Q8a0gMRkl
	3Km4e5SDS7160fdjB8dSIEh6uIk+tpC21Itm9s2aRLrbSq5FmKD9OM77hetytuvW+H/q
	sFmUb/FtwSs8lueL+MWXp8Pkz98OOuVttKsR/StbLBAmD2gE4yVyXyjsGnRwMtDF6Pam
	5uPuPG1Lg+JtgaLvdjHED4Xwu/D0VYR0pxJlh476apRCwpRfJrN4X4fc+c7VFR5FupB1
	1yEkIg2z65c46EQMI3E3GiWqXUdN6eG6SothtIIGkd3HDX80AmK5Zmnlv2I0qeT0Oio1
	3kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dctjlJrLf/olfOPXWL5Ft0nhp9i7UsrVEwFlGfD+eoA=;
	b=S0kgObsw9M9R5TZQG3JyOHA+NBOqiHHez1/Ojj07j4B5byDqn3UH4N54yMpAdZ4Zum
	+/AWPpfEoKOoMJ+pPpR6bx/9plkjz3VCpL8gUUQvg3QK8veyrOPT6eWu+dAqGf5Drirg
	OqfmCtIonU9N/5wlKVtaub+CoG/q7Td50ohznwrnvf/nC/i2sJE/j9hZuwIaJiABwia+
	iJqs7b4Ii/bK/NL+kZFxh3z1nKEEkNecXMvxM+rltEzUtk7rJgHrDyE4xzTJ9ne341Et
	aoWhTzohZ5fevXQEYu4BW1uaEBYiijiax/0LLboqerqhFJJMJxcXgy5kXk1vFTmrT9Du
	mPiA==
X-Gm-Message-State: AKwxytdAOpiGuJyiaQNTJpvBzlO0KRvzcmyuGsP9Gdj+gG1ttONZ8QBN
	glz7VMyGmOWyewePpz0pmwk=
X-Received: by 10.237.33.243 with SMTP id m48mr16593933qtc.87.1515426269501;
	Mon, 08 Jan 2018 07:44:29 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:45 -0300
Message-Id: <20180108154303.6522-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v5 13/31] hw/arm/xilinx_zynq: use the "arasan,
 sdhci-4.9a" device
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z7TovEnOcfop

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xilinx_zynq.c | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1836a4ed45..55872d5678 100644
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
 
@@ -247,27 +245,22 @@ static void zynq_init(MachineState *machine)
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
+        dev = sysbus_create_varargs("arasan,sdhci-4.9a",
+                                    hci_addr, pic[hci_irq - IRQ_OFFSET], NULL);
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

