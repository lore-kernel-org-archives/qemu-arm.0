Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567238dyb;
        Mon, 23 Jun 2025 06:58:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXQTcZ/CKMx8Gz6LGj7ZIC3J+tSOBQswB4tIJKiPo8K+cGbsjV5yBeWEDKbd6fg+yuLRzgIKQEtjaiwA==@linaro.org
X-Received: by 2002:a05:6a00:4b01:b0:748:de24:1ade with SMTP id d2e1a72fcca58-7490d68fcb4mr17399783b3a.7.1750687121277;
        Mon, 23 Jun 2025 06:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687121; cv=none;
        d=google.com; s=arc-20240605;
        b=W6jA8viDCc8c5t27eouiplgvL6JjPB5iNK4yVRog7ekh67lVGvvf0bohzUlEhly1RS
         YNf7jVo+yje+BTG+SCg9jQZ4gfyMclTmgSo+t2HwkFaZqyuqovm6Sbt5gIL1RoQBrNmW
         /oAqrQnr2NbWJYwqZzieJLOcS6wSx7EakScBq+qzRug0ixOSzFfR3cUpSlXPoxFMhFvB
         yiRcVbsoKvLALdQ5bV0utfMKFTTPWbc/uyQ3tKUaDhfyA2+++IryNuPb2MxoApZeAA17
         lzP3dfrvbrmLdrravcUiEAoIG3Qai7E0OmMeaa6C05M7vPGOlT20hJUUqsDSTKSZ88PW
         km0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tWwtJe7sGsUGEueqmsN3PVBl6pSQ948gCik+Qy6mwyc=;
        fh=TNbeKj27YK7w7UTWeIHZh+LUsrAjSB4tmRWXT2Q6JDI=;
        b=ZT0viUk2laiOBkHmweLpy28StM8LZfs/rVX5DZ3o0eK9vZLeJ5VYY0n2fXQMi/+Ghd
         WNI7EvzYrUQ+uyMySg6YcasSKM+DjHCQq2QVDC7OLatuTTROxGg/iuGEw8qG5cxTWb4D
         D5xu2Q5X0y6VBDf5SS2impQ4WMu5KaXd1fsKJCTHh63ioTelVhgxGnoQfPOIaqAABQEs
         DNpsOiR0JsiaRkUg4rZ+L9ayLjrJUIMgedANaETTH9JwlLBxyAEvjkB2PBtv5DGkXgII
         9pGeRnGxOcBMVfqLin3aPBynlSkEaQVbMuc931G4Ga0i+KvYXXsAADJpgdYmQcQ1lpHs
         ehoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EUTf5dcw;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490c8ca11dsor3403502b3a.1.2025.06.23.06.58.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EUTf5dcw;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687121; x=1751291921; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWwtJe7sGsUGEueqmsN3PVBl6pSQ948gCik+Qy6mwyc=;
        b=EUTf5dcwDIrSc/sGhlO5HKGQQkmYSrzyBkQinxOrqYArT5aQOg8Z5Vo2VjTXnFGt0U
         XP0MMByWjdscG5u2ei0H8TPv0199WmXCse+tC5VQX4Jnps9XvAOq9gwoVyPnZsGmmgWX
         TmIu7I6GLbyRDqCzwhDVcsxtPxmaatrKLPkk7P4LfBf6O9dJMcRSZYZv35xo/Zz1qK1Y
         wOsJmzSGYITYop2ru0jC3NOIrX0RBTu7m7z+7i8IszKI1bPBPwe2Yd5RVkv1czsJrNtN
         IDK7YI+UTs+rx1WSCp1PsAJQ5YSQTpoV7Ear5EmzDhM/crEmMhUFyOXnTOcPSarg3kSy
         R5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687121; x=1751291921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWwtJe7sGsUGEueqmsN3PVBl6pSQ948gCik+Qy6mwyc=;
        b=Tf6AMFty+hHIN+bjy8yo3Zqh1z1oGFQe57QvJ44MvmUaHH2FIYKoaZCo4KGSYMLSoB
         FJXRE5gvGrkHjfmszVSN76d8HQ3OJhfO1Wjyk/+aO65ICgiUA+QR/Yry6xJwkzRzpXvb
         oz3Xk68TsrpmALup5jUBv9rPn8RRsiS6DQGQJsCgC3l0h6tR2NhsYyTXLRTWfuL0O4g1
         GkdVXO9+nVzPZ055nwUTDCkB0wdt9zKrf5Di4b3A++jOpgLWXxiq6n/lVI2tWo3INwy6
         3w0olmeFwqcwqsL/bjtCYgJQRa83Fm6n4Hr7PqH1d6xcK8DV1gQ3b4MoE6fsqJOe3JuF
         +zgA==
