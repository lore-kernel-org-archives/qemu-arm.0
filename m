Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647933njc;
        Tue, 27 May 2025 00:43:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRvF313SheOUUl8syw89CCqmTFbQ4s8pnceeUTZPsNJcM0emVwxpvuICbtQVNu9urc6ZiMcfhW96AKXw==@linaro.org
X-Google-Smtp-Source: AGHT+IG7Qk388grRgr8H9W3XDZTKctVOfZx1LHkrtNFrPhokHmRefO3yY4TtyHr9odx795n8nxwf
X-Received: by 2002:a05:6214:5198:b0:6e6:9ce0:da9d with SMTP id 6a1803df08f44-6fa9d281d3dmr200624356d6.27.1748331820205;
        Tue, 27 May 2025 00:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331820; cv=none;
        d=google.com; s=arc-20240605;
        b=YWbwhv4QHEC8v2LAjvN+ej7jq2Pbu/8UO12zvKo8vF4gJzI+/V1YMi3JJKFGGvZ3He
         1Jzpqda0JqEpJNY5w2JYYCvPg7y1qVkDFiKq0ZQv2FvgDbrNvRDOGKGhiL6dPXk085Ws
         g+afeGtbE7PMgM9BvGbpU75eijiOA3Zm/5bPKrPH6AvE9eP1y1aD7Eq4JP0iVoq+qsyq
         5lkcmnvnhnt/XJp5/sEEWYqj/Vw1ysDoOVbDrSlNarUxHBTT1xT8gw5K1XrHj47XjFT4
         g74x6LNQfQgHWaLTQV1dQQoK6vw54blFHpmzcLCqoh5HzPMZ6mOOSMHByDTBjKDVGbus
         tmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vMSgofgCE+VcPss0DzIHHjdmMWLhciz8z9cCLm0j50s=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=X/IHDLcOjgheYrwhIeaM80TbGS3sw0cWv0j4vTpINl/IRtXZ2wXvxNaHAGHEAe5kLR
         kFg82w6rA7CzwbMnyNFBAT6Nfru5NfE0i954pjwikRLZsL21n/2zxkFDdlPEp2kjxGiw
         6crsEw3hqEqUBpjc5wlIIK66p2R2h7vLEMnpHDPmlWtcS6SdBKG8sFov1CfNuBOuhKIN
         m0GRRWk5an8bSrSXpKx61Fq0vdI1eNNMB5Xd4FSAqDFf5WbAMS2bTRFtX1q7c3TRDzhL
         K+aWvelBTKjUSc01hEu+mxw4nvK/1OiPonFHdMb5btXE1Tc3r9BgFvNmJfmIaoeOLH1v
         Zo7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KdxdhSfF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b300233asi265587066d6.439.2025.05.27.00.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KdxdhSfF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMSgofgCE+VcPss0DzIHHjdmMWLhciz8z9cCLm0j50s=;
	b=KdxdhSfFnmBu39KHwUWIkhlKLkk9+z96e8EBhQ6NZE0mY9yg4Ho4Azyd2r9AjQYqsBSho/
	CgJdBx43/oxAdkDr8V/D+rYH9SsTw3N0MymgCz6ZvlWQ0dlhNXMEH67y4neozTnx63s+v6
	6Ui3r31Rtaq3cpZEj7JnKxwGc59/MJI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-423-llkJuuDdO7aV5RJfbxiY7Q-1; Tue,
 27 May 2025 03:43:35 -0400
X-MC-Unique: llkJuuDdO7aV5RJfbxiY7Q-1
X-Mimecast-MFC-AGG-ID: llkJuuDdO7aV5RJfbxiY7Q_1748331814
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E39D180048E;
	Tue, 27 May 2025 07:43:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A05A01944DFF;
	Tue, 27 May 2025 07:43:29 +0000 (UTC)
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
Subject: [PATCH v2 12/25] hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
Date: Tue, 27 May 2025 09:40:14 +0200
Message-ID: <20250527074224.1197793-13-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: //qiuNSQ1ZY0

On ARM we will put the operation regions in AML_SYSTEM_MEMORY.
So let's allow this configuration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
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
index fb54c31f77..310a5c54bd 100644
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
