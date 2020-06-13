Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp453630lfm;
        Sat, 13 Jun 2020 14:54:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHEu1djygUb2eZ1kleEd/WNSaozt8vaUbsJ0pCTZtw6+OKMXfiMvvyct2rAg8LcCGmxBwX
X-Received: by 2002:a25:3a41:: with SMTP id h62mr32205204yba.242.1592085246356;
        Sat, 13 Jun 2020 14:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592085246; cv=none;
        d=google.com; s=arc-20160816;
        b=EQhlTPRCSJnsHUzbAUH95hM/BYgysBYBBpd5ATjUW9WE9nDon4oppdJJWnmUCee6qP
         Iv03UjKrF6ZHeoX057OmXYd3WP358MadnwM55xpl2tDIAcNjzx26mC4b//g3lr6eerHu
         8KpW4qf3jxUFa+6+KiLW5/aB+hfwYpJBEr39ZQFg9EggVQkJ9yQrCZi0Bns1mGWWFHHK
         XZa9W9ocs47ffdIIikwu0gGB+INeFgOQvorlihMwCUEm1yxwGBqVScvJPUp49xEXQHi2
         gt5EIorRxSd3lxj7TD1Gyo70I6Ww/hTPjG+sQIwRvIvPRG49WZc/jDVCUnZfYi/UWxeu
         wisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=/tWxw/WWHfWZ2Cq6hbEV2KECSxerlNR8BsdfjfmZGHM=;
        b=wdFWZJfcdMs50hO04jeVabWXnbv5Tpls6GhQwm45LjZ3BrsJOONM9IIRidVqOrPTle
         cQyelFGz4Yl1FIC/htBp3eRVPwoK8ozPtzt6qTa2Gtq6VIUlwf1zI9ngzTcDC1ifaLyB
         n7Ay/w/sH3vddFta10q2Gv6KzrO2Wm/7QxKVALDqnYFlXdX25+CkQe4+yOLJzMZ0HL76
         ZqHDsJ1NWH4MNx+hE3rspVw99Tz5wkcNl3qyWnCC87bD5lA/XOhl6+6ovuP3wm6LuS4b
         zl5EGYr8HB/Ox8XG3OXFgiJ88/B30jWYU/jLFFjEJUYWPh8nSiTNM/rFmyyhLsLRvKDa
         P25Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si8676226ybh.240.2020.06.13.14.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkE6H-00046m-Pe
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyN-0007IP-R0; Sat, 13 Jun 2020 17:45:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3778 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyL-0003Ro-UB; Sat, 13 Jun 2020 17:45:55 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5DD21511CC70ECC0FB03;
 Sun, 14 Jun 2020 05:45:51 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:45:40 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 15/22] arm/cpuhp: Update ACPI GED framework to support
 vcpu hotplug
Date: Sat, 13 Jun 2020 22:36:22 +0100
Message-ID: <20200613213629.21984-16-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3r41Y0+1nBjH

ACPI GED shall be used to convey to the guest kernel about any cpu hot-(un)plug
events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
to support CPU hotplug state and events.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/generic_event_device.c | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 79177deda2..df81e9292a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -13,7 +13,9 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/cpu.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/arm/virt.h"
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
@@ -192,12 +194,47 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
         } else {
             acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
         }
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
     }
 }
 
+static void acpi_ged_device_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    AcpiGedState *s = ACPI_GED(hotplug_dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+            acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else {
+        error_setg(errp, "virt: device unplug request for the unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
+static void acpi_ged_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                      DeviceState *dev, Error **errp)
+{
+    AcpiGedState *s = ACPI_GED(hotplug_dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+            acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
+     } else {
+         error_setg(errp, "virt: device plug request for unsupported device"
+                    " type: %s", object_get_typename(OBJECT(dev)));
+     }
+}
+
+static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
+{
+    AcpiGedState *s = ACPI_GED(adev);
+
+    acpi_cpu_ospm_status(&s->cpuhp_state, list);
+}
+
 static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
     AcpiGedState *s = ACPI_GED(adev);
@@ -210,6 +247,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
         sel = ACPI_GED_PWR_DOWN_EVT;
     } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
         sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
+    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
+        sel = ACPI_GED_CPU_HOTPLUG_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
@@ -330,8 +369,11 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
     dc->vmsd = &vmstate_acpi_ged;
 
     hc->plug = acpi_ged_device_plug_cb;
+    hc->unplug_request = acpi_ged_device_unplug_request_cb;
+    hc->unplug = acpi_ged_device_unplug_cb;
 
     adevc->send_event = acpi_ged_send_event;
+    adevc->ospm_status = acpi_ged_ospm_status;
 }
 
 static const TypeInfo acpi_ged_info = {
-- 
2.17.1


