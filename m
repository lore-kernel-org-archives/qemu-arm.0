Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2465173lfk;
        Tue, 25 Jan 2022 01:24:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr43nMC7lXDU6sUtkuM1OVfSrS0xOxaLmU+Al8dJWeDoa4EMzLCmn9+Lkc/jveUNVP77DV
X-Received: by 2002:a05:620a:4144:: with SMTP id k4mr13901404qko.488.1643102675296;
        Tue, 25 Jan 2022 01:24:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643102675; cv=none;
        d=google.com; s=arc-20160816;
        b=ISTKSL/qKGS7fyQ15RGJwIB+aopuNt36BYpZnobSesWj1tUsCa1mwzGd9K/5HkDDSH
         d49gRjpw7ZAjZZ9EeM/DnRyyPnaqaf2f2rkEnXTsYlDgo+o04NJE384VrTHkWY8lp6TM
         PjD/eZxSUBqdZoT6wZ8CdCDuthNJB3GscbxXUMvA41orjjCRhbJRFVNNpqsX+FxsLiu3
         tZskPYV5yTL/jkBbAj6QOsfm1jPsghvs/FkgPJw9VrDgvUrYCYxISCAoXmfgNoEOnseb
         dACQkk0koN9vJJ0LjmYv7twNjUdwSddt6ER47etZZx7N/pkVU3L6MdaK1vf70I6ll52b
         smGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=12fjB0mPaQlqRrvGD6Y0XsWjRa8exxMQV5B+pQlL/mI=;
        b=Yo4HrdMpT3OhpDz/F8orHT0+YiZJjysXQ/+DQTwa7XWgZ4RlrzNy8Z2qSF9iF+/1qB
         RvaYB93Jmb94wlNn895qY9i559+RRE0py3UynVG7zktc40QJMXu4bjXusmbjUYbagNUG
         1RZ2qbPYVaz48DGvHeZwnb1+PKG+VZFJq6ex0oLg+12/5byaXCpmdHWBvdlopRMc4T9J
         c8Kzxd0QrVf1odh6GDiaEoK4Vb3E8KaZ9fGFdSDyX2SQXKxrTSQLsOczMZHVsSBu4Ahv
         TeVr0KGcAGA3lcMf1xHwKPUxf4FyOQzezrgzKGmkKyDK2fnY9ByxefTWtH7CJiApO5TA
         JPMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si3651179qvc.405.2022.01.25.01.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 01:24:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCI42-0006rl-RE
	for alex.bennee@linaro.org; Tue, 25 Jan 2022 04:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nCI0g-0003j3-MA; Tue, 25 Jan 2022 04:21:10 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nCI0e-0003YY-1h; Tue, 25 Jan 2022 04:21:06 -0500
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JjhC813Pgzbk5s;
 Tue, 25 Jan 2022 17:20:04 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Tue, 25 Jan 2022 17:20:53 +0800
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <linuxarm@huawei.com>,
 Xiang Chen <chenxiang66@hisilicon.com>
Subject: [PATCH] hw/arm/virt: Enable HMAT on arm virt machine
Date: Tue, 25 Jan 2022 17:15:34 +0800
Message-ID: <1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  chenxiang <chenxiang66@hisilicon.com>
From:  chenxiang via <qemu-devel@nongnu.org>
X-TUID: Igzx+/P2qNvu

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 hw/arm/Kconfig           | 1 +
 hw/arm/virt-acpi-build.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2e0049196d..a3c6099829 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_APEI
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
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
2.33.0

