Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1553128ejc;
        Mon, 11 Mar 2024 19:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9QhGX7SdkGek4kL4Bxm1wJyRx4oRPHLrIxoxztlOfaYEQReG4gIgyB5/E/oS8JVRppKmPZoVxfACf0EBJty63SEgnDdrH
X-Google-Smtp-Source: AGHT+IEe60wEs5KgUjVwARHRS3knJmIpxY3/eT0mID+MnJ6e7TtnmtM9pgkgnli7wlKlwONgs7+T
X-Received: by 2002:a05:6830:438f:b0:6e4:f48a:c438 with SMTP id s15-20020a056830438f00b006e4f48ac438mr12206641otv.20.1710208882979;
        Mon, 11 Mar 2024 19:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710208882; cv=none;
        d=google.com; s=arc-20160816;
        b=Rbi8051N8SQOmJqL2YObqx4sRGgDR5AhY6i9I85vAC92OX20+HGW5kv5HreJIWXHHe
         hI/T6Mue/mZc2KomWOANKKAnTiAhKOYhnTx+ScMNzR9seJDbCBcYUiEcTlS5FypyLSc/
         6PhtND5YVL5PiAascBQyMYq2bjXCexHbXCCXU2PcgKKH2M2/52IWV9VyuPEHqTZILvvz
         A40Gg/Xsm5ew8bS+BvcgR+mME5CiN5JYhO5OaraVwXQ7Vtp3nfuXiMXSgSvSIi8bN6Kk
         I3tBtUTvKaHHC4nKS5KnIDEFjaMcIWk2qtSJ1GKetEsA0rxnoQGKSfx12BnaL7bS5GAC
         SqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vN4vqiGhLFVB+e1YfxJFmI3rKnzu7/qUiiTuFHaD4TE=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=KrGBdm1aWM6XjUdNNpHMUNhq2veCWfmQKSZ2ky6KqdnLVUHY72Ia2J0XNZkKPuj+Ef
         YOXZWPNfza/TiYMmI7jDXt7lVGjZN/o6W3R2kmS7siMCmWG73lesOmaTAto9DddrWFIc
         +fZMJ5gEfCP3X1dAqvtxxIi2WHVfdu7x8Cfro86xvLu7c8FNlA5iCZhdcspUwFXCGTHK
         0bpHb4xvF9tyxyMHNAv869Kq9pakbHhbvsfubv7KX7UYDgf3SqlFnRUGNO0fYsUsHc7U
         yOhCcTBOm9KsNqJQXcFFiDq95xJHU4VZQ5c2xi1UbNYYyifpmn8XSUuThr+Ah4qDUCdy
         ZlcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id t1-20020a63b701000000b005d8b2b582dfsi6024194pgf.837.2024.03.11.19.01.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ttxh950Brz6K6Qh;
	Tue, 12 Mar 2024 10:01:13 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id CA3D0140D26;
	Tue, 12 Mar 2024 10:01:18 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.148.5) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 02:01:01 +0000
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
Subject: [PATCH V8 2/8] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Tue, 12 Mar 2024 01:59:54 +0000
Message-ID: <20240312020000.12992-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20240312020000.12992-1-salil.mehta@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.148.5]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: J9P3uLaJU5o+

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
