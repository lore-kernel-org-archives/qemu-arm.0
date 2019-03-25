Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711801wrx;
        Mon, 25 Mar 2019 04:03:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxya8kYw+zbdWm3VnFtlNPjYO7D9/I0+7bo8tasYWQ+d0DUMfHQJ55hAOQjOdyrumtga2fC
X-Received: by 2002:a0d:cc12:: with SMTP id o18mr21359734ywd.501.1553511800563;
        Mon, 25 Mar 2019 04:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511800; cv=none;
        d=google.com; s=arc-20160816;
        b=BEdp6c6gQqCXB0aE6hZ1g37Hj9ArCIMkpnM+hGQv3lpCL/Z4Yramf9qTf519rQRN0s
         n28YiVe3fzxdmqXooLtyi26yamK8dtkSg6Yq0ocd0jb422J8wm9IckdlzsejW22UMxVy
         C1qAWM6cAhMBU6v0Cpo6daqLF4DvsHCXcyAlRQQvQ7klbhBvVeiT18z9jiJPaSz8OKYl
         cuS3MtlL7y1ahVtSsGBymw19NF6acD5ALyTRfkn4PUBjIjuk2W4NF3HEwIFvkGDMN3qW
         3Q48uNIZkj6X4rAJ42prGuN8zRnvOtBuRZdI4uKW7AKlM7zzJ4VVSWZ20YtD/tOTFqvK
         AkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=853HdfIoSb6sP8Lgbl4GIKWbQlsVPuTiBEQFz7vwjno=;
        b=DGNO+1bkGm90wQXkSbWMwy9GhL7k0/9gUXomDK4yuqOMFPmlJj5PWu97LhEdArRH8K
         v1SbkobzoKvG3Mjih10Uatdzy8Lea0oKXJhYae5ywBpxnQiM6HRezBtPdtS2yXS7ny3V
         POFfpElBEg7GaVaXJIkH0NeYjxOURWOJOilmlvvBLMHUCTLMkx5JqYu8OIkzyWLp+Cpv
         jJwYQ0R75+7cGkDl7/sszHclN2RKhPYgIt0ApcZF+KF3VnyVnVPjY5HOfH0s70r48IMS
         AixKVvsvztHOAoTNfnF+husNiTJiao2v6AiRkMia1MUmFym+KmOfWdqCTelg89DwiAG+
         eoYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dyx2YVNI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="UEWuR/rw";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="UEWuR/rw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i62si8864240ybi.399.2019.03.25.04.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dyx2YVNI;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="UEWuR/rw";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="UEWuR/rw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNv-0005Q6-SF
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:03:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNA-00056r-L0
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN8-0007on-Ls
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:32 -0400
Received: from greensocs.com ([193.104.36.180]:38266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN7-0007lT-Jy; Mon, 25 Mar 2019 07:02:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 95C797D78AF;
	Mon, 25 Mar 2019 12:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511744;
	bh=YlmXDRZ1/RrwO+VhpRtYBJW25XnBqeYAw6/iPWTZaEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dyx2YVNIaEmlOf/30wDuvVjYJurhWHMn64fmTIDFfpujym2YAEknUckpqMFi5YeEM
	0xMlMz+lmsj4KzrdvedAJDWE0XDjOO2OGX45DJyWMKmtEBqdWrbUTQzNmTisf87bsa
	YtKe7lUl7b60vT9AQlS0txSlXQ2esyB9B1LACJoQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UEWuR/rw;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UEWuR/rw
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8vEj7qFjhdn; Mon, 25 Mar 2019 12:02:23 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id EFC087D78AA; Mon, 25 Mar 2019 12:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511741;
	bh=YlmXDRZ1/RrwO+VhpRtYBJW25XnBqeYAw6/iPWTZaEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UEWuR/rwKbG2FEXTXmDoDSDw+f4c1jqgQyLfM77RKIHppk0CyLvcyo+x/t8JA6zTi
	g8T2mgTtHnY3vl4xtosxcmzaBP+RppWm8CL78cmsQfkQT1Q4vZbTG522xvOrUMcJdQ
	LNSvVVOi9idkoFxXS/CInC5IXFELQb+aGzdFFn9Q=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6166A7D78A5;
	Mon, 25 Mar 2019 12:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511741;
	bh=YlmXDRZ1/RrwO+VhpRtYBJW25XnBqeYAw6/iPWTZaEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UEWuR/rwKbG2FEXTXmDoDSDw+f4c1jqgQyLfM77RKIHppk0CyLvcyo+x/t8JA6zTi
	g8T2mgTtHnY3vl4xtosxcmzaBP+RppWm8CL78cmsQfkQT1Q4vZbTG522xvOrUMcJdQ
	LNSvVVOi9idkoFxXS/CInC5IXFELQb+aGzdFFn9Q=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:46 +0100
Message-Id: <d855a49137279273c8e02effc446140b7aa59450.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 03/17] make Device and Bus Resettable
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TE5b/Ovs3c7T

