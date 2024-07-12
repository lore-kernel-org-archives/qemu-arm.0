Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp806218nji;
        Fri, 12 Jul 2024 06:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVr7btLV9dOAtblOvc5mJDRr7rozQyGZKzm5tPr2QzW/R0nvuYNkQFGZsqOUQ8thbmTHW/V53267ncuc8CWUX51uLyLGfFK
X-Google-Smtp-Source: AGHT+IGJpZEHQQXkMYjEW/jelvknnKutGiZNux1ii0flc8ZxL7KwON1R7Ezx7YhfgOHc36RAQfSN
X-Received: by 2002:a2e:8784:0:b0:2ec:4399:9c0f with SMTP id 38308e7fff4ca-2eeb3054a10mr79799971fa.0.1720791852268;
        Fri, 12 Jul 2024 06:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720791852; cv=none;
        d=google.com; s=arc-20160816;
        b=w8OBbiMd9qKpzxToJhsyMyhKJj5Snymk2B1vXr4MF8NibTuHb3a1RI9VxRRsLBIsMF
         e9DCjH7XQMeXWGRp7j1b1mUH1wKEP/2IgNP2LY0TocrqMOspEvYLQkZkICrGs5wOWlvu
         QQpgVHhM7StyIgyju+FgFBTIQ8WSGN7dbj28GF+pCT/QXvtb9iYINCwTIZ0kKWbqilVJ
         GJw3ykIXFQ5GNmNViNJKX7f7PZuUh03h5sZURgpLoqMSGyigTkGx077t6ob9uiV+SXnW
         gA+UPCB9RCON6ubv3Rva9tl19kjJK66GezDbbV/DIhNQEscSdEgryqjfQQhWbPANvA/0
         aqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/Ez9N+vDiZrBeI5kwgN1iDfMJScENIL8yi3KWEoJqvI=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=WhzP4FgmHc/LeB6aIxPR9FYTIMyEV74Tk0KUAF2fQAAEYfEEHt2D2iYES/cjEZ/7fC
         8v43AP/4+kEO7tIbMrm0/UI7mfo3S1cGneDakDI+l67+TzeWxjVvmGQ68vEBd+MsVuQB
         iAf+WuckmxEIYWv4D1VJCTpB6d/YbXpWZfB9szHtWT9H9rLYT08pz8W0tIqi2UYGL7js
         WT2ZXF6x88pC/Wu2LApToVXMZzh3ZxficHgFys4V8qtRTDSreTSYGxCUIt75+RmqtEEs
         X3KT5U6rrPhTC2I8MuikVJo+Ew3IjPLaWCPmj1W0KvusSrJZ01HmJpjwgsdZ47HjMh7y
         KoFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4279f2708ccsi9878655e9.85.2024.07.12.06.44.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLCTB6QY6z6H6xw;
	Fri, 12 Jul 2024 21:42:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 027D2140A86;
	Fri, 12 Jul 2024 21:44:11 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.195.244.27) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 14:43:49 +0100
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
Subject: [PATCH V14 4/7] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Fri, 12 Jul 2024 14:41:58 +0100
Message-ID: <20240712134201.214699-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712134201.214699-1-salil.mehta@huawei.com>
References: <20240712134201.214699-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.244.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: oPiplXdqdJsc

OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
results in start of the CPU scan. Scan figures out the CPU and the kind of
event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
method with the call to method \\_SB.CPUS.CSCN (via \\_SB.GED.CSCN)

Architecture specific code [1] might initialize its CPUs AML code by calling
common function build_cpus_aml() like below for ARM:

build_cpus_aml(scope, ms, opts, xx_madt_cpu_entry, memmap[VIRT_CPUHP_ACPI].base,
               "\\_SB", "\\_SB.GED.CSCN", AML_SYSTEM_MEMORY);

[1] https://lore.kernel.org/qemu-devel/20240613233639.202896-13-salil.mehta@huawei.com/

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/acpi/cpu.c                  | 2 +-
 hw/acpi/generic_event_device.c | 4 ++++
 include/hw/acpi/cpu.h          | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index ee99290800..57906efebf 100644
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
index e762fc6128..cbd2e2d26e 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -109,6 +109,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                 aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
                                              MEMORY_SLOT_SCAN_METHOD));
                 break;
+            case ACPI_GED_CPU_HOTPLUG_EVT:
+                aml_append(if_ctx, aml_call0("\\_SB."GED_DEVICE"."
+                                             ACPI_CPU_SCAN_METHOD));
+                break;
             case ACPI_GED_PWR_DOWN_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index df87b15997..451dda448a 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -20,6 +20,7 @@
 #include "hw/hotplug.h"
 
 #define ACPI_CPU_HOTPLUG_REG_LEN 12
+#define ACPI_CPU_SCAN_METHOD "CSCN"
 
 typedef struct AcpiCpuStatus {
     CPUState *cpu;
-- 
2.34.1
