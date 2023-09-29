Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3221295ejc;
        Fri, 29 Sep 2023 05:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVU9zOYejv6NY9XVzkjOQnGKZwSOvYa8te/NNfwAsvGl4L3K9OZwDddUC1yKxWjS0YO8Ga
X-Received: by 2002:a5d:5488:0:b0:31f:ec91:39a7 with SMTP id h8-20020a5d5488000000b0031fec9139a7mr3696788wrv.14.1695991514249;
        Fri, 29 Sep 2023 05:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991514; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdmVa99ddn4BEepG0j0gLXLUtUvJC7QFCo5Bjy35XFmBOv0+YkqWrBjVuqrYWSF50b
         7/E4Kg7khrGEUlDsKGkBT/sCyqtMrjrlG3VQeWT0lMJ6V7o+1WB18Pd1apERhm2opQzn
         RuBEg+9IzcH/qgDqeCY9FniG0PDuZEwkNR1h6B7z72+6Qt/rbWPst7jIK3FwuDyZ71as
         2x5Z3d93dDZjMvUUiyHQuHWqK0RjgX4NeNDjlz2IVyHgw3ye4nDDC02QD3UtDK1FkAqB
         V1YOHxKUmy7yy2oIyfMjyZ6LwpDDLI7iWVjTKGzgmOCvx5lzOVo1R4eLk9ynwkgkS/aF
         wuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=vdtzF5uDm4LTwrEnH3KjYgGBc1+O5MpHYZizGiFNtHM=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=DzuqHcY3TCbuHjZqFViKxSDpXt8Wi74Jm9D+bIRr3MhKaCClXVGrc6koJD+Qzo3qE4
         pGtIL3e48WOLTnPOgW9kKv41BicCdLF+66VLq9YS2mcP2fQmTmIIvO5vj8g9x3y9DBv4
         RoPIlF4SDGPZYxftQ9+wtxqnqvtm0Y4iXuhjHMNyu94eDai2WwREBlpvx/IuaxY3ZxEc
         Vw8gqhYHpHAHZRhP0sKXoMDIwxilNFJ/wEDtJr9SlmRlN3idps8oSXpoLiP4YU0PG/AI
         RKivtn/00nO+u7EtT1F0xV4PvwarBKEDRXIhTz4Ax6wZj9r7FUNjZ9FD7v1hLPNERqCr
         ZlTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id z17-20020adff1d1000000b00320081f7555si1560013wro.395.2023.09.29.05.45.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RxqnJ6tRRz6K6f5;
	Fri, 29 Sep 2023 20:45:08 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:44:53 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: [PATCH 2/9] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Fri, 29 Sep 2023 13:42:57 +0100
Message-ID: <20230929124304.13672-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230929124304.13672-1-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: h0MKJ7hpX43G

CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
appropriate common header file.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c                 | 2 +-
 include/hw/acpi/cpu_hotplug.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 19c154d78f..45defdc0e2 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -1,12 +1,12 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/cpu_hotplug.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "trace.h"
 #include "sysemu/numa.h"
 
-#define ACPI_CPU_HOTPLUG_REG_LEN 12
 #define ACPI_CPU_SELECTOR_OFFSET_WR 0
 #define ACPI_CPU_FLAGS_OFFSET_RW 4
 #define ACPI_CPU_CMD_OFFSET_WR 5
diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
index 3b932abbbb..48b291e45e 100644
--- a/include/hw/acpi/cpu_hotplug.h
+++ b/include/hw/acpi/cpu_hotplug.h
@@ -19,6 +19,8 @@
 #include "hw/hotplug.h"
 #include "hw/acpi/cpu.h"
 
+#define ACPI_CPU_HOTPLUG_REG_LEN 12
+
 typedef struct AcpiCpuHotplug {
     Object *device;
     MemoryRegion io;
-- 
2.34.1
