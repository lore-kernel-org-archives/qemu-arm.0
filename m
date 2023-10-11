Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp324371ejc;
        Wed, 11 Oct 2023 12:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGKHe+6l6wsKM1uy/8pIo93TRde8y5rte62TBpvyj8HPkYqA3PZ3Oem52NetoGJtP/3JlF
X-Received: by 2002:a5d:660c:0:b0:31f:a15f:2cdc with SMTP id n12-20020a5d660c000000b0031fa15f2cdcmr15883949wru.29.1697053592125;
        Wed, 11 Oct 2023 12:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697053592; cv=none;
        d=google.com; s=arc-20160816;
        b=q/bX7FSVg8Wy8b7zslcI71WpaSJ2L7S6h1G4ETXWBchUM3qg4Zt0JyGzGzp9Ds46qq
         0yKvYtDHEf3xGbiWsHjHcFNTK+2/TuGBcYrp1Zk6n9cWLnsX0m6JQoPFOU6iMxG8OiKY
         3YMNIWyFCG1Z+Pbu9nEDi1fCySc71XAfvrhA5q9NXFt4FjKl3XzpscS/nYFvtm9LZUBU
         ALH7qzUyZ+tPQ4739o5s4CFDNpuFucZB7OZ01VCJA7XkGXfw07RHmDxpTK+cmS6hHGo2
         Vu730FpJO6g0nCZGE247qO3zIV7tWBuEP0Qml9bPK/11QFfTf1o0pUS1vU0ZWUnZ0p5U
         oBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=7KiHvT9036JMqGKa6f5j4JpzLaKvsQyN6FUrrt2NYeo=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=Mphie4XQXICj6U2RiNvBUoqHWpSGZxbPE6PtrCCc5sQltENVacsVwK8mjwwGPVcL2L
         7TFR7sGqYMT/qCMSUdCfmsWL9ZOoBs5w/wWK/DdxG19viqKS85gXNl9CuNO1Rv7U6hbi
         TYJ/YFxBJKpjKalqaiP8G6QkCqlAR0ltOuvmYSf5mhV9Wp9dFFP0uurXE4jxbtHH4j58
         6rKs9uLJFdoht2hTR1fFHiweUTzIcCF5S/HssOPNnv6KXzcfpHLZTtbQNh0ATPKTS4MX
         uiXKD4ZFGwXNXyQEMl4C8oqqGZR1v5EmpvqtFcXbyD6SptqKZy369oMl0VkKFVZ8GEHT
         eWaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id t15-20020a5d460f000000b003232f588170si1025686wrq.169.2023.10.11.12.46.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 12:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5NYX72T1z67H66;
	Thu, 12 Oct 2023 03:46:08 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.169.226) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 20:46:12 +0100
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
Subject: [PATCH V5 6/9] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Wed, 11 Oct 2023 20:43:52 +0100
Message-ID: <20231011194355.15628-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231011194355.15628-1-salil.mehta@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.169.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: XPwTFteY7bZo

OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
results in start of the CPU scan. Scan figures out the CPU and the kind of
event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
method with the call to \\_SB.CPUS.CSCN

Also, macro CPU_SCAN_METHOD might be referred in other places like during GED
intialization so it makes sense to have its definition placed in some common
header file like cpu_hotplug.h. But doing this can cause compilation break
because of the conflicting macro definitions present in cpu.c and cpu_hotplug.c
and because both these files get compiled due to historic reasons of x86 world
i.e. decision to use legacy(GPE.2)/modern(GED) CPU hotplug interface happens
during runtime [1]. To mitigate above, for now, declare a new common macro
ACPI_CPU_SCAN_METHOD for CPU scan method instead.
(This needs a separate discussion later on for clean-up)

Reference:
[1] https://lore.kernel.org/qemu-devel/1463496205-251412-24-git-send-email-imammedo@redhat.com/

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
---
 hw/acpi/cpu.c                  | 2 +-
 hw/acpi/generic_event_device.c | 4 ++++
 include/hw/acpi/cpu_hotplug.h  | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 66a71660ec..d7d7b5b8d2 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -322,7 +322,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPUHP_RES_DEVICE  "PRES"
 #define CPU_LOCK          "CPLK"
 #define CPU_STS_METHOD    "CSTA"
-#define CPU_SCAN_METHOD   "CSCN"
+#define CPU_SCAN_METHOD   ACPI_CPU_SCAN_METHOD
 #define CPU_NOTIFY_METHOD "CTFY"
 #define CPU_EJECT_METHOD  "CEJ0"
 #define CPU_OST_METHOD    "COST"
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index d2fa1d0e4a..62d504d231 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -108,6 +108,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                 aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
                                              MEMORY_SLOT_SCAN_METHOD));
                 break;
+            case ACPI_GED_CPU_HOTPLUG_EVT:
+                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
+                                             ACPI_CPU_SCAN_METHOD));
+                break;
             case ACPI_GED_PWR_DOWN_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
index 48b291e45e..ef631750b4 100644
--- a/include/hw/acpi/cpu_hotplug.h
+++ b/include/hw/acpi/cpu_hotplug.h
@@ -20,6 +20,8 @@
 #include "hw/acpi/cpu.h"
 
 #define ACPI_CPU_HOTPLUG_REG_LEN 12
+#define ACPI_CPU_SCAN_METHOD "CSCN"
+#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
 
 typedef struct AcpiCpuHotplug {
     Object *device;
-- 
2.34.1
