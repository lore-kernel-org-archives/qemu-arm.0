Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1876591wru;
        Thu, 9 Aug 2018 06:05:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxrkV3ynnK5dCkhhc3Lhn+gDbuU+koYbI/fPTPbc2yFcAn8maTtcrbAfh7rok+xSST1Wb//
X-Received: by 2002:ac8:2c9c:: with SMTP id 28-v6mr1903299qtw.420.1533819932373;
        Thu, 09 Aug 2018 06:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819932; cv=none;
        d=google.com; s=arc-20160816;
        b=HDAk4DfMnphfxvU/jQuRxwmwtCCE/han44SMEwSlqPSzKgP0Wy5hGzaTZ3oGj//st2
         MQK50iaaXtJ4r8WveUVRRSk5iuF2hKDmVRLmlBW7iq+mAcIFaU94BclZUoGd7Oxzt7st
         TOoClVKQRqqP9pPuc8oAxB1b0wihe3b7jWJUKhyvM+Hcic0AMAS6seodu9vtaLKPYQ/y
         C4BG2iydrLCpS13NRpXeMfB29jUqXMy9MRWxMn+Db+1xi+zKJnJ2KOX1NcU2CUKFBrmQ
         cRsCMAXqrwG2Q3cCYjj2tnfVGHQEHZV6qG5mzWGxqk7V4vElwH2bG0rbnJh6ZZ9eHyhb
         QQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=R9VDllhHo9krc8Cn9Ew8nm84DnjJAtMyKYVPctrHlOg=;
        b=sJSwUGP4S3MxWpophWhaSt+VNh4ZKlrG8+gV0S8rK/6ymNrjBLFZi3oIAEptIT8S68
         a25Yb3y+yEhmYhD4CrOJjmpx5E5CDKCRXPpt9dOCtKLOIqsu3y9u1PTNsEqAPl4Nfr6B
         M8lw3l9T+6HkF+ozOBmX4cOTU/Mw79edZeBiqZ8zlWRwLkCYEklH+MmNL1lshyKL9pgJ
         37QjOrnXzeABU6Ps0qIk7HUvYd8pOcM9dEYkkFoScscBVX6CzXC0ElTPVd4Bz7Y5RgNz
         xtHa2RW2KNBoqwUH0mQANjqDLEdWiCLsOhzTKewJkzTzhsGexChoY/0PL5jhEflG0G5U
         989A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i93-v6si3899606qtb.266.2018.08.09.06.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:05:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkd9-0000fK-PU
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:05:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZM-0005vP-Sc
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZI-0003JV-JL
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44226)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZI-0003IY-AF; Thu, 09 Aug 2018 09:01:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZH-0003K6-3f; Thu, 09 Aug 2018 14:01:31 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:11 +0100
Message-Id: <20180809130115.28951-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 12/16] hw/dma/pl080: Don't use CPU address space
 for DMA accesses
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
X-TUID: 2LAoDLFkEwDK

Currently our PL080/PL081 model uses a combination of the CPU's
address space (via cpu_physical_memory_{read,write}()) and the
system address space for performing DMA accesses.

For the PL081s in the MPS FPGA images, their DMA accesses
must go via Master Security Controllers. Switch the
PL080/PL081 model to take a MemoryRegion property which
defines its downstream for making DMA accesses.

Since the PL08x are only used in two board models, we
make provision of the 'downstream' link mandatory and convert
both users at once, rather than having it be optional with
a default to the system address space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/pl080.h |  5 +++++
 hw/arm/realview.c      |  8 +++++++-
 hw/arm/versatilepb.c   |  9 ++++++++-
 hw/dma/pl080.c         | 35 +++++++++++++++++++++++++++++------
 4 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
index 7c6a4184833..9d4b3df143f 100644
--- a/include/hw/dma/pl080.h
+++ b/include/hw/dma/pl080.h
@@ -21,6 +21,8 @@
  * + sysbus IRQ 1: DMACINTERR error interrupt request
  * + sysbus IRQ 2: DMACINTTC count interrupt request
  * + sysbus MMIO region 0: MemoryRegion for the device's registers
+ * + QOM property "downstream": MemoryRegion defining where DMA
+ *   bus master transactions are made
  */
 
 #ifndef HW_DMA_PL080_H
