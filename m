Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648156njc;
        Tue, 27 May 2025 00:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBUDS71A+O54biy/IoEiUgId829u60EUeMzK93hBJq8NhCIwcDcxghREXUk72rUQUlIv1iCj6ryDMJBg==@linaro.org
X-Google-Smtp-Source: AGHT+IFlbrWU7tMU9T2WE1R+Kp4j57f86skNfT+gznzi0E4VRRyHEZ+7L/LM1FugIzMQLwTHOI21
X-Received: by 2002:a05:620a:258e:b0:7c9:269f:b654 with SMTP id af79cd13be357-7ceecbdfcc5mr1560389985a.27.1748331850351;
        Tue, 27 May 2025 00:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331850; cv=none;
        d=google.com; s=arc-20240605;
        b=a4bexwuFCSivGZ28HMB3IGAekrFjfsKqDoEwtyVpf7jgsZUbWlwrKikrFYrRjrhDy2
         4bH/gw0c+/ycfiDk67DXQxHupE8yQGIGijxXcN2dG2h8FXLZROYHK/W2nTQ/3KTIwq2t
         AWlS3TztYbrIQFhLLhUk23E9Q0hsQJi94huio+aWx7RQxBM7NaWFVKEn6iOei0OEJe/t
         pd+b1uNLt4LIksVe2bxmMAvlGo/B1hZqeh26CwfxTCOJbQtbR8isvZiAHRfhgsgKKWPA
         OErdB4ZXr7RCtQ4ZxBCtC/Wcxa8l74/407RNNj46mhJKqiApjPNv2h6e9mHmLwKYRRRc
         wPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IFhqWhBFjPenL8cIKlsppJlVb9XVWvtWT9w2gOpDYII=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=PiYoQxhISQPCTSNz0i/yFn8Dn+vhtP6SOQ3VXaeR/VQjC3ssadmR0mNSafIWcDTmLJ
         8NFCtnqBCYeWplCzVhzFSUsxCOe7ipf5/NoRlVgbRbmFDbpv9lNodd9DvqjCVos+/2d7
         oePx/xSYwww7cU5G1VjSvQrmfNygLk0GIAEmrQRtTOXAMajNrewhFcvN/iK9gQHpD18q
         QNWdq6Mh/X5zsJ6fxH2wiGv+KB3f8t5jYHFUHHLJDS/90lQBvrKcVUQSc2E/7B9b47OW
         E5VtQhlGy9RYQLzUYVlFizMESj+cBT5mCwpyMzyjA4VIMJv9PzHHJdD/9NE02yDY1SZn
         qR2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PdHFY4T2;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cec49a91e6si1709838785a.458.2025.05.27.00.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PdHFY4T2;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFhqWhBFjPenL8cIKlsppJlVb9XVWvtWT9w2gOpDYII=;
	b=PdHFY4T2dPVuvqk0iBmbmQClrAuWs8bufdA2l47MCK/J764tSLxBD1QjKZz6xyM252N+jX
	LBKFG5WYlH4DrWKH8CJlMaesiUNvsHzA6EDO47mitb0I1xAy9tHGXEfXRY5a0FMUh5sm7D
	5jPeqBKUgU0I6zq0I2Tc67PL0Hv2N8o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-806enJsmP5S2L0eJbxViUw-1; Tue,
 27 May 2025 03:44:05 -0400
X-MC-Unique: 806enJsmP5S2L0eJbxViUw-1
X-Mimecast-MFC-AGG-ID: 806enJsmP5S2L0eJbxViUw_1748331843
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C9A461800366;
	Tue, 27 May 2025 07:44:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61F0D19560AA;
	Tue, 27 May 2025 07:43:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 18/25] hw/acpi/ged: Prepare the device to react to PCI hotplug events
Date: Tue, 27 May 2025 09:40:20 +0200
Message-ID: <20250527074224.1197793-19-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: Ps0bl60/KO+8

QEMU will notify the OS about PCI hotplug/hotunplug events through
GED interrupts. Let the GED device handle a new PCI hotplug event.
On its occurrence it calls the \\_SB.PCI0.PCNT method with the BLCK
mutex held.

