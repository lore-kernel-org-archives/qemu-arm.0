Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11496864wrx;
        Tue, 26 Feb 2019 12:56:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib2JV2ZoaYhMHk04NYv/p5ep8voxO/ciIUnWrMz4LLdnlGPTCnAd5AqLdUVFZVjHbNmmXH8
X-Received: by 2002:a25:6890:: with SMTP id d138mr10777744ybc.18.1551214570588;
        Tue, 26 Feb 2019 12:56:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214570; cv=none;
        d=google.com; s=arc-20160816;
        b=a0eUA33xDmy1T++j7UsLCBKJ+UM4cTR1F7UCvVFSDWWWIxhGPLDdMPPVRjJz9tUS/1
         Xx0QNNda/JlulWISBu+QP7ZdTxgQX0FRDEFAwFzYITK895lWdmY7vD46uHCnLUeHHaeU
         X9RtiqOYXwOiw/n0rwyzYVBalqy/wzNQuaFEpKcAu3R13iFweyram2XWYPpoyB3HrqUc
         xZI4ec7OIyArBNwN2C7/UbTZRmo88cJ+1k+AVPG2cNJPReVaUjTwtTpprbfKM4l56v6y
         2f4xtZGAwnNfNbuhMP1+spGCv0DWchyPx9na1lVuhqUObQ/HvkgpB4tem8zyTLI/H1Jt
         LnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=eA83eweQNvwg5QcWmkBIALKIPVlR3p+qKr5cS76ZR4s=;
        b=mep5mOF+F7ymHq7WyZ6pTmBAdwH37UrWGGf0L17xnpilh0W7wZR8og8hBlJoS0efsN
         V/w3DFFbJ8nOCOTU06hLKikxbnOSaVKjk/XE1RlI3d2hMbEucKBUSmsIZ7NgJlYrAltj
         bVpBjuML5W7yCyastIsRzzdq1W4AP9ENfzT6H4TmALRZJBjakK4O/Jl5MxRVmw05wuyD
         8pMz9DO/EAYll4rvb/7xsWCkToB9PWCKr7q43M71+dUw3R6MvX0KtnH5n/cXjKltMTOn
         pOGlMrJOt8CJMXBXLKEtQVhVVJG68SAo8N4gQ8AQ3tqpnJrNmeT5wlrJ32KrSPFEZhu5
         kVgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f133si7538811ywa.267.2019.02.26.12.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:56:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyjlq-0005aJ-0f
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjc5-0006Px-Bn
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjbx-0000V2-K8
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjbo-0000M6-6t; Tue, 26 Feb 2019 15:45:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 938EE7DD03;
	Tue, 26 Feb 2019 20:45:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD14B5D6A6;
	Tue, 26 Feb 2019 20:45:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:32 +0100
Message-Id: <20190226204439.2296-12-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 26 Feb 2019 20:45:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v9 11/18] hw/arm/virt: Add memory hotplug
 framework
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+fU+LxSHKmE

This patch adds the the memory hot-plug/hot-unplug infrastructure
in machvirt. It is still not enabled as no device memory is allocated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v7 -> v8:
- fix indent issue reported by Igor and added his R-b

v4 -> v5:
- change in pc_dimm_pre_plug signature
- CONFIG_MEM_HOTPLUG replaced by CONFIG_MEM_DEVICE and CONFIG_DIMM

v3 -> v4:
- check the memory device is not hotplugged

v2 -> v3:
- change in pc_dimm_plug()'s signature
- add pc_dimm_pre_plug call

v1 -> v2:
- s/virt_dimm_plug|unplug/virt_memory_plug|unplug
- s/pc_dimm_memory_plug/pc_dimm_plug
- reworded title and commit message
- added pre_plug cb
- don't handle get_memory_region failure anymore
---
 default-configs/arm-softmmu.mak |  2 ++
 hw/arm/virt.c                   | 64 ++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 87ad267494..4009a56c67 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -164,3 +164,5 @@ CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
 CONFIG_STRONGARM=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
+CONFIG_MEM_DEVICE=3Dy
+CONFIG_DIMM=3Dy
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b854438046..6e2cbba22e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -61,6 +61,8 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1813,6 +1815,49 @@ static const CPUArchIdList *virt_possible_cpu_arch=
_ids(MachineState *ms)
     return ms->possible_cpus;
 }
=20
+static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceStat=
e *dev,
+                                 Error **errp)
+{
+    const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIM=
M);
+
+    if (dev->hotplugged) {
+        error_setg(errp, "memory hotplug is not supported");
+    }
+
+    if (is_nvdimm) {
+        error_setg(errp, "nvdimm is not yet supported");
+        return;
+    }
+
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+}
+
+static void virt_memory_plug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
+    Error *local_err =3D NULL;
+
+    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
+
+    error_propagate(errp, local_err);
+}
+
+static void virt_memory_unplug(HotplugHandler *hotplug_dev,
+                               DeviceState *dev, Error **errp)
+{
+    pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
+    object_unparent(OBJECT(dev));
+}
+
+static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                            DeviceState *dev, Error **er=
rp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_pre_plug(hotplug_dev, dev, errp);
+    }
+}
+
 static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                         DeviceState *dev, Error **errp)
 {
@@ -1824,12 +1869,27 @@ static void virt_machine_device_plug_cb(HotplugHa=
ndler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_plug(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp=
)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_unplug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "device unplug request for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
 }
=20
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *ma=
chine,
                                                         DeviceState *dev=
)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
=20
@@ -1893,7 +1953,9 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->kvm_type =3D virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
+    hc->pre_plug =3D virt_machine_device_pre_plug_cb;
     hc->plug =3D virt_machine_device_plug_cb;
+    hc->unplug =3D virt_machine_device_unplug_cb;
 }
=20
 static void virt_instance_init(Object *obj)
--=20
2.20.1

