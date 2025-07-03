Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505621dyc;
        Thu, 3 Jul 2025 05:38:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhGVvp/YDURM8WFTxca+Yna2NH35OscQ75BwMvaU5EKfngoOZ1YKwZgM+i7eXE8nnepfud5jy81pvMow==@linaro.org
X-Google-Smtp-Source: AGHT+IFEhgg707SDYXh3YecZnwQhN6kJ8kcRv5euCOQo9NRRprARq5bnr6y8TTfexnuNOj3cznXG
X-Received: by 2002:a05:622a:647:b0:4a4:3171:b942 with SMTP id d75a77b69052e-4a9769de55bmr99800751cf.39.1751546326203;
        Thu, 03 Jul 2025 05:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546326; cv=none;
        d=google.com; s=arc-20240605;
        b=fDfNZ1kWqm9Sf1QzYeHin0VMh+eW0HzI9TDB7Eb4vpzmcY1cr/OwAp3jpAxdcsEoJr
         yQ2k7wOnToCKb7fAIIexi8+Uvzuc7imGXzXkqXE0CZKr7tZFQFVIxKo/J9bLAptGlVaA
         9fITsZbJ25sFUJd2x0OzrLP1qGDcuD1HPGw9qKxNxreRMa7aNwl9rATfTm/ejlqpAo4E
         590vzMfCNry/XJ01M2mLRLECHGtbze+tvk89KIX4sr8go744yoQP00m2pZykYals4sTv
         3Gh7VnVoQKcOQsQ1YZZWj1PEwIyp2x685R8lK46IypaqOP1OweXlfmx7ElrcWNOzwriY
         EjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H3fa12TY/f55VQnI/Dh+1OePIbeK5d4tWXn6dIz6gWs=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=bD0M6Pey/m/TF77mZYD8c+MYVB+FJEh78Osqac4Li1DLXvJVb213Gv4tDBvsg9Av8u
         GrYftwYl1zeS74f71sfWPzxfzlSpWUdxVpoXn7jgK65n/IoOFd+pK2dAVVm7DY19GjC5
         rWnJ4hH8OZimFP/V/h9pfRvPMZ5oCmRH6Gc3mjvnYBiN7B+1bz153QheASPchjQG7Ub3
         VJQIb6NqOSv5+11rAEgCd8jtC5nv2G+8qsEoQizplzT7g0V8XNm7ESr0E4zQ7tjgxOta
         jLq3zzL0xd1kWs6LUmVjKts88YcYr3yZfwwEXXz+R1sy741bRJpwntcaI0WgYNx+L5/x
         hPnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ir+MU3+q;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0ff776si154558161cf.32.2025.07.03.05.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ir+MU3+q;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3fa12TY/f55VQnI/Dh+1OePIbeK5d4tWXn6dIz6gWs=;
	b=ir+MU3+q3U0fXAN7pXOqH00SvjcjJ9QtmIxWJRLf00gD8FZ7bSWT2haKV8WeDx+bbISpsN
	BQ//+KvIL2epEtLoWctDc7DGSNqkoQZ57yF1vP+8xRxYyHAk0uQkRIFVR09Q4EHXJxcQlg
	CqmACHBCNzWpEPotFv0XDKPK/kwjJNc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-2VBw-W0vNa-Nae--3fvq6w-1; Thu,
 03 Jul 2025 08:38:42 -0400
X-MC-Unique: 2VBw-W0vNa-Nae--3fvq6w-1
X-Mimecast-MFC-AGG-ID: 2VBw-W0vNa-Nae--3fvq6w_1751546321
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41C7519560B9;
	Thu,  3 Jul 2025 12:38:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E39A1803AFF;
	Thu,  3 Jul 2025 12:38:36 +0000 (UTC)
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
Subject: [PATCH v5 12/36] hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
Date: Thu,  3 Jul 2025 14:35:12 +0200
Message-ID: <20250703123728.414386-13-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: z9gVTYxMpxi2

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
index 5ca36c8619..afa3ec5f4d 100644
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
