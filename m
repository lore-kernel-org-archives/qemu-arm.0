Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567335dyb;
        Mon, 23 Jun 2025 06:58:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1L1+BMo1z3IjhgYPGBEHgo3/zU0dAIH0sprDopmWLFTmO8SviuJGdkGeuNGePldztXeoeIxaGJRmtMg==@linaro.org
X-Received: by 2002:a05:6a00:4fce:b0:746:25d1:b712 with SMTP id d2e1a72fcca58-7490f5487b8mr16741923b3a.7.1750687132189;
        Mon, 23 Jun 2025 06:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687132; cv=none;
        d=google.com; s=arc-20240605;
        b=ILqLuYoSFJ8J2CxXwtPubcuY3myGYOY0o2WziRmgyLV7LysliK35e/zfP8oXDKzxUf
         I2bnEKMe7oqdIyABlJdaWNQdgW3COvq0heb0WKAmoAPfEEkSU2P4avaNKHEJDqiYcQ8j
         4/HqIuHUhpbLx0TtjMgBK7qIESt7j1xgVtjDebEde7xR52gpElSoJCR2uKviPKFVFu/8
         tZqrwysfaPMxtWGQ5txJPxn5WHy78cwyMgkoqbYulSQO6f4Drhpd5buGlvdgRSMd/U2V
         zkVCg9ZN1Pnea0C0x7mmlyJY9hA2gHEFI5E6N6psi8MH7Q26oI38QiBSNPdi5QuTOwCz
         0AQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IOV46Ps4a8FdPp4RmxE7rRFywBE4TgcqqV4mGLREwqI=;
        fh=0HhWnJE1Haz9vqsjUu7UTwbwgiKs7QOB/Mxz71YWBrw=;
        b=AvCqUCCU0yvZF3XqhixKe6uXPfTB7BksNXiQlTC7UrnORiBlCzOEq9F4UrJYpANSGB
         3sYdvG1OZfuWwrtI9jGXjQVRfXfO0ahon66J2FqFi1XasCu1TM211IdDG82zARKWmUk7
         BUSXwHHtpbwpW6GFbhLoN0Cm8OwoNVgaTPjitPfQmNCWyFo4a21w8A+R32ZLZz2pNoz1
         1l+pVg+/TGUyC0AMKlZPXqQ9s51RqIeompkcbQpjdksu24zTjefAXm2iW8t5fwsquH/0
         4N/erjx65Pa8t6w94GIwO+qyMc3dKuipdD+1O6rE5UpGJ3uhTUCQ4HA9ovopBIhRXI7O
         WdVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T17l38Dl;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a600eb8sor3705776b3a.6.2025.06.23.06.58.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T17l38Dl;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687132; x=1751291932; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOV46Ps4a8FdPp4RmxE7rRFywBE4TgcqqV4mGLREwqI=;
        b=T17l38DlzyoYLG95IRJwIKmvRRSBWiqCAdZeVUYAypKF+UnkyDHArC6AixpO7WMbtM
         lE/SEV8cZo2e1jxJy1OllKQttCcDJdDLboiONDahumc5yKJYBCGt9yNOqWuXxmNO3HIr
         h2/TmrwekPnruAuLMbAzYFlMYViZ7tqSaUOJvc+gl/NBnaG0oIIGu+BWcDxYLGylBQiD
         IRZIuYkdCrCBsa/cy+B0pLdVe1ixvF5qUkq9amQUxWwjMKVxsgBj5y0F85J4Ryry9NhN
         vkz8KiXyJTxX5480btYOvI63+8GKB3mnUqUxq7yInQcmrf1U8bAHA9rPIdTuJC832wju
         VJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687132; x=1751291932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOV46Ps4a8FdPp4RmxE7rRFywBE4TgcqqV4mGLREwqI=;
        b=p4TLbqV85RZbk3kbzIT4LOCD2chl0P+9tdqg1Mf2KtBMndEEqhv7IucwaNnCyvqS3L
         rEIM4XmfAOXLo/NCA7Jrx+SY/xxMNjeDIvLdkpBuHdi42Hoxkfb1iCu/S/zOLOQzLi2X
         uOmix0OCuvV6bvwIxtZHhcIQU4/txVWI6r03wljr3xt/FLXWlD+gFbq+wA++qS2goQlr
         A/YijFyKBuIgUY/LNCHPTjJFJ8gOFfq+ZQeSzR1VET+NWE5BUcI7yxlMXj+gsLZAGkxG
         gWAFUJ4HlFsn5GWQ0vtIplwI120zEgeleGbrfZ8ICy4Sg+0Ucluq3bEVMMIOIjWkYrUI
         Wycw==
