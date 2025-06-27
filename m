Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788010dye;
        Fri, 27 Jun 2025 02:57:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9O+DiEuab3YKXXpMcfVzF4AONUSRHrIAr9thfYK6hhKG5XSSZAnhJ/qQqMu7nGwnUymhhdT7KbZw00Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHOJnKGFv78HlCauRp7e6bkK76ZClLVkgHz1MLESYaGHN39Vk6retaYV5DzPnP4wgDBY/3E
X-Received: by 2002:a05:622a:11d3:b0:494:b377:a77b with SMTP id d75a77b69052e-4a7fcab19c0mr49515491cf.27.1751018269907;
        Fri, 27 Jun 2025 02:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018269; cv=none;
        d=google.com; s=arc-20240605;
        b=KSauJRaOk6oB7OC9sTDCsqi12ZmiSFjB/NzSV5CajosEw7u+zaj7/nFstQ8FMeEbGS
         VwAuYYiqbU5rnUwfCvot1Iifst622bpofNK+xK745SV3SCxeN58gk2sU5X3lcGuMqcOd
         rwxyECPT4aYEvQCaaPF2nvPKJUSZnsDbuqM0fGlkKPdmMd02jxiUo5KierbDtnYxQ1Pk
         +lsUI+b899nF0lyUjSrirPMk1RgiM3y9HKttydrYS1XtE1PIQRikWIALKxQYs4kWy1bq
         yjFKTu6XoBsXFopBRURaCeGzlyzJeLT6tLQ0p/32jYGn15H1go9M8Kyhwy3PU0fNCUDt
         tGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CxK/X0AFuYI5jdZb+wiCpwGWsUCacdBUbZ6RGq7x/xg=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=hYJWvqqaMvVsC5/Ph3VGmxaM7GOQB9bSGUFkw6LIHXRmZZhW9AZtt1tE0vztc9mZUG
         WNBFydFy82HpZDpmwVdW3luiNCDgrgMn6gf06QAmX2etDRmCd5Oq1HPZ5ZY6iRtstRV7
         O2NromLgaNJjaVYkwa7U/YMTHD+tcxDlVLzi8nzRWDrqzA83pAVizYH14IrFUevpe8t+
         jBL4M4ZI31p1cNY5D6s+ytJZGFz+Nue1to9Y8fZf/W+rwNIJxWkkqcAbVy5VfUEoHs6+
         PIiq1fXFqz2SEMEeQSZZTUvS/oBQro/f4mza4m+X6niBiN8c+Xx5zRM0iDIUeslMkqTb
         QzVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuOaHCqn;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0ffe14si19023631cf.82.2025.06.27.02.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuOaHCqn;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CxK/X0AFuYI5jdZb+wiCpwGWsUCacdBUbZ6RGq7x/xg=;
	b=NuOaHCqnXaYQ+tW9rC0QHw5Tv5IQrw12eCCFdY7spNUZK/r8dGszVkna6BWr1ozt9wfESj
	9jVe+7yxn4FpxmqD+h2DgTaa76nuxihkX5Zs5SbkyT/FRJmhwdCa5sCRz5VkQq0JhxDtp/
	hmnrBGcwVg9QAx9RRU0GE7X5moOywz0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-6KGsK6SlMqe-rUCnOiT7Ow-1; Fri,
 27 Jun 2025 05:57:45 -0400
X-MC-Unique: 6KGsK6SlMqe-rUCnOiT7Ow-1
X-Mimecast-MFC-AGG-ID: 6KGsK6SlMqe-rUCnOiT7Ow_1751018264
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 629D01809C84;
	Fri, 27 Jun 2025 09:57:44 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F24D319560AB;
	Fri, 27 Jun 2025 09:57:39 +0000 (UTC)
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
Subject: [PATCH v4 15/32] hw/i386/acpi-build: Use AcpiPciHpState::root in acpi_set_pci_info
Date: Fri, 27 Jun 2025 11:55:04 +0200
Message-ID: <20250627095620.3300028-16-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 0cfyfxZ3x3Fv

pcihp acpi_set_pci_info() generic code currently uses
acpi_get_i386_pci_host() to retrieve the pci host bridge.

To make it work also on ARM we get rid of that call and
directly use AcpiPciHpState::root.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

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
