Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655152wrd;
        Mon, 17 Sep 2018 01:42:03 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbKq6z6juE3rMHbmP4Y24ZQeRVDt1ydI2hw5o4e5e4FbhwVWLbuX0iIELiZSr3Q0sRfXoya
X-Received: by 2002:a37:4a51:: with SMTP id x78-v6mr16103803qka.188.1537173723697;
        Mon, 17 Sep 2018 01:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173723; cv=none;
        d=google.com; s=arc-20160816;
        b=MyOuIVFtziPKy8vfy3k6ZEUeekBZ+1Pv3nW6vSMiSxIrH4bj0P9VeCGvlpTbUXSEn1
         2QlT7wS3moHnrM7s/89woMzY7d2Vwl/30OIzEzHUiUMlnoAhyguTqJc/MSqc7hehQKEd
         03LMGYTT2ju0GDffvZgJ7UjoYC08ZtoLSIBGW0iFSRIoXhfsK7eb0tcxdNhjd4n11rTl
         Sl3Xd3TVmVNJ6hL1PdeMjYWSENho0uzem7x1JzKO6sTADIuy5AcYrBrgMz1IQwba0Fud
         iBBrpdASPIGasjuiCjxPWhcBhOppBEPZAg0Q3EdyHxC/ijh1b/M/aQ+/QPtH4r0sTCSM
         ezYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=F6Uce2ut3aqZt9RbEGnjytr+faX0OZ8jJl6XFu5BW48=;
        b=gX94dKAwXYIirqfkSaCfskaVP1ImGQm3VYAIARj7iRvoJyyKl6FlII4Fib2CWyeUvc
         qOs6htBKyQ3xXfbDBm3ybfxq21Y1Z6HUfr/3pfIlYtYKHG0B40v558UQ4dfVymYAuS9c
         HJd36WAeLCoHMNeYOk2DbJkup6GGBwQ229Wn3baBeC9vQbiS2TCU7CJMIsfY18PDQSMp
         3qSIWLgdM+FV3AHA08SK4/K0oL56ehyYBrVjf8xsTRh+dJ33KyWqTkMHQyIQpvVtVsXS
         Br+7tdio584mcquBIZbfBwNQpKaVLP0f0PxoDQsNUseIVQE/66wCKc0nUoqDvLZvo0+7
         debA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=1PW0guy9;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=j85TMfum;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=j85TMfum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y25-v6si11132434qth.305.2018.09.17.01.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=1PW0guy9;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=j85TMfum;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=j85TMfum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6Z-0006Qc-5Q
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069O-TL
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5p-0005V3-Kq
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5o-0005TI-Vb; Mon, 17 Sep 2018 04:41:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E7958521A8F;
	Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173668;
	bh=yXcTOLWy/8EQ+8IHt63EZg5+S9rmAT3jB0ZPL8xb6eE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1PW0guy9gUCf7XKjlc3WopHZw3cn/93mOE+OuxNQLVcN+iOulpDKLKYUx+vDumYwh
	8QjatBPvjcemTLXHU3PfBy8aDI70A9FUw7BWHQMmfVGZ1H1/eYf1SiMWbnGuIvAz6c
	JoNYsvraOPRVOB0VX1BTROrpezpcXmm2sJRxUFQs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=j85TMfum;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=j85TMfum
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpt2irkeCKZr; Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id F18622386FB; Mon, 17 Sep 2018 10:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173667;
	bh=yXcTOLWy/8EQ+8IHt63EZg5+S9rmAT3jB0ZPL8xb6eE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j85TMfummaSltH6BzmJGb6T7D1vdGtSZ6SONTYZjnnyF/czacDu0+LimMmJn9H1+K
	CdabQmHD3wByjAKYalXo6XtLCQHb48Qqtxm7b326Po+Ych4FMnlHtiDEQk5BLvOlWs
	K9XVd//+2rK0Z03wzhdnUbwQmG7EXbgtQVicw+I8=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 87E042387FF;
	Mon, 17 Sep 2018 10:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173667;
	bh=yXcTOLWy/8EQ+8IHt63EZg5+S9rmAT3jB0ZPL8xb6eE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j85TMfummaSltH6BzmJGb6T7D1vdGtSZ6SONTYZjnnyF/czacDu0+LimMmJn9H1+K
	CdabQmHD3wByjAKYalXo6XtLCQHb48Qqtxm7b326Po+Ych4FMnlHtiDEQk5BLvOlWs
	K9XVd//+2rK0Z03wzhdnUbwQmG7EXbgtQVicw+I8=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:07 +0200