X-Forwarded-Encrypted: i=1; AJvYcCVw8mJwSHtWE5X9MbhoQI7J+2vdzHr4MdZ6nLTn4QMyouCDVZqkAV2MBbKCuj4HYKYQtx3vb6mZbpdQ8g==@linaro.org
X-Gm-Message-State: AOJu0Yzs1jPg5oCoKrW11L731ZBlE3zvXDiOCuSqO7wkWyVyZu1V+pas
	+dGS6XUckzv0uNkeHMZLPcnA8EyNM9GVGYfMhy2igHGQY7lTO1fBM9zdCb1U4MkvxbPELA==
X-Gm-Gg: ASbGncuRyEAEh4rnUfEHM2gZB46vdg6nenLIl044s9clQYA2ZORpFAg6saILzAXH8ld
	Rbjpis6GnebSAh7iPmkc6X9d1yaSwsCqBvvs4ae+pDmsghUFneI5EERSpMM5OdXV/GL/EBLzneJ
	XEoPyypGK/dL+SjTPYlGAjfFFA2xyfvMbqiTMBFCyQuyr5PFUFn3atO7J7BUVKvAB1d/HMk7V3R
	hTNeSkBaYDuk2qtAukn3FnvNVCyw5HDfp6S6RhsRevtQie4H+CG6lWGod+ojQGm0LWIf45kT9ve
	lDUmA0Thlsq8Du6FaTFFB8YOcG7R5BDA9zZQ0ZxccZXpMX1uACy89BE45n7WEo8wBBg=
X-Google-Smtp-Source: AGHT+IEP5weTA9lYRUWvac9OZPElw8rZVoWde3YML9FuBKQ3hKjUCj61HEYec5CnNc434BOKk7xUmA==
X-Received: by 2002:a05:6a00:3c90:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7490da07100mr18027642b3a.21.1750687120824;
        Mon, 23 Jun 2025 06:58:40 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:40 -0700 (PDT)
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
Subject: [PATCH v5 5/9] hw/arm/virt-acpi-build: Factor out create_its_idmaps
Date: Mon, 23 Jun 2025 13:57:45 +0000
Message-Id: <20250623135749.691137-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623135749.691137-1-gustavo.romero@linaro.org>
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UBJKD4reTble

Factor out a new function, create_its_idmaps(), from the current
build_iort code. Add proper comments to it clarifying how the ID ranges
that go directly to the ITS Group node are computed based on the ones
that go to the SMMU node.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt-acpi-build.c | 64 +++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e9cd3fb351..40a782a498 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -266,6 +266,42 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
     return idmap_a->input_base - idmap_b->input_base;
 }
 
+/* Compute ID ranges (RIDs) from RC that do directly to the ITS Group node */
+static void create_its_idmaps(GArray *its_idmaps, GArray *smmu_idmaps)
+{
+    AcpiIortIdMapping *idmap;
+    AcpiIortIdMapping next_range = {0};
+
+    /*
+     * Based on the RID ranges that go to the SMMU, determine the bypassed RID
+     * ranges, i.e., the ones that go directly to the ITS Group node, by
+     * subtracting the SMMU-bound ranges from the full RID range, 0x0000–0xFFFF.
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
+     * hence, the end of the range is 0x10000.
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
@@ -276,7 +312,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i, nb_nodes, rc_mapping_count;
     size_t node_size, smmu_offset = 0;
-    AcpiIortIdMapping *idmap;
     uint32_t id = 0;
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
@@ -287,34 +322,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+	 * determine the ID ranges from RC that go directly to ITS.
+	 */
+        create_its_idmaps(its_idmaps, smmu_idmaps);
 
         nb_nodes = 3; /* RC, ITS, SMMUv3 */
         rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
-- 
2.34.1
