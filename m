Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655318wrd;
        Mon, 17 Sep 2018 01:42:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYXo2POxZQs83Cq+6mHJD20z3ZfhQ89Ofmi6l31X1Hb/w0CEdYdhcFJieSRopBb5p53CI4m
X-Received: by 2002:a37:4dcf:: with SMTP id a198-v6mr16372115qkb.139.1537173735524;
        Mon, 17 Sep 2018 01:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173735; cv=none;
        d=google.com; s=arc-20160816;
        b=BWlYURSmmNtRUnr/lfGMPb0WnftM0Te+E0gHmAziad4AnP6fJ1arPUtTXycxecWRAE
         FE+zUndUUSLMm717k0sA/0FAuKwMlxVZ2IaZt6YePrsaj/QDhSXG4NYlGZAqPoKrkk9C
         6fgFV5ioCzBzodR/HfAopGPoOFAvEOfgQUWEWN3vsd5fCgtMaz36OeL2YRc2tEhYhMPG
         wO/dybSVTSaVvXXeg/stkKRZ9SYPJxvBIMWRgCZhAHpK0KpLEXtbUiZwJSUXdbHzDacg
         Hc6x6ehZwEXoVOP7IFxDfsn9zk2d5zihP65fGsYmQHxFBClna9sHkTPpQ/c+7ZwhNKJK
         HOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=PnsT0KZtVnlEc9sXTQc4UmgOL1U9HB3QDwVqMWVzplM=;
        b=nCto5LCiogyVG65DOzNn9zkhfbCEw76LNwD4i4MZ5QgMjsY0Mqt6uBlA7g2ueBe6N3
         5ienNRnKZKefbTUPbJwbKtF+KfoAPTbf11If8F9fxgL0b141N163T0ZE4rrJnQy90S6b
         Su5UdBqohqjNW4I1emkNg06YGolttjJJsPKD6j4bD1mD8hqIdKE2f5/EzS7p1579s1is
         +fc9v78MmRJRBAbIYAbuxHbt5ozguWCKYnCrFsLO4HvXlG+xGvOUXXr06zqVFluDLUlx
         KNc56VtUMADCBePVMa0R90/qNraoByHItgPR8i3GIUnG3cIL/UGIQnfKdpsHsxavi+Ck
         K6Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YryZPJ8F;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IvQr9qio;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IvQr9qio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y24-v6si6109877qve.2.2018.09.17.01.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YryZPJ8F;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IvQr9qio;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IvQr9qio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6k-0006eI-8C
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069L-Su
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5p-0005V8-L7
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5o-0005TM-VJ; Mon, 17 Sep 2018 04:41:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9CCD3521A91;
	Mon, 17 Sep 2018 10:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173669;
	bh=7jML7edMlStZNGGsFvTMJU10Sk7OgZFCX7UYyQJQtlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YryZPJ8F8aSV456wggIkXEY+vw7uDA5cOfoySNkRAJ91cVZxP9BgtFmRKQpnb/YPb
	WG9c94YRmCAb8rRADtr3Da2JJrRcGiQ996W0ORkb3WHyE3ViDmOY5qU5GIowtJ8IqA
	U1RT65NMfXfvybCRTiwo8aC6O5+4KhpcRu6KTzG4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IvQr9qio;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IvQr9qio
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09JOsOMu3Gz4; Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 615482387FF; Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173668;
	bh=7jML7edMlStZNGGsFvTMJU10Sk7OgZFCX7UYyQJQtlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IvQr9qioO1H2SXJISrHTGoZnUqSLhzjTw2U7in4T7PAH1Fd351BnQ5kx1yOBflKAO
	9Xa82Z2WvnXQeeYWUCTE6OxlzagggD24tUtUS+RgnnWi6iS2QbdkK6Wh07e0TklmXr
	whc1holDnnucxf7JYqkEOop/UpDnOtcroITmNAQ8=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id F2B5B443480;
	Mon, 17 Sep 2018 10:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173668;
	bh=7jML7edMlStZNGGsFvTMJU10Sk7OgZFCX7UYyQJQtlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IvQr9qioO1H2SXJISrHTGoZnUqSLhzjTw2U7in4T7PAH1Fd351BnQ5kx1yOBflKAO
	9Xa82Z2WvnXQeeYWUCTE6OxlzagggD24tUtUS+RgnnWi6iS2QbdkK6Wh07e0TklmXr
	whc1holDnnucxf7JYqkEOop/UpDnOtcroITmNAQ8=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:08 +0200
