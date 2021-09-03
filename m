Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1353921lfb;
        Fri, 3 Sep 2021 07:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm6p2ddlG92dS38cMMySKTyLQywFltfBEoVuX7NRa+TrRffrbCm6rNPFM0iYpbcy7srZyk
X-Received: by 2002:a67:844:: with SMTP id 65mr3015828vsi.20.1630679715237;
        Fri, 03 Sep 2021 07:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630679715; cv=none;
        d=google.com; s=arc-20160816;
        b=lLBDdIBd0o4k8G3UIDp1uObcnGfePLqJefHqMQ8T50dMgPp6DsqNL96y4miLxxRq2F
         tAxtKpFbgUGJZIK8IpmcKNnv27Cjhthd29fc3m8PBtmtk6uk9J0CWdQsug00B9Nac78H
         AeycLaFsZxj5eQgk8EsIycboRvIMWFUTUJBJUZW8KdGN2PG2XIuV+UFLMhDtL+Vv4qzP
         fKGnh4tBGpyp5TWWbb3o36l3OIe73tEP8qIj4YTZnzAkeMzGW1bWsjB+xrmYillwE23v
         d1GP/oD3h9cxPZtFl3+Gs1eGKVhkOc4QjkPP2Ld9qRPTeZEXEzMDqrQmziaP3zlafzrh
         0mYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r/iDZlUIiWksCDGamgB0/fI2nOB2PJMcezNLmt9rDEI=;
        b=TgODumGbnDwF5AIeXkUT0pElPezfbUfeLagXkcXPTZEjkd2MKEGUkbudvWxqly9avl
         WjVQOWHklrHE6OaG2uGxxFu8s9vSHxO78Mr5eevBKNd1bchQqxxSmH2ULj/fBcu7DlQs
         UHh/VV6/6l3kg3+249nSvmEqyYORQZOuz7WrV3vuaTxV07wsOL6DJm8SnlDK6RCTJ0PY
         qycBrhcg+VEh+ShLhBuKbLct7NXQlwMauA5gYqJuviioOu6eMAkRZBEOoOB9hNWLi8bM
         nxwzT58II/1hT5P7E4qj8UwvKttsSkikDubSUtX+BpQGA4N7bXf+okrjWr19h/BaaHZX
         UWXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lVKWnYEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si2637073uaa.253.2021.09.03.07.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lVKWnYEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAHi-0001gW-EH
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFG-0004Et-QW
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFE-0005cW-Dj
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so3932018wme.1
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/iDZlUIiWksCDGamgB0/fI2nOB2PJMcezNLmt9rDEI=;
 b=lVKWnYElYrSuBWv0TUfIYfmzM/s8V1xj5XgKHpsWvs6TqIz7taY6Zf0cirPp8/CKzw
 fxI21FKcDXOpgj9Q4897KWRnjuLwdyIkek7pDIOcFWT/qyDpfpgWENbZaECe7FHm+JgU
 N/inlyZIhkmQsl+lw2xyf9Dv/lGUAsbItGgiHWWulQqO/SxXrNkS03MQw/7yNZZY6qTm
 27SkXiG5sBsLecD0/dHvCZm1LILm9DUoZ3wFy93HTSqshrAPHSRcPw+DgQ7Zt+ET6unX
 gduTqymw0BXWFxIy9qgB7RFK7o2dVzJ1Y36WvD+tJiqdnO1CPjJxuxn1ilJ4mRiy3dJY
 G0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/iDZlUIiWksCDGamgB0/fI2nOB2PJMcezNLmt9rDEI=;
 b=CQ9wmirTQY79ZqeO7k6Dlt5TkuXe4KzUaJ4a07scFPZ+jNlzkCs5Lua6DULVc4E6PO
 ZnaWU/loPZgI5Y9Ae5CF4vl8c5Tk+62rO5+clvwMcLyhIyX8La4rZRjMbheqP54LkQi1
 eXBApUuAmSTlu3IaH8V93c1N+GVYBlQt+GYZUvAb33UVCYSRyQZl8g0FHMhpbQPSuyY5
 BqTxVtmaEL4dgeAzi6myNFTudp8ceVzSt7s8yKP9esIJxYWwYdo+0qUcbwk5TXd5Ko09
 SXBrp/NVSu81tkiU1GfAOFbjEobjcDX36T2tg6UnbINxnbolnrhrb742tYUBjpDnL3GX
 DQow==
X-Gm-Message-State: AOAM532lGEjV5zxO0L0pl9M4/lkP3io2HN2eE3fFBlqSWz00QU0JO1f2
 zOo67QPZLYcSPE++3FMi+sGhqg==
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr733449wml.62.1630679559088;
 Fri, 03 Sep 2021 07:32:39 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:38 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 3/8] hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
Date: Fri,  3 Sep 2021 16:32:04 +0200
Message-Id: <20210903143208.2434284-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ilmAnsJi8kpn

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/Kconfig           | 1 +
 hw/arm/virt-acpi-build.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca067..7da0422446 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_NVDIMM
     select ACPI_APEI
+    select ACPI_VIOT
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82..e2fa677d80 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -849,6 +850,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
-- 
2.33.0

