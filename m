Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp805817nji;
        Fri, 12 Jul 2024 06:43:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFzzAIvcpkCArKbvX7Mtjlyv/0xG3BxE8Qh5jxvNXXvpjmT0dBNgRiT0b8OePsP5zr2nGh26ughl4XZWWdG5z76KB0O9dY
X-Google-Smtp-Source: AGHT+IF8jIYBFVoRSHvUjf8aFTPo93DmAvZofauyN0UeC5QQHGoCqmF7AqClM+yOy8gNJ3qlvdqs
X-Received: by 2002:a05:600c:6a09:b0:426:61b4:a2eb with SMTP id 5b1f17b1804b1-426707e1ffbmr73229965e9.19.1720791807870;
        Fri, 12 Jul 2024 06:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720791807; cv=none;
        d=google.com; s=arc-20160816;
        b=EnoR7L8RjG8Co0geMHms0jvX+IWDEy5/ENG1eTq0xJ0sl4LjEe6pKxUcGcT+d0f1pK
         qCE7dkhbqUfG/R9FQ9dDFgXty3Af9dlQrJNEf7MrpglH0wBUhVnQhQsd0pnqwXINVRvF
         ZWGRIXt9kX5Ko/u9Rq7+owcKodzKYRl/lZ5XbnEJCQwcWwGQzZCUZdRyqojc4zgditJx
         teC7ebwBbHuNMW+6dDwRKZqBRDn3U0JRwer73ROhixO5gOqqaHOj6be+acYQBCqgw7Mk
         +CScmZzQf2sZIGqAx0Kb6beRqP+qVCIag5Yy8ULxMjZal25WPP0nKopxBQWiu0rkJPUf
         m2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/YMJY+8PLcUVCdMicwHRBHBQ6J+mb3955/NjKqXaMq4=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=sm6tU7hADz/D2/oz9b4wEWyiBNoBBazjpt5KqJFcYYJD4IXHUsLlwDCB7MU/GXRqDG
         aClZSuMf5mZgFpqhPDpUf8+ZwRL2Q9BBlh6nisASWHnr1z8ORl2auDK4/ezQWSxnmDQV
         JUDUan1wyJeEIq9XsPKMMtZ8Gv5OwJu/WBnL5PjTyKBPWcf+8IYebWqCSpaIbiCqgkdY
         K+Um+0hnSs6fpdWS9+B/CwijV0H5ObtY4A2m/lh4QnIA/hOo2g757yKkibUKHgWo3eHI
         cNdD+TBHcC8Ju57BEhhmDwTYJt2odDm5cOfi5SvuzY1aEJmRxhlBsX/OlaGbqDMebhO3
         Ld/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-367cdfa5348si4552967f8f.308.2024.07.12.06.43.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLCSL3vfPz6H7qr;
	Fri, 12 Jul 2024 21:41:54 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id A6E091400D9;
	Fri, 12 Jul 2024 21:43:26 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.195.244.27) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 14:43:04 +0100
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
Subject: [PATCH V14 2/7] hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
Date: Fri, 12 Jul 2024 14:41:56 +0100
Message-ID: <20240712134201.214699-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712134201.214699-1-salil.mehta@huawei.com>
References: <20240712134201.214699-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.244.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: DMiGwuzjxfTK

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
