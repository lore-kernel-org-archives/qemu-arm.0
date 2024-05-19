Received: by 2002:a05:7022:fd07:b0:7c:9548:a19d with SMTP id up7csp4597937dlb;
        Sun, 19 May 2024 14:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2d8vpUMSR1kc3zEKL3oOikrib+xOl/b0JQLLTxLXw1DfuG1FLQrFVRvUfMTD08MaHtbhYvUEaT9GBwsNQLfwsOQTckAik
X-Google-Smtp-Source: AGHT+IHFLoU9axGJJawigwjPl3aACK0V+yw3KMcTHf6l+N+fSPxT1N6uWKsWodrcmh9jByRyF5yV
X-Received: by 2002:a5d:6587:0:b0:34c:600b:b016 with SMTP id ffacd0b85a97d-354b8e33cc2mr4650839f8f.27.1716152908591;
        Sun, 19 May 2024 14:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716152908; cv=none;
        d=google.com; s=arc-20160816;
        b=k89vAtZBQnuvN3GhVA3DsHI4bBd4jkrXQZ557Md1xDBMCLagTzGMx89TE0bt6GSeLl
         /4DwTQyfQ4gyiJ/CBZ4ZUYUBR7PUPU5RGqFLf7AD+SAJ6PKod0gUQ4wZXB6SRB0Ut9h8
         MVXKeKQG7fCQ6Fpo+H+Z02TDzmOqxMPEFMTYdQiqc2po87ApiVunyhvmDAWs7mYwguQW
         vnaKETyP8AG8pRacCOR2x378qM8kVkJGLEI9qjawBZIGZW338kMDl+sC5w1WtyTmhFmJ
         uSHvpnLENrrV0vL56sE75NBMmvztup6KiVM4ohujTCMvy27hpyAH0lGNPqGWphBek11r
         DA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vN4vqiGhLFVB+e1YfxJFmI3rKnzu7/qUiiTuFHaD4TE=;
        fh=ESkCDJy4SlBfmiW/LaxStj1s4ONFbSiMcQYeaiK5m7w=;
        b=TvZ1wULWKffjXNgKGJxVJJ6nwRL0MZRsZO0jg8QhIpDOjpNn/CA5DcUV6AdZklMJlm
         0yUqkAkDhYiAG6xBi0UGNMW4D5t1XGwwLt5q/rHOPOZzrTjmZ7f2W/fXOqKxzLL2sf2V
         g+D66mhsrWsD6bt6D9iJXHX3jzaJo+s6hbV71VjQAh5/j2+OuTON5XLCEHg90pY+04Uw
         iDmqDpC6ETJNgzR5OjBH/CpwahFSFH4knikOGwJyoPgyQIM7lAPmRXL3KfXUNY9iWCXi
         5cjCLeddS4UICj32G4gKQKYKSY2y954hZGbDqxAipkHn0KbVI/r/PWw5l/nm2W780M33
         dNeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3502bbe08dasi13358849f8f.514.2024.05.19.14.08.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2024 14:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjCrQ5dxzz6JB5L;
	Mon, 20 May 2024 05:04:54 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 7CE39140736;
	Mon, 20 May 2024 05:08:26 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 19 May 2024 22:08:05 +0100
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
 Cameron <Jonathan.Cameron@huawei.com>, Shaoqin Huang <shahuang@redhat.com>
Subject: [PATCH V9 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Sun, 19 May 2024 22:06:14 +0100
Message-ID: <20240519210620.228342-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519210620.228342-1-salil.mehta@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 5Icjmnhk1PhA

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
