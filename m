Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741113njc;
        Mon, 16 Jun 2025 02:50:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUY9jltGeU0BCv2KlEz57txBkkFJ03EAYR9B3zFHN1+iprrU0DNQ2PbesVwNSqbjg4kA4F11aU/Q5Mj/g==@linaro.org
X-Google-Smtp-Source: AGHT+IH4FQ+KvZh3TAqpu74DacmR5CbSQGxIlY7MJUaK36XnaljRV/lCa+pg4xLAkFIz7pBIl5iU
X-Received: by 2002:a05:6214:76b:b0:6f5:40a5:e07b with SMTP id 6a1803df08f44-6fb47774638mr122698676d6.26.1750067423058;
        Mon, 16 Jun 2025 02:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067423; cv=none;
        d=google.com; s=arc-20240605;
        b=AcL2zWiZv7KT3/6VtjfwcZ4NIJ6EvG3OkgStowY19VWcflHrmCh+flbAKEQjOFW+F8
         9dv9DfcUx5IS38Ude06AzNmcCQ3/uP8eVaUn+5+7uZ1AAv4wC+nfid8bq6QCsKHuZKC0
         ZWHewQa9eKNkq2RhWBs+ZRrQsJ70EQBTeR0hWQSRQVP8ZyEjJnnM4WOS80KKBYsYnbts
         zcaWZJAwZG8bEnw16aW8G8SYuuT4F2wGT9tPdTXv2TgX9k+SN+cTfT6qyjQvM+6uNLw5
         MpUF0QvxE6BXWrAtvnupjPC7FX4hjVlSS3p0iKrvMDCP2l/T5z8AbIbyAeDv85hXD9GK
         iugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z0d4EBsGh9yLAxM81xOQFT7hz74YJDRbi5GdcA29b90=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Zyg18zjRGt9EpRKooZNongNahLEQ+tZTS2SIaP14iS/KPdfeW+ETgx2f8xW6d+gU6+
         a7GJBywiDn8IlomSXOBRhmwIFOZoRWZOh1EpyzrQEr5wRy7R00yt+iDyQkBhpm1wzPXk
         pk6Tmpv1BkPcYPFez0hUWlR7apbNiObE4Tixe6x1Z5uhFp/3x9ev7uEPRVD/OCxdSf50
         h+0R9XOtUNJLt5hN8paoFN0+k93yjL1GNZld/5M/vhPJTWsoCcRHWHA09ia47AFc7b93
         JxbFLhBqEAk4/mVROKZ5uC+C26atCKth5ICu9zrEUM2JOInulfTsYm7rKn0+hlev9TYd
         pbDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oz5Zm2Bz;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb367ef2e9si106175316d6.409.2025.06.16.02.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oz5Zm2Bz;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0d4EBsGh9yLAxM81xOQFT7hz74YJDRbi5GdcA29b90=;
	b=Oz5Zm2BzgVhfltyOKtKZTR9zKwZNkNSSe7pCv2b8hgKHiM5aNWI3hsppHcHC3/3KM4nqf8
	TZ7uNd7wXc0xo3XtpicBCaAwPKNES/wJyS8zxY+cvQA6SkO4DagKZ/yozFToXCPk3zMiyl
	1M5H7ygQdM600dNTEfSiY1Lv2PsA1TI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-r4ZJO8ZgPziig40KvweatA-1; Mon,
 16 Jun 2025 05:50:20 -0400
X-MC-Unique: r4ZJO8ZgPziig40KvweatA-1
X-Mimecast-MFC-AGG-ID: r4ZJO8ZgPziig40KvweatA_1750067418
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BED7F195608E;
	Mon, 16 Jun 2025 09:50:18 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37BB819560A3;
	Mon, 16 Jun 2025 09:50:13 +0000 (UTC)
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
Subject: [PATCH v3 12/29] hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
Date: Mon, 16 Jun 2025 11:46:41 +0200
Message-ID: <20250616094903.885753-13-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: elxdiG7rgYyY

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
