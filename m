Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1648049dye;
        Sat, 28 Jun 2025 12:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURsP/JRBoYy0Z2uueRl4i8XkWPBpoLsZcV47ayOPj40kfCdn5d7TiGJn2hL5EJaVqVh2k1PYd9mWfYGQ==@linaro.org
X-Received: by 2002:a05:620a:f12:b0:7d2:26f3:881a with SMTP id af79cd13be357-7d4439c15e3mr1189295985a.56.1751140692491;
        Sat, 28 Jun 2025 12:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140692; cv=none;
        d=google.com; s=arc-20240605;
        b=Qw3ApKtXmS08nF4ehTjLOH2c6XXhvEMub6qogQc9KGFKgYHs5yL2fw9+G+U9M+hN/t
         idBoCgrirKpR7DbFonc1qfEvHkZ8AqVPWp/GpSL0Ap5h6bgwCdhcCoCNEnKzz+5iANFT
         89advqbpmMk/rsGbbfQKhi7OLqd9ju81goWfG8GxGQyy1XkTsSPzos43sQO0+qXMLIW7
         ztLgcid3MW+5BgiHAWb1YzKyW5Fy7uVH3iF+VtiV+qd/i94GIEM9VdXhNSITrJGnj3gk
         drkdMwtjAccXt7pp72UthtxiuC4APs3uDMZRH9A6r2trNcARcVU2OiTFdCZCHkCKHWQR
         QjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9iUI8g8Bil+9iragaiojyrpbmKiosSki/uPno5KCz/w=;
        fh=tzzYW5rF7AqAGOjIfEMRdIcZEz1IBmiO6mzkvSGFIhY=;
        b=cVXz2l+/fV7XnbrTReGI/jkRrfA3sbY+WyQL9SLDohJb/EhC8sxW63b+L7X5hFre1w
         Z26joAFbfNqy90Y4kDz3bVbWhaRM7kCmbz2eFfjwsDAgyy14X1qh/qqYIFnnYNUEbsp7
         xI8Zdj7bNdjCYm4d7YQJXmUkN44o5sSl+URoFHqmO+eTIRu6NNWGk6GZE4pH8FFSyhxu
         QFA62b0t7+xd3unXUsTmtwjs10ZlmtJeMfO5zgc8cbxnkkofSTjUWxmSCQHERxHxT3qy
         oKM4mSPcbKr9M5xY7HZOH2akt1du2l3YpzmEr+OlnaErSoEmphxKFT+Yq8PnQqloE/ls
         w2eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rs6unoWg;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d44317422bsor394268685a.5.2025.06.28.12.58.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rs6unoWg;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140692; x=1751745492; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iUI8g8Bil+9iragaiojyrpbmKiosSki/uPno5KCz/w=;
        b=Rs6unoWgetPzf0iD4C2rcHz8FY1L8vN73etd7MYIgDn4dnPeYcJrudGxq7PhH9+tKR
         kXEikX4bAAkChGJOs65WyIOP+M/jjdm4g5A6Mb2oTXxRZfe9PUKMXAbcxwqBKOYXMvPT
         tWU4BKR8u8LlsTDiEXOEpLE6/9CUt4Q2eFRLpAK7uaRJuvZz+ZxGjqyJANHq3K7WnzCr
         KuIK+vadPazEBLQYqAvLncfOtkliIUJ8NmQdheKO8PyhDNLyjfh2wClu4W+uuw/eLqDk
         kqdIBa92Uk9BztfGFlIf5uhvzD9BUYTmdBTSiZoNSAP5FGlV1rPnCNeF56fi2ktevOVn
         b21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140692; x=1751745492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iUI8g8Bil+9iragaiojyrpbmKiosSki/uPno5KCz/w=;
        b=SRM3YFyleYv/nweiddd+mNjuaG1xMZB2QhIjEeL6fs6ov5RhtRfaX9MCwRJ+XaQ9r6
         UekK/SXmTq9Stk7MwcKfd+b5oBVDrEPlspGlkEKZOQu8vIOfcHAdjRNZ7PaZZShrGGJj
         hmkhAh/xZA+nUnAXkc+0ksR1pHIBOkD5MlkCuWj0OMjM8b95JCPOdsU+4OLv5cSL+Pd0
         YpayRCW2lAzPfQGptTfrEB2M5MOogZnPI71zsr4TE/4nZZXOPKXgRd4kw/763I1btwSl
         ATK+RXU3Qi8ikwYdcIcGGia7v3E1Tf1ZMHaD4d/ZmmH2SmDBax+CauzDOypgJFa5DOFg
         3DXA==