Message-Id: <20180917084016.12750-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 02/10] qdev: add clock input&output support to
 devices.
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
X-TUID: f/v620GRCJ6O

From: Damien Hedde <damien.hedde@greensocs.com>

Add functions to easily add input or output clocks to a device.
The clock port objects are added as children of the device.

A function allows to connect two clocks together.
It should be called by some toplevel to make a connection between
2 (sub-)devices.

Also add a function which forwards a port to another device. This
function allows, in the case of device composition, to expose a
sub-device clock port as its own clock port.
This is really an alias: when forwarding an input, only one callback can
be registered on it since there is only one Clockin object behind all
aliases.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/qdev-clock.h |  62 ++++++++++++++++++
 include/hw/qdev-core.h  |  14 ++++
 include/hw/qdev.h       |   1 +
 hw/core/qdev-clock.c    | 140 ++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev.c          |  29 +++++++++
 hw/core/Makefile.objs   |   2 +-
 6 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/qdev-clock.h
 create mode 100644 hw/core/qdev-clock.c

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
new file mode 100644
index 0000000000..324eea6bcc
--- /dev/null
+++ b/include/hw/qdev-clock.h
@@ -0,0 +1,62 @@
+#ifndef QDEV_CLOCK_H
+#define QDEV_CLOCK_H
+
+#include "hw/clock-port.h"
+#include "hw/qdev-core.h"
+#include "qapi/error.h"
+
+/**
+ * qdev_init_clock_in:
+ * @dev: the device in which to add a clock
+ * @name: the name of the clock (can't be NULL).
+ * @callback: optional callback to be called on update or NULL.
+ * @opaque:   argument for the callback
+ * @returns: a pointer to the newly added clock
+ *
+ * Add a input clock to device @dev as a clock named @name.
+ * This adds a child<> property.
+ * The callback will be called with @dev as opaque parameter.
+ */
+ClockIn *qdev_init_clock_in(DeviceState *dev, const char *name,
+                            ClockCallback *callback, void *opaque);
+
+/**
+ * qdev_init_clock_out:
+ * @dev: the device to add a clock to
+ * @name: the name of the clock (can't be NULL).
+ * @callback: optional callback to be called on update or NULL.
+ * @returns: a pointer to the newly added clock
+ *
+ * Add a output clock to device @dev as a clock named @name.
+ * This adds a child<> property.
+ */
+ClockOut *qdev_init_clock_out(DeviceState *dev, const char *name);
+
+/**
+ * qdev_init_clock_forward:
+ * @dev: the device to forward the clock to
+ * @name: the name of the clock to be added (can't be NULL)
+ * @origin: the device which already has the clock
+ * @origin_name: the name of the clock in the src device
+ *
+ * Add a clock @name to @dev which forward to the clock @origin_name in @origin
+ */
+void qdev_init_clock_forward(DeviceState *dev, const char *name,
+                             DeviceState *origin, const char *origin_name);
+
+/**
+ * qdev_clock_connect:
+ * @dev: the drived clock device.
+ * @name: the drived clock name.
+ * @driver: the driving clock device.
+ * @driver_name: the driving clock name.
+ * @errp: error report
+ *
+ * Setup @driver_name output clock of @driver to drive @name input clock of
+ * @dev. Errors are trigerred if clock does not exists
+ */
+void qdev_clock_connect(DeviceState *dev, const char *name,
+                        DeviceState *driver, const char *driver_name,
+                        Error **errp);
+
+#endif /* QDEV_CLOCK_H */
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f1fd0f8736..e6014d3a41 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -127,6 +127,19 @@ struct NamedGPIOList {
     QLIST_ENTRY(NamedGPIOList) node;
 };
 
