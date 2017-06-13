Received: by 10.25.0.23 with SMTP id 23csp322386lfa;
        Tue, 13 Jun 2017 06:32:14 -0700 (PDT)
X-Received: by 10.55.212.199 with SMTP id s68mr1859094qks.88.1497360734117;
        Tue, 13 Jun 2017 06:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497360734; cv=none;
        d=google.com; s=arc-20160816;
        b=dsAgmPIYPtop35DYWIsz8YtQOKHR5yqKfsXEt5fJYX1MEkJF+dJxcG2GGG5JY6CfWZ
         kb5pHEA+44VZIRfigj+/NuqXOYQ/UqlCFGTpCc4O01fPgUdu9T4+Pc0AAV+a73Tv8Dcb
         paesFDkh1zQQ5feKQUea09edl77HxbPOa6B7Rzp6ktXD+XkX8rNzr9hkGpEkbjRcT9GI
         CsKyzyAYes3QsoDW6xaAI3BBRbXV5Kv0V6RrKk3zcvFYHGKWywgbI4L505ClmVLC3zsK
         LzS3CnhNHxpocJgKR5L9JfdjrWwwDy0w75HKmvKROzWx9sQLBpfS7uUOjK6TdLsI0xrY
         +bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=LmnAD9NAEbp6Fjq2QaipkN2LvH9Ssl+daLbtgEamPg8=;
        b=Rlvhz5hbPxL3MiK+fVLU5pOcwfz8EeCk0IiwvoloujWFKiEPz7DYdw7qOgZRhMjZfB
         3Hiqb+Bp/ZrIzmEWubWfT9ylA2O1d0SnB53cKGXHF8TadUcxqNetQ2oIhoroWlLm+MZG
         QVlKfREk7lITYMjcM+eboJtJG7A6TOZ1Rr4G4C4fbJRall2pccAoI1mkAlOtoinE8fa9
         mqWFOeW5tcNYIC+EH1wngeTpBRMriVZkUx6z39Ts9vll4AXg1brJB46Z596RtC+EhZiy
         AfrBoElToXeV2xCPnunXwKyXm28zc8SxgH3C2qGvTGnnC4KFl/VEvPGSfChA2D3ZXc6Y
         pNzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k72si11578897qke.301.2017.06.13.06.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Jun 2017 06:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKlvX-000817-D0
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 09:32:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKlvM-0007y2-Im
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKlvJ-0008Js-Gg
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:32:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dKlvJ-0008JT-Ac; Tue, 13 Jun 2017 09:31:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B302D5986;
	Tue, 13 Jun 2017 13:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0B302D5986
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0B302D5986
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A4E18C57D;
	Tue, 13 Jun 2017 13:31:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 13 Jun 2017 15:31:17 +0200
Message-Id: <1497360677-4780-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1497360677-4780-1-git-send-email-eric.auger@redhat.com>
References: <1497360677-4780-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 13 Jun 2017 13:31:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 3/3] hw/pci-host/gpex: Implement PCI INTx
 routing
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
Cc: drjones@redhat.com, agraf@suse.de, christoffer.dall@linaro.org,
	pranavkumar@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TJiL2EcnQT5T

From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>

Now we are able to retrieve the gsi from the INTx pin, let's
enable intx_to_irq routing. From that point on, irqfd becomes
usable along with INTx when assigning a PCIe device.

Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci-host/gpex.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 22367aa4..2ec918b 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -53,6 +53,17 @@ int gpex_set_irq_num(GPEXHost *s, int index, uint32_t gsi)
     return 0;
 }
 
+static PCIINTxRoute gpex_route_intx_pin_to_irq(void *opaque, int pin)
+{
+    PCIINTxRoute route;
+    GPEXHost *s = opaque;
+
+    route.mode = PCI_INTX_ENABLED;
+    route.irq = (int)s->irq_num[pin];
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

