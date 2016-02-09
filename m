Received: by 10.25.159.19 with SMTP id i19csp1704781lfe;
        Mon, 8 Feb 2016 20:58:45 -0800 (PST)
X-Received: by 10.140.18.172 with SMTP id 41mr38517019qgf.7.1454993925332;
        Mon, 08 Feb 2016 20:58:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si34066044qkb.126.2016.02.08.20.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 20:58:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aT0Nw-0004fd-N3
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 23:58:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aT0Nt-0004eY-SV
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 23:58:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aT0Nq-0002tQ-Mh
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 23:58:41 -0500
Received: from avon.wwwdotorg.org ([70.85.31.133]:55113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>)
	id 1aT0Nq-0002tC-G1; Mon, 08 Feb 2016 23:58:38 -0500
Received: from severn.wwwdotorg.org (unknown [192.168.65.5])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by avon.wwwdotorg.org (Postfix) with ESMTPS id 4573664A5;
	Mon,  8 Feb 2016 21:58:37 -0700 (MST)
Received: from dart.wwwdotorg.org (localhost [127.0.0.1])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by severn.wwwdotorg.org (Postfix) with ESMTPSA id DF25DE40CA;
	Mon,  8 Feb 2016 21:58:36 -0700 (MST)
From: Stephen Warren <swarren@wwwdotorg.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  8 Feb 2016 21:58:30 -0700
Message-Id: <1454993910-24077-1-git-send-email-swarren@wwwdotorg.org>
X-Mailer: git-send-email 1.9.1
X-NVConfidentiality: public
X-Virus-Scanned: clamav-milter 0.98.6 at avon.wwwdotorg.org
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 70.85.31.133
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Stephen Warren <swarren@wwwdotorg.org>
Subject: [Qemu-arm] [PATCH V2] bcm2835_property: implement "get board
	revision" query
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rt1dCGxFa6zX

Return a valid value from the BCM2835 property mailbox query "get board
revision". This query is used by U-Boot. Implementing it fixes the first
obvious difference between qemu and real HW.

The value returned is currently hard-coded to match the RPi2 I own. Other
values are legal, e.g. different board manufacturer field values are
likely to exist in the wild.

Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
---
V2: Set the property in raspi.c, and pass it through to the property mbox
code via property aliases.

 hw/arm/bcm2835_peripherals.c       | 2 ++
 hw/arm/bcm2836.c                   | 2 ++
 hw/arm/raspi.c                     | 2 ++
 hw/misc/bcm2835_property.c         | 4 ++--
 include/hw/misc/bcm2835_property.h | 1 +
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 18b72ecb696c..e4fb48b8035c 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -58,6 +58,8 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Property channel */
     object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
     object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
+    object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
+                              "board-rev", &error_abort);
     qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
 
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 69c7438317c4..8a4d13c7d973 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -39,6 +39,8 @@ static void bcm2836_init(Object *obj)
                       TYPE_BCM2835_PERIPHERALS);
     object_property_add_child(obj, "peripherals", OBJECT(&s->peripherals),
                               &error_abort);
+    object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
+                              "board-rev", &error_abort);
     qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
 }
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 0c9427c40ec4..7d3d21ab3244 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -128,6 +128,8 @@ static void raspi2_init(MachineState *machine)
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
                             &error_abort);
+    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
+                            &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
 
     setup_boot(machine, 2, machine->ram_size);
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index e42b43e72d56..45bd6c18ce90 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -43,8 +43,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;
         case 0x00010002: /* Get board revision */
-            qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x get board revision NYI\n", tag);
+            stl_phys(&s->dma_as, value + 12, s->board_rev);
             resplen = 4;
             break;
         case 0x00010003: /* Get board MAC address */
@@ -258,6 +257,7 @@ static void bcm2835_property_realize(DeviceState *dev, Error **errp)
 }
 
 static Property bcm2835_property_props[] = {
+    DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
     DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index fcf5f3decafc..df889eaa08b5 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -23,6 +23,7 @@ typedef struct {
     MemoryRegion iomem;
     qemu_irq mbox_irq;
     MACAddr macaddr;
+    uint32_t board_rev;
     uint32_t ram_size;
     uint32_t addr;
     bool pending;
-- 
1.9.1

