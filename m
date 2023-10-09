Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1897047ejb;
        Mon, 9 Oct 2023 04:30:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFagvDfUJ9XqMWE8iTzTvZ8GrPGfCkusgl4pzpIxf+xf9523yNqADWzfl7CYo2bv0NTJzyt
X-Received: by 2002:adf:e388:0:b0:31f:b0ba:f2ce with SMTP id e8-20020adfe388000000b0031fb0baf2cemr12593645wrm.9.1696851010389;
        Mon, 09 Oct 2023 04:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696851010; cv=none;
        d=google.com; s=arc-20160816;
        b=LfIS41nD/RWIEIw6W/l5PFxHqf8QufkVFDPKRUMpLGI0JRMwI42prcEt+i6Rpl8HFy
         4KxMmQCM/iBqaSXwDpPkN4beuGQuBI7UIfLKt10Tt+UARuCh19rg1++SCbBcNUG8qiOg
         qjBGc0QbSl/wNXgZvuanlg5ULNAwYPvaSeW+e9IGlpnqQp49dFYJXtefRc9mSa+qcDdf
         qA9aEIUqB2Wywx7erKSBJv6jiNoN7fB6X0sEIX9g5ORQncNnvfTUDvHedgf3TR+IAt6j
         Abomi2Z9GjzqJY5wlGr1baCvVjqXyEKCIRyrUg0vU7X0+c9lJoDO6PTtUGizrJExoR83
         u6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=XEhUw7SQeMUMaN281ejbrVqoC42fN/PjBehL1gIOxCo=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=kWshv9bHV3IDulLX1KeXu1mpkyHHh+cXlBMa263f7SOnG/Vj/xfpZR3W/tRVMPy4Kc
         VODEoquS0w7WyjjgPdXmBhVyySEeDgtzulpwhMyo4OVaXZ/2j0HkkOwhuIOW6LvVz2x4
         hnkdihj3ZDJIPfHBEhD+He203fMMyRq7SOU9BzxE5eQuZa1oRYd8wPiwOQ6GlmKqZWOk
         szrvE76Qk+tQ7lGEXTDIyH3o0K2vFx9RH3n+4C6jqLrZx/s66HnqJB0YbZZArdHaA04U
         bwzcg5OyfmtIuG9MWPXEcp/HZqNxoda07FywqE4LxsD/f1W6pMA7uqKJZaiFoDOfs102
         SS8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id b2-20020a5d40c2000000b003271141df23si3482441wrq.324.2023.10.09.04.30.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:30:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3xZk1JRhz67frD;
	Mon,  9 Oct 2023 19:27:10 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.154.91) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 12:29:46 +0100
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
Subject: [PATCH V3 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Mon, 9 Oct 2023 12:28:04 +0100
Message-ID: <20231009112812.10612-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009112812.10612-1-salil.mehta@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.154.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: wP4dl7lSW5ne

CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
appropriate common header file.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
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
