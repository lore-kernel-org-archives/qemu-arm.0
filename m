Received: by 10.25.85.209 with SMTP id j200csp1201197lfb;
        Mon, 13 Jun 2016 06:16:43 -0700 (PDT)
X-Received: by 10.55.8.2 with SMTP id 2mr13827098qki.200.1465823803201;
        Mon, 13 Jun 2016 06:16:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b188si15159683qhd.6.2016.06.13.06.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 06:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCRjO-0004ks-Hs
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 09:16:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bCRdc-00088a-0O
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 09:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1bCRdW-0008Up-T7
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 09:10:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1bCRdR-0008SB-EA; Mon, 13 Jun 2016 09:10:33 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2C9B1393FE;
	Mon, 13 Jun 2016 13:10:32 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DDAWtX005518; Mon, 13 Jun 2016 09:10:32 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 3111A8191D; Mon, 13 Jun 2016 15:10:31 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 15:10:28 +0200
Message-Id: <1465823429-24403-4-git-send-email-kraxel@redhat.com>
In-Reply-To: <1465823429-24403-1-git-send-email-kraxel@redhat.com>
References: <1465823429-24403-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 13 Jun 2016 13:10:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/4] pxa2xx: Unconditionally enable USB
 controller
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6vdCJiWjgddS

From: Eduardo Habkost <ehabkost@redhat.com>

Simplify initialization logic by removing the usb_enabled()
check. The USB controller is part of the SoC, so it doesn't make
sense to create a system where it is not present.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: qemu-arm@nongnu.org,
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 1465419025-21519-2-git-send-email-ehabkost@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
1.8.3.1

