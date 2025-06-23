Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567116dyb;
        Mon, 23 Jun 2025 06:58:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfW/z4tInTG1OfTs6D8e75ogBEtk9XnKdDxpOBsZSOJsboLd3W1OMCxH5b7au38VwNWf3mH42gZMu2kQ==@linaro.org
X-Received: by 2002:a05:6a00:b45:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-7490db42aa9mr18506866b3a.21.1750687106791;
        Mon, 23 Jun 2025 06:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687106; cv=none;
        d=google.com; s=arc-20240605;
        b=Vj7CDio5tm3qzCoU4TBxKpW7i7bRRUPfyNmKbl6MRDm/b9KYDm2KVBFbZLt+kfDHIw
         YFvJWlbSgq9HR6AqG6DRQf2hbm/fO6QbJdXJ5u4nejjKcDM8cDx1QSjxbySp411+hKQb
         y6Ru7sW3XOub0ginBKR2/gjJKt73NVL2EpPiPzHCmrUFdypi/NPq7QD0/Yi8q1e+nd5T
         NM9sqtClsUiQ/rVSTQ6sGi6M53uwfZjomzC+b1cFhCMUWvW/CzH6KGGPsHMDKpX3sq4e
         1mnnv6zD2BWlK7TEIIgofwIRNYS5N61brQ+/Es+NnwmWVNr+we+tkDwuGq01i9JE9NFw
         pScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uTp8cYLG6UEglvnDlfAVLBZ5UreW7WM/U27Ywrb2bxw=;
        fh=qQNSnSvYex3/aexiK18R9z5b6tUPfxSLjt33t+i90hk=;
        b=TxngN/jLWEiOnwjXpV0t1VQaNdXxKeODRK5yywZzLDpn142D5kTbOzDqhiNbPA+1qq
         iPdNpctH83+O22O+3Jep6kwTvqsH1rnKFQl9JtKU9NJtt9e2zIv5dqLPB0luaE2hur5N
         D0R4IE6my4VJFyRj6ZfEBDushBYz6ALJpKsdSEW3ofQPZrwHKG56axXGWwDdGb9LhM5J
         sES+E3j53l3EfHGkEMd5++6Ofvy0WwF6cFUez3ne2Ro5ApOtIUVI4YKs4h5XMkCutBy9
         mgUSLbbziOLRAHMRQwvtBELbWHmSgnIh2wcdPJDBeOXsq8kSxQLWs6mI8+d3fNNQPVaC
         GjHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dZ4vn6Rw;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a5c6c67sor3935800b3a.10.2025.06.23.06.58.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dZ4vn6Rw;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687106; x=1751291906; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTp8cYLG6UEglvnDlfAVLBZ5UreW7WM/U27Ywrb2bxw=;
        b=dZ4vn6RwnoHP0j/vHnXEhw14XuAzxvPzTWgxOEOk6+I/FcXspTNcHq3tNf9fASg/MH
         C5csjJ3eoi866Li6VBne+CTPi1vRyy5dn3vIqrourMvz1VxO+4sUHUSXGjGEKMGaZU3J
         lBH59PKTRoSHKbzr9B4I3qNS+uhU7aqj97n5LNt6HXSbPSgx4SkGnqdzYO77AjidKFCP
         lkmuT10Y7cHMGOjis2XGtpJpovHQmY8IcMGFj/kKnLWlsOOFo1JXJURTGriC/dk36iQW
         Ks6ZbhB3Wq7t1gmqs0Ck+PX1opwsoy0fY5Pa8ZmabyPpu2vHeFHNTT/xZR6U1JZkngcy
         UIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687106; x=1751291906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTp8cYLG6UEglvnDlfAVLBZ5UreW7WM/U27Ywrb2bxw=;
        b=a5sntwbCsNji5erjn9BHh9mg5YlP3uu6SCMblr1S7vVMjcxJ5Qc0iDPkkvNygUG2q6
         p8bj3cl4G6IgfBhRjy5G6sEbEA4iVoDcj612jK03EIq2uML/8iFa6QIpL/3p5wKrwpGe
         Tp1Gexif2A6zgXTtB08PVOQduqo+2cwjoLkGdQTORVzjf0qKRcvInYC6gjmx9GYXu+W5
         pKVm2y8AFONnARKWj/YA3Ruzng9JnYYbWIqDtEedqKtpI2HcpA/KcxibmNMVaBuPdWvX
         Q1befAFlJ3kOFEojOJvMeXdrbalN0C2ViW8l+9xG7WtzsE6LRWr7UC9uuH+wTg7JynIX
         if4g==
X-Forwarded-Encrypted: i=1; AJvYcCUvZ3PAj1c76WT3rJncxJeOhmMztU3CXEau9FN/X6QwqQ3WrY+nLCWHOn1PE4qcbsiUb+skUveXG5/LAA==@linaro.org
X-Gm-Message-State: AOJu0YyqQ7uMAtZTq2pMNIuO9OOybYNMpZhMuvrK16CSWSDWwkIdI32+
	WalUbQwOq18pWWWcwg8rN/MVSCtT3vuuJD5rlXZnd6A+rYEanPQpXgIYPKYKipuoTRfU5A==
X-Gm-Gg: ASbGncvDEahXAhHI+Ri+yx77dAc14hYfjxe3I5oQv3uSuTzKq4H8aNUP7mmm1OI04GR
	Gg3Way6S1cDBEk5sw4Hl7omn7cUkRXEVvyAdRTnsHD+3tmlQUtXsy9trsLQQqSm6WtVrmuNSvcR
	bTx+J7bUayDdFHK9xGGq+jlvRUHxnN/cKhh9FtOSvI3Qqz+r6tjngnMXDKoN4OsUZa6dPXLUzad
	30S1cNqa9NV3YNxQMohZKujr516g4EY7+U3K6nk5IRHg5aMcK1VTNLHKRfVE5A5Ch+6PrtUz+9H
	/8T+eKHBdR9cQgyWtTdIQRiNtEJI+zx6K50VqrgiSisa2I0wCkwZpqNKftvGe3/bXxw=
X-Google-Smtp-Source: AGHT+IEEiQa2+IhXySW3Jk+w8bOwu5gQ9GdPyLkWhYn94fbqI08woD1B5i1A76i9mPtaPcsSqUILXg==
X-Received: by 2002:a05:6a20:7d9f:b0:220:1215:fea7 with SMTP id adf61e73a8af0-22026c19994mr19958025637.9.1750687106268;
        Mon, 23 Jun 2025 06:58:26 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:25 -0700 (PDT)
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
Subject: [PATCH v5 1/9] hw/intc/gicv3_its: Do not check its_class_name()
Date: Mon, 23 Jun 2025 13:57:41 +0000
Message-Id: <20250623135749.691137-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623135749.691137-1-gustavo.romero@linaro.org>
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vIua6/+jN1qx

From: Philippe Mathieu-Daudé <philmd@linaro.org>

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
