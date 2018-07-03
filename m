Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp695382wrq;
        Tue, 3 Jul 2018 00:25:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcuZypwxKYyNq9iLjLU3FjUDON9P4HSWtHT85GQ1lqbedIeHf6bEAtsdApEZIWG6SZqiFqy
X-Received: by 2002:ac8:25ac:: with SMTP id e41-v6mr27039289qte.66.1530602733219;
        Tue, 03 Jul 2018 00:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602733; cv=none;
        d=google.com; s=arc-20160816;
        b=zX1wfY+uZjLHs2EGxVkTPpJOz++ZYpFDtboYzJOYlIz9YtwJZP0mF+20KNSSEiobsG
         d05myjG8oX8JwDLYUmIv6QmdUtyMc4Ite+o0BeLmRea0wQqwyAQb92R67wWHn3Ip/Xe5
         9xVSpbmrPf6YXxaWG9/URaskmQJrbE5KFda8txy8IMWLqO0FUeQAvnNkNK7zJKZHRggf
         d6xaO1UdkJdraHWS8CtW9Yjd4PUqHLgSq9fd3ww56sXzeDlzu589dv1vaaK7SBHKpLD4
         ahTRMjlzYkCdA8W/11/fEgxkr2q39E7jOoa8IFdkwD/mxVVPstUjKn1VLVvFGh/0McCI
         aN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MD5FWFTHqHcqNQMAgyK4vZSep1yEYXrpCdl/NeIiQAg=;
        b=oNIQjx+yGFRHUq2YrQ97qywQk7+TyYnSDoB3OEP833nvt2DRSDH2OQI8kQBeH4Wyu9
         uNe3DBZqAIzH2Zq0N5t8GNp7NBkF1jBYLS8JpDItOzBg9LNx/T339IijJ47qYnrYxaTo
         tVxcD2NbcfJjOhsfzCCH0XkZImHgWU3pPmB7cbIAhvqRU1+dqZPhB6MpZeh9QuQX6X6R
         fhuz8FnmJ2ZyEKQXRz1kSCmEQyilAsQ+xw9+2ZA8RIHWxTc8cWkP/mWKd/c7mhvsSZvM
         xG9RJ20Gvi6OnKv8Gm4scsOZ1FxnJBAYuRISyu8CCdLlBqMu1S6ERN4+Qnyvf8UFtLW/
         iqJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15-v6si477944qke.4.2018.07.03.00.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFgq-0003zz-MQ
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFdD-0003Ap-Sg
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFc9-0005MV-O9
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:21:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46828 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFc9-0005M2-8d; Tue, 03 Jul 2018 03:20:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6E433466E;
	Tue,  3 Jul 2018 07:20:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA72F1C5B8;
	Tue,  3 Jul 2018 07:20:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:50 +0200
Message-Id: <1530602398-16127-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 03 Jul 2018 07:20:40 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 07/15] hw/arm/virt: Add memory hotplug framework
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pQWB/49J/tnt

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

This patch adds the the memory hot-plug/hot-unplug infrastructure
in machvirt.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>

---

v1 -> v2:
- s/virt_dimm_plug|unplug/virt_memory_plug|unplug
- s/pc_dimm_memory_plug/pc_dimm_plug
- reworded title and commit message
- added pre_plug cb
- don't handle get_memory_region failure anymore
---
 default-configs/arm-softmmu.mak |  2 ++
 hw/arm/virt.c                   | 68 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 834d45c..28fe8f3 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -152,3 +152,5 @@ CONFIG_PCI_DESIGNWARE=y
 CONFIG_STRONGARM=y
 CONFIG_HIGHBANK=y
 CONFIG_MUSICPAL=y
+CONFIG_MEM_HOTPLUG=y
+
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6fefb78..7190962 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -60,6 +60,8 @@
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1785,6 +1787,53 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                                 Error **errp)
+{
+    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
+
+    if (is_nvdimm) {
+        error_setg(errp, "nvdimm is not yet supported");
+        return;
+    }
+}
+
+static void virt_memory_plug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    PCDIMMDevice *dimm = PC_DIMM(dev);
+    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
+    MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
+    Error *local_err = NULL;
+    uint64_t align;
+
+    if (memory_region_get_alignment(mr)) {
+        align = memory_region_get_alignment(mr);
+    } else {
+        /* by default we align on 64KB page size */
+        align = SZ_64K;
+    }
+
+    pc_dimm_plug(dev, MACHINE(hotplug_dev), align, &local_err);
+
+    error_propagate(errp, local_err);
+}
+
+static void virt_memory_unplug(HotplugHandler *hotplug_dev,
+                               DeviceState *dev, Error **errp)
+{
+    pc_dimm_unplug(dev, MACHINE(hotplug_dev));
+    object_unparent(OBJECT(dev));
+}
+
+static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                            DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_pre_plug(hotplug_dev, dev, errp);
+    }
+}
+
 static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                         DeviceState *dev, Error **errp)
 {
@@ -1796,12 +1845,27 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+            virt_memory_plug(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_unplug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "device unplug request for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
 }
 
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
 
@@ -1861,7 +1925,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
+    hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
+    hc->unplug = virt_machine_device_unplug_cb;
 }
 
 static const TypeInfo virt_machine_info = {
-- 
2.5.5