X-Forwarded-Encrypted: i=1; AJvYcCWdMr1YJRLIs8l4x53sgvTO3wIUDpwXLS7GoDk/GWesmD8UHzthvjiQPGgyStiyxaOV5t7Cx/XQVw+icQ==@linaro.org
X-Gm-Message-State: AOJu0Yyglmcqzu+iZDh5cJ7iczSRPVu9wP1dEIdrnkB/CUA/ezfHXtJ6
	q7O/Zjk+NhbLFosgYXmrEVI1J8pwr1HGvoMMZHzbP66XWJw+cr7hDo3pSaHpK/Uyl/Fcsw==
X-Gm-Gg: ASbGncuZpgNbAlifThQTqYPAXrt70mfItXEoXpV82dDNolSllnuD+j9DVUttzbMmhg8
	gMGUux/XxmGojDK0cCnCW+GLB9D4StX4faE0+e2+Y9Z6Mlr4TJAedaN0NegXXwgmdBzbTQ62bxG
	yCAXU2iZMPciZ4sUfQOfPKuhNafAoHztI+cr0iWpx+Zw/4OoipzJYE27hordvk38SiLPDm8Kl1D
	fqdEkzcnBKp7cjPcoJv6nyIEHEDIc//FW6ER+Wk7NY0GqAK9TjkOMS4Y6Sm5Y4psXKgnPS+/vyG
	ImHwqLeBVEFNG9kmousoIFnHqvnRWoizw63BXuWjIez/aa4mBne3hucApszNGRDqP90=
X-Google-Smtp-Source: AGHT+IG9bFzhgOx2iMfHeVmdUd8snmtBbOXOSZrU48jiPfGnUJmlnE7WLfbqzMUtExNZSSorlyjJug==
X-Received: by 2002:a05:620a:4054:b0:7d4:3b16:1b85 with SMTP id af79cd13be357-7d4439a5fbemr1069895485a.46.1751140691820;
        Sat, 28 Jun 2025 12:58:11 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:58:11 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com,
	philmd@linaro.org,
	mst@redhat.com
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	udo@hypervisor.org,
	ajones@ventanamicro.com,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	anisinha@redhat.com
Subject: [PATCH v6 8/9] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off
Date: Sat, 28 Jun 2025 19:57:21 +0000
Message-Id: <20250628195722.977078-9-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WgF6Ddq6t9hd

Currently, the ITS Group nodes in the IORT table and the GIC ITS Struct
in the MADT table are always generated, even if GIC ITS is not available
on the machine.

This commit fixes it by not generating the ITS Group nodes, not mapping
any other node to them, and not advertising the GIC ITS in the MADT
table, when GIC ITS is not available on the machine.

Since the fix changes the MADT and IORT tables, add the blobs for the
"its=off" test to the allow list and update them in the next commit.

This commit also renames the smmu_idmaps and its_idmaps variables in
build_iort() to rc_smmu_idmaps and rc_its_idmaps, respectively, to make
it clearer which nodes are involved in the mappings associated with
these variables.

Reported-by: Udo Steinberg <udo@hypervisor.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Co-authored-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c                    | 142 ++++++++++++--------
 tests/qtest/bios-tables-test-allowed-diff.h |   2 +
 2 files changed, 90 insertions(+), 54 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 068383f982..eff0d698df 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -267,7 +267,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
 }
 
 /* Compute ID ranges (RIDs) from RC that are directed to the ITS Group node */
-static void create_its_idmaps(GArray *its_idmaps, GArray *smmu_idmaps)
+static void create_rc_its_idmaps(GArray *its_idmaps, GArray *smmu_idmaps)
 {
     AcpiIortIdMapping *idmap;
     AcpiIortIdMapping next_range = {0};
@@ -314,8 +314,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i, nb_nodes, rc_mapping_count;
     size_t node_size, smmu_offset = 0;
     uint32_t id = 0;
-    GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
-    GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    GArray *rc_smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    GArray *rc_its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
     AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
@@ -324,22 +324,38 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         object_child_foreach_recursive(object_get_root(),
-                                       iort_host_bridges, smmu_idmaps);
+                                       iort_host_bridges, rc_smmu_idmaps);
 
         /* Sort the smmu idmap by input_base */
-        g_array_sort(smmu_idmaps, iort_idmap_compare);
+        g_array_sort(rc_smmu_idmaps, iort_idmap_compare);
 
 	/*
 	 * Knowing the ID ranges from the RC to the SMMU, it's possible to
 	 * determine the ID ranges from RC that are directed to the ITS.
 	 */
-        create_its_idmaps(its_idmaps, smmu_idmaps);
+        create_rc_its_idmaps(rc_its_idmaps, rc_smmu_idmaps);
 
