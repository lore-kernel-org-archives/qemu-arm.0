Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505744dyc;
        Thu, 3 Jul 2025 05:38:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1VAgIdeRx+jSe4e9TFYUHYqkTqURkVkEv7/2wcsGEiFtEcX6LWTXqOSnkXCQhzQ5/prCZ/4a3cCDpRg==@linaro.org
X-Google-Smtp-Source: AGHT+IECzAWGBi8yA3GmcLgPMc2GMloi9OB4wSmBF+t0H1ScZlZ7VxeD6sJv5NyUjEqFv/1sXeWT
X-Received: by 2002:a05:622a:48:b0:4a7:70a5:e726 with SMTP id d75a77b69052e-4a987dd1fedmr58871191cf.52.1751546339433;
        Thu, 03 Jul 2025 05:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546339; cv=none;
        d=google.com; s=arc-20240605;
        b=byl53Kg1Qts18jlvjoFbsrI1jBxxD/z5/I8ZggwYDRq0S4YZrgGXuP5NcMp5HjL2/b
         l8RtA7iyDNY+HloI8favgtt0YtvaL+jAAUjV4YlmuSnAkj6XML1IcIVHI58/VlsapoKy
         5VsUlJtvyRD7kKLJhREp2mtL5v829CEM4WErDxp1IyPsPdXDVlp6FNGwJUS71Ult33N2
         NB/h62m57jmx+G6ouzFoRKD2YObXUZS61vRh7aaqUAvhzEkgJpipmcW5FOTjTi29WbBE
         BcuvAqekZlchOLcJSEM/vY+vErlorDfkf0U0w/W6mQ6/oPGEWScTOwxPHVxB6wCQPxP3
         A9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hOnk6tUF8BEtgoK/DOmMaR/Km0pJrk/2ZiEFOx7CRQU=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=eFFkmuPh76ib4M+1WBQzy6+pm0g7TFoQH26aqKzsdwE7iVspCpngBnzsM2tWmzv+5u
         jUlSFJN2aNghxln6M4kyWQD6AYCKB61kyECldOKVsKy68G49cx8Gc0lkMzD8W2V0thAV
         GSTE9DPUMLpPerndlWPNburrpUDm5oDWIsZljZoDPnVue5Wpn3WB5bYrJdzQBISbKAQ5
         SLtJyijKYW+chFxkkYQZ40ztjniSjLwCq6ntm+XRazznd9Fr+tsfr8GmNcqmh65G+2bf
         WcKlQT3bJWBWVHtYx+92xNCocnQZXh87NkzYpU6vBJ2N7XXsAardwtDtLlA1uilj4tEg
         ybnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NBzjgKVZ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc100f51si153727051cf.66.2025.07.03.05.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NBzjgKVZ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOnk6tUF8BEtgoK/DOmMaR/Km0pJrk/2ZiEFOx7CRQU=;
	b=NBzjgKVZMjhFoTR8gTsfWbaq0xNV7a4aHLxVPaclMH+zrVlifhut3rU3QaxC7e3n1aUzCZ
	gPGB+XtWJAvZC6Ivh8zD3mMLr6+0BrwpQvUZ8YfPKvqQ9WDzZ/ZAHfMVSz3O+yiiVU8mr5
	JyLmZl0WFviTEmxotCBNwHUg91LjDZU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-k_7hvxCjNz29U4_dmSkw0Q-1; Thu,
 03 Jul 2025 08:38:57 -0400
X-MC-Unique: k_7hvxCjNz29U4_dmSkw0Q-1
X-Mimecast-MFC-AGG-ID: k_7hvxCjNz29U4_dmSkw0Q_1751546336
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 745AE1955EC7;
	Thu,  3 Jul 2025 12:38:56 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F25BE180045C;
	Thu,  3 Jul 2025 12:38:51 +0000 (UTC)
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
Subject: [PATCH v5 15/36] hw/i386/acpi-build: Use AcpiPciHpState::root in acpi_set_pci_info
Date: Thu,  3 Jul 2025 14:35:15 +0200
Message-ID: <20250703123728.414386-16-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: DU6GK/qPlM9K

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
index 2c76edeb15..2db2f16940 100644
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
