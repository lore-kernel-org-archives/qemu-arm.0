Received: by 10.28.173.206 with SMTP id w197csp6473063wme;
        Thu, 18 Jan 2018 04:41:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBosJu30A5OS0vXaGoiyGhCo6LCVYwGOL+ZBZjBl6E9sU+qZRxUVty+qq3dH2QOiHDRJO3bdM
X-Received: by 10.37.111.197 with SMTP id k188mr1316276ybc.89.1516279318457;
        Thu, 18 Jan 2018 04:41:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516279318; cv=none;
        d=google.com; s=arc-20160816;
        b=Fg4AJTsIXGQQ6/V/oEf8mZmUh8Qb+wolBXj9ZeIBtGE0IZN+u1KXupzdGBHAxqnu4F
         /Kj5MYUKlpXX1pJllYYvmcE727+FaBabpCStp8KI0NYsZCBXFCm5CVNtBmgxDthgdJJt
         ToHw24FenR8ZuV2mBiLNtpZtf8+FRGhxPtCja6XYNavDZ0BTBchLU4DoqsaD5/tEhgKb
         QbY3aI3qnjhsVHz6l1yUoLa1tzblZsKNjQWAzZsb9NfRL19FA6UtnmZKapCqV70tNsT5
         ETtFLbQncMACUoZHDvO6hfWgvIGOWyZCFyfcjEzrOPCFo4Bhi3lIecE0jk3i0o/Ah2Nl
         hpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=WUfH1YmX6JIuBwbJQZOyUACk1UascwrFRi8uZ/I6JZI=;
        b=E3zCvdF7PhPpkmOJ0xq064Hyi2BxWvbOE2i1V9S2DJoih8zExfldR2Ua+Ntpy/UvoO
         Pv2skc2TgZQgx+AM0cK03/RJg94yh+s/JXXk/yPOeZtvx8VxWcaO8M2kYaXm4pa6Iwes
         Kp7dzKPmzyP3swKGPLqi6rN90uCkMlS+RbCLSUMhHUuIhJ5qJfY2yjrr3zTrvHrwQoSU
         sCMAX+w0fo1MFtqC5HDMVPPfXNsqJgilqxqKutPNyeNiptkCV0C5JJAyrBZpQwa3EzAa
         rgvFXRogcoZOyZ8nOMOwDDUmmVhPGZ6pq/VZp0DSkvUYMyxvnnttnCxXARv+UjiYH3kx
         SWiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KLoXeeVH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si90573ybg.658.2018.01.18.04.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 04:41:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KLoXeeVH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ec9W1-0007DZ-ML
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 07:41:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ec9Nf-0000Qv-33
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 07:33:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ec9Nd-0007M3-SH
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 07:33:19 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:41176)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ec9Nd-0007Lm-Nt; Thu, 18 Jan 2018 07:33:17 -0500
Received: by mail-qt0-x241.google.com with SMTP id i1so12886979qtj.8;
	Thu, 18 Jan 2018 04:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WUfH1YmX6JIuBwbJQZOyUACk1UascwrFRi8uZ/I6JZI=;
	b=KLoXeeVHKN1E3m4OCT4GFxXVQ6ps3vG/kBRBqrCxx02XlIna+4l9rhdASTIf8BHxyO
	hqtWDfKwUkOxkW/SBZ9HzAG9v4h3R4e1jIW7HHvvQtF0lzjHfVmwyDiWvGoSJ/cLQpOy
	3fR6/rZNvQX1rMrPmEYdzEXdiFYf6TxtDmunGtejAPOYA7nCngxSQCqr9TgkGSfT6iB0
	knQnxXMTGWpy+/E7JNVAVXyfUnUrnCrS+t1pEWCTYhAh3mxPzqoygnhNCyoVing/ozA0
	o+pSuLn5B0Q9iScXavTGJofEAypMuTx5MZQvPn+JTifAQ6SSczgxqkJ+IB5MKWe/jP+H
	dieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WUfH1YmX6JIuBwbJQZOyUACk1UascwrFRi8uZ/I6JZI=;
	b=Pv6Dxyub7+0nAHXpnzABbphax/8qCRMfpmBVPCGdrXg+Jxel5ssO2ITk78J/Po6o5b
	SqamA1s8FP/UZMcJsqWXMHhISL2tjF50o4m18LvgCL+M0s2y2NpGuJ+zb37eSuTlls/j
	2MLUDpXcRIq3mMxY9DGbBrzWJd71fiNa1BO9BysdGz2eXMcVUZ0AMTntTUFTHL9c2LkC
	oabkfcyrjb90iN+4nzRwrhmg32usTYj2qmNUxUbijNxSiEFxViwL9E5VAXxzJsMuFC5y
	4GXfroPz4ZufilXGFydJ1JbmaLtxNmC4bOtkVRA/7TnISu9Y8zN4s9WkXmLhGpXY7f5X
	hZTQ==
X-Gm-Message-State: AKwxyteSR55ZH9QXELDhYo+WnccW63Pj37j2TmdeneVNzNJXNEFdQRqo
	fFRWtLKBFdGdiPxQ1vXXGjU=
X-Received: by 10.55.41.214 with SMTP id p83mr63419785qkp.183.1516278797221;
	Thu, 18 Jan 2018 04:33:17 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id s12sm4489623qke.4.2018.01.18.04.33.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 04:33:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Thu, 18 Jan 2018 09:32:16 -0300
Message-Id: <20180118123219.19410-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118123219.19410-1-f4bug@amsat.org>
References: <20180118123219.19410-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v7 14/16] hw/arm/xilinx_zynq: implement SDHCI
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
X-TUID: n7hxUGtOoUqf

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

