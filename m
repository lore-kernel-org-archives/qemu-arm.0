Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1838713lfc;
        Wed, 20 Oct 2021 10:43:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSPaGUa+0L5qHCscsnYVBUdkvZuGFTyIcpe/gDckTlE5Efd1ai1Rj8WpRzAJh3qkaxvDSm
X-Received: by 2002:a9d:701a:: with SMTP id k26mr569743otj.109.1634751803513;
        Wed, 20 Oct 2021 10:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634751803; cv=none;
        d=google.com; s=arc-20160816;
        b=CiyjpLXICYpOH7Ke1zO3MDWwVD7aO+aS5dPiwfFEbfl0JhDf2X15Z/oTuTDG3+SIw9
         VXtX3i4EFnlVsc5lPhKNg4JaUU15tZ1prg6LlgXg+jFv0o1sx3GMNcC23zkzZBefj/Ei
         s5sfl+412iOaFEU90aSCP9oLyARk7zlln6ei1ZvXSOjRQ4elf68b+TlEdGfzc/D4LFna
         BoBw2KZ8xz9gHwA53AFzMukA1HNvcFxJ+VA+aP8Tpfp3ENGdWXTTIsK3WJW0xpv9Cy3y
         IcYjnSwah+UCJptWBCMJ8rtCUF3/VQsJZzIN9JGdLBwfytDgobh9yxM35mcevpuhSt3O
         yiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4N3flSOS4BQcPNyyp4dLaBJWrxFo0hCjRbw4JO7PSy8=;
        b=AVOK5taeJAqr3ZxOCF1UZ1XStYNUKkzWm0WNdRduJPgGBd5tkBrnDUiAlX71c5+5EW
         SqvppBd+ez7ZwzOiOwLtbw0h4cZp0hnLKCeIC3/jMvkARed9hIydD9J6sWoAd7ps5Q6a
         AeWmmKosAm8/DsCUth30vPpZMmAq8GToG468k7hCVvhtYN3n/6Rm9mOZEJbPAdBHxut6
         PUFmV6EAcWmA21AXPcB+Os27ktk19O1D7+M38ko0VzrWNgB2he7kCbnNjY6sUR33Hg7+
         b50kuZWyCJMI5btsLNwgIKW27zkP4vHZ6VHKlvzEUI0Z0gLk/PQKBaNloovzIYojoynJ
         f1Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p1mL79IQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 104si3145610oty.240.2021.10.20.10.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 10:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p1mL79IQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdFcY-0006dK-La
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 13:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUY-00056X-Dz
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUV-0002am-Va
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id e3so48178359wrc.11
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4N3flSOS4BQcPNyyp4dLaBJWrxFo0hCjRbw4JO7PSy8=;
 b=p1mL79IQiyQIXVPk4QALNMpR0xOtxQbdYa6kTvYewTTK0eI/63MM6MeB/GErGZgV/X
 NmMIJXP3rAkkev+dSZ9aD6V3JhLqx0kxAnaLCh5SRAYlRoqvtWxO13lMq7l6IoKSzfIa
 WAH0uBkKMuLalXt0PvRizne0Bribpl267SfgR02rodsPsFGGa1c+NSxM2RP1q8fiqBF2
 i1d7uuVO2xZ5RzJx7rLMgt2ZbXmSxxxv94zcQRVPAVh3eMbe2vK70P25jowzzHdnCWKb
 vAoNzVCrwkjfC0AM4qrzQbuPJeJr5d2SCdyON7TcxsvDkLUrFs/hXFuYWEFzBo51v8qm
 b6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4N3flSOS4BQcPNyyp4dLaBJWrxFo0hCjRbw4JO7PSy8=;
 b=2hrMVsf6IuHDZYFI0WtXaYe5DZBL0NkulSv+vDHauwn8LmP2lRFl2B3oiP2oux+cOe
 JyGoZiDgjCKz94ar0TodNNh05uKIfNAOD3lJiG6pbz5LNyyq3zK8gZrkJV71vNiyqrvG
 nFUd1h3TXYlYzE9KHFUK1I2+8DLxsQaW2Ap6YKkqs+HCAE/1Wt1jB+J4n7IY4gmG+L5X
 Dmxv08C7GUO0O5+JjvbwEbet/M7Y0lrKDIybzEf8esZzDt2r3xQrfhP1Q5kn9UnficBH
 XQXKyuIVkDaHA4DuzuYR49jlNvjUEQF8Si9GW/ugPy7yNa+fkXhwM2iLDSOMELdZO6tX
 h2Lg==
X-Gm-Message-State: AOAM530iHHkglMX8Gq/zYYqhMuNZLUYw36VlUgj5xieV0MrkzSqKutA5
 1/8eAPhrGTEm+3sVJRBQQLSB7Q==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr697294wrb.103.1634751302517; 
 Wed, 20 Oct 2021 10:35:02 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:01 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 05/12] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
Date: Wed, 20 Oct 2021 18:27:39 +0100
Message-Id: <20211020172745.620101-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBIXL4JBqXIY

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
index 2d37d29f02..e652590943 100644
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

