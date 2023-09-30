Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2233ejb;
        Fri, 29 Sep 2023 17:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHydUiIEf94DaR8DVPnOObARVru192jzIo867bo6CkO2fZG3qBe1fPYS5pxuUVz+OhIFxQ8
X-Received: by 2002:adf:edc2:0:b0:320:932:80a0 with SMTP id v2-20020adfedc2000000b00320093280a0mr5073070wro.54.1696033327374;
        Fri, 29 Sep 2023 17:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033327; cv=none;
        d=google.com; s=arc-20160816;
        b=CDnOACIGkzwYYo+bkRDP6sGkGZPQi7XyXVOx+B/waoYb+J+kyMMXf1Zd9ooXzUqxnX
         pNhWGrbL5KfHfQnIDxhmS/yhuXEWHKfEi/m3GLdxjRNvmm+jFOYbctaTqvME+cccP57S
         toXaU77no36EW5Njk/AEAJ4c2wyfOPtqXU/X8Q6Vj3PPqKtgrOz3KVvMfao5ZHUXS+XQ
         XmPFh202NNg8epK4RNpdaoYWXRTLGnoWHfFWYgMQRM5LDTI5S86CKxlHvzicbGeDU/Mz
         lZAHFstdOwAnzMVJmEqbL7dOayHpdb+xQoiMIo3mPCa1KL5cKtSUlVNThiRx7uCyVf0S
         24Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=AU2JpTmaHhLdsFI1qtQZAFu2zBxPFx6tIud4qu2PwxY=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=x+gSWnB6WlLZGGksmm7APOGOkrBH+QKExO3n7qx0kEMwusQo3d95D5bRjcdRqCD6a1
         ZmlemLRcTjFanAcLqVb/GL2LTA5JgEGFlJi9gJ3GECdZ6JrsMvnjFxUXY5NGiauVL9Q+
         DFyyVAQVM7zXU+rq2A+/q7ITANlGpHcR5DRckDBwLzDXWWdqB3tBEFkjrPxPmMw32blo
         uhUziuf7evnwHRWjnu5E5sQjyXdeiiP9+6cdAo89/RNXjGj9drWty1W7Ex2kZFC3g+HV
         AbKCnbyo8S9rDNd5IyQ9dAcs3ts9RN4FIN6fF5qRU6k2Xqu3/zL/ke/SfB54gUxm9ZcJ
         rWJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id j8-20020a05600c190800b003feed91ad26si1376234wmq.184.2023.09.29.17.22.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry7FP3ZZhz6K6hC;
	Sat, 30 Sep 2023 08:22:01 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:21:46 +0100
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
Subject: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu scan
Date: Sat, 30 Sep 2023 01:19:29 +0100
Message-ID: <20230930001933.2660-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: ilGOAq82r9Pm

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
