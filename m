Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788292dye;
        Fri, 27 Jun 2025 02:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVb/57MetSnVQ8xNpCeMCLCSSdwk+zaeks8nCf2gEbRF7Uydrhd/BueS3+HeCvZufWTDgiQTJRNihrjfg==@linaro.org
X-Google-Smtp-Source: AGHT+IFmi8NFHJeMTK59KWicrl7Z4AEjk9ConYCQm2MqZIppfpb2t6/Qg0Rt2RYoxwt7lU1gu1s5
X-Received: by 2002:a05:622a:58c8:b0:494:ad3f:cb7e with SMTP id d75a77b69052e-4a7fcb06fb7mr51279381cf.50.1751018318412;
        Fri, 27 Jun 2025 02:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018318; cv=none;
        d=google.com; s=arc-20240605;
        b=RqR68t6FUeydJekRc+7+HGBnfAduuRp5A41PtUMZAmMB8AQCX/XdoUyU94MxjBxOjt
         8jvZmcqWabJkRX+Kum/mtKsLIoXVOVZXYQvLf3mv9uJcO6DGoznNcbxKoYHphNJf1wYk
         407TiS8/Y5Kbs/l2+tkabhON8v8kQbcwqSkj7i4BdTWTLKkUiZIk9qDegbjCqU7zq+WP
         wUbShRJEfWBNxzGHto+Q99cIwUdjcI5bPq9YEHql/r/1nGa6J5hvVj4c8ygwlEDDFwvj
         kN8GNdycvEWWkIKFdRaMK4x6KlgR46eEjf6/YPIJndgDCrbh0z0zL9LeQDPBdSa51v+p
         1qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nflNhAirwnlCA2CZ1+V1ICyO5meFSFGs3GcoyBK2x7g=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Gn3RCccMIMnVaETGadlu05RQuHfwTX17ApbvX97LcrEL56IxLL4pERVdB2PWrv/GTd
         0SowSO8dcee5Hf7qt4WVzrN2/qsl+EIJ+w5cODCTBYBOMCScaDwNg3JsggyMc4IQfrKe
         jBbKIUAZv2RzMhY7hCsSJUFj0K0Nf/FTZ/XeNreWOH1nYYZhZTkEOtDOlHy4m59uRkgv
         sUxY4JjoV7RGs/LixH9tIE258cWHd75k7F7ey+lUpPAbgJNM69RjNdcwGjcVPON+AvTR
         ziC1wg44TTtUtwyEqlMaQ2DI3OCEnJo99NkGOzwNRYX0FZ4tbnDpc93C/dNaxu/vfcMr
         uydg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LDIAZk72;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e761fsi20511151cf.281.2025.06.27.02.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LDIAZk72;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nflNhAirwnlCA2CZ1+V1ICyO5meFSFGs3GcoyBK2x7g=;
	b=LDIAZk72C+9NfTz9K0x8QyH0ZBRA4My3+hMC4OKyHkVrnqnAp4GfnOKAdsbvkOrQ7FL01e
	fmeTWvKh7NX244JjnEy0uXYPjxdONN5xDlI+8EWvC+M+1fi/3FjFNp2TjF3wCOm0bxwWaf
	YoDtG46G/AAlCdbp+m7X2zyfMt/fPjM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-YxOAU-gCNgKiezNM52njvw-1; Fri,
 27 Jun 2025 05:58:36 -0400
X-MC-Unique: YxOAU-gCNgKiezNM52njvw-1
X-Mimecast-MFC-AGG-ID: YxOAU-gCNgKiezNM52njvw_1751018314
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FDC91808993;
	Fri, 27 Jun 2025 09:58:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10D2E19560A7;
	Fri, 27 Jun 2025 09:58:29 +0000 (UTC)
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
Subject: [PATCH v4 25/32] hw/acpi/ged: Prepare the device to react to PCI hotplug events
Date: Fri, 27 Jun 2025 11:55:14 +0200
Message-ID: <20250627095620.3300028-26-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: VISY2sPMFonC

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
v3 -> v4:
- add qbus_set_hotplug_handler
- root bus is not passed in acpi_pcihp_init arg