This add Resettable interface implementation for both Bus and Device.
The init phase default implementation is to call the legacy reset
handler.

Add a *resetting* counter in both Device and Bus. This counter allows us =
to
handle reentrancy in reset operation. If a device/bus has multiple
source triggering reset, theses sources do not have to care about the
current device/bus resetting state. Each source can independantly assert
and eventually deassert the reset. The device/bus will behave as expected=
 and
gets out-of-reset state only when all sources have deasserted the reset.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/bus.c          | 60 +++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev.c         | 61 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h | 30 +++++++++++++++++++++
 3 files changed, 151 insertions(+)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index e09843f6ab..0a60bb4b24 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "hw/qdev.h"
 #include "qapi/error.h"
+#include "hw/resettable.h"
=20
 void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error **er=
rp)
 {
@@ -67,6 +68,56 @@ int qbus_walk_children(BusState *bus,
     return 0;
 }
=20
+void qbus_reset(BusState *bus, bool cold)
+{
+    resettable_reset(OBJECT(bus), cold);
+}
+
+bool qbus_is_resetting(BusState *bus)
+{
+    return (bus->resetting !=3D 0);
+}
+
+static void bus_reset_init_phase(Object *obj, bool cold)
+{
+    BusState *bus =3D BUS(obj);
+    BusClass *bc =3D BUS_GET_CLASS(obj);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        resettable_init_phase(OBJECT(kid->child), cold);
+    }
+
+    bus->resetting +=3D 1;
+
+    if (bc->reset) {
+        bc->reset(bus);
+    }
+}
+
+static void bus_reset_hold_phase(Object *obj)
+{
+    BusState *bus =3D BUS(obj);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        resettable_hold_phase(OBJECT(kid->child));
+    }
+}
+
+static void bus_reset_exit_phase(Object *obj)
+{
+    BusState *bus =3D BUS(obj);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        resettable_exit_phase(OBJECT(kid->child));
+    }
+
+    assert(bus->resetting > 0);
+    bus->resetting -=3D 1;
+}
+
 static void qbus_realize(BusState *bus, DeviceState *parent, const char =
*name)
 {
     const char *typename =3D object_get_typename(OBJECT(bus));
@@ -204,9 +255,14 @@ static char *default_bus_get_fw_dev_path(DeviceState=
 *dev)
 static void bus_class_init(ObjectClass *class, void *data)
 {
     BusClass *bc =3D BUS_CLASS(class);
+    ResettableClass *rc =3D RESETTABLE_CLASS(class);
=20
     class->unparent =3D bus_unparent;
     bc->get_fw_dev_path =3D default_bus_get_fw_dev_path;
+
+    rc->phases.init =3D bus_reset_init_phase;
+    rc->phases.hold =3D bus_reset_hold_phase;
+    rc->phases.exit =3D bus_reset_exit_phase;
 }
=20
 static void qbus_finalize(Object *obj)
@@ -225,6 +281,10 @@ static const TypeInfo bus_info =3D {
     .instance_init =3D qbus_initfn,
     .instance_finalize =3D qbus_finalize,
     .class_init =3D bus_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_RESETTABLE },
+        { }
+    },
 };
=20
 static void bus_register_types(void)
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index f9b6efe509..98d173f34f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -37,6 +37,7 @@
 #include "hw/hotplug.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
+#include "hw/resettable.h"
=20
 bool qdev_hotplug =3D false;
 static bool qdev_hot_added =3D false;
@@ -254,6 +255,56 @@ HotplugHandler *qdev_get_hotplug_handler(DeviceState=
 *dev)
     return hotplug_ctrl;
 }
