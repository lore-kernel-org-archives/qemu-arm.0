Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851406njc;
        Mon, 16 Jun 2025 06:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcA7kM/JgIgr+cFh5KKDbspa1+ot9lEKA5V5T5kJ3FR73HwWK8MJJy7VxOv94g67MEkmwFdBbYCvi2Kg==@linaro.org
X-Received: by 2002:a17:90b:3901:b0:311:b5ac:6f5d with SMTP id 98e67ed59e1d1-313f1deec45mr13400359a91.29.1750080013144;
        Mon, 16 Jun 2025 06:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080013; cv=none;
        d=google.com; s=arc-20240605;
        b=OCFptQnEUxMpETTHT9OvraGJN6hXolAPOGnsxILCVbHjiWIbyLhQs2ET3M78LM8yJR
         CMeOGhBrqxslCO8+CO1gUjtzIErG2SjLpFjpI/L/w5+5WH7G6hjryzhREUN8YSoGm62Q
         8V2e83wThHR7aP48xF0+Q1Xn0Kke1jv7z1bN2yXO4g7iYMj8zPmEorP9DxX8jgUIQiec
         Cnd4H5bgbogd4/gZQ7ysDENLfsWHPi1kGYUs1iO+bXHKTrV9xeDwrqqEMD4TDtMKooIU
         iL95n5fd+0fryjuuGA0KAaMf//+Ja91vnHtVOnNI1x9DrJgrGzcV+RgcRZsONg1EWBgg
         H9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PUB2OOKyEQvR4QTaMbE6HOiXKSfQPJhPDp5XJ1tNVCw=;
        fh=+OWmY9N0a9Q3FywcuLYNMukwITUpekfxbAC8yUL6vss=;
        b=TVF/1/YTiYwVGTRF2Z65p98cg1mX8cdeX3VIMeG6AVjddBIImURJh19yXGBpMpCl85
         HqXyC71Y4isWmMfg4UIC4lcj4Ayd9soQxyz+m0ENLrAo+IVwCH+jRzQmQdvAK3wizDdr
         69i4cL2ypqAoj5SWOqykDV3a6ox41aNg/FsYtwXDFY0HT5BGXFORN2csemtM3NZJsCt4
         mY9l5J3jpv5BYf/cmy+Q+XI5iAiiWDrDJMgkoXHBdz7KgLAXDuMfzKJZAo/MhrhDWZgx
         DkOl7zkN00Csngl85xXeW3ffzdm4TmARBWZCL3N/qLy+CgcuT0P1UA6NMpyAnf7pK5ay
         PpFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJidrh7G;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-236603995c8sor37653815ad.11.2025.06.16.06.20.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJidrh7G;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080013; x=1750684813; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUB2OOKyEQvR4QTaMbE6HOiXKSfQPJhPDp5XJ1tNVCw=;
        b=WJidrh7GUst4Tw25c/7qpuu/hFxCBCqTDJKwQflrJAEod2gCBAiLtapYDFMQL87cYK
         kVegHkqYjG4YZSuSP92i9lZ3NSEinLiMYnNqUOyYLU8Az+gRxRrUykTiiApjCjkMuxDN
         FuRr1xT6hq4y4Oq2xhL892ssfLZyC9vH1T5T9cRBS6cjliNRbSHK28/V4gm52ZjZ+tDI
         HEiS8ZkXnZa+Fb+czksz5HP2lYqtiZJNSc21D4BspV7U4uyE7GgsTox7O33DPRmxsjT1
         OYUSAZiuDYHxwBQB3N4zA7zX0wLB5XkCjLVww6fnulc7uwqvC/w4md3rcmJNkNtb8Ysr
         XEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080013; x=1750684813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUB2OOKyEQvR4QTaMbE6HOiXKSfQPJhPDp5XJ1tNVCw=;
        b=nudoqtvryr8fLSVo3G0lR/hPvC6VTT3kXMn2pxu4jDHx19k0Zvq7IcOjVgKmhERbMS
         vVHobsPr9it7Q2XSw1/zk3K2XigGBopiHgD+BfQhqZ9/kwc6I9JpL6rZTattd1QWk2jZ
         RSGBNwHLZXJs7ulKLSIydPyVGv16OiZpIxX8tb7QMN6GWdXlh7PLjvTfbHWwA6ZMW3HC
         7EdKWSYDZ16vQUBfg7wdUrLldXDbwGnphCxbJB6xat4EGq60K9uSfS1JTa7QnjqP0Z9x
         l+TpfdXPu5OTjuEYjNxBiwsG5cFw9w7eJphIKZ2rrfCRtYiYCGxQkg/z3vP3BZZkF2Eo
         mp6A==
