Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788249dye;
        Fri, 27 Jun 2025 02:58:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBTMmOmZPFf82Y77xEosi1eqy8b8xl6d2nd9AH3MboDd45/i9xSsd/lAhe1xzKfM3Mi+d2UKSHt1cPCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IExvGtR3ANspWt9sgnfOMlOzH6FJ9G7o4uLGyBiVvHjuq9RTp0V8nyU4vL7IcL9DbtNzRIA
X-Received: by 2002:a05:622a:588:b0:4a7:1402:5514 with SMTP id d75a77b69052e-4a7fc9d5a1dmr40066001cf.10.1751018311945;
        Fri, 27 Jun 2025 02:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018311; cv=none;
        d=google.com; s=arc-20240605;
        b=gw3QMJlWKbsoCqtdwNDIqExHCv3Z7ekWasezx2cMvDAMCuHzcdcGaR9XCPHEV4nAkQ
         4wPw2xd5V+iN+oljB4F6cOIBIXoGij8+6C1zKHZTHmjigfp//IeNDpbUJezPzBlLqMCO
         gRqaowx9HpFeGEcKg9hrgY93P4u1kGaPGihnobyeopUYRcy1mxtRjB2Q5elHzRJx7Typ
         CxJYufd+Ck+ElnUF6S6eJqW+QO1TCFlvUU2R+bOz/W4vvkj/wWiCLeCCcj8thdwE3leq
         PCpnNrSs9Cw0En7nH7qP/LI+RqkQfq3ENsNOSuMLZoaY6S88EC+e+CFEMSF9rw+Bipfp
         j6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5SBU8rqjDCM9bszWrHYCJiNHA4uqefOcOO5gBO57x8s=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=DCzCP1/AMR6/cigLqulWxZyLHtpE1A3nJtqQOly057NrrUo3S8vnzR6BtT8XQ4iYGX
         214LYEC1a5D4mt8O7bcI1fnpsWG818+EYN674bH8iyVgUAC9a/mUJv4Te5xdOTCQYEJ1
         ttHQFa5l8PAr1fTWszKEdqE6P44BEV9K5Caz+QNKaoSO1o802m8IvBmaQ7A8GmFTKjvl
         9SkfXzO0IevbEqqbvbTSQc6s7NYutv3iqcziMTDbVQNs1Mq/tPCNplriwRoqGMyOUUV+
         gKfRNptP5Id1D09Ykpd2uWOAGKyV4z7l0jY2n8yjYr3sFay8YjoTDqdIdmAk0X9YC/c9
         poXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i5mUKNlC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e6d7esi20567411cf.194.2025.06.27.02.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i5mUKNlC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SBU8rqjDCM9bszWrHYCJiNHA4uqefOcOO5gBO57x8s=;
	b=i5mUKNlCMYYRxWyWzQKta7lOtdE12EBjqp6Buc09IGbRAglRfFBuuqWFmkhnEdTUdTFj9y
	XKRglRaerxjjBatFDzpZTAEH0rxpqBfMk70DayeD9IPZwDsn7YPGs2HD8gSovYgPfF4PYv
	TRkUxnkgKyDYNV/6lXVvoJhg7KPkCOA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-fM4gQtiSO3CcATuAOrftQw-1; Fri,
 27 Jun 2025 05:58:26 -0400
X-MC-Unique: fM4gQtiSO3CcATuAOrftQw-1
X-Mimecast-MFC-AGG-ID: fM4gQtiSO3CcATuAOrftQw_1751018304
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E7371955ECA;
	Fri, 27 Jun 2025 09:58:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2E35119560A7;
	Fri, 27 Jun 2025 09:58:19 +0000 (UTC)
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
Subject: [PATCH v4 23/32] hw/acpi/ged: Call pcihp plug callbacks in hotplug handler implementation
Date: Fri, 27 Jun 2025 11:55:12 +0200
Message-ID: <20250627095620.3300028-24-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: dcUCwr675lz8

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