Message-Id: <20180917084016.12750-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 01/10] hw/core/clock-port: introduce clock
 port objects
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nbk3qvFo4cPF

From: Damien Hedde <damien.hedde@greensocs.com>

Introduce clock port objects: ClockIn and ClockOut.

Theses ports may be used to distribute a clock from a object to several
other objects. They do not contain any state and serve only as intermediate
to carry a ClockState which contains 2 fields:
* an integer which represent the frequency in Hertz
* a boolean which represent the reset status of the clock domain
Both are independent: eg the reset can be asserted while the clock running and
vice versa.

A ClockIn may be connected to a ClockOut so that it receives update,
through the callback, whenever the Clockout is updated using the
ClockOut's set function.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 Makefile.objs           |   1 +
 include/hw/clock-port.h | 153 ++++++++++++++++++++++++++++++++++++++++
 hw/core/clock-port.c    | 145 +++++++++++++++++++++++++++++++++++++
 hw/core/Makefile.objs   |   1 +
 hw/core/trace-events    |   6 ++
 5 files changed, 306 insertions(+)
 create mode 100644 include/hw/clock-port.h
 create mode 100644 hw/core/clock-port.c
 create mode 100644 hw/core/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index ce9c79235e..b29747075f 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -210,6 +210,7 @@ trace-events-subdirs += hw/audio
 trace-events-subdirs += hw/block
 trace-events-subdirs += hw/block/dataplane
 trace-events-subdirs += hw/char
+trace-events-subdirs += hw/core
 trace-events-subdirs += hw/display
 trace-events-subdirs += hw/dma
 trace-events-subdirs += hw/hppa
