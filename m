Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1647998dye;
        Sat, 28 Jun 2025 12:58:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXxSS/3V21aWM0YUl6lJ5CabCN4LyLe7NK0c8gnSo2wYS54wmnTkJbUz//jVuxkKya41ERFxS6fdHqew==@linaro.org
X-Received: by 2002:a05:622a:58a:b0:4a7:f698:9e6f with SMTP id d75a77b69052e-4a7fdbd52c9mr134158691cf.11.1751140681692;
        Sat, 28 Jun 2025 12:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140681; cv=none;
        d=google.com; s=arc-20240605;
        b=SXuM7I99xXade2XkqDQOWU2ucSN6lXqe/kdj5Tjeo1gfE6ItzdQYJ2tgoQsjk7AXZY
         bNPTHu+6mXeMFffyzOh6Alck2gZspOwKRDGLRRwt5lIunEPeLvbIvBNAadYUBviK/Hez
         uqp1Hi+C27yuczPkdnJm5mdPz938okZp6OKNTIImCBnKloL37N3hrEpqgavXM1oeEXKU
         x+X03GZ0vU0krmi9PjOoargin3WktqWIropJms99HvFnWAEP2QuIFwQHXzgkoGzwYVa7
         gX0pZKdxn0CW0Wy5DaZMTAI5TtIQcLvwidOY9pigbeJjd3KZQn5ZuITA5bz0O7GWpE8X
         zdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IZ0q9jw4G9PIRZS2vkZv4PVRsiR5/vYw1c9H/9K2wA4=;
        fh=kARz6y+Nj9S7VyoK7msxnwS//TAcILI/cvvdpjqnrFM=;
        b=hdQSYEA+wdtwq/0iiM76f7ETP1BaGRG6c9DxYfF1OUPVDzrQ4WQ4inDUlnuac86wjc
         ROigvtBCHGvp4SBqUKAbgkp2XWGgYESXHjEc9MjBaVz82+18USQV4WqDIrTVdTT6PPA6
         15/Rg6YHLiLD0Ys36Pk6X0aga1Ghh6pWoQNaqsS6h1hM8DT645xEAgxYFZFTUEB3DwZ5
         3b3rTzHGa0DVYuku6iq3s8hUVJwv06lPzeElwKfc4k38LKOELn9hOm9g22nRxG0uIRzU
         P8py4mUWBewdv98xzD/XPz5DToh6YnIpr92rWLrFRsT+8c1/RfMrW2b9Fd9T0zms1Vh0
         XGLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWUoYqwf;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d4431d127dsor413174585a.4.2025.06.28.12.58.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWUoYqwf;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140681; x=1751745481; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ0q9jw4G9PIRZS2vkZv4PVRsiR5/vYw1c9H/9K2wA4=;
        b=YWUoYqwfzRG6bMHeOwelx/tJ1FKSZ+0oRUlKKeqXxg+x0MMpaQ68qcw9uT5AraL/Jf
         wYvvdgNEpQ+seie8kosgYs+B/RqetLhIJ2nk102h5BN9sMkbb6KR50bdoxBsU49b1GwJ
         PMeu0inVfMWvOCUe57AhsnnYtVOHdHqKT7wniEcop3JVL6ncOAGqLWwOpn/auhKd/r8o
         8Ft/l/l9BTMCnHdstlZgEZF5ECgi/kBzMWg3GPZ+VcpmVqUnouQJx4ogd0+Pa5KZAF2r
         U7IWTeBZ97EcfzXFgoGqyERymhcpNt/2H1fYATR6n6D4lk4NcSemZbend7kYhqUTyqIC
         esiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140681; x=1751745481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ0q9jw4G9PIRZS2vkZv4PVRsiR5/vYw1c9H/9K2wA4=;
        b=CLhU8M+a01e/wu8SAgG3+A87BCFj+1hR511jSO4Uezi0XJF8uqCiw3CSJYeihjetZK
         cJbS5d+VTeF//50JxwhNp0Ht6fsSMuznS98gm8qMarUhFO0GcnTmJU98ekqPtiaCnyqU
         EK6CnUQLMFdLVNZGOBa7sD7BQLpGXe5yEm3X/u0Ab2syQGGrA8Y2CSoGgVYdDXJZDvQo
         YXNfryKTrOoIrto/b/vofcaOo39dsbOVKvNo5NTx93wEeasg3gV474g8ici6kOunj1RH
         2HT57hUwvSITtnWYg0JwYvMpA/57r9UU55sTEkwREcUlnu//x3c7D0E7oZPnuMw/ZDeb
         HKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyW9Ww5DN96bnZfiohVOsnKr6zVsU4CyWZn4NCkwJZ1anCcFygEQxZRRIzkdZRH3u1fe3+wCWpMCXVsw==@linaro.org
X-Gm-Message-State: AOJu0YzQlWCLCYyjY9WGjC7J8rzxm9d6Tvbx0g2lAMFcNjQbrxOpfE8i
	y2Vb3ztNsRj0SG73MOcaRaxsX0JpctfUOF/W+VQCmYxQXAB4Y+XUlHrWwQP/3Orbh7PTSw==
