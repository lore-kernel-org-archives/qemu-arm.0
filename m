Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851547njc;
        Mon, 16 Jun 2025 06:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2JiIzRYAT/5DujDuT0MbKg3jTIkQKZLpm11YUzVT5pJ1sTi1+5xYdx0+Z9oFEtLn5CCaSilajQ9Rpzg==@linaro.org
X-Received: by 2002:a17:902:ce88:b0:234:a779:47cd with SMTP id d9443c01a7336-2366affb2d9mr148239605ad.15.1750080024061;
        Mon, 16 Jun 2025 06:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080024; cv=none;
        d=google.com; s=arc-20240605;
        b=cpTreMb9xc0LiF+ftYu6iNhYpCdK1K3UUCwdCiF3Sm4WXja6gasZwW/O741wptSLWU
         mm3RDDD5zw773GeMqG8I7V6y/xpjkGWvLclolIQfT3lFbxaoaWgKurGXgwU1haYcdEmc
         6H0t1y2APQKM2m0+GnwEW1mgbke0wOnLKtp98ig0ZHbPtlgHN7NwSLyJWxGKqNX0S3wW
         cUUagoe3aBKEWz8sDPsbwpnCzq0FTmY/qUr9jEC//d8AX4zGz/9UXP+39d99UHOsvOuv
         Ad3e/vtEmbxekjxUSs2sbh09aOjn4tIoU9Hp1pRHYtU8EemE4fyxXgPiYkBvwJnxXKqt
         OOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D8W/yE99oVdomm0D2Fyb+s9ZavOYJt5IOPZHZYUPXcU=;
        fh=Hip46XVXZ/xBMTb3mBZBVnZImzVv6XNPH7ATY82m2Bw=;
        b=e8YSZcfIq2fHRiaRmmZgR7MAxJTZJVvjWW9dg7Yzn3fmsJ4mODnixwYPH0LpacWzsE
         oY2z2dnYBsUJ2jcDXAmqgrlhtIB+5JEZwSaG8cYfwqqeX33HoJZMQSqZ87ZTWSD2kATa
         zt/OTx6ZuFN/ddDW/R1K6NsNABzpRifWzyCj9rR6/jhi6kDzCub38HrJq5Lzn0GeAZwr
         aKa1ShWx3IluwZIdvSoc+awNEO2yfo2qa6ee1BFKzhzRYyXLNwMgGugBvZ67xkSFmsiT
         rIXnm+KKdhHPvMGiiaoZc83JYrkZ8xlpheDuy4KGDQKDnbVA6h/oJ7vNet6/xiXArXLC
         BgaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gUTY/nvU";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2364e6c31a3sor69767665ad.13.2025.06.16.06.20.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gUTY/nvU";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080023; x=1750684823; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8W/yE99oVdomm0D2Fyb+s9ZavOYJt5IOPZHZYUPXcU=;
        b=gUTY/nvUcns6CsDWMAh2rp07/EuWH9nrl9dZMuQMwK2beBn0ipcLjhejQiVC92HZAc
         hNnrcFqCm8EUMfx1fGck2XHQlVw8xNP+qegrG0LaLhi8dpSf2W9Awuj9brNz+m/qfUBt
         B+segZnIA0o1Qi5vTOi2H8kEjYyfKP7aa2nn1Rw1PSIzNwGJd8wCNGk/03i+evPI49k3
         P2TgtJLLLoC6e+cK0uvYRuTeqWc38hvA0nxC2W4HpU5snbZY1AO5r7Z0iWDghspzIdYa
         kPIsRcb2WcN48i3zRYErp0jBfDRjDFtk/bNhxupyI20lGCvTv+sakkNY2YC05GeCiyuX
         gEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080023; x=1750684823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8W/yE99oVdomm0D2Fyb+s9ZavOYJt5IOPZHZYUPXcU=;
        b=BVxkYDHUP6SDbdMKfTjNvtQ/8La/9Q1sNnddwFUf4yCPQDzh5DVIDPHPRx3SEtJqTl
         zlAqijJxYxzrdrtwNx3BfmJYQ9rhF2OnaAYhNmqYUzwF4Ll82GIumihdI50eI9wDxF17
         FS4Uk76a7m+qu2huYEZQ2eN3VnMsY9C1uQb8ZrMuCPORW1YPK3nIPKwJaHS/ON6DPZl8
         VAm2m150EaNCCDHPPM9UhjXp/7Mq2500qW1OSy42XBkFTbWe2MEfBfmwBdw2inVKmdOf
         lSBOCfwShyLkJnKZ04spYaNYmXLpI2MSR6q2//BBKH26g0ePeYiu0JXwSfZexXRUA9wr
         Z5QA==
