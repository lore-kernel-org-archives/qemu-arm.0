Received: by 10.28.71.27 with SMTP id u27csp3506819wma;
        Mon, 22 Jan 2018 18:13:25 -0800 (PST)
X-Google-Smtp-Source: AH8x224Gpy2llkAuq5asTYUlwLYLimRU2tEf6JE9l0wIQ/ogJ3mSVnutCVsE2zI9Bhz/pFpPWPEu
X-Received: by 10.37.190.209 with SMTP id k17mr874652ybm.50.1516673604917;
        Mon, 22 Jan 2018 18:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516673604; cv=none;
        d=google.com; s=arc-20160816;
        b=C0HfcA/q/ParnSZkcI9vU1PWHBQIrSrBkC/Qp50+98HecfO3xO+crGhDMZZn5bwz2u
         XEsmQUlfVkZOphxNKwGvbpf2ETAUr7tTDZgVAeTOVrHnER02ODDeG91XVRXz2FsLwzEg
         Mb/z2PyF0p4tNBV/dVYmZy31GoW3Yf/Y65kx8wNyT61r9AUDm58eo7Ql8IcPSTo1wRko
         9zWmewuFdsiAAvIGj3cd/jUvgnLRVFSZBSVSih6GGZ9vtSi3N5PHyu7gB18CL6DoQLj0
         xNV//4XoiERT4q8LTnJbZ10ugO5NhpKIPv6Xo5E9YrGJ8FNsEJzuLZTOfo6SyFNK4SEo
         PzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RLGgs5ob8+3JaVOLgXR0+iUnt5fi/wPyh3+ufpVzmPM=;
        b=J2Oaj/I4/IILMEOFiNYJENM8kj9qajmQL6Ta4LGG//p4nFi0qsbpbAH6ccF2VS6bPt
         f58ZE6bEf8qkadxSy9JaRrspDvArjqLhvkkGFC6O+2BQJX25w4LMGXWXrmZOoMx/LeP+
         zPED7QytAA+M2q85F0GAOEu3TFOipY+6FAfcSGXW+s9vqFQ7BI1lccz29TnZGxW5dwGJ
         xDsZ3uaAtswKUDdlO1+ZLYw3y4f8WMjEIvEG6xdD6J+xbK8SqQAIqht7Ib6YN5jtY5na
         FhberZANTEXDBlG5xENsfxAQGI0SnbBLR7WHhSq2quRRu3psp31C7h4M1DzMCeFRaoxF
         XXBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jf9L8C2W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si886610ybm.124.2018.01.22.18.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 18:13:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jf9L8C2W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edo5U-0008OJ-98
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 21:13:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1n-0005u0-6x
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 21:09:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1k-0003oe-0u
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 21:09:35 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1j-0003o9-So; Mon, 22 Jan 2018 21:09:31 -0500
Received: by mail-qt0-x244.google.com with SMTP id d54so26146941qtd.4;
	Mon, 22 Jan 2018 18:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RLGgs5ob8+3JaVOLgXR0+iUnt5fi/wPyh3+ufpVzmPM=;
	b=jf9L8C2W487/gJ2nfhzCeo6UAAXULursBfv2+k+Pvn/lAaDdBXCdYjZvy98cAFL9QC
	wrj9X5Q05HKwTp9DyUoFRcF01/mvCjrDPF5B7t31Xc7u0zZWSwkEKxbo+quUcpkLCQ7+
	aD9UX7MXlzdLdizdhtcz9FBrGF5NtsnGFaSqLFHkHOeueJzagE0RYN+4miCrHo2hAySI
	ulQ+QbWPgSKTzsNgpw5PogQ03mAz/HSDNerESo1AvztWrTES+dao9NEgaSOvtgWLe8tJ
	E5f3eALdwQmbeLZmoX+Zb3paFWxoWSTyMFcnhOPTuN2CqrvHiP2DzuDaC0iv+VsXhPo9
	iUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RLGgs5ob8+3JaVOLgXR0+iUnt5fi/wPyh3+ufpVzmPM=;
	b=XGiu3VXgKMIBwh4CxoXHFcRkn+8l2BSxh00lHTx42aOj9lLDYD+/pkyMoI08qUcCsh
	Z1qEfRPi8lSRUR8ajGH1zc6y5EXJow7AddmEby+kPDaVhLkkowLWlny9Z5bmQTH+Q2rM
	a0o/MtXLiRi8yCXWj0NOWcN4XCj2cU413GjJ5O2BkKMZQ94lDhIk4G5OCJtGgbRR7JEI
	dmi3wd2SES/3s4irFywYo0pzHLnFVM5LlQZcamLP8VXG4vOt9Qk/KB3X5m063QN//Myv
	RPoYHBhpCFKZqFw+qvY7OyWr0unJqgvk8riTkivFnDfhwn5YuKhFDRamkXgN+/hT+wJ8
	drFA==
X-Gm-Message-State: AKwxytcFKIgLgz4f+uhI5TjkOm6xalB+5h0OlLqvWgHkx4xk1pZUXlIy
	nYAGm1YAF9KIOHEgvZbVSAs=
X-Received: by 10.237.50.197 with SMTP id z63mr1416335qtd.212.1516673371488;
	Mon, 22 Jan 2018 18:09:31 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id j19sm6514120qtc.1.2018.01.22.18.09.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 18:09:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 22 Jan 2018 23:08:20 -0300
Message-Id: <20180123020820.1288-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123020820.1288-1-f4bug@amsat.org>
References: <20180123020820.1288-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v9 16/16] hw/arm/xilinx_zynq: fix the
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin O'Connor <kevin@koconnor.net>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C3YdYcWg3Eva

checking Xilinx datasheet "UG585" (v1.12.1)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 094e0570e1..aae2cfc1b5 100644
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
 
 static struct {
-- 
2.15.1

