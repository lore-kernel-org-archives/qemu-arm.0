Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp742071lfp;
        Mon, 11 Jul 2022 03:53:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u15DES+Utv/OFxuXCCzV+uM+25Ff9mfY+zBIGfaffMAhBI4NVrXKeKfSjdX0/JDzeqF/WT
X-Received: by 2002:a05:6214:f05:b0:473:7b68:9260 with SMTP id gw5-20020a0562140f0500b004737b689260mr714119qvb.124.1657536802985;
        Mon, 11 Jul 2022 03:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657536802; cv=none;
        d=google.com; s=arc-20160816;
        b=CxsrBG5rXsI8a+3Q/vLp6TaZIz0IBScmi6iOG5xdvJw7ISuLOAKuG01kMAcVh93N4d
         bvOkZ5PsWNtQ5rOCcdSMy+Q4DQ2vwhCvrV2KWjAiGzdZ/AXJp9aN2pQay0xVPVEXCPvw
         1vsNxPtcz9x1+/Npvv8FzNRYSrRsHJv8K/KDP+rr/qd3apbU33t2PZV/JfKsXYWyCjIq
         97L7EQIwF2PEcsfgIEGiCw2uzuEde1fOx2ufGGW1/0bKA9d0RnZWqcnWQLzh8uLW4pui
         pElnTgpw9fsQa2ZcdPi+oXsZUwGDc3ANLc0meT1433juvfA7dbwRfuHJZqZqYr++wlH8
         fbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=uXcaItdGRv97/M0bEESxUnQ4Bf2p0VDmoud1dbkbUIQ=;
        b=DtpdSOvv/D81FvcJYF+5tD/S0sWRGNTa+63N2BMOONNrGerphSWDqMKv1fMQl6NoHW
         tNVrAMIokoMFfZ9/+l1NnlAn/S/LGPrazVEzPcPtSVPe5rSg+btMbonIZNLzBzpjfVla
         CJpKpbzaDt1M55eqdCPHD5rhVLtnGskjGQCwPSbawx7oAtVb5T1J0vR8TOflVrn6ukcZ
         /n52QNY4id/3Wl4+9w3+9RN1yqdMUkWnYMYKp9Pynob8nF8uPkT+ozZ1SeYAxvG+zbZW
         a4gNTOFrRwU/h4pcfID/oBEWBl1lFd6NCOo874ea841b2bJIcw8W2ZQjsz1kQjY1C5kB
         LQkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a0562141d2b00b00472f7ce4ca6si4234265qvd.427.2022.07.11.03.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 03:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oAr2Y-0006yX-H8
	for alex.bennee@linaro.org; Mon, 11 Jul 2022 06:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqx8-0007JW-GH; Mon, 11 Jul 2022 06:47:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqx6-0000dA-Vr; Mon, 11 Jul 2022 06:47:46 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LhL8C1QV0z687Rd;
 Mon, 11 Jul 2022 18:43:23 +0800 (CST)
Received: from lhreml751-chm.china.huawei.com (10.201.108.201) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 12:47:42 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhreml751-chm.china.huawei.com (10.201.108.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 11:47:42 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH 6/8] hw/arm/virt: Enable HMAT on arm virt machine
Date: Mon, 11 Jul 2022 11:44:34 +0100
Message-ID: <20220711104436.8363-7-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711104436.8363-1-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml751-chm.china.huawei.com (10.201.108.201)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>
X-TUID: NigFLB1Oz2ku

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 hw/arm/Kconfig           | 1 +
 hw/arm/virt-acpi-build.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..17fcde8e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -30,6 +30,7 @@ config ARM_VIRT
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
+    select ACPI_HMAT
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab0080..f19b55e486 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
+#include "hw/acpi/hmat.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -990,6 +991,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms, vms->oem_id,
                        vms->oem_table_id);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_hmat(tables_blob, tables->linker, ms->numa_state,
+                       vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->nvdimms_state->is_enabled) {
-- 
2.25.1

