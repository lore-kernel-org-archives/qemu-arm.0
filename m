Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3150677lfm;
        Mon, 22 Jun 2020 05:45:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynq2G8QbSd6mCe5CZ5+ZpQhpYGXBWyWMAETh4ui3Y+qRyslU4r3nDhuYIpRmBf1j+UfS/U
X-Received: by 2002:a25:cac6:: with SMTP id a189mr27796692ybg.238.1592829902042;
        Mon, 22 Jun 2020 05:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592829902; cv=none;
        d=google.com; s=arc-20160816;
        b=Th1mkLvANIRbYxqSObr4dJoQxdM/771iBFpUX5Rloi3UZy/SvCmJSJvkLsD2p05SV7
         E1ZLQXKelAwFTgLkDVcYG20XvVMCV/6Wlz8l8F1Sq223nXwig+johWlFZf/OJxrSEEOE
         QWk+57BZTqF7wNBh15eVw4sZeEA1t5QpTx7O+xKtcxGoz0F8Q5i3FodK13Paou9Pvveb
         fnD38TDfyNuFpZQVVk15ms8zC1bhNmBsy4dwlD9RmkFYyIHzi12jF2nFzMsuxAskc+v5
         /ZwB17mqJcWzYfr1i3tER0PYa/WDuhRbg9i2GEyxRbjoVwiEbMXh5oyR5MDjla0Dp5yC
         vIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=JS6km3qe/FwnNS1twexNk5Qukkpkjr5nR7J5exc7Axg=;
        b=sa8CZvY9fXBPz9HM9P8yJv+dO2XgEyclvm0CwbgHCiT23i2c5XWqEcAg5+0O6IImhU
         0lmpMCyeyZh/NDZnnXxFdBdcItGLgSnkjJPciBAo68ydMnD/TbHxds5bj0nTSKn5PfJd
         PiEMKBU+fYhcJ/c9DUZgrH7SUAEokrwzVuOlDq1S8adKQMUG5rXU2NPasXPaK/WD6bw8
         vusRFd0qGL466DFhv7vq4rkdR4jFEdtNcJTu1oYyFM4C7CVzr1SH5rXrY9wZ2e7RFkvL
         yvmSa1UxnuIx7IIt/cSJHZ8MCpBkwcZNy5L54fXHIfv6ogKtWu+jI6s4+4hcHyD+DvC0
         bMWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si12839495ybl.255.2020.06.22.05.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 05:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnLor-0004BG-CI
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 08:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jnLoi-0004Av-9C; Mon, 22 Jun 2020 08:44:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4218 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jnLof-0003ne-QQ; Mon, 22 Jun 2020 08:44:51 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D62654D9D7E4460BF191;
 Mon, 22 Jun 2020 20:44:36 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.82.16) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 22 Jun 2020 20:44:25 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v4] arm/virt: Add memory hot remove support
Date: Mon, 22 Jun 2020 13:41:57 +0100
Message-ID: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.82.16]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 08:44:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) AC_FROM_MANY_DOTS=1, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-TUID: S5aHZTQsTHHE

This adds support for memory(pc-dimm) hot remove on arm/virt that
uses acpi ged device.

NVDIMM hot removal is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v2 --> v3
  -Addressed Eric's comments on v3. 
v2 --> v3
  -Addressed Eric's review comment and added check for NVDIMM.
RFC v1 --> v2
  -Rebased on top of latest Qemu master.
  -Dropped "RFC" and tested with kernel 5.7-rc6
---
 hw/acpi/generic_event_device.c | 29 ++++++++++++++++
 hw/arm/virt.c                  | 62 ++++++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 1cb34111e5..b8abdefa1c 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -193,6 +193,33 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                       DeviceState *dev, Error **errp)
+{
+    AcpiGedState *s = ACPI_GED(hotplug_dev);
+
+    if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
+                       !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
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
@@ -318,6 +345,8 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
     dc->vmsd = &vmstate_acpi_ged;
 
     hc->plug = acpi_ged_device_plug_cb;
+    hc->unplug_request = acpi_ged_unplug_request_cb;
+    hc->unplug = acpi_ged_unplug_cb;
 
     adevc->send_event = acpi_ged_send_event;
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index caceb1e4a0..80ef2d7b7a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2177,11 +2177,68 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    Error *local_err = NULL;
+
+    if (!vms->acpi_dev) {
+        error_setg(&local_err,
+                   "memory hotplug is not enabled: missing acpi-ged device");
+        goto out;
+    }
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
+        error_setg(&local_err,
+                   "nvdimm device hot unplug is not supported yet.");
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
+    qdev_unrealize(dev);
+
+out:
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
@@ -2262,6 +2319,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
+    hc->unplug = virt_machine_device_unplug_cb;
     mc->numa_mem_supported = true;
     mc->nvdimm_supported = true;
     mc->auto_enable_numa_with_memhp = true;
-- 
2.17.1


