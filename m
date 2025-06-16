Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851655njc;
        Mon, 16 Jun 2025 06:20:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiYDzCl836LRbVYU6l1fuqXHiqEgDh5KOEcOEDSL9mClB9q6S4kCZL9fPOfnf2IBaP0Xh3FlCe2VgHmA==@linaro.org
X-Received: by 2002:a17:903:1b0c:b0:234:ba37:879e with SMTP id d9443c01a7336-2366b3c3c7cmr148953355ad.38.1750080034357;
        Mon, 16 Jun 2025 06:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080034; cv=none;
        d=google.com; s=arc-20240605;
        b=A5wN3i1svYo26eLHlsID74+BEAXJqz+iz2Xc2rxXF0gwI/kZ2wL0xe/xiGEB/0wdRC
         WNP3XQgT+BucrQ1/6pyq9UfnqsCJVfQaNg03GAxW3+Gb8g5YaOgIUnAznjSijX8/x/Rm
         YWHkxjbveriLArIbXw6d4TKErH23QyR0Puy5GhNOct/CMDnHXhrt4jYsSyMZFx2SHMSj
         ZB7bnNlCZ1epFXwYBShCzAg2kVfPMzd1kMKeCYy4dRZgqx9Zdmtd2Jg5jjrXaFgjNavE
         W1l0uPTFxlT6+n/x5euTmbHnPT4CyOxje/HMGObZuBHu3TRM636Tcxp1Cjo9DjIJiZA4
         66CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XTagyUmf5Z2Dqe0MgGzh/1SbGYQJX9bpKTLCVGqNfjo=;
        fh=TgMrxGA5kcI540t6Wu/fag7V4ienR1sPC9dSoALSc2s=;
        b=hAHudg+Cwl0ZpWBFY/tU08Umi/MZ64eUpkqeZJBZlXJZhqXVSkPTFPR9ha4nhO806n
         Lj64DAoorfUThX6VMCMc9Hkl/Jps96H4TPbYWSOxrutTEf5R2VhNTuxcYdvBLr/HMpLp
         vKMjWYYRBlhgtuOwrLbJGdtqkhk2jtyRc3nKELHm/7/i/zckkyYDyQnepJX4OUP0Ouhb
         GhbW6ieT55qPYrQNMVXFqcECw/TlVAuaMf7SlkrwrxChJ6+dDKI/4oYsq6fCwx+6fs+q
         P3CIXukzSgdUiXAz+s80EaOV/HIlgJQztpkI/8Lr+oe0PIbr8EqDZXjjz280olc8g16m
         hJRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WciQVi+w;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2364e58e9casor58365645ad.0.2025.06.16.06.20.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WciQVi+w;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080034; x=1750684834; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTagyUmf5Z2Dqe0MgGzh/1SbGYQJX9bpKTLCVGqNfjo=;
        b=WciQVi+wARhs9/z/dVI2mZER9npmw+0Oghon25y62nugSIZz8XMixPtp8BEAxsepOF
         C19E4+UApP8xh+yWf4LjQT7746vZTV2nNh2j52DA3EBcOlCGbkwdOu9O9rzJlWgOucu1
         6EGxcDC1K2/0GpCxVIGL9ZZR4hyAAKBEoHZS5NHejVYVu0c3c14glZfidc5dLZpJUYZQ
         eSzZMAL0TEivTZIrGTMmjFNdijeR+mXK49kljJegmCdlPmEgqA+LviXxeUKo+hZgZPPq
         m6X0/Hno/qM6UwYHqxzBdUCdH+7T0xchIzn5reLvAZ9Q0i1igR2Jq6tkx+FfeeJroeuc
         CbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080034; x=1750684834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTagyUmf5Z2Dqe0MgGzh/1SbGYQJX9bpKTLCVGqNfjo=;
        b=gdT9HvaIrq1u6WLs+l0Q2bLbBat1LHu/gVKp93q6tq74DV93TCKTd9HWMvNPBiRAcv
         4OxvORD+AHIbdRXsPSIwMtW38ZyEDC/nrqraaCIqaTbZqtkkjXYiqy6HXDa6qlJxuIB2
         XBF6hLc14Wxo5Ph8W4DYHc0Z3+Jw+5SGYUo/6RWTmwKVW+R4E0meDH+pdyOepkUSrAvV
         hCwdDbAQvBmuE6MJ8a/N7rVTlPLlojeIOgFYZeFdExtB9OW71Beov0rd7aNjFlTCM2dj
         NTQIGStcAuYSs4xO0iP29khWOiKqelQNEHSwa7BGuKHE5ntQfFOtEdPOOSKctrKzoRqu
         GyRg==
