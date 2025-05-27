Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647679njc;
        Tue, 27 May 2025 00:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1J9QvnUgPzXglD6ZT33cS+SuWBrg58M/4fkNXLiKsfo+ipQs7kNkk1OXTtoF0yXIw1Uozx+QVBO8Ocw==@linaro.org
X-Google-Smtp-Source: AGHT+IHnQfMluHHfG9gCVeZU6Bo6cNsPcA1yqYpYhg310amOpnRZklE09CYpQKF2cFd0cXWtHjAA
X-Received: by 2002:a05:620a:2490:b0:7ca:f65b:c341 with SMTP id af79cd13be357-7ceecc42a54mr1737820085a.52.1748331779054;
        Tue, 27 May 2025 00:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331779; cv=none;
        d=google.com; s=arc-20240605;
        b=c9LIRgh7gblFaKQdgIwRshAmIo/PCbr+TvDD5FXLxOal5RyLeWlOUt/pyw1/0jvCDj
         aREr32wdXKJdvw0oH/oInwERvZoCmxkiQQSa8qt5Z6ppHG6ZZxN69rupbX3zWw6eu8Ib
         mSXzM5tirYzs3a5jPoujMLbH3Lq6hcNhaFhJ2ut+E4xmlNAGau+rQN0WO81Jk30ptStg
         1Heo50fnLbjivynQdFtRO6S4PgfPywci+BDpK0DFKwU2yCHrD/sfowMYBN4FfEyMwIXf
         +jp8iUtTnihufz/OYrQF+07Qjh0TeURZzz++FsolQ8a5QJrZJDlOeSXEMOUI03NXSSBv
         3+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=37bWn0/SLN7Et2zFWZ1hnl9+t8mUMekHwstaQlziV6U=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=OmBXFnWu4sckJYjfqiNpYlHSUvxaiKeYtfGD2snCv1kHe4nv8JOWv1etVzSVW1gV7R
         DuVDmzbzfP2O/eqPVMUFTL8sQTBgd8htst3+4/died0Twm/GjFfWUC4ABr88ZPkmztcu
         jVqLUAWrxMJuw69bZwEok4NiQWLSxewlEFYbRh6iZLmXKuTQEK7PjzDnzK8tzONDri29
         Nv9Cq0EB4DBQmVxPglQizcsYNxBXjLfuheio3uhLXGJDsrMX8vl3J0BfukYj8aU2smOW
         Pe8qoXHIiNcdlP2t+7t1BuW/b5FO85BJh5L03/uuGYcHbd9H5ti7FgtoziuS5zeAh2cI
         7BMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=buR5J3QT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467cecf0si2749743385a.73.2025.05.27.00.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=buR5J3QT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37bWn0/SLN7Et2zFWZ1hnl9+t8mUMekHwstaQlziV6U=;
	b=buR5J3QTo0O4m41EsJVLK6CLUWivy1lIwhNpqIJYKIMA9KJs5P1hNfQDxTI+FYqS2/FhE4
	0r0TKYuYg2sna8zOy9y8oOM6if1EgecSwup4HNO7yND2BSqEf5uY0V7LFHEJHNBmu2EHvl
	Nt1JByN8cvrO2UXtfNk/32movRgj15o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-8eFqjZLAPF-SdjJYX95GYw-1; Tue,
 27 May 2025 03:42:55 -0400
X-MC-Unique: 8eFqjZLAPF-SdjJYX95GYw-1
X-Mimecast-MFC-AGG-ID: 8eFqjZLAPF-SdjJYX95GYw_1748331773
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C14B1955D83;
	Tue, 27 May 2025 07:42:53 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 28DE719560AA;
	Tue, 27 May 2025 07:42:48 +0000 (UTC)
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
Subject: [PATCH v2 04/25] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_dsdt_add_pci_osc
Date: Tue, 27 May 2025 09:40:06 +0200
Message-ID: <20250527074224.1197793-5-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: hyZjkjrK/n5o

Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
native pci hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

---

rfc -> v1:
- updated the "Allow OS control for all 5 features" comment
---
 hw/pci-host/gpex-acpi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 0aba47c71c..f34b7cf25e 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
     }
 }
 
-static void acpi_dsdt_add_pci_osc(Aml *dev)
+static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
 {
     Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
 
@@ -77,11 +77,12 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
 
     /*
-     * Allow OS control for all 5 features:
-     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
+     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
+     * and PCIeHotplug depending on enable_native_pcie_hotplug
      */
-    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
-                              aml_name("CTRL")));
+    aml_append(ifctx, aml_and(aml_name("CTRL"),
+               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
+               aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
     aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
@@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             if (is_cxl) {
                 build_cxl_osc_method(dev);
             } else {
-                acpi_dsdt_add_pci_osc(dev);
+                acpi_dsdt_add_pci_osc(dev, true);
             }
 
             aml_append(scope, dev);
@@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
-    acpi_dsdt_add_pci_osc(dev);
+    acpi_dsdt_add_pci_osc(dev, true);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
2.49.0