diff --git a/include/hw/clock-port.h b/include/hw/clock-port.h
new file mode 100644
index 0000000000..2ab554c30e
--- /dev/null
+++ b/include/hw/clock-port.h
@@ -0,0 +1,153 @@
+#ifndef CLOCK_PORT_H
+#define CLOCK_PORT_H
+
+#include "qom/object.h"
+#include "hw/qdev-core.h"
+#include "qemu/queue.h"
+
+#define TYPE_CLOCK_PORT "clock-port"
+#define CLOCK_PORT(obj) OBJECT_CHECK(ClockPort, (obj), TYPE_CLOCK_PORT)
+#define TYPE_CLOCK_IN "clock-in"
+#define CLOCK_IN(obj) OBJECT_CHECK(ClockIn, (obj), TYPE_CLOCK_IN)
+#define TYPE_CLOCK_OUT "clock-out"
+#define CLOCK_OUT(obj) OBJECT_CHECK(ClockOut, (obj), TYPE_CLOCK_OUT)
+
+typedef struct ClockState {
+    uint64_t frequency; /* frequency of the clock in Hz */
+    bool domain_reset; /* flag indicating if clock domain is under reset */
+} ClockState;
+
+typedef void ClockCallback(void *opaque, ClockState *clk);
+
+typedef struct ClockPort {
+    /*< private >*/
+    Object parent_obj;
+    /*< public >*/
+    char *canonical_path; /* clock path shadow */
+} ClockPort;
+
+typedef struct ClockOut ClockOut;
+typedef struct ClockIn ClockIn;
+
+struct ClockIn {
+    /*< private >*/
+    ClockPort parent_obj;
+    /*< private >*/
+    ClockOut *driver; /* clock output controlling this clock */
+    ClockCallback *callback; /* local callback */
+    void *callback_opaque; /* opaque argument for the callback */
+    QLIST_ENTRY(ClockIn) sibling;  /* entry in a followers list */
+};
+
+struct ClockOut {
+    /*< private >*/
+    ClockPort parent_obj;
+    /*< private >*/
+    QLIST_HEAD(, ClockIn) followers; /* list of registered clocks */
+};
+
+/*
+ * clock_setup_canonical_path:
+ * @clk: clock
+ *
+ * compute the canonical path of the clock (used by log messages)
+ */
+void clock_setup_canonical_path(ClockPort *clk);
+
+/**
+ * clock_add_callback:
+ * @clk: the clock to register the callback into
+ * @cb: the callback function
+ * @opaque: the argument to the callback
+ *
+ * Register a callback called on every clock update.
+ */
+void clock_set_callback(ClockIn *clk, ClockCallback *cb, void *opaque);
+
+/**
+ * clock_clear_callback:
+ * @clk: the clock to delete the callback from
+ *
+ * Unregister the callback registered with clock_set_callback.
+ */
+void clock_clear_callback(ClockIn *clk);
+
+/**
+ * clock_connect:
+ * @clkin: the drived clock.
+ * @clkout: the driving clock.
+ *
+ * Setup @clkout to drive @clkin: Any @clkout update will be propagated
+ * to @clkin.
+ */
+void clock_connect(ClockIn *clkin, ClockOut *clkout);
+
+/**
+ * clock_set:
+ * @clk: the clock to update.
+ * @state: the new clock's state.
+ *
+ * Update the @clk to the new @state.
+ * This change will be propagated through registered clock inputs.
+ */
+void clock_set(ClockOut *clk, ClockState *state);
+
+/**
+ * clock_state_get_frequency:
+ * @clk: a clock state
+ *
+ * @return: the current frequency of @clk in Hz. If @clk is NULL, return 0.
+ */
+static inline uint64_t clock_state_get_frequency(const ClockState *clk)
+{
+    return clk ? clk->frequency : 0;
+}
+
+/**
+ * clock_state_is_enabled:
+ * @clk: a clock state
+ *
+ * @return: true if the clock is running. If @clk is NULL return false.
+ */
+static inline bool clock_state_is_enabled(const ClockState *clk)
+{
+    return clock_state_get_frequency(clk) != 0;
+}
+
+/**
+ * clock_state_get_domain_reset:
+ * @clk: a clock state
+ *
+ * @return: true if the domain reset is asserted. If @clk is NULL return false.
+ */
+static inline bool clock_state_get_domain_reset(const ClockState *clk)
+{
+    return clk ? clk->domain_reset : false;
+}
+
+/**
+ * clock_state_is_domain_running:
+ * @clk: a clock state
+ *
+ * @return: true if the clock is running and reset not asserted. If @clk is
+ * NULL return false.
+ */
+static inline bool clock_state_is_domain_running(const ClockState *clk)
+{
+    return clock_state_is_enabled(clk) && !clock_state_get_domain_reset(clk);
+}
+
+/**
+ * clock_state_copy:
+ * @dst the clock state destination
+ * @src: the clock state source
+ *
+ * Transfer the source clock state into the destination.
+ */
+static inline void clock_state_copy(ClockState *dst, const ClockState *src)
+{
+    dst->frequency = clock_state_get_frequency(src);
+    dst->domain_reset = clock_state_get_domain_reset(src);
+}
+
+#endif /* CLOCK_PORT_H */
diff --git a/hw/core/clock-port.c b/hw/core/clock-port.c
new file mode 100644
index 0000000000..31c344328c
--- /dev/null
+++ b/hw/core/clock-port.c
@@ -0,0 +1,145 @@
+/*
+ * Clock inputs and outputs
+ *
+ * Copyright GreenSocs 2016-2018
+ *
+ * Authors:
+ *  Frederic Konrad <fred.konrad@greensocs.com>
+ *  Damien Hedde <damien.hedde@greensocs.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "hw/clock-port.h"
+#include "hw/qdev-core.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+#define CLOCK_PATH(_clk) (_clk->parent_obj.canonical_path)
+
+void clock_setup_canonical_path(ClockPort *clk)
+{
+    g_free(clk->canonical_path);
+    clk->canonical_path = object_get_canonical_path(OBJECT(clk));
+}
+
+void clock_set_callback(ClockIn *clk, ClockCallback *cb, void *opaque)
+{
+    assert(clk);
+
+    clk->callback = cb;
+    clk->callback_opaque = opaque;
+}
+
+void clock_clear_callback(ClockIn *clk)
+{
+    clock_set_callback(clk, NULL, NULL);
+}
+
+void clock_connect(ClockIn *clkin, ClockOut *clkout)
+{
+    assert(clkin && clkin->driver == NULL);
+    assert(clkout);
+
+    trace_clock_connect(CLOCK_PATH(clkin), CLOCK_PATH(clkout));
+
+    QLIST_INSERT_HEAD(&clkout->followers, clkin, sibling);
+    clkin->driver = clkout;
+}
+
+static void clock_disconnect(ClockIn *clk)
+{
+    if (clk->driver == NULL) {
+        return;
+    }
+
+    trace_clock_disconnect(CLOCK_PATH(clk));
+
+    clk->driver = NULL;
+    QLIST_REMOVE(clk, sibling);
+}
+
+void clock_set(ClockOut *clk, ClockState *state)
+{
+    ClockIn *follower;
+    trace_clock_update(CLOCK_PATH(clk), state->frequency, state->domain_reset);
+
+    QLIST_FOREACH(follower, &clk->followers, sibling) {
+        trace_clock_update(CLOCK_PATH(follower), state->frequency,
+                state->domain_reset);
+        if (follower->callback) {
+            follower->callback(follower->callback_opaque, state);
+        }
+    }
+}
+
+static void clock_port_finalizefn(Object *obj)
+{
+    ClockPort *clk = CLOCK_PORT(obj);
+
+    g_free(clk->canonical_path);
+    clk->canonical_path = NULL;
+}
+
+static void clock_out_initfn(Object *obj)
+{
+    ClockOut *clk = CLOCK_OUT(obj);
+
+    QLIST_INIT(&clk->followers);
+}
+
+static void clock_out_finalizefn(Object *obj)
+{
+    ClockOut *clk = CLOCK_OUT(obj);
+    ClockIn *follower, *next;
+
+    /* clear our list of followers */
+    QLIST_FOREACH_SAFE(follower, &clk->followers, sibling, next) {
+        clock_disconnect(follower);
+    }
+}
+
+static void clock_in_finalizefn(Object *obj)
+{
+    ClockIn *clk = CLOCK_IN(obj);
+
+    /* remove us from driver's followers list */
+    clock_disconnect(clk);
+}
+
+static const TypeInfo clock_port_info = {
+    .name              = TYPE_CLOCK_PORT,
+    .parent            = TYPE_OBJECT,
+    .abstract          = true,
+    .instance_size     = sizeof(ClockPort),
+    .instance_finalize = clock_port_finalizefn,
+};
+
+static const TypeInfo clock_out_info = {
+    .name              = TYPE_CLOCK_OUT,
+    .parent            = TYPE_CLOCK_PORT,
+    .instance_size     = sizeof(ClockOut),
+    .instance_init     = clock_out_initfn,
+    .instance_finalize = clock_out_finalizefn,
+};
+
+static const TypeInfo clock_in_info = {
+    .name              = TYPE_CLOCK_IN,
+    .parent            = TYPE_CLOCK_PORT,
+    .instance_size     = sizeof(ClockIn),
+    .instance_finalize = clock_in_finalizefn,
+};
+
+static void clock_register_types(void)
+{
+    type_register_static(&clock_port_info);
+    type_register_static(&clock_in_info);
+    type_register_static(&clock_out_info);
+}
+
+type_init(clock_register_types)
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index eb88ca979e..f7102121f4 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-$(CONFIG_SOFTMMU) += fw-path-provider.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y += irq.o
 common-obj-y += hotplug.o
+common-obj-y += clock-port.o
 common-obj-$(CONFIG_SOFTMMU) += nmi.o
 
 common-obj-$(CONFIG_EMPTY_SLOT) += empty_slot.o
diff --git a/hw/core/trace-events b/hw/core/trace-events
new file mode 100644
index 0000000000..a37fd78492
--- /dev/null
+++ b/hw/core/trace-events
@@ -0,0 +1,6 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# hw/core/clock-port.c
+clock_connect(const char *clk, const char *driver) "'%s' drived-by '%s'"
+clock_disconnect(const char *clk) "'%s'"
+clock_update(const char *clk, uint64_t freq, int reset) "'%s' frequency %" PRIu64 "Hz reset %d"
-- 
2.18.0