-        nb_nodes = 3; /* RC, ITS, SMMUv3 */
-        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
+        nb_nodes = 2; /* RC and SMMUv3 */
+        rc_mapping_count = rc_smmu_idmaps->len;
+
+        if (vms->its) {
+            /*
+             * Knowing the ID ranges from the RC to the SMMU, it's possible to
+             * determine the ID ranges from RC that go directly to ITS.
+             */
+            create_rc_its_idmaps(rc_its_idmaps, rc_smmu_idmaps);
+
+            nb_nodes++; /* ITS */
+            rc_mapping_count += rc_its_idmaps->len;
+        }
     } else {
-        nb_nodes = 2; /* RC, ITS */
-        rc_mapping_count = 1;
+        if (vms->its) {
+            nb_nodes = 2; /* RC and ITS */
+            rc_mapping_count = 1; /* Direct map to ITS */
+        } else {
+            nb_nodes = 1; /* RC only */
+            rc_mapping_count = 0; /* No output mapping */
+        }
     }
     /* Number of IORT Nodes */
     build_append_int_noprefix(table_data, nb_nodes, 4);
@@ -348,31 +364,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+    if (vms->its) {
+        /* Table 12 ITS Group Format */
+        build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
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
-
+        int smmu_mapping_count, offset_to_id_array;
+
+        if (vms->its) {
+            smmu_mapping_count = 1; /* ITS Group node */
+            offset_to_id_array = SMMU_V3_ENTRY_SIZE; /* Just after the header */
+        } else {
+            smmu_mapping_count = 0; /* No ID mappings */
+            offset_to_id_array = 0; /* No ID mappings array */
+        }
         smmu_offset = table_data->len - table.table_offset;
         /* Table 9 SMMUv3 Format */
         build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
-        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
+        node_size =  SMMU_V3_ENTRY_SIZE +
+                     (ID_MAPPING_ENTRY_SIZE * smmu_mapping_count);
         build_append_int_noprefix(table_data, node_size, 2); /* Length */
         build_append_int_noprefix(table_data, 4, 1); /* Revision */
         build_append_int_noprefix(table_data, id++, 4); /* Identifier */
-        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
+        /* Number of ID mappings */
+        build_append_int_noprefix(table_data, smmu_mapping_count, 4);
         /* Reference to ID Array */
-        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
+        build_append_int_noprefix(table_data, offset_to_id_array, 4);
         /* Base address */
         build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
         /* Flags */
@@ -388,9 +416,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
         /* DeviceID mapping index (ignored since interrupts are GSIV based) */
         build_append_int_noprefix(table_data, 0, 4);
-
-        /* Output IORT node is the ITS Group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        /* Array of ID mappings */
+        if (smmu_mapping_count) {
+            /* Output IORT node is the ITS Group node (the first node). */
+            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        }
     }
 
     /* Table 17 Root Complex Node */
@@ -431,24 +461,26 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
          *
          * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
          * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
-         * ITS Group node.
+         * ITS Group node, if ITS is available.
          */
-        for (i = 0; i < smmu_idmaps->len; i++) {
-            range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+        for (i = 0; i < rc_smmu_idmaps->len; i++) {
+            range = &g_array_index(rc_smmu_idmaps, AcpiIortIdMapping, i);
             /* Output IORT node is the SMMUv3 node. */
             build_iort_id_mapping(table_data, range->input_base,
                                   range->id_count, smmu_offset);
         }
 
-        /*
-         * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
-         * node directly: RC -> ITS.
-         */
-        for (i = 0; i < its_idmaps->len; i++) {
-            range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
-            /* Output IORT node is the ITS Group node (the first node). */
-            build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, IORT_NODE_OFFSET);
+        if (vms->its) {
+            /*
+             * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
+             * node directly: RC -> ITS.
+             */
+            for (i = 0; i < rc_its_idmaps->len; i++) {
+                range = &g_array_index(rc_its_idmaps, AcpiIortIdMapping, i);
+                /* Output IORT node is the ITS Group node (the first node). */
+                build_iort_id_mapping(table_data, range->input_base,
+                                      range->id_count, IORT_NODE_OFFSET);
+            }
         }
     } else {
         /*
@@ -460,8 +492,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_table_end(linker, &table);
-    g_array_free(smmu_idmaps, true);
-    g_array_free(its_idmaps, true);
+    g_array_free(rc_smmu_idmaps, true);
+    g_array_free(rc_its_idmaps, true);
 }
 
 /*
@@ -769,18 +801,20 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                           memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        /*
-         * ACPI spec, Revision 6.0 Errata A
-         * (original 6.0 definition has invalid Length)
-         * 5.2.12.18 GIC ITS Structure
-         */
-        build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
-        build_append_int_noprefix(table_data, 20, 1);   /* Length */
-        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
-        build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
-        /* Physical Base Address */
-        build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
-        build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
+        if (vms->its) {
+            /*
+             * ACPI spec, Revision 6.0 Errata A
+             * (original 6.0 definition has invalid Length)
+             * 5.2.12.18 GIC ITS Structure
+             */
+            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
+            build_append_int_noprefix(table_data, 20, 1);   /* Length */
+            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
+            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
+            /* Physical Base Address */
+            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
+            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
+        }
     } else {
         const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
 
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a88198d5c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/APIC.its_off",
+"tests/data/acpi/aarch64/virt/IORT.its_off",
-- 
2.34.1
