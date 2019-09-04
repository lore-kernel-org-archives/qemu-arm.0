Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp663888wrp;
        Wed, 4 Sep 2019 05:49:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHV3cvWG6uHI2Gqky3lECxBSdqlz1y4QeTgXx55G1uLBvk1i/+0FEkiNpqMP66myNuu90j
X-Received: by 2002:a37:4b02:: with SMTP id y2mr5380877qka.493.1567601373870;
        Wed, 04 Sep 2019 05:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567601373; cv=none;
        d=google.com; s=arc-20160816;
        b=vOQUqy09iVviN4erlhpftCTdcD7G3wRnEX9I72F0wfPP9cdkg4YE+Ir8gFQ6s40Jo4
         FOzDsLaWHFrnnwhkKDjzidtoyoVXO/RGqBQNctMA3ksxA+dX+Ubplw6kVxiPYTLw4lRF
         GaT8fgNR7r3GaBVA/PX9mIb7XZkvTPW9zWYAin3FIZo26OJmnm8kkCkqHGIvWmY3/CVP
         Tg7QtjRi3RYYckhy9LsslCqmwtmDbZDY/MT6RYhuonjEqP7JGDZq7KBWDJRtwn9MbXMj
         0+05GFgPBeEF9Epbpx4rf+0GpclszwZmmAj4n/gkvOCsp5hktCB++iKxNlWjDVvK+Vjd
         R3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=VrTZqzjfiybOxzZBin8FxB7vhfl9Nwyv/6gSpKExsyo=;
        b=bt680vxTNoxftlfHHKUpdIcOwTX+GI31akzj217/86W0e8CPd7gMsjfR4gKewW1tWl
         8fKmOc5klPXy37PiA6ojgRetsi7jrItR3XCjDV1CYEehODdnem8hO1CUT88aA7GqFPnT
         rIPxqjD6ZiAQXgZCbC79dP8mKU+Ls3Lm/N8QQle3w1G5sf2RDmYNZvu7542l06HSgCby
         Mvxi0ngBLUkWvoL0Scp2wqyKCtEBaa/sURL87lf1OCxG5PSg1utvEczXDVocUolOOShk
         ozjVWe5fHOnZ0rTJJHV9k6kz/EZYwADfxIghj//5RfCWvK4usJAEhrKTs92pjSqWpdkx
         OA8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n33si5709256qtd.383.2019.09.04.05.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 05:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Uj6-0007ij-SS
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 08:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqq-0004qS-HK
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqn-0008R1-9w
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:20 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rqm-0008Pj-QO; Wed, 04 Sep 2019 05:45:17 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id E2D9D96F56;
 Wed,  4 Sep 2019 09:38:51 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:37 +0200
Message-Id: <20190904093843.8765-4-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904093843.8765-1-damien.hedde@greensocs.con>
References: <20190904093843.8765-1-damien.hedde@greensocs.con>
MIME-Version: 1.0
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:16 -0400
Subject: [Qemu-arm] [PATCH v6 3/9] qdev: add clock input&output support to
 devices.
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4UGhFUNtKZ07

From: Damien Hedde <damien.hedde@greensocs.com>

Add functions to easily add input or output clocks to a device.
A clock objects is added as a child of the device.
The api is very similar the gpio's one.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

---
I've removed the reviewed-by/tested-by of Philippe because I did a small
modification.

qdev_connect_clock() which allowed to connect an input to an output is
now split in 2:
+ qdev_get_clock_in() which gets a given input from a device
+ qdev_connect_clock_out() which connect a given output to a clock
(previously fetched by qdev_get_clock_in())
This part is located in (qdev-clock.[c|h]).
It better matches gpios api and also add the possibility to connect a
device's input clock to a random output clock (used in patch 9).

Also add missing qdev-clock in the test-qdev-global-props so that tests
pass.
---
 hw/core/Makefile.objs   |   2 +-
 hw/core/qdev-clock.c    | 155 ++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev.c          |  32 +++++++++
 include/hw/qdev-clock.h |  67 +++++++++++++++++
 include/hw/qdev-core.h  |  14 ++++
 tests/Makefile.include  |   1 +
 6 files changed, 270 insertions(+), 1 deletion(-)
 create mode 100644 hw/core/qdev-clock.c
 create mode 100644 include/hw/qdev-clock.h

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 8fcebf2e67..4523d3b5c7 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -1,5 +1,5 @@
 # core qdev-related obj files, also used by *-user:
-common-obj-y +=3D qdev.o qdev-properties.o
+common-obj-y +=3D qdev.o qdev-properties.o qdev-clock.o
 common-obj-y +=3D bus.o reset.o
 common-obj-y +=3D resettable.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