X-Forwarded-Encrypted: i=1; AJvYcCXV11cFih2au9mW9Fd2HtHr5ZL0/GRi5z/DdaIMKO7e0HOhzTUrUWEWk5h7CoW79fKnAUPb9h8GiGkZMA==@linaro.org
X-Gm-Message-State: AOJu0Yz0Lpo3NACGVydEX/RIt4zok877j81hMzJ2ZFz5lalHCl4OwkAn
	fVGleqDHmlwsbt0AVeL73vOwVnh7HpzgVY+l7h5dXGyaiPdTBfX0pMrR6Du2Y3AFEOt5sA==
X-Gm-Gg: ASbGnctQiFifW9ACArR0tPOuRsaSPL2XBCBp8BZ8QgeSvzi4kBQX1LhW4yylt1FDtxy
	v0DAWTopl5W2bQtLKmF7QRorvnPgYTOIHbrk7p3MpE3R8QZ0BSDSW015W6T7ZNzsA2InJeMOBq9
	GVzHnAyv+uHKFuS0SuqoelilJwZ0VkIuq5Pw2nihhfXngZFntZXWN6bwg9Uizo//7244W18whSS
	1HSUg94BqG1QTBqAcBtjltyJzk3NJNLKD33fS/Av8Dwm+Ia4EW5BdcOa06NcdUKK1nWRBmCChM5
	I4oBvVTAz/sNcddZ+3U0XHekxDAmZKhtMneTu06pWDNcEx1Fai4HW+r0xVUrnw3qxJI=
X-Google-Smtp-Source: AGHT+IEsbR7SW1wGZy9pnnwzl56UJLTomICzbZgdshbr+I/csSx1Js0mT1INqcg57+C1+216G4Kkew==
X-Received: by 2002:a17:903:1a90:b0:235:efbb:9539 with SMTP id d9443c01a7336-2366b32ceb4mr127437995ad.17.1750080033808;
        Mon, 16 Jun 2025 06:20:33 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:33 -0700 (PDT)
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
Subject: [PATCH v4 7/8] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off
Date: Mon, 16 Jun 2025 13:18:23 +0000
Message-Id: <20250616131824.425315-8-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SE4/ABEBP+Mn

Currently, the ITS Group nodes in the IORT table and the GIC ITS Struct
in the MADT table are always generated, even if GIC ITS is not available
on the machine.

This commit fixes it by not generating the ITS Group nodes, not mapping
any other node to them, and not advertising the GIC ITS in the MADT
table, when GIC ITS is not available on the machine.

Since the fix changes the MADT and IORT tables, add the blobs for the
"its=off" test to the allow list and update them in the next commit.

Reported-by: Udo Steinberg <udo@hypervisor.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c                    | 152 ++++++++++++--------
 tests/qtest/bios-tables-test-allowed-diff.h |   2 +
 2 files changed, 93 insertions(+), 61 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6990bce3bb..2240421980 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -295,32 +295,42 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* Sort the smmu idmap by input_base */
         g_array_sort(smmu_idmaps, iort_idmap_compare);
 
