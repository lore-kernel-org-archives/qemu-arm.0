Received: by 10.25.21.156 with SMTP id 28csp119096lfv;
        Thu, 14 Jul 2016 07:27:09 -0700 (PDT)
X-Received: by 10.200.48.112 with SMTP id g45mr21682857qte.70.1468506429089;
        Thu, 14 Jul 2016 07:27:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o13si1432823qkl.331.2016.07.14.07.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 07:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNhbY-0005wz-EM
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 10:27:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgvs-00030R-QR
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgvr-0001ge-2C
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1bNgvq-0001gY-Ta; Thu, 14 Jul 2016 09:44:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BBCFC0885C4;
	Thu, 14 Jul 2016 13:44:02 +0000 (UTC)
Received: from work.redhat.com (vpn-202-40.tlv.redhat.com [10.35.202.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EDhkRO004016; Thu, 14 Jul 2016 09:43:57 -0400
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Jul 2016 16:43:41 +0300
Message-Id: <1468503826-10617-3-git-send-email-marcel@redhat.com>
In-Reply-To: <1468503826-10617-1-git-send-email-marcel@redhat.com>
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 14 Jul 2016 13:44:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [Qemu-devel] [PATCH 2/7] hw/alpha: fix PCI bus
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
X-TUID: VXj1H3wwq/iE

Delay the host-bridge 'realization' until the
PCI root bus is attached.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/alpha/typhoon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 97721b5..883db13 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -824,7 +824,6 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
     int i;
 
     dev = qdev_create(NULL, TYPE_TYPHOON_PCI_HOST_BRIDGE);
-    qdev_init_nofail(dev);
 
     s = TYPHOON_PCI_HOST_BRIDGE(dev);
     phb = PCI_HOST_BRIDGE(dev);
@@ -889,6 +888,7 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
                          &s->pchip.reg_mem, &s->pchip.reg_io,
                          0, 64, TYPE_PCI_BUS);
     phb->bus = b;
+    qdev_init_nofail(dev);
 
     /* Host memory as seen from the PCI side, via the IOMMU.  */
     memory_region_init_iommu(&s->pchip.iommu, OBJECT(s), &typhoon_iommu_ops,
-- 
2.4.3

