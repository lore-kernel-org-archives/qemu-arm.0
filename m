Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp427092wrt;
        Thu, 3 Jan 2019 01:19:46 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5N0gBHGBKRhvPXv35tHkYSE78DghfN0f6x+YecgcTTJ+Nnlf2qvrU9klYGib6cmor43fuZ
X-Received: by 2002:a37:4cd7:: with SMTP id z206mr44792493qka.233.1546507186749;
        Thu, 03 Jan 2019 01:19:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546507186; cv=none;
        d=google.com; s=arc-20160816;
        b=FX6bvuZ7vBK8V3tOOcgyU/rcpoZ31slPYR+W3tLuRrUOpBCefaU22X+6urWVlpN6e7
         SsA/8N3i98YDm1lyUOv3dagP4mpX837znvghUbm1SUrQ//QpeeJIZ/u+EIk3AiZxo6aZ
         pDi0k8OG9Fg8+lttsnbZ2F1Zp1nHKu++ch5bdn+1AZrP22cWh74+n+FhkExnCX2cUcDq
         lZDckSaLaEHdvNRSoUS2ufRKXmW1oqLmsUX+wUO670ZvTzRjmU6iEXzAJwXYIK5S6KJf
         V3U4WkjydOaeIrRjqDg9XwhXEnXdX0EgR20mkYf9BtP60GgC8igD0lQJQ6oscZo2vMQ7
         kUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MU+RtE57gtjf90I3KoED9ijrUQcjYYQUZqKxIkLkW24=;
        b=SWQJMSDAbCQ5yw5xBa2sOltOY2SYgF9PgJsrDSbmv3wySP6oK7F+oEYL73lCK8h47D
         fT9dwc6/Wr6FAMxb4OSQS8NQPgRn9CbL04AeBEjom4tft6fMBUNz7Nen45NxSi2ETi1o
         uWr0h+vzNbMZsCFrwci+E6N6Ywir2q+YgIWEy7fF+C222l2L6j6QUbWgHY4OTBRKoV7p
         RjIpbMZWWjj5wucJv46zgI/oIO6cARzxo3pIyvD2NbkEikwwGn7RZ/HBDyjjFuDIF5M0
         67XCgfM1vzFe56Gqv6Uut2s9hYzDNvgxiSg9LhqpNaFzq8y9WaILfzDX0/mBaQIPqQ61
         ciTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 45si2178356qtr.28.2019.01.03.01.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:19:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gezAI-0002GM-4E
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:19:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3e-0003QS-5z
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3b-0006Zh-Nq
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3b-0006YI-Fl; Thu, 03 Jan 2019 04:12:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6F5AC058CA2;
	Thu,  3 Jan 2019 09:12:50 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0464F600C4;
	Thu,  3 Jan 2019 09:12:46 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:11 +0000
Message-Id: <20190103091119.9367-4-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 03 Jan 2019 09:12:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 03/11] hw/misc/nrf51_rng: Add NRF51 random number
 generator peripheral
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
X-TUID: xLKiYRdhLZHu

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Add a model of the NRF51 random number generator peripheral.
This is a simple random generator that continuously generates
new random values after startup.

Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/misc/Makefile.objs       |   1 +
 include/hw/misc/nrf51_rng.h |  83 ++++++++++++
 hw/misc/nrf51_rng.c         | 262 ++++++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 include/hw/misc/nrf51_rng.h
 create mode 100644 hw/misc/nrf51_rng.c

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 680350b3c3..04f3bfa516 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -74,3 +74,4 @@ obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
 obj-$(CONFIG_AUX) +=3D auxbus.o
 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
 obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