X-Forwarded-Encrypted: i=1; AJvYcCWSU7cZPvCnZVPJQ2hxwtcy3oOluRd+lPfloAmGhO+rCFti7h3F8Vczc0J7AKWLryZ48g0/9d2il049LQ==@linaro.org
X-Gm-Message-State: AOJu0YwOY9pEnDEiLjgD8HZ/ixZCp+AFO/ISRGx/ap8JpMTdqu1JZQLs
	1LmGe2D/ryD/X5bgKaY3m9HLisJvdw8im7FDhUuy5hPEbFIaSWufzo3GBI9E9QjUrVnoOA==
X-Gm-Gg: ASbGncsAQh6BXuAG/tEDpgNsVwav/7ZzpOp+E6lFryQp7Ulu5KQx9Z+jNfWAyWnVGkK
	yXMB7lEXx4qF7gqWCSWI6mGjfpiPsUgB0zW9EnBAKdX8DYSBizoqkfQmAq1IilA5qy+UhnlSmhG
	PkDFp4ES0MYkSYm50kkTbVh1aX9Zu73+k5B2Xpg2UooUaLqxmoB0bEMx+R7UxPiICLyHWpCrS8a
	HoRMjrR7b85pwQzSjFpGG1I1Llbl8FUoU0q9kAwLQGecFGHgtNfJazkQALRgcvoMhlwOqi3cLVK
	KlPHbonFb6bY8vBtTn344tysC9WGT/r9UWD3nFz+dbdxn3S7zSZo2ePAJeuZzJtIPX6WhI2yUpU
	3Kw==
X-Google-Smtp-Source: AGHT+IFaHruaonQo5WTISuUKEmzod1ppAIC6mFjlggBADfSPAlO2iVq41L/proSl6+ZD/e9QDYYkgw==
X-Received: by 2002:a17:903:1a8d:b0:235:f18f:2911 with SMTP id d9443c01a7336-2366afd3873mr149900765ad.2.1750080023418;
        Mon, 16 Jun 2025 06:20:23 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:22 -0700 (PDT)
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
Subject: [PATCH v4 4/8] hw/arm/virt-acpi-build: Fix comment in build_iort
Date: Mon, 16 Jun 2025 13:18:20 +0000
Message-Id: <20250616131824.425315-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PyxDlQYY6szU

The comment about the mapping from SMMU to ITS is incorrect and it reads
"RC -> ITS". The code in question actually maps SMMU -> ITS, so the
mapping in question is not direct. The direct mapping, i.e., RC -> ITS,
is handled a bit further down in the code, in the else block, and we
take the opportunity to update that as well, adding "RC -> ITS" to the
text so it's easier to see it's the direct map to the ITS Group node.

Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt-acpi-build.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9eee284c80..6990bce3bb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -407,23 +407,27 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         AcpiIortIdMapping *range;
 
-        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
+        /* Map RIDs (input) from RC to SMMUv3 nodes: RC -> SMMUv3. */
         for (i = 0; i < smmu_idmaps->len; i++) {
             range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
-            /* output IORT node is the smmuv3 node */
+            /* Output IORT node is the SMMUv3 node. */
             build_iort_id_mapping(table_data, range->input_base,
                                   range->id_count, smmu_offset);
         }
 
-        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
+        /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes: SMMU -> ITS. */
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
+         * Map bypassed RIDs (input) (don't go through the SMMU) to ITS Group
+         * nodes: RC -> ITS.
+         * Output IORT node is the ITS Group node (the first node).
+         */
         build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
     }
 
-- 
2.34.1
