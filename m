Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3625402wrw;
        Mon, 12 Nov 2018 13:52:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5eaxyZEwoszC6sC/6AIrYC6F+1xl/vAlE02HXMdWqXNRoKCao5aSo619KZ3i2cp7e+s2Ajx
X-Received: by 2002:a37:7dc4:: with SMTP id y187-v6mr2626905qkc.211.1542059559596;
        Mon, 12 Nov 2018 13:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542059559; cv=none;
        d=google.com; s=arc-20160816;
        b=OEkBPy9A6HDSuZTFqePkm04zKFwuynA21Z/TjzRe9Gy7sBHKdkzRTpmMW8/gyd01gi
         aE69je5hs7Z13zNoFd/M3R0aU2+Tj5Vu7jR/faA9xpUeGMfC3M3kNhJlUjbYFcDfAqln
         tyRMTyT2P7zXztWaMI+7lhDP0Kr5dhfm0z0ma8FRI5hkU055ir/NufYUZ7VDCXcENCxQ
         t0NMIKHF1npwkdKokRTgFJetRPKEuVuVJrStWY32r82DcsPinvlBQJxOMtYMrhCJu1Qd
         fhr4WFYXUW16nFUEFESYhWwTyUVfOz2N6VVFXTxkQy+Sm+SeFE1KAviE8NKwKPE9UJc1
         ogPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=eVYcgpELdAZUBYHljuG1fiUWBA1ivFwsRMayO2jDCuk=;
        b=aIvJY1O9jHAkXoVgdj99MB0VgJW1i6hpliX1RjDmXNqGgLXwauQD/VLRnNGR/jlL+r
         0C4McfI4+ESI/6wh8AhYGpzPQQRDtXlq/9Php06T7B4SLDkRYXgSSx1Wuah//XSakGVA
         OYfj6rymmovTL4wdqgzAsivqdeADaoFcgXFGssPsOiymp7zoFrP3QofUvnSvNNnluO5A
         uaOIHE7TE98JiFDu+xFmsSoyM1TYZb702yu4cCCFESNadnamSCnGzq44YF/wQHX+MhSt
         /TnGJHAoNeMaZ/1yleB5dT1baYzI75PLPf3z9D2Ti81MsqVuQi97tUBHeCEbOaaouL2B
         7oOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si2928542qto.355.2018.11.12.13.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 13:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMK8N-0000Ut-2F
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 16:52:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJzG-0006xp-Ug
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 16:43:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJzC-0002rk-R1
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 16:43:14 -0500
Received: from steffen-goertz.de ([88.198.119.201]:35628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gMJzC-0002eh-GP; Mon, 12 Nov 2018 16:43:10 -0500
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 3CEBD50722;
	Mon, 12 Nov 2018 22:39:43 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Mon, 12 Nov 2018 16:42:22 -0500
Message-Id: <20181112214224.31560-13-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181112214224.31560-1-contrib@steffen-goertz.de>
References: <20181112214224.31560-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v5 12/14] arm: Instantiate NRF51 Timers
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
	Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tvkPE7o5cjAN

Instantiates TIMER0 - TIMER2

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 893627b7aa..86ee91c7cc 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -41,6 +41,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
     NRF51State *s =3D NRF51_SOC(dev_soc);
     MemoryRegion *mr;
     Error *err =3D NULL;
+    uint8_t i =3D 0;
+    hwaddr base_addr =3D 0;
=20
     if (!s->board_memory) {
         error_setg(errp, "memory property was not set");
@@ -129,6 +131,22 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
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
=20
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
@@ -138,6 +156,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
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
@@ -161,6 +181,13 @@ static void nrf51_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
                           TYPE_NRF51_GPIO);
=20
+    for (i =3D 0; i < NRF51_NUM_TIMERS; i++) {
+        sysbus_init_child_obj(obj, "timer[*]", &s->timer[i],
+                              sizeof(s->timer[i]), TYPE_NRF51_TIMER);
+
+    }
+
+
 }
=20
 static Property nrf51_soc_properties[] =3D {
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index d4a48ccf91..89525dcb39 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -16,11 +16,14 @@
 #include "hw/misc/nrf51_rng.h"
 #include "hw/nvram/nrf51_nvm.h"
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
@@ -32,6 +35,7 @@ typedef struct NRF51State {
     NRF51RNGState rng;
     NRF51NVMState nvm;
     NRF51GPIOState gpio;
+    NRF51TimerState timer[NRF51_NUM_TIMERS];
=20
     MemoryRegion iomem;
     MemoryRegion sram;
--=20
2.19.1

