Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp425136wrt;
        Thu, 3 Jan 2019 01:16:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W5Ks2sIbQXRF+rjbX0juBNVsC9dbS+R2cGfkl3m/95C5MtSJuBMQQ3hsHH+jP7/RfcUla/
X-Received: by 2002:aed:37e3:: with SMTP id j90mr44998193qtb.332.1546507014512;
        Thu, 03 Jan 2019 01:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546507014; cv=none;
        d=google.com; s=arc-20160816;
        b=BfyVUHyVc+xCFTK5dQ5ywmC/THoVaRkkMsTkUmk3uh+fokwaKb0Rhz7rtThHWr+MRc
         DHM8UNr8q1ZYJ8L6lB+dw5KQV++SBscdz7kFDk7WfIc3SiB4PNBx/tQ973c033oHLQIz
         gDgbb9SLbKRwcCGBDZ66S7AMVpf/nvAGdIR1eEkGJzxrm3qIRCwZ6kkSdnUjP1JFCmGI
         u1ikGRwd3xUoj/AF7hPYLqh/TBPEOD69in3EbqJkFT+WnMFiA3aQEjlZPUKclFoJNIGY
         fZ7+L+rmEm04Ikf0oaPW9wYXWuMfZk21IJCtGlYg6+1GDvQJDm/54p+43tyQtntm9+08
         7oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wC0JG++m5evUYCkAfjI04YGJTe8fCfRBRZ8m9578dU0=;
        b=R3McIrpLE5YJw3CKN+HVSYLYrcM2bOj3TuGmT3A3kPfPZFDoOardoVgZ9/aQhyXZZB
         yU5eF+KLAmIqahGlJevXf6AyVIAvcNl2zbTfUBmovIz+YNKEWLY8gh2sjL/KxZvPqtjT
         gvbC0lLhkDtE18nXpIaIyYDLSerxh4XEn4lROKUKLHzAK9C/5QiBdSZjxKrY878EODTF
         1NCWk/T1CXAYfd6qMHAQx8ZVR28UIn5mXogPYO7mIt49lJEez1TdUhYPFbCdEpSONPHT
         CVvVZm+auQZsXPgPlxNj62GKUIa4JPkbgvo6TbmbcM9+DqBnsMA6nBfFT20SJ0qrsaQ/
         bOHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i1si2846473qtr.117.2019.01.03.01.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:16:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez7V-0007ZC-Lf
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:16:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3u-0003kB-Pq
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3s-0006jS-SM
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3s-0006jD-Kt; Thu, 03 Jan 2019 04:13:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C798483F4C;
	Thu,  3 Jan 2019 09:13:07 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEB675D738;
	Thu,  3 Jan 2019 09:13:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:16 +0000
Message-Id: <20190103091119.9367-9-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 03 Jan 2019 09:13:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 08/11] hw/timer/nrf51_timer: Add nRF51 Timer
 peripheral
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
X-TUID: 2iTrHzMfUW9+

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

This patch adds the model for the nRF51 timer peripheral.
Currently, only the TIMER mode is implemented.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/timer/Makefile.objs         |   1 +
 include/hw/timer/nrf51_timer.h |  80 +++++++
 hw/timer/nrf51_timer.c         | 393 +++++++++++++++++++++++++++++++++
 hw/timer/trace-events          |   5 +
 4 files changed, 479 insertions(+)
 create mode 100644 include/hw/timer/nrf51_timer.h
 create mode 100644 hw/timer/nrf51_timer.c

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index b32194d153..0e9a4530f8 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -23,6 +23,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_gpt.o
 common-obj-$(CONFIG_LM32) +=3D lm32_timer.o
 common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
+common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o
=20
 obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
 obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
