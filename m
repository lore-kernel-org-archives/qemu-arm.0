Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505529dyc;
        Thu, 3 Jul 2025 05:38:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFtYe+Blvr8ecDECG3EhsDnUlF2fO8kwq4unTSPMiw8TbnYMSRKvIDxWpSJUThJQVr7z2OBeLCXtrw2w==@linaro.org
X-Google-Smtp-Source: AGHT+IEkzlkJfRM55LGgLDypUX8uFeB1PbqQJr8JkfZp+OY8q/IX04M5kUKlRz/GEQJ6tKj/QRAg
X-Received: by 2002:a05:620a:6083:b0:7d3:8f51:e80c with SMTP id af79cd13be357-7d5c4733828mr1122895885a.22.1751546315167;
        Thu, 03 Jul 2025 05:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546315; cv=none;
        d=google.com; s=arc-20240605;
        b=gwirkByWIKcvY6wjDBMIc12M6ZY42pSTAKsk3a7ekH4WtVoAMSuAmVrlwYrqZeulsW
         FWXrQ6Lj5LmHa5YzxHDFEYy/5hysYuJLjdIB8+eacUNsfjzqh74LN6bqMas+cqVebz5w
         omLBTHxoBxG2LoSiPW3MgSXGBE6KwQV+DL3Q88OmUIIpS0fmb++I6mkzMwpag+nxX+eQ
         g5Kh9Fo8PNBcKA7RtdgqP7K0v4tsb5yK4x4G1+kxiElhFMsZ6S3wvxDWujy1xCcSKUNm
         z9FToMPgEegzvOeRVT0Y416V/ceZIviOtzCNJafsuEN8LfHiHHBdEI1z5BTCdXTD2USo
         ksKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QM187LTqh66mz9nDTkv5Uwarxaf5Ee/ezdUTTwFgH/4=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=K1w41pwky9yCKp7+ZgY6cuM4zpdBpUYT0UiLws2SNFfTmQTQBBBW0jLzm4W/j4/kqb
         M/ui6TYjr4vqP6aHdAiBTeBt9SOcDoYMRQY7keP7lSWurq/GdNEltV66wvqcW2rdicX0
         N7KRVE4KESDugFc2rrWGMLFZ6D77aXfFANxEtnihcK1qLyJw8n84VSh8QJF4KfaGPTaV
         b9zifAAeq5RmLxH044/OLAQKVHe+BvBIgrSttRraOmxZCp4FpWj+q7jp823COkeUIbBN
         1nzw53mQwGzY7ZZigT8tO28ahv5NoRjoi2hTpGUqJryK4kOPoV2sqEDHCcTtqXZuTy1J
         Gkng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VkDTc32F;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443295366si1483199285a.555.2025.07.03.05.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VkDTc32F;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QM187LTqh66mz9nDTkv5Uwarxaf5Ee/ezdUTTwFgH/4=;
	b=VkDTc32Fi7omNZAr4ri1kLHKqUPoRNkOHSXeHv1TWQcPsoA2teL8UWUpRUYnVV8JpW/VLe
	/8Uvu1Rg9ETbFkSxqk1FY6nKh8FctJgQWsxBzclh6KzkNlYJPtKDxUuxkUuHtJRnD+CPQE
	o9RPaFnsbYJe0/JagzbOpMXco4Pn+8k=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-zC0u4U4qOj-as6m25fvHyA-1; Thu,
 03 Jul 2025 08:38:26 -0400
X-MC-Unique: zC0u4U4qOj-as6m25fvHyA-1
X-Mimecast-MFC-AGG-ID: zC0u4U4qOj-as6m25fvHyA_1751546299
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF8031956061;
	Thu,  3 Jul 2025 12:38:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D341B18046C3;
	Thu,  3 Jul 2025 12:38:14 +0000 (UTC)
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
Subject: [PATCH v5 08/36] hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
Date: Thu,  3 Jul 2025 14:35:08 +0200
Message-ID: <20250703123728.414386-9-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: D8ClVxltH9vy

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