X-Forwarded-Encrypted: i=1; AJvYcCVLLJGenBT9SpRw4HZja8f7MoPJUx3eDcheMAGGNvbd2CVRKlNlkT6UXMAlVWi9Ev8yDp9ZfBN+shhPQA==@linaro.org
X-Gm-Message-State: AOJu0YxnKNU7gRBQmNzfh2rG5DEUWmueNWzb8MqKSYX0BEjjDwBC/g/8
	q42xDGhdl3fjBi0iYTM0PvkIDyMPMyxr8GrI/JKVWaENA96z/wgn0rQaH3RQbCrEI98gig==
X-Gm-Gg: ASbGnctsxaLI3to9wbhA7iCihJC/KKWz4IxPZGxv09GwfoVrvBqPZ1vJ+yE22WFrgQi
	XiQy53tK2tS5uTQeL/WgqZbKyqjEaU3AejRkaU/izystAr6qT3d7BxHdZxK/KwtkoMNsyUOz1Zi
	AgIuNcmovZk9fUY/NObo/8Ryj2T1m4UxpzYIpYbAdU8njoMO90YnD+/s4tlrHYYCeEEY7jxjMBx
	tQbnVoUhY7jxgS81qdxvXKh612taOAbRjQy6wS5lwXsFMXPmPJ+y0F4sYJcNpEj0AsiTD/A6+/7
	toYcFs4azREFr46FmetWQ2b1Rwq80RFgr8AgQNCxZxZcIS9WMnNtkqcCzLZf/zTgD34=
X-Google-Smtp-Source: AGHT+IFJNmxnYgubIONa8S0ID6ICpLttZdIWCbRmzjTTncyS+bivCcrNi3m2sJ4YPmh1McRRCoCaXQ==
X-Received: by 2002:a05:6a21:3387:b0:218:183b:ccaa with SMTP id adf61e73a8af0-220292ec76fmr18167176637.17.1750687131541;
        Mon, 23 Jun 2025 06:58:51 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:51 -0700 (PDT)
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
Subject: [PATCH v5 8/9] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off
Date: Mon, 23 Jun 2025 13:57:48 +0000
Message-Id: <20250623135749.691137-9-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623135749.691137-1-gustavo.romero@linaro.org>
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yiK5JkiBglo9

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
Co-authored-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c                    | 128 ++++++++++++--------
 tests/qtest/bios-tables-test-allowed-diff.h |   2 +
 2 files changed, 80 insertions(+), 50 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 40a782a498..17ae46804a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -328,17 +328,27 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* Sort the smmu idmap by input_base */
         g_array_sort(smmu_idmaps, iort_idmap_compare);
 
-	/*
-	 * Knowing the ID ranges from the RC to the SMMU, it's possible to
-	 * determine the ID ranges from RC that go directly to ITS.
-	 */
-        create_its_idmaps(its_idmaps, smmu_idmaps);
-
-        nb_nodes = 3; /* RC, ITS, SMMUv3 */
-        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
+        nb_nodes = 2; /* RC and SMMUv3 */
+        rc_mapping_count = smmu_idmaps->len;
+
+        if (vms->its) {
+            /*
+             * Knowing the ID ranges from the RC to the SMMU, it's possible to
+             * determine the ID ranges from RC that go directly to ITS.
+             */
+            create_its_idmaps(its_idmaps, smmu_idmaps);
+
+            nb_nodes++; /* ITS */
+            rc_mapping_count += its_idmaps->len;
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
@@ -347,31 +357,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
@@ -387,9 +409,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
         /* DeviceID mapping index (ignored since interrupts are GSIV based) */
         build_append_int_noprefix(table_data, 0, 4);
-
-        /* Output IORT node is the ITS Group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        /* Array of ID mappings */
+        if (num_id_mappings) {
+            /* Output IORT node is the ITS Group node (the first node). */
+            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        }
     }
 
     /* Table 17 Root Complex Node */
@@ -430,7 +454,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
          *
          * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
          * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
-         * ITS Group node.
+         * ITS Group node, if ITS is available.
          */
         for (i = 0; i < smmu_idmaps->len; i++) {
             range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
@@ -439,15 +463,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+            for (i = 0; i < its_idmaps->len; i++) {
+                range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
+                /* Output IORT node is the ITS Group node (the first node). */
+                build_iort_id_mapping(table_data, range->input_base,
+                                      range->id_count, IORT_NODE_OFFSET);
+            }
         }
     } else {
         /*
@@ -768,18 +794,20 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
