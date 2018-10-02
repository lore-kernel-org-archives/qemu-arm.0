Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5132718wrt;
        Tue, 2 Oct 2018 07:37:14 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60JudZ7JJ/LG1tYGxHYXzFCxWzMCpJ8Qhiljk9r3exko7ZblozWc6jKd8jyzRthel9sIv0P
X-Received: by 2002:a37:d9c1:: with SMTP id q62-v6mr12415393qkl.117.1538491034098;
        Tue, 02 Oct 2018 07:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491034; cv=none;
        d=google.com; s=arc-20160816;
        b=0guFykBSc33MtjP1Lve2meajomyvv7sekjkT/psjLt+MhGJw8T+VotgENBfYKBAG2E
         JvXtnvvEYyZy4GP2PZLDoW4Epm1nvXotiu8d5Bc0kjtSckcExFTQN+Pkkw9ttomDOV4L
         BN/E+ECa0IjRtYfEv436GrNHaOX8NOEUTiiV3Q+ZNbMUbyiiH6JWkEk4r6a1+t1JzpN8
         4hpMQf+pD56VAjkg8Ik29RFzWcN942goqkAKINPyQ/qr1Xpfe1OTRN9jqmP172Cdzxl2
         0FWlx0P6O3aSvt6Mw3LUn/0WtjF3olgbHO1hwjDe9Fk0A8//S25zg7ttn1JZeXl8mtOF
         XWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=XSII1/wdOEqzsqNRXSBeDe5DwkjKXce1NaXo6A30CkE=;
        b=STohT9IvoDzMPo3Z7fYcjU0EwOPlEaYhZuKa93l+MRckn6gvtrx25+SAvDu7q6dHt4
         EuVWB4I2aVIG756D88+2U5/x6yXukY7x7EDHE5/uy4ZaIVZr48yriSus3ioliknFj91z
         Dtjlp3xWVwFG3VOqqcqSUAd9lQOCHpaXvJ3kx3QZjiD1kHxbWhhpoai9qGUzq5VSvVDY
         m2OqumYPwkRA476Q8wrb4a4gYcsVbw3iH6iKVwL+xolAHtdjIESLO8S0v1k77mqTutum
         xbFR+SlI/YURb8q7eq+PNmcDQzc/R/hm7QPcZ1io791fNwfUX9ATcquSd8E4sKHDMUdO
         Tt/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=f9F5H1XG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ax2IQLwP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ax2IQLwP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p16-v6si1943725qvo.225.2018.10.02.07.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=f9F5H1XG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ax2IQLwP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ax2IQLwP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7LnV-0005Ni-GV
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:37:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmn-0005Jj-MF
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdC-0004Q1-Gl
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:26:37 -0400
Received: from greensocs.com ([193.104.36.180]:53816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7Ld9-0004Kz-8Z; Tue, 02 Oct 2018 10:26:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 13427442AFF;
	Tue,  2 Oct 2018 16:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490367;
	bh=W368a874LLn3wLZ0ssLjyDwxQKF21HbKz4tSIYNoBNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f9F5H1XGRNIhraILjBGUQJdJiSUXw3i5Se/7cI44HYWT0griEQd5yrizC+qXEhIdT
	5Bm9zt1uVUsGc6xvGtVNpP+pyHzbqFbcmR1o/Xih64ioMqJzyaRIBbwJ9uyhoNT0Xn
	bEeax0OG/lKXdkBd0w60LMNafWyhqCvjzESaE5wg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ax2IQLwP;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ax2IQLwP
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsD2aumRFfpu; Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B5BF2442AED; Tue,  2 Oct 2018 16:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490364;
	bh=W368a874LLn3wLZ0ssLjyDwxQKF21HbKz4tSIYNoBNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ax2IQLwPsJndXD0kUMaoqrxUImvC87i1XxxTIPu2IdsRfCEtlIa/9oXZ8coN26wrW
	X/ZBtS90kLbdH7s4RwUEedZSb/p1QMmfu4SaoTsXGw+to8NjFcFHdzTQE6A5CB7IhR
	4KlAesA5Yv07iLX380Wc0A+RQmEXJi4CW+c4Y6+4=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 55599442AE7;
	Tue,  2 Oct 2018 16:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490364;
	bh=W368a874LLn3wLZ0ssLjyDwxQKF21HbKz4tSIYNoBNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ax2IQLwPsJndXD0kUMaoqrxUImvC87i1XxxTIPu2IdsRfCEtlIa/9oXZ8coN26wrW
	X/ZBtS90kLbdH7s4RwUEedZSb/p1QMmfu4SaoTsXGw+to8NjFcFHdzTQE6A5CB7IhR
	4KlAesA5Yv07iLX380Wc0A+RQmEXJi4CW+c4Y6+4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:36 +0200
Message-Id: <20181002142443.30976-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 2/9] qdev: add clock input&output support to
 devices.
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tmdqjwnayMFj

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
index 0000000000..d76aa9f479
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
+ * qdev_pass_clock:
+ * @dev: the device to forward the clock to
+ * @name: the name of the clock to be added (can't be NULL)
+ * @container: the device which already has the clock
+ * @cont_name: the name of the clock in the container device
+ *
+ * Add a clock @name to @dev which forward to the clock @cont_name in @c=
ontainer
+ */
+void qdev_pass_clock(DeviceState *dev, const char *name,
+        DeviceState *container, const char *cont_name);
+
+/**
+ * qdev_connect_clock:
+ * @dev: the drived clock device.
+ * @name: the drived clock name.
+ * @driver: the driving clock device.
+ * @driver_name: the driving clock name.
+ * @errp: error report
+ *
+ * Setup @driver_name output clock of @driver to drive @name input clock=
 of
+ * @dev. Errors are trigerred if clock does not exists
+ */
+void qdev_connect_clock(DeviceState *dev, const char *name,
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
=20
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
=20
 #endif
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
new file mode 100644
index 0000000000..f0e4839aed
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
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "hw/qdev-clock.h"
+#include "qapi/error.h"
+
+static NamedClockList *qdev_init_clocklist(DeviceState *dev, const char =
*name,
+        bool forward)
+{
+    NamedClockList *ncl;
+
+    /*
+     * The clock path will be computed by the device's realize function =
call.
+     * This is required to ensure the clock's canonical path is right an=
d log
+     * messages are meaningfull.
+     */
+    assert(name);
+    assert(!dev->realized);
+
+    ncl =3D g_malloc0(sizeof(*ncl));
+    ncl->name =3D g_strdup(name);
+    ncl->forward =3D forward;
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
+    ncl =3D qdev_init_clocklist(dev, name, false);
+
+    clk =3D object_new(TYPE_CLOCK_OUT);
+
+    /* will fail if name already exists */
+    object_property_add_child(OBJECT(dev), name, clk, &error_abort);
+    object_unref(clk); /* remove the initial ref made by object_new */
+
+    ncl->out =3D CLOCK_OUT(clk);
+    return ncl->out;
+}
+
+ClockIn *qdev_init_clock_in(DeviceState *dev, const char *name,
+                        ClockCallback *callback, void *opaque)
+{
+    NamedClockList *ncl;
+    Object *clk;
+
+    ncl =3D qdev_init_clocklist(dev, name, false);
+
+    clk =3D object_new(TYPE_CLOCK_IN);
+    /*
+     * the ref initialized by object_new will be cleared during dev fina=
lize.
+     * It allows us to safely remove the callback.
+     */
+
+    /* will fail if name already exists */
+    object_property_add_child(OBJECT(dev), name, clk, &error_abort);
+
+    ncl->in =3D CLOCK_IN(clk);
+    if (callback) {
+        clock_set_callback(ncl->in, callback, opaque);
+    }
+    return ncl->in;
+}
+
+static NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *=
name)
+{
+    NamedClockList *ncl;
+
+    QLIST_FOREACH(ncl, &dev->clocks, node) {
+        if (strcmp(name, ncl->name) =3D=3D 0) {
+            return ncl;
+        }
+    }
+
+    return NULL;
+}
+
+void qdev_pass_clock(DeviceState *dev, const char *name,
+                     DeviceState *container, const char *cont_name)
+{
+    NamedClockList *original_ncl, *ncl;
+    Object **clk;
+
+    assert(container && cont_name);
+
+    original_ncl =3D qdev_get_clocklist(container, cont_name);
+    assert(original_ncl); /* clock must exist in origin */
+
+    ncl =3D qdev_init_clocklist(dev, name, true);
+
+    if (ncl->out) {
+        clk =3D (Object **)&ncl->out;
+    } else {
+        clk =3D (Object **)&ncl->in;
+    }
+
+    /* will fail if name already exists */
+    object_property_add_link(OBJECT(dev), name, object_get_typename(*clk=
),
+            clk, NULL, OBJ_PROP_LINK_STRONG, &error_abort);
+}
+
+void qdev_connect_clock(DeviceState *dev, const char *name,
+                        DeviceState *driver, const char *driver_name,
+                        Error **errp)
+{
+    NamedClockList *ncl, *drv_ncl;
+
+    assert(dev && name);
+    assert(driver && driver_name);
+
+    ncl =3D qdev_get_clocklist(dev, name);
+    if (!ncl || !ncl->in) {
+        error_setg(errp, "no input clock '%s' in device", name);
+        return;
+    }
+
+    drv_ncl =3D qdev_get_clocklist(driver, driver_name);
+    if (!drv_ncl || !drv_ncl->out) {
+        error_setg(errp, "no output clock '%s' in driver", driver_name);
+        return;
+    }
+
+    clock_connect(ncl->in , drv_ncl->out);
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 529b82de18..c48edf180f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -790,6 +790,7 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
     DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
     HotplugHandler *hotplug_ctrl;
     BusState *bus;
+    NamedClockList *clk;
     Error *local_err =3D NULL;
     bool unattached_parent =3D false;
     static int unattached_count;
@@ -846,6 +847,15 @@ static void device_set_realized(Object *obj, bool va=
lue, Error **errp)
          */
         g_free(dev->canonical_path);
         dev->canonical_path =3D object_get_canonical_path(OBJECT(dev));
+        QLIST_FOREACH(clk, &dev->clocks, node) {
+            if (clk->forward) {
+                continue;
+            } else if (clk->in !=3D NULL) {
+                clock_in_setup_canonical_path(clk->in);
+            } else {
+                clock_out_setup_canonical_path(clk->out);
+            }
+        }
=20
         if (qdev_get_vmsd(dev)) {
             if (vmstate_register_with_alias_id(dev, -1, qdev_get_vmsd(de=
v), dev,
@@ -972,6 +982,7 @@ static void device_initfn(Object *obj)
                              (Object **)&dev->parent_bus, NULL, 0,
                              &error_abort);
     QLIST_INIT(&dev->gpios);
+    QLIST_INIT(&dev->clocks);
 }
=20
 static void device_post_init(Object *obj)
@@ -983,6 +994,7 @@ static void device_post_init(Object *obj)
 static void device_finalize(Object *obj)
 {
     NamedGPIOList *ngl, *next;
+    NamedClockList *clk, *clk_next;
=20
     DeviceState *dev =3D DEVICE(obj);
=20
@@ -996,6 +1008,23 @@ static void device_finalize(Object *obj)
          */
     }
=20
+    QLIST_FOREACH_SAFE(clk, &dev->clocks, node, clk_next) {
+        QLIST_REMOVE(clk, node);
+        if (!clk->forward && clk->in) {
+            /*
+             * if this clock is not forwarded, clk->in & clk->out are ch=
ild of
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
-common-obj-y +=3D qdev.o qdev-properties.o
+common-obj-y +=3D qdev.o qdev-properties.o qdev-clock.o
 common-obj-y +=3D bus.o reset.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
--=20
2.19.0

