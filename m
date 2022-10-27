Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp252547ejn;
        Thu, 27 Oct 2022 03:05:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SYwn6kTLWrQk/Li61giHsC7ffdBFj15dIAftaAMB/Hn5uDJtJNvSFVaL9M8wC45jbj4E+
X-Received: by 2002:a05:622a:120d:b0:3a4:ecf9:1c26 with SMTP id y13-20020a05622a120d00b003a4ecf91c26mr7214415qtx.246.1666865149233;
        Thu, 27 Oct 2022 03:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666865149; cv=none;
        d=google.com; s=arc-20160816;
        b=mv/Zrg413SNk25Xfq1joo6uNemmljwym8AAz0n5VjqZINcuhrpZDYec96SDl4NmEgQ
         OvKUdhhJRFQSO0ABCElHmlPSBJT1WCC6A/50iAvPEptvvKgKbbV76taGlk3qe9q3q5gC
         8wkReOeU3hesplPQSe1IHkTreP6KfJ6GF+UDqSSkzBFcX8XlWY1MInOsIwXDz92nPghs
         KJbTMxiqs6RwSlBtoEVlXTJiD3PZEVxn0RV5ImEYXzKO3prX1nt6GoMrtpe61ntvOU89
         zys25Fk9t0bRthnfV+oiUSiJeGX4rmQHnj3cQWt8yKnEeLC1pf0vi+AbsGO+TQMrLjS2
         gK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:from:reply-to:sender:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=QkkDWR+iIMBPnsynuUoHAt7oXGmAKNSXQB2n/4IU2xc=;
        b=SXdLwJ2wPznP62vl+IbQg9dX10u1O8PhDel80bSJMrVbgwaLhLKdKSGQIABiWlWGEX
         TgT9p7VTJONWHrS0G+hJNajqnY5ATAKoH3e+UTkSJIi1stTN0n8vK07W5tnA8tP0GSs0
         mf6T7+NnFwN7VEQXNhByyZbiliCnjzVr38d8MYzCgRjNQzdttfLbBx3F+gchkkWacxMo
         B+BGoSgkbdT6mGPun6xLAZufRNf2Jp7Q/G9ow8uxI2WXLsOR8kwfyvsQNKnk7AheC0Tz
         0TrVQNG1dFxsaNOKIAnb+KwXvHtPrUtfm2rUHQhzJHAra6BO6G4GSUtrUsdF0bZeRV80
         KUtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a0562140ca400b004afb62a7941si627572qvs.262.2022.10.27.03.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 03:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzjp-0008TQ-A6; Thu, 27 Oct 2022 06:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzjn-0008P5-FY; Thu, 27 Oct 2022 06:03:47 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzjl-0004Hn-AI; Thu, 27 Oct 2022 06:03:47 -0400
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Myh6v2sD5z6HJ9N;
 Thu, 27 Oct 2022 18:02:15 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 12:03:42 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 11:03:41 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH v3 6/8] hw/arm/virt: Enable HMAT on arm virt machine
Date: Thu, 27 Oct 2022 11:00:35 +0100
Message-ID: <20221027100037.251-7-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027100037.251-1-hesham.almatary@huawei.com>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XSTMIhRDkkOc

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
index 13c6e3e468..7f706f72bb 100644
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
@@ -989,6 +990,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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

