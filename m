Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648181njc;
        Tue, 27 May 2025 00:44:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzLkdrcAwPi741FjYZZcKsuJtY7icvQsIytF0VJkBmd1P51e4NtFQhdcw0GBT0d3WuAuUjvXwheDSB0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHjPguHyyj7DLJbAFxDjKk72kVqbbk8na+CZ+Kw069A1gZJrbYBx2ysbep9MfGY9DaJaSs6
X-Received: by 2002:a05:622a:418f:b0:477:64dd:5765 with SMTP id d75a77b69052e-49f47de7899mr227538241cf.44.1748331854103;
        Tue, 27 May 2025 00:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331854; cv=none;
        d=google.com; s=arc-20240605;
        b=HQ/5zTSu4X5FBPvytBKNI6fIGsEUQc3jD7i2kDwd1o2cCnyt4qzfJtPv4KNbXnhzJO
         /Z5JFPerpRgLRFZ5hiGMQ9UMfPauWcXLLPcASdlj65NSKF6JyzQBJtSy8c3nKwhadrnf
         dHKo1w7XSdOc4HQZ9mA5hBSx4psr3z+IbG6KFyvCrIQhq6n/KwjF1v6yfdGEPfe+XQey
         3FVqdRrBQk45zQXspJZg4inRUQac0Zdj52lwHNwPGcDewWWnqGeVKaIpJ5/w3oDRjYCQ
         Qua5mSWtGpiHT1kwxFoDPxwaRgNV9fWA+agpsYl/ssLgk37D8vTvbi7mQ6ekhuBWkJjz
         QfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MxuBslhSQqf18j+F1SdcKHWDR7rYVw+U5pTBvHrNmWo=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=gcpx3EZ9o0b2aFBtzOaxQ4ZK73TC7UEfRk5m+Z6h5r5N5TQ/jj1SQ5AM5QaaT2P0aF
         WZu9knmXbF7HrPKqjl2ZWyLa32KtJVF6NfHNMNHbnMxnrdZlhn/Jc6xlaXbKj6KXTpWw
         oLHrh32HT3pYBpri2BpVfzsmOTCVJZDUnNsJtsmyYdCwVGEnAOZ/t2aS3TrerFbb6nik
         AF5z0RUx9byoX00GLhYK63c8S86GI0wdG0Za1k8Tj+T/mQVVEwF/WkNPRLaCU/DSqxe/
         uvp3KGajSL5iS8eGNXGVUGVKi79UqVL4SdHvLQoqoaZ7c3v09RX5QDdd+IJZQsxKzmcB
         hYFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aLWdrq8F;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae560e8dsi260769971cf.243.2025.05.27.00.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aLWdrq8F;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MxuBslhSQqf18j+F1SdcKHWDR7rYVw+U5pTBvHrNmWo=;
	b=aLWdrq8FSxhLUFGDPfF7SiNogtnG6kazC+b4bhhHSiO/ZS6cD3DJ8+JEBH5+YAvPxouQQm
	jbVL+/5+4I9fvc+BZuJF3OIvZFOo/8N8pnF/I2JhGbkdtXdZtl5pRJuvwm2tiECB5gu5v6
	mQSyROajAXpPc1B+yYPELfju0AQgrZE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-l_wbMImsNEieb9-LhNgR4g-1; Tue,
 27 May 2025 03:44:10 -0400
X-MC-Unique: l_wbMImsNEieb9-LhNgR4g-1
X-Mimecast-MFC-AGG-ID: l_wbMImsNEieb9-LhNgR4g_1748331849
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D66701955E79;
	Tue, 27 May 2025 07:44:08 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5638419560AA;
	Tue, 27 May 2025 07:44:04 +0000 (UTC)
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
Subject: [PATCH v2 19/25] hw/acpi/ged: Call pcihp plug callbacks in hotplug handler implementation
Date: Tue, 27 May 2025 09:40:21 +0200
Message-ID: <20250527074224.1197793-20-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 5OsIU44hQ7kD

Add PCI device related code in the TYPE_HOTPLUG_HANDLER
implementation.

For a PCI device hotplug/hotunplug event, the code routes to
acpi_pcihp_device callbacks (pre_plug_cb, plug_cb, unplug_request_cb,
unplug_cb).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index f84216a85f..c0dbf9b358 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -17,6 +17,7 @@
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
@@ -235,6 +236,17 @@ static const MemoryRegionOps ged_regs_ops = {
     },
 };
 
+static void acpi_ged_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "virt: device pre plug request for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
 static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
                                     DeviceState *dev, Error **errp)
 {
@@ -248,6 +260,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
         }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_plug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -264,6 +278,9 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_request_cb(hotplug_dev, &s->pcihp_state,
+                                            dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -279,6 +296,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -494,6 +513,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
     dc->vmsd = &vmstate_acpi_ged;
     dc->realize = acpi_ged_realize;
 
+    hc->pre_plug = acpi_ged_device_pre_plug_cb;
     hc->plug = acpi_ged_device_plug_cb;
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
-- 
2.49.0
