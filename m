Received: by 10.25.21.156 with SMTP id 28csp121521lfv;
        Thu, 14 Jul 2016 07:32:15 -0700 (PDT)
X-Received: by 10.237.37.99 with SMTP id w32mr20955516qtc.95.1468506735750;
        Thu, 14 Jul 2016 07:32:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1si1466710qkb.168.2016.07.14.07.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 07:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNhgV-0002eX-55
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 10:32:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgw9-0003G0-29
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgw5-0001kU-75
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1bNgw5-0001kO-1L; Thu, 14 Jul 2016 09:44:17 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 734977DD22;
	Thu, 14 Jul 2016 13:44:16 +0000 (UTC)
Received: from work.redhat.com (vpn-202-40.tlv.redhat.com [10.35.202.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EDhkRR004016; Thu, 14 Jul 2016 09:44:12 -0400
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Jul 2016 16:43:44 +0300
Message-Id: <1468503826-10617-6-git-send-email-marcel@redhat.com>
In-Reply-To: <1468503826-10617-1-git-send-email-marcel@redhat.com>
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Jul 2016 13:44:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [Qemu-devel] [PATCH 5/7] hw/grackle: fix PCI bus
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
X-TUID: eLfgb9o+7SGU

Delay the host-bridge 'realization' until the
PCI root bus is attached.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/pci-host/grackle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 8f91216..2c8acda 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -72,7 +72,6 @@ PCIBus *pci_grackle_init(uint32_t base, qemu_irq *pic,
     GrackleState *d;
 
     dev = qdev_create(NULL, TYPE_GRACKLE_PCI_HOST_BRIDGE);
-    qdev_init_nofail(dev);
     s = SYS_BUS_DEVICE(dev);
     phb = PCI_HOST_BRIDGE(dev);
     d = GRACKLE_PCI_HOST_BRIDGE(dev);
@@ -92,6 +91,7 @@ PCIBus *pci_grackle_init(uint32_t base, qemu_irq *pic,
                                 0, 4, TYPE_PCI_BUS);
 
     pci_create_simple(phb->bus, 0, "grackle");
+    qdev_init_nofail(dev);
 
     sysbus_mmio_map(s, 0, base);
     sysbus_mmio_map(s, 1, base + 0x00200000);
-- 
2.4.3

