Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1324690lfb;
        Thu, 14 May 2020 05:27:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJf0114SBJL8TLR5siPgpyerWGXZXFd/AjtLxEEfs7Zokvq0PL7kc6XNm0gHvErAkXoybL
X-Received: by 2002:a37:49d5:: with SMTP id w204mr4285196qka.335.1589459250382;
        Thu, 14 May 2020 05:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589459250; cv=none;
        d=google.com; s=arc-20160816;
        b=f+TBXGCKAJixgeQ8VNvkedX81beb72HhHsLJMzlcItntNsZdY+D0phUVaeLT5LcSN7
         MK1F2YJMnkujhLD+i77DI7rGZu+338zvcnR9mCP+jHJPeYO4jAgF8DNnMoT4liXSlZmw
         hZd8XB5SsVa5LyndAGRxzSFpDhxtF/1i8XSLqfP9xXt1FcMKCtR2RouStlg9f7TcP7yq
         9UIf9oJy5MvOmO60Xj4BIE9DxGqVRGaXqayX+A7k/E8+ZuL+4v5txJHsutpqwfl+BkZm
         VGAABwXf89FMGjbqyYrfyzg4CTifj2hGaoebPENmyi7oaDmxjqZw+lOdrkW1JYAoU3WA
         6dzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=ZTyxGJXsQ0G8ZMjcr3S07D1e5jsnMdhx5FHvtwszGE0=;
        b=gdmRz8M/Razvwmu8mcFXbrbULzc7uAISfEPV8+sPGcT5b2hX4jQCpKqiNyCJJhwfty
         wa5Q+MUBAHgJsV+SOOaXZ8vl+chIfaevXxOksdFWBAMw//vBJgaSQFk1ropKO4MtX/ZH
         SSL7/GMsEPbFjd/4YicC/csKzy+YAZ1FfDP6NZmFe2+JTtTTXfoRkpnL4zuQvPcRCna8
         +LIWAtmNwwnTOq5MX7vJAJZUumkzK4Xic6f2lFcEO4J8GQDJwzJakBhwPMBvYe1NycFv
         AgsW8ZYeaB8TTFJzcMIVWch41Jnc2Vxspqqq2vmxtnPlGdyx1fRaBhdNmnXGAzBay6C0
         H8Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nx+mpB58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si1513086qtq.192.2020.05.14.05.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 05:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nx+mpB58;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZCxV-00081X-P9
	for alex.bennee@linaro.org; Thu, 14 May 2020 08:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZCtx-0001hF-G8
 for qemu-arm@nongnu.org; Thu, 14 May 2020 08:23:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35715
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZCtu-0003Zv-8l
 for qemu-arm@nongnu.org; Thu, 14 May 2020 08:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589459025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ZTyxGJXsQ0G8ZMjcr3S07D1e5jsnMdhx5FHvtwszGE0=;
 b=Nx+mpB58i1G9i9cS5K/8m76Z4108nKqeN8XwkWHdzHjiDJ7Pt8lgppUt+mXN/z0PNUvIc7
 Ytlvx52sJLptaghbXfKMzcJqnUO4X6K05ohsSZpWWM+mO9U44NA1YteWustcevDxaVgNrv
 nbnrJPf0WFD0xOPCa9+lhKBuJ9j+iGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200--1YDrlElO3yxDNYovaGm1A-1; Thu, 14 May 2020 08:23:43 -0400
X-MC-Unique: -1YDrlElO3yxDNYovaGm1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D598474;
 Thu, 14 May 2020 12:23:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC8CF78379;
 Thu, 14 May 2020 12:23:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA2089DAF; Thu, 14 May 2020 14:23:34 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] wire in the dwc-hsotg (dwc2) USB host controller emulation
Date: Thu, 14 May 2020 14:23:33 +0200
Message-Id: <20200514122334.25089-7-kraxel@redhat.com>
In-Reply-To: <20200514122334.25089-1-kraxel@redhat.com>
References: <20200514122334.25089-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P+HOy8LL3ufJ

From: Paul Zimmerman <pauldzim@gmail.com>

Wire the dwc-hsotg (dwc2) emulation into Qemu

Reviewed-by: Philippe Mathieu-Daude <f4bug@amsat.org>
Signed-off-by: Paul Zimmerman <pauldzim@gmail.com>
Message-id: 20200512064900.28554-7-pauldzim@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/arm/bcm2835_peripherals.h |  3 ++-
 hw/arm/bcm2835_peripherals.c         | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 7a7a8f614146..48a0ad163358 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -27,6 +27,7 @@
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
 #include "hw/timer/bcm2835_systmr.h"
+#include "hw/usb/hcd-dwc2.h"
 #include "hw/misc/unimp.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
@@ -67,7 +68,7 @@ typedef struct BCM2835PeripheralState {
     UnimplementedDeviceState ave0;
     UnimplementedDeviceState bscsl;
     UnimplementedDeviceState smi;
-    UnimplementedDeviceState dwc2;
+    DWC2State dwc2;
     UnimplementedDeviceState sdramc;
 } BCM2835PeripheralState;
 
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 5e2c832d95f6..3b554cfac0c8 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -128,6 +128,13 @@ static void bcm2835_peripherals_init(Object *obj)
     sysbus_init_child_obj(obj, "mphi", &s->mphi, sizeof(s->mphi),
                           TYPE_BCM2835_MPHI);
 
+    /* DWC2 */
+    sysbus_init_child_obj(obj, "dwc2", &s->dwc2, sizeof(s->dwc2),
+                          TYPE_DWC2_USB);
+
+    object_property_add_const_link(OBJECT(&s->dwc2), "dma-mr",
+                                   OBJECT(&s->gpu_bus_mr), &error_abort);
+
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
                                    OBJECT(&s->sdhci.sdbus), &error_abort);
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
@@ -385,6 +392,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_HOSTPORT));
 
+    /* DWC2 */
+    object_property_set_bool(OBJECT(&s->dwc2), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, USB_OTG_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dwc2), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->dwc2), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_USB));
+
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
@@ -398,7 +418,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
-    create_unimp(s, &s->dwc2, "dwc-usb2", USB_OTG_OFFSET, 0x1000);
     create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
 }
 
-- 
2.18.4

