Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1415944ejc;
        Fri, 13 Oct 2023 03:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrHV7hteFNIzqwmeXAwKuY/gZMuGNUnacf0T7RZ6AncugcdqZUJ4vEMjFM/YzwEVVztsnC
X-Received: by 2002:a05:600c:895:b0:405:3be0:c78d with SMTP id l21-20020a05600c089500b004053be0c78dmr18666959wmp.3.1697194451504;
        Fri, 13 Oct 2023 03:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697194451; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGIwm/hlGPoxDMFYfhhmleoKz9vOQ/VhGilQiSiQAClyI2Gix00dI8nEt5bPZiOEe/
         cJbOT3HIOfE5sRPJ6o8MEMZXxJzRrcXQLrnuEQGV84wv6iPk9SoUsV/p9MBeX+Ujy4yO
         argX7RjMqLmHKhKDEECdTR477QGhodHUqYyZEgm/3n3wspYUhXp6o6g9S6lykTMWsmux
         isOZlcPFc2SVGYGN1OVLTFB0o9scN29KPGUYI0yAkLP72muuf5xgYko8lIu+yD0hjYgg
         eLV1wu7r51USPervKHqw7klxEz7y68xl77cFClm4jKb44er6hWOBeFI5dIXm5n5kg/5s
         eKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lAjcg+MOOlmR9Ll96/JBBewIcm8AzCCabl7CWCOpNa0=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=Vw8FpwPg17v7V8JbvFlru5lKMnqii4bSJ5mkfdwvyBEFpnR94ZepfyWFGEDq1H1n79
         n4Zzv4ElsePEi9TyVKm56/fy7wLb0Ge8qK+aWt3Y+z9ilESvfkl/Dn1OcHhP/qncGwHU
         htKIl2188aoAdff5NOUEN679P/peyz77eHiudTV+duQu8BHtMu4jAj4vmnrPylKA09iJ
         1IA7kTpkjx+nMorKn4MLoksFhGZ1r4wZNhCHiuqyE2yCXlMPKBL3k8apOhkko/J0HHmY
         1zZBya06lJU/NRe5yKIcpBRn1g6jj1xxGhrb8Sfflywki7SabchSm9HXvhLHMje5+En/
         0OsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id f9-20020adfdb49000000b0032d9b7aff29si599400wrj.541.2023.10.13.03.54.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:54:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6NcM0vgFz6K5pt;
	Fri, 13 Oct 2023 18:52:03 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.247.32) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:53:53 +0100
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
Subject: [PATCH V6 7/9] hw/acpi: Update ACPI GED framework to support vCPU Hotplug
Date: Fri, 13 Oct 2023 11:51:27 +0100
Message-ID: <20231013105129.25648-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.247.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: bLBTdEZ8xl3Z

ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
to support CPU hotplug state and events.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
---
 hw/acpi/generic_event_device.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 62d504d231..0d5f0140e5 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/cpu.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
@@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
         } else {
             acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
         }
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
     if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
                        !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
         acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
     AcpiGedState *s = ACPI_GED(adev);
 
     acpi_memory_ospm_status(&s->memhp_state, list);
+    acpi_cpu_ospm_status(&s->cpuhp_state, list);
 }
 
 static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
@@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
         sel = ACPI_GED_PWR_DOWN_EVT;
     } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
         sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
+    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
+        sel = ACPI_GED_CPU_HOTPLUG_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
-- 
2.34.1
