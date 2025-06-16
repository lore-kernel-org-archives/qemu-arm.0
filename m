Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741398njc;
        Mon, 16 Jun 2025 02:51:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/qRreRd2D2pIvFCdDJf1oFOWBWCsM3S30hPG3ST1eRVin5Od3gR79uB6kzIbRA3KVhs7KoIj9UVCHUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG7xlFL5UlG0rQ56IC9ZiEeqs4RnuCF4WIJCcipjSk/F0hb807IptHNQQENLuj/3qR7r0eW
X-Received: by 2002:a05:620a:28c8:b0:7d0:9637:3f27 with SMTP id af79cd13be357-7d3c6cdc8famr1373605885a.35.1750067470317;
        Mon, 16 Jun 2025 02:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067470; cv=none;
        d=google.com; s=arc-20240605;
        b=MLFnEJaSBuqUKDFjjM5d2gVWeoOzQMd/XYQYHwPqypSK9QCX6+xJBEewivDInyC2Z4
         TeLtGU1Mqn+EcI9J1rgl5p2zwJt3T0kgDNmMVySUK+/EvO61CLArc7wiqpnznLUC5TSo
         GYecJF5mM6x+SjyonHs7Rdf353z1rT7UFo/Ea5/u4sNZx+yd690If6EHfiSAtU7wZbZu
         Tu6MBMNjRfs2nqzj2E/3zGm2nqnrhlJMjUWf7y27c0oj5l4AXLV3GNJYNpOj14n7Ma8f
         kYJN2EyO7CsYQvD0NEu8nGwOaA2fZl9VaMVYFJKbBnwSnQNhzw6VB5hC7rGgA2jXpLLm
         hRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qVh6hqTdgVVgTSrSFkgu8BURyIg7Kg2bNkfgnSGyOQw=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Hm/D8vjwBpMZ1y54YAJBIk64+isqfB+DHkbUSA3PZsjcKPJPMKub1JNHFLfEU36cty
         O6fd1KbsWu1ZCvdEszC78MvvUctVnDlAG62ORbTQ3NFImPHdTTFHpbczgMQ6EF6RXZyi
         zENlg6wNvIKENBQdWcL2++U4AoRW0SkXr2pESFaVN/Yx0iH3ZukABRcuaEB+3m1YDqxp
         R4s+c2EmuPtMIagSXDFep0sr/bI7gsUciZV9SPasLkHefPTuDFo62TDkUEc0N7I8haNm
         LWSfdfKh+Khv5Mc6L60dkkVGn3HZivA5rdxq66paEl2fkBJkJGSceyC7yeGN1ZPoGTYz
         e8Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Pw6OEc/F";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f2df53si946619285a.514.2025.06.16.02.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Pw6OEc/F";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qVh6hqTdgVVgTSrSFkgu8BURyIg7Kg2bNkfgnSGyOQw=;
	b=Pw6OEc/FGO/rLOkQK+AP1bRn8gmYlJ8SzlrrM6+SowR3ScFmUmhCt7FOqLub1ABuv1sgoG
	dq6cKETXp/PqtmGI3xGLU/lGJWovHiUVBQYZQO/3pp/QBWWY10/WgRFxhyPQuLfhu2aZlN
	SZAZaPmz+1T17K/aWV3tF1ZU0K2OWVM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-570-X0Cngl3oMxa8mt5muxRvOw-1; Mon,
 16 Jun 2025 05:51:06 -0400
X-MC-Unique: X0Cngl3oMxa8mt5muxRvOw-1
X-Mimecast-MFC-AGG-ID: X0Cngl3oMxa8mt5muxRvOw_1750067465
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 110C5195609E;
	Mon, 16 Jun 2025 09:51:05 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3C8DB19560A3;
	Mon, 16 Jun 2025 09:50:59 +0000 (UTC)
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
Subject: [PATCH v3 21/29] hw/acpi/ged: Call pcihp plug callbacks in hotplug handler implementation
Date: Mon, 16 Jun 2025 11:46:50 +0200
Message-ID: <20250616094903.885753-22-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: vwDyvHPZNzEd

Add PCI device related code in the TYPE_HOTPLUG_HANDLER
implementation.

For a PCI device hotplug/hotunplug event, the code routes to
acpi_pcihp_device callbacks (pre_plug_cb, plug_cb, unplug_request_cb,
unplug_cb).

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- remove else block in acpi_ged_device_pre_plug_cb
---
 hw/acpi/generic_event_device.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index b4eefb0106..2ae9ad082a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -18,6 +18,7 @@
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
@@ -236,6 +237,14 @@ static const MemoryRegionOps ged_regs_ops = {
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
@@ -249,6 +258,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
         }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_plug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -265,6 +276,9 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_request_cb(hotplug_dev, &s->pcihp_state,
+                                            dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -280,6 +294,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -510,6 +526,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
     dc->vmsd = &vmstate_acpi_ged;
     dc->realize = acpi_ged_realize;
 
+    hc->pre_plug = acpi_ged_device_pre_plug_cb;
     hc->plug = acpi_ged_device_plug_cb;
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
-- 
2.49.0
