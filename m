Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1520598lfp;
        Fri, 1 Oct 2021 11:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyObpgfxzoPwjpA9QCrS6uuZIfuMl2XHd0Ak4UBUeSCERxmXdAkBwK9kcrf1mylCM6aTUky
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr14200931wrd.233.1633111496535;
        Fri, 01 Oct 2021 11:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633111496; cv=none;
        d=google.com; s=arc-20160816;
        b=AhRqCJf6F6q3IFuuXqIXCWRb9oNPRsuLVXyvqV9fjGHMbXfVINlPa3mYK0gagAHbJ9
         accKJzHZBVyCVlxk6p57wttvgbzH5AYGutdzxscwO7J+3nFw+w7DGm5vEee7JQq7e3Ao
         ANYiyBbpA7dCwOjNj7lIZJY7PMu+I+OgEz5/s/nr9ZMAg/ScOajTWLfM/wYpQYP8BIEB
         q6ai8F7CnYcqfuWz7k4N7VfcXFOAI0sqC9UXaMuVJ+d6Ld+AKKREqPAK/FfA4DE06fmj
         YmeuO52KFAnV/KiMWb4b4pW0BgKAg9/p6qdFmwaYUXmKpfXs0f9nMA6k7bVefwuZO/7s
         hb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yO3yTTEzbhf/x4NiXg2WSPV6sp86QcJAMc0N5bcX0+w=;
        b=Pj2QwkHuR89NhXPkK13GzgxrEGFLVeAV4WWdHE70//H9n6JTKJT2WLX1B5KGkHVrRj
         aTpq8lhF84xzckwWaqQZxz2SRw7x9Enfti0liPD9Rej8Xt/TlS7jyASK64g8U1noa5e7
         EIFxVwiBCKf/jCVt0RSSGuoWtbByA1nrdhS6VhWZKX4Pt/4E1LJ7653OXxQ0txWfX5qb
         IIWWD6BepdH9itms0iyWvnPhWfuZF4glv0U2HwgCnYE84z8vfbhIBmlUr80NhGX3Jd7C
         1uub/DZFQRHzEDAfv6YPkItxkCqR4pQP1e75xDmnH6FYA0YkO3dZijUYj32zbdtjUiGC
         KCOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0y+jAY1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si7164691wro.178.2021.10.01.11.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 11:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0y+jAY1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWMtz-0001zE-Jg
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 14:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUG-0000XQ-1H
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUA-0000fo-62
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id k7so16526513wrd.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yO3yTTEzbhf/x4NiXg2WSPV6sp86QcJAMc0N5bcX0+w=;
 b=B0y+jAY1R3bsDDR0ds7bcYmxU1Xq6NEl1fRXnVVvBcmTTo8gSreqmxh6/cV2GJfG8U
 g6GDZMGtPpE5H8gTw1liG/rKJo9wQ/0ZFMr8vODzZRA+IvoCrfaL+jDNpeUprOTPlMLx
 uU83jm/+TehUGR4IZujs1kpeQr+uk/Su51+/2/PMwQXRr4J5ohonq/NDRRRI/rmQjhV7
 ypPc97aarua0C7mUP7bRV/GFvlpewTLcFSuxQ6unP9WFrOO0OwLF/h+AXydPVhqkkfTH
 2cmJPDhScFeDw4gEDt2P4HMg0j1YfDfVvLhq2ctVFKx3UQwX1CwpJu5BfdNNGXx9Ctem
 gsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yO3yTTEzbhf/x4NiXg2WSPV6sp86QcJAMc0N5bcX0+w=;
 b=G2QkwrO2hACPu6I1NVPgO3asMSrHUOFceyuHQLy5T1EMu0HcZv2sOtDaWJfv3qEByS
 uYSQhgu8ZbA8U2WAk17HdNqrcZW2uq3pgOjDzgh/pS9pIQveLCGvp3/iMUpoGYKs7W4j
 Cl+NcY1VNMUKFXei1u1Hy+IMrUgQ1iikd+V1wEG21JkQPO/VnV8Iun4/lBJhVWRhqlY6
 phud76TBvUVO+Ol/6JD3WcwA0zQyytiyJMbYaK79K4SBLA3gF7gWDDU1il+okchQigSZ
 B0Tt4rQdamJqZdKc5Z+52IM+gj+jGpqufyfaRxWYXpvyKfg6N/BwGR5z4xnl+VhSNZ1g
 FpNA==
X-Gm-Message-State: AOAM5312B/nGNfClHpYBzXkc+lrmN0oJgF2W7EPkMqJZWckmgwZOiCvg
 6KbLHwjIcckGvMhR/YkifMPSMw==
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr9926159wrc.394.1633109892789; 
 Fri, 01 Oct 2021 10:38:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:12 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 02/11] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
Date: Fri,  1 Oct 2021 18:33:50 +0100
Message-Id: <20211001173358.863017-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hVfCjNpPBPgL

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cec97352b..e26639e1e1 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -934,6 +935,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 #endif
 
+    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(ms, tables_blob, tables->linker, vms->virtio_iommu_bdf,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 18832abf7d..a05d75faca 100644
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

