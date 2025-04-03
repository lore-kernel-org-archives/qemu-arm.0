Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185742njd;
        Thu, 3 Apr 2025 08:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvmLEhAfEkaBBeijU6C1V7b9rgYtjB1ZCgDyjYwqCBGIx0UROYPf56ZKgZ6x7PB/kJNvKwLgOrAzlRxw==@linaro.org
X-Received: by 2002:a05:600c:4e10:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-43ec44387eemr25448275e9.21.1743693590458;
        Thu, 03 Apr 2025 08:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693590; cv=none;
        d=google.com; s=arc-20240605;
        b=Np9wp/MnPQS4BJRll0WgAz9eJinArdXL+6dD0yR1alLH4bJOdhapbNK8uq12l7H0Yw
         ohEpeGvOYfj0Ag1x0xi5kZ/mqthMPjZpSPY3UpCmkiXZk4wO05bVuR5k7SL1yxOJtReN
         RD8wYwF2OyIr9ay6QlnaM4W4qeuewI+u48NCgpNVdmCD0u//C5l+YIiyroE/gnTivsrh
         gVOJDIGME3iyQO2Hw6H9qrqDjTZXnaHFQBhxMWo4iA2KDHpnwUu0tK3ne16MXZGh8bhq
         XzLg7Ze0z8xly1ZoRH3U2wve83Gtmk+jgPS+mTXEXq5206Zh3st6emCVuF7sqAEJYvT0
         /ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AzIe1y6exrD0xJczT8npcuq1OBfi7eudR1jNiJ2MiPM=;
        fh=RCzTRwLywJzglP+yMPmQzaFjJydqLyMdC3KgFly51As=;
        b=PRWU5sL4A9xGSpKWjHdHkT7U7sKT9k7Vef5JOU2UVuw4gKbh+xK3piToshgpb2oBhy
         QaZJIblzg6aJ8fEJbj4vu/osOQ0z/rkVjAcMcwA2pz8DZtRFaIa5M9hFHkDBbV9PeOzX
         bBBT9UhR1PB+139Exe7RwLvRFFbT+CgFpJ6zWF1v1lLKDEZ9HdtglrC10DWDyrNFH7jb
         Dv2aMOtG74NJ6sUh8sOum0aCWRxQiLCf2g3pzbumDoq3lFCsY5eA2zZFjVcawzO52Z9e
         FjiiCjbDIeitZO04EAeRFT738fqivE1VHA+Rsc3FCX1U8i2HL0+/fNEg9Kawt6paF4Dm
         TQQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5q7S8vr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec36668c6sor6545315e9.9.2025.04.03.08.19.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5q7S8vr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693590; x=1744298390; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzIe1y6exrD0xJczT8npcuq1OBfi7eudR1jNiJ2MiPM=;
        b=A5q7S8vrbP3X+sClJVWicHxvo1oN9ANawaw1equFAHOOaYCFeY7U+E8UkizXuvJBIb
         zI/g/DdFYl47D/FyhIlPgH7Q0UEe1l3S0zztZHS8W+CTYbEnrPxU9FdzHQmbvgNUMxfr
         y60B4/UbMTDgPHTsrchf29+scTXSNrt+Ann8ttzlc2AAb78KQ86VITSaLAUHbKbR088C
         aDVXqaej8OIIc/nzmcLOIr6Kr04D/lN7yjlt8+MmVGe7cY5chf/lDsxEEb/iDeNt4Bi4
         YTT0WxHFQJ0sUMN0PgnQjR51+O8ynyGYQswoh/62T7/GaUAaR36h6bXvrXl4iVrkWYwp
         ucuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693590; x=1744298390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzIe1y6exrD0xJczT8npcuq1OBfi7eudR1jNiJ2MiPM=;
        b=i1qVeyElcfU+4VxB6lbRFN1+VKAi3ip3j/m3a93Vabi/oEABVaXYXTIFQGDMBFs09a
         v/y3tXoVlLhb4xgDXrtqm4EBEvOo06FyO/0XKe67XHobSKINqhFLAZc6V27Vb+aptQfe
         6k8Up+L+JhVXFKjjRnqEnFjvfIQxT62zkCMnYMdOlFU2WaGK9CGWx86Vfws8uuDvH46n
         is8WhOMlqW6wMHoepiC8Dm7FdzqrNJwdCQbMC/rYKwT1z2dP9ZIDPf9J2f3bsXnqOHC1
         VKCr4kVXa0tDcdWjqwz5FdqNS2DP9hf0XHriGPf/siU4x5SvCUE4P682f2j2PYUTiehq
         mz4g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0prNBRARGSXWys8TtBA+G9kihI3nJduIk933ZdndUgSQegc7+zsshxFl/UYNQ2Klo6Z3cJm5gmYr0A==@linaro.org
