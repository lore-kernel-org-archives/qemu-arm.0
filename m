Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp523172wrt;
        Wed, 23 Jan 2019 02:22:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5TG3RI1qOwyONrJybMKu9hKVwiKNDtQfQSLHBSEtNuknwkrSe8aST1dE23LefD7kzBK2aB
X-Received: by 2002:a1c:b14:: with SMTP id 20mr2170094wml.103.1548238969033;
        Wed, 23 Jan 2019 02:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238969; cv=none;
        d=google.com; s=arc-20160816;
        b=f1yMo4lSw94i02qdOvZWOUR+g5zZjIMXRgkdtU/QJiceHgRuMtbXQDUfXCsk4mla+C
         l7KTDiu/1D3Z4Y9KfZ+7xCBMC0BbUtDE5l14szDas8Z4u/8PtuxDvdfKnyZhx9UWtWmZ
         u/89UvkVxDlQL8fks9PD97pYM4qgKNZKojJ31OUBzdFWQ4i9ToBmKKpcK1G1P36r6ii9
         Xu2TeSrJKgDlCKT8b3G21C/3FS08hMdfbhy4GctTv/305C+bZQmcSgzEcfeLNSFHtNyg
         EPw2wcREf168uZ3SnwSz1BXi3XENycMsIbinGXLWXd8cQ/Qwx6XRafXuDgG3OIAw63Sz
         cXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RTCPplszxMGine6MFD+yOgg/ugghUPQnOrvwXmnTzlM=;
        b=hmQsVvh3vW1aOAB6xYUNWnvyHSvy4+59gKCMY1IEEjf7nWNsumvoL8GoIOXe6aNnS6
         qSK9jxftbTR3eGLJUOGqMqoS2ajQ91d9ULk4QgMQTZUeSQ8AarYo1A+fZ46JikiBgP4q
         x1FnoHIquRZLfRjDGn7GuAsc/ILRlcFNtvQwXmnbBNX4F0wR5JNVPP8HrFt+qvGFcX7v
         3w/WJU+iEbDd5hdhiAwzgs0T+gDkjCnYVHxCH8aEDVa8cXGK4cCkEorzqUkeHd7krIbI
         CkAHtDZsnMYkUZyox1Z8i0JZ6BsEKTshThHrgaA3wklSy8aOZvJKg1hQJtrussLWSRmM
         AtZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si68834997wrx.230.2019.01.23.02.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:22:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFgF-0006zm-VU
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZk-0001ix-W0
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZh-0007SS-SB
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZf-0007Px-OT; Wed, 23 Jan 2019 05:15:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3FA419E53;
	Wed, 23 Jan 2019 10:15:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 568EC600C6;
	Wed, 23 Jan 2019 10:15:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:51 +0100
Message-Id: <20190123101458.12478-12-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 23 Jan 2019 10:15:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 11/18] hw/arm/virt: Add memory hotplug
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LckJM0QR6jm0

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
index 2420491aac..3c5928aae0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -159,3 +159,5 @@ CONFIG_PCI_DESIGNWARE=3Dy
 CONFIG_STRONGARM=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
+CONFIG_MEM_DEVICE=3Dy
+CONFIG_DIMM=3Dy
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 61c3bb1cef..aad7e0f095 100644
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
@@ -1736,6 +1738,49 @@ static const CPUArchIdList *virt_possible_cpu_arch=
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
@@ -1747,12 +1792,27 @@ static void virt_machine_device_plug_cb(HotplugHa=
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
@@ -1812,7 +1872,9 @@ static void virt_machine_class_init(ObjectClass *oc=
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

