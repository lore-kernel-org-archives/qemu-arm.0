Received: by 10.223.161.27 with SMTP id o27csp48384wro;
        Mon, 23 Oct 2017 09:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SoA0wVrCnWkXThg+HwG0FLMdsQljBiF9WngeShHye97rKN6S7u8j0i6rNYb2kBeK6ozRTE
X-Received: by 10.37.165.74 with SMTP id h68mr8646229ybi.300.1508776245410;
        Mon, 23 Oct 2017 09:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508776245; cv=none;
        d=google.com; s=arc-20160816;
        b=KzrJC/2lRPnycMuvjpWEpSsRMhBorHQngTGQ/l40AzVz1kK66g4iWBWd399cBApBhS
         8XzM4l+U1+E1ugzZ8H6XoiLYEt4VgArXFgW3BbTsq2Ld+Efc2zz9++APYtabd96KNqbl
         2JEA4DMx0WTDlMis3ExMdPzEQsSdoOOKMskY22oFJj970SvZv2SdEUYxLHnH0PRqFmTU
         OlmU6kjjGVEA5XtDGBhAXn2UqPYk1tlp3qPncVcZyWKPQXebd4nV3UYg48JqcCJvGh7R
         hNdOiwuI3QlTrrm66HUUFEJXh638AaOHhvT7hoOUMAeqjaaXzFHYTsRah7NuYPLzEhOt
         d+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=oOVTZjiZlaLkvsRqBEzVuHdQxCyIZ3hX3hdNPLWoBWU=;
        b=BKC+c2Mc6MYZAGNC5sqEi/5xBt72y2Mwwemu/QmWLDrXgvZx7Ahyl+2CZcyqUYO4Z8
         tbQ95ps+vgWyL61bJ6x3DTxZ9XlEVsyrYRKoFi/tJ99ILMg/uefBMucx93c6Iag6JoAp
         fyxS1uw33pvgSVWoHOTf5iW7pvhxR7NKZRmnHDfj7JJ7rSPcBcsuXMRY3ekWVF8ucc0c
         eB/wpE6uzVbvw2DMrP+AS4tfOV/ZZ6y1eVmSAvChviIK5O1T1IY+iWpFozHnz6dE0EXo
         YcADBTnQU1SCrDLtp2FWjn2eR4lIz9dtlCYSDWL7UvJxsdL3UbDaHJ9pYcn6uVIRKg6P
         1ujw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1si1258807ybf.775.2017.10.23.09.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 09:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6fci-00067j-PC
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 12:30:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6fcY-00066d-OU
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 12:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6fcT-0007XB-RG
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 12:30:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37792)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e6fcT-0007Wy-LV; Mon, 23 Oct 2017 12:30:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70F4F80C18;
	Mon, 23 Oct 2017 16:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 70F4F80C18
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7402382A36;
	Mon, 23 Oct 2017 16:30:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 23 Oct 2017 18:30:11 +0200
Message-Id: <1508776211-22175-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 23 Oct 2017 16:30:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/pci-host/gpex: Improve INTX to gsi routing
 error checking
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
Cc: alex.williamson@redhat.com, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6EwMQsHaKgrp

We exposed gpex_set_irq_num() for machines to set the INTx to
GSI routing. However if the machine forgets to call that
function we currently do not check the association was properly
done. Let's initialize gsi values to -1 and if this value is
found in gpex_route_intx_pin_to_irq, set the routing mode as
disabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci-host/gpex.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 4090793..edf305b 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -57,9 +57,14 @@ static PCIINTxRoute gpex_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PCIINTxRoute route;
     GPEXHost *s = opaque;
+    int gsi = s->irq_num[pin];
 
-    route.mode = PCI_INTX_ENABLED;
-    route.irq = s->irq_num[pin];
+    route.irq = gsi;
+    if (gsi < 0) {
+        route.mode = PCI_INTX_DISABLED;
+    } else {
+        route.mode = PCI_INTX_ENABLED;
+    }
 
     return route;
 }
@@ -81,6 +86,7 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->io_ioport);
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_init_irq(sbd, &s->irq[i]);
+        s->irq_num[i] = -1;
     }
 
     pci->bus = pci_register_bus(dev, "pcie.0", gpex_set_irq,
-- 
2.5.5

