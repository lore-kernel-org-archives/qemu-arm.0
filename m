Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1752597ejb;
        Mon, 20 May 2024 16:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXb4xP0W4SZIUdULlxqZjnJk3LeOuocAEcMjGSlqbVf3wADeqZ5AOq+l0sQ+7PgnOOOIRnHWkKPalhirucH6zBnU76XVG4X
X-Google-Smtp-Source: AGHT+IEcEEYnPyVTzY946i/oEnUMgQoPNe4eCVvjry8pJ8cfJ/m0OEPI/0Co7RKg/VrTF8dcxoId
X-Received: by 2002:adf:e8d0:0:b0:34d:93c1:c7d8 with SMTP id ffacd0b85a97d-354b8deaf60mr6998575f8f.4.1716248055120;
        Mon, 20 May 2024 16:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716248055; cv=none;
        d=google.com; s=arc-20160816;
        b=ljGao3+YUB7WRphLiqGt2zV/fLYva06H9crqFlXf0ndC4TJqoiWfLSbul76v3FbYiN
         wvvcFLlZdjqR9BfF65FNYsDC3fbewaqoIeR5KKguLbVWZCOFozudHGgQsYdGhfhJP+w+
         uTTikhR0BAmED4Fz2x3BPMNr7W7blseB9BGwNmfMUw8SJOpwbpl4vXYHBswX4nhst+/R
         xW0SilJ2cO/Dvrk20IdquNajocJNvARQnn47yOHaOafyXDck/1NDdyf0C7CIdzn1hgCt
         jY1dah5fyU6DUsxVghNxeabnFPWgwawwr0TRQCm3ExHoPHbp2r9R7L/T3ttGSb59rFRm
         H/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vN4vqiGhLFVB+e1YfxJFmI3rKnzu7/qUiiTuFHaD4TE=;
        fh=ESkCDJy4SlBfmiW/LaxStj1s4ONFbSiMcQYeaiK5m7w=;
        b=k3k8DCEwpy/3I3h69zL53DGAhlXELAYPrycIrb4tK9t1g+eDRFHg9QRCrY5vTmjkQX
         brv4xskqT3z9/WFS3IAcgAA1OXkjQNnkgAgjAMVus8l1KwkRhwbPr+j9REWHCbapNVrv
         wmyTykEqB04ZCZjQWqeiKanuirCuP1+6uFn62mfAr3Aty5MbDobsUeVhW+Rj8tCTsU/7
         vrVNQwO9GzAjo8IsYMNmkbUCGMIObGRovxwYwYFaOwjT5TSvheJ4hfqNBqe7QhY8ZODS
         CFoqc/LBplVoDBt9zGKvkUb5Tdw7MNNnsKEb5hZdWERLE6vXncjWMzXaCyI6Cvup+I9A
         Pf5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3502bd1a165si14559999f8f.794.2024.05.20.16.34.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2024 16:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vjv266Yrcz6JBkp;
	Tue, 21 May 2024 07:30:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id BCD7B140B35;
	Tue, 21 May 2024 07:34:13 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 00:33:51 +0100
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
Subject: [PATCH V10 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Tue, 21 May 2024 00:32:35 +0100
Message-ID: <20240520233241.229675-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520233241.229675-1-salil.mehta@huawei.com>
References: <20240520233241.229675-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 3mQMXsw49IXY

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
