Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp981230ejc;
        Tue, 26 Sep 2023 03:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqAgobKPJetl0gBMu9AUTZyd6wz10XUIVHkZS6fzQo5BYXx3vBIYC64mdNOITlRRh7ZUrS
X-Received: by 2002:a05:6a20:1049:b0:14b:b42c:34a6 with SMTP id gt9-20020a056a20104900b0014bb42c34a6mr9708221pzc.24.1695722901093;
        Tue, 26 Sep 2023 03:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722901; cv=none;
        d=google.com; s=arc-20160816;
        b=zBPKl5ke3u7qe60bUy79HRehuLI6dgax3f6CzEzaTBniS9tjC4wtv9o8mujoYD/6Oi
         g18yVd1cQb3Xfc4cdAUpVgKcLQauSs4gBiuC9K3qSE4MClKnRc1FSRj0rCgmgNisjugW
         VymNBeGl80JFBxIBfgG4wOG3YMlw2nBnnbvnfSPMtNB0N4KQ1dzdAF5WBeAes/8Splz1
         WnYeu1cajI2FCcppBeyytL/Uh28bD/2vuZjlDUTscqbfcC/Q4QzMSPlYk7NJV3rfsz0s
         Ay2yEgDRxf31q6naQQRzTlT9JmFhF9HlARz3JjJJHP8hnq6tzhyYCLjdKIwmrSmfR/hT
         0d2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=aKfHK1imlScONHTkOgRoajZrHxXWPt94/Da277p18/k=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=C3939myAg+auI+DCvraC5rsn+S8+bZzf18df+XayeX/fgo/RbSBESkWbbi8OzJoxs/
         AAp0dyTJgQ1YiXVLQ/ZLF0AcRU81uOCX9+AaTkVHKikd1LsztJvBF+yn8OTefU4Aq6D3
         Qb3u588YbrwJU6n9Gt6Gw9DBdgYGia9+5530pCMh2tcRlAJSL3UG7yH4opaawd9649LM
         J5mCXMAPqC4ryv45ErBz3BSXCaCk9x9GWixdKPR8lZq22ba/JsqTYIyK8RX3Q6jtAAAb
         lVGdVD/BrJ9Q2H6lSgRM93YUBHZtVZpKzQeFLWFwhu56Tl6r61NBoj1umtKsI/3fwNlA
         8irQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2-20020a170903230200b001c5d8a387a6si12781882plh.337.2023.09.26.03.08.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwQH1hS3z6K6Jt;
	Tue, 26 Sep 2023 18:07:03 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:07:58 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 09/37] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Tue, 26 Sep 2023 11:04:08 +0100
Message-ID: <20230926100436.28284-10-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: A0AepI7Fq/QO

CPU ctrl-dev MMIO region length could be used in ACPI GED (common ACPI code
across architectures) and various other architecture specific places. To make
these code places independent of compilation order, ACPI_CPU_HOTPLUG_REG_LEN
macro should be moved to a header file.

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