+typedef struct NamedClockList NamedClockList;
+
+typedef struct ClockIn ClockIn;
+typedef struct ClockOut ClockOut;
+
+struct NamedClockList {
+    char *name;
+    bool forward;
+    ClockIn *in;
+    ClockOut *out;
+    QLIST_ENTRY(NamedClockList) node;
+};
+
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
@@ -147,6 +160,7 @@ struct DeviceState {
     int hotplugged;
     BusState *parent_bus;
     QLIST_HEAD(, NamedGPIOList) gpios;
+    QLIST_HEAD(, NamedClockList) clocks;
     QLIST_HEAD(, BusState) child_bus;
     int num_child_bus;
     int instance_id_alias;
diff --git a/include/hw/qdev.h b/include/hw/qdev.h
index 5cb8b080a6..b031da7b41 100644
--- a/include/hw/qdev.h
+++ b/include/hw/qdev.h
@@ -4,5 +4,6 @@
 #include "hw/hw.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 
 #endif
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
new file mode 100644
index 0000000000..cb7dba3f75
--- /dev/null
+++ b/hw/core/qdev-clock.c
@@ -0,0 +1,140 @@
+/*
+ * Device's clock
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
+#include "qom/object.h"
+#include "hw/qdev-clock.h"
+#include "qapi/error.h"
+
+static NamedClockList *qdev_init_clocklist(DeviceState *dev, const char *name,
+        bool forward)
+{
+    NamedClockList *ncl;
+
+    /*
+     * The clock path will be computed by the device's realize function call.
+     * This is required to ensure the clock's canonical path is right and log
+     * messages are meaningfull.
+     */
+    assert(name);
+    assert(!dev->realized);
+
+    ncl = g_malloc0(sizeof(*ncl));
+    ncl->name = g_strdup(name);
+    ncl->forward = forward;
+
+    QLIST_INSERT_HEAD(&dev->clocks, ncl, node);
+    return ncl;
+}
+
+ClockOut *qdev_init_clock_out(DeviceState *dev, const char *name)
+{
+    NamedClockList *ncl;
+    Object *clk;
+
+    ncl = qdev_init_clocklist(dev, name, false);
+
+    clk = object_new(TYPE_CLOCK_OUT);
+
+    /* will fail if name already exists */
+    object_property_add_child(OBJECT(dev), name, clk, &error_abort);
+    object_unref(clk); /* remove the initial ref made by object_new */
+
+    ncl->out = CLOCK_OUT(clk);
+    return ncl->out;
+}
+
+ClockIn *qdev_init_clock_in(DeviceState *dev, const char *name,
+                        ClockCallback *callback, void *opaque)
+{
+    NamedClockList *ncl;
+    Object *clk;
+
+    ncl = qdev_init_clocklist(dev, name, false);
+
+    clk = object_new(TYPE_CLOCK_IN);
+    /*
+     * the ref initialized by object_new will be cleared during dev finalize.
+     * It allows us to safely remove the callback.
+     */
+
+    /* will fail if name already exists */
+    object_property_add_child(OBJECT(dev), name, clk, &error_abort);
+
+    ncl->in = CLOCK_IN(clk);
+    if (callback) {
+        clock_set_callback(ncl->in, callback, opaque);
+    }
+    return ncl->in;
+}
+
+static NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *name)
+{
+    NamedClockList *ncl;
+
+    QLIST_FOREACH(ncl, &dev->clocks, node) {
+        if (strcmp(name, ncl->name) == 0) {
+            return ncl;
+        }
+    }
+
+    return NULL;
+}
+
+void qdev_init_clock_forward(DeviceState *dev, const char *name,
+                             DeviceState *origin, const char *origin_name)
+{
+    NamedClockList *original_ncl, *ncl;
+    Object **clk;
+
+    assert(origin && origin_name);
+
+    original_ncl = qdev_get_clocklist(origin, origin_name);
+    assert(original_ncl); /* clock must exist in origin */
+
+    ncl = qdev_init_clocklist(dev, name, true);
+
+    if (ncl->out) {
+        clk = (Object **)&ncl->out;
+    } else {
+        clk = (Object **)&ncl->in;
+    }
+
+    /* will fail if name already exists */
+    object_property_add_link(OBJECT(dev), name, object_get_typename(*clk),
+            clk, NULL, OBJ_PROP_LINK_STRONG, &error_abort);
+}
+
+void qdev_clock_connect(DeviceState *dev, const char *name,
+                        DeviceState *driver, const char *driver_name,
+                        Error **errp)
+{
+    NamedClockList *ncl, *drv_ncl;
+
+    assert(dev && name);
+    assert(driver && driver_name);
+
+    ncl = qdev_get_clocklist(dev, name);
+    if (!ncl || !ncl->in) {
+        error_setg(errp, "no input clock '%s' in device", name);
+        return;
+    }
+
+    drv_ncl = qdev_get_clocklist(driver, driver_name);
+    if (!drv_ncl || !drv_ncl->out) {
+        error_setg(errp, "no output clock '%s' in driver", driver_name);
+        return;
+    }
+
+    clock_connect(ncl->in , drv_ncl->out);
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 529b82de18..21a8b6b561 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -790,6 +790,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
     DeviceClass *dc = DEVICE_GET_CLASS(dev);
     HotplugHandler *hotplug_ctrl;
     BusState *bus;
+    NamedClockList *clk;
     Error *local_err = NULL;
     bool unattached_parent = false;
     static int unattached_count;
@@ -846,6 +847,15 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
          */
         g_free(dev->canonical_path);
         dev->canonical_path = object_get_canonical_path(OBJECT(dev));
+        QLIST_FOREACH(clk, &dev->clocks, node) {
+            if (clk->forward) {
+                continue;
+            } else if (clk->in != NULL) {
+                clock_setup_canonical_path(CLOCK_PORT(clk->in));
+            } else {
+                clock_setup_canonical_path(CLOCK_PORT(clk->out));
+            }
+        }
 
         if (qdev_get_vmsd(dev)) {
             if (vmstate_register_with_alias_id(dev, -1, qdev_get_vmsd(dev), dev,
@@ -972,6 +982,7 @@ static void device_initfn(Object *obj)
                              (Object **)&dev->parent_bus, NULL, 0,
                              &error_abort);
     QLIST_INIT(&dev->gpios);
+    QLIST_INIT(&dev->clocks);
 }
 
 static void device_post_init(Object *obj)
@@ -983,6 +994,7 @@ static void device_post_init(Object *obj)
 static void device_finalize(Object *obj)
 {
     NamedGPIOList *ngl, *next;
+    NamedClockList *clk, *clk_next;
 
     DeviceState *dev = DEVICE(obj);
 
@@ -996,6 +1008,23 @@ static void device_finalize(Object *obj)
          */
     }
 
+    QLIST_FOREACH_SAFE(clk, &dev->clocks, node, clk_next) {
+        QLIST_REMOVE(clk, node);
+        if (!clk->forward && clk->in) {
+            /*
+             * if this clock is not forwarded, clk->in & clk->out are child of
+             * dev.
+             * At this point the properties and associated reference are
+             * already deleted but we kept a ref on clk->in to ensure we
+             * don't have a lost callback to a deleted device somewhere.
+             */
+            clock_clear_callback(clk->in);
+            object_unref(OBJECT(clk->in));
+        }
+        g_free(clk->name);
+        g_free(clk);
+    }
+
     /* Only send event if the device had been completely realized */
     if (dev->pending_deleted_event) {
         g_assert(dev->canonical_path);
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index f7102121f4..fc0505e716 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -1,5 +1,5 @@
 # core qdev-related obj files, also used by *-user:
-common-obj-y += qdev.o qdev-properties.o
+common-obj-y += qdev.o qdev-properties.o qdev-clock.o
 common-obj-y += bus.o reset.o
 common-obj-$(CONFIG_SOFTMMU) += qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) += fw-path-provider.o
-- 
2.18.0

