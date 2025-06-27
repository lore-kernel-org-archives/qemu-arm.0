Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788022dye;
        Fri, 27 Jun 2025 02:57:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb13KxPBApPnpOHPuNtSYzDODaco0nxBrC+kAFw1kRVtO3TJYLYsYti8VlMHnTa/izKVpa2Pz2Knk2nQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGA0zy25ECHhNKONTwbIARPBlL6VeFb6gjQDAUcVxEUy36ZPyxv9SFvwRd2Qnx2MlhjKWM6
X-Received: by 2002:a05:620a:3186:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d4439a167cmr371104585a.24.1751018272551;
        Fri, 27 Jun 2025 02:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018272; cv=none;
        d=google.com; s=arc-20240605;
        b=VvODB2FNGeH0lURZVFszr/q/2eA5Pun7nVkUCN6mAavMsMoq51hEMcgQ/SupRUBgX8
         FHUwIHlw1nOueWDLLzb6411GpjSRj2OAmZxO8Irrvd0AFd89ioWDpmZf7dOfMReSNcdN
         wWAr/4wJ332y7WOsEWoEzj9sFhcUxjGFaw7+xOUdK4pj2JmvHK6fXiN3StXw2hYGTpSO
         xAc7KLpf39TAZ5qk7Qv+b7jNyNm6qdAm34650Jq3yGWVwCph9lbTDgA//1H5SEdBuQ2v
         BLXTl1hkZsERD5MfKnQuNvJhLutVruLvJVENTncM3zhhc8VgpgnHwH7Lv9hcb//PakKq
         AzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9+8GAkiPine8poRsUoqF3A2krN4N1wc3Mc99P3g45t8=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=cbeo8k2A7iMJjvu7cE1Keu0Pst/hj6yN/AjWsi5yXaURSvQa7e+NZPUX67nvY+GuS7
         IE0wlAlCYZWwESSv24D/296C3R6dUy9G/HwKyu9Gd6f0uvOgtpMAvIdv6h7hQjDwu74P
         yY0G22bjhS+XuCjXZrbzp3MKlUEN4Eo0OcIMorFAw8WwGVeblqSjwuy/D9FscdNqBuxT
         YIn9Pw4mDHbMRQTo3EMdbkMzLpVGtro8+Oyub1IuZozZJFc3E6784fmyfHO/iXHpz4jc
         6+1kLpqC4L0LuiHBBS/Z5pR+PVGJ8DTTvEPEITpayyQCtQIb50l5ZOWOtRAcKsLs2jWP
         Hirw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnMs8SB9;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443225727si174613185a.280.2025.06.27.02.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnMs8SB9;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+8GAkiPine8poRsUoqF3A2krN4N1wc3Mc99P3g45t8=;
	b=GnMs8SB9/XRuqS/qQJmRH9eZwzqAdhfrBzOEYaYSCoIGYVA8tkbUx2nFjfyAmfCfACUeML
	2vCRAzPGD4flM4a5oqKpIbGPJ4oUPSDVm9v9mA6CnetXK4kPyWaGSOFYyeEQC4gotUhBQQ
	TertPEQB/Got1NdT38aKMM6cMjIT/R4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-P3VfHxhdMzG4xiv90zv1KQ-1; Fri,
 27 Jun 2025 05:57:50 -0400
X-MC-Unique: P3VfHxhdMzG4xiv90zv1KQ-1
X-Mimecast-MFC-AGG-ID: P3VfHxhdMzG4xiv90zv1KQ_1751018269
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C43018001D6;
	Fri, 27 Jun 2025 09:57:49 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E16FC19560A7;
	Fri, 27 Jun 2025 09:57:44 +0000 (UTC)
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
Subject: [PATCH v4 16/32] hw/i386/acpi-build: Move aml_pci_edsm to a generic place
Date: Fri, 27 Jun 2025 11:55:05 +0200
Message-ID: <20250627095620.3300028-17-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: VgyQmDCONfC7

Move aml_pci_edsm to pci-bridge.c since we want to reuse that for
ARM and acpi-index support. Also rename it into build_pci_bridge_edsm.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3->v4:
- renamed into build_pci_bridge_edsm() (Jonathan, Igor)

v2 -> v3:
- move to pci-bridge.c instead of pcihp.c (Igor)
---
 include/hw/acpi/pci.h |  1 +
 hw/acpi/pci-bridge.c  | 54 ++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c  | 57 ++-----------------------------------------
 3 files changed, 57 insertions(+), 55 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 69bae95eac..20b672575f 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -42,5 +42,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
 void build_srat_generic_affinity_structures(GArray *table_data);
 
 Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
