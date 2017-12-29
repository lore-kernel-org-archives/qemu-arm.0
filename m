Received: by 10.223.134.117 with SMTP id 50csp7013243wrw;
        Fri, 29 Dec 2017 10:08:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBovpXNEShyxqpBMA1hp+/ztLVZ8jZUpPMmx3/ctN5lIuLUjT84t66XzzLF5Q9ugsE27orjPS
X-Received: by 10.129.124.135 with SMTP id x129mr24895796ywc.509.1514570936652;
        Fri, 29 Dec 2017 10:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514570936; cv=none;
        d=google.com; s=arc-20160816;
        b=boIixfOncW7RadyMzRuGDsqmA8zEvpbb4UvazKBKErDnDNTAgvwYzDu7vdv5Q1TYup
         NIDATlv/U4aLVNLvyZwpaDW9ap7XQxBmZkfG5XJYgX469Nm/CHUH0IPD8Bl+McPXhGxN
         mFIq4N4bZq7pgUKq11fF2Xx07/y4dQlic/pgVSQf2UFlcbGE4zFTooj0Ib92MWBxptkL
         JJfVPaNYqc6gQsEAUkzfNjdjOemWYBIBgqNaF/2YuUjTFTbdt2IJWVo9XC93xNBqVaKd
         PFOIgouZ4TLpKpAT6/biauqWRXPBHYDFGO++KlaOhwR6rPGeX3HMJbFtcU1ZoAaGAhce
         13oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
        b=xa/bz5psRwR/ATaedDFI/XHXuxeuGGuXB3yNvo6NRMNewJBFixCE2251Ba0nI4tG4R
         8Dj2qZfNmsStXmKl9BniQWsofNzW9pP5bDTSWtjLQNOV8iBadkVXxBzmlJLgGha+0Bij
         tVD7ErX+spLR4LGENGF8oxDQz/dPjteUfJ08McFqEshOjRfjL9N8WnFD4XtcGKO0WRYl
         Yy4ACyjzp00j74FBbkgxbGQKFFMThtvE5u5A7sytjyuwpk6EV9Hk9N9S5LO+X+UQOM21
         sYsnc8zSQiYXrcEjM/v59211t60xCxdfS8Du/kG6soMT8t4fENi4XMI8lQvhB9+cSgWR
         QgsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xa05MEsL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204si4135192ybw.352.2017.12.29.10.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Dec 2017 10:08:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xa05MEsL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUz5T-0000q5-VU
	for alex.bennee@linaro.org; Fri, 29 Dec 2017 13:08:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoJ-0003si-C5
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoI-0007UF-8X
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:11 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38447)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoI-0007Ts-3K; Fri, 29 Dec 2017 12:51:10 -0500
Received: by mail-qk0-x244.google.com with SMTP id l19so19374453qke.5;
	Fri, 29 Dec 2017 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
	b=Xa05MEsLwIB1ud2EkO9CujvXBHOURSQTLFB5TANpE8fzO5Gu9IPOFmUlW8LKZXpoyn
	fxJVND5bdRP2XST7aR1XFe6M++5u4vQC7DP7EsMh8Qh2i5DUmPwKsUM+/NfzhkMCerZ4
	qOKKq3HZt0aIBbF+py0JZjnl/yrgjewFcGIbGqXmP5C6pShdC3AforspPvVMHWyw1tlK
	+UUhfBb+zfN20ZUPTUfmR1917dbwZEWv5q+Sz+PlWY4ZBEC3XRoivVJkrtr7AnGAksok
	F3LNl/D2QlmZeopoCgDr3GsS2vKhuN8sABYvmTJuGV1OE/FP1z6h9aVSopfZdi2RcIxn
	WX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mjN0Xl0EufeX2HUblzQO67mWn+xDOBIs3L51QY0wUGY=;
	b=IokVP2/IU4Crxt9EoOV7lMWhRfyXOQSVX8NBgo3UEbLf/Fs/9e2wpWurdxavEvHgLF
	LHZPrzwOiDelCM46aj7q/glx/JGKWfC7Aep38DJRCmoeASOyjPpSezNHhK5aVRkYydOZ
	gHk5EdOsfhiTnyCD2ETnZEJBHNlo5dwoGe+Wl0YbRGKPfQ9RR4Aa6M4sSJY8JtdxZ6bi
	tDZXa5g05U73UTjjTncR3tQCCdKJXwe4a/L4cCePhsBYWkogP8/vP7Z11nXj3tGWwVnd
	WyEMxmH9kGzO3sKqI7cB4rFc0d5zlBAhSn4YMFfBYHwOnYd6JtalG3w046wvLONaSUex
	jfew==
X-Gm-Message-State: AKGB3mJjUR4sw1zVjt82d6CWSGAOl1JY20zDjgu5+AjEl+paEdPU89fy
	63tnkvjXfL3CRq2AHYZZLh0=
X-Received: by 10.55.93.195 with SMTP id r186mr44634356qkb.77.1514569869479;
	Fri, 29 Dec 2017 09:51:09 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	t41sm24223893qtt.84.2017.12.29.09.51.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 09:51:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 29 Dec 2017 14:49:19 -0300
Message-Id: <20171229174933.1781-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171229174933.1781-1-f4bug@amsat.org>
References: <20171229174933.1781-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v3 28/42] hw/arm/xilinx_zynq: implement SDHCI
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
X-TUID: ZoRkwgypJCLt

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

