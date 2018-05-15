Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1058wme;
        Tue, 15 May 2018 10:15:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoSskJdSCjRF0X5R2Xpw//xfydbHsQncfXGughdeE33jvIQ/s/Cjf8uxvK/tXM8wgNkNWB1
X-Received: by 2002:ac8:1a9a:: with SMTP id x26-v6mr15191314qtj.113.1526404507565;
        Tue, 15 May 2018 10:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526404507; cv=none;
        d=google.com; s=arc-20160816;
        b=ZkVlQjJH8jk4aj/cnJCdCrDGYNYe1BCrqyYnIE/A6ZCmukbwizTFJQnRlqsUkGBerR
         UQ9/H1qR3nMXywdoC+eJs1xpVcckY7bkJ6sPTEwYL3A/flz0I4kLCYUJkG2tGGgzGRCH
         TGzq+Lt7o4ZOWKCHmyvKsdFlhddjGYE0f+7XYFUiDryDbp5fcTzliGTACOlazJF57twk
         e+RQAqMW41QnDUpXc7dylJM6U9UrZwweGQztBXgM6v+DAH7etldwnMgtZtOeowX8Nrfx
         dsXK3n2re5WLeLL2T6V9nILl7YKils4AsR7f7y4twkx/z1/h3rghpPotraN9HMXHjySs
         nTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=OGaUEwMyjybu4AXzu4/+uJOMs/d7OgZM52Q3aZflkpU=;
        b=PvcEy+OKCa5mrQZqJAXfspIfHUkzrzk4FHbi+9yMLDvj0mPeCraP+BbTQCQSw6lFh4
         0eLQ8mvtrJcpJlf1gxaJ/05FhqubL1SFQt23HPd2rv7GEuMVq5f9tDNxaUoVNYUoGcCy
         /quBa7PcZ8fvvqYrd0qYu2WWQE+p+IcaQxWHJ+4wAJfs4z28r66iAAR1m+9n5os1K4Y9
         C5tDztvATA9xml26JM1kMgzltPb1i5cT/+U8HgOenf6ycBA5n8xp5urmn7EiH33WuOug
         myNvpM6Fj9eU00bNtiJ9tcrDUIggIVKZFBVnCOO7lAy/AgxUuqPKaGAlwLcrwjQGA4yZ
         HsUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7-v6si514186qth.269.2018.05.15.10.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 May 2018 10:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIdXX-0002LS-26
	for alex.bennee@linaro.org; Tue, 15 May 2018 13:15:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIdXH-0002Js-AZ
	for qemu-arm@nongnu.org; Tue, 15 May 2018 13:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fIdXG-0006cU-6w
	for qemu-arm@nongnu.org; Tue, 15 May 2018 13:14:51 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fIdXF-0006c1-Vw; Tue, 15 May 2018 13:14:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fIdXD-0001cS-Vt; Tue, 15 May 2018 18:14:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 15 May 2018 18:14:46 +0100
Message-Id: <20180515171446.10834-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/arm/mps2-tz: Put ethernet controller behind
 PPC
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GgQkerhJ1rPr

The ethernet controller in the AN505 MPC FPGA image is behind
the same AHB Peripheral Protection Controller that handles
the graphics and GPIOs. (In the documentation this is clear
in the block diagram but the ethernet controller was omitted
from the table listing devices connected to the PPC.)
The ethernet sits behind AHB PPCEXP0 interface 5. We had
incorrectly claimed that this was a "gpio4", but there are
only 4 GPIOs in this image.

Correct the QEMU model to match the hardware.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
A minor nit that I didn't notice when I was modelling this.

NB: I think the PSRAM is also supposed to be behind this
interface of the PPC, but we definitely can't model that
because our PPC implementation won't work for executing
code from RAM that sits behind it.

 hw/arm/mps2-tz.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 8dc8bfd4ab..c5ef95e4cc 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -74,12 +74,13 @@ typedef struct {
     UnimplementedDeviceState spi[5];
     UnimplementedDeviceState i2c[4];
     UnimplementedDeviceState i2s_audio;
-    UnimplementedDeviceState gpio[5];
+    UnimplementedDeviceState gpio[4];
     UnimplementedDeviceState dma[4];
     UnimplementedDeviceState gfx;
     CMSDKAPBUART uart[5];
     SplitIRQ sec_resp_splitter;
     qemu_or_irq uart_irq_orgate;
+    DeviceState *lan9118;
 } MPS2TZMachineState;
 
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
@@ -224,6 +225,26 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
 
+static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
+                                  const char *name, hwaddr size)
+{
+    SysBusDevice *s;
+    DeviceState *iotkitdev = DEVICE(&mms->iotkit);
+    NICInfo *nd = &nd_table[0];
+
+    /* In hardware this is a LAN9220; the LAN9118 is software compatible
+     * except that it doesn't support the checksum-offload feature.
+     */
+    qemu_check_nic_model(nd, "lan9118");
+    mms->lan9118 = qdev_create(NULL, "lan9118");
+    qdev_set_nic_properties(mms->lan9118, nd);
+    qdev_init_nofail(mms->lan9118);
+
+    s = SYS_BUS_DEVICE(mms->lan9118);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));
+    return sysbus_mmio_get_region(s, 0);
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -363,7 +384,7 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x40101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x40102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x40103000, 0x1000 },
-                { "gpio4", make_unimp_dev, &mms->gpio[4], 0x40104000, 0x1000 },
+                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000 },
             },
         }, {
             .name = "ahb_ppcexp1",
@@ -447,13 +468,6 @@ static void mps2tz_common_init(MachineState *machine)
                                                      "cfg_sec_resp", 0));
     }
 
-    /* In hardware this is a LAN9220; the LAN9118 is software compatible
-     * except that it doesn't support the checksum-offload feature.
-     * The ethernet controller is not behind a PPC.
-     */
-    lan9118_init(&nd_table[0], 0x42000000,
-                 qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));
-
     create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
-- 
2.17.0

