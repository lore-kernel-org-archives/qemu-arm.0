Received: by 10.25.21.156 with SMTP id 28csp121397lfv;
        Thu, 14 Jul 2016 07:32:00 -0700 (PDT)
X-Received: by 10.13.249.66 with SMTP id j63mr9716534ywf.270.1468506720551;
        Thu, 14 Jul 2016 07:32:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 131si1468141qkf.152.2016.07.14.07.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 07:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNhgF-0002No-Fj
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 10:31:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgw1-00039Y-L5
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgw0-0001iU-H8
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1bNgw0-0001iP-Bh; Thu, 14 Jul 2016 09:44:12 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B93563E2BB;
	Thu, 14 Jul 2016 13:44:11 +0000 (UTC)
Received: from work.redhat.com (vpn-202-40.tlv.redhat.com [10.35.202.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EDhkRQ004016; Thu, 14 Jul 2016 09:44:07 -0400
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Jul 2016 16:43:43 +0300
Message-Id: <1468503826-10617-5-git-send-email-marcel@redhat.com>
In-Reply-To: <1468503826-10617-1-git-send-email-marcel@redhat.com>
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 14 Jul 2016 13:44:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [Qemu-devel] [PATCH 4/7] hw/apb: fix PCI bus
 initialization
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, mst@redhat.com,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, marcel@redhat.com,
	leon.alrae@imgtec.com, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W0wuQVOB7tSe

Create and connect the PCI root bus to the
host bridge before the later is 'realized'.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/pci-host/apb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/apb.c b/hw/pci-host/apb.c
index babbbef..16587f8 100644
--- a/hw/pci-host/apb.c
+++ b/hw/pci-host/apb.c
@@ -670,6 +670,13 @@ PCIBus *pci_apb_init(hwaddr special_base,
 
     /* Ultrasparc PBM main bus */
     dev = qdev_create(NULL, TYPE_APB);
+    d = APB_DEVICE(dev);
+    phb = PCI_HOST_BRIDGE(dev);
+    phb->bus = pci_register_bus(DEVICE(phb), "pci",
+                                pci_apb_set_irq, pci_pbm_map_irq, d,
+                                &d->pci_mmio,
+                                get_system_io(),
+                                0, 32, TYPE_PCI_BUS);
     qdev_init_nofail(dev);
     s = SYS_BUS_DEVICE(dev);
     /* apb_config */
@@ -678,18 +685,10 @@ PCIBus *pci_apb_init(hwaddr special_base,
     sysbus_mmio_map(s, 1, special_base + 0x1000000ULL);
     /* pci_ioport */
     sysbus_mmio_map(s, 2, special_base + 0x2000000ULL);
-    d = APB_DEVICE(dev);
 
     memory_region_init(&d->pci_mmio, OBJECT(s), "pci-mmio", 0x100000000ULL);
     memory_region_add_subregion(get_system_memory(), mem_base, &d->pci_mmio);
 
-    phb = PCI_HOST_BRIDGE(dev);
-    phb->bus = pci_register_bus(DEVICE(phb), "pci",
-                                pci_apb_set_irq, pci_pbm_map_irq, d,
-                                &d->pci_mmio,
-                                get_system_io(),
-                                0, 32, TYPE_PCI_BUS);
-
     *pbm_irqs = d->pbm_irqs;
     d->ivec_irqs = ivec_irqs;
 
-- 
2.4.3

