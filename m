Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787822dye;
        Fri, 27 Jun 2025 02:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYs60i48hrvng0pYy4ADK5X9uF02Qbxhnn3UzrByvluT2+HMW6LeQa2VJ7ZSE8RTD+8/z9yQ7/aQUIcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHoIoM6C5ya5T/NvfXgWxFZYbMY5auhI9f3WSUmgFmE0K6zDYb9pnuAbMhGvRisf2Nzc1pR
X-Received: by 2002:a05:620a:1714:b0:7d3:f8b8:b1ce with SMTP id af79cd13be357-7d4441b3c5cmr300581685a.27.1751018234731;
        Fri, 27 Jun 2025 02:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018234; cv=none;
        d=google.com; s=arc-20240605;
        b=HJGO+FvReYK53XmvnUaltDHEXvF3O17kmoRMQ/6HhbimxUosHH4UVRo1vutpx48umT
         umzg6XV3zCo7rj5SgOi2MGH3aAoPS1Va+oVBOI+UCZ9AWm/0jGfwggKpUwzda1RaSFdY
         KximtXtp06duEpgAA0sj/ONabm1yVrYkX7TYcwtIEAaMyIx/hhn9A7Z+Uz0nfG2Rt2lP
         DZ37mokl8GVxuC3P7mKIPLBM2SKyMg26i0/n5ocH/79JR/2qcuCIetGRfeVItEtIaBLi
         T+CoNncd56B76XI/Tgrqs6czENUUxCy5mXyC8ak4BfWLGyEp3I1fWG5wlXFAxJ9LkiUT
         cIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QM187LTqh66mz9nDTkv5Uwarxaf5Ee/ezdUTTwFgH/4=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=YknSs2zXWVbLnMXsEKQcsCCifb0OUTd1mI3+DPL4Ic4PJ88yFrQcoR/gOM7tj7kGr1
         iW1kMUdApZKpzNRZmPbbc0qLhseIbiCsOe6r3m4CGQSdEUWhV2RARn5H88ybNUixfH9K
         arQORE88onfoETOrFguziGMQW+iLgbLBIo9pLwAsugzzZcgOf7VYvGesyJvJsB7/DCkM
         n+KH92bScDccwzRVtoTjE/36I6QOKiVDZS7AgVYtiCPsED5BlkYFsybA9R6BFDD4In17
         MBwBaPEZRuMKavKo8B94RubW0AGYo3C1Ic/EqEreZb1OvLebSIDh2OOJs8XJ26ucsyKJ
         vCGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MryWx4C+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443280037si190949685a.500.2025.06.27.02.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MryWx4C+;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QM187LTqh66mz9nDTkv5Uwarxaf5Ee/ezdUTTwFgH/4=;
	b=MryWx4C+JYVzqYpeHCGG+8LIE/G64sGW4V6pQG3uw3gBJe+UUS9eca+DFqLiqwAwub4AOc
	pCvrh5K/+vZpaN9FxgM2gl/xfcwXXL/pl4Q9LHu8mgmLE//7B//mb8roTMKUYCZ4N7Cj4Y
	ACzIn4OctYeQRm9uROTE1htSaJNMfHw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-lLVume7zNZOBJEgkKHu6Rw-1; Fri,
 27 Jun 2025 05:57:10 -0400
X-MC-Unique: lLVume7zNZOBJEgkKHu6Rw-1
X-Mimecast-MFC-AGG-ID: lLVume7zNZOBJEgkKHu6Rw_1751018229
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 363D5195FCC2;
	Fri, 27 Jun 2025 09:57:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB4D719560AB;
	Fri, 27 Jun 2025 09:57:04 +0000 (UTC)
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
Subject: [PATCH v4 08/32] hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
Date: Fri, 27 Jun 2025 11:54:57 +0200
Message-ID: <20250627095620.3300028-9-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: Q65TJYnaiO3k

GPEX acpi_dsdt_add_pci_osc() does basically the same as
build_q35_osc_method().

Rename build_q35_osc_method() into build_pci_host_bridge_osc_method()
and move it into hw/acpi/pci.c. In a subsequent patch we will
use this later in place of acpi_dsdt_add_pci_osc().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

v2 -> v3:
- move to hw/acpi/pci.c instead of aml-build.c (Igor)
---
 include/hw/acpi/pci.h |  2 ++
 hw/acpi/pci.c         | 50 +++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c  | 54 ++-----------------------------------------
 3 files changed, 54 insertions(+), 52 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index ab0187a894..8a328b580c 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -42,4 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
 
 void build_srat_generic_affinity_structures(GArray *table_data);
 
+Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
+
 #endif
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index d511a85029..2228f1245e 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -301,3 +301,53 @@ void build_srat_generic_affinity_structures(GArray *table_data)
     object_child_foreach_recursive(object_get_root(), build_acpi_generic_port,
                                    table_data);
 }
+
+Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug)
+{
+    Aml *if_ctx;
+    Aml *if_ctx2;
+    Aml *else_ctx;
+    Aml *method;
+    Aml *a_cwd1 = aml_name("CDW1");
+    Aml *a_ctrl = aml_local(0);
+
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    if_ctx = aml_if(aml_equal(
+        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+
+    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
+
+    /*
+     * Always allow native PME, AER (no dependencies)
+     * Allow SHPC (PCI bridges can have SHPC controller)
+     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
+     */
+    aml_append(if_ctx, aml_and(a_ctrl,
+        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
+    /* Unknown revision */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
+    /* Capabilities bits were masked */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    /* Update DWORD3 in the buffer */
+    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
+    aml_append(method, if_ctx);
+
+    else_ctx = aml_else();
+    /* Unrecognized UUID */
+    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
+    aml_append(method, else_ctx);
+
+    aml_append(method, aml_return(aml_arg(3)));
+    return method;
+}
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f8572eebe..91945f716c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1111,56 +1111,6 @@ static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
     return dev;
 }
 
-static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
-{
-    Aml *if_ctx;
-    Aml *if_ctx2;
-    Aml *else_ctx;
-    Aml *method;
-    Aml *a_cwd1 = aml_name("CDW1");
-    Aml *a_ctrl = aml_local(0);
-
-    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
-    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
-
-    if_ctx = aml_if(aml_equal(
-        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-
-    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
-
-    /*
-     * Always allow native PME, AER (no dependencies)
-     * Allow SHPC (PCI bridges can have SHPC controller)
-     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
-     */
-    aml_append(if_ctx, aml_and(a_ctrl,
-        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
-    /* Unknown revision */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
-    /* Capabilities bits were masked */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    /* Update DWORD3 in the buffer */
-    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
-    aml_append(method, if_ctx);
-
-    else_ctx = aml_else();
-    /* Unrecognized UUID */
-    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
-    aml_append(method, else_ctx);
-
-    aml_append(method, aml_return(aml_arg(3)));
-    return method;
-}
-
 static void build_acpi0017(Aml *table)
 {
     Aml *dev, *scope, *method;
@@ -1231,7 +1181,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
+        aml_append(dev, build_pci_host_bridge_osc_method(!pm->pcihp_bridge_en));
         aml_append(dev, aml_pci_edsm());
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
@@ -1353,7 +1303,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
 
                 /* Expander bridges do not have ACPI PCI Hot-plug enabled */
-                aml_append(dev, build_q35_osc_method(true));
+                aml_append(dev, build_pci_host_bridge_osc_method(true));
             } else {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
-- 
2.49.0
