Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1724ejb;
        Fri, 29 Sep 2023 17:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp81bccs+3bOhNuun/EkguwZXkeD2pOJVbLFYg97BnnDOfbHeL5bwSEj50cpHp89h/w/2D
X-Received: by 2002:a05:6000:1cd:b0:31f:a256:4bbb with SMTP id t13-20020a05600001cd00b0031fa2564bbbmr4358613wrx.71.1696033248132;
        Fri, 29 Sep 2023 17:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033248; cv=none;
        d=google.com; s=arc-20160816;
        b=w59nZVzHTLD7ktNw1ZoxHflgZ39fWn/CAxBxzwrk10cYeNdGnLoAh1Rut5OeRv0edZ
         ABPcICIu6kEuzhdX7hqOZClMs5xRpR4lmMThKsJNv+91O5xr9RbAoXkiA73bYGBeXIHr
         1pmWT9XQVJw6Uxx4FVGk2bbqHjNYi+uZ4miS6koXmwjpCuLIqX4ppfznX/ZFebbviAJH
         SdJjwEtd+mFB2dpYSBKgH2ZcSEVgBJSkaQ39dLjHmakwmOivkcgeJZCGwHb0ZWNrKKYK
         dypbJxDF+Z64ZOjgTb4GN1371HCvPBUXrC/1ati7l349VtKuqIeitJV8jNOKqqxt8TDz
         qAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/OtDrdClvizErIUBCEUPeJJ2w/sWgqIPIdeMoIlkS5I=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=mMMwTQXyYlQO94qCNtS8CF7l/CdlJp6F+hcsV5pGUXRwndjVu3QnrAsyAeCzHNDM0w
         D1CV81KvOdrsiOKDsP2gfcfa/cD9WGnZuueFSC3NFVfS6TGS2zZulWPD3LM9xuXXBK4w
         3UCRcw1dTfIXkNW9NK2zkFYk46W7A1a9z2PY6SKzq8UVDgy0OMTHewofLKtAfPH8HUWE
         vIo+YLC67BDudM2cVI+h+3UvPuyptcgaGtuNrvaCSlyc5DtjTfdX1fNDoxDqbkKbXHWh
         Z5cHiII+KTNuhZgW45whpclIoJXbCGR6ACr0+d4v7OyCRqIVvJyQUR/Kr70ooJK6yDmM
         jHFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j17-20020a5d4491000000b00313f41ab170si10658914wrq.602.2023.09.29.17.20.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry7BK6KMLz6K5rX;
	Sat, 30 Sep 2023 08:19:21 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:20:27 +0100
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
Subject: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Sat, 30 Sep 2023 01:19:25 +0100
Message-ID: <20230930001933.2660-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: wAqbIwstRFBW

CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
appropriate common header file.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
