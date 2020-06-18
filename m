Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1592315lfm;
        Thu, 18 Jun 2020 05:28:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2YzIyNv3k06c23dhClz0zzQQ4nvgJ7jW4NWAOd/sM+lzRirLfqo6QTdV7azc1sTogcIEA
X-Received: by 2002:a25:cc0b:: with SMTP id l11mr6177333ybf.133.1592483281593;
        Thu, 18 Jun 2020 05:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592483281; cv=none;
        d=google.com; s=arc-20160816;
        b=RVVXejfnfD5fz573Ef8A5P5NYRJF/6GEzZODONyxwOPbcFp9T6NC9VyjZ5KTHlJFU9
         8no6EwywJglREs9/tqCSs2Nlkb4NkpDV3zRs9rwIIukYOKc40Nb1/vfk9g4SssoaKIAt
         wWMFWx1h/t6sSFFLcwWMXxAYbNweigQfc4dfLApMn00yTP+2AYGgNFUJ3dJZ0QE/WGL4
         /wAZIO5uaMDAP1S1yHprcSSfp946hILbvTOXfHOAw0lAgQZIxnVZXY+X31Pglq0KMNrB
         9gArzLRAa6/gh2Cle0B1TAGGZa2Fv2YUV9AUEMT/wHs5jFUAjIUvcEVqh0XHjqlib/Dx
         UUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=LlE/Sv8GoL9VTtUyczZGlwtE2XFRcUqc0rn9SK6NZNY=;
        b=q5KfXg2k3uXM8xPj+JT2VEq0SgthK/JP+VhYXt7iyV4/jXskIR+49TRc7XuLJ2M1YY
         jTuREBz29fhLvrRKbUe5J7iTDHmiiTyTdUN5TgkRO3IrtnjEB7RzZdFoSYkWZENFbzWa
         h+pSmoMOvovu7ioYf1YeeLfD2TFhpmFkwNzMo72c2zw75pIEXKb/DU0gtvoHRonXDTYq
         tzfDDjq7D5OQDwF/x6IhWCOgy88PrCBlkzMrE9aa9yO114uzj3Y8DmzQABXz9M/uKsKk
         L3x+9hhdAtUkF8ayhP5AU8WQqJvp2PpiqiYyJ/V2AfE2tztxVzYBnF7wNxxFYMuvm9zn
         3BTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si2374358ybn.58.2020.06.18.05.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 05:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlteC-0001Rp-Vr
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 08:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jlte3-0001Pw-TD; Thu, 18 Jun 2020 08:27:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42832 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jlte1-0003Xd-KZ; Thu, 18 Jun 2020 08:27:51 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 99F6316FA107B353DA5D;
 Thu, 18 Jun 2020 20:27:41 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.83.241) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 18 Jun 2020 20:27:30 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v3] arm/virt: Add memory hot remove support
Date: Thu, 18 Jun 2020 13:21:29 +0100
Message-ID: <20200618122129.7704-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.83.241]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 08:27:42
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
X-TUID: 2bzJ65+sF9qP

This adds support for memory(pc-dimm) hot remove on arm/virt that
uses acpi ged device.

NVDIMM hot removal is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
V2 --> v3
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
index caceb1e4a0..a981dc9f1c 100644
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
+        error_setg(errp,
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


