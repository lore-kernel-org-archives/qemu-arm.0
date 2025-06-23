Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567214dyb;
        Mon, 23 Jun 2025 06:58:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfWdJyIyfoXinN8bYULxY8jzJmWsm1G5HN1kvRFNF4kBzzfk9iffaGwb8EcC+fNLGRnrYpbaafhU1asg==@linaro.org
X-Received: by 2002:a05:6a00:2d9d:b0:748:ff39:a0f7 with SMTP id d2e1a72fcca58-7490d5d0a0cmr17695985b3a.9.1750687117703;
        Mon, 23 Jun 2025 06:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687117; cv=none;
        d=google.com; s=arc-20240605;
        b=EkBO/kfOT9hfKuhOCNflMjA9k8CtwHMDba5gJ+mel/xWhkDdAbl/0vSKexGfzeqcx7
         O5bF4G7ZmekN16mq2QHrBhd7lX7zw6PFClv5N2N1HDJU2DEAFkJGY2MwgmnyF3e1PrFK
         9z2jrvJYWUFmjqOHK3t0gnjE3pFi4Fl7633KzzNnKSaf/kUTyOll84TDhwNaZ1kI7MrA
         dD6lviRyGUn5btxlO1vrxhjjbKoZZfUlzXSMMIefzKIA+jKmG2HhwOdrdxnWcI5Fo2p+
         qIG/yqRgdcday8UvQcDUGsG83nb6757fxOkwc/E7CgLXx0MXnTenFZxHwyvBtMomBhm6
         cu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QHmEaaRegYwFGlGoVTGRYvzmrkIrypDwOG7loJLMkas=;
        fh=sfXqt6/jaC3s80SVypgv1WO1nwSgrsNeQYkmPiC+l9U=;
        b=MkHML/rfhdvLHTU4HXRl0cu4SZa2GTkPTT4y9RrXRyAtRTHdmVErKeyeavUhyvaMFx
         pFPm3kVc2KXvgKvIYmw1/X4nf2rGZaHVcqdGrAiA4QVq2KdeqzDKSUkx4aeVMLLOwzB4
         nltwv1zMWtul2ugneFDaFocs2kp4ZKsnME0/JgFsl7v2BePl0eKaIuvKs5s0j8KIGi72
         BlHGWP5rPO/fZ1d2APYVT215OhWoC9k+/pskxOSYY/hrlzVfPxPxbIF8srilJN5ZbARt
         ROPNKQ6aV5MlkvAKBt2c93cb3DzGbgS2Qv54FY+CcOs/qn6CqD/CholDYgnwiuKO3Byk
         TNkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uRntAErJ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a4d81efsor4030547b3a.6.2025.06.23.06.58.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uRntAErJ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687117; x=1751291917; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHmEaaRegYwFGlGoVTGRYvzmrkIrypDwOG7loJLMkas=;
        b=uRntAErJBCOwFRQvRbFhRlEMSwxjry25pp6rMT99dmUEI6iKIREqBj8M1Ywb48u35Y
         6ACjWqUJN7zZjpwqOQGiuS0cd3nCagxAGNeygwBqig+d14ZDlIzPzze+Nnp8R+hPkp7G
         8mnAjm3ccB7PMfWNnXLqjnlHV3ck3lCcc9evih8uJ3Q9IzOq+6nta++t2ydmJoQBB7Z1
         h+5hqtpgVbcElzmtov3i74POjzqIMcue5XH0xdtUAtCwkiyvAptmGXnqPsMF73TugwEX
         4TPdC/ylvhLXS0JeJaE22j69KofRDsxV8fS9lrUqSJ+hl+/wWCesTWSB+I/xhYXatoyX
         c0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687117; x=1751291917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHmEaaRegYwFGlGoVTGRYvzmrkIrypDwOG7loJLMkas=;
        b=DuW+LrilpJ/ih/aGlXSH3Yw7ddosGHaJ/z7ZdCWY9rsm8aU8zLd3ptnbTah1DnGYT8
         4SgHCL912hXYCDPsWv156Zi8l1KjcUk3e6qmZzyjTS8PERFlEbrHzJG42NtuZIOlHMRC
         qCOMLCZGLVr8MlTISDwQehNnYKQRu9qLVxCDqXA2fs08Ta3A2J8Ub89USmB2catUTwQi
         bqIkhbzYJo/Nu2HMGj2LHHffvU+IFLgqc8/HA+L25O29/tDZJMh5NyyUV9fNiNuHTqxl
         xo//ydLhslfUC+iAbOC5eHXBJ53iIEyi/G9WbgnoVGInu/u1118YeC5/BDb/qoSWZb3T
         ebgg==