X-Forwarded-Encrypted: i=1; AJvYcCUB3rVX4PZqA3pSL/huJNMhmrcjBTHN8AYlqa1xFAg0wP8aqUvAcR10jfnLUQoHQMfEd5YPLuFX6HGHrw==@linaro.org
X-Gm-Message-State: AOJu0Yx16IAT6Wh1QtYIi4ENJKEMNusKMIUOe+Cqx7Vxt7lDVcBmpu5Q
	NPwaJkD5V3cugqFOZ9V3AU9/WC4OSUikPFReQXDq9j0qdnVBGnLx/b/LVzM3/drceXCgug==
X-Gm-Gg: ASbGnctB0KBAlaJo9SoLKuK9j49JhhfmAOsiJgAekWev3b6whPbgQVo21MXV1xk2704
	rfMrbi8oWZKyAkjAj+Pr59CvWeKip0HN4Wc569xjxbQ6fa7jfpcu3Nq3bRnWRwk2ooUZHJ/DDD5
	aZ+Vd4ja9WXOnFaYku7YLZnQ+4GNgmQt4K4JtjIRW+CURvduKf/vXdX2P93krB2htY04fMecDJJ
	7jTKyWrtd2mTxfrdl56CbRK1QU2OOmEyiv0eo6Cc5ohTK3cB1IzAMdVU/6fgYNq6b5uBau/v5o7
	pE0yEy1XyEsCvt4gOFM7X8w0SgmLcqPdW599kgrstLMJLEoEURspDkugVuqlubcj/a4=
X-Google-Smtp-Source: AGHT+IEU+rYnzPWOroUfAtV5+7aYn3EUMHCY+LIx9bqvK79Hz8yB4OWtqfjvijJdfFUbzgkNgD8Y7w==
X-Received: by 2002:a17:902:f688:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-2366afe7a32mr114409995ad.13.1750080012716;
        Mon, 16 Jun 2025 06:20:12 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:12 -0700 (PDT)
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
	anisinha@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 1/8] hw/intc/gicv3_its: Do not check its_class_name()
Date: Mon, 16 Jun 2025 13:18:17 +0000
Message-Id: <20250616131824.425315-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Bm51G69966bT

Since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI"), the single
implementation of its_class_name() no longer returns NULL (it now always
returns a valid char pointer). Hence, update the prototype docstring and
remove the tautological checks that use the its_class_name() returned
value.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c               | 32 +++++++++++---------------
 include/hw/intc/arm_gicv3_its_common.h |  2 +-
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7e8e0f0298..9eee284c80 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -737,20 +737,18 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                           memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (its_class_name()) {
-            /*
-             * ACPI spec, Revision 6.0 Errata A
-             * (original 6.0 definition has invalid Length)
-             * 5.2.12.18 GIC ITS Structure
-             */
-            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
-            build_append_int_noprefix(table_data, 20, 1);   /* Length */
-            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
-            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
-            /* Physical Base Address */
-            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
-            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
-        }
+        /*
+         * ACPI spec, Revision 6.0 Errata A
+         * (original 6.0 definition has invalid Length)
+         * 5.2.12.18 GIC ITS Structure
+         */
+        build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
+        build_append_int_noprefix(table_data, 20, 1);   /* Length */
+        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
+        build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
+        /* Physical Base Address */
+        build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
+        build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
     } else {
         const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
 
@@ -969,10 +967,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                           vms->oem_table_id);
     }
 
-    if (its_class_name()) {
-        acpi_add_table(table_offsets, tables_blob);
-        build_iort(tables_blob, tables->linker, vms);
-    }
+    acpi_add_table(table_offsets, tables_blob);
+    build_iort(tables_blob, tables->linker, vms);
 
 #ifdef CONFIG_TPM
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 7dc712b38d..3c7b543b01 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -128,7 +128,7 @@ struct GICv3ITSCommonClass {
  * Return the ITS class name to use depending on whether KVM acceleration
  * and KVM CAP_SIGNAL_MSI are supported
  *
- * Returns: class name to use or NULL
+ * Returns: class name to use
  */
 const char *its_class_name(void);
 
-- 
2.34.1
