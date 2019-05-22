Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp657045wrg;
        Wed, 22 May 2019 09:28:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxAdrQNxIx9+1CVgpsMMxCuWADuhHVSBRbB9dKJtcB55sArBzYBMhLgwhEFGwNnqcslJZMb
X-Received: by 2002:aa7:d9cb:: with SMTP id v11mr90607840eds.159.1558542505707;
        Wed, 22 May 2019 09:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558542505; cv=none;
        d=google.com; s=arc-20160816;
        b=b0FthhaIEPqeawTQXDn1TqlA4Mt4s4pPtwG26EOHkv2Wk5drQKVJBUeDMYtWWHxbRP
         ZgVF6Kt2Habs2/FhXd/1RDvF1enzlDTfZr3VLnH2/9RaquBMSfPAsNImnkSCJFTw9jmQ
         dRpGlyPiHGYIis3MFc18+F9Nb+FR0TPw9jx5AwpYQK94f2lYaI3iQXvg8P4Wsr1nZ41k
         N6JT4wtSsKYaABShIAmO5kmMPaBLKm7w1i+Dl5TBFdQep2XhdcOTZrkasZ7nA1eQP98h
         VouNcHN7ONPi90HCsYGum/tDcGJ9Uix39Krlr1nSKTIwMvNC17vgEUSABfM5UN/VJy1M
         BXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=Pwb9q4QtlNBkVBSO7MkBF7O1RNSrzNskjk4MrHbVg6Y=;
        b=IbxQy3VB+8/yohH5CWwr/+vcdG9k3zpJArmc5XwwZpc6fRAEZmy4RPx60FqKBL6nBf
         7Lr9NkheAMmMGfbJ5L6A9nap8h6db3zOjaD/jeYpe1YiOBZLD6WJ6clrFjGUE1Z1xKuG
         rvySkHCBCMJFLCI0dLhNNgEuBzuAqG9DnrvGLTbNIfY1VKV6MbmKnfBB+o/GSgvLSPo+
         kF5mTZ7vXvYRyTLBYt3+bO/gBF0pCJek33mOi6RQug4kBwh1ePYD42UT4bsz+OIMMsX0
         nqkGMfXeNboObNg1w6BJd2SBFMrK5JQOr1M9Y2PpEHIDzjWpSh3i2WhUoUVQ41486NxQ
         vM9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o26si6395803eja.316.2019.05.22.09.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 09:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTU6K-000148-Ls
	for alex.bennee@linaro.org; Wed, 22 May 2019 12:28:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU3D-0006hD-76
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU3B-0002Dp-6m
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2223 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU3A-000271-Ia; Wed, 22 May 2019 12:25:09 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 0689F80F60C90003982B;
	Thu, 23 May 2019 00:25:03 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 23 May 2019 00:24:21 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Wed, 22 May 2019 17:22:51 +0100
Message-ID: <20190522162252.28568-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v5 7/8] hw/acpi: Add system power down support to
 GED
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7i7UImalb+Ni

This adds support to use GED for system power down event.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/generic_event_device.c         | 16 ++++++++++++++++
 include/hw/acpi/generic_event_device.h |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 914fe64716..27c1bb40d4 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -20,6 +20,7 @@
 
 static const uint32_t ged_supported_events[] = {
     ACPI_GED_MEM_HOTPLUG_EVT,
+    ACPI_GED_PWR_DOWN_EVT,
 };
 
 /*
@@ -104,6 +105,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
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
@@ -228,6 +234,13 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
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
@@ -239,6 +252,9 @@ static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
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


