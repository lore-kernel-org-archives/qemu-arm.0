Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506116dyc;
        Thu, 3 Jul 2025 05:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsX0KIgMkumQGEPvvzT3bO5IrQXtssc9baXdlwjQuh2DfswATxRlcSZCVjZ2nDGjuRPgabkSDBjR6RSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF4SDisgLFg2QPvUrX2AIKJ3n32XjbGyvWSx86RXsbfUMz+GTrv9V+BUmu1TqOKQME0Tdm2
X-Received: by 2002:a05:622a:5a14:b0:477:c04:b512 with SMTP id d75a77b69052e-4a9879ac38fmr55194441cf.16.1751546382959;
        Thu, 03 Jul 2025 05:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546382; cv=none;
        d=google.com; s=arc-20240605;
        b=SjJiOJjULFcjX5/nM2abl91ruvEQZ10QIDSJF8fEfKGyEqu5gSyFz3J1dfMhMwwy11
         oYSmlfbi6HdiDL3uulTg/f7Zifs1uU3jPhB4s5SgsHRJq5z6VN2iQu/0/f5twQo6g0Tm
         UDRHIpGpt1kN8xFAbPICR79ur2C5U2V+R6tbRbmiOrmorxEt8sBggItg42Jf8Bfj7A7v
         /vOrPRvS0GYPvA5D7ql9rtq2IZpVzvuNX2JKdq9lOeTZ/cPpP18Bwau/NBGPP/OOpw2h
         zP59N/96IFCugLH2zhXdkquZH+MV6gMxggMhM7hI2lIRsrRKKg7b/2ekABTvNpB/512L
         rAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/5nu6NuITo203ftGtrA2lpVLlTccJCwkIpBLYxqRRHk=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=X/BtRTg6Na+EoLT72sjhyrpZWLFUGCvhy6x5ZjJIM+YSuMwzrKophZ762GgVNAxFNj
         Ul4eZ2BGW7X6aegBTeuSyDzoEQ9xDVhMVJs+hzPQQwXwweOEsuwRAMP8k46pf8DDiI0S
         NJwmpGz2ffWMh4mUANC454/WbMwW/d5tfzxSEMbEnsMUBzPz77cUYCLi6CizPJwKC6d9
         ooflYEqgVur3upfMLoP9nG6deHaT9A0qxJOOPqjRHO79NgnPRmLuGoPhWuH/fiDxQ1KY
         i7cSwceWkILWS0SH1FoMhdPHE6o61p65iOrAoFHlHO9+0PrtvYPLsQBR9+v33OxP3xT/
         DhfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b3XBHozo;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0fec91si160151971cf.112.2025.07.03.05.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b3XBHozo;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5nu6NuITo203ftGtrA2lpVLlTccJCwkIpBLYxqRRHk=;
	b=b3XBHozoidYMQv9WntexxiunlS8xWlItsf/xHs5okjf0U8OTnlj/fDqmRunuTbY20pPKhU
	Bei1b0jHxQ0EE36la4wavVpHWv14R3PBavvJNJjKESFb14NR6SKS8h6x96Kda1YMeGRufw
	/IUWHHyMtok4fwvsu/YDYZ+AFmOw4Mc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-sa5SmMAUM1GPP3xwbw5XxQ-1; Thu,
 03 Jul 2025 08:39:39 -0400
X-MC-Unique: sa5SmMAUM1GPP3xwbw5XxQ-1
X-Mimecast-MFC-AGG-ID: sa5SmMAUM1GPP3xwbw5XxQ_1751546377
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E2D018002E4;
	Thu,  3 Jul 2025 12:39:37 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D637818046C7;
	Thu,  3 Jul 2025 12:39:32 +0000 (UTC)
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
Subject: [PATCH v5 23/36] hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI hotplug
Date: Thu,  3 Jul 2025 14:35:23 +0200
Message-ID: <20250703123728.414386-24-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: 4JV+xmiQaZz2

Modify the DSDT ACPI table to enable ACPI PCI hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---
v4 -> v5:
- protect the access to the ged property by an acpi_dev check

v3 -> v4:
- use property accessor
- removed ACPI_PCIHP_SIZE which is already in the header
- make addition of EDSM unconditional

v2 -> v3:
- use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
- use cihp_state->use_acpi_hotplug_bridge
---
 include/hw/acpi/pcihp.h  |  2 ++
 include/hw/arm/virt.h    |  1 +
 hw/acpi/pcihp.c          |  1 -
 hw/arm/virt-acpi-build.c | 17 +++++++++++++++++
 hw/arm/virt.c            |  2 ++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 5506a58862..9ff548650b 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -38,6 +38,8 @@
 #define ACPI_PCIHP_SEJ_BASE 0x8
 #define ACPI_PCIHP_BNMR_BASE 0x10
 
+#define ACPI_PCIHP_SIZE 0x0018
+
 typedef struct AcpiPciHpPciStatus {
     uint32_t up;
     uint32_t down;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a1b0f53d2..0ed2e6b732 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -79,6 +79,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_ACPI_PCIHP,
     VIRT_LOWMEMMAP_LAST,
 };
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 2db2f16940..f1594e664a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -43,7 +43,6 @@
 #include "qobject/qnum.h"
 #include "trace.h"
 
-#define ACPI_PCIHP_SIZE 0x0018
 #define PCI_UP_BASE 0x0000
 #define PCI_DOWN_BASE 0x0004
 #define PCI_EJ_BASE 0x0008
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1f936516b3..14eb775b0c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -946,6 +946,23 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_pcihp_slots(pci0_scope, vms->bus);
     }
 
+    if (vms->acpi_dev) {
+        bool acpi_pcihp;
+
+        acpi_pcihp = object_property_get_bool(OBJECT(vms->acpi_dev),
+                                              ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
+                                              NULL);
+
+        if (acpi_pcihp) {
+            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
+                                   memmap[VIRT_ACPI_PCIHP].base);
+            build_append_pcihp_resources(pci0_scope,
+                                         memmap[VIRT_ACPI_PCIHP].base,
+                                         memmap[VIRT_ACPI_PCIHP].size);
+
+            build_append_notification_callback(pci0_scope, vms->bus);
+        }
+    }
     aml_append(dsdt, pci0_scope);
 
     /* copy AML table into ACPI tables blob */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3bcdf92e2f..8024a0b6b3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -75,6 +75,7 @@
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
@@ -183,6 +184,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_ACPI_PCIHP] =         { 0x090c0000, ACPI_PCIHP_SIZE },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
-- 
2.49.0
