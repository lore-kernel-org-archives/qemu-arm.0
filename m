Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1498231wru;
        Mon, 16 Jul 2018 06:19:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdD2EP9CMqnOEUWcbfplVFtxWfn0sj+y3PlsNl5lChwsENKYsfLVYks7ZWjBv7DoVKmqwOx
X-Received: by 2002:ac8:2c72:: with SMTP id e47-v6mr15327837qta.60.1531747199321;
        Mon, 16 Jul 2018 06:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531747199; cv=none;
        d=google.com; s=arc-20160816;
        b=My/bzmEccWc+21uUa7HsawUVo1qDmyUCNwP/5EpYgt2cdYssJ1eAWEMD8Fg+KmCtxu
         DlfNuyE68LBkRG5OTNC+dvI6T46uOOO5WDJ0yJI1gRebkhEruc+lGiKw6DSaLaa1nhyA
         jyMiI0+shzlUEokLHbwqGy+L2x26rUMCaMiV+8ZhPK9G4fXhtMSHv+ckwnaggG7SDSLy
         BG7nPR7k11PQeM0tZvhNOjx61q/eLgWQpvPL41iDyk8Lz3tQsfRXV0+DLJvvhEQJ5kjj
         2oanqRW1tK7tHR30yRKYnk8jbrZYXiC3vEzMwHGrN/mEDScFHn821cAE4UD7KZnrI6hV
         W+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=zJa1Ug0lEElr02m97MpV01e+4EMUNTKBUqdev2BArNs=;
        b=CQkfwbQaDWT48FWdEPHQUyMtnkqlFVMVoVyOk6YxdzzyEzGhMZxjYEZBUY51QxGlW0
         pflKW1begazPvohROCwiuGFOFX+CUat0EqlZ7qJbazj7w6mIgMIfTgHhrnq+BmF7PAbh
         uXKu312sEQVAHwzjoXhK20qBAhZw9DwuFjxcsXXSrsrZOIQlvyh3hfJTh7BBxLUn3CC6
         FJOlk5vWSODdwhJwwB86RyIiPosxugV8zKxVrZ8UqToBHDbHEiGUDxW4vXfEGcYV1wtq
         i6qnJRvpt9mxoQXAueuOk+Z0ZEHWjaDm3oK30wt6NrHZ+oMoUEDRHaj80tSxO4GJ7Okz
         29vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x186-v6si1200392qkd.254.2018.07.16.06.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3Py-0000Dc-OQ
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:19:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36u-0001cS-BW
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36o-0002Lk-GP
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35456 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36o-0002L3-BM; Mon, 16 Jul 2018 09:00:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE61D7DAC6;
	Mon, 16 Jul 2018 13:00:09 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B1111C589;
	Mon, 16 Jul 2018 13:00:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:33 +0200
Message-Id: <1531745974-17187-17-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:09 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 16/17] hw/display/xlnx_dp: Move problematic
 code from instance_init to realize
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CFq8bOFH1duy

From: Paolo Bonzini <pbonzini@redhat.com>

aux_create_slave() calls qdev_init_nofail() which in turn "realizes"
the corresponding object. This is unlike qdev_create(), and it is wrong
because qdev_init_nofail() must not be called from an instance_init
function.  Move qdev_init_nofail() and the subsequent aux_map_slave into
the caller's realize function.

There are two more bugs that needs to be fixed here, too, where the
objects are created but not added as children.  Therefore when
you call object_unparent on them, nothing happens.

