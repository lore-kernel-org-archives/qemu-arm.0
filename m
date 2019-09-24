Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045897wrp;
        Tue, 24 Sep 2019 08:24:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxw5g+DJ/9bijE/Bklh5CxjZITjvKCfeCgof2N8dIWIemhWTZbKK1EzMuAndzeP8Q3usmN0
X-Received: by 2002:a37:7fc7:: with SMTP id a190mr2995451qkd.351.1569338642697;
        Tue, 24 Sep 2019 08:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338642; cv=none;
        d=google.com; s=arc-20160816;
        b=HlJKRnCv1MjwwK0EqJQeKO0Y5nKMCKOQ9eDPm8B87IB9kyqh47fV1aAkJagIdLkzmF
         J4UIkWCaIvToMLsjzPZXQgvKkBaZ7GaMkl6KK+PmHjg0L/spiVG7Np0qDmFvatRlEs9I
         zMXat4K5jIySCqUNYHb5J9jrupp2/6nhYpiNGPBqGx5IPqTiY+kaucIue38krn0thHjT
         NdygRQXL0mce9P6fMc9YWAtDkeTF/ABZN7Y9uoZyYEWnP7S2dPW9WHCL20xt+qMjMOFF
         vSII/6902Elb4GOfomhFEakH/uMFYx881sgrF0TT3jKZo02b01C0Yyx2cE6YEuHQlkfK
         d49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=RHR81nL1Ha6GcQqSTsbjQfhV7J8FVYsl1tOq84UVNwg=;
        b=BIaVNHwBH1RuEvXRFKyjeNxYlu0RfL7F0xKyRqY9RuVgcTChQuzP2VCVNAAqpxkJYZ
         UbEg6QDsWJ8FwhdQN+5HBvFj7lIUvb8XVgC3BQ43FAmrYeRaP0KmCpaToAyAFSee60T0
         QZ0qcGjrif9xELXhu5q1ULAxGjxksxBmvXc4ZZ4Rqmt8utu+fs1tAt3G8ix52G60c3wi
         ZVy6EVvVzI0fJFUHBRHrC9X+6/xjVdp9lt4mxtfjcy3DNAjWGXbPQfEEjMldvDx0mhz+
         7IMYBeG+UQIPCDWEfohEl8ndOy42BU5sZIO90G7gqQmyROapG+6roPPxvQm4qf5y1Kpi
         AK4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id d201si1347274qkb.103.2019.09.24.08.24.02;
        Tue, 24 Sep 2019 08:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 680B44A6B5;
	Tue, 24 Sep 2019 11:24:02 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmfItCy03b-P; Tue, 24 Sep 2019 11:24:01 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4CE904A66C;
	Tue, 24 Sep 2019 11:24:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 7CC524A66A
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:24:00 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGZzYtF+CGT0 for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:59 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 1639B4A66C
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:59 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 683D193003537AC7CFD4;
 Tue, 24 Sep 2019 23:23:32 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:22 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 12/12] virt/acpi: add SDEI table if SDEI is enabled
Date: Tue, 24 Sep 2019 23:21:51 +0800
Message-ID: <1569338511-3572-13-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 Dave Martin <Dave.Martin@arm.com>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: ojx6loJkDM0g

Add SDEI table if SDEI is enabled, so that guest OS can get aware and
utilize the interfaces.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c    | 16 ++++++++++++++++
 include/hw/acpi/acpi-defs.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cdf156..1088214 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -32,6 +32,7 @@
 #include "trace.h"
 #include "hw/core/cpu.h"
 #include "target/arm/cpu.h"
+#include "target/arm/sdei.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/nvram/fw_cfg.h"
@@ -475,6 +476,16 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 static void
+build_sdei(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+{
+    int sdei_start = table_data->len;
+
+    (void)acpi_data_push(table_data, sizeof(AcpiSdei));
+    build_header(linker, table_data, (void *)(table_data->data + sdei_start),
+                 "SDEI", table_data->len - sdei_start, 1, NULL, NULL);
+}
+
+static void
 build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     AcpiSerialPortConsoleRedirection *spcr;
@@ -796,6 +807,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
+    if (sdei_enabled) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_sdei(tables_blob, tables->linker, vms);
+    }
+
     if (ms->numa_state->num_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, vms);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 57a3f58..0a2265d 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -634,4 +634,9 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+struct AcpiSdei {
+    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
+} QEMU_PACKED;
+typedef struct AcpiSdei AcpiSdei;
+
 #endif
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
