Received: by 10.25.21.156 with SMTP id 28csp115896lfv;
        Thu, 14 Jul 2016 07:20:37 -0700 (PDT)
X-Received: by 10.200.56.253 with SMTP id g58mr21078132qtc.28.1468506037241;
        Thu, 14 Jul 2016 07:20:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si1447108qtu.73.2016.07.14.07.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 07:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNhVE-0006D0-Lk
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 10:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgwB-0003Jf-0t
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgwA-0001lo-6s
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:44:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1bNgwA-0001li-15; Thu, 14 Jul 2016 09:44:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E15AC05AA45;
	Thu, 14 Jul 2016 13:44:21 +0000 (UTC)
Received: from work.redhat.com (vpn-202-40.tlv.redhat.com [10.35.202.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EDhkRS004016; Thu, 14 Jul 2016 09:44:16 -0400
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Jul 2016 16:43:45 +0300
Message-Id: <1468503826-10617-7-git-send-email-marcel@redhat.com>
In-Reply-To: <1468503826-10617-1-git-send-email-marcel@redhat.com>
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 14 Jul 2016 13:44:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [Qemu-devel] [PATCH 6/7] hw/prep: realize the PCI root
 bus as part of the prep init
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
X-TUID: tFV7MVQIKhan

'Realize' the PCI root bus manually since the 'realize' mechanism
does not propagate to child devices yet.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/pci-host/prep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 487e32e..5580293 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -247,6 +247,7 @@ static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
     memory_region_add_subregion(address_space_mem, 0xbffffff0, &s->pci_intack);
 
     /* TODO Remove once realize propagates to child devices. */
+    object_property_set_bool(OBJECT(&s->pci_bus), true, "realized", errp);
     object_property_set_bool(OBJECT(&s->pci_dev), true, "realized", errp);
 }
 
-- 
2.4.3

