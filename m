Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp739330lfp;
        Tue, 14 Sep 2021 07:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3VfI3otveaVNvfDxIbOt4bX+KptZa2eqbnc629m2TLC/lRrVaTbZ3W/vUQb/K7K4m6lFz
X-Received: by 2002:a05:6402:40ca:: with SMTP id z10mr20063031edb.378.1631629862507;
        Tue, 14 Sep 2021 07:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629862; cv=none;
        d=google.com; s=arc-20160816;
        b=wXOObPR3lOH3v8ekuPwIYJxbIERm9XOlvPsOCjsXz2vipXZ/p/O9B7hlfQzODofja6
         Oa6FH8e1AO6eBntpjHRBbI0FieRNn8NZfoXhq1+c6X2kfmgGwaQ/xbIWDnMGiqfiLc7P
         F2aOEa+Cnv0i6ay4UMdU2yE9vfHbgDPhCZP8wic4jAGLPCG9TH2G1pIN+jqSVO5ptVOH
         DWOLaWRB0v1+EYEJmuvnmhWnFXJdLrGvWvV/mglydzH6hRIEoCsBdyD9UvLwu4j/L7vK
         BKTM8Ncco/8N+S7vJWDk+sqcBnytfQLOoQg1RXWew+U1zrbEAhspjg/TS3DWCAZtefkw
         Lufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0fqwWGJNfdFrIuKBkB90SJ27CXrBjDpDxVfvD5zH9+o=;
        b=xh/6OIwjWFrdy2geuJS4/pewD3NoLP4ijtIxGE6u7FlpIha8l62llY66JVBR1PcJci
         ZQxifvYnkTuR+wqMmf/JeWV+XJQLtSzatWxX7Es8UJVrLMSjFyoR7HYkJ8hldectbd+k
         57tro1Mg/P4797+QQK9eU+E239lneSgjDFbz7WePQR8MCqzhNdx43sdtHlzkqQZXM62f
         lPob2L1KtD7T3feWCwOuTqxount512BCq6CPCvfqGlbaq8YsT3iQ3aVUtIfIhBK3kxFL
         Xvraey9eHriDT5lZZzGnSFF0/OUcDWkEJJaJiPCSnJffWPN1LqW3NJ06B3HXzWFVEK1J
         9ssw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ikX0MxOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rn4si12681749ejb.248.2021.09.14.07.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ikX0MxOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9Sf-0006XR-Iu
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MK-00065L-Gw
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MG-0005LW-NS
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:27 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso2249164wme.4
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 07:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fqwWGJNfdFrIuKBkB90SJ27CXrBjDpDxVfvD5zH9+o=;
 b=ikX0MxOG6IAUlITtLbcw4wbSyLIcc0o+qrwMwLPwRMKTCBMmqMDZltQ5vcTOKft6Jm
 +QZhudG4dvnOHpvFaM4T8k5jglDjZ4bFskzMBrk7WJzdTG7OhfWVtM1njBgDVFK8gkeN
 2Gu3lfF599L8vYP1gRtPVC9NcyR5w8ln9gLPeltLQ2U0AYOGQdQCDfPlgpg6DwkfvUb9
 w1icE341tuY+ZlazSxdv0JClL0EVP4L5DAwucqsNrF3GtCqdPognOOofAzHPl0QTSklq
 LDyShFmgbE6eENMpOvBWzqQtBM8zcgd+IwXiGbh8bZlyzKM/4i1VcoOGZzgZLv82oAQP
 hN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fqwWGJNfdFrIuKBkB90SJ27CXrBjDpDxVfvD5zH9+o=;
 b=GKShu3IZCsR5ZzwbexjKws7+aSYSspN4qUVwzwQ+w3y/OFtGSxy538BEKvlBqSqr2D
 gLPJhrG17Eg5YmMQuCUZOzh3kE2Yrb2JzJpV0CBofWjGfekVYAhEHALCs4LYcJREk1XT
 aY7LU/VYCTsfPWdgS46HEn6hAs90wKHSLomhO+wfipLTZQ0h/bxZ7o1aDlVFz6IGO1/O
 TfH7w3ccLH/NzQWRU1ryIcbcMKyx7dYlYcG1+ALwjnsnyJiYupXsH+vI14poVq7syyoV
 LnwDaw9ljFpuwpyqvUmxxmADU1QDstJyKLesKVP79N+LpyHhaD6WnHpfjkfYTec6OyOB
 MiOA==
X-Gm-Message-State: AOAM533iqxSBBsUw6vYRE27wXVdde4HfDFk+MqD2GbLMf5zNP7OFdHBn
 TaT7E6umWeofsoIFKiRYyFt1dw==
X-Received: by 2002:a1c:9a85:: with SMTP id c127mr2507326wme.174.1631629463129; 
 Tue, 14 Sep 2021 07:24:23 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:22 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 02/10] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
Date: Tue, 14 Sep 2021 15:19:57 +0100
Message-Id: <20210914142004.2433568-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RA1S64KM93yB

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ebe9d1726f..23c2e1aaf2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -928,6 +929,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 #endif
 
+    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(tables_blob, tables->linker, vms->virtio_iommu_bdf,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 78fdd1b935..8b04a1d53a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -27,6 +27,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_HW_REDUCED
     select ACPI_APEI
+    select ACPI_VIOT
 
 config CHEETAH
     bool
-- 
2.33.0

