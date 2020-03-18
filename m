Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp759228lfe;
        Wed, 18 Mar 2020 05:38:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtJ1DzZnGFe6XLEdcNEhDfE1yBZP2OVRD5VreLzcZw4cET51yWNOMT53O9rINsRNB1agBZN
X-Received: by 2002:ac8:4e44:: with SMTP id e4mr4014452qtw.313.1584535134094;
        Wed, 18 Mar 2020 05:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584535134; cv=none;
        d=google.com; s=arc-20160816;
        b=iA4gqx2RO26KaJ/ytUWRtQH6rLbL+2WCY05Mn1DnT1QfUMvxOymvMtuBxkhKg4CNjE
         UaexhuWkoFhcgCoCfCcg0bTSY1yhIK+r4ZEvJ2M0Kl9lNyXAhAqT7ljLIh9I2fiHQAAL
         n5wUxjK7wHRs4ZHh90Oj9B39/ohD9REPzsrG/xYs+y/Unnv/E0Rw3UZh0bFdpbEXL/+w
         Q5SJKJ4zYtW49prxadT2RYd/0bLNc6+c5nPl6IwTo3CNHCb9AQZCsSONlv4IkMut1h+q
         p3vGn1+KeZTjNwjcoT6zQbeBPd6Gljjp75aQLiTaYbAd/a04j2bGilsDW4Rnip1IYcCs
         3sXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=uRbKTckRXyPuqcxNPbMT4HtrH4wXcA8iFHsNfr12DGU=;
        b=wSEI7aTfw20uTcOWnVrliegs6fThO+gHk1Z2Ea8Qwz4YGG788/YZOWqjKf8OPtzZv+
         c7LCSgkGWenympvsnVJSNX0JqQDFI/XbUtYBOSZ2fjCmxaP5yRJgeH+ps1pO1xrzOPw/
         AB9w+X/CiJXF9z8V/tA44MKNh5vaLYYQMaYD9efYeWjRP76J7yTd1AKdVtlnpq7dc6IS
         3vvajR040hUei1gSmBwZEdo9nMYcfDnNSMQqCNrpsLKSWUswDWiAvSjEx/W69Kig4iW7
         UZKSkKLwEC0+7kzGlp5PUkx+uzY1WOP2QeIpoxJKqD28roiqPWckIBhKwqg89rOMYiuK
         QRzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23si3901996qth.36.2020.03.18.05.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 05:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEXyH-0002Vk-He
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 08:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jEXyA-0002Vd-83
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 08:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jEXy8-0003iN-GP
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 08:38:45 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60426 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jEXy8-0002Z8-44; Wed, 18 Mar 2020 08:38:44 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4743BECD779F03F8355C;
 Wed, 18 Mar 2020 20:38:34 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.26.139) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Wed, 18 Mar 2020 20:38:27 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC v1] arm/virt: Add memory hot remove support
Date: Wed, 18 Mar 2020 12:37:22 +0000
Message-ID: <20200318123722.19736-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.26.139]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, mst@redhat.com, linuxarm@huawei.com,
 xuwei5@hisilicon.com, eric.auger@redhat.com, prime.zeng@hisilicon.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JvpqFqBAG7G1

This adds support for memory hot remove on arm/virt that
uses acpi ged device.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 -RFC because linux kernel support for mem hot remove is just queued
  for 5.7[1].
 -Tested with guest kernel 5.6-rc5 + [1]

1. https://patchwork.kernel.org/cover/11419301/
---
 hw/acpi/generic_event_device.c | 28 +++++++++++++++++
 hw/arm/virt.c                  | 56 ++++++++++++++++++++++++++++++++--
 2 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 021ed2bf23..3e28c110fa 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -182,6 +182,32 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                       DeviceState *dev, Error **errp)
+{
+    AcpiGedState *s = ACPI_GED(hotplug_dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
+    } else {
+        error_setg(errp, "acpi: device unplug request for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
+static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
+                               DeviceState *dev, Error **errp)
+{
+    AcpiGedState *s = ACPI_GED(hotplug_dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
+    } else {
+        error_setg(errp, "acpi: device unplug for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
 static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
     AcpiGedState *s = ACPI_GED(adev);
@@ -286,6 +312,8 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
     dc->vmsd = &vmstate_acpi_ged;
 
     hc->plug = acpi_ged_device_plug_cb;
+    hc->unplug_request = acpi_ged_unplug_request_cb;
+    hc->unplug = acpi_ged_unplug_cb;
 
     adevc->send_event = acpi_ged_send_event;
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 94f93dda54..91974e4e80 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2096,11 +2096,62 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    Error *local_err = NULL;
+
+    if (!vms->acpi_dev) {
+        error_setg(errp,
+                   "memory hotplug is not enabled: missing acpi-ged device");
+        goto out;
+    }
+
+    hotplug_handler_unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev,
+                                   &local_err);
+out:
+    error_propagate(errp, local_err);
+}
+
+static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    Error *local_err = NULL;
+
+    hotplug_handler_unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    pc_dimm_unplug(PC_DIMM(dev), MACHINE(vms));
+    object_property_set_bool(OBJECT(dev), false, "realized", NULL);
+
+ out:
+    error_propagate(errp, local_err);
+}
+
 static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
-    error_setg(errp, "device unplug request for unsupported device"
-               " type: %s", object_get_typename(OBJECT(dev)));
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_dimm_unplug_request(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "device unplug request for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
+static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_dimm_unplug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "virt: device unplug for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
 }
 
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
@@ -2181,6 +2232,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
+    hc->unplug = virt_machine_device_unplug_cb;
     mc->numa_mem_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->default_ram_id = "mach-virt.ram";
-- 
2.17.1


