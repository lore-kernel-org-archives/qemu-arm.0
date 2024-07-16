Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp99899njk;
        Tue, 16 Jul 2024 04:16:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt0Lk0vakcP4KpOHTZovx+8uwaLxmoEPkWudkOn0yXwRvYNCTHBXK+YU6gR9jAjiy65qHWikMpx957GyIom2Pkxk9xM5mz
X-Google-Smtp-Source: AGHT+IHrRZ/v/pCax9I/1kC1pkjICbyQv/iQXg+0+U8dVbwsMpSfKUTSbfaQfM5HYmqDR6wwIMhZ
X-Received: by 2002:a17:902:ce08:b0:1fb:4a57:7cba with SMTP id d9443c01a7336-1fc3d9627d3mr14144745ad.34.1721128575067;
        Tue, 16 Jul 2024 04:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721128575; cv=none;
        d=google.com; s=arc-20160816;
        b=qDE+s7Qav0HXFNY32ISupNLhqnTfekQjjstzeMAhP3ZXvTE5JHwv0njreu9QSTCPpF
         v99+jBXrs2Z1v5V4VdIQf8L8mgoPcsKQN4+fFl+Al3VcXRNhZp3r96MRNNW5fk+L7JmV
         Qopv9dDyMIqhn9mtKIFW0h26f9y3LjcWKqSScVG9UF+OZcq3eKH6NzCyFQjqzZa7KnKG
         wQXOrbyN73v/ndK33i1NXXzsTV4UwpkW/3QLfJeyYQQcc0o9KqtqavdhtuckcmK0O1R/
         1yc/SUCTqdFy3x9S51JgWMsUf1hwcjIqau2zAHeaMGvWZnxwcdstBLzJ0yVUwCrlvlGL
         TW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Tt/aAv+miFrO0/BAWAA+nwdjMvUaZ20BK+ljn0OwKMs=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=O6ejhjvoZCSYnKfrwG+V7vvidAoluDPj0AsxpHFHxXoupp1cauKvrsYq4MilK5r4qL
         nLbV2JLkbPcOeG7pEpCFS+T5JSudm1RMHmtorowtbFyXlb5vF4TY+jmCS74EtQeAYuRw
         mRaVzp7X1M4oc3y7abYgiN0/ixL32IPOikkzqmwtqpKYNHMikdrXOyMYZ11PgiySABWC
         JLJRhJegk08+JkLCVr1Yz/68hwLMH1CbRnD9MunSImGO4U55zgTbAOpYXFQNbvFlRPkV
         VfHWXMDNK6UG9qcj+jNfc8auqQFbKiKY5AixK6H36Y7nNALaWvNgwVawA4yD1FzAqXwS
         UewQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fc0bcf187bsi70533145ad.561.2024.07.16.04.16.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2024 04:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WNc0v3BxWz6JBDN;
	Tue, 16 Jul 2024 19:14:55 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id C8E101400C8;
	Tue, 16 Jul 2024 19:16:10 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.92) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 12:15:52 +0100
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
Subject: [PATCH V16 2/7] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Tue, 16 Jul 2024 12:14:57 +0100
Message-ID: <20240716111502.202344-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716111502.202344-1-salil.mehta@huawei.com>
References: <20240716111502.202344-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.170.92]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: rF1Lp6J+ix6y

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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/cpu.c         | 1 -
 include/hw/acpi/cpu.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 2d81c1e790..cf5e9183e4 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -7,7 +7,6 @@
 #include "trace.h"
 #include "sysemu/numa.h"
 
-#define ACPI_CPU_HOTPLUG_REG_LEN 12
 #define ACPI_CPU_SELECTOR_OFFSET_WR 0
 #define ACPI_CPU_FLAGS_OFFSET_RW 4
 #define ACPI_CPU_CMD_OFFSET_WR 5
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index e6e1a9ef59..df87b15997 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -19,6 +19,8 @@
 #include "hw/boards.h"
 #include "hw/hotplug.h"
 
+#define ACPI_CPU_HOTPLUG_REG_LEN 12
+
 typedef struct AcpiCpuStatus {
     CPUState *cpu;
     uint64_t arch_id;
-- 
2.34.1
