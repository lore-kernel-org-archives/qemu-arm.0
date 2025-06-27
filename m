Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787932dye;
        Fri, 27 Jun 2025 02:57:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdFyfAqwntBC4cXFuoRR8YO6vVLlYFMuK24a1OsCVve3JoVk4LWoqVBHJ2FzxOMVd9txNKubgbvzSXXA==@linaro.org
X-Google-Smtp-Source: AGHT+IEVi7O+wOAc2IIdc/2LKmbb903PjSj06JrYf8iML+xP/6RZVP2Rzoz29ahtV+0aOCrae6Od
X-Received: by 2002:a05:622a:494:b0:494:a4bc:3b4d with SMTP id d75a77b69052e-4a7fcd4252fmr46524521cf.18.1751018253376;
        Fri, 27 Jun 2025 02:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018253; cv=none;
        d=google.com; s=arc-20240605;
        b=hx5AHld+v6He0YJeeL/iH8BJYnACUqFLHBG8V8KOgqlNVWviMb5Lj2kkcDRfSbIQ95
         7v4ucCqH5m3+L+D9LoccShPi7XSTTSKVWTeHnEoq8ge18vqcpnUBFzJY18EJAb/30QlL
         +IoPcb7oxGnCoMwEJigA+AJMDsBrDzAla1WHj402vgmq/n9LmmFjHKuA9xe/zXnjJ2hB
         5WDuCix2gM6I9uzLRgCwGgD6dbzwlA8mcNR4EDMJP5nc2BI5MhVbR7nu/7W9V6s4tY+R
         8V8hBb4cW9CME7R/4Uz19eXIGWHVuECtrL9adzuekWydMJh2dXJjG3isS421x2BCj9Bq
         ZURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z0d4EBsGh9yLAxM81xOQFT7hz74YJDRbi5GdcA29b90=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=iHXesPdtDnWZGm3ZjCLpQgDw6sKsOTX4bAqCCLFL6dHCS0bIoRsC3cko1VByx/oDkq
         M0VJjkUJ/pbNEqgS1kFI6WSAIzSX8VGTMNNJIuDkF6yLawgsQae1TEPH+HWtII6xuThn
         xt37ls46dgKhonb73HT+/0ACzcAh0qUAPe2A5otKDrEQkDt0br1cJDdNWRV0oqsnmkYy
         wxojbgoYFzbq36p6zkqYN0nglVejn9FfQjCpzLmw20bNGStlGCpCdHD7jmsKHFjqlHz0
         E5qGYwFhr9TjEJZBc24h1yA2H7bZR+LnGg/QE2eRk29FC0VI+i7RyOVjnFSkoAl9Tyjm
         JNMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K3sbpSHG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc55a250si20273401cf.547.2025.06.27.02.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K3sbpSHG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0d4EBsGh9yLAxM81xOQFT7hz74YJDRbi5GdcA29b90=;
	b=K3sbpSHG0hHjc46BGP136XvBVBs9OBNYVkppzyWrQYGacA0JdBouzASBSjtau7GpD3/FQn
	h9KNXlbGHLFT4CKh3pLJfZR9zvNBc9rogmZyKBTCVSbyWRAfMEDXZZL71jlEKrgwZzGn+O
	eDdR+HQ91xUFPEofSByOmh+GYQ6nnxQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-5msgORy2OnCgjp2TMwRQvw-1; Fri,
 27 Jun 2025 05:57:31 -0400
X-MC-Unique: 5msgORy2OnCgjp2TMwRQvw-1
X-Mimecast-MFC-AGG-ID: 5msgORy2OnCgjp2TMwRQvw_1751018249
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88D52180135B;
	Fri, 27 Jun 2025 09:57:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A6FB19560A7;
	Fri, 27 Jun 2025 09:57:24 +0000 (UTC)
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
Subject: [PATCH v4 12/32] hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
Date: Fri, 27 Jun 2025 11:55:01 +0200
Message-ID: <20250627095620.3300028-13-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 6sBq3jV47xEO

On ARM we will put the operation regions in AML_SYSTEM_MEMORY.
So let's allow this configuration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 include/hw/acpi/pcihp.h | 3 ++-
 hw/acpi/pcihp.c         | 8 ++++----
 hw/i386/acpi-build.c    | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 8a46a414cc..253ac6e483 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -28,6 +28,7 @@
 #define HW_ACPI_PCIHP_H
 
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/hotplug.h"
 
 #define ACPI_PCIHP_IO_BASE_PROP "acpi-pcihp-io-base"
@@ -73,7 +74,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                          AcpiPciHpState *s, DeviceState *dev,
                                          Error **errp);
 
-void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
+void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr);
 void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
 void build_append_pcihp_resources(Aml *table,
                                   uint64_t io_addr, uint64_t io_len);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 47fa434a62..e3cc57b954 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -629,7 +629,7 @@ static Aml *aml_pci_pdsm(void)
     return method;
 }
 
-void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
+void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr)
 {
     Aml *scope;
     Aml *field;
@@ -638,21 +638,21 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     scope =  aml_scope("_SB.PCI0");
 
     aml_append(scope,
-        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr), 0x08));
+        aml_operation_region("PCST", rs, aml_int(pcihp_addr), 0x08));
     field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("PCIU", 32));
     aml_append(field, aml_named_field("PCID", 32));
     aml_append(scope, field);
 
     aml_append(scope,
-        aml_operation_region("SEJ", AML_SYSTEM_IO,
+        aml_operation_region("SEJ", rs,
                              aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0x04));
     field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("B0EJ", 32));
     aml_append(scope, field);
 
     aml_append(scope,
-        aml_operation_region("BNMR", AML_SYSTEM_IO,
+        aml_operation_region("BNMR", rs,
                              aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), 0x08));
     field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("BNUM", 32));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 52cef834ed..6ca2b34ef8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1172,7 +1172,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, sb_scope);
 
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
-            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
+            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_IO, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
     } else if (q35) {
@@ -1216,7 +1216,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, sb_scope);
 
         if (pm->pcihp_bridge_en) {
-            build_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
+            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_IO, pm->pcihp_io_base);
         }
         build_q35_pci0_int(dsdt);
     }
-- 
2.49.0