=20
+void qdev_reset(DeviceState *dev, bool cold)
+{
+    resettable_reset(OBJECT(dev), cold);
+}
+
+bool qdev_is_resetting(DeviceState *dev)
+{
+    return (dev->resetting !=3D 0);
+}
+
+static void device_reset_init_phase(Object *obj, bool cold)
+{
+    DeviceState *dev =3D DEVICE(obj);
+    DeviceClass *dc =3D DEVICE_GET_CLASS(obj);
+    BusState *child;
+
+    QLIST_FOREACH(child, &dev->child_bus, sibling) {
+        resettable_init_phase(OBJECT(child), cold);
+    }
+
+    dev->resetting +=3D 1;
+
+    if (dc->reset) {
+        dc->reset(dev);
+    }
+}
+
+static void device_reset_hold_phase(Object *obj)
+{
+    DeviceState *dev =3D DEVICE(obj);
+    BusState *child;
+
+    QLIST_FOREACH(child, &dev->child_bus, sibling) {
+        resettable_hold_phase(OBJECT(child));
+    }
+}
+
+static void device_reset_exit_phase(Object *obj)
+{
+    DeviceState *dev =3D DEVICE(obj);
+    BusState *child;
+
+    QLIST_FOREACH(child, &dev->child_bus, sibling) {
+        resettable_exit_phase(OBJECT(child));
+    }
+
+    assert(dev->resetting > 0);
+    dev->resetting -=3D 1;
+}
+
 static int qdev_reset_one(DeviceState *dev, void *opaque)
 {
     device_reset(dev);
@@ -954,6 +1005,7 @@ static void device_initfn(Object *obj)
=20
     dev->instance_id_alias =3D -1;
     dev->realized =3D false;
+    dev->resetting =3D 0;
=20
     object_property_add_bool(obj, "realized",
                              device_get_realized, device_set_realized, N=
ULL);
@@ -1049,6 +1101,7 @@ static void device_unparent(Object *obj)
 static void device_class_init(ObjectClass *class, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(class);
+    ResettableClass *rc =3D RESETTABLE_CLASS(class);
=20
     class->unparent =3D device_unparent;
=20
@@ -1060,6 +1113,10 @@ static void device_class_init(ObjectClass *class, =
void *data)
      */
     dc->hotpluggable =3D true;
     dc->user_creatable =3D true;
+
+    rc->phases.init =3D device_reset_init_phase;
+    rc->phases.hold =3D device_reset_hold_phase;
+    rc->phases.exit =3D device_reset_exit_phase;
 }
=20
 void device_class_set_parent_reset(DeviceClass *dc,
@@ -1117,6 +1174,10 @@ static const TypeInfo device_type_info =3D {
     .class_init =3D device_class_init,
     .abstract =3D true,
     .class_size =3D sizeof(DeviceClass),
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_RESETTABLE },
+        { }
+    },
 };
=20
 static void qdev_register_types(void)
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 33ed3b8dde..f4aa8dbaa2 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -131,6 +131,8 @@ struct NamedGPIOList {
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
+ * @resetting: Indicates whether the device is under reset. Also
+ * used to count how many times reset has been initiated on the device.
  *
  * This structure should not be accessed directly.  We declare it here
  * so that it can be embedded in individual device state structures.
@@ -152,6 +154,7 @@ struct DeviceState {
     int num_child_bus;
     int instance_id_alias;
     int alias_required_for_version;
+    uint32_t resetting;
 };
=20
 struct DeviceListener {
@@ -198,6 +201,8 @@ typedef struct BusChild {
 /**
  * BusState:
  * @hotplug_handler: link to a hotplug handler associated with bus.
+ * @resetting: Indicates whether the device is under reset. Also
+ * used to count how many times reset has been initiated on the device.
  */
 struct BusState {
     Object obj;
@@ -209,6 +214,7 @@ struct BusState {
     int num_children;
     QTAILQ_HEAD(, BusChild) children;
     QLIST_ENTRY(BusState) sibling;
+    uint32_t resetting;
 };
=20
 /**
@@ -378,6 +384,30 @@ int qdev_walk_children(DeviceState *dev,
                        qdev_walkerfn *post_devfn, qbus_walkerfn *post_bu=
sfn,
                        void *opaque);
=20
+/**
+ * @qdev_reset:
+ * Reset the device @dev, @cold tell whether to do a cold or warm reset.
+ */
+void qdev_reset(DeviceState *dev, bool cold);
+
+/**
+ * @qbus_reset:
+ * Reset the bus @bus, @cold tell whether to do a cold or warm reset.
+ */
+void qbus_reset(BusState *bus, bool cold);
+
+/**
+ * @qdev_is_resetting:
+ * Tell whether the device @dev is currently under reset.
+ */
+bool qdev_is_resetting(DeviceState *dev);
+
+/**
+ * @qbus_is_resetting:
+ * Tell whether the bus @bus is currently under reset.
+ */
+bool qbus_is_resetting(BusState *bus);
+
 void qdev_reset_all(DeviceState *dev);
 void qdev_reset_all_fn(void *opaque);
=20
--=20
2.21.0

