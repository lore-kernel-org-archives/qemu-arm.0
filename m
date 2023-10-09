Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp48831ejb;
        Mon, 9 Oct 2023 13:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZXwXcQXp9XAkUp6Ndp5swuTwHoon8K1hPvEdZr1dC/7CEC6z1fYabc4UVRa1LFv7A9RIQ
X-Received: by 2002:a05:600c:2248:b0:405:36d7:4582 with SMTP id a8-20020a05600c224800b0040536d74582mr14468391wmm.15.1696883939871;
        Mon, 09 Oct 2023 13:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696883939; cv=none;
        d=google.com; s=arc-20160816;
        b=0T7YLWVacLr9R5Cxk7GOwsIDEt5uiDtNr5+KnMF4peZGJpANTfNxaAbqG9p5irah3g
         +OMyiwmZ/1lnJISLoqIPW6Jag3wNQeFh/GwsgiQJ/7GdEc1gD1HugB8OxYfoCyvU+88h
         mlcTFKUaw56MAv0++ZmGRUcDmD4UpWK3yAVYRPtDDoVqzghJ+RJTNJrdnJ2Cisl4zj/x
         hNxaUgrRtHy8a3ixmCqQ5U/I5FxCAWxpm7ta99U6Ne22jm9ZZEuRf7yQDIVDPEr1S4S2
         LBj2L82mPey+6cbBda6O4FBGeoPGwGqEVc3ELo9c5XHeCUST6t1fY4iF/fgExLmSH4bS
         /vLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=6gbGa0+iHjrxHft8YnJHN7WR4M9aVSL8mZy68kRgJXk=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=d8GXmX3Jv8zlxc5+/5/ZyfmiTK9yLUEV54EtXZjmx+cgGuFCNbDDofJsybNVafHGIq
         HoUYqKcLnxe5Y5EVN8SXvv5VKHQ2HmTASas+IJOblPMnL7fQJOxsJBcEqAlJszM6EL3P
         VtVjsoCfxDiePnleT0Lr1KRmEaSwoZYpzSKGDxqrgD5woJwDfNpn/t+cCqNpDLY+fjEn
         tnTREhDMK2yO0pg7i0FT0NrtskcgE33cWSY7zKZJu6nluCwr3BBXysOwHy/hFwgBaY+b
         szKnD7E4zVAtjeesWADtiUG3yTDzlx4lMpgjM5Nt3vv9jML/z/CP6t0cmSDmuUHFyXyS
         atxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id n8-20020a05600c4f8800b003fe26770ebasi6773217wmq.162.2023.10.09.13.38.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S49nB5jysz6K64S;
	Tue, 10 Oct 2023 04:37:02 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.175.116) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:38:37 +0100
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
Subject: [PATCH V4 06/10] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Mon, 9 Oct 2023 21:35:57 +0100
Message-ID: <20231009203601.17584-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009203601.17584-1-salil.mehta@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.175.116]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: MBLG3F8g92lz

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
