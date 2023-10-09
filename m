Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1897915ejb;
        Mon, 9 Oct 2023 04:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpzAKYrpC3h82J749Q0Msk5Jt+VCpPx9dp/qWYk5NHa8eFKoiOxYkx7YkY1mEllP5PBHgW
X-Received: by 2002:a7b:cc99:0:b0:405:39b4:313e with SMTP id p25-20020a7bcc99000000b0040539b4313emr12982841wma.13.1696851100690;
        Mon, 09 Oct 2023 04:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696851100; cv=none;
        d=google.com; s=arc-20160816;
        b=Hsq7qLnMThcv065FzKSEPbENz54PXbCTa6xFeO1HDEgMcjkRpqWTHRGFgg21c2rSJu
         Mcueo6MLYnswZbDyM3fpZTUe+f8dxbvcTtOVYioxaEnCIQLwEPnUSlgun4mTssHOiJ1w
         aPn1vnc90n5XKgcn5w+XYqt6uisnAUWfxCYHH4JKO7ZEEEojyJ1mQS3BFU1KyhrYFF13
         a7Mlt1UThTVhKDlCUETwfr23JXcuVHbYC/lKJVCNhfjAn8+NFht4/UBTsUK9/IOOxmlr
         ww7tvq9lA6jZAku7qmliyk532Nl510CGGVfZn5H5mPKIU81GtKOS+4CXLYUATDPBp6i2
         PFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=FJAzIAi1snr8S8gBXUZqOaJejkvqOaRU8JI/YzMrAR0=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=wW1HWZekpCy/ct5NXjtjNPSi+ndHxHFKnoWVkGZip3o9WmoyJTD8nBk4BY0+ZrHuhb
         sBXmZoG41o+1rsvdyaPJ+oztZnysKfEVUl9OsFrSvOPqRtD3kjXh5YjEdodgBDuECiXN
         wy2GssEf+ghxkhz2r5+RD+cRvNgo995qR3UzI47mzX4aNRegnw/1GPpSZEr0pTO7LcdR
         FyAyRFpZkM5i/TSAG70V8cOSKjeKUQU5J7EFuyQmskN4NQ3sO8yB2RrfGhm1Cg8bxFFU
         f04eJyeQrqiF5JQzwJ4X8JSgleJy08ZkEjASodwxHkOELz3LP6gV7JRNmGNKEhy4Ujc9
         94gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id bg33-20020a05600c3ca100b004063c6c812asi5039364wmb.91.2023.10.09.04.31.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3xdj0pgjz6K69W;
	Mon,  9 Oct 2023 19:29:45 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.154.91) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 12:31:21 +0100
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
Subject: [PATCH V3 07/10] hw/acpi: Update ACPI GED framework to support vCPU Hotplug
Date: Mon, 9 Oct 2023 12:28:09 +0100
Message-ID: <20231009112812.10612-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009112812.10612-1-salil.mehta@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.154.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: NHrqwC6l6hjX

ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
to support CPU hotplug state and events.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
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
