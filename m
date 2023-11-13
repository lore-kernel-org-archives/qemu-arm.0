Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1595142ejc;
        Mon, 13 Nov 2023 12:14:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5yXoahPLEeWipDIGsezK8cz6pP7cmo3gyD+v8MhXg0/k1afTbkggQmj5WMNjnBy047P89
X-Received: by 2002:a05:600c:1908:b0:405:19dd:ad82 with SMTP id j8-20020a05600c190800b0040519ddad82mr432032wmq.16.1699906456070;
        Mon, 13 Nov 2023 12:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699906456; cv=none;
        d=google.com; s=arc-20160816;
        b=sRLFbhrosbnkZq4k8Yg4a5duC7YPoS5sn2DMFq2Bea5FFOSWImaUCbNVMWi/ecqEMo
         wpeNw26tXRDDf4cfuFDzUg47vV66DXV+2MsCYhf1YiLGJypB+17YF5+LNlxpDxmL3ckQ
         /cFyyHR09FJDcFP62pSUSjnGkETtYc+7c9Ft5tlqyjFgCIXLqoHnKCkB2pRTYega9PUJ
         1nxoRjLMwL0aYWPGPZEyZZ/gyeNsLxeAcmipfWfFBTCH7jEkeCcLLJdhaXhgpeUN5YFq
         RmjPOoseTmoGCVw3mUYziH9KdQh1TRnD1JqKKGpis1VSfH7WR2GcGDykRW+QjTzoaa8Q
         RAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=mLx3kYlaS7n5A4eA9Y7P7GGaBKSJ5w3CKUc6tYtFkTg=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=dcJbgnURhLgRQAJoHpL/qOa7xXpGQ77YUFElofBb77fiZ4rzFxPTGYqc65P4eWNy+N
         zAnzmn8OTD9mhhQimsxYPIaOdA43X5ENp8DbL7TftiTQCU2MVLbLtzlaZPD5ki8Ul28k
         NKmbd1yPWSdhgEU7ehwclgqg3bZeYVQYg8bSjvELXFMYwB5WKmcSuWsRjgmM1UmrnWNn
         KDnQahjSRRi5uOvfeGKTBEjF75yuhe7az/YgNgbcbEO8L/YRJVhA234Dbi6gmAUElhoL
         nP3CbPgxV67E1q/jy9QNZQx1rurEB2sOcsQ7zaK25fLKauuevjiQ/4zKT594UNEKGEdS
         pG2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id f22-20020a05600c44d600b00404ad162cbbsi7136320wmo.179.2023.11.13.12.14.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 12:14:16 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4STgXP0fjfz6K5v8;
	Tue, 14 Nov 2023 04:10:29 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.147.128) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 20:13:58 +0000
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
Subject: [PATCH V7 4/8] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Mon, 13 Nov 2023 20:12:32 +0000
Message-ID: <20231113201236.30668-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231113201236.30668-1-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.147.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: K4oZxjHMPJXN

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
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 hw/acpi/cpu.c                  | 2 +-
 hw/acpi/generic_event_device.c | 4 ++++
 include/hw/acpi/cpu_hotplug.h  | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 4b24a25003..de1f9295dc 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -323,7 +323,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPUHP_RES_DEVICE  "PRES"
 #define CPU_LOCK          "CPLK"
 #define CPU_STS_METHOD    "CSTA"
-#define CPU_SCAN_METHOD   "CSCN"
+#define CPU_SCAN_METHOD   ACPI_CPU_SCAN_METHOD
 #define CPU_NOTIFY_METHOD "CTFY"
 #define CPU_EJECT_METHOD  "CEJ0"
 #define CPU_OST_METHOD    "COST"
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 57b0c2815b..f547b96d74 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -109,6 +109,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
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
