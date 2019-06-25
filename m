Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4907356wrg;
        Tue, 25 Jun 2019 05:31:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCVO3/DgQEmQ4nDSV7uLGwv96d98CSGX0DMeMLpe5E87rOJWhG4tH7WgFv+H2+aWF71rGb
X-Received: by 2002:a50:d791:: with SMTP id w17mr75425962edi.223.1561465918968;
        Tue, 25 Jun 2019 05:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561465918; cv=none;
        d=google.com; s=arc-20160816;
        b=dMALBOsmotv2k0zaVM3t+vnqQU/XH6ZmtcvOxFmjC+NHlFLj59Mk8OU1FtgFkSsZB3
         Yx+ddHE1e37K2wK5WQYEnAADgDK77BsYHlHJxrMSUbop7iAXDh9kM01lY4T5qv0Gc2dN
         hhbga/oXoU7TZ6GvCf/KA3rYuspG9q7U7yavbuzCGRx86U1iKyGKH4OI6YeDxdoPOj4Y
         Se8Ui6lSHGX4N0kx07HOx6gZrsouJeROngz+8D2R8RgaQhcyqSt4e8ssTLMFpbKZP6Lc
         YvK3r+bFIuBbn5PlQd0uF9aijrvFvSsG2Lcj19wONc6t4UZV5Gf2eZb3Vx91NpW2xygm
         4MBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=jRLuuv3sLKJ4MMZy9mT+7kth4Pq48ndqHe9l3GxCZLw=;
        b=zJ7fEhrJxc2h/rLu0dqDMDqLiKtFoIADRFFFxlPXZPwBOJoeQqvqoo36C47Ln74X3+
         HK0i/P4vHiHP/e4ztZEHDsRLxmn7QFSniCIEUK4+GatUWi4mmXuZpq3CqNpLA/31Q5gg
         xNivLv8DyNz35Pq+DhSCgH/X32b3iQkFRBmsodanFXyus5iuEFe2NuPcTXBpmAsbhvw1
         PxMHhv+QDHnu0l1bigerscPWo3U543vdr4Up5NTOieoiJAAA0UgT8cW+Q9PiTREmyAq9
         cE8yiPhBx8q2sRzjh/9ikd/f43PAWprZ4xAilbcZROBgDwJ1xLKyyPvkBSismbEsoyXE
         lAqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si312239edz.9.2019.06.25.05.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfkc9-0000w9-Qh
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 08:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36533)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkN9-0007LI-0K
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 08:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkN7-0004XR-EL
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 08:16:26 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:54734 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkN3-0004Ex-J5; Tue, 25 Jun 2019 08:16:23 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 99F7B2D2E6848C930D19;
 Tue, 25 Jun 2019 20:15:59 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 20:15:50 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 25 Jun 2019 13:14:20 +0100
Message-ID: <20190625121421.22280-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v6 7/8] hw/acpi: Add system power down support to
 GED
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GYoMETgeXkil

This adds support to use GED for system power down event.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/generic_event_device.c         | 16 ++++++++++++++++
 include/hw/acpi/generic_event_device.h |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 2a83d68e82..2bd786b7ab 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -19,6 +19,7 @@
 
 static const uint32_t ged_supported_events[] = {
     ACPI_GED_MEM_HOTPLUG_EVT,
+    ACPI_GED_PWR_DOWN_EVT,
 };
 
 /*
@@ -103,6 +104,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                 aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
                                              MEMORY_SLOT_SCAN_METHOD));
                 break;
+            case ACPI_GED_PWR_DOWN_EVT:
+                aml_append(if_ctx,
+                           aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
+                                      aml_int(0x80)));
+                break;
             default:
                 /*
                  * Please make sure all the events in ged_supported_events[]
@@ -232,6 +238,13 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
     acpi_ged_event(s, sel);
 }
 
+static void acpi_ged_pm_powerdown_req(Notifier *n, void *opaque)
+{
+    AcpiGedState *s = container_of(n, AcpiGedState, powerdown_notifier);
+
+    acpi_ged_event(s, ACPI_GED_PWR_DOWN_EVT);
+}
+
 static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
 {
     AcpiGedState *s = ACPI_GED(dev);
@@ -243,6 +256,9 @@ static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
     }
 
     acpi_ged_init(get_system_memory(), dev, &s->ged_state);
+
+    s->powerdown_notifier.notify = acpi_ged_pm_powerdown_req;
+    qemu_register_powerdown_notifier(&s->powerdown_notifier);
 }
 
 static Property acpi_ged_properties[] = {
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index f69d084c89..9e63b72cb9 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -61,6 +61,8 @@
 
 #include "hw/acpi/memory_hotplug.h"
 
+#define ACPI_POWER_BUTTON_DEVICE "PWRB"
+
 #define TYPE_ACPI_GED "acpi-ged"
 #define ACPI_GED(obj) \
     OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
@@ -79,6 +81,7 @@
  * through GED.
  */
 #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
+#define ACPI_GED_PWR_DOWN_EVT      0x2
 
 typedef struct GEDState {
     MemoryRegion io;
@@ -88,6 +91,7 @@ typedef struct GEDState {
 
 typedef struct AcpiGedState {
     DeviceClass parent_obj;
+    Notifier powerdown_notifier;
     MemHotplugState memhp_state;
     hwaddr memhp_base;
     hwaddr ged_base;
-- 
2.17.1


