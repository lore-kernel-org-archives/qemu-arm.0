Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2358824wro;
        Fri, 2 Nov 2018 10:12:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eeuGwnn122i68LqhM1ynJDoP9E1x3bRGF2d+936Jbb+VPzuUbxvs6SG3EQQbOX5XMN38Nr
X-Received: by 2002:a0c:9de7:: with SMTP id p39mr11758235qvf.82.1541178731567;
        Fri, 02 Nov 2018 10:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541178731; cv=none;
        d=google.com; s=arc-20160816;
        b=ef8Gy7q5/E0OYe1OcFVgGIymbvpi0Y7NtWRsQhaVl974fQORJ1xS/mZJV8QaI46MJY
         WIHvXCX1UbgGUOM8570nCcQbp/ntN+aNbioc6V6aLJp4txdn7yKyT0DO1seaxtKkvAs7
         0CaatAEYFH0KOtGFGA8Hw3CYhpNHLzHOupca5WoqGMFdna9qhpzriLKgyPv7vw3UW2N1
         UTSoLgddMhuRmgSrLLqzHlxPgMzObvx/HVIMrrHWK+Q9JyK9ZE5iKnB30y0/raZteu25
         H3Uyfo29nKLadiNTVXHtX4AbPs0gNX/fJyCwfzQ1TFxOtBVabxNJUZqzyjZlTN0qVAK8
         13Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uM95kct3L3objc+nclzMXKIShdWb5MF1Ner9jkH694s=;
        b=Y5R/sBrRlk4B3hVFEza3UF4DzyCDrjTP21PLAFER25lUegJEDLPaPDRxxYsTcrhL5F
         3ch9EDSjzTHRrA6AL8i9GuWiB1FrXlxeu8omdJGNaYg12Hiu2JhaWobp5+O26d8GSdlF
         2kyQJDSiMfcQ1o1FDSxcamPGXTlSb8zhsmMEYhyqx178GEwTFlT5SS5UoTeFsWxUBX9U
         UcMR1Ut/4OEqzxybDGz90kNKMqhOIuNqtzR3NXZgmD4GGe5yHd4f+MxZOvr76+mtkzrr
         xp6o63ks8hkMPBVggV3o2dVr9Oynp7zsLJzWh35ZwYsHOv3zlWpMCtJZCOi7evyAwI2S
         lF7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f24-v6si710419qtp.279.2018.11.02.10.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 10:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIczS-0001vg-Jh
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 13:12:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcw1-0007iO-Hf
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gIcvx-0004pB-83
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:08:37 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gIcvu-0004YF-Oq; Fri, 02 Nov 2018 13:08:33 -0400
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 999294FF70;
	Fri,  2 Nov 2018 18:05:08 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:07:29 -0400
Message-Id: <20181102170730.12432-13-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102170730.12432-1-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v4 12/13] arm: Instantiate NRF51 Timers
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hzNeyY0URAVd

Instantiates TIMER0 - TIMER2

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 2c4e80892b..36dac03896 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -40,6 +40,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
     NRF51State *s =3D NRF51_SOC(dev_soc);
     MemoryRegion *mr;
     Error *err =3D NULL;
+    uint8_t i =3D 0;
+    hwaddr base_addr =3D 0;
=20
     if (!s->board_memory) {
         error_setg(errp, "memory property was not set");
@@ -141,6 +143,22 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
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
@@ -150,6 +168,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
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
@@ -173,6 +193,13 @@ static void nrf51_soc_init(Object *obj)
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

