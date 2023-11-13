Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1594817ejc;
        Mon, 13 Nov 2023 12:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRc9M9AWfXW7/0FAGQwaX04uFiHy5glXfKBY6VEXzsdDkSoExwHjxs/gIbOxTBhnUvuDOE
X-Received: by 2002:a05:600c:4e86:b0:405:9666:5242 with SMTP id f6-20020a05600c4e8600b0040596665242mr6429997wmq.31.1699906422039;
        Mon, 13 Nov 2023 12:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699906422; cv=none;
        d=google.com; s=arc-20160816;
        b=MDI+qMMOo1mKqDnqaHR/o4HEi97hAaElpQFsd9gOkopydRqwDQPozAu3YoL12ppWSQ
         mZj19iU+52KJu2IwfPQNWeeU/qyRZntVP9+XvFpOM4ATbx+5RxFEUssYgreTZ5sGaWQb
         4kjVkAkcYA5TRMn/+MBhq09YuTSbE+KLo5yXWFSPifpotmPxbxGPSWXKjfCl4E5SArnF
         Zk4Kx7dIK0vXkKAa9ylufFgtJTqDmgMMXOx9OEHAOlTv5RIIQiFUG+IgxE/wy5ilqU5E
         G+hi0/2CApZThYu1fXFYjjBfhPj7ogDyMSwfU6epUZ4B52aBaIwN032U4vRnTP4ZflfV
         RDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=XLIDNUQKofaktBkPAxJJVfFsq6EherULkllIvo3aUAA=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=qd3Wcrz5PeRrO6v/JBF0JkrQ7uO/tt8ItWocziDrCzYPQTJJEP5VZnRPUTveQOxyRZ
         7OjDkI+HXmTW/zg81SWjm5HYm3h9l6XsKsj0gmShPq9DjNe4R+LaMXNHQDeFNVECm8Qh
         4JqzjB70Ibx8fFuhFuZ07tkvYk5K4e/W6D0aYLgMHDw4VpR25FaUth/lhLIWXD9k5Tgj
         MIwVxRnf76Fdb/1kvuwu8hqp/e+80LaI2dn3xpialocBvgDbYXWleIB2p8goXJykYfwl
         PbTK3PYEN79f5SoPRIGfKKOO3pLpKmWcWawEcOMNUXMH6egcB0EHsc4g4OL9P7yHmY9O
         mIWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g6-20020a05600c4ec600b0040a43ac050fsi5657090wmq.220.2023.11.13.12.13.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 12:13:42 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4STgZj4N89z6K8hx;
	Tue, 14 Nov 2023 04:12:29 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.147.128) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 20:13:24 +0000
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
Subject: [PATCH V7 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Mon, 13 Nov 2023 20:12:30 +0000
Message-ID: <20231113201236.30668-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231113201236.30668-1-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.147.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: T8JCHQT3IhqS

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
Tested-by: Miguel Luis <miguel.luis@oracle.com>
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
