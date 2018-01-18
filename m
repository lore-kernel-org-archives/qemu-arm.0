Received: by 10.28.173.206 with SMTP id w197csp5979100wme;
        Wed, 17 Jan 2018 18:11:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBouVTCizXutS0UxyO97elMEONYwmV1wXDI3Q2BuiXGEV0vwvJLYATtw1jTLRBjmMXNzk7/Je
X-Received: by 10.37.207.4 with SMTP id f4mr1442764ybg.19.1516241500703;
        Wed, 17 Jan 2018 18:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516241500; cv=none;
        d=google.com; s=arc-20160816;
        b=duyCOi6NEbbl7qPnWF8+Px/XCtEOi9/y6UyWfOC/NGOYU3mA9GeNbqEnurIezR5qv0
         DwJixbI2nkWrpQ1R51K9WU+K4+KOFqy8fgxVxSRYZSo23qR0ZPzvaJrbIIL4YshZZoAh
         NZ8h/2h9zkhouPP6LLJdWgYDn/0QFWEpiGkkwP0CqOeHJOO2lUVGV1m5LZF37KMOZuFA
         gEpwudw0uzPKIZIqwqG/DvpqTVutYyWzZ6Fp3KAlTKOZkFaDge6I6mH42yrhE4NI7SgY
         TNaIHwR3r9qrKg08HY8HNsv/KB1wZhXy2PvR2BRmZ1/pJ1oQTwkJdMO83fqMShguPnjR
         ee0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=0jyg+n5Bi4/rMwbkZQm1pF0J2FG0uNN29bI+X1n3uYc=;
        b=rcCjGHdILMcEs795etWnPmkp6W3+kofjm9cvexKcKPJPYiJv1+Uv1aNx70MtO5TYN3
         0tDiTqfAFS93iLR0/HIec3cDoR2/vsCQs+e7D0HiqKwD1X5rPMI29n4CBMO5s6yMW6Ox
         PCJVqMkyrYhE+yqFaiXAQ0gRB8xwS9gMiA4vQDiy6o1762V5v8iS/zld2fOwyAJNNRRE
         PQ0eeMr8E7gZ+sK0/YevTHCm/pF7KmaNmsr9t1WbKbWVFi1za5lKrrwxVH8BJOqdSVoc
         yuI+kREqRRtwQ/gg+nzj7gHbfHGf9HmLaz9EMYHLzW/sMhlwutqOxslMgVuYEUYpgCW6
         p+aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u12si1457609ywl.241.2018.01.17.18.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 18:11:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebzg4-0001Dz-21
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 21:11:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ebzfG-0000hw-Oo
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 21:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ebzfF-0004iA-Pd
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 21:10:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ebzfF-0004hS-Ji; Wed, 17 Jan 2018 21:10:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4C737653D;
	Thu, 18 Jan 2018 02:10:48 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FE0517D93;
	Thu, 18 Jan 2018 02:10:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 00:09:48 -0200
Message-Id: <20180118021000.27203-8-ehabkost@redhat.com>
In-Reply-To: <20180118021000.27203-1-ehabkost@redhat.com>
References: <20180118021000.27203-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 Jan 2018 02:10:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 07/19] hw/arm/virt: Allow only supported dynamic
 sysbus devices
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
Cc: Marcel Apfelbaum <marcel@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7CVeWrWWaF9T

Replace the TYPE_SYS_BUS_DEVICE entry in the allowed sysbus
device list with the two device types that are really supported
by the virt machine: vfio-amd-xgbe and vfio-calxeda-xgmac.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20171125151610.20547-3-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7549895fd2..4a6fdcc4f5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -34,6 +34,8 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/primecell.h"
 #include "hw/arm/virt.h"
+#include "hw/vfio/vfio-calxeda-xgmac.h"
+#include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/devices.h"
 #include "net/net.h"
 #include "sysemu/block-backend.h"
@@ -1591,8 +1593,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
      * configuration of the particular instance.
      */
     mc->max_cpus = 255;
-    /*TODO: allow only sysbus devices that really work with this machine */
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.14.3

