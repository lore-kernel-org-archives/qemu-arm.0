Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506031dyc;
        Thu, 3 Jul 2025 05:39:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNcoDYrGgFeTVLnjn+PzCb9EH/dNXCBXtd2Bfvvwi4SehLdNXLzLXkyRR9nzLtpCMgThP5aGJMYas51g==@linaro.org
X-Google-Smtp-Source: AGHT+IEbGuCRSbjlGcC3qzysONVC5Gv/e6XLL01sxTS5MxfHQ16GUM74CNVFeI+7dNH39vk0+CfD
X-Received: by 2002:a05:6214:4115:b0:6fd:4cd1:c79a with SMTP id 6a1803df08f44-702b1bada07mr104979796d6.21.1751546372022;
        Thu, 03 Jul 2025 05:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546372; cv=none;
        d=google.com; s=arc-20240605;
        b=FjRVI8Hxg6R7AnKXb5++13buzT6tHS8ZDhYAZ/cT0shQ0c6eBPz/DBa6c2czsmgY9d
         3Hj/3fa1nE3Z49iRKHRFc412ylPf5VIix4tXZeAnhvdIXCLnRi+5RgBYuCZrcnRIJ/H+
         0rjjFO8QHkxlD+qtgfnJg/EWvSLvbRlU1kJ5dFdyj18JZoLIVOvYZ8I9aA8pxdMYUmGs
         cNLIxkxD5CVYnD9+h/u3OY2LZvPdgd97b8jl7LEW8jbNFZjjx78yDXvSVMDNiHNgz8L1
         k8TJd/7cRXLH+2iRjB42gL4Z9u4I064rYpdzM7yzErE7NkqW9+TyLHptQAZnAvKfIUa/
         3QXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tqA+v6tJHBLnHTdB7lMACLjlNY5Gob3m5qkFago+Q9w=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=BFLF38NW1cp6gj87m6AiP5j8wUEEvOazBHrlvsRKGgmr3JSp7yd8wkMLEfA7K8wjfV
         tsgKk3zpaWR1uzIJLVG/ct4r0mgpTC5VwC1x6wSGoldgluLlV8vRJA/bTaocwcLDXjPp
         gYJz7G0ec82pEDiQXDYpngvqrwIxe3QdrAs13XAhwglmFPpnDLlzsny179kAz2NPWmR9
         X4TZ1Ygb/jes4Tw5v5HXNPr6KKRbf0RLrJVe3wkyn1ot52tpOsW3XcVGmRwu6CuUfDxc
         Mz5LiQPaWzrPFwdV0BP0UgyEDXmzAWi5HC54k3co+YKvvmFubI0qMFiLrrcgoZeELvjT
         hNqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BF215Afl;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773547cbsi167343136d6.195.2025.07.03.05.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BF215Afl;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqA+v6tJHBLnHTdB7lMACLjlNY5Gob3m5qkFago+Q9w=;
	b=BF215Afl7VHmDajqXzv3lAJ6Pj5fAMhkYa6scpFKf40tYVJLQ6KbBCwf/pUiwjuHhxvOXm
	KTOi62LecjVky+lU6OQYO+4buE/IPZHD31Q131hVpPCdL5xo+z4y5z8jgPrZVhwKXu95Ay
	e+febpOCWVp6Vr4OlDXWZg6AM+8qP3I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-1kmE7PvZMZ2Dz1eNpcU0nA-1; Thu,
 03 Jul 2025 08:39:28 -0400
X-MC-Unique: 1kmE7PvZMZ2Dz1eNpcU0nA-1
X-Mimecast-MFC-AGG-ID: 1kmE7PvZMZ2Dz1eNpcU0nA_1751546367
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F21F180028A;
	Thu,  3 Jul 2025 12:39:27 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B67E180045C;
	Thu,  3 Jul 2025 12:39:22 +0000 (UTC)
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
Subject: [PATCH v5 21/36] hw/arm/virt-acpi-build: Let non hotplug ports support static acpi-index
Date: Thu,  3 Jul 2025 14:35:21 +0200
Message-ID: <20250703123728.414386-22-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: zckf7p8rv7Sk

hw/arm/virt-acpi-build: Let non hotplug ports support static acpi-index

Add the requested ACPI bits requested to support static acpi-index
for non hotplug ports.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/virt-acpi-build.c | 12 ++++++++++++
 hw/arm/Kconfig           |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a2f31be9ec..1f936516b3 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -34,6 +34,7 @@
 #include "hw/core/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/nvram/fw_cfg_acpi.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/aml-build.h"
@@ -883,6 +884,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const int *irqmap = vms->irqmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
+    Aml *pci0_scope;
 
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
@@ -936,6 +938,16 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
+    pci0_scope = aml_scope("\\_SB.PCI0");
+
+    aml_append(pci0_scope, build_pci_bridge_edsm());
+    build_append_pci_bus_devices(pci0_scope, vms->bus);
+    if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pcihp_slots(pci0_scope, vms->bus);
+    }
+
+    aml_append(dsdt, pci0_scope);
+
     /* copy AML table into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f543d944c3..dee4d6dd25 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,6 +34,8 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select ACPI_PCIHP
+    select ACPI_PCI_BRIDGE
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-- 
2.49.0