-        /*
-         * Split the whole RIDs by mapping from RC to SMMU,
-         * build the ID mapping from RC to ITS directly.
-         */
-        for (i = 0; i < smmu_idmaps->len; i++) {
-            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+        nb_nodes = 2; /* RC and SMMUv3 */
+        rc_mapping_count = smmu_idmaps->len;
+
+        if (vms->its) {
+            /*
+             * Split the whole RIDs by mapping from RC to SMMU,
+             * build the ID mapping from RC to ITS directly.
+             */
+            for (i = 0; i < smmu_idmaps->len; i++) {
+                idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+
+                if (next_range.input_base < idmap->input_base) {
+                    next_range.id_count = idmap->input_base - next_range.input_base;
+                    g_array_append_val(its_idmaps, next_range);
+                }
+
+                next_range.input_base = idmap->input_base + idmap->id_count;
+            }
 
-            if (next_range.input_base < idmap->input_base) {
-                next_range.id_count = idmap->input_base - next_range.input_base;
+            /* Append the last RC -> ITS ID mapping */
+            if (next_range.input_base < 0x10000) {
+                next_range.id_count = 0x10000 - next_range.input_base;
                 g_array_append_val(its_idmaps, next_range);
             }
 
-            next_range.input_base = idmap->input_base + idmap->id_count;
+            nb_nodes++; /* ITS */
+            rc_mapping_count += its_idmaps->len;
         }
-
-        /* Append the last RC -> ITS ID mapping */
-        if (next_range.input_base < 0x10000) {
-            next_range.id_count = 0x10000 - next_range.input_base;
-            g_array_append_val(its_idmaps, next_range);
-        }
-
-        nb_nodes = 3; /* RC, ITS, SMMUv3 */
-        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
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
@@ -329,31 +339,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+        int num_id_mappings, offset_to_id_array;
+
+        if (vms->its) {
+            num_id_mappings = 1; /* ITS Group node */
+            offset_to_id_array = SMMU_V3_ENTRY_SIZE; /* Just after the header */
+        } else {
+            num_id_mappings = 0; /* No ID mappings */
+            offset_to_id_array = 0; /* No ID mappings array */
+        }
         smmu_offset = table_data->len - table.table_offset;
         /* Table 9 SMMUv3 Format */
         build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
-        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
+        node_size =  SMMU_V3_ENTRY_SIZE +
+                     (ID_MAPPING_ENTRY_SIZE * num_id_mappings);
         build_append_int_noprefix(table_data, node_size, 2); /* Length */
         build_append_int_noprefix(table_data, 4, 1); /* Revision */
         build_append_int_noprefix(table_data, id++, 4); /* Identifier */
-        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
+        /* Number of ID mappings */
+        build_append_int_noprefix(table_data, num_id_mappings, 4);
         /* Reference to ID Array */
-        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
+        build_append_int_noprefix(table_data, offset_to_id_array, 4);
         /* Base address */
         build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
         /* Flags */
@@ -370,8 +392,10 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* DeviceID mapping index (ignored since interrupts are GSIV based) */
         build_append_int_noprefix(table_data, 0, 4);
 
-        /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        if (vms->its) {
+            /* Output IORT node is the ITS Group node (the first node). */
+            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        }
     }
 
     /* Table 17 Root Complex Node */
@@ -415,20 +439,24 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                   range->id_count, smmu_offset);
         }
 
-        /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes: SMMU -> ITS. */
-        for (i = 0; i < its_idmaps->len; i++) {
-            range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
-            /* Output IORT node is the ITS Group node (the first node). */
-            build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, IORT_NODE_OFFSET);
+        if (vms->its) {
+            /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes: SMMU -> ITS. */
+            for (i = 0; i < its_idmaps->len; i++) {
+                range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
+                /* Output IORT node is the ITS Group node (the first node). */
+                build_iort_id_mapping(table_data, range->input_base,
+                                      range->id_count, IORT_NODE_OFFSET);
+            }
         }
     } else {
-        /*
-         * Map bypassed RIDs (input) (don't go through the SMMU) to ITS Group
-         * nodes: RC -> ITS.
-         * Output IORT node is the ITS Group node (the first node).
-         */
-        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        if (vms->its) {
+            /*
+             * Map bypassed RIDs (input) (don't go through the SMMU) to ITS Group
+             * nodes: RC -> ITS.
+             * Output IORT node is the ITS Group node (the first node).
+             */
+            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        }
     }
 
     acpi_table_end(linker, &table);
@@ -741,18 +769,20 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