@@ -61,6 +63,9 @@ typedef struct PL080State {
     qemu_irq irq;
     qemu_irq interr;
     qemu_irq inttc;
+
+    MemoryRegion *downstream;
+    AddressSpace downstream_as;
 } PL080State;
 
 #endif
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index cd585d94694..ab8c14fde38 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -201,7 +201,13 @@ static void realview_init(MachineState *machine,
     pl011_create(0x1000c000, pic[15], serial_hd(3));
 
     /* DMA controller is optional, apparently.  */
-    sysbus_create_simple("pl081", 0x10030000, pic[24]);
+    dev = qdev_create(NULL, "pl081");
+    object_property_set_link(OBJECT(dev), OBJECT(sysmem), "downstream",
+                             &error_fatal);
+    qdev_init_nofail(dev);
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, 0x10030000);
+    sysbus_connect_irq(busdev, 0, pic[24]);
 
     sysbus_create_simple("sp804", 0x10011000, pic[4]);
     sysbus_create_simple("sp804", 0x10012000, pic[5]);
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index a5a06b6d408..8b748570596 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -287,7 +287,14 @@ static void versatile_init(MachineState *machine, int board_id)
     pl011_create(0x101f3000, pic[14], serial_hd(2));
     pl011_create(0x10009000, sic[6], serial_hd(3));
 
-    sysbus_create_simple("pl080", 0x10130000, pic[17]);
+    dev = qdev_create(NULL, "pl080");
+    object_property_set_link(OBJECT(dev), OBJECT(sysmem), "downstream",
+                             &error_fatal);
+    qdev_init_nofail(dev);
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, 0x10130000);
+    sysbus_connect_irq(busdev, 0, pic[17]);
+
     sysbus_create_simple("sp804", 0x101e2000, pic[4]);
     sysbus_create_simple("sp804", 0x101e3000, pic[5]);
 
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 301030dd118..8f9f3e08d9a 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -12,6 +12,7 @@
 #include "exec/address-spaces.h"
 #include "qemu/log.h"
 #include "hw/dma/pl080.h"
+#include "qapi/error.h"
 
 #define PL080_CONF_E    0x1
 #define PL080_CONF_M1   0x2
@@ -161,14 +162,16 @@ again:
             swidth = 1 << ((ch->ctrl >> 18) & 7);
             dwidth = 1 << ((ch->ctrl >> 21) & 7);
             for (n = 0; n < dwidth; n+= swidth) {
-                cpu_physical_memory_read(ch->src, buff + n, swidth);
+                address_space_read(&s->downstream_as, ch->src,
+                                   MEMTXATTRS_UNSPECIFIED, buff + n, swidth);
                 if (ch->ctrl & PL080_CCTRL_SI)
                     ch->src += swidth;
             }
             xsize = (dwidth < swidth) ? swidth : dwidth;
             /* ??? This may pad the value incorrectly for dwidth < 32.  */
             for (n = 0; n < xsize; n += dwidth) {
-                cpu_physical_memory_write(ch->dest + n, buff + n, dwidth);
+                address_space_write(&s->downstream_as, ch->dest + n,
+                                    MEMTXATTRS_UNSPECIFIED, buff + n, dwidth);
                 if (ch->ctrl & PL080_CCTRL_DI)
                     ch->dest += swidth;
             }
@@ -178,19 +181,19 @@ again:
             if (size == 0) {
                 /* Transfer complete.  */
                 if (ch->lli) {
-                    ch->src = address_space_ldl_le(&address_space_memory,
+                    ch->src = address_space_ldl_le(&s->downstream_as,
                                                    ch->lli,
                                                    MEMTXATTRS_UNSPECIFIED,
                                                    NULL);
-                    ch->dest = address_space_ldl_le(&address_space_memory,
+                    ch->dest = address_space_ldl_le(&s->downstream_as,
                                                     ch->lli + 4,
                                                     MEMTXATTRS_UNSPECIFIED,
                                                     NULL);
-                    ch->ctrl = address_space_ldl_le(&address_space_memory,
+                    ch->ctrl = address_space_ldl_le(&s->downstream_as,
                                                     ch->lli + 12,
                                                     MEMTXATTRS_UNSPECIFIED,
                                                     NULL);
-                    ch->lli = address_space_ldl_le(&address_space_memory,
+                    ch->lli = address_space_ldl_le(&s->downstream_as,
                                                    ch->lli + 8,
                                                    MEMTXATTRS_UNSPECIFIED,
                                                    NULL);
@@ -358,6 +361,18 @@ static void pl080_init(Object *obj)
     s->nchannels = 8;
 }
 
+static void pl080_realize(DeviceState *dev, Error **errp)
+{
+    PL080State *s = PL080(dev);
+
+    if (!s->downstream) {
+        error_setg(errp, "PL080 'downstream' link not set");
+        return;
+    }
+
+    address_space_init(&s->downstream_as, s->downstream, "pl080-downstream");
+}
+
 static void pl081_init(Object *obj)
 {
     PL080State *s = PL080(obj);
@@ -365,11 +380,19 @@ static void pl081_init(Object *obj)
     s->nchannels = 2;
 }
 
+static Property pl080_properties[] = {
+    DEFINE_PROP_LINK("downstream", PL080State, downstream,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pl080_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->vmsd = &vmstate_pl080;
+    dc->realize = pl080_realize;
+    dc->props = pl080_properties;
 }
 
 static const TypeInfo pl080_info = {
-- 
2.17.1

