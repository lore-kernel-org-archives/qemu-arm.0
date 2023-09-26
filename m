Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp983763ejc;
        Tue, 26 Sep 2023 03:12:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnyqoZhaw5xmxMgLOov8q/71guxdB+b2FDKDEorrIZme7JdrY5EeO7ghDeXPVfDCiclbei
X-Received: by 2002:a5d:5704:0:b0:31f:f9aa:a456 with SMTP id a4-20020a5d5704000000b0031ff9aaa456mr7958465wrv.2.1695723173134;
        Tue, 26 Sep 2023 03:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723173; cv=none;
        d=google.com; s=arc-20160816;
        b=nP8SxXqstAghkmGr97js25fhfSFOcCc7Z5nm3Dmenf4jhPHR32nhnCZwDoAXW5S48C
         HAJZKUFEOYbmahQchyksqE4fZrnAq3krLMmvGudLbYQJqmrSw6Vlp+sjnbuqVlXGF0Mr
         DDxlV4eDNIGzoxvOkCK+vvy6zADwla7n5uqZdULNjQ0O1zN/u4dWMfu8nlpnTQhGidZP
         h7HvKYPvBXjEBOoTlCFce1D5T9Dt3SFMLIVqp3giO5+dF05VYe7CEX6YcVmFgcXei7K9
         Rc4dNQgOrAlscAznFUw77vlv31nDcbt6CCEIY3LvqvTkasNlQEhuKLwEKb+kIFjvO1dC
         xRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=51ClRX4V/tJRuCIMWBMqMBfU0M7iR0D7oW4UNaRwGvU=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=lC+Xlp75wtxcSI3amV0g8BQyNhgilvx84NwwX46Vgqdk+eGJ/dmUY7plITmw++Nl3i
         bjjt7SHsZmPSeEDP/BMolNSwRNHYc7r5JPqEcaqBJcwe19374f2ulvMNSZaBXTu1qfyc
         XE7WuwSNyUmVUEHMUVYYnVKU1mRBc1iTBSyfVCmAwPxwGvQg9YyA+sHW3tZUTL8zNlUT
         qgRSTHIziIZFsdyPd6pFpuKu//732J8dGxj5qCuunO1ojWvX5J6zuVhY/gRyR+O+G8AK
         7bJ3j9cfSVxbGFpennubrcUaS7+/CcPleW2vSGo3oLX1Xd+eINiQcrr5OPwhY/Ihobko
         VcAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i4-20020a5d5584000000b0032179072018si5830291wrv.376.2023.09.26.03.12.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwVJ0jv5z6D9CK;
	Tue, 26 Sep 2023 18:10:32 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:12:33 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to support vCPU Hotplug
Date: Tue, 26 Sep 2023 11:04:23 +0100
Message-ID: <20230926100436.28284-25-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: sYh5w5k2R7V/

ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
to support CPU hotplug state and events.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/generic_event_device.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index ad252e6a91..0266733a54 100644
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