+obj-$(CONFIG_NRF51_SOC) +=3D nrf51_rng.o
diff --git a/include/hw/misc/nrf51_rng.h b/include/hw/misc/nrf51_rng.h
new file mode 100644
index 0000000000..3d6bf79997
--- /dev/null
+++ b/include/hw/misc/nrf51_rng.h
@@ -0,0 +1,83 @@
+/*
+ * nRF51 Random Number Generator
+ *
+ * QEMU interface:
+ * + Property "period_unfiltered_us": Time between two biased values in
+ *   microseconds.
+ * + Property "period_filtered_us": Time between two unbiased values in
+ *   microseconds.
+ * + sysbus MMIO regions 0: Memory Region with tasks, events and registe=
rs
+ *   to be mapped to the peripherals instance address by the SOC.
+ * + Named GPIO output "irq": Interrupt line of the peripheral. Must be
+ *   connected to the associated peripheral interrupt line of the NVIC.
+ * + Named GPIO output "eep_valrdy": Event set when new random value is =
ready
+ *   to be read.
+ * + Named GPIO input "tep_start": Task that triggers start of continuou=
s
+ *   generation of random values.
+ * + Named GPIO input "tep_stop": Task that ends continuous generation o=
f
+ *   random values.
+ *
+ * Accuracy of the peripheral model:
+ * + Stochastic properties of different configurations of the random sou=
rce
+ *   are not modeled.
+ * + Generation of unfiltered and filtered random values take at least t=
he
+ *   average generation time stated in the production specification;
+ *   non-deterministic generation times are not modeled.
+ *
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+#ifndef NRF51_RNG_H
+#define NRF51_RNG_H
+
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+#define TYPE_NRF51_RNG "nrf51_soc.rng"
+#define NRF51_RNG(obj) OBJECT_CHECK(NRF51RNGState, (obj), TYPE_NRF51_RNG=
)
+
+#define NRF51_RNG_SIZE         0x1000
+
+#define NRF51_RNG_TASK_START   0x000
+#define NRF51_RNG_TASK_STOP    0x004
+#define NRF51_RNG_EVENT_VALRDY 0x100
+#define NRF51_RNG_REG_SHORTS   0x200
+#define NRF51_RNG_REG_SHORTS_VALRDY_STOP 0
+#define NRF51_RNG_REG_INTEN    0x300
+#define NRF51_RNG_REG_INTEN_VALRDY 0
+#define NRF51_RNG_REG_INTENSET 0x304
+#define NRF51_RNG_REG_INTENCLR 0x308
+#define NRF51_RNG_REG_CONFIG   0x504
+#define NRF51_RNG_REG_CONFIG_DECEN 0
+#define NRF51_RNG_REG_VALUE    0x508
+
+typedef struct {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    qemu_irq irq;
+
+    /* Event End Points */
+    qemu_irq eep_valrdy;
+
+    QEMUTimer timer;
+
+    /* Time between generation of successive unfiltered values in us */
+    uint16_t period_unfiltered_us;
+    /* Time between generation of successive filtered values in us */
+    uint16_t period_filtered_us;
+
+    uint8_t value;
+
+    uint32_t active;
+    uint32_t event_valrdy;
+    uint32_t shortcut_stop_on_valrdy;
+    uint32_t interrupt_enabled;
+    uint32_t filter_enabled;
+
+} NRF51RNGState;
+
+
+#endif /* NRF51_RNG_H_ */
diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
new file mode 100644
index 0000000000..d188f044f4
--- /dev/null
+++ b/hw/misc/nrf51_rng.c
@@ -0,0 +1,262 @@
+/*
+ * nRF51 Random Number Generator
+ *
+ * Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.=
1.pdf
+ *
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/arm/nrf51.h"
+#include "hw/misc/nrf51_rng.h"
+#include "crypto/random.h"
+
+static void update_irq(NRF51RNGState *s)
+{
+    bool irq =3D s->interrupt_enabled && s->event_valrdy;
+    qemu_set_irq(s->irq, irq);
+}
+
+static uint64_t rng_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    NRF51RNGState *s =3D NRF51_RNG(opaque);
+    uint64_t r =3D 0;
+
+    switch (offset) {
+    case NRF51_RNG_EVENT_VALRDY:
+        r =3D s->event_valrdy;
+        break;
+    case NRF51_RNG_REG_SHORTS:
+        r =3D s->shortcut_stop_on_valrdy;
+        break;
+    case NRF51_RNG_REG_INTEN:
+    case NRF51_RNG_REG_INTENSET:
+    case NRF51_RNG_REG_INTENCLR:
+        r =3D s->interrupt_enabled;
+        break;
+    case NRF51_RNG_REG_CONFIG:
+        r =3D s->filter_enabled;
+        break;
+    case NRF51_RNG_REG_VALUE:
+        r =3D s->value;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bad read offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+    }
+
+    return r;
+}
+
+static int64_t calc_next_timeout(NRF51RNGState *s)
+{
+    int64_t timeout =3D qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
+    if (s->filter_enabled) {
+        timeout +=3D s->period_filtered_us;
+    } else {
+        timeout +=3D s->period_unfiltered_us;
+    }
+
+    return timeout;
+}
+
+
+static void rng_update_timer(NRF51RNGState *s)
+{
+    if (s->active) {
+        timer_mod(&s->timer, calc_next_timeout(s));
+    } else {
+        timer_del(&s->timer);
+    }
+}
+
+
+static void rng_write(void *opaque, hwaddr offset,
+                       uint64_t value, unsigned int size)
+{
+    NRF51RNGState *s =3D NRF51_RNG(opaque);
+
+    switch (offset) {
+    case NRF51_RNG_TASK_START:
+        if (value =3D=3D NRF51_TRIGGER_TASK) {
+            s->active =3D 1;
+            rng_update_timer(s);
+        }
+        break;
+    case NRF51_RNG_TASK_STOP:
+        if (value =3D=3D NRF51_TRIGGER_TASK) {
+            s->active =3D 0;
+            rng_update_timer(s);
+        }
+        break;
+    case NRF51_RNG_EVENT_VALRDY:
+        if (value =3D=3D NRF51_EVENT_CLEAR) {
+            s->event_valrdy =3D 0;
+        }
+        break;
+    case NRF51_RNG_REG_SHORTS:
+        s->shortcut_stop_on_valrdy =3D
+                (value & BIT_MASK(NRF51_RNG_REG_SHORTS_VALRDY_STOP)) ? 1=
 : 0;
+        break;
+    case NRF51_RNG_REG_INTEN:
+        s->interrupt_enabled =3D
+                (value & BIT_MASK(NRF51_RNG_REG_INTEN_VALRDY)) ? 1 : 0;
+        break;
+    case NRF51_RNG_REG_INTENSET:
+        if (value & BIT_MASK(NRF51_RNG_REG_INTEN_VALRDY)) {
+            s->interrupt_enabled =3D 1;
+        }
+        break;
+    case NRF51_RNG_REG_INTENCLR:
+        if (value & BIT_MASK(NRF51_RNG_REG_INTEN_VALRDY)) {
+            s->interrupt_enabled =3D 0;
+        }
+        break;
+    case NRF51_RNG_REG_CONFIG:
+        s->filter_enabled =3D
+                      (value & BIT_MASK(NRF51_RNG_REG_CONFIG_DECEN)) ? 1=
 : 0;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: bad write offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+    }
+
+    update_irq(s);
+}
+
+static const MemoryRegionOps rng_ops =3D {
+    .read =3D  rng_read,
+    .write =3D rng_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size =3D 4,
+    .impl.max_access_size =3D 4
+};
+
+static void nrf51_rng_timer_expire(void *opaque)
+{
+    NRF51RNGState *s =3D NRF51_RNG(opaque);
+
+    qcrypto_random_bytes(&s->value, 1, &error_abort);
+
+    s->event_valrdy =3D 1;
+    qemu_set_irq(s->eep_valrdy, 1);
+
+    if (s->shortcut_stop_on_valrdy) {
+        s->active =3D 0;
+    }
+
+    rng_update_timer(s);
+    update_irq(s);
+}
+
+static void nrf51_rng_tep_start(void *opaque, int n, int level)
+{
+    NRF51RNGState *s =3D NRF51_RNG(opaque);
+
+    if (level) {
+        s->active =3D 1;
+        rng_update_timer(s);
+    }
+}
+
+static void nrf51_rng_tep_stop(void *opaque, int n, int level)
+{
+    NRF51RNGState *s =3D NRF51_RNG(opaque);
+
+    if (level) {
+        s->active =3D 0;
+        rng_update_timer(s);
+    }
+}
+
+
+static void nrf51_rng_init(Object *obj)
+{
+    NRF51RNGState *s =3D NRF51_RNG(obj);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->mmio, obj, &rng_ops, s,
+            TYPE_NRF51_RNG, NRF51_RNG_SIZE);
+    sysbus_init_mmio(sbd, &s->mmio);
+
+    timer_init_us(&s->timer, QEMU_CLOCK_VIRTUAL, nrf51_rng_timer_expire,=
 s);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    /* Tasks */
