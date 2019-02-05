Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5046172wrt;
        Tue, 5 Feb 2019 10:01:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZISZQj7WVpfqfIP1JSfbtfXsNFUSjMOwIKPF96EUTd7MQ215xYCBuQx8dEZRlysYUavxbH
X-Received: by 2002:ae9:f212:: with SMTP id m18mr4401664qkg.5.1549389667649;
        Tue, 05 Feb 2019 10:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389667; cv=none;
        d=google.com; s=arc-20160816;
        b=iwYc2JHSZCtekBnFm2IeXXtw6ydNmVSSETW/Rm3S+aGypd2OgV8foIhOyJUwxzNfbQ
         JN2leVLpkfmFKck6vvZs6XTp0/LR/qn6Iv5xeWS9JfqaafwgtUb7ogzEQTAf2jD94y05
         IBmkDspr92H/srSXjI0pNJXGGwOjvD3MW62LIEh6QqWL74FW5cBYhmUvtZ64xDviVTpT
         O6VGCtBV4BFd39/TFgipIMP2BUzZJiiDDOt26T8EF5qYe4bnjM0TBurswirp5jog6IlZ
         XdzAVJSqhLNFewGTsQKEzfuMw202THbJXGKBRuVTYqn0zTlgRdLlMy/0P539Qc34epPa
         kW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=efrFO0Z17xU141+AzS91UOt5NY1O4NFX6aOYfbQrmfo=;
        b=Jg2geCovP5J7z30JW1LN0nQbIKGo67GH/GExf8q0Xz65EzUT3avofrwoeuWXTIEYR+
         tpHL5czCjJIcaiW2dm+8NwNIejELWc+uWDDf3PwLDZoXG6o2KyqMQPsBUxBLTzcIyv8B
         L33UX3vFIQZWPZzggfQFu6K2Wf2fKf5mDMM9n9ShhS/yDZw7mzfN8BVNX1gEBhcQ1lTq
         5pv5lo/GZmE0FTzJCKfmsEHGxjdtww2o7u2hpGHdE153F/9lMfjBS5zf67bdUbxRvajp
         Vq9Ew2GhSjN6Z59JYITOUcpWMY9ZNqe3eWMjdL3eQUiF4gTjyBljS2crRX/BqtgTGJ7G
         oH5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h126si942328ywd.43.2019.02.05.10.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:01:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr51u-0005rB-U1
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:01:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bt-0000QH-W2
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bs-0004Te-Uy
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4bm-0004Os-QM; Tue, 05 Feb 2019 12:34:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F12773C2CD0;
	Tue,  5 Feb 2019 17:34:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B989D57982;
	Tue,  5 Feb 2019 17:34:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:32:59 +0100
Message-Id: <20190205173306.20483-12-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 05 Feb 2019 17:34:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 11/18] hw/arm/virt: Add memory hotplug
 framework
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G+Es7/Up+X6w

This patch adds the the memory hot-plug/hot-unplug infrastructure
in machvirt. It is still not enabled as no device memory is allocated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>

---
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
index be88870799..dc4624794f 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -160,3 +160,5 @@ CONFIG_PCI_DESIGNWARE=3Dy
 CONFIG_STRONGARM=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
+CONFIG_MEM_DEVICE=3Dy
+CONFIG_DIMM=3Dy
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f01886da22..783468ba77 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,8 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1763,6 +1765,49 @@ static const CPUArchIdList *virt_possible_cpu_arch=
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
@@ -1774,12 +1819,27 @@ static void virt_machine_device_plug_cb(HotplugHa=
ndler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+            virt_memory_plug(hotplug_dev, dev, errp);
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
@@ -1843,7 +1903,9 @@ static void virt_machine_class_init(ObjectClass *oc=
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

