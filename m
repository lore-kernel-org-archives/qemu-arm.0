Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3221980ejc;
        Fri, 29 Sep 2023 05:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkd21M46AxGPoHq6qGSoS7CaSTmkECZ23/itMggKcnWd7+q37WNlxQNNrj+M+egD55lor5
X-Received: by 2002:adf:dc8e:0:b0:320:9c8:40af with SMTP id r14-20020adfdc8e000000b0032009c840afmr3835291wrj.11.1695991588924;
        Fri, 29 Sep 2023 05:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991588; cv=none;
        d=google.com; s=arc-20160816;
        b=o813W6MePZzPj2tBlNdaGQVk4RcHi7MF/beXcg8bi4WO/JoieGnl52B+3KMIKxlymq
         RqqbpkfaXRL9xdSL0cljNZ+Wpdggcex5iIhWIjZUzHhmjhmnqtgm/T6fnQZlUtAXw4z4
         +fT2/1UvsQ5qYXNq7r01g059/yQ1KElKW/GiDyOZS310eDxCIdK4lq4VR+MmvjHqk/5o
         RRF3GaguFdYPRsbzocL1l/rp1xfXEodJj5V9RwsA9go8vK8WqnF98BYUnOsld6fdb62b
         K6YM/MD1B51Ln9bc1yA9jSopcUdQJkOTmACN+VQ/PFEgUFrOmV0EIIogPlB4xy0WKUJj
         +Otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=AU2JpTmaHhLdsFI1qtQZAFu2zBxPFx6tIud4qu2PwxY=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=Jz9BRUyTQjoWCDhtiszSdlQLskCwRltw3YKfL0t2djNLiHLyw7hNJE/D3X6q8axRHx
         HQXaWNIRXE8CuFA8PbOKchSyjkJkDMTGagliJ42W34HPrVxG8kQJ2i0P4z1HIqcTe031
         +6yVdVtqwgLDbyhNJ8qGGm38gCbMUx66LrPGmi2UHOyrW/IuEfn8TzW1fTCvfYby89Av
         ZJlJRlZ4ZdhR7Kv3ruLyxstEvSqDimWXTHSJEhs31ByPOnwUHV7Brpzx38OSqdHb1FhE
         fK3y6Ux+VUG3hHJjNMatEjbBvLaQIE7XXgGAffHmgvH/mZTFutBVqiNGaehd4ea0b4ef
         o81A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id h1-20020adfe981000000b00325fd950c3dsi350807wrm.634.2023.09.29.05.46.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RxqnD1Sgcz689xQ;
	Fri, 29 Sep 2023 20:45:04 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:46:09 +0100
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
Subject: [PATCH 6/9] hw/acpi: Update GED _EVT method AML with cpu scan
Date: Fri, 29 Sep 2023 13:43:01 +0100
Message-ID: <20230929124304.13672-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230929124304.13672-1-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 9hLbVxuyM4pd

OSPM evaluates _EVT method to map the event. The cpu hotplug event eventually
results in start of the cpu scan. Scan figures out the cpu and the kind of
event(plug/unplug) and notifies it back to the guest.

The change in this patch updates the GED AML _EVT method with the call to
\\_SB.CPUS.CSCN which will do above.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/generic_event_device.c | 4 ++++
 include/hw/acpi/cpu_hotplug.h  | 2 ++
 2 files changed, 6 insertions(+)

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
