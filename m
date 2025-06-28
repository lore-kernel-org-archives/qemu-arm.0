Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1647937dye;
        Sat, 28 Jun 2025 12:57:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU43D7d8PNaxoXdQMJCR5Dw0GIGUy0+eWu4HY9QRvRET3D2C1lMs91/uQypoaeI6vWAJqY9uUkhW0YCXw==@linaro.org
X-Received: by 2002:a05:6214:2a82:b0:6fa:c0f8:4dff with SMTP id 6a1803df08f44-70002918ceamr151182356d6.37.1751140666942;
        Sat, 28 Jun 2025 12:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140666; cv=none;
        d=google.com; s=arc-20240605;
        b=hxtWuvy1yjfHA/5jbaUdJEW2bTvb1tUCm82XkugjAusPKdAnank5AluYiu+/ARnePh
         ODu0KipinVcawk9kYwWuD3njPZuBQ+8CJHYhcUZn2cFzsnY+wAoiM5rmK35TkOeSI/z1
         f0cVV7hjKNs1XCF3H3ishEEaXOGtQNvd4nOF65DaWWtxvKDsMFf0Rs0f57PWtEdxQSCu
         VpE9eJa5kEhQ6O8Skbj0nEWTHRKLXvBCv4GSXQp0iMos04N0d2POsSfSj++hPHouNFRI
         ZmQ1TyzX7d48FFy+sgij4kVZaMzLNgLQyy+kSipjne3wmjoegIzd9ENWSNtefslyGV9D
         ZTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uTp8cYLG6UEglvnDlfAVLBZ5UreW7WM/U27Ywrb2bxw=;
        fh=2uy+MDeuDbU87GT6D0J0KMggkChNRBEONwBPueboU5E=;
        b=YWgfgUT8r9ULXyY4Zn8nWJyaPG083/NL1VP1tBupuoPTK7yQgYTAISXHgfxMQwq6H+
         zbxVzIAqGx5VCEMvz0Df7r9NREb22xTfspRPdmYFjfGLiX770eGoXD5sa0xO8GkFT6Ka
         vrc2zRv9FxpO0YJIJCO2jNGLLXK1dTrL3exdiNHEJhAimd29DT56/I6ZyJWVOzW1Hq7r
         E99uCVgbVjwADMukiOs2HlUqCC6sqBcEA/vyEYT1O9uLFwmvzGJ30wpnkAGrVMD4QpWs
         OpNRQTMUzHcXjROQanNL45bKm8Mq2LapkGI5WDMsQ9mvT4evn3htdIsuer8P0/TlbFbf
         DDjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYK5IeqG;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d443144f62sor215791785a.2.2025.06.28.12.57.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYK5IeqG;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140666; x=1751745466; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTp8cYLG6UEglvnDlfAVLBZ5UreW7WM/U27Ywrb2bxw=;
        b=dYK5IeqG3AwOF24+3CyK0roSOJ29Nbv0Y5LqDXycw4G6niF6HOcfWYhwfOYxAv45AS
         5oAZc8uVrqYdeiBChxg7WcoT15ust8Zxpkihw881BDCKRmSkEioXVX9J/BVta/BHR1q0
         wCK6jO6w5olQIXQGX+CYJbLZlPbpWh1az6O1aHnQA0GM8OMyl7Lic2LLmuvDEhjYHspc
         w87st05cntJZDsGa0BongB1n1hSrklV6W61CmXvtdNTh68PBqQT3hXvZmo9youHYFsk9
         h9FoSNMGpf9poE5tGGxqbvwcaRWb/5b2QDSWTh1tueZwR5QVA9o2c7+JuBeg0ovyrYb0
         4IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140666; x=1751745466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTp8cYLG6UEglvnDlfAVLBZ5UreW7WM/U27Ywrb2bxw=;
        b=qx7yZiELVYHUov5Lwb/ueltXqlDzfYAvgHlyVJa0hA8HbL3ysxPrKvKJC1EQjwDAWG
         vxZbtRYBQS/2NwANZ0bNSvImhjKpq3uJfn4rSGVl4wm4iCRSsKs4nmxyZEy+lgvqKgzU
         LdLvZoikPnH7J3lMenklUd+/DeOokgGwjaJXHZp4m9opthCseidsCP2rZrIAvPuuU6xT
         RS1Sfb8nmd41xSgAA1c+7n4PaWebtDRMRqBxlTfsMfWOmhiMrwJc+FNjtsLkjVWlO/2M
         h0m6q/5lMEnGa2g13hedxcZk+x4ZbN+aLQcY/iNZCD705wDwLdrTMhyGqwWajE95tpM6
         TVVw==
X-Forwarded-Encrypted: i=1; AJvYcCUqB7ZtQdnmolCRYRUyH3cmEQ1eoxNs//jRuijv7DY8cNSadkNI6mRAbZn4UhGP95UxsU00PWAOltG4Lw==@linaro.org
X-Gm-Message-State: AOJu0YyV1VvZ8VO9ROuA9lJBODY9ASQVJGbPrn0d48Zc48SMr/iaEXl0
	LZaDiE8ZEimEuVrhUKMElnWbvw7uOtm02DglpcwyOewDUdH+x7bVhRKtxnmd8epVZZlgG/WiPHs
	brVSobkM=
X-Gm-Gg: ASbGncswGWSrZGPDhbjh7wQwFnxn9Usas4JGbrFV0FXhR686a25xywHtfSnGI8Bsm7D
	QmNs3RAlUw8G1c/ttnujuZU8NHMeNUya4PlzHL/DC1a+L7eaNGIAc59d6uzXn897NXd5PanIbk9
	tdaqPLN/YTbRV6/cIDfds8Q37WbYUZmKcyJzidFysJhKyLYa8enzQbIFevP+DleDbYKua7VZnNP
	DxiukaXjz8/IIsqZEoXpmX9PbiWo6jpPStpMAWU13ftS6RAm3H4lruaWlJflUifK54VbjtvWyut
	KIWM/txBqU5gLs5GCBGoxUeamNqlKgu5KenesvgrpoxmZKK4JGNFVZYEvUk86HLz1sM=
X-Google-Smtp-Source: AGHT+IHCWt0MySBOW4/eJZhAhJfGUH28azA8GKy0+5uc6bNcCs5wVCA/bZ7gMZcibFl5b6UaTvifHQ==
X-Received: by 2002:a05:620a:bd4:b0:7d0:9ffd:423e with SMTP id af79cd13be357-7d44398da20mr1062133685a.13.1751140666380;
        Sat, 28 Jun 2025 12:57:46 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:57:45 -0700 (PDT)
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
Subject: [PATCH v6 1/9] hw/intc/gicv3_its: Do not check its_class_name()
Date: Sat, 28 Jun 2025 19:57:14 +0000
Message-Id: <20250628195722.977078-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QhvzDJpe0FfN

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