X-Gm-Gg: ASbGnctSJXVikq1ogmr1hBk0I0xOT8qjAmrgONL4yRDpC/GLiw/e7kqiNpRSB1YOoYG
	MbDWD1P2Yh2Vb+R02EXOFTpY3L5I7cVYfBTxDm0AjzG4Hh3GkLOoXhOKPQqQJJTbYFX6nCcu/Z7
	RPdiMZd8PJ3PFHnXMCqS5zzs0t0x4HB5hCP7u8ED33AO69zLg8zWRkIazxYN/mtPXu7UEQwbyFe
	vtCB4eKydk6WYi/TbWBRm+S+I90/UPZMjfTkr6vacGRmwHr2D6ObcmNog/tM+uWQ0ysr8yyneXV
	R9aGf6S6sBemGNm7Mt2FzhbU4x5UKoxfLuSwFcgH/GzxJOsYVhZb3nXikqfScCapWzU=
X-Google-Smtp-Source: AGHT+IG4kQzHVpMljhTiLVw6pgmFfn032FrbS3dfRfKmC+Zy+u7kIBaDPSgF2cKt5yrgUCiiivbGXA==
X-Received: by 2002:a05:620a:1714:b0:7d3:f8b8:b1ce with SMTP id af79cd13be357-7d4441b3c5cmr1022339285a.27.1751140681150;
        Sat, 28 Jun 2025 12:58:01 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:58:00 -0700 (PDT)
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
Subject: [PATCH v6 5/9] hw/arm/virt-acpi-build: Factor out create_its_idmaps
Date: Sat, 28 Jun 2025 19:57:18 +0000
Message-Id: <20250628195722.977078-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DFyEVu0UB3uM

Factor out a new function, create_its_idmaps(), from the current
build_iort code. Add proper comments to it clarifying how the ID ranges
that go directly to the ITS Group node are computed based on the ones
that are directed to the SMMU node.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt-acpi-build.c | 65 ++++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e9cd3fb351..068383f982 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -266,6 +266,43 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
     return idmap_a->input_base - idmap_b->input_base;
 }
 
+/* Compute ID ranges (RIDs) from RC that are directed to the ITS Group node */
+static void create_its_idmaps(GArray *its_idmaps, GArray *smmu_idmaps)
+{
+    AcpiIortIdMapping *idmap;
+    AcpiIortIdMapping next_range = {0};
+
+    /*
+     * Based on the RID ranges that are directed to the SMMU, determine the
+     * bypassed RID ranges, i.e., the ones that are directed to the ITS Group
+     * node and do not pass through the SMMU, by subtracting the SMMU-bound
+     * ranges from the full RID range (0x0000–0xFFFF).
+     */
+     for (int i = 0; i < smmu_idmaps->len; i++) {
+        idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+
+        if (next_range.input_base < idmap->input_base) {
+            next_range.id_count = idmap->input_base - next_range.input_base;
+            g_array_append_val(its_idmaps, next_range);
+        }
+
+        next_range.input_base = idmap->input_base + idmap->id_count;
+    }
+
+    /*
+     * Append the last RC -> ITS ID mapping.
+     *
+     * RIDs are 16-bit, according to the PCI Express 2.0 Base Specification, rev
+     * 0.9, section 2.2.6.2, "Transaction Descriptor - Transaction ID Field",
+     * hence the end of the range is 0x10000.
+     */
+    if (next_range.input_base < 0x10000) {
+        next_range.id_count = 0x10000 - next_range.input_base;
+        g_array_append_val(its_idmaps, next_range);
+    }
+}
+
+
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
@@ -276,7 +313,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i, nb_nodes, rc_mapping_count;
     size_t node_size, smmu_offset = 0;
-    AcpiIortIdMapping *idmap;
     uint32_t id = 0;
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
@@ -287,34 +323,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_begin(&table, table_data);
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        AcpiIortIdMapping next_range = {0};
-
         object_child_foreach_recursive(object_get_root(),
                                        iort_host_bridges, smmu_idmaps);
 
         /* Sort the smmu idmap by input_base */
         g_array_sort(smmu_idmaps, iort_idmap_compare);
 
-        /*
-         * Split the whole RIDs by mapping from RC to SMMU,
-         * build the ID mapping from RC to ITS directly.
-         */
-        for (i = 0; i < smmu_idmaps->len; i++) {
-            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
-
-            if (next_range.input_base < idmap->input_base) {
-                next_range.id_count = idmap->input_base - next_range.input_base;
-                g_array_append_val(its_idmaps, next_range);
-            }
-
-            next_range.input_base = idmap->input_base + idmap->id_count;
-        }
-
-        /* Append the last RC -> ITS ID mapping */
-        if (next_range.input_base < 0x10000) {
-            next_range.id_count = 0x10000 - next_range.input_base;
-            g_array_append_val(its_idmaps, next_range);
-        }
+	/*
+	 * Knowing the ID ranges from the RC to the SMMU, it's possible to
+	 * determine the ID ranges from RC that are directed to the ITS.
+	 */
+        create_its_idmaps(its_idmaps, smmu_idmaps);
 
         nb_nodes = 3; /* RC, ITS, SMMUv3 */
         rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
-- 
2.34.1
