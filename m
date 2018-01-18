Received: by 10.28.173.206 with SMTP id w197csp6867233wme;
        Thu, 18 Jan 2018 10:40:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBos4CAsO6WVWuiNFtOFXvgJDybEkrgIm46HqXRhOXssVZ4gHZVeevsXxlMTF599m3rohOyQA
X-Received: by 10.37.186.202 with SMTP id a10mr3914822ybk.514.1516300839874;
        Thu, 18 Jan 2018 10:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516300839; cv=none;
        d=google.com; s=arc-20160816;
        b=V5T9Uf0JPIEcKnbBmcetAGAqv4eS37w5cqDzkkV/chTtZYA9JvTSVpNjbaXVshpJum
         dGVrmAvRzRSse7okUtVjUq6wOwhF743OJmOQYxCcCfVmanhnYqQc+R9V/O6NUS8L2nbp
         bfCpWgC2hjjxo0RKPYfSBymuCbEXgpW+HNTSiMsqzwFrOdBqoFbjph074HVjEQuLi7XY
         cfDUqcchUSgcSOGXv/tzRkC7vVsAVLqShWE+40k+G1+6NnrxpViK0ieQ6LuM1PNSqeUw
         qm86haSCSay1tQkW4rMcX1IDjNRtpdMECaXGLeoa6a0Bmvp/BBk4cd+N33na7K6G1Kai
         tY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=WUfH1YmX6JIuBwbJQZOyUACk1UascwrFRi8uZ/I6JZI=;
        b=mPAqsQzN++kZ8etT0C3ZI4nlqBqOKw0ssoXZrZYSwkJEeXkOnaXV2IzqolpWUb1GdA
         a64IUsbgliuKfNSKUi5sM6aasiJC/5eR+cAgbq0UvnvlwNbb35IGpr6VPzg9ukxzcLHk
         pGQP4gsuUwdiqiDE7YbSqbdG1xo/P2oztsOtTTpEIf8eiutruBed+po2QlCBBv639pQh
         UxtnE/vFHquKt4/V2CaQuDPCbyc+Neya4Frvj04MeXCizBj7870HvsL/BAV1k+JzQ7Z+
         hCdbGLv2CaO5H15P+3rpz5tbv/vQ1CBrRCW7O7BegD7WajZDmTSSHwUA3WPfTE1Jk7q9
         U7jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EzuZrNp2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g37si235132ybi.791.2018.01.18.10.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EzuZrNp2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecF77-0005ZU-4x
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:40:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecEzQ-0007U5-62
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:32:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecEzP-0003bQ-1z
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:32:40 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:32995)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecEzO-0003bI-TB; Thu, 18 Jan 2018 13:32:38 -0500
Received: by mail-qt0-x242.google.com with SMTP id e2so32642541qti.0;
	Thu, 18 Jan 2018 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WUfH1YmX6JIuBwbJQZOyUACk1UascwrFRi8uZ/I6JZI=;
	b=EzuZrNp2DU1/xwSxe07KWZjBHuJVb9zLjxBhLKINqb9TFK0z1jTete32ZenqVOQ0hQ
	qWqashFT9XBem0K54RYhR4rjriOPgmrMhimJIAkDepeMDPWbBX5+lovjbyYeqlzVqfnh
	9Pt3DyXqTebYzzDAVYyg2BD95BSzNgwKO0Kf0dwDQ4ClJ5Cldq11RdN6L5PoLXUG5cIL
	jhyU4djoTEHHmS5uJdNAHXmCEtp0i711H/JdWjy7rKaiFS39mJPTz4IArSoE0S5OAK0A
	8QFDn8t13Xei5s4UwbVT0ZPOM5gYZDMU5aDSqKglPBJ8cWaL+aBLo/+lviOe/oKLB9mc
	XVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WUfH1YmX6JIuBwbJQZOyUACk1UascwrFRi8uZ/I6JZI=;
	b=hShj/8LZJp1fI6vreAbtrvhgFn8ThIKSSmPhCHfsu52nZiJMrMop3VIwPX2MBhalC0
	wKCUKu/f6wmrgS+oZaMvxy2+2sptPVDDnqQSaPuTUmBORtQ2ns0pcntMo4lz0wJ91CJW
	9/TTq3SZoT0tSp2sRKUWtF2vp8oGt+WL2WFQ3c7iJ3wU3Qp1MUv+LqAC6oGTc6rvCflf
	NXPys0Ika6rH9dLF3tZdSfd4KiC3naQ5lP2WZlp/O4McNVbufVvv+oD0LLtOEB3hjAa5
	bXdtcyn3m0c6qRtvNbG8qC0OcPvyfHEQZScGV/uBQht36skAHWhJuRpI+fxo3uF6bYAA
	3GrA==
X-Gm-Message-State: AKwxytepnWor+KXrxBacCjNi7xeroKZ1vfRhgkDGAGUUq1AlgfsjF5Wx
	DKImdzIM4lhuEAyaen4/yHs=
X-Received: by 10.55.161.21 with SMTP id k21mr31976550qke.260.1516300358402;
	Thu, 18 Jan 2018 10:32:38 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id g9sm446661qtg.90.2018.01.18.10.32.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 10:32:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Thu, 18 Jan 2018 15:31:06 -0300
Message-Id: <20180118183108.16009-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118183108.16009-1-f4bug@amsat.org>
References: <20180118183108.16009-1-f4bug@amsat.org>
In-Reply-To: <20180118182510.15630-1-f4bug@amsat.org>
References: <20180118182510.15630-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v8 15/17] hw/arm/xilinx_zynq: implement SDHCI
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin O'Connor <kevin@koconnor.net>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F3CDT+ENcGtF

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/xilinx_zynq.c | 70 ++++++++++++++++++++++++++++++++++------------------
 tests/sdhci-test.c   |  4 +++
 2 files changed, 50 insertions(+), 24 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1836a4ed45..349787aacd 100644
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
 
@@ -247,27 +245,51 @@ static void zynq_init(MachineState *machine)
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
+        qdev_prop_set_uint8(dev, "timeout-freq", 0);
+        qdev_prop_set_uint8(dev, "max-frequency", 0);
+        qdev_prop_set_bit(dev, "suspend", false);
+        qdev_prop_set_bit(dev, "sdma", true);
+        qdev_prop_set_bit(dev, "adma1", true);
+        qdev_prop_set_bit(dev, "adma2", true);
+        qdev_prop_set_bit(dev, "1v8", false);
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
diff --git a/tests/sdhci-test.c b/tests/sdhci-test.c
index 37ada0e1c5..44ee5651c4 100644
--- a/tests/sdhci-test.c
+++ b/tests/sdhci-test.c
@@ -41,6 +41,10 @@ static const struct sdhci_t {
     /* Exynos4210 */
     { "arm",    "smdkc210",
         {0x12510000, 2, 0, {1, 0x5e80080} } },
+
+    /* Zynq-7000 */
+    { "arm",    "xilinx-zynq-a9",
+        {0xe0100000, 2, 0, {1, 0x01790080} } },
 };
 
 static struct {
-- 
2.15.1

