Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788369dye;
        Fri, 27 Jun 2025 02:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5EGeaTNiHWnGuTaFH260ZZoekz9w2rDie9LT3rgNtV5nfxdMjFiFYi5y8Zu7koYWEz/P+8efZqdMdiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE4eFxxywzGUUzfmvmwCtBXBI6Jz2emDc1XxdPbmca1hrqptGiiBiVeZ/X50i/jogW4VOnR
X-Received: by 2002:a05:620a:4613:b0:7d3:d029:2356 with SMTP id af79cd13be357-7d44411aaf3mr333440585a.11.1751018333028;
        Fri, 27 Jun 2025 02:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018333; cv=none;
        d=google.com; s=arc-20240605;
        b=BREsgplwRtma0pcuRAWYw4N1MZQEWExdV2qXvMbB1haVKKcSjlOvAUU9ILMzwDbeZp
         MllJZyrb3f49QOrIrZGuKTomGu9sJ3/ooOSKvIxvCvKBtpK5OcCe5q62Sld87HY2DPNx
         k629BBoE0fGkrGTtWr0mUIVqioO1womcmERUbIIDQHM2+Gsqa3n6QFeebHoCWbpR2prE
         XyJVATjTiZfRiAfFwj0JoUsTQOMV3R2qmMBncXqhR6GdGT1Ty7+MDdhGWRArzLfw2+It
         uptdh5VgCkwQVE0adobGtbuKh+W2fuHUp44NYGbZV05AGrJ0n9vjrNIR2jdh9s9KK/s4
         kDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/d3+oYG6EXhDPYhOXvbhWgpCOTN9+9rZDzH5VylPhQI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Gr5vClzOB7LQGFxDohps3090tJx8gj5gCjxWtE+MD6emSh8HZ/mQhl5gVyK0d2hUtP
         N4QZn9nzcGsxCfLV4Ai2hyMiR1gaajxZ01VfNXuqCs1DQECrZIMcme5OE7K4sbznVSlg
         d4cxL7q9XyJG7//Ff4EKj7X8ct3Sq35h0GVOBl25MBK1hQUIWBf/ubSgPGqBOo9lx2it
         q58dBRhAhmXDUBbHa9Tr8m8Gd9I65yg4AMRd/D9ipbbW571wlMmwxvVttQhXgHQXPBoi
         JzwTcZdy/O9PqoTp+3+YsOrw6m5g/ROR4lWlaH7AMUE8joJIa6TUsyfCNUKRb6ufSPRo
         Uu3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvZHo024;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443192fbfsi192333085a.6.2025.06.27.02.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gvZHo024;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/d3+oYG6EXhDPYhOXvbhWgpCOTN9+9rZDzH5VylPhQI=;
	b=gvZHo024gxTJr8K1F9ZeaJAiFkBFcEnVdfZlLMyRu1VZUe0MTFGFGR597JgSER5Qk4O0+s
	EYge+DFJJsRT+Nk4pmz8i9sELjihSZgofA0sscV03+5KU/WDVAf1oD+lNR5rcNV57/Lb6T
	GPysFg3LNIGrCp+Gritjdfcp1OLv+YY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-stascEnrNJ2KG8hU3QxygA-1; Fri,
 27 Jun 2025 05:58:51 -0400
X-MC-Unique: stascEnrNJ2KG8hU3QxygA-1
X-Mimecast-MFC-AGG-ID: stascEnrNJ2KG8hU3QxygA_1751018329
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF2D71800366;
	Fri, 27 Jun 2025 09:58:49 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5EFFD19560AF;
	Fri, 27 Jun 2025 09:58:45 +0000 (UTC)
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
Subject: [PATCH v4 28/32] hw/arm/virt: Minor code reshuffling in create_acpi_ged
Date: Fri, 27 Jun 2025 11:55:17 +0200
Message-ID: <20250627095620.3300028-29-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 3f8dsqZC4rPA

Use a local SysBusDevice handle. Also use the newly introduced
sysbus_mmio_map_name which brings better readability about the region
being mapped. GED device has regions which exist depending on some
external properties and it becomes difficult to guess the index of
a region. Better refer to a region by its name.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/generic_event_device.h |  1 +
 hw/arm/virt.c                          | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index ec8e1abe0a..8f5d903146 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -111,6 +111,7 @@ typedef struct GEDState {
 } GEDState;
 
 #define ACPI_PCIHP_REGION_NAME "pcihp container"
+#define ACPI_MEMHP_REGION_NAME "memhp container"
 
 struct AcpiGedState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2b0814888a..878c567354 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -683,6 +683,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 {
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
+    SysBusDevice *sbdev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
 
@@ -697,11 +698,13 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
     object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sbdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbdev, &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
+    sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
+    sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
+                         vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
 }
-- 
2.49.0