+    qdev_init_gpio_in_named(DEVICE(s), nrf51_rng_tep_start, "tep_start",=
 1);
+    qdev_init_gpio_in_named(DEVICE(s), nrf51_rng_tep_stop, "tep_stop", 1=
);
+
+    /* Events */
+    qdev_init_gpio_out_named(DEVICE(s), &s->eep_valrdy, "eep_valrdy", 1)=
;
+}
+
+static void nrf51_rng_reset(DeviceState *dev)
+{
+    NRF51RNGState *s =3D NRF51_RNG(dev);
+
+    s->value =3D 0;
+    s->active =3D 0;
+    s->event_valrdy =3D 0;
+    s->shortcut_stop_on_valrdy =3D 0;
+    s->interrupt_enabled =3D 0;
+    s->filter_enabled =3D 0;
+
+    rng_update_timer(s);
+}
+
+
+static Property nrf51_rng_properties[] =3D {
+    DEFINE_PROP_UINT16("period_unfiltered_us", NRF51RNGState,
+            period_unfiltered_us, 167),
+    DEFINE_PROP_UINT16("period_filtered_us", NRF51RNGState,
+            period_filtered_us, 660),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_rng =3D {
+    .name =3D "nrf51_soc.rng",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32(active, NRF51RNGState),
+        VMSTATE_UINT32(event_valrdy, NRF51RNGState),
+        VMSTATE_UINT32(shortcut_stop_on_valrdy, NRF51RNGState),
+        VMSTATE_UINT32(interrupt_enabled, NRF51RNGState),
+        VMSTATE_UINT32(filter_enabled, NRF51RNGState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void nrf51_rng_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->props =3D nrf51_rng_properties;
+    dc->vmsd =3D &vmstate_rng;
+    dc->reset =3D nrf51_rng_reset;
+}
+
+static const TypeInfo nrf51_rng_info =3D {
+    .name =3D TYPE_NRF51_RNG,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(NRF51RNGState),
+    .instance_init =3D nrf51_rng_init,
+    .class_init =3D nrf51_rng_class_init
+};
+
+static void nrf51_rng_register_types(void)
+{
+    type_register_static(&nrf51_rng_info);
+}
+
+type_init(nrf51_rng_register_types)
--=20
2.19.2

