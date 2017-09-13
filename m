Received: by 10.223.172.38 with SMTP id v35csp835829wrc;
        Wed, 13 Sep 2017 02:49:23 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDx9YqIenmeyPlG4syMaY2vR82dDMzR1fmGufl5bygQNxPAaveFxAhnACNeqj5b4Zmnc54Y
X-Received: by 10.200.11.194 with SMTP id p2mr27481408qti.255.1505296163151;
        Wed, 13 Sep 2017 02:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505296163; cv=none;
        d=google.com; s=arc-20160816;
        b=jXSad6opIwJrJXx0qKXgT5ac9yVYNl3YR9S7iSOC5s/jJ5I73X36EX+5C7zUiK2Mzq
         xDdlsIt4tByn07sSYfcm55JcQ+smgmA2VG4I0poFVFi/VKryP1mIfRpLij+3nLgeBTxT
         MqE4KyqmnXret3w4LF3uMxNYZJ4inEK+SgOy2UsAivI1scDDzQpXykGm5Ai2ebNHyGeR
         v6xZYj+KpDuXuemSImf0PYzlTlwv+/QZnrpO/K3UwBAi3pjT0X8u9PdzzopE07ObU7OY
         /yc2tnkrXL8Eka60TEqzv1ViMODTWaWpc0bbYmDK7XUEngyJRkNAhtBLRGc/tznD0NpM
         3gRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=irnTuscYPUdaWe01wIrLhZxVaPCpUwDK4YY2BnhDcp4=;
        b=VxCY9z85+lSsHjJrAyuK9gSs1X97m9YnP8YdM7JmDW7eNLqK8TykABYp2lVfqGFnUc
         tihTv8iH2UyJ2tuV2sAH2wZIaPBQSwHjRAArC31Wma/D2bdE7krmlZJltrj3QuAVFumg
         aME0QaNVfDGsCGkc8iVnNnGqGiC856OjcyIAYdJjq0k+OPKuh1Zjmi2J9ILPpznegH8O
         hK2tj2981pnmZA2oe1DOQ3mLrp/eOsNWszaHse98yE/M5YSY9+N8l0hPt5v4nTDz+DYA
         qcEFI4m+RuQRspV90sSY6VJvpzJTmWCI3Ba5EegxZVe89NvgEAwpLjbiwk2MLk+bPRqt
         Z8Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3si3533912qkb.415.2017.09.13.02.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 02:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds4IL-0001rH-1o
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 05:49:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4GJ-00004r-RL
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 05:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4GI-0006aN-ST
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 05:47:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ds4GD-0006UQ-66; Wed, 13 Sep 2017 05:47:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F17C37EEC;
	Wed, 13 Sep 2017 09:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1F17C37EEC
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-228.ams2.redhat.com
	[10.36.117.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7337F60841;
	Wed, 13 Sep 2017 09:47:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 11:46:44 +0200
Message-Id: <1505296004-6798-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
References: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 13 Sep 2017 09:47:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 3/3] hw/pci-host/gpex: Implement PCI INTx
 routing
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, agraf@suse.de,
	christoffer.dall@linaro.org, pranavkumar@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qsT3juXuHZV3

From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>

Now we are able to retrieve the gsi from the INTx pin, let's
enable intx_to_irq routing. From that point on, irqfd becomes
usable along with INTx when assigning a PCIe device.

Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Tested-by: Feng Kan <fkan@apm.com>

---

v3 -> v4:
- remove the cast to int
- added Drew's R-b
---
 hw/pci-host/gpex.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 41a884d..be25245 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -53,6 +53,17 @@ int gpex_set_irq_num(GPEXHost *s, int index, int gsi)
     return 0;
 }
 
+static PCIINTxRoute gpex_route_intx_pin_to_irq(void *opaque, int pin)
+{
+    PCIINTxRoute route;
+    GPEXHost *s = opaque;
+
+    route.mode = PCI_INTX_ENABLED;
+    route.irq = s->irq_num[pin];
+
+    return route;
+}
+
 static void gpex_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
@@ -77,6 +88,7 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
                                 &s->io_ioport, 0, 4, TYPE_PCIE_BUS);
 
     qdev_set_parent_bus(DEVICE(&s->gpex_root), BUS(pci->bus));
+    pci_bus_set_route_irq_fn(pci->bus, gpex_route_intx_pin_to_irq);
     qdev_init_nofail(DEVICE(&s->gpex_root));
 }
 
-- 
2.5.5

