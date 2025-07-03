Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506215dyc;
        Thu, 3 Jul 2025 05:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLKU2zH9LY95oEC06HLVJR80My+vkchv7Kdp97MuMNRIje9ns85o9H/uaPlOj6IZS0lEDPDgrqfUnmjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFBgxSHcoFOltWO0IKjrj9DboIz42UbuTDexv68TovSaoe3rjuV4uimZdIXF/ajWZQctdmU
X-Received: by 2002:a05:622a:1bab:b0:4a7:8439:796e with SMTP id d75a77b69052e-4a98add5d41mr32105111cf.13.1751546395478;
        Thu, 03 Jul 2025 05:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546395; cv=none;
        d=google.com; s=arc-20240605;
        b=EesDtMEaNwyODy37nDApi1G3Y3XJ8z4nNV5Twdk5gUto7x6JGIJSFN1j3vHDPpDvjy
         NfLhrs88ih7wvjkKY7Bn3Z30n3/CCetcFCz1r1trhdKkSQpTM2NYEpKPy+5wmWYNrE6E
         INzXaUeiOLWHVsg3zLbpy6cW5JNYk3SeZnpX30imrbN6nAU+Ca4B/dckq0EUFw4HLWqk
         sx4r76AJZ827tJCudDNLdl1QmgL+iXVItvPI44Byz8xbJsTxivycSBj6JyCXQqgX8dMm
         5adIJsilKuQOrblsnR0BeHlyvMyFm36wYIMsBvTqEtIlSafXrAuLcGvUJ/ihjcVX8CwB
         HDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5SBU8rqjDCM9bszWrHYCJiNHA4uqefOcOO5gBO57x8s=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=Fb+OlfajcjkjJjlo8iu6paLWk3BSL0B4ZZA5cZpsqEPCLU6ueczhnJk/JM6u41R9UJ
         /UlR6F8EKuFMp932AQRp4rbal4suou8PS2Qd7jHVm4xj/c4LGDPHBE3Z5XbCiUfVPVfT
         7KYfQgA6EyQDvsYk80SuS5FjLOzh5O+SwEyZa7+D7ACGjsJ+lcg2maYU3nsyLf3IbU9e
         N8kZOEXgtnPs6GC76Cd8xHuKg0vgp/C1Ay25E2Z1XDy5gMh1JQm8+9JWFn7jbdF65dS/
         02c4GhXxJxH0eSYdlLmcTasdhlFf3CHL3bCAJa63qApcuDE9L2whGRteQnuH24FcgiwU
         ks5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YskQ7u06;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc57e8bfsi142957291cf.660.2025.07.03.05.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YskQ7u06;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SBU8rqjDCM9bszWrHYCJiNHA4uqefOcOO5gBO57x8s=;
	b=YskQ7u069VoDXGB5XR2VXy/iZQMk6hFpCvN5/99pQUovZQYHxQHsxAemkuoACuiDthpGwO
	RkFBrkElc3AI21kXYp5jdr5mCo1tY+VYeUoqqEOjpqsMlc98XI8GuJamGtayLfVOFCdX3q
	RpC1efD+syjk4Eioa+7CxGfEGsMI5gc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-oBq0hhyqPV6U0FJshPVShA-1; Thu,
 03 Jul 2025 08:39:54 -0400
X-MC-Unique: oBq0hhyqPV6U0FJshPVShA-1
X-Mimecast-MFC-AGG-ID: oBq0hhyqPV6U0FJshPVShA_1751546392
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C34D18DA5CE;
	Thu,  3 Jul 2025 12:39:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 27D2A180045C;
	Thu,  3 Jul 2025 12:39:47 +0000 (UTC)
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
Subject: [PATCH v5 26/36] hw/acpi/ged: Call pcihp plug callbacks in hotplug handler implementation
Date: Thu,  3 Jul 2025 14:35:26 +0200
Message-ID: <20250703123728.414386-27-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: UFNdvQN+RLKf

Add PCI device related code in the TYPE_HOTPLUG_HANDLER
implementation.

For a PCI device hotplug/hotunplug event, the code routes to
acpi_pcihp_device callbacks (pre_plug_cb, plug_cb, unplug_request_cb,
unplug_cb).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---

v2 -> v4:
moved before "hw/acpi/ged: Prepare the device to react to PCI hotplug
events" (Igor)

v2 -> v3:
- remove else block in acpi_ged_device_pre_plug_cb
---
 hw/acpi/generic_event_device.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index ef1c1ec51f..92b931758f 100644
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
@@ -228,6 +229,14 @@ static const MemoryRegionOps ged_regs_ops = {
     },
 };
 
+static void acpi_ged_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
+    }
+}
+
 static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
                                     DeviceState *dev, Error **errp)
 {
@@ -241,6 +250,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
         }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_plug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -257,6 +268,9 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_request_cb(hotplug_dev, &s->pcihp_state,
+                                            dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -272,6 +286,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -485,6 +501,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
     dc->vmsd = &vmstate_acpi_ged;
     dc->realize = acpi_ged_realize;
 
+    hc->pre_plug = acpi_ged_device_pre_plug_cb;
     hc->plug = acpi_ged_device_plug_cb;
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
-- 
2.49.0
