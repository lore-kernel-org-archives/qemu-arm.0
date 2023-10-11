Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp323828ejc;
        Wed, 11 Oct 2023 12:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2LH/UJ08YXhOW7U8MwMcoY9RBLfjaueDHtMCOfhRIBed5y4AhI0qp173zTCsuJ+OIQueL
X-Received: by 2002:a1c:7705:0:b0:401:c338:ab96 with SMTP id t5-20020a1c7705000000b00401c338ab96mr19420401wmi.34.1697053518131;
        Wed, 11 Oct 2023 12:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697053518; cv=none;
        d=google.com; s=arc-20160816;
        b=DFPQ/Xax7vAVnnebTyhhjqavr4TWZiyNsVjreoo2KTcvMB6pP3/Uzbw7a7O7etK/HX
         fQngz6kyJ1XNGnwnTDNRBZoLrmw/KSUwOJlXPkTHYFw7h/mmo+pqbStK7CHIJ7TmKpTU
         XTQ9+Ay2CwMvb00eb4jpO48qbUHBQ5nUSqdTNr9llYAdr/+76TokSKt9oyKzTSX6qU5s
         /+bhhny3/iElGMjnvnIkCkWIXOf+JuTyg1moW4s8pC0iu4WM5Uq2LHhRDjsL+9Ud/JdD
         1q4BmjSEONQ4UihWedvLlQCxxHrySzYUd3Ytu9ku9LrB7Y+84h4/TOLsdk8wvEP/uvWm
         BjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=1WTolUrVagrBdPI89ZtlpyS2unxwwp+EOlsa0ipGJcE=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=ZzUi1VtWfJJvItl6XswMqOQV9n1pazPwaOfDJZiiWORnmc1a72anlUimdjdQFMLz+h
         0usiEcZUUAJcSZEfifYPd1JLfoPdmTvhAhzxWmzjUEcfwhtsEWDxeMSRd9O2NYtODQ3A
         sJRC6piPNidT5IEXpj3MrRSK/5/Q7HbWhOefLT0eNYzldReK8boU/htyfjDcYcGLBzW4
         Vm/cBM7KIQ9D0YEkLbBdRZNOpq6ONfO81kvafBFyh4BOgghgfypt8AkOdQWDT7XJ3vb0
         WDEnKOs7cFhIbcGy94U0lsc55lAttOwmgCVmDM3ssesBviumN5sSqy90EZjom/HE1UaL
         eeYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j14-20020a5d464e000000b0032144fa8e98si6043674wrs.637.2023.10.11.12.45.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 12:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5NX72SvYz67H66;
	Thu, 12 Oct 2023 03:44:55 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.169.226) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 20:44:58 +0100
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
Subject: [PATCH V5 2/9] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Wed, 11 Oct 2023 20:43:48 +0100
Message-ID: <20231011194355.15628-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231011194355.15628-1-salil.mehta@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.169.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: qX1Q7bY0tbQ7

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
