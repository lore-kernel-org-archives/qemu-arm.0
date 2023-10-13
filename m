Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1415840ejc;
        Fri, 13 Oct 2023 03:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEyfI/svtrJUdLepMvPE0x+RpyepxpRgWSFa1p8FMlFDmoTipA5pDI41eWesZWsqKdvbrY
X-Received: by 2002:a05:6a00:1a48:b0:690:38b6:b2db with SMTP id h8-20020a056a001a4800b0069038b6b2dbmr29625372pfv.6.1697194437035;
        Fri, 13 Oct 2023 03:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697194437; cv=none;
        d=google.com; s=arc-20160816;
        b=AyEglAjBVoBmg322hUxrThP/Ejn6G7w60dcxiyIP3LWDdQnnSo8TvtAE5t//+gM+dM
         ICb7S1qaOhVzoCFNLNAZ4x41k9DXSL51YY+hg0Ia6a5L2feZQkthn9DqWlKvJMCD/Uwy
         Dn/d0cFnxeNJO8YuJ227Izm4zwTNkpdEs/m6h/qxmUwNuRrJxMsClcLRGOTx//6+C0ct
         r8uNVm/f5AK7fA+nVe5b0ZTJck+OfPw72BmZNsvGQ27MbDjZqKn0CcmwmFQqPsso1AF6
         DIIvFZhB0X6Bp4hf2/B1LvWzVCPQVAg2oV8R+DqicIeeo2fuc9jsMHD4AX3knVEUgZ8L
         vxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=1b9dgrG1hGlZN2xOraczrNOVt87gw6suE9XjngyOdqw=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=jcPGWK3BoEavyHKmJ9wwbc6SY21LNPIJDgVX31huaBezhkGSfYTK9e/H0RCstmOnB7
         C5wukvi3KzwOGzsR3m/6jTuod+JlYdnVJi3+IEflRJ6ttklF5yof7kBRTO7hQC4eyj6L
         q5WTZwG/gC/gna6G5JvNeQ7mIwPEU8hebF8t5Ogfl+GhG23IqRk/Z+hTwWobXMIZpvmn
         fmPSQ9Yokq/bIrZHkzIixBrlFNhs+R0h4DZ0CZ6wUVDCBYfDs9lKuALthXNM0ZcU3QbG
         WRn5raj+0KKYGl/irbMrHUi2LtnIiokrCL2SS+kzYYH8fFVsVR9qZEhcJ2cZc9PDjmsq
         DbzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id cq25-20020a056a00331900b0068fb986fcf3si16472334pfb.377.2023.10.13.03.53.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6Nf06l0Vz6K8sw;
	Fri, 13 Oct 2023 18:53:28 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.247.32) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:53:35 +0100
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
Subject: [PATCH V6 6/9] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Fri, 13 Oct 2023 11:51:26 +0100
Message-ID: <20231013105129.25648-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.247.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: Aeyxpzj8+0Z0

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
---
 hw/acpi/cpu.c                  | 2 +-
 hw/acpi/generic_event_device.c | 4 ++++
 include/hw/acpi/cpu_hotplug.h  | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 596b6d9d81..5b0eaad1c5 100644
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
