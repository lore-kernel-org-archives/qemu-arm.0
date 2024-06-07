Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp893944ejf;
        Fri, 7 Jun 2024 04:58:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMYUexj3e6lrM5vbU10OxWwAikJ3py8F+8Rh/mKix/NMKDuzMKQSNCm/xWWi1TxT0yeAqPauJ07kRD3QV80wyqTxbiFwi8
X-Google-Smtp-Source: AGHT+IGwnO0AlL5ayu3qNd7HYb5YKI6fL9OwRqQxVvM1oNIVSitBnUb/VWpa+FWtau+uX1/HsCa3
X-Received: by 2002:a5d:47c4:0:b0:35e:ef46:64c3 with SMTP id ffacd0b85a97d-35efee10b29mr2170349f8f.57.1717761511956;
        Fri, 07 Jun 2024 04:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717761511; cv=none;
        d=google.com; s=arc-20160816;
        b=wt8dSWahr6b/tlg30UPJ06bJtlRi7M4zyeKbkAp8Lps9rX6Vq9NhU7h4mRZWqZNvXi
         yJcOzmGzrpbUxAa+N31et24aLthQSkeI1nYrjU2Rmlq48GLBE/3abppWBuUup/1ambgi
         xdMFHD1u5RBILiWaiOM0fKLp6Oj9WM6tWGouugRRi5KxulzzBDJUbNZCZjv5uEfDA/S4
         BhIiQR/RwjyJsPFQSUZziQ7j0X3TBhAApqF5lP8kZQo9vR7KOP4jFs29s5/ScSqF/Gj8
         JoeNWdbuzkiyMKP/HSIo20/VbvBLraBfsjiNQXWV0WPLoy0Wk2c62bvdYa/10XsNb2ct
         5vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AxPNtRsmURbOQIOBStAx2ezIdpOJVmb9wxK+yTb0yz8=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=x7GKEV9zdFnOp0dbLgbHSAPoidW9XgXLQaVJvYUxQr5GvqiOuhblQQ7bG5hSfzxrV9
         UUN43R6XmxaRijsJOVgwJy6bCv/dd0ULP8j2kpWOd5hffo3CNgOOwxm/CZ9YOU0GSEBP
         lV6SwacYHARJ3H07YTMI0lJ1z+htqHpNgdAmxqXvNLmFl1tWkfwtiBOO7BlyEXs/6E/+
         3Qo5T9eK+3jl5cMYkdb8h6hTqxV/V+Bfu9fLhpNtKiU/b3n6yleRHTyOMNO+ATlo12Sx
         HqKEdsrqxFkbltGC/XylCKYU68QuTr1D2YBpY4wuNybP1P8qjIiHw1qGe1LnuHNQwEd4
         bTcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35ef5e57812si2021633f8f.570.2024.06.07.04.58.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2024 04:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vwfk66J7pz6HJpZ;
	Fri,  7 Jun 2024 19:54:06 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id CFAA7140A87;
	Fri,  7 Jun 2024 19:58:30 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.48.147.102) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 12:58:07 +0100
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
Subject: [PATCH V13 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Fri, 7 Jun 2024 12:56:43 +0100
Message-ID: <20240607115649.214622-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607115649.214622-1-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.147.102]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: JYnvnHr9qdUA

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