v2 -> v3:
- pcihp_init and reset are put in ged code instead of machine code
  (Igor)
- Add ACPI_GED_PCI_HOTPLUG_EVT event depending on use_acpi_hotplug_bridge
  (Igor)

v1 -> v2:
- Introduce ACPI_PCIHP_REGION_NAME
---
 include/hw/acpi/generic_event_device.h |  4 ++++
 hw/acpi/generic_event_device.c         | 31 ++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index f5ffa67a39..ec8e1abe0a 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -102,6 +102,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 #define ACPI_GED_PWR_DOWN_EVT      0x2
 #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
 #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
+#define ACPI_GED_PCI_HOTPLUG_EVT    0x10
 
 typedef struct GEDState {
     MemoryRegion evt;
@@ -109,6 +110,8 @@ typedef struct GEDState {
     uint32_t     sel;
 } GEDState;
 
+#define ACPI_PCIHP_REGION_NAME "pcihp container"
+
 struct AcpiGedState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
@@ -116,6 +119,7 @@ struct AcpiGedState {
     CPUHotplugState cpuhp_state;
     MemoryRegion container_cpuhp;
     AcpiPciHpState pcihp_state;
+    MemoryRegion container_pcihp;
     GEDState ged_state;
     uint32_t ged_event_bitmap;
     qemu_irq irq;
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 92b931758f..fc84bfb34e 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
@@ -28,6 +29,7 @@ static const uint32_t ged_supported_events[] = {
     ACPI_GED_PWR_DOWN_EVT,
     ACPI_GED_NVDIMM_HOTPLUG_EVT,
     ACPI_GED_CPU_HOTPLUG_EVT,
+    ACPI_GED_PCI_HOTPLUG_EVT,
 };
 
 /*
@@ -123,6 +125,12 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
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
@@ -316,6 +324,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
         sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
     } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
         sel = ACPI_GED_CPU_HOTPLUG_EVT;
+    } else if (ev & ACPI_PCI_HOTPLUG_STATUS) {
+        sel = ACPI_GED_PCI_HOTPLUG_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
@@ -427,9 +437,13 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AcpiGedState *s = ACPI_GED(dev);
+    AcpiPciHpState *pcihp_state = &s->pcihp_state;
     uint32_t ged_events;
     int i;
 
+    if (pcihp_state->use_acpi_hotplug_bridge) {
+        s->ged_event_bitmap |= ACPI_GED_PCI_HOTPLUG_EVT;
+    }
     ged_events = ctpop32(s->ged_event_bitmap);
 
     for (i = 0; i < ARRAY_SIZE(ged_supported_events) && ged_events; i++) {
@@ -449,6 +463,13 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
             cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
                                 &s->cpuhp_state, 0);
             break;
+        case ACPI_GED_PCI_HOTPLUG_EVT:
+            memory_region_init(&s->container_pcihp, OBJECT(dev),
+                               ACPI_PCIHP_REGION_NAME, ACPI_PCIHP_SIZE);
+            sysbus_init_mmio(sbd, &s->container_pcihp);
+            acpi_pcihp_init(OBJECT(s), &s->pcihp_state,
+                            &s->container_pcihp, 0);
+            qbus_set_hotplug_handler(BUS(s->pcihp_state.root), OBJECT(dev));
         }
         ged_events--;
     }
@@ -490,6 +511,15 @@ static void acpi_ged_initfn(Object *obj)
     sysbus_init_mmio(sbd, &ged_st->regs);
 }
 
+static void ged_reset(DeviceState *dev)
+{
+    AcpiGedState *s = ACPI_GED(dev);
+
+    if (s->pcihp_state.use_acpi_hotplug_bridge) {
+        acpi_pcihp_reset(&s->pcihp_state);
+    }
+}
+
 static void acpi_ged_class_init(ObjectClass *class, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(class);
@@ -505,6 +535,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
     hc->plug = acpi_ged_device_plug_cb;
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
+    device_class_set_legacy_reset(dc, ged_reset);
 
     adevc->ospm_status = acpi_ged_ospm_status;
     adevc->send_event = acpi_ged_send_event;
-- 
2.49.0
