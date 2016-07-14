Received: by 10.25.21.156 with SMTP id 28csp115841lfv;
        Thu, 14 Jul 2016 07:20:29 -0700 (PDT)
X-Received: by 10.200.43.47 with SMTP id 44mr20215427qtu.66.1468506029669;
        Thu, 14 Jul 2016 07:20:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t66si1446370qke.81.2016.07.14.07.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 07:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNhV7-000651-3E
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 10:20:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgvx-00035x-W0
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgvv-0001hQ-Kn
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1bNgvv-0001hH-FV; Thu, 14 Jul 2016 09:44:07 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEA294EB10;
	Thu, 14 Jul 2016 13:44:06 +0000 (UTC)
Received: from work.redhat.com (vpn-202-40.tlv.redhat.com [10.35.202.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EDhkRP004016; Thu, 14 Jul 2016 09:44:02 -0400
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Jul 2016 16:43:42 +0300
Message-Id: <1468503826-10617-4-git-send-email-marcel@redhat.com>
In-Reply-To: <1468503826-10617-1-git-send-email-marcel@redhat.com>
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 14 Jul 2016 13:44:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [Qemu-devel] [PATCH 3/7] hw/mips: fix PCI bus
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
X-TUID: PW3i/0eaGeKu

Delay the host-bridge 'realization' until the
PCI root bus is attached.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/mips/gt64xxx_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 3f4523d..4811843 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1167,7 +1167,6 @@ PCIBus *gt64120_register(qemu_irq *pic)
     DeviceState *dev;
 
     dev = qdev_create(NULL, TYPE_GT64120_PCI_HOST_BRIDGE);
-    qdev_init_nofail(dev);
     d = GT64120_PCI_HOST_BRIDGE(dev);
     phb = PCI_HOST_BRIDGE(dev);
     memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", UINT32_MAX);
@@ -1178,6 +1177,7 @@ PCIBus *gt64120_register(qemu_irq *pic)
                                 &d->pci0_mem,
                                 get_system_io(),
                                 PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
+    qdev_init_nofail(dev);
     memory_region_init_io(&d->ISD_mem, OBJECT(dev), &isd_mem_ops, d, "isd-mem", 0x1000);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
-- 
2.4.3