new file mode 100644
index 0000000000..bebdd8fa15
--- /dev/null
+++ b/hw/core/qdev-clock.c
@@ -0,0 +1,155 @@
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
+#include "hw/qdev-clock.h"
+#include "hw/qdev-core.h"
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
+    /* The ncl structure will be freed in device's finalize function cal=
l */
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
+                             clk, NULL, OBJ_PROP_LINK_STRONG, &error_abo=
rt);
+}
+
+ClockIn *qdev_get_clock_in(DeviceState *dev, const char *name)
+{
+    NamedClockList *ncl;
+
+    assert(dev && name);
+
+    ncl =3D qdev_get_clocklist(dev, name);
+    return ncl ? ncl->in : NULL;
+}
+
+static ClockOut *qdev_get_clock_out(DeviceState *dev, const char *name)
+{
+    NamedClockList *ncl;
+
+    assert(dev && name);
+
+    ncl =3D qdev_get_clocklist(dev, name);
+    return ncl ? ncl->out : NULL;
+}
+
+void qdev_connect_clock_out(DeviceState *dev, const char *name, ClockIn =
*clk,
+                            Error **errp)
+{
+    ClockOut *clkout =3D qdev_get_clock_out(dev, name);
+
+    if (!clk) {
+        error_setg(errp, "NULL input clock");
+        return;
+    }
+
+    if (!clkout) {
+        error_setg(errp, "no output clock '%s' in device", name);
+        return;
+    }
+
+    clock_connect(clk, clkout);
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 9095f2b9c1..eae6cd3e09 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -37,6 +37,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
+#include "hw/clock.h"
 #include "migration/vmstate.h"
=20
 bool qdev_hotplug =3D false;
@@ -821,6 +822,7 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
     DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
     HotplugHandler *hotplug_ctrl;
     BusState *bus;
+    NamedClockList *clk;
     Error *local_err =3D NULL;
     bool unattached_parent =3D false;
     static int unattached_count;
@@ -869,6 +871,15 @@ static void device_set_realized(Object *obj, bool va=
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
@@ -999,6 +1010,7 @@ static void device_initfn(Object *obj)
                              (Object **)&dev->parent_bus, NULL, 0,
                              &error_abort);
     QLIST_INIT(&dev->gpios);
+    QLIST_INIT(&dev->clocks);
 }
=20
 static void device_post_init(Object *obj)
@@ -1015,6 +1027,7 @@ static void device_post_init(Object *obj)
 static void device_finalize(Object *obj)
 {
     NamedGPIOList *ngl, *next;
+    NamedClockList *clk, *clk_next;
=20
     DeviceState *dev =3D DEVICE(obj);
=20
@@ -1028,6 +1041,25 @@ static void device_finalize(Object *obj)
          */
     }
=20
+    QLIST_FOREACH_SAFE(clk, &dev->clocks, node, clk_next) {
+        QLIST_REMOVE(clk, node);
+        if (!clk->forward && clk->in) {
+            /*
+             * if this clock is not forwarded, clk->in is a child of dev=
.
+             * At this point the child property and associated reference=
 is
+             * already deleted but we kept a ref on clk->in to ensure it=
 lives
+             * up to this point and we can safely remove the callback.
+             * It avoids having a lost callback to a deleted device if t=
he
+             * clk->in is still referenced somewhere else (eg: by a cloc=
k
+             * output).
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
diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
new file mode 100644
index 0000000000..c4ea912fdc
--- /dev/null
+++ b/include/hw/qdev-clock.h
@@ -0,0 +1,67 @@
+#ifndef QDEV_CLOCK_H
+#define QDEV_CLOCK_H
+
+#include "hw/clock.h"
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
+ * qdev_get_clock_in:
+ * @dev: the device which has the clock
+ * @name: the name of the clock (can't be NULL).
+ * @returns: a pointer to the clock
+ *
+ * Get the clock @name from @dev or NULL if does not exists.
+ */
+ClockIn *qdev_get_clock_in(DeviceState *dev, const char *name);
+
+/**
+ * qdev_connect_clock_out:
+ * @dev: the device which has the clock
+ * @name: the name of the clock (can't be NULL).
+ * @errp: error report
+ *
+ * Connect @clk to the output clock @name of @dev.
+ * Reports an error if clk is NULL or @name does not exists in @dev.
+ */
+void qdev_connect_clock_out(DeviceState *dev, const char *name, ClockIn =
*clk,
+                            Error **errp);
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
+                     DeviceState *container, const char *cont_name);
+
+#endif /* QDEV_CLOCK_H */
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index eb11f0f801..60a65f6142 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -131,6 +131,19 @@ struct NamedGPIOList {
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
@@ -152,6 +165,7 @@ struct DeviceState {
     int hotplugged;
     BusState *parent_bus;
     QLIST_HEAD(, NamedGPIOList) gpios;
+    QLIST_HEAD(, NamedClockList) clocks;
     QLIST_HEAD(, BusState) child_bus;
     int num_child_bus;
     int instance_id_alias;
diff --git a/tests/Makefile.include b/tests/Makefile.include
index f0b4628cc6..5c54beb29e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -566,6 +566,7 @@ tests/test-qdev-global-props$(EXESUF): tests/test-qde=
v-global-props.o \
 	hw/core/irq.o \
 	hw/core/fw-path-provider.o \
 	hw/core/reset.o \
+	hw/core/clock.o \
 	$(test-qapi-obj-y)
 tests/test-vmstate$(EXESUF): tests/test-vmstate.o \
 	migration/vmstate.o migration/vmstate-types.o migration/qemu-file.o \
--=20
2.22.0

