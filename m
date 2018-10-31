Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp6278749wro;
        Tue, 30 Oct 2018 17:40:26 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cZ8TctpFIKDd3RgpkesnXTsV63p7Eh3NATOa6Uugx3ytfQl85NSq3iyqfazahPUgm1Nehs
X-Received: by 2002:a37:8d4:: with SMTP id 203mr794328qki.338.1540946426780;
        Tue, 30 Oct 2018 17:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540946426; cv=none;
        d=google.com; s=arc-20160816;
        b=Np2d0H7p4DsqlBS4XZjNWcGB7mF56CiiFDUi1Zr2o2LP8f3Z8Ji4pDTv3uRL0RG8Ua
         tyo9b/4KS8PEZ2+XAorLhJZ3wCoY9TpCmLfNAFADAPiCVpq/3McmtnzwaM0rZSPlQcrD
         jIwinITPYeM1jmpwMRdVh8L9dDy0F3GFBYXKsTn0eFKqrW47D4Z5ORpjT2Dpza7AFLzf
         4r2aL4MKROVCG21HmgBOzD+E7Jo/NXJBn4ddHXkYLx6QitrL0i/Tmch+I+dOz9GQaXp7
         YTHKkwb0uR1IqLYJIYv2eWqg4e+XNA3UBfnk+uhN9VGWqGyMnOEgjwzoi/q9Ww0Z6QqH
         IWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=I8QCrLNlx2UBno0rGYQLqp6c7Q9Ve2h3mkhwC113ZnY=;
        b=LuR0eCs9jhaI7K7vU8cCbeTbvamOD2t0mJf02+peD/LYwUVUNaDctz7gF3TnqTF9zI
         AcKcfXAc52dZttpJ+TRS+6AQXRjMqpvkxNE13NGUeqw0B+nd1tkzIp1iJg6CQ4q6HtoO
         gNVE3lI+OqrpfjilX6iUit0hwPPO5/2dlh7PBEqTA/DmowuG/E6e/rubWSRRNIJ2FSOy
         hOvmNYOP6aWr6XBPG2AhhQvZCt5R9Y6Tux6dYnlbm6ci2ACyQRj7OfMrhHOZA50Co14Q
         mhtKWRjhT51J3C2ONhmC0H98+cVAfNk8wS6Nfn33NOnq7ivM2pVBFm1EaHT1KBImkRMp
         h29A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z19-v6si9502385qtn.184.2018.10.30.17.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 17:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHeYc-0001yQ-87
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 20:40:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeLX-0005RW-Mm
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gHeLU-0000b9-BB
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 20:26:55 -0400
Received: from steffen-goertz.de ([88.198.119.201]:60506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gHeLU-0000IE-1t; Tue, 30 Oct 2018 20:26:52 -0400
Received: from gouranga.fios-router.home
	(pool-71-183-97-129.nycmny.fios.verizon.net [71.183.97.129])
	by steffen-goertz.de (Postfix) with ESMTPSA id C89A44FB77;
	Wed, 31 Oct 2018 01:23:36 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Tue, 30 Oct 2018 20:25:26 -0400
Message-Id: <20181031002526.14262-13-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031002526.14262-1-contrib@steffen-goertz.de>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH v3 12/13] arm: Instantiate NRF51 Timers
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
X-TUID: QoD8OSJzy/YM

Instantiates TIMER0 - TIMER2

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 695b335dc5..c29b80c0ca 100644
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
+        base_addr =3D NRF51_TIMER_BASE + i * 0x1000;
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

