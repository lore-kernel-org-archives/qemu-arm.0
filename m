Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506483dyc;
        Thu, 3 Jul 2025 05:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpU5VG0kh3z2AiAEEk6MhCyn3prtJvPbyvUkgIDA5210DAq2bDyq1j5ioOJ8W9odX5NVXFxfEn3l5Z0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHl33wZztzvrJ7JBvft5XLZtJvHwxUaOForfhKC95+UzujDqpEFNFG8xKqZTLes8qwH5dHh
X-Received: by 2002:a05:620a:448b:b0:7d4:4d60:3bfa with SMTP id af79cd13be357-7d5d146142cmr524030985a.32.1751546424505;
        Thu, 03 Jul 2025 05:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546424; cv=none;
        d=google.com; s=arc-20240605;
        b=HJ26qmroGlb5umh6ORg9SQMtobZkuN/ChRMnt2TZeLyNlsm3SAjQfVeATmwfSpys9X
         PbbzXkwf8+zejlRWI5p3poBgkl8O4PumZajzaT/Gx5e++JsdyPMSTiHEVyVCTP/g2koO
         JG68YM7mNAit+oNXOHxM9HRM33URR0MljYeRZoudYVTnl4uCL2h+4cghQPo3Gbb4OCoG
         Bw9Wc5cPKzM0+RLgOOkD9EZJlyX22gmuiJTLL7r079nmVembkYJhr2HQZA5ueGWfH9Q3
         oayTPUg7tTZ2mnxI3kzRGpMzK+GdDypLJDePphe+XoRuJ7Q3DkNvi8YST/rgZI9M+Nde
         FWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QxwfYEvRpYO+ysfGn4l7Ic5LE5Wsaju89hTYULgExAg=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=b95bVY7/ymWtZ8aicSt2aYwduNkuQGpohknUMVDCz94hSVN+f27mr6F+tuEzsOGp+M
         2YM1M4CzWRyyrbPoImuV87GrRKis6HwqNMBOEWTbwsUOI3L2tCer+e3goG3sUjlk9McO
         nRwth8RRhmbUkI3R4/E7Tio1fUouvXkFagrtWOxUP/XGrtFdhqbg2Myn1vjhV8B3xxOf
         cfzbvNW0l0qEmkCdcLRl9eCyu8hVVAemovW87OIsE1AUi1Fb3273icKJ98WjhPslc9uK
         yLOL1+VJLs275IktE4Pw07AOaC7YdjzpkpFK6GSqt/ehxpNuKhY19TmdObP3LOoUd6p2
         Gj2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwBY37sx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443288584si1464040185a.516.2025.07.03.05.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwBY37sx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxwfYEvRpYO+ysfGn4l7Ic5LE5Wsaju89hTYULgExAg=;
	b=cwBY37sxW+yH7H6JOzLR/92RPw7j1LfDDSfYdGSVYJbKpbh48E9Zy9fzjPV/uxDAtU5E6M
	ahDnSAkLeAwKfL7Lr5DYFu1ksNkAqI79XT1ogJwwcK08+6A/8Vl/0FC8afKYDzeQULwMav
	j5fM/mjBdXFaqkyFp4vXeGmQRCALElc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-Vu89Ro_SNlGaz_DNGnChpw-1; Thu,
 03 Jul 2025 08:40:20 -0400
X-MC-Unique: Vu89Ro_SNlGaz_DNGnChpw-1
X-Mimecast-MFC-AGG-ID: Vu89Ro_SNlGaz_DNGnChpw_1751546419
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F14418089B8;
	Thu,  3 Jul 2025 12:40:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B194E18046C6;
	Thu,  3 Jul 2025 12:40:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 31/36] hw/arm/virt: Minor code reshuffling in create_acpi_ged
Date: Thu,  3 Jul 2025 14:35:31 +0200
Message-ID: <20250703123728.414386-32-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: +BbpCyQYDUKE

Use a local SysBusDevice handle. Also use the newly introduced
sysbus_mmio_map_name which brings better readability about the region
being mapped. GED device has regions which exist depending on some
external properties and it becomes difficult to guess the index of
a region. Better refer to a region by its name.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 include/hw/acpi/generic_event_device.h |  1 +
 hw/arm/virt.c                          | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d56adaa626..2c5b055327 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -111,6 +111,7 @@ typedef struct GEDState {
 } GEDState;
 
 #define ACPI_PCIHP_REGION_NAME "pcihp container"
+#define ACPI_MEMHP_REGION_NAME "memhp container"
 
 struct AcpiGedState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 34a3831530..7b247ad30c 100644
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
