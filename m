Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1647984dye;
        Sat, 28 Jun 2025 12:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZQvri+RJipy3adYbZj0uBdS51/90QoGgPGEzSdkiYBKWT6NTgkpRARI3DrNZtSykVUSwBna4jG7rsew==@linaro.org
X-Received: by 2002:a05:6214:5a08:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6ffed7a5801mr148253046d6.5.1751140678101;
        Sat, 28 Jun 2025 12:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140678; cv=none;
        d=google.com; s=arc-20240605;
        b=NSl26ftHsAnL/qz1jtT+7uqDqV5rA7iFKnkoMNhXqcm21nRouzafXH2vjL2EAIMuJV
         mdSp/FSmldhCurLh+vMXNFBnGLkOgyFbsBLMPpuLfl9fVCxygFPwItPHolnLYTR7iRcT
         C0SzEMJcaAHEJdTwLP4/3mzRXc3waXa36KL37/wygR8/EYajgHKVZ7Kiyz18PC2CtAH+
         hNG+QzOVNqARHx6Di3WZnlK4DLGVnY4/COMYaPboYmJt4MOMSbA8fG/K1pfPgk633gVw
         CxvOR3UehhTwv0ykEmO8hAB7VPSp2bErlX4QgODTiGNi19pRleCgs/UjzycCmJLZEPBj
         zVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8eAh8MiuuyXhzXsKk9pEAPJvTRcVqDS192gJR9vUnNw=;
        fh=EJtrG6zCDkOUtksUdotvl7WyWJWoaNE+JlFvO9p1Xfs=;
        b=OTvoQkkb/fMyBZFCVSdTMf0yQMPUoNAEyYa/umYPvcIPJzw+VguU5n0TUKVakl0e9T
         OXj9iXvwp5w69TpQ1ocnMkAeK75xB3///XbhY2rxF+DY7biYtAdn5JC0erAejtvosCpE
         enCCu+fF9jUiGCwRNQ/W/HED8frBo+r2q9MIKjuUBqZOAjYlFSQiySw8nReIBMi/0jmX
         qzQkxIJUqH7ko9EtiyAXpTkyvsE+s51c6uEWruCCz3gKaiTGH2JDRO5PitQpLynNVwss
         qIcS87HwUxJayRmqhMAXorijYjx4Gmxi75nxpwL+wrCXWPYvCJKyS+PJyq2RjC9HEJHn
         chnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vC6LHT9n;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-6fd7725dd4dsor90879146d6.1.2025.06.28.12.57.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vC6LHT9n;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140677; x=1751745477; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eAh8MiuuyXhzXsKk9pEAPJvTRcVqDS192gJR9vUnNw=;
        b=vC6LHT9n+uIL8arHP4bEWTOKvasmtn34zs8+LUXUF9Ibw9sbbix95lhaC0EfwhvArh
         fU7FJvGymDA1FyP1Lc9NNoLMPiOHxP9DKKzG6JIrx0CYc2nl0RauZcVY2CV9Dwnt1L4D
         0jQtxqgbha9ektgvK46XsvuzW9Z6SwEGcCUGb6Pmq6gZUTa3O235MF1zj1H9b7A1kHA3
         0TiNFPBo5qGXqvS18V/5/uwMN2eldscltTm/B7gqDO2+FOMCz/zOpjA78BId3a9bFk3f
         gJZyhMFJy6AYz1X8jEQ17iBd4eqZXWGVqt6nIb8K0JwzqL+Hj5elZMBwL6FCbEPHvb3n
         FimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140677; x=1751745477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eAh8MiuuyXhzXsKk9pEAPJvTRcVqDS192gJR9vUnNw=;
        b=HqZOQi90IRagpcGWkT/dv1xCa5Rd0Nj9H5A7pWQNzzGMhpqIhhTLk7vfD241s86syk
         mj3LnS6I2UwZDr6CczXhDOJO9Vp8a/OjhwPH/kfJFq4lsANVyMQ4TUOu/YedvjTkh6cn
         j2WxSGD1MgX0WQbmVhW3rQUT5w7Mo7SCtQAEEGYZ9FMb62dod6ES4Kv8ZSKb6ufn0t34
         7lz+tDIMi1zmENcU3hQiftM7sprfcGfIx/4vqJOkFTIWXD3C6pqtqTcYlEehWfs5m15Z
         AduNNyzKsSBenNXr2wzxfhkKVx6HwUc9Kgb6UykU8tdtxqc3iXj7G/dQUjfa1e+aGszM
         zl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxiy8a/lNyg3NHg/B+oPqa9MazIsgLHOsDV6IvwPs5+8d1gBO/kgoUfyGujI/KNMe/Vc9UNCgB8vhpeg==@linaro.org
X-Gm-Message-State: AOJu0YyZhHzeY+oVedhK3SUyVF28wXJ0sPY5pBLmfk3sxV2NbhJgqFUQ
	NQOUHTeZAf/ZuY5NUWWkjsawt3MF2MYF/qj5Kcc+Wd2gg406CDDciwzNQSSw9hLtZUziqQ==
X-Gm-Gg: ASbGncvflztxNQBodVw4hdJj1iFHyN0yvgAkOVFORmZHT8oPMMw974lOYyw5CvfuYZK
	FeNPeG7GC4PXDOBUOjKW2IyhmN8jtyEuBVr1G88z0nx4c+1tdiX+iFTXWdXRjPiWGfTxBcwfn+a
	a3HxdP7HEGwy1J4GPhVcl47tqU5+NsryPA6XqfzKbU+4+UIaf/prl/C8hq9tufm8k1lBFewf7Xo
	aIrqFT1aQflZVJVsVqT9m1E5tc3prRuSLPfojf9Gf1NJxGLaFEGG4eodi0383Kn7Swq4ZfAj9AV
	MxUyqFYmzufghtjS1r3ULMektlOPjhtG+dk6VKWo4a0stGgBdRKTB+SS6I1dEn6uD3Q=
X-Google-Smtp-Source: AGHT+IHJP6tbB95365DUQekapZW9P5PxX4fgVY0oZtXDgrSxSVBZgNQE0vxs+xjxa4g3bEGlcGAvfw==
X-Received: by 2002:ad4:5ae7:0:b0:6fb:5559:b3d1 with SMTP id 6a1803df08f44-6ffed7a54ebmr109996836d6.1.1751140677531;
        Sat, 28 Jun 2025 12:57:57 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:57:57 -0700 (PDT)
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
Subject: [PATCH v6 4/9] hw/arm/virt-acpi-build: Improve comment in build_iort
Date: Sat, 28 Jun 2025 19:57:17 +0000
Message-Id: <20250628195722.977078-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Jh22a9AntIpZ

When building the Root Complex table, the comment about the code that
maps the RC node to SMMU node is misleading because it reads
"RC -> SMMUv3 -> ITS", but the code is only mapping the RCs IDs to the
SMMUv3 node. The step of mapping from the SMMUv3 IDs to the ITS Group
node is actually defined in another table (in the SMMUv3 node). So
change the comment to read "RC -> SMMUv3" instead.

Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