diff --git a/include/hw/timer/nrf51_timer.h b/include/hw/timer/nrf51_time=
r.h
new file mode 100644
index 0000000000..85cad2300d
--- /dev/null
+++ b/include/hw/timer/nrf51_timer.h
@@ -0,0 +1,80 @@
+/*
+ * nRF51 System-on-Chip Timer peripheral
+ *
+ * QEMU interface:
+ * + sysbus MMIO regions 0: GPIO registers
+ * + sysbus irq
+ *
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef NRF51_TIMER_H
+#define NRF51_TIMER_H
+
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+#define TYPE_NRF51_TIMER "nrf51_soc.timer"
+#define NRF51_TIMER(obj) OBJECT_CHECK(NRF51TimerState, (obj), TYPE_NRF51=
_TIMER)
+
+#define NRF51_TIMER_REG_COUNT 4
+
+#define NRF51_TIMER_TASK_START 0x000
+#define NRF51_TIMER_TASK_STOP 0x004
+#define NRF51_TIMER_TASK_COUNT 0x008
+#define NRF51_TIMER_TASK_CLEAR 0x00C
+#define NRF51_TIMER_TASK_SHUTDOWN 0x010
+#define NRF51_TIMER_TASK_CAPTURE_0 0x040
+#define NRF51_TIMER_TASK_CAPTURE_3 0x04C
+
+#define NRF51_TIMER_EVENT_COMPARE_0 0x140
+#define NRF51_TIMER_EVENT_COMPARE_1 0x144
+#define NRF51_TIMER_EVENT_COMPARE_2 0x148
+#define NRF51_TIMER_EVENT_COMPARE_3 0x14C
+
+#define NRF51_TIMER_REG_SHORTS 0x200
+#define NRF51_TIMER_REG_SHORTS_MASK 0xf0f
+#define NRF51_TIMER_REG_INTENSET 0x304
+#define NRF51_TIMER_REG_INTENCLR 0x308
+#define NRF51_TIMER_REG_INTEN_MASK 0xf0000
+#define NRF51_TIMER_REG_MODE 0x504
+#define NRF51_TIMER_REG_MODE_MASK 0x01
+#define NRF51_TIMER_TIMER 0
+#define NRF51_TIMER_COUNTER 1
+#define NRF51_TIMER_REG_BITMODE 0x508
+#define NRF51_TIMER_REG_BITMODE_MASK 0x03
+#define NRF51_TIMER_WIDTH_16 0
+#define NRF51_TIMER_WIDTH_8 1
+#define NRF51_TIMER_WIDTH_24 2
+#define NRF51_TIMER_WIDTH_32 3
+#define NRF51_TIMER_REG_PRESCALER 0x510
+#define NRF51_TIMER_REG_PRESCALER_MASK 0x0F
+#define NRF51_TIMER_REG_CC0 0x540
+#define NRF51_TIMER_REG_CC3 0x54C
+
+typedef struct NRF51TimerState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    QEMUTimer timer;
+    int64_t timer_start_ns;
+    int64_t update_counter_ns;
+    uint32_t counter;
+
+    bool running;
+
+    uint8_t events_compare[NRF51_TIMER_REG_COUNT];
+    uint32_t cc[NRF51_TIMER_REG_COUNT];
+    uint32_t shorts;
+    uint32_t inten;
+    uint32_t mode;
+    uint32_t bitmode;
+    uint32_t prescaler;
+
+} NRF51TimerState;
+
+
+#endif
diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
new file mode 100644
index 0000000000..0c90662896
--- /dev/null
+++ b/hw/timer/nrf51_timer.c
@@ -0,0 +1,393 @@
+/*
+ * nRF51 System-on-Chip Timer peripheral
+ *
+ * Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.=
pdf
+ * Product Spec: http://infocenter.nordicsemi.com/pdf/nRF51822_PS_v3.1.p=
df
+ *
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
+ * Copyright (c) 2019 Red Hat, Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/arm/nrf51.h"
+#include "hw/timer/nrf51_timer.h"
+#include "trace.h"
+
+#define TIMER_CLK_FREQ 16000000UL
+
+static uint32_t const bitwidths[] =3D {16, 8, 24, 32};
+
+static uint32_t ns_to_ticks(NRF51TimerState *s, int64_t ns)
+{
+    uint32_t freq =3D TIMER_CLK_FREQ >> s->prescaler;
+
+    return muldiv64(ns, freq, NANOSECONDS_PER_SECOND);
+}
+
+static int64_t ticks_to_ns(NRF51TimerState *s, uint32_t ticks)
+{
+    uint32_t freq =3D TIMER_CLK_FREQ >> s->prescaler;
+
+    return muldiv64(ticks, NANOSECONDS_PER_SECOND, freq);
+}
+
+/* Returns number of ticks since last call */
+static uint32_t update_counter(NRF51TimerState *s, int64_t now)
+{
+    uint32_t ticks =3D ns_to_ticks(s, now - s->update_counter_ns);
+
+    s->counter =3D (s->counter + ticks) % BIT(bitwidths[s->bitmode]);
+    s->update_counter_ns =3D now;
+    return ticks;
+}
+
+/* Assumes s->counter is up-to-date */
+static void rearm_timer(NRF51TimerState *s, int64_t now)
+{
+    int64_t min_ns =3D INT64_MAX;
+    size_t i;
+
+    for (i =3D 0; i < NRF51_TIMER_REG_COUNT; i++) {
+        int64_t delta_ns;
+
+        if (s->events_compare[i]) {
+            continue; /* already expired, ignore it for now */
+        }
+
+        if (s->cc[i] <=3D s->counter) {
+            delta_ns =3D ticks_to_ns(s, BIT(bitwidths[s->bitmode]) -
+                                      s->counter + s->cc[i]);
+        } else {
+            delta_ns =3D ticks_to_ns(s, s->cc[i] - s->counter);
+        }
+
+        if (delta_ns < min_ns) {
+            min_ns =3D delta_ns;
+        }
+    }
+
+    if (min_ns !=3D INT64_MAX) {
+        timer_mod_ns(&s->timer, now + min_ns);
+    }
+}
+
+static void update_irq(NRF51TimerState *s)
+{
+    bool flag =3D false;
+    size_t i;
+
+    for (i =3D 0; i < NRF51_TIMER_REG_COUNT; i++) {
+        flag |=3D s->events_compare[i] && extract32(s->inten, 16 + i, 1)=
;
+    }
+    qemu_set_irq(s->irq, flag);
+}
+
+static void timer_expire(void *opaque)
+{
+    NRF51TimerState *s =3D NRF51_TIMER(opaque);
+    int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint32_t cc_remaining[NRF51_TIMER_REG_COUNT];
+    bool should_stop =3D false;
+    uint32_t ticks;
+    size_t i;
+
+    for (i =3D 0; i < NRF51_TIMER_REG_COUNT; i++) {
+        if (s->cc[i] > s->counter) {
+            cc_remaining[i] =3D s->cc[i] - s->counter;
+        } else {
+            cc_remaining[i] =3D BIT(bitwidths[s->bitmode]) -
+                              s->counter + s->cc[i];
+        }
+    }
+
+    ticks =3D update_counter(s, now);
+
+    for (i =3D 0; i < NRF51_TIMER_REG_COUNT; i++) {
+        if (cc_remaining[i] <=3D ticks) {
+            s->events_compare[i] =3D 1;
+
+            if (s->shorts & BIT(i)) {
+                s->timer_start_ns =3D now;
+                s->update_counter_ns =3D s->timer_start_ns;
+                s->counter =3D 0;
+            }
+
+            should_stop |=3D s->shorts & BIT(i + 8);
+        }
+    }
+
+    update_irq(s);
+
+    if (should_stop) {
+        s->running =3D false;
+        timer_del(&s->timer);
+    } else {
+        rearm_timer(s, now);
+    }
+}
+
+static void counter_compare(NRF51TimerState *s)
+{
+    uint32_t counter =3D s->counter;
+    size_t i;
+
+    for (i =3D 0; i < NRF51_TIMER_REG_COUNT; i++) {
+        if (counter =3D=3D s->cc[i]) {
+            s->events_compare[i] =3D 1;
+
+            if (s->shorts & BIT(i)) {
+                s->counter =3D 0;
+            }
+        }
+    }
+}
+
+static uint64_t nrf51_timer_read(void *opaque, hwaddr offset, unsigned i=
nt size)
+{
+    NRF51TimerState *s =3D NRF51_TIMER(opaque);
+    uint64_t r =3D 0;
+
+    switch (offset) {
+    case NRF51_TIMER_EVENT_COMPARE_0 ... NRF51_TIMER_EVENT_COMPARE_3:
+        r =3D s->events_compare[(offset - NRF51_TIMER_EVENT_COMPARE_0) /=
 4];
+        break;
+    case NRF51_TIMER_REG_SHORTS:
+        r =3D s->shorts;
+        break;
+    case NRF51_TIMER_REG_INTENSET:
+        r =3D s->inten;
+        break;
+    case NRF51_TIMER_REG_INTENCLR:
+        r =3D s->inten;
+        break;
+    case NRF51_TIMER_REG_MODE:
+        r =3D s->mode;
+        break;
+    case NRF51_TIMER_REG_BITMODE:
+        r =3D s->bitmode;
+        break;
+    case NRF51_TIMER_REG_PRESCALER:
+        r =3D s->prescaler;
+        break;
+    case NRF51_TIMER_REG_CC0 ... NRF51_TIMER_REG_CC3:
+        r =3D s->cc[(offset - NRF51_TIMER_REG_CC0) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: bad read offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+    }
+
+    trace_nrf51_timer_read(offset, r, size);
+
+    return r;
+}
+
+static void nrf51_timer_write(void *opaque, hwaddr offset,
+                       uint64_t value, unsigned int size)
+{
+    NRF51TimerState *s =3D NRF51_TIMER(opaque);
+    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    size_t idx;
+
+    trace_nrf51_timer_write(offset, value, size);
+
+    switch (offset) {
+    case NRF51_TIMER_TASK_START:
+        if (value =3D=3D NRF51_TRIGGER_TASK && s->mode =3D=3D NRF51_TIME=
R_TIMER) {
+            s->running =3D true;
+            s->timer_start_ns =3D now - ticks_to_ns(s, s->counter);
+            s->update_counter_ns =3D s->timer_start_ns;
+            rearm_timer(s, now);
+        }
+        break;
+    case NRF51_TIMER_TASK_STOP:
+    case NRF51_TIMER_TASK_SHUTDOWN:
+        if (value =3D=3D NRF51_TRIGGER_TASK) {
+            s->running =3D false;
+            timer_del(&s->timer);
+        }
+        break;
+    case NRF51_TIMER_TASK_COUNT:
+        if (value =3D=3D NRF51_TRIGGER_TASK && s->mode =3D=3D NRF51_TIME=
R_COUNTER) {
+            s->counter =3D (s->counter + 1) % BIT(bitwidths[s->bitmode])=
;
+            counter_compare(s);
+        }
+        break;
+    case NRF51_TIMER_TASK_CLEAR:
+        if (value =3D=3D NRF51_TRIGGER_TASK) {
+            s->timer_start_ns =3D now;
+            s->update_counter_ns =3D s->timer_start_ns;
+            s->counter =3D 0;
+            if (s->running) {
+                rearm_timer(s, now);
+            }
+        }
+        break;
+    case NRF51_TIMER_TASK_CAPTURE_0 ... NRF51_TIMER_TASK_CAPTURE_3:
+        if (value =3D=3D NRF51_TRIGGER_TASK) {
+            if (s->running) {
+                timer_expire(s); /* update counter and all state */
+            }
+
+            idx =3D (offset - NRF51_TIMER_TASK_CAPTURE_0) / 4;
+            s->cc[idx] =3D s->counter;
+        }
+        break;
+    case NRF51_TIMER_EVENT_COMPARE_0 ... NRF51_TIMER_EVENT_COMPARE_3:
+        if (value =3D=3D NRF51_EVENT_CLEAR) {
+            s->events_compare[(offset - NRF51_TIMER_EVENT_COMPARE_0) / 4=
] =3D 0;
+
+            if (s->running) {
+                timer_expire(s); /* update counter and all state */
+            }
+        }
+        break;
+    case NRF51_TIMER_REG_SHORTS:
+        s->shorts =3D value & NRF51_TIMER_REG_SHORTS_MASK;
+        break;
+    case NRF51_TIMER_REG_INTENSET:
+        s->inten |=3D value & NRF51_TIMER_REG_INTEN_MASK;
+        break;
+    case NRF51_TIMER_REG_INTENCLR:
+        s->inten &=3D ~(value & NRF51_TIMER_REG_INTEN_MASK);
+        break;
+    case NRF51_TIMER_REG_MODE:
+        s->mode =3D value;
+        break;
+    case NRF51_TIMER_REG_BITMODE:
+        if (s->mode =3D=3D NRF51_TIMER_TIMER && s->running) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: erroneous change of BITMODE while timer is runn=
ing\n",
+                    __func__);
+        }
+        s->bitmode =3D value & NRF51_TIMER_REG_BITMODE_MASK;
+        break;
+    case NRF51_TIMER_REG_PRESCALER:
+        if (s->mode =3D=3D NRF51_TIMER_TIMER && s->running) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: erroneous change of PRESCALER while timer is runnin=
g\n",
+                __func__);
+        }
+        s->prescaler =3D value & NRF51_TIMER_REG_PRESCALER_MASK;
+        break;
+    case NRF51_TIMER_REG_CC0 ... NRF51_TIMER_REG_CC3:
+        if (s->running) {
+            timer_expire(s); /* update counter */
+        }
+
+        idx =3D (offset - NRF51_TIMER_REG_CC0) / 4;
+        s->cc[idx] =3D value % BIT(bitwidths[s->bitmode]);
+
+        if (s->running) {
+            rearm_timer(s, now);
+        }
+        break;
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
+    .read =3D  nrf51_timer_read,
+    .write =3D nrf51_timer_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size =3D 4,
+    .impl.max_access_size =3D 4,
+};
+
+static void nrf51_timer_init(Object *obj)
+{
+    NRF51TimerState *s =3D NRF51_TIMER(obj);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &rng_ops, s,
+            TYPE_NRF51_TIMER, NRF51_TIMER_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+
+    timer_init_ns(&s->timer, QEMU_CLOCK_VIRTUAL, timer_expire, s);
+}
+
+static void nrf51_timer_reset(DeviceState *dev)
+{
+    NRF51TimerState *s =3D NRF51_TIMER(dev);
+
+    timer_del(&s->timer);
+    s->timer_start_ns =3D 0x00;
+    s->update_counter_ns =3D 0x00;
+    s->counter =3D 0x00;
+    s->running =3D false;
+
+    memset(s->events_compare, 0x00, sizeof(s->events_compare));
+    memset(s->cc, 0x00, sizeof(s->cc));
+
+    s->shorts =3D 0x00;
+    s->inten =3D 0x00;
+    s->mode =3D 0x00;
+    s->bitmode =3D 0x00;
+    s->prescaler =3D 0x00;
+}
+
+static int nrf51_timer_post_load(void *opaque, int version_id)
+{
+    NRF51TimerState *s =3D NRF51_TIMER(opaque);
+
+    if (s->running && s->mode =3D=3D NRF51_TIMER_TIMER) {
+        timer_expire(s);
+    }
+    return 0;
+}
+
+static const VMStateDescription vmstate_nrf51_timer =3D {
+    .name =3D TYPE_NRF51_TIMER,
+    .version_id =3D 1,
+    .post_load =3D nrf51_timer_post_load,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_TIMER(timer, NRF51TimerState),
+        VMSTATE_INT64(timer_start_ns, NRF51TimerState),
+        VMSTATE_INT64(update_counter_ns, NRF51TimerState),
+        VMSTATE_UINT32(counter, NRF51TimerState),
+        VMSTATE_BOOL(running, NRF51TimerState),
+        VMSTATE_UINT8_ARRAY(events_compare, NRF51TimerState,
+                            NRF51_TIMER_REG_COUNT),
+        VMSTATE_UINT32_ARRAY(cc, NRF51TimerState, NRF51_TIMER_REG_COUNT)=
,
+        VMSTATE_UINT32(shorts, NRF51TimerState),
+        VMSTATE_UINT32(inten, NRF51TimerState),
+        VMSTATE_UINT32(mode, NRF51TimerState),
+        VMSTATE_UINT32(bitmode, NRF51TimerState),
+        VMSTATE_UINT32(prescaler, NRF51TimerState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void nrf51_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D nrf51_timer_reset;
+    dc->vmsd =3D &vmstate_nrf51_timer;
+}
+
+static const TypeInfo nrf51_timer_info =3D {
+    .name =3D TYPE_NRF51_TIMER,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(NRF51TimerState),
+    .instance_init =3D nrf51_timer_init,
+    .class_init =3D nrf51_timer_class_init
+};
+
+static void nrf51_timer_register_types(void)
+{
+    type_register_static(&nrf51_timer_info);
+}
+
+type_init(nrf51_timer_register_types)
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 75bd3b1042..0144a68951 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -72,3 +72,8 @@ sun4v_rtc_write(uint64_t addr, uint64_t value) "write: =
addr 0x%" PRIx64 " value
=20
 # hw/timer/xlnx-zynqmp-rtc.c
 xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min,=
 int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
+
+# hw/timer/nrf51_timer.c
+nrf51_timer_read(uint64_t addr, uint32_t value, unsigned size) "read add=
r 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
+nrf51_timer_write(uint64_t addr, uint32_t value, unsigned size) "write a=
ddr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
+
--=20
2.19.2

