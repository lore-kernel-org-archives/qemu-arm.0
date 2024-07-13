Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp1457569nji;
        Sat, 13 Jul 2024 11:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDIZrM6jbe+V65UyQypoQ7cHHpX9v1QOOnFoGXp5cjZYb0vO5XsffPBmoMAEEAk2RMaswIBSOnehf8jbomFFoCSgnkAoye
X-Google-Smtp-Source: AGHT+IG27q4W1spGQQXAhkC7thgYRWr7H9f3LvSs2rNJs85MBSWjc4NLOYTPQ9Y65wXUQSRIDxZP
X-Received: by 2002:a05:6000:1849:b0:366:df35:b64f with SMTP id ffacd0b85a97d-367ff6e7a09mr6852629f8f.4.1720895193605;
        Sat, 13 Jul 2024 11:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720895193; cv=none;
        d=google.com; s=arc-20160816;
        b=vml8vl58J338fUAVxMGIhdkmr7eAxUl2ji7Li/3Os+BhBzuRJ3LqrmBGV5pA060lCu
         oxcIA+04hAhI4v9JJhoncS/uWguapVTDfJedaFzrJEGcdmaOkPmrWUgfR2zL0wBfa+Yk
         d4iw0FOM1DfTN7T9H99K7eZ+LlMTPpPJCZhsOd0cwgp6HUSfolnQ54X0ZmJX4G9j7msk
         CMLfi31op4oF4Snrx4NIi1CXG1RmYJc9mjgJA4tnjZn77OmSGS4z9XARqqgjECXdEAY7
         B8QDj/A5y3SU/HxS5Nvpp9t3EX1KWoVZR9jDCqK4AhvRWtzRncGxa+10OBSEZbJGp+nR
         NwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/YMJY+8PLcUVCdMicwHRBHBQ6J+mb3955/NjKqXaMq4=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=xphpzQkzpUJQ110Mdps0JVO4/Pe5lsQIY8auURNF9iNccEWQy3GCYcw/kCRXENx9iT
         yU2wIbA8OrFkFhnUJIcA3vZLqpJlKO2b9j9ZHUmzRlgxb4iJQUkoBz08MszjnVhQAX9h
         /rwXI9u38rTVmzyljWuB1erUO5GkmWjta3cXY+v/4Nb4712hhR67+tNnpKOXJs1NlbAM
         wBy3HNzMwHECQhh32XAlabJ5wzi6bWEDoO7+Uezy7VLWurWmisSbnt9tNU9gYQjsFML5
         HQZHRd6sNoksJ4gf8z9xSbnotkqavC0xwiZGpfkCXfMZCCEdTrXwy29j5RgvJgqcmMgR
         YuuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3680daf6f88si983079f8f.317.2024.07.13.11.26.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2024 11:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLxhR6828z67MQj;
	Sun, 14 Jul 2024 02:24:55 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 92F2E140A78;
	Sun, 14 Jul 2024 02:26:31 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.172.138) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 19:26:13 +0100
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
Subject: [PATCH V15 2/7] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Sat, 13 Jul 2024 19:25:11 +0100
Message-ID: <20240713182516.1457-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713182516.1457-1-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.172.138]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: iJV7MTk77vxe

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