X-Gm-Message-State: AOJu0YyEOmi2+LQNffyCGMLbwRevjlgEV55SODDBeXNoEFF3AJzOPCju
	ibc7IgJlPF0ZAGmGiMVfM2k6dtJbytD5UZgXupGRv/pkaooljLUeZ3uNXzLIlHrpiw==
X-Gm-Gg: ASbGnctPHmigNkYC8/rxzvuSq9bpkwa2l9tYbcOixeJjEpmU61Yz0NXkPOl/noReGez
	je/d+g9N8K5RcNxyXGxSLM4fwZjJMo7tgIp+EEHquFPCs1mwJXjvq0lnZf+sqU8OsvmiPV3s5/U
	XEaPy6IbO1VTcVYrOsqM344WLjSRm0KkrUnZ4Wgi8QvSRz/KiMNI9LjhdllrwXqUr4n3kN8xyUG
	NxY8ZNGnQeoFTCQoOjzb/QTXaCUrwcAYRkGgx73WRtOsP5vhpMi2ic3BPWkQVW6pR1kICgE6Rfh
	S3TU4L7D0vJg1hEInByxOvIFDDNdMA1NNBEruc1908yoaw4Jh/io4ia4qX5EMIlYhmSLApLDZGl
	z34lcDaSIZBjMtcw9AD4=
X-Google-Smtp-Source: AGHT+IFP5r5ixxIHZaNePUhh+j1T6iPhjWvcfbIAQTugdxudRBNRRHn2nU0VwfpVZLpfl2RJ/YT+hQ==
X-Received: by 2002:a05:6000:420b:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39c303af783mr2389195f8f.53.1743693589894;
        Thu, 03 Apr 2025 08:19:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226acfsm2003872f8f.88.2025.04.03.08.19.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0? v2 12/14] hw/arm/virt-acpi: Always build IORT table (even with GIC ITS disabled)
Date: Thu,  3 Apr 2025 17:18:27 +0200
Message-ID: <20250403151829.44858-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TlYwspg+fkdn

Citing Gustavo [*]:

  Gating IORT table generation entirely based on the presence
  of ITS looks wrong because IORT table has data beyond GIC ITS,
  like for SMMUv3 etc..

[*] https://lore.kernel.org/qemu-devel/bae6e29a-7290-47d2-8caf-14702ee091f0@linaro.org/

Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1c389ef5cdb..e7e27951cb9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -287,6 +287,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     uint32_t id = 0;
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    bool has_its = its_enabled(vms);
 
     AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
@@ -325,9 +326,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         nb_nodes = 3; /* RC, ITS, SMMUv3 */
         rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
-    } else {
+    } else if (has_its) {
         nb_nodes = 2; /* RC, ITS */
         rc_mapping_count = 1;
+    } else {
+        nb_nodes = 1; /* RC */
+        rc_mapping_count = 1;
     }
     /* Number of IORT Nodes */
     build_append_int_noprefix(table_data, nb_nodes, 4);
@@ -336,17 +340,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
-    /* Table 12 ITS Group Format */
-    build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
-    node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
-    build_append_int_noprefix(table_data, node_size, 2); /* Length */
-    build_append_int_noprefix(table_data, 1, 1); /* Revision */
-    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
-    build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
-    build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
-    build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
-    /* GIC ITS Identifier Array */
-    build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
+    if (has_its) {
+        /* Table 12 ITS Group Format */
+        build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */ //
+        node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
+        build_append_int_noprefix(table_data, node_size, 2); /* Length */
+        build_append_int_noprefix(table_data, 1, 1); /* Revision */
+        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
+        build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
+        build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
+        build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
+        /* GIC ITS Identifier Array */
+        build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
+    }
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
@@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             build_iort_id_mapping(table_data, range->input_base,
                                   range->id_count, IORT_NODE_OFFSET);
         }
-    } else {
+    } else if (has_its) {
         /* output IORT node is the ITS group node (the first node) */
         build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
@@ -979,10 +985,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                           vms->oem_table_id);
     }
 
-    if (its_enabled(vms)) {
-        acpi_add_table(table_offsets, tables_blob);
-        build_iort(tables_blob, tables->linker, vms);
-    }
+    acpi_add_table(table_offsets, tables_blob);
+    build_iort(tables_blob, tables->linker, vms);
 
 #ifdef CONFIG_TPM
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
-- 
2.47.1