In particular dpcd and edid give you an infinite loop in bus_unparent,
because device_unparent is not called and does not remove them from
the list of devices on the bus.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[thuth: Added Paolo's fixup for the dpcd and edid unparenting]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/xlnx_dp.c     |  8 +++++++-
 hw/misc/auxbus.c         | 18 ++++++++++++------
 include/hw/misc/auxbus.h | 14 +++++++++++++-
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 5130122..6439bd0 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1234,9 +1234,12 @@ static void xlnx_dp_init(Object *obj)
     /*
      * Initialize DPCD and EDID..
      */
-    s->dpcd = DPCD(aux_create_slave(s->aux_bus, "dpcd", 0x00000));
+    s->dpcd = DPCD(aux_create_slave(s->aux_bus, "dpcd"));
+    object_property_add_child(OBJECT(s), "dpcd", OBJECT(s->dpcd), NULL);
+
     s->edid = I2CDDC(qdev_create(BUS(aux_get_i2c_bus(s->aux_bus)), "i2c-ddc"));
     i2c_set_slave_address(I2C_SLAVE(s->edid), 0x50);
+    object_property_add_child(OBJECT(s), "edid", OBJECT(s->edid), NULL);
 
     fifo8_create(&s->rx_fifo, 16);
     fifo8_create(&s->tx_fifo, 16);
@@ -1248,6 +1251,9 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
     DisplaySurface *surface;
     struct audsettings as;
 
+    qdev_init_nofail(DEVICE(s->dpcd));
+    aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
+
     s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
     surface = qemu_console_surface(s->console);
     xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index b8a8721..0e56d9a 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -32,6 +32,7 @@
 #include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
 #include "monitor/monitor.h"
+#include "qapi/error.h"
 
 #ifndef DEBUG_AUX
 #define DEBUG_AUX 0
@@ -63,9 +64,14 @@ static void aux_bus_class_init(ObjectClass *klass, void *data)
 AUXBus *aux_init_bus(DeviceState *parent, const char *name)
 {
     AUXBus *bus;
+    Object *auxtoi2c;
 
     bus = AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
-    bus->bridge = AUXTOI2C(qdev_create(BUS(bus), TYPE_AUXTOI2C));
+    auxtoi2c = object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c",
+                                     &error_abort, NULL);
+    qdev_set_parent_bus(DEVICE(auxtoi2c), BUS(bus));
+
+    bus->bridge = AUXTOI2C(auxtoi2c);
 
     /* Memory related. */
     bus->aux_io = g_malloc(sizeof(*bus->aux_io));
@@ -74,9 +80,11 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *name)
     return bus;
 }
 
-static void aux_bus_map_device(AUXBus *bus, AUXSlave *dev, hwaddr addr)
+void aux_map_slave(AUXSlave *aux_dev, hwaddr addr)
 {
-    memory_region_add_subregion(bus->aux_io, addr, dev->mmio);
+    DeviceState *dev = DEVICE(aux_dev);
+    AUXBus *bus = AUX_BUS(qdev_get_parent_bus(dev));
+    memory_region_add_subregion(bus->aux_io, addr, aux_dev->mmio);
 }
 
 static bool aux_bus_is_bridge(AUXBus *bus, DeviceState *dev)
@@ -260,15 +268,13 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
                    memory_region_size(s->mmio));
 }
 
-DeviceState *aux_create_slave(AUXBus *bus, const char *type, uint32_t addr)
+DeviceState *aux_create_slave(AUXBus *bus, const char *type)
 {
     DeviceState *dev;
 
     dev = DEVICE(object_new(type));
     assert(dev);
     qdev_set_parent_bus(dev, &bus->qbus);
-    qdev_init_nofail(dev);
-    aux_bus_map_device(AUX_BUS(qdev_get_parent_bus(dev)), AUX_SLAVE(dev), addr);
     return dev;
 }
 
diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index 68ade8a..c15b444 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -123,6 +123,18 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
  */
 void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
 
-DeviceState *aux_create_slave(AUXBus *bus, const char *name, uint32_t addr);
+/* aux_create_slave: Create a new device on an AUX bus
+ *
+ * @bus The AUX bus for the new device.
+ * @name The type of the device to be created.
+ */
+DeviceState *aux_create_slave(AUXBus *bus, const char *name);
+
+/* aux_map_slave: Map the mmio for an AUX slave on the bus.
+ *
+ * @dev The AUX slave.
+ * @addr The address for the slave's mmio.
+ */
+void aux_map_slave(AUXSlave *dev, hwaddr addr);
 
 #endif /* HW_MISC_AUXBUS_H */
-- 
1.8.3.1