The GED device uses a dedicated MMIO region that will be mapped
by the machine code.

At this point the GED still does not support PCI device hotplug in
its TYPE_HOTPLUG_HANDLER implementation. This will come in a
subsequent patch.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- Introduce ACPI_PCIHP_REGION_NAME
---
 include/hw/acpi/generic_event_device.h |  7 +++++++
 include/hw/acpi/pcihp.h                |  2 ++
 hw/acpi/generic_event_device.c         | 14 ++++++++++++++
 hw/acpi/pcihp.c                        |  1 -
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d2dac87b4a..9042448f77 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -63,6 +63,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/pcihp.h"
 #include "qom/object.h"
 
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -101,6 +102,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 #define ACPI_GED_PWR_DOWN_EVT      0x2
 #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
 #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
+#define ACPI_GED_PCI_HOTPLUG_EVT    0x10
 
 typedef struct GEDState {
     MemoryRegion evt;
@@ -108,12 +110,17 @@ typedef struct GEDState {
     uint32_t     sel;
 } GEDState;
 
+#define ACPI_PCIHP_REGION_NAME "pcihp container"
+
 struct AcpiGedState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
     MemoryRegion container_memhp;
     CPUHotplugState cpuhp_state;
     MemoryRegion container_cpuhp;
+    AcpiPciHpState pcihp_state;
+    MemoryRegion container_pcihp;
+
     GEDState ged_state;
     uint32_t ged_event_bitmap;
     qemu_irq irq;
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index f2c3558654..6191b81ef2 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -38,6 +38,8 @@
 #define ACPI_PCIHP_SEJ_BASE 0x8
 #define ACPI_PCIHP_BNMR_BASE 0x10
 
+#define ACPI_PCIHP_SIZE 0x0018
+
 typedef struct AcpiPciHpPciStatus {
     uint32_t up;
     uint32_t down;
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 7a62f8d5bc..f84216a85f 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
@@ -26,6 +27,7 @@ static const uint32_t ged_supported_events[] = {
     ACPI_GED_PWR_DOWN_EVT,
     ACPI_GED_NVDIMM_HOTPLUG_EVT,
     ACPI_GED_CPU_HOTPLUG_EVT,
+    ACPI_GED_PCI_HOTPLUG_EVT,
 };
 
 /*
@@ -121,6 +123,12 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                            aml_notify(aml_name("\\_SB.NVDR"),
                                       aml_int(0x80)));
                 break;
+            case ACPI_GED_PCI_HOTPLUG_EVT:
+                aml_append(if_ctx,
+                           aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
+                aml_append(if_ctx, aml_call0("\\_SB.PCI0.PCNT"));
+                aml_append(if_ctx, aml_release(aml_name("\\_SB.PCI0.BLCK")));
+                break;
             default:
                 /*
                  * Please make sure all the events in ged_supported_events[]
@@ -299,6 +307,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
         sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
     } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
         sel = ACPI_GED_CPU_HOTPLUG_EVT;
+    } else if (ev & ACPI_PCI_HOTPLUG_STATUS) {
+        sel = ACPI_GED_PCI_HOTPLUG_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
@@ -428,6 +438,10 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
             cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
                                 &s->cpuhp_state, 0);
             break;
+        case ACPI_GED_PCI_HOTPLUG_EVT:
+            memory_region_init(&s->container_pcihp, OBJECT(dev),
+                               ACPI_PCIHP_REGION_NAME, ACPI_PCIHP_SIZE);
+            sysbus_init_mmio(sbd, &s->container_pcihp);
         }
         ged_events--;
     }
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 57fe8938b1..e87846a1fa 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -44,7 +44,6 @@
 #include "qobject/qnum.h"
 #include "trace.h"
 
-#define ACPI_PCIHP_SIZE 0x0018
 #define PCI_UP_BASE 0x0000
 #define PCI_DOWN_BASE 0x0004
 #define PCI_EJ_BASE 0x0008
-- 
2.49.0