+Aml *build_pci_bridge_edsm(void);
 
 #endif
diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
index 7baa7034a1..394a919479 100644
--- a/hw/acpi/pci-bridge.c
+++ b/hw/acpi/pci-bridge.c
@@ -35,3 +35,57 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
         }
     }
 }
+
+Aml *build_pci_bridge_edsm(void)
+{
+    Aml *method, *ifctx;
+    Aml *zero = aml_int(0);
+    Aml *func = aml_arg(2);
+    Aml *ret = aml_local(0);
+    Aml *aidx = aml_local(1);
+    Aml *params = aml_arg(4);
+
+    method = aml_method("EDSM", 5, AML_SERIALIZED);
+
+    /* get supported functions */
+    ifctx = aml_if(aml_equal(func, zero));
+    {
+        /* 1: have supported functions */
+        /* 7: support for function 7 */
+        const uint8_t caps = 1 | BIT(7);
+        build_append_pci_dsm_func0_common(ifctx, ret);
+        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
+        aml_append(ifctx, aml_return(ret));
+    }
+    aml_append(method, ifctx);
+
+    /* handle specific functions requests */
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
+     *        Operating Systems
+     */
+    ifctx = aml_if(aml_equal(func, aml_int(7)));
+    {
+       Aml *pkg = aml_package(2);
+       aml_append(pkg, zero);
+       /* optional, if not impl. should return null string */
+       aml_append(pkg, aml_string("%s", ""));
+       aml_append(ifctx, aml_store(pkg, ret));
+
+       /*
+        * IASL is fine when initializing Package with computational data,
+        * however it makes guest unhappy /it fails to process such AML/.
+        * So use runtime assignment to set acpi-index after initializer
+        * to make OSPM happy.
+        */
+       aml_append(ifctx,
+           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
+       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
+       aml_append(ifctx, aml_return(ret));
+    }
+    aml_append(method, ifctx);
+
+    return method;
+}
+
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fe8bc62c03..423c4959fe 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -338,59 +338,6 @@ build_facs(GArray *table_data)
     g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
-static Aml *aml_pci_edsm(void)
-{
-    Aml *method, *ifctx;
-    Aml *zero = aml_int(0);
-    Aml *func = aml_arg(2);
-    Aml *ret = aml_local(0);
-    Aml *aidx = aml_local(1);
-    Aml *params = aml_arg(4);
-
-    method = aml_method("EDSM", 5, AML_SERIALIZED);
-
-    /* get supported functions */
-    ifctx = aml_if(aml_equal(func, zero));
-    {
-        /* 1: have supported functions */
-        /* 7: support for function 7 */
-        const uint8_t caps = 1 | BIT(7);
-        build_append_pci_dsm_func0_common(ifctx, ret);
-        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
-        aml_append(ifctx, aml_return(ret));
-    }
-    aml_append(method, ifctx);
-
-    /* handle specific functions requests */
-    /*
-     * PCI Firmware Specification 3.1
-     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
-     *        Operating Systems
-     */
-    ifctx = aml_if(aml_equal(func, aml_int(7)));
-    {
-       Aml *pkg = aml_package(2);
-       aml_append(pkg, zero);
-       /* optional, if not impl. should return null string */
-       aml_append(pkg, aml_string("%s", ""));
-       aml_append(ifctx, aml_store(pkg, ret));
-
-       /*
-        * IASL is fine when initializing Package with computational data,
-        * however it makes guest unhappy /it fails to process such AML/.
-        * So use runtime assignment to set acpi-index after initializer
-        * to make OSPM happy.
-        */
-       aml_append(ifctx,
-           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
-       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
-       aml_append(ifctx, aml_return(ret));
-    }
-    aml_append(method, ifctx);
-
-    return method;
-}
-
 /*
  * build_prt - Define interrupt routing rules
  *
@@ -937,7 +884,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, aml_pci_edsm());
+        aml_append(dev, build_pci_bridge_edsm());
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -952,7 +899,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(dev, build_pci_host_bridge_osc_method(!pm->pcihp_bridge_en));
-        aml_append(dev, aml_pci_edsm());
+        aml_append(dev, build_pci_bridge_edsm());
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
             aml_append(sb_scope, build_q35_dram_controller(&mcfg));
-- 
2.49.0
