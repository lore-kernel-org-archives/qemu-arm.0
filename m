Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1415344ejc;
        Fri, 13 Oct 2023 03:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvjCxylAsPmPu+j1fa9BXWIK+gygoVLiLtB+j6ngzwedTB5UlBWYfz2Ht/Xfddhjv1bvhX
X-Received: by 2002:a05:6358:63a1:b0:14c:d9d1:7ac4 with SMTP id k33-20020a05635863a100b0014cd9d17ac4mr27789936rwh.6.1697194368376;
        Fri, 13 Oct 2023 03:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697194368; cv=none;
        d=google.com; s=arc-20160816;
        b=jZpVQF2Ns7F3rp8+BuA9RdcWxeIrGcX47dFXMm/PBYhtZ0+VFRlI5JFOFfLYNSsje1
         HOIkdYEgTfH22vWH1wMayrUPTPmGbaKpuCzR+xbwoVmNedksxIqc2hcYFzCswucaPiNI
         1149pbqf6+1JUbB2aVJa04UgGKJ4S+19Fh/Xv76bCuU6RQnKq8gx5Shmlx/5/xIx72fh
         E2r+yUtaLuzmF3q0yUK/eqD9pT3t4o2b1vHKJ3/HRhBMK7+EWmwh1qCyw5KSMGYX3bKk
         7nQ/qCC6uBvz2lyBp/aG3aNbhNvHtQfoC4/fX6UKwCtu+VKQNU38WA+/QjZbRO1mxFSC
         RwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=POF1RF3noapisLvZr4QdjXoh3f/vdO8curg42Vk8X8c=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=XaXjVLlmifpPCaXywbkjSM0LgT3288XDXKtDkJNtJZe0UpwO27XSzfqfhj1v39bUU2
         8J4eVuOtzL4UmvEGowAkDDNvFjFYOk23JKV+Yxn+sDKGY/EzhK2CLhZ4qcsVr/SryEzJ
         N8uoCWfXyMMTZdaFETuEqw3issTi1pOlTburApktozeHXWnHzNegiixCEh55Y/1rvb8X
         iUH46T7Wu06NHjH4sdstrUsPZY7rkOkFBm+nd85r7VO5130tvClJH11RNwcwh/wcCjSk
         XNkQa/Nzo+60GXsZlC8bazt/0GDy722JpsxnRunje4STwNWI+LzUi1dECiMpj+BLbQbU
         2uSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j8-20020a056a00234800b006b69f056508si70717pfj.149.2023.10.13.03.52.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6Nch2HT0z6K7GV;
	Fri, 13 Oct 2023 18:52:20 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.247.32) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:52:27 +0100
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
Subject: [PATCH V6 2/9] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Fri, 13 Oct 2023 11:51:22 +0100
Message-ID: <20231013105129.25648-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.247.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: Tn+Xd8H2Vt66

CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
appropriate common header file.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
---
 hw/acpi/cpu.c                 | 2 +-
 include/hw/acpi/cpu_hotplug.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 011d2c6c2d..4b24a25003 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -1,13 +1,13 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/cpu_hotplug.h"
 #include "hw/core/cpu.h"
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
