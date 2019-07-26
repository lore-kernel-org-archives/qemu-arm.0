Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11749716wrv;
        Fri, 26 Jul 2019 03:47:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRjdsR5K4v3TLh7y7bsbIMx8jWPqE4FSb3BNC0jIcfdKRRnK/o0rCIAATHazFSzIZ09H5D
X-Received: by 2002:aed:3944:: with SMTP id l62mr66314508qte.34.1564138042019;
        Fri, 26 Jul 2019 03:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564138042; cv=none;
        d=google.com; s=arc-20160816;
        b=n4DONiIVfZrquTmG72lvNOy7knHDtb/DlaCsekm4lthdMwH+8x3L+EcDxYwIlBSnz0
         UnobkCnUIx14ZX4WZeLvuIy/RgqsNKQdHizdqVpwDsuieXEJvdOdnamp3ErnEobymxne
         TSwEvtSMk5QrEYb9M5kadrCvAv8ldowZjywEfAFhHNJz3NnuBioUpIWAMGP/PsHgQ7qw
         rlFvdhRbSx+/JSG+ii+B4KvbAfTTxotvh3qnlAb7ntNgcWH6hiMUt0iUBRStAX8ExlI9
         ZuDkCSB3kBwQM45E4vKmFzCZBKxfbdKZ53GEGYhJOHRfJNI4Hfhb41BWJ8FQTQwRYQvY
         rk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=KYKHig3bT+0ct+qSXmJq7X0oyoeXzuw4p8rB5lfTPu4=;
        b=hNCZcZ80fPabZNMr1WG1v3Gb0v/8mfL6eLEv8RAKNkEXzE7eCTnguiAaRi1hI9Q+dq
         vPO7FDyx809G1Rm7w8mTs7rQkhoiYZ26dlHdeqyRkYiwwNK0CLGabshef2VjMa1XHWLR
         vdXcRBKu6aysWzF7dp5B7FCTy8GZDNDTG5DO8lyeaCdl7MUeOWOcfMx5RuYKxjpIUA/c
         beac+WUd0jJ9mjGt/4rgXryhSFMcphh6r14lB1wYy3VJWNcJBb4wsMeZUWTMkOGuy8tr
         khI0h4HHfxWBXuvudjGk1nuzJbqlNotcPLueg0PeDap78Hr1X1svj9vQdi7hTJ0bZv5k
         Djig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t35si32168732qtt.335.2019.07.26.03.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 03:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqxkr-0008SB-Fd
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 06:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkg-0007yS-5C
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:47:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkY-0006xE-3u
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:47:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37100 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkO-0006b4-Uc; Fri, 26 Jul 2019 06:46:53 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3F6F065647E06F766090;
 Fri, 26 Jul 2019 18:46:41 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Fri, 26 Jul 2019 18:46:33 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Fri, 26 Jul 2019 11:45:18 +0100
Message-ID: <20190726104519.23812-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH-for-4.2 v8 8/9] hw/acpi: Add system power down
 support to GED
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
X-TUID: 3CLavKrK2961

This adds support to use GED for system power down event.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/generic_event_device.c         | 6 ++++++
 include/hw/acpi/generic_event_device.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 7902e9d706..0b3214eff4 100644
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
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index f0152b0018..63104f1344 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -61,6 +61,8 @@
 
 #include "hw/acpi/memory_hotplug.h"
 
+#define ACPI_POWER_BUTTON_DEVICE "PWRB"
+
 #define TYPE_ACPI_GED "acpi-ged"
 #define ACPI_GED(obj) \
     OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
@@ -78,6 +80,7 @@
  * through GED.
  */
 #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
+#define ACPI_GED_PWR_DOWN_EVT      0x2
 
 typedef struct GEDState {
     MemoryRegion io;
-- 
2.17.1


