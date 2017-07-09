Received: by 10.25.44.15 with SMTP id s15csp2630779lfs;
        Sun, 9 Jul 2017 14:04:38 -0700 (PDT)
X-Received: by 10.200.13.4 with SMTP id q4mr647184qti.221.1499634278406;
        Sun, 09 Jul 2017 14:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499634278; cv=none;
        d=google.com; s=arc-20160816;
        b=x+R43ZrjWZLr5NgfwNKLqio8YCHlkwl01zIhxatW45eytQS/Y5DlD+SKfYaG7AjG6S
         XdS8/I+E+mAZeF4Rj/+Yf9yOkqFCmd1OvuE8A73DIkh6ABCRzo2uraLCEc6FFM9hWzP6
         yup82+92UlG1whkqF+aCt+PTbgcX2QC3D44FT1zFsqwFeWaL7y7EOE/4R9GOmSoYzosD
         9Wt16c+xwDOx9rVg/ZzuEFLYQiUMl23jLOSHylv8rNJ9AYroWjxDc6AACldqwKma/DGw
         zMB4r64j4uwccN8F3uIBGgwvUjvbSVUNaSzIrY28suLE6OzMZVTPxrQ0odQf6y+ElBJV
         hFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=lxmDBh/AkRh31gSQPmpkJigkAs8e9xLTd8YljKIiUhw=;
        b=JOv7sBEInTWqASaqKwTPFCSJCQIgKQu2owKyQMJeDNNyL64LSD3UJ0wUImYFnEKWqS
         UpsCNiZO8sXwpWCvEQTzUQwjek/bDfYj2i3qMBgqAnIOpds3+s8/6vA2QkaKGnmobGlS
         3syPSyO+SYvksoXtGgsHnmD3UytAPDoz38eqcExdZTv+lh+g4Dorl00hWVFt6qJam2WG
         NvTF2qoipH1iecFmJgZ8vgXyqOkJdYm2ffWALUiblKM/vmGk+82o5O99s3S4oXrPsKwB
         ZaOotKqs0aPiC6eJOLh3cAHgwt4hgVTpFEbONTM91Vp2ZU7U55g/OVg8vSYurWm4hW2y
         wcTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o52si9330960qto.230.2017.07.09.14.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 14:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJNb-0001nV-IX
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 17:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLz-0000eK-6S
	for qemu-devel@nongnu.org; Sun, 09 Jul 2017 17:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLy-0004np-Bd
	for qemu-devel@nongnu.org; Sun, 09 Jul 2017 17:02:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJLw-0004ln-Cz; Sun, 09 Jul 2017 17:02:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 376AB3DD47;
	Sun,  9 Jul 2017 21:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 376AB3DD47
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 376AB3DD47
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA5B317DC6;
	Sun,  9 Jul 2017 21:02:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun,  9 Jul 2017 23:02:19 +0200
Message-Id: <1499634139-20399-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 09 Jul 2017 21:02:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RESEND v3 3/3] hw/pci-host/gpex: Implement PCI
 INTx routing
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
X-TUID: 4JHYehvT4/z3

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
index 0d42ac2..94cc3c1 100644
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

