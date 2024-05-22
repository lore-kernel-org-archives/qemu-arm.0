Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp682347ejb;
        Wed, 22 May 2024 14:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKxn3GYGC/NKLODCZe96twxB95wMd76OrcyLCSoXHd/pRAn8C9JbKXcvAhdajWBKSaI/sZAOHY70lUR9aNuikZv8Dkgj/S
X-Google-Smtp-Source: AGHT+IG8xVi/2hquroBsRrgQpBMVyoL7kz8DTgH2eUNUCyKOQ2qQIVPwSc15pozomloknUtJSAOM
X-Received: by 2002:a5d:47a2:0:b0:354:db81:4a80 with SMTP id ffacd0b85a97d-354db814b6emr2789178f8f.22.1716412353148;
        Wed, 22 May 2024 14:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716412353; cv=none;
        d=google.com; s=arc-20160816;
        b=gIz3fwW+pxTB/3elnVUhwFK1rBxhp8BmmjHGVLQFllvxRy+o0+Y0lXRHvrw8ppg0oE
         ORolmFGiWtHOA6BC7hYJbOJrpUXirEGQvW1eQQ92W6l/Nd8k1QU8IDh9MwpVI/2+NLB0
         iWvcZms+jxZMVaUWWeWfEhcH9HzBTsntI5Qzd3wwM/PvFvtkn76037/cgdFyNZhMYdNH
         9cPMqzqvVE/Jf4cLyegL3sWqytFydUz+rCuEUT0eIC27GQiYY3ZYKROT182NhD5gC4GS
         Ne7l7vTs9ISYyq+8+mgbrxUwmVFTlmU8xg24Y5tdbipfIyuD+1LZTmTKSlj+C7BbR9E4
         lpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vN4vqiGhLFVB+e1YfxJFmI3rKnzu7/qUiiTuFHaD4TE=;
        fh=ESkCDJy4SlBfmiW/LaxStj1s4ONFbSiMcQYeaiK5m7w=;
        b=G1SZEQtN3eHkNxnXSwYpzEob0yy8+ZD0RDjAnzqZhnA2DFk4hhZ8nAX+3MC5zFqX0r
         y651JFjqbersQPSJ0EiXi6WRQFTzUZLZqXnECWDIgWmIXDgvy9z+1vq1rCSM83vfuNsx
         ioihpKvl18x3LMUcEGu7VoY+vPngBEvpCS99LHRGd7TKy+y6DdEI44x6GYG6dZKm7LY1
         rXKfO54xtXtVlw5+pf4jEVzQyOuaHIOBRxwv1K5dXZ6S1qzafs2hmKP8jv4yFIUNVM88
         Kx2Sl7zB60Zifpfg1vfn0fR854aoO4dV/bAUuLVv6A/20g1faGi838EnlMx08Bm8zsM+
         73ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3502c0f9e8bsi17107091f8f.891.2024.05.22.14.12.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2024 14:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vl3nM3sPYz6K5xv;
	Thu, 23 May 2024 05:08:39 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 319B5140A35;
	Thu, 23 May 2024 05:12:32 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.48.156.123) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 22:12:10 +0100
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
Subject: [PATCH V11 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Wed, 22 May 2024 22:11:05 +0100
Message-ID: <20240522211111.232114-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522211111.232114-1-salil.mehta@huawei.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.156.123]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: zeMI+ez3iS3b

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
