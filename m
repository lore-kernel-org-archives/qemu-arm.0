Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2087015wrm;
        Sat, 5 Oct 2019 15:04:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIzAGwfFsUpb0eoKGkJPbGIaKCEeGErcRQjfT+54Z0VpzLoR7tbvt+ATJuK00j4edMdpm9
X-Received: by 2002:a37:68d4:: with SMTP id d203mr17143775qkc.333.1570313090452;
        Sat, 05 Oct 2019 15:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570313090; cv=none;
        d=google.com; s=arc-20160816;
        b=u7Hj0LWUzxah1U718HzoqMDsFkD5vpWvLfHHp71gC9NYU57C/WwsQy8Z5drKF/baTS
         q9bKshwvQ7Jj3TQJUT3ySUljYxc0rqAeCIt7CWQvmzb6AIemTD1QxffAHQB6G8HqBFcK
         jY5Y2pBxXp1ky3kvpUdnxis+ARxW8coKl25/ULfIVo7G0gSKlksr9KEO4guno2c5S01q
         T89+XeocRF3+RMxcXsuD8Ex9Mvm0MYsAvfIVJ8ZkuXoDQK8QCMRgRM7R3pybEByUZs7D
         vaagRPHPkxUnd6QnoUMAsw4Z7BCTtxsXLepzZuEURdiZwDwNGFHTNgXxqJBWclhOBEGA
         dw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=ndufQ67kwp/IMCvxSdYuiln6PDFMkiFAJlZp+SBJanQ=;
        b=qbdI2ZRfwwlQkBsHnYjjaykLvoLqNY+aIHcHnAtdfWcGpPwFwRRtJAs/PI5AV31Ezw
         eL53+E0RED7nqG1rvgDd9hnp4vz5MIKOxRwLqhgNd+I59HEMjGKY8Iw6wP1HRJM+7LyX
         b62RVeudjAFrX/ap3G989KoCqjsnj7rm+nYOJMwu5v7Q5LzA5k4Qm+N/FoDZVGQcyopw
         DMLcmZE9T/Kq4A9XiqCXa+EgbyB3jF44v+fSn1VMCp5VWqFCx8ZLnaSZsnFab1N3BBb6
         kM/bs68Db9uMtWVhdcwfAZ9o5TbmE2XQVIpbIxoIiXB/EaFMqQsDnzLkddBstEWoh7WI
         siKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si10407036qkb.282.2019.10.05.15.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 15:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGsAS-0000Ea-PJ
	for alex.bennee@linaro.org; Sat, 05 Oct 2019 18:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iGs50-0004mR-GC
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iGs4x-00047O-4F
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60294)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iGs4w-00046X-SA
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:07 -0400
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E09065117D
 for <qemu-arm@nongnu.org>; Sat,  5 Oct 2019 21:59:05 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id x186so10663899qke.13
 for <qemu-arm@nongnu.org>; Sat, 05 Oct 2019 14:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ndufQ67kwp/IMCvxSdYuiln6PDFMkiFAJlZp+SBJanQ=;
 b=tvVxCtnfCLYWnJp0RzMxaTeZ5bg5glg8t6yFGSDo85dpPrxRTLGi0qPxDRKQV8Kbms
 DzxFTr2+vovzDPD5X5k3OjYWZtfs7nMkzR9CuibDaffUhhsPqMYtPOBV8z6TVxlt+A4W
 OATAl304DuyhEcnU4AN3p5sm72352yraRXoj/8JG8gYCtPWAREnMWrTVPOdm71AC9JJ3
 BKgyPLWT6niJ6ZGCactj4oIcKiRs+Fn0uKECr2mkez2OtFUTpocIgxs5jKUGAkf+zVl8
 +b1okEapQ1WlWT2Ur9vfOMtdeMF940qa6vVNuuZDjjkmnoH21UVSxe8TNPjwdZqE8YxV
 5/ow==
X-Gm-Message-State: APjAAAV1FJWyO052EY6MF4DR3A2p8+e/2gELo0df1NvEc9g1EQasN6RZ
 +ONgr1zGb6xLTB3Mhms/zlZVGwlkOvRRyRdSu0MDl4YIVbsIRA6Dv9b2sUgj5Mg3cNgSWSF61eG
 BJqOQ+6y4LlOU
X-Received: by 2002:a37:6584:: with SMTP id z126mr3222206qkb.460.1570312745172; 
 Sat, 05 Oct 2019 14:59:05 -0700 (PDT)
X-Received: by 2002:a37:6584:: with SMTP id z126mr3222191qkb.460.1570312744928; 
 Sat, 05 Oct 2019 14:59:04 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 b130sm5569835qkc.100.2019.10.05.14.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 14:59:04 -0700 (PDT)
Date: Sat, 5 Oct 2019 17:58:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] hw/arm/virt: Add memory hotplug framework
Message-ID: <20190918130633.4872-5-shameerali.kolothum.thodi@huawei.com>
References: <20191005215508.28754-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005215508.28754-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Kwangwoo Lee <kwangwoo.lee@sk.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xc/ygyM7sXhg
Message-ID: <20191005215859.LED3BTMGF4qpVcPjgbZb6JrS-Thb_dtxeAJZRNFCbOQ@z>

From: Eric Auger <eric.auger@redhat.com>

This patch adds the memory hot-plug/hot-unplug infrastructure
in machvirt. The device memory is not yet exposed to the Guest
either through DT or ACPI and hence both cold/hot plug of memory
is explicitly disabled for now.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20190918130633.4872-5-shameerali.kolothum.thodi@huawei.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/Kconfig |  2 ++
 hw/arm/virt.c  | 53 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 76a2a6bcbf..39d285ad3d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -20,6 +20,8 @@ config ARM_VIRT
     select SMBIOS
     select VIRTIO_MMIO
     select ACPI_PCI
+    select MEM_DEVICE
+    select DIMM
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d74538b021..1c967e3fee 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -68,6 +68,8 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1876,6 +1878,42 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                                 Error **errp)
+{
+
+    /*
+     * The device memory is not yet exposed to the Guest either through
+     * DT or ACPI and hence both cold/hot plug of memory is explicitly
+     * disabled for now.
+     */
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        error_setg(errp, "memory cold/hot plug is not yet supported");
+        return;
+    }
+
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+}
+
+static void virt_memory_plug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    Error *local_err = NULL;
+
+    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
+
+    error_propagate(errp, local_err);
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
@@ -1887,12 +1925,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_plug(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    error_setg(errp, "device unplug request for unsupported device"
+               " type: %s", object_get_typename(OBJECT(dev)));
 }
 
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
 
@@ -1956,7 +2005,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
+    hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
+    hc->unplug_request = virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported = true;
 }
 
-- 
MST

