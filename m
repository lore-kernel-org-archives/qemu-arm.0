Received: by 10.25.0.144 with SMTP id 138csp186855lfa;
        Fri, 14 Apr 2017 01:40:51 -0700 (PDT)
X-Received: by 10.55.75.68 with SMTP id y65mr5728494qka.2.1492159251833;
        Fri, 14 Apr 2017 01:40:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f21si1218096qte.254.2017.04.14.01.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 01:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cywmg-0000kU-KE
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 04:40:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjW-0006iq-5h
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjV-0008Mu-2T
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cywjU-0008Ma-Qq; Fri, 14 Apr 2017 04:37:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D6034E4CA;
	Fri, 14 Apr 2017 08:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7D6034E4CA
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7D6034E4CA
Received: from thinkpad.redhat.com (ovpn-116-243.ams2.redhat.com
	[10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D05217DF8;
	Fri, 14 Apr 2017 08:37:27 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2017 10:37:16 +0200
Message-Id: <20170414083717.13641-4-lvivier@redhat.com>
In-Reply-To: <20170414083717.13641-1-lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 14 Apr 2017 08:37:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/4] versatile: remove
 cannot_destroy_with_object_finalize_yet
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
Cc: Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bbQaawrYsAw7

cannot_destroy_with_object_finalize_yet was added by 4c315c2
("qdev: Protect device-list-properties against broken devices")
because "realview_pci" and "versatile_pci" were hanging
during "device-list-properties" cleanup (an infinite loop in
bus_unparent()).

We have this problem because the child is not removed from
the list of the PCI bus child because it has no defined parent:
qdev_set_parent_bus() set the device parent_bus pointer to bus, and
adds the device in the bus children list, but doesn't update the
device parent pointer.

To fix the problem, move all the involved parts to the realize function.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/pci-host/versatile.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 467cbb9..27fde46 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -380,20 +380,8 @@ static void pci_vpb_reset(DeviceState *d)
 
 static void pci_vpb_init(Object *obj)
 {
-    PCIHostState *h = PCI_HOST_BRIDGE(obj);
     PCIVPBState *s = PCI_VPB(obj);
 
-    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 1ULL << 32);
-    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 1ULL << 32);
-
-    pci_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), "pci",
-                        &s->pci_mem_space, &s->pci_io_space,
-                        PCI_DEVFN(11, 0), TYPE_PCI_BUS);
-    h->bus = &s->pci_bus;
-
-    object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_VERSATILE_PCI_HOST);
-    qdev_set_parent_bus(DEVICE(&s->pci_dev), BUS(&s->pci_bus));
-
     /* Window sizes for VersatilePB; realview_pci's init will override */
     s->mem_win_size[0] = 0x0c000000;
     s->mem_win_size[1] = 0x10000000;
@@ -403,10 +391,22 @@ static void pci_vpb_init(Object *obj)
 static void pci_vpb_realize(DeviceState *dev, Error **errp)
 {
     PCIVPBState *s = PCI_VPB(dev);
+    PCIHostState *h = PCI_HOST_BRIDGE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     pci_map_irq_fn mapfn;
     int i;
 
+    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 1ULL << 32);
+    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 1ULL << 32);
+
+    pci_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
+                        &s->pci_mem_space, &s->pci_io_space,
+                        PCI_DEVFN(11, 0), TYPE_PCI_BUS);
+    h->bus = &s->pci_bus;
+
+    object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_VERSATILE_PCI_HOST);
+    qdev_set_parent_bus(DEVICE(&s->pci_dev), BUS(&s->pci_bus));
+
     for (i = 0; i < 4; i++) {
         sysbus_init_irq(sbd, &s->irq[i]);
     }
@@ -503,8 +503,6 @@ static void pci_vpb_class_init(ObjectClass *klass, void *data)
     dc->reset = pci_vpb_reset;
     dc->vmsd = &pci_vpb_vmstate;
     dc->props = pci_vpb_properties;
-    /* Reason: object_unref() hangs */
-    dc->cannot_destroy_with_object_finalize_yet = true;
 }
 
 static const TypeInfo pci_vpb_info = {
@@ -526,19 +524,10 @@ static void pci_realview_init(Object *obj)
     s->mem_win_size[2] = 0x08000000;
 }
 
-static void pci_realview_class_init(ObjectClass *class, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(class);
-
-    /* Reason: object_unref() hangs */
-    dc->cannot_destroy_with_object_finalize_yet = true;
-}
-
 static const TypeInfo pci_realview_info = {
     .name          = "realview_pci",
     .parent        = TYPE_VERSATILE_PCI,
     .instance_init = pci_realview_init,
-    .class_init    = pci_realview_class_init,
 };
 
 static void versatile_pci_register_types(void)
-- 
2.9.3