X-Forwarded-Encrypted: i=1; AJvYcCUw2wbL2wyBy6eTJjCrLeVY9BrFzBgKdJ+feghIlItdtzl4U5Cwn2ELtm/H8qKuZL/RQ95LFXZVyzPlpA==@linaro.org
X-Gm-Message-State: AOJu0YzDv3sDTXXBprSMgJEybLNCe8kdtkQszQcqPBvHhLQYWD5Rmitz
	as1djr73z1C/zhJFQF0oFhFMevWEnWjil4QrdjhihHS7s69Yw5QXLlttClyNk+rdJmEpTg==
X-Gm-Gg: ASbGncv2BtT31KKastGcW4wkVNT2BwgeEc5z0kMmYM65sHVjdMAR6h5DqQy5YkfTOvf
	sNLY+7EPZBM9//64DDkCnTdudBVN+qZogctKVz3tqC9JPX8yjc3xPDznsZg6rFE5OLWxi9ei1DV
	nhXaqticaopWzVdZxvPM7m6qB3QzaGdCG07USQC6Jg9xuLqVO0f3bqwe5DlTKLEbybuWayx74MY
	Xca7RvSs984HWavdnJLFLsf+ZOOpu4ZtOmoyQaL/fX8nMS4tLuKxf1bbl7+aGN3L6gT7yr0WJ2/
	eFwS/GSA/t02IZlZIKsKG86mSoxmd/lHbKJXSxLY3P1FadVKcYD6nklNCv4yrRMC+I4=
X-Google-Smtp-Source: AGHT+IErWAFwMzcz/MjBmkN38EukFVknW17niV69zGOxvdKP40Jbzg6+ebXlnwGxu8z2XQPLIQXvZw==
X-Received: by 2002:a05:6a21:a342:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-22026e9c88cmr19082150637.38.1750687117248;
        Mon, 23 Jun 2025 06:58:37 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:36 -0700 (PDT)
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
Subject: [PATCH v5 4/9] hw/arm/virt-acpi-build: Improve comment in build_iort
Date: Mon, 23 Jun 2025 13:57:44 +0000
Message-Id: <20250623135749.691137-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623135749.691137-1-gustavo.romero@linaro.org>
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SOs8NvVmhzSN

When building the Root Complex table, the comment about the code that
maps the RC node to SMMU node is misleading because it reads
"RC -> SMMUv3 -> ITS", but the code is only mapping the RCs IDs to the
SMMUv3 node. The step of mapping from the SMMUv3 IDs to the ITS Group
node is actually defined in another table (in the SMMUv3 node). So
change the comment to read "RC -> SMMUv3" instead.

Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt-acpi-build.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9eee284c80..e9cd3fb351 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -370,7 +370,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* DeviceID mapping index (ignored since interrupts are GSIV based) */
         build_append_int_noprefix(table_data, 0, 4);
 
-        /* output IORT node is the ITS group node (the first node) */
+        /* Output IORT node is the ITS Group node (the first node) */
         build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
 
@@ -407,23 +407,36 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         AcpiIortIdMapping *range;
 
-        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
+        /*
+         * Map RIDs (input) from RC to SMMUv3 nodes: RC -> SMMUv3.
+         *
+         * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
+         * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
+         * ITS Group node.
+         */
         for (i = 0; i < smmu_idmaps->len; i++) {
             range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
-            /* output IORT node is the smmuv3 node */
+            /* Output IORT node is the SMMUv3 node. */
             build_iort_id_mapping(table_data, range->input_base,
                                   range->id_count, smmu_offset);
         }
 
-        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
+        /*
+         * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
+         * node directly: RC -> ITS.
+         */
         for (i = 0; i < its_idmaps->len; i++) {
             range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
-            /* output IORT node is the ITS group node (the first node) */
+            /* Output IORT node is the ITS Group node (the first node). */
             build_iort_id_mapping(table_data, range->input_base,
                                   range->id_count, IORT_NODE_OFFSET);
         }
     } else {
-        /* output IORT node is the ITS group node (the first node) */
+        /*
+         * Map all RIDs (input) to ITS Group node directly, since there is no
+         * SMMU: RC -> ITS.
+         * Output IORT node is the ITS Group node (the first node).
+         */
         build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
 
-- 
2.34.1
