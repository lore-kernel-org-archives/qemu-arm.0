Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1553406ejc;
        Mon, 11 Mar 2024 19:01:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUXhaHKlnv4bS5n3t3ijRln2KjOSqzrSNpPhkoYj6NqnsdfQ54JbkXYhX/AF+eBwRH2toBrd7+Xu2CO+VwmruXps5p8Eoc
X-Google-Smtp-Source: AGHT+IF2SjxHgPhVRXmb2UzdfUYxTAXDKLq84AHYfqrabOO/z3CDd892QdpODhQZXRdyIT2YBCze
X-Received: by 2002:a05:600c:1e86:b0:413:3329:b90d with SMTP id be6-20020a05600c1e8600b004133329b90dmr381983wmb.23.1710208916663;
        Mon, 11 Mar 2024 19:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710208916; cv=none;
        d=google.com; s=arc-20160816;
        b=B2W+eZ0+A8GFLR8F659GvemMvXQmMy8YxLDEOzske8+y9izNkwStB1cDF0I94Ad9Rn
         wOZEBoKqvroJGao+qMLmHnd9UaCGSVq+nac9HJIZYUlCd8QCn8VppPBzKrSeT6715d81
         LLFbMrgxBp9QDqoQUidyGmoMN6QOsVk2AEQyhe+JUfZ4+pSNuKFHDJPmWhI6Jx2bExDN
         FGpq6rYPzXTcbWH6idFMRN8dBp0T+38y+kXhPNr+y7sMaSZyJulqdbD79CCS1u0LR5TO
         FIAt5qIUh4yjo3ysgejC/Bu7ecz9YELT+OPFoON8HdISZ/5qO68uHnPrIc+eAm+O5PJr
         saCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iZe7J8Wg8eaC5EL7M750hI4doTQlKqyL07P7S8e+cIU=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=g/fiOgKLwFi33MWrZoeL9WIU47Onf20fKcuopJX9tayZLsaWwO5X/cuCqd+Xq9TnBI
         CM0qB3REP5kk1jePNvSzDN1yxqhiFuu+lX4RLmDDxzxz0CP5L4h7ID4KncuBl0bSc+Tw
         Bcyebqa1Of1o6FWQ4lSp/LqlGVbJY7sZvuBTswxOIOzfUkY5M6OisFc0RGOvfGqFvfNy
         G+3Z4NI+85RnPfFPm3OKFYqmVIJ9LulZcAFsWm9bEOJ7Nj1TyAdqayfxP34Iba9GxqaV
         kSUSlfQQSXnTPSUz4nxnB0Rrdqp9JeDzJ++6gQhDrYC4lbm3fntC8v/39zQXZr8zkn72
         SWDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id w15-20020a05600c474f00b00412db06c486si3627462wmo.170.2024.03.11.19.01.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:01:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ttxhf3Ql7z6JBWB;
	Tue, 12 Mar 2024 10:01:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A4661400D4;
	Tue, 12 Mar 2024 10:01:55 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.148.5) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 02:01:37 +0000
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
Subject: [PATCH V8 4/8] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Tue, 12 Mar 2024 01:59:56 +0000
Message-ID: <20240312020000.12992-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20240312020000.12992-1-salil.mehta@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.148.5]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: NsbpFjWKBW6v

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
index 69aaa563db..bde5a42a0b 100644
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
index 35a71505a5..58c7882555 100644
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
