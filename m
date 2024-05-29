Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp901322ejk;
        Wed, 29 May 2024 16:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4y59KzIwV5da+yFtNP4axmkqFsDm7ccELP5WZ9KadNdXnN+LKQKH6mEtB5q6F0C0UveQgSJMFypFTNO/2xpBCbZ49JN0L
X-Google-Smtp-Source: AGHT+IEHE5/LPXmQCPbsukv6wCjztAj43dfZ5ta8fxz9D89/H5cKKAhxbjt1RKBSF+SND9Z753Am
X-Received: by 2002:adf:ead0:0:b0:355:75f:2862 with SMTP id ffacd0b85a97d-35dc00bdbaamr358871f8f.48.1717026256470;
        Wed, 29 May 2024 16:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717026256; cv=none;
        d=google.com; s=arc-20160816;
        b=uHz35egNXdGk6Mom1botCI8TmDEVREXnaWh64NWhTRbFFo9p8DFfksE50quLHBa+BK
         J7RMDF/DpQwPZjMjeLWsf2cperi0PXYlFswc/yuoW/k88RXpUmoViIf5mzcQCvc6nKdu
         QpuvOGVcqSfHKTr7LWVs8WOiFeUWjM0WNdDzAM5FMWAz3lNCYFMpFHWByibHyFzkp6C6
         keiYRJOeWa9Q0oC4ABa2MQ3kFnPDaZHqGGmf/wI27wYjxGMTEHew1EEeUz5pASDkDsiN
         ooWMzGY3QyyMYUNVayVK4nk8blVaqpw/qVhXs0C1lCuHS+TwpPXx1pNNQ0kqUo5/7Oex
         o4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AxPNtRsmURbOQIOBStAx2ezIdpOJVmb9wxK+yTb0yz8=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=M4d9M3G87YD9RyyuElcsLxwEc8NmBPBVKKy48sXbB9T+fk9pCFAQwXR/fv7da58fpX
         aBHSxhbJ0s07wyX7Cn/L+2naFbLo0nxliwk5zmYV+cdcr455jHBG2b9e+7aT9Pdcoez9
         A2VfXIZDktGdkPeO8AsMOGNxaaMDHFppqythqAB6b1VBx5qOhi0LF1bPMbAr1V1Tzi1w
         JijzSCsn4b9y/BeIDSBDN2j23qs164AJmJ0diZ5KGYl3z7oIHmsgxMSlV65LCyiNaDpd
         +bcTos382CvGTJUT5npO9abSnetPjVjkTpLEnhHmQSyhaHF5TNoAylQkSfwI9SH5DfON
         Qcwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35dc003c6easi264329f8f.723.2024.05.29.16.44.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2024 16:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VqQq26NFzz67fBs;
	Thu, 30 May 2024 07:40:14 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 39D62140A08;
	Thu, 30 May 2024 07:44:15 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.246.47) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 00:43:52 +0100
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
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Shaoqin Huang <shahuang@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH V12 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Thu, 30 May 2024 00:42:35 +0100
Message-ID: <20240529234241.205053-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529234241.205053-1-salil.mehta@huawei.com>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.246.47]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 9HPaTbM7DLwy

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
Tested-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/acpi/cpu.c                 | 2 +-
 include/hw/acpi/cpu_hotplug.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 2d81c1e790..69aaa563db 100644
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
