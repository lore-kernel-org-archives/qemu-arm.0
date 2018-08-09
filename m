Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1871754wru;
        Thu, 9 Aug 2018 06:01:58 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzjtui1xRUs0lVJNFIwWZu4863eQ5sdxUV0OfSopkk3JpGTe1XxhrRieuqhni5/gdpEyJhL
X-Received: by 2002:a0c:b131:: with SMTP id q46-v6mr1745749qvc.168.1533819718807;
        Thu, 09 Aug 2018 06:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819718; cv=none;
        d=google.com; s=arc-20160816;
        b=kBIq/vZwXP2lD90LDviZNHW5LXOU+PjGpBtr2UL3HXIvo7sf9xP5DM46oaLYjrnwY9
         /gakCewVLj7W3dHbc0Em1AKLxf2Iu9Vox1W/F0vNXgRLijgOE8IDXQt2Q5kjxOtnPO2f
         Asrv3kZtIs6Hc52Wqb1tL3kEdFanz8TbmHw++xk8IpT1ZFJ5Equ8qqSYoNAwSIYnrfft
         5mtcFXByMk2GNp4ppBL2Byp6VHJcNoDCPQo0uNoHNupX5rv064RqWfIAIXTtDoCH2rfh
         YfdkRfuf2ruePtrAFmEvD+mxqixpQipP4Hudf7A0R7mFlcvBeUSsFqv6zd0BDpOnTgYL
         XRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Pq44vsSwXW/FFbzQY6qdIFSkxtnEjBjFQAxc5Q3OSC4=;
        b=c5WusS/QL74qbxEP8Wc1PFS9FM+ILHsUfQMoZFrFqKqQifIr/ZrBcveg7ljVX5vN6C
         wY0p4skNwu5GGSMyGyuEIfweJ2JjyEN4jOAQNTDdPDdx7LrU0TC8YlQ5/BSuZ+AGm3Q5
         W5LIMcA3IHsmSalgXjo6hLI5zHuR5JBCitZx4z0Ln5LPv7QVN6wRXaqEGAtQV+DXSonm
         3/nCoKm2tzse43eMBe/ekEWDEsXwqfPmagR0rFa+4m5YEzggwa+vFqlZa3Nf7RjexMc0
         BFGnwgu+SpKRdcD1RsmO1jbkS1tz77Tj6y9ARRiNK0USgtv8GmVVgBQigLLCTRIx1azU
         +GQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v89-v6si1975319qkv.257.2018.08.09.06.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkZi-0005wW-6z
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:01:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZI-0005uW-Lr
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZE-0003HB-Qx
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZE-0003Gd-I9; Thu, 09 Aug 2018 09:01:28 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZD-0003Ip-Cd; Thu, 09 Aug 2018 14:01:27 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:08 +0100
Message-Id: <20180809130115.28951-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/16] hw/arm/iotkit: Wire up the lines for MSCs
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
X-TUID: c3mK0h0R0zTc

The IoTKit doesn't have any MSCs itself but it does need
some wiring to connect the external signals from MSCs
in the outer board model up to the registers and the
NVIC IRQ line.

We also need to expose a MemoryRegion corresponding to
the AHB bus, so that MSCs in the outer board model can
use that as their downstream port. (In the FPGA this is
the "AHB Slave Expansion" ports shown in the block
diagram in the AN505 documentation.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h |  8 ++++++++
 hw/arm/iotkit.c         | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 1ffa31d521b..5bb66b10468 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -28,6 +28,9 @@
  *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts
  *  + Named GPIO inputs "EXP_IRQ" 0..n are the expansion interrupts, which
  *    are wired to the NVIC lines 32 .. n+32
+ *  + sysbus MMIO region 0 is the "AHB Slave Expansion" which allows
+ *    bus master devices in the board model to make transactions into
+ *    all the devices and memory areas in the IoTKit
  * Controlling up to 4 AHB expansion PPBs which a system using the IoTKit
  * might provide:
  *  + named GPIO outputs apb_ppcexp{0,1,2,3}_nonsec[0..15]
@@ -45,6 +48,11 @@
  * Controlling each of the 16 expansion MPCs which a system using the IoTKit
  * might provide:
  *  + named GPIO inputs mpcexp_status[0..15]
+ * Controlling each of the 16 expansion MSCs which a system using the IoTKit
+ * might provide:
+ *  + named GPIO inputs mscexp_status[0..15]
+ *  + named GPIO outputs mscexp_clear[0..15]
+ *  + named GPIO outputs mscexp_ns[0..15]
  */
 
 #ifndef IOTKIT_H
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 5d59ed5489f..8ae2a052517 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -660,6 +660,21 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
 
     iotkit_forward_sec_resp_cfg(s);
 
+    /* Forward the MSC related signals */
+    qdev_pass_gpios(dev_secctl, dev, "mscexp_status");
+    qdev_pass_gpios(dev_secctl, dev, "mscexp_clear");
+    qdev_pass_gpios(dev_secctl, dev, "mscexp_ns");
+    qdev_connect_gpio_out_named(dev_secctl, "msc_irq", 0,
+                                qdev_get_gpio_in(DEVICE(&s->armv7m), 11));
+
+    /*
+     * Expose our container region to the board model; this corresponds
+     * to the AHB Slave Expansion ports which allow bus master devices
+     * (eg DMA controllers) in the board model to make transactions into
+     * devices in the IoTKit.
+     */
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
+
     system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
 }
 
-- 
2.17.1

