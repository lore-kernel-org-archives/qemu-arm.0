Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp48179ejb;
        Mon, 9 Oct 2023 13:37:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyc+CMEHoAlyoaNOcMyRYPyUDe//3OD6ZroAEF0F65hMCpjodVH4ge7f15dAhRdZtblUKS
X-Received: by 2002:a1c:7914:0:b0:405:37bb:d942 with SMTP id l20-20020a1c7914000000b0040537bbd942mr15413626wme.4.1696883853947;
        Mon, 09 Oct 2023 13:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696883853; cv=none;
        d=google.com; s=arc-20160816;
        b=DUYdgRIHnGvGJoYslP9qevIOOT9KSehQlK5ycraqV80WaWgQIW2pZaUAB2SWqAgQU6
         dLdlspyjHUm/Hsk7RaRw+nVOigYJYsRL+xjZqGl1+3j9hm7jvviq6M1/Sn3pMfZBmH4U
         pElldr0uYhv272n24HIkXWJzx4q5JfaaLzD0bXibEZh+wx+nCwRQhFSAy1i18eTgBz9Z
         ZC8VUyh0aSyGJDG+XYU1Nvamn91+WqkURRIWgg1E+8LOcaQp0Ui3W5sOQKJ9qXZe8Vcz
         gCmZfusLX/ZzIAzGzmBCNj09q56j8EXYcS0JsD5caGmynuq/8NaQtsYF23jWkyik2omT
         0jKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=7lwzNq+qW24ZB/mLukbryCHFHLxqDTEVt4Cn0PMaSew=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=FIYplc9nC/RcZszlEAC8rIlJlNfdgI94Fck3FR0YR6k8MAEnQwEMMm77sMzuEOgcYi
         1ArrEpxX0AkubXbA9oozQPsKazfzZomQaCfmnkMpg247wllkvRUA37ya75QbhuX/mD19
         gQ1KilZQyG7NGxIUOVu/Q5t35YTSWAsJps9Yo3FKwWn9BpsO4zuZnFbterTdtpdnJxGL
         slo2AT4JS5hmK7ztnqNxG3ceijelr7URWZYRq5us4MY80Q9dH75VMvsUtCiR82W6/X3S
         Mh3olebTAwCE2ad3BESt7Q230iK5qD15lVPGITiH4QtxRSLU16VeZ50utMauItQVcjo5
         Pygw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id q7-20020a1cf307000000b003f7f7b3105csi189466wmq.6.2023.10.09.13.37.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S49nP6hrTz6K733;
	Tue, 10 Oct 2023 04:37:13 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.175.116) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:37:11 +0100
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
Subject: [PATCH V4 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Mon, 9 Oct 2023 21:35:53 +0100
Message-ID: <20231009203601.17584-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009203601.17584-1-salil.mehta@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.175.116]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: +r0vsByI4Ou5

CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
appropriate common header file.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
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
