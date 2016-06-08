Received: by 10.25.27.66 with SMTP id b63csp2723163lfb;
        Wed, 8 Jun 2016 13:50:45 -0700 (PDT)
X-Received: by 10.140.25.174 with SMTP id 43mr6389822qgt.5.1465419045227;
        Wed, 08 Jun 2016 13:50:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 91si1719336qga.89.2016.06.08.13.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 13:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAkR2-0004Q7-Ii
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 16:50:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAkQw-0004P1-HH
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 16:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAkQu-0002Vv-B1
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 16:50:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bAkQu-0002Vi-5A; Wed, 08 Jun 2016 16:50:36 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93D0F37E64;
	Wed,  8 Jun 2016 20:50:35 +0000 (UTC)
Received: from localhost (vpn1-7-43.gru2.redhat.com [10.97.7.43])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58KoYGY015254; Wed, 8 Jun 2016 16:50:35 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  8 Jun 2016 17:50:24 -0300
Message-Id: <1465419025-21519-2-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1465419025-21519-1-git-send-email-ehabkost@redhat.com>
References: <1465419025-21519-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 08 Jun 2016 20:50:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/2] pxa2xx: Unconditionally enable USB
 controller
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
Cc: Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RIAFy+EMKFaE

Simplify initialization logic by removing the usb_enabled()
check. The USB controller is part of the SoC, so it doesn't make
sense to create a system where it is not present.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: qemu-arm@nongnu.org,
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/pxa2xx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index e41a7c9..cb55704 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2165,10 +2165,8 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
         s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
     }
 
-    if (usb_enabled()) {
-        sysbus_create_simple("sysbus-ohci", 0x4c000000,
-                        qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
-    }
+    sysbus_create_simple("sysbus-ohci", 0x4c000000,
+                         qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
 
     s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
     s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
@@ -2298,10 +2296,8 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
         s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
     }
 
-    if (usb_enabled()) {
-        sysbus_create_simple("sysbus-ohci", 0x4c000000,
-                        qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
-    }
+    sysbus_create_simple("sysbus-ohci", 0x4c000000,
+                         qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
 
     s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
     s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
-- 
2.5.5

