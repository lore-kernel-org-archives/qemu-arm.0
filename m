Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp425054wrt;
        Thu, 3 Jan 2019 01:16:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5vjIrB09Xa1IHGpqaEsTFdMd3JD5T6Yki/1uM3uEiE+nfNpXjURQV/u4NjilXv9MsScQ4t
X-Received: by 2002:a37:9a89:: with SMTP id c131mr43657736qke.173.1546507009162;
        Thu, 03 Jan 2019 01:16:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546507009; cv=none;
        d=google.com; s=arc-20160816;
        b=Oo1yOLj5fx9bbF1NY7/ns9CTuHePXpR9AIrXcWGl4wSTsJ4ipqnQzewIsz7BPI4AV2
         By6JnWOEOYSOxXKSEkldACE8zcRgMFfQ3txMMKqZgveIWtRojPRbyBujmb+SV/64Wpj2
         MjvE5CU7v0indtaLO0SL7rpbKNEV+E2ddYIdTCgRH5yuwu4XdqN1l3vP4xKCWolgjI9J
         7lEms9eehjfqo3avpz4IfJPQc8g9ckmIC19iYqc20J+XfavEZf3JRna65o+HSw79Pyq2
         jJf1F0JMOHMPEkXJJUmo5OZI7CEiYq8jIKOfmPCPPyM1Hn2m6RZjC5Mo0DR/UK4l+f8l
         JxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=TQS9Psdet9/bpW/+JUmWQX8MJWvW9+D7VqBY6WaPGe8=;
        b=oV7WHuI5kf7FSZNQtHajdoxMHvP1ht45Hg3TBOFml5CJV2ZD8pxY9TprURxACD6Fjp
         CPmPhbGRlAeNFmBUWov+S8MV1K4WBmFybK78oABwP62zBS8//cSVR8PL19vOQ+rGCVkv
         7atC6UmpGh6IFyqrMik5xH4RqVeD7nqdd75WmXKjPwLsjoLXGTNMGEXRXyWyHXs9HYJu
         sd5VaXTSfa3Yu/BDMhrn3TKCgvuOedt8ddUPzSC2aE3Tkd10MhE6Yt2ICl7WsOVxsdgr
         Ad7LvphWgKVqUua07vgoskfy/2BS1eBDTjeRgZ9BD2iXjSEtOan95afd87Jif8G/QJeH
         QmoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k6si2761463qte.125.2019.01.03.01.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez7Q-0007RJ-In
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:16:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3y-0003p9-Bo
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3u-0006lE-Gh
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3u-0006k3-9k; Thu, 03 Jan 2019 04:13:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91A71432B5;
	Thu,  3 Jan 2019 09:13:09 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20F0F5D75C;
	Thu,  3 Jan 2019 09:13:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:17 +0000
Message-Id: <20190103091119.9367-10-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 03 Jan 2019 09:13:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 09/11] arm: Instantiate NRF51 Timers
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X4kKK4eIrmbC

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Instantiates TIMER0 - TIMER2

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/arm/nrf51_soc.h |  4 ++++
 hw/arm/nrf51_soc.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 84e0278881..39e613e1c9 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -15,11 +15,14 @@
 #include "hw/char/nrf51_uart.h"
 #include "hw/misc/nrf51_rng.h"
 #include "hw/gpio/nrf51_gpio.h"
+#include "hw/timer/nrf51_timer.h"
=20
 #define TYPE_NRF51_SOC "nrf51-soc"
 #define NRF51_SOC(obj) \
     OBJECT_CHECK(NRF51State, (obj), TYPE_NRF51_SOC)
=20
+#define NRF51_NUM_TIMERS 3
+
 typedef struct NRF51State {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -30,6 +33,7 @@ typedef struct NRF51State {
     NRF51UARTState uart;
     NRF51RNGState rng;
     NRF51GPIOState gpio;
+    NRF51TimerState timer[NRF51_NUM_TIMERS];
=20
     MemoryRegion iomem;
     MemoryRegion sram;
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index db817fe506..ef70bd62fa 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -39,6 +39,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
     NRF51State *s =3D NRF51_SOC(dev_soc);
     MemoryRegion *mr;
     Error *err =3D NULL;
+    uint8_t i =3D 0;
+    hwaddr base_addr =3D 0;
=20
     if (!s->board_memory) {
         error_setg(errp, "memory property was not set");
@@ -112,6 +114,22 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
     /* Pass all GPIOs to the SOC layer so they are available to the boar=
d */
     qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, NULL);
=20
+    /* TIMER */
+    for (i =3D 0; i < NRF51_NUM_TIMERS; i++) {
+        object_property_set_bool(OBJECT(&s->timer[i]), true, "realized",=
 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        base_addr =3D NRF51_TIMER_BASE + i * NRF51_TIMER_SIZE;
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer[i]), 0, base_addr);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->cpu),
+                                            BASE_TO_IRQ(base_addr)));
+    }
+
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
     create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
@@ -122,6 +140,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
=20
 static void nrf51_soc_init(Object *obj)
 {
+    uint8_t i =3D 0;
+
     NRF51State *s =3D NRF51_SOC(obj);
=20
     memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX=
);
@@ -142,6 +162,12 @@ static void nrf51_soc_init(Object *obj)
=20
     sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
                           TYPE_NRF51_GPIO);
+
+    for (i =3D 0; i < NRF51_NUM_TIMERS; i++) {
+        sysbus_init_child_obj(obj, "timer[*]", &s->timer[i],
+                              sizeof(s->timer[i]), TYPE_NRF51_TIMER);
+
+    }
 }
=20
 static Property nrf51_soc_properties[] =3D {
--=20
2.19.2

