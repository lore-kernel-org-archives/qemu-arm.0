Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3150662wrt;
        Mon, 28 Jan 2019 03:11:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN54Yo4dpVmQgNlrBOsdAqZaNW9aFWLdzVkRWV0Uwj1U4jt5HMZUBOhBUr845lVGywrBjQTE
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr17531800wmj.105.1548673898478;
        Mon, 28 Jan 2019 03:11:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548673898; cv=none;
        d=google.com; s=arc-20160816;
        b=U1JY/AgdpzmN/dJk4tNx9IpWVD1OguSi+pOocnSQHm2Z4StmKC0SUaBh+eBWeGxskU
         m3w2XXw9k3ub0+9R+jk8u6bXu/M7iLDM7JxtE56uNHC8BWUa6PJUdgHTBg4+aK8Rd1rc
         CKZQfvTDLqzVW/kE8O4zw3evrI19mhO+mUeagb0iwTsPR2vLX3TpkVLNoS8ccwF1H89Q
         3BbA59geOLInIwA0HOAx1TuwGo4zkY0se5ruJjKRytMP/yTAUR4paIYHBLVKJgm5Ufkn
         XAEYO+yYJ3Z1KBR6eFd/07mqjSaEzCBt8GTqrt7FWs8mQmtELimsMPbRlDFELPkPLjCi
         ikvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=Y9mVPmP44DJuzJzCOOZiZ8KRZDbll8aUQqzI1xUyp3E=;
        b=GkLvl2GijXXckvwT5Lppsg0pxD/WLrZ7edaSqyo7iJDr4tQ5OrGSj9SGb0GTkxvpMk
         5zg9s+SSiXbrkLcfEuJ90YWzGCDBiS1eLsyXOmGNDLLYEERQ9aFei+crC0tEpN7uJW+2
         AxZaEeR1SQYGPavP3tdEHbzg4SrN5cYvBuf6kCOT0tw+1DeQgEbxbw5Fszykbw5sqORx
         1sgFo43LuqHnM4RL4fAwY2XBItR+ENsaXOLiK7opc5NpFy6eoeZ7MOnp1Gt+zzO4lIHV
         i4ITKCTfI9+V7iTU2N4QhbGAfJQ6GAhtP+7KGi6yAupbBdtElBG+o/WRov1LANz7AVfE
         z0yA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si44144199wmc.16.2019.01.28.03.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:58001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4pF-0007Qa-DJ
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4ob-00074l-TB
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:10:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4oa-0005yf-TP
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:10:57 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44278 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4oa-0005yH-IT; Mon, 28 Jan 2019 06:10:56 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 84BBA9CE554F3BADC9E2;
	Mon, 28 Jan 2019 19:10:53 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 28 Jan 2019 19:10:43 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <eric.auger@redhat.com>, <shannon.zhaosl@gmail.com>,
	<peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 28 Jan 2019 11:10:31 +0000
Message-ID: <20190128111031.6176-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [RFC PATCH 4/4] hw/arm/virt: Add nvdimm hotplug support
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
Cc: linuxarm@huawei.com, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RM/xtmIxTCLI

nvdimm hotplug is enabled using GPIO(Pin 4) based ACPI
event. Hot removal functionality is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 17 +++++++++++++++++
 hw/arm/virt.c            | 29 ++++++++++++++++++-----------
 include/hw/arm/virt.h    |  1 +
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index eedd323..132414c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -360,6 +360,14 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
                                      1, "GPO0", NULL, 0));
     }
 
+    if (vms->acpi_nvdimm_state.is_enabled) {
+        /* GPIO Interrupt connection descriptor for NVDIMM hotplug */
+        pin_list[0] = GPIO_NVDIMM;
+        aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
+                                     AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list,
+                                     1, "GPO0", NULL, 0));
+    }
+
     aml_append(dev, aml_name_decl("_AEI", aei));
 
     /* _E03 is handle for power button */
@@ -367,6 +375,15 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
                                   aml_int(0x80)));
     aml_append(dev, method);
+
+    if (vms->acpi_nvdimm_state.is_enabled) {
+        /* _E04 is for nvdimm hotplug*/
+        method = aml_method("_E04", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
+                                      aml_int(0x80)));
+        aml_append(dev, method);
+    }
+
     aml_append(scope, dev);
 }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cf64554..71e7886 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -809,6 +809,11 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
     if (vms->acpi_memhp_state.is_enabled) {
         virt_create_gpio_dev(pl061_dev, GPIO_PCDIMM);
     }
+
+    if (vms->acpi_nvdimm_state.is_enabled) {
+        virt_create_gpio_dev(pl061_dev, GPIO_NVDIMM);
+    }
+
     qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
     qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
     qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
@@ -1885,10 +1890,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
-    if (dev->hotplugged && is_nvdimm) {
-        error_setg(errp, "nvdimm hotplug is not supported");
-    }
-
     if (is_nvdimm && !vms->acpi_nvdimm_state.is_enabled) {
         error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
         return;
@@ -1898,19 +1899,25 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 }
 
 static void virt_memhp_send_event(HotplugHandler *hotplug_dev, DeviceState *dev,
-                                  Error **errp)
+                                  bool is_nvdimm, Error **errp)
 {
     DeviceState *gpio_dev;
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
-    gpio_dev = virt_get_gpio_dev(GPIO_PCDIMM);
+    gpio_dev = (is_nvdimm) ? virt_get_gpio_dev(GPIO_NVDIMM) :
+                            virt_get_gpio_dev(GPIO_PCDIMM);
     if (!gpio_dev) {
         error_setg(errp, "No dev interface to send hotplug event");
         return;
     }
-    acpi_memory_plug_cb(hotplug_dev, &vms->acpi_memhp_state,
-                        dev, errp);
-    qemu_set_irq(qdev_get_gpio_in(gpio_dev, 0), 1);
+
+    if (is_nvdimm) {
+        qemu_set_irq(qdev_get_gpio_in(gpio_dev, 0), 1);
+    } else {
+        acpi_memory_plug_cb(hotplug_dev, &vms->acpi_memhp_state,
+                            dev, errp);
+        qemu_set_irq(qdev_get_gpio_in(gpio_dev, 0), 1);
+    }
 }
 
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
@@ -1929,8 +1936,8 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
         nvdimm_plug(&vms->acpi_nvdimm_state);
     }
 
-    if (dev->hotplugged && !is_nvdimm) {
-        virt_memhp_send_event(hotplug_dev, dev, errp);
+    if (dev->hotplugged) {
+        virt_memhp_send_event(hotplug_dev, dev, is_nvdimm, errp);
     }
 
 out:
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ef39ce6..70ee2f2 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -144,6 +144,7 @@ typedef struct {
 enum {
     GPIO_PCDIMM = 2,
     GPIO_PWRB,
+    GPIO_NVDIMM,
 };
 
 typedef struct GPIODevice {
-- 
2.7.4


