Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741227njc;
        Mon, 16 Jun 2025 02:50:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVi5eWl/6aA5Rt3nyeiFdI53fO5P9x2tx7ZSoIIVGF7Rehf9GL9g6d6yRgCpNuadCHb+2x3PiBsLQVwg==@linaro.org
X-Google-Smtp-Source: AGHT+IEhFmdCXzK4/GBZMsMYerjoU7Jx8EOnnV795gQTiSUmriyrKanM+05884KuYgXccrmq2QGd
X-Received: by 2002:ac8:5f8e:0:b0:4a4:2f42:a668 with SMTP id d75a77b69052e-4a73c5951a3mr147476741cf.31.1750067439479;
        Mon, 16 Jun 2025 02:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067439; cv=none;
        d=google.com; s=arc-20240605;
        b=STJ9CjTjiEvCec6TVUkj0xYDWCZoWyzJdpD5JjWAmlSE07EksAxHmwuibDNcE0mW7n
         hcDZUchYUDtr9gslxFJV8L7zLgMzL6nexwdXQU8elttFtIno+8Y2R5pvRwh5HLwQKoAV
         x6fajOpsszGzpCLrUKPFUgao7QQAHOa3UR7V8WIIhq63jWkFPOvjJ4OK+Qvy/Ux/L+34
         DJLzPv0IS0uUU7ZKcAAx3SKaZqMRsHvHeXu0bgWSXHOjRUHLvPbq0X/lrxuGL4OvtORC
         PhGqnoVriLgf56BJRGR/1tliqUWEULCltYStMSL1n0DsISn1rYYm1bDb7F8dSAYgR0jI
         gfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zubIoFh9ZPeBOwkz2oBfKxpS2MJRsQpjm6T4ikFUl2U=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=T3cW4sF8usxM7iuhtv7JaXk+WSK+K50CGrPZ7KfjCWkFIIL4cx9Nu5LH7YAdJPSQjJ
         xGAjIVEaWmBkfk9o8v3ipxDyGCEU9DRqEd9c/mBtKPWquIZRXPEakCxxZ2iSoI+kM+GW
         N+Z5PmCfqGBSJPgSgibgKFDNVOjcTqNru7DY5S/q/RX/q5j2DsMOGIvSKBWS5BQZNNum
         09IdS1ZuOVCb8nXqO/jcLbyYEEC9z6BMrEz3sEr/9lYx5RWvdm/wx/AMevyVfyWb5C8l
         XqrZaVq/V58VkxnpjWyCTgpqsDsqwYTFe65wP+M9RVK+lckcKcxqPJcrZInyvdz70SAi
         XYMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOoh5djs;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a543aa5si94226891cf.623.2025.06.16.02.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GOoh5djs;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zubIoFh9ZPeBOwkz2oBfKxpS2MJRsQpjm6T4ikFUl2U=;
	b=GOoh5djsu1u5C6i2fj7Ryt3YYatQ+3n7PspGTLZzRjVsRFUqQuLyge4cQCTES5dJolDAlY
	VsImMiPAdvOFZafR05yrIV5QCkkDH1OjcShOSoUIHmAXVCY8J373I3QCKk6QVr0ny+S7m7
	prvFdOg339cwwMy5yIb3Eko9FUOrMOM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-QNnQzIezOgyXdrdWeBY4pw-1; Mon,
 16 Jun 2025 05:50:35 -0400
X-MC-Unique: QNnQzIezOgyXdrdWeBY4pw-1
X-Mimecast-MFC-AGG-ID: QNnQzIezOgyXdrdWeBY4pw_1750067434
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCE751956096;
	Mon, 16 Jun 2025 09:50:33 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8691419560A3;
	Mon, 16 Jun 2025 09:50:29 +0000 (UTC)
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
Subject: [PATCH v3 15/29] hw/i386/acpi-build: Use AcpiPciHpState::root in acpi_set_pci_info
Date: Mon, 16 Jun 2025 11:46:44 +0200
Message-ID: <20250616094903.885753-16-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: cDu01n4DMBRX

pcihp acpi_set_pci_info() generic code currently uses
acpi_get_i386_pci_host() to retrieve the pci host bridge.

To make it work also on ARM we get rid of that call and
directly use AcpiPciHpState::root.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>

---

v2 -> v3:
- Use AcpiPciHpState::root

v1 -> v2
- described the fact we changed the implementation of
  acpi_get_pci_host() in the commit msg.
---
 hw/acpi/pcihp.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 236e175b69..e79a24b821 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -99,10 +99,10 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
     return info;
 }
 
-static void acpi_set_pci_info(bool has_bridge_hotplug)
+static void acpi_set_pci_info(AcpiPciHpState *s)
 {
     static bool bsel_is_set;
-    Object *host = acpi_get_i386_pci_host();
+    bool has_bridge_hotplug = s->use_acpi_hotplug_bridge;
     PCIBus *bus;
     BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
                       .has_bridge_hotplug = has_bridge_hotplug };
@@ -112,11 +112,8 @@ static void acpi_set_pci_info(bool has_bridge_hotplug)
     }
     bsel_is_set = true;
 
-    if (!host) {
-        return;
-    }
 
-    bus = PCI_HOST_BRIDGE(host)->bus;
+    bus = s->root;
     if (bus) {
         /* Scan all PCI buses. Set property to enable acpi based hotplug. */
         pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &info);
@@ -266,7 +263,7 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
 
 void acpi_pcihp_reset(AcpiPciHpState *s)
 {
-    acpi_set_pci_info(s->use_acpi_hotplug_bridge);
+    acpi_set_pci_info(s);
     acpi_pcihp_update(s);
 }
 
-- 
2.49.0
