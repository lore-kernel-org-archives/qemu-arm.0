Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4377164njd;
        Thu, 3 Apr 2025 13:41:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCwsVmSJgeyzPNBxsHZTXE9e+JMrTF4B4KyCXlRRp45IE2bR6Ud/2hRzo9+9SN+uyZrpQGm8UwEN3yRQ==@linaro.org
X-Received: by 2002:a05:600c:5494:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-43ecfa070f1mr3652625e9.32.1743712869171;
        Thu, 03 Apr 2025 13:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712869; cv=none;
        d=google.com; s=arc-20240605;
        b=Ic3SyFOTFuYRh1z5n4EoZ901EAv6v/RhtmT+meSAv7pG4MzQspalZeaJk6lE89S8GQ
         T6TA8QaQPp0ny9Q12dBFMY0R7p6mOI3FMqUM+2AfItf21O9dddZH1jfRbx6JBtYJIysq
         K92v73CQ6vPJyochbT0kSU2qBwxfTc+O8erX5LPWmi4Ppkk4cOJHag0kDskzrYEl44Ns
         8uG4JKiF8dHjqEVWakOjahpixiU2Cw+xyTAZw2MwiAADiRmAAkpBPl3PKm/UkDm362lY
         Ovxorns21ZRhgJiMVBenilLZW/xxeU4MYIKTvBNnNCNc2xp6puYkhmhSFusb7M/WmbGP
         isDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AzIe1y6exrD0xJczT8npcuq1OBfi7eudR1jNiJ2MiPM=;
        fh=+Rf8B6nudhkwy9m1NTUQsVrAOGplc7amEMSM2Jvi5Qg=;
        b=KiTADjgaGnNAZ7RZXM67NNahWPWK7YeNOjbXcheJqd7c6pTcSrcRW4Hv5sgrkKa/OW
         Io8HhG+qYX5JDKpgsqsKoQ8JClafS1HCSztU2wB0+x3GFRotab5l2R1UR9jrI41dnFF6
         S7sGHA1Gh4sNQ0DCjtWbFic5zTK+J0Zgz8p3uPb/G+bwIEM/eBbhcR4MIOQ1albvMISM
         JI8B84392AVPFaTCDYUugVrtUzvthnUKVr5CH2iRj0uNYGcRlHJF+HB+5fIjJbOUlXit
         5Qo6C3jTUqABh2cszjqQktHtHVJG9uJkzmxacp4YqMj1PsBEspgUzJeiCxatk+fvwTTL
         06zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4f0PrjI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c301fb889sor737867f8f.5.2025.04.03.13.41.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4f0PrjI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712869; x=1744317669; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzIe1y6exrD0xJczT8npcuq1OBfi7eudR1jNiJ2MiPM=;
        b=y4f0PrjI4KnG2CwF3/Wq7iMsMkB43qudhpSm5Yvxel/z2x3hq9mf2GiCffF+6s5SUz
         i9TZSh3Rs6BLvJ/NYJ2DvyhSKrax9DVYQOm6D7Hk5kA6hCJT6/bfiCqhqUfKfnMCzoQr
         7KdyzVntK1G5xP+CXyIGLX1iX9fGxlYUF+6aHjuax0W7gf0vIh1BIZrBRlOKPedp9ZsT
         +3xOEJ/5e+PIV9QvdVytMRluPL5Jeasytaktvg4cdbvh9ymJshotgadGld+NQa82Pncw
         m0BxuxnAQtXwc4rh1XaAhW/BtkiAkJXf2IWvawe3IY8Ap+knOE8yDSSDIl+d+VX5BVyF
         mHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712869; x=1744317669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzIe1y6exrD0xJczT8npcuq1OBfi7eudR1jNiJ2MiPM=;
        b=ru/c9KMunSDb7CMuOuapYhv+VElBh6sHeifouMp3jFhlOuqG6udnZGywq5QqYjM2YX
         uoGhuiE1p3619RIXBFQ9f2A5jilQD4Kfy4kdeUJhSMQpEWWYf920YAvkJPASKYRRcMXZ
         Vj7sOH89tGlQSkXGwGHJNdE626+mINn0zBiveRFmEDbFQKFtDqs/4IcssDA23vN+I2ur
         EfJfYM9h4oIAUMSM5ZIkiEh9S9pEy2z7YrYApvcT5Pk+9eV2xgBmqAgvmPieOCOQnwQf
         snQKezGfqwXOWncSqyW6NnHIjF1U+45YGewVV+YsR5f9rySJGYC6XnTXcc80Cg2u0pWJ
         EV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlWlNMsFMu3pCS3E6Yg6pMkiN889AGV/QxV755oUDqBENpEfKXi8uGMvAuS3XDMomQ33/2bi/IHKM9RA==@linaro.org
X-Gm-Message-State: AOJu0YyYzC2JZog+owwDeusLHaiai5rQC0JNCEhAC6X/8d7Tx//YBVWB
	71MMYQLpRGKDhy4yIMLIUTchZI4f77lruYVtD/TdTIBmozOQmc92awabjxuq9AI99A==
X-Gm-Gg: ASbGncvUXcL04iWIXKVD/Y0JYDEcwqUaYwzSJowx7/ZvD++cn+YdQq+ZvTQ81Vg9GBP
	lanEfJw6iVmQATJqoy8D4oA7WgnAKtKbCHodKAt5EkNxHc6dCPUfhgtTiKnUj4fEApOuc/N46gI
	imy6c+dtG+IzSL3MCQEU7B2uN7XdiuhrVow5D1hMo40FtxB7BpuM25hwCGUHnvKJZ+ZsWqgBlrU
	tZOBVknb4rUKLv64bqYVdFAXOmpnudScFsRzjGDYDkp9CQf+VOSw0qtwgturkjqD/uECsYEOGwd
	hpCi7nWhua6zUJDAM3+FrXB4/eonLRJmEV/c5/un1EyVc52/EePfU0+Pec2D8tiLGCF2yvH1H2m
	4t4i+7iPY4AiZw1jBm/jGiIH8
X-Google-Smtp-Source: AGHT+IGf6uH+7GL3enjPwL35FczmiuP3WQ9HgY23LIOqkXLkKIH/Lul8LuROoosf3k3pEiGcm8IRjQ==
X-Received: by 2002:a05:6000:2509:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-39cb35b1a8cmr571814f8f.35.1743712868622;
        Thu, 03 Apr 2025 13:41:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm30923505e9.5.2025.04.03.13.41.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:41:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v3 7/9] hw/arm/virt-acpi: Always build IORT table (even with GIC ITS disabled)
Date: Thu,  3 Apr 2025 22:40:27 +0200
Message-ID: <20250403204029.47958-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rdkC6+dUJbJa

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
