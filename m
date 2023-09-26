Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp983090ejc;
        Tue, 26 Sep 2023 03:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsNa1uCZ3dWgpUPwhGq3WEgISfj3etZ6PNclApB1YS2i3Tp8dp+Sl/cV7ZANalBnV7ubi9
X-Received: by 2002:a05:6000:cf:b0:321:6953:6ae4 with SMTP id q15-20020a05600000cf00b0032169536ae4mr7621073wrx.37.1695723099990;
        Tue, 26 Sep 2023 03:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723099; cv=none;
        d=google.com; s=arc-20160816;
        b=kC0pnKtYaDsX5KNUS+c/pX61J4DoXwOkQk9aCWghoHVXFwTWufj/N9+/vTvlAugnOp
         mxxoLcaADv3GbgJMXwssgmO9gf7Cu8o/rV3kxb8GipkE+3S8Yr0ZpAkwNV+HOZ5+2pKK
         UiE8XS80GhUtAGUSWaSGxk+ti5xHAdRiErKxanI8z8u3Yeg3vCdz3BPSh7z+KvvONcd2
         32/vqKCYZDHPCxq2Zl7I6D1AGei4451M0hwMyRc+6qmmIb3faJnHIKpO4UpPVi+635bN
         J2NmwqMq96+1Su9xPrgnLjhHQDOUlsragHjwjBwcSUgayRj6tnI57Ic7OVjtbCcV5bqr
         ZNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=dHFRNdMnFEf275js/e6h+A+J13mV2AZMrZNX7L9dcho=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=ezjiyi0cJL91xv1O5ZunElqA73R2wO+0uvtr5P28Vx1M7W7MsSw5VSXhz5PrRZrfOg
         +PrY7H7Ob4Fu+6EVIWwaNfrFNPvyjpxjnYPAGdD+ChjmFwfLKX3Sla9aNQhfjxHY6NRz
         RsWg0CSevH3JVXJBc7whbmXm1hZogxMbNIOdM1aJw1Y9JZzAOX6mTzbFOvVKzkAdtT3/
         U7F06joy9rOzrudc5XZd8hX8jq5ZMOp4U/NODwmE5djauij5PyMqPrU/QROm5y+iAEMn
         vbSXkvDamls6hXYgpxHTzROt7du5HyJLrQRErIPv9bEftdbpvDqZNh0pbCPVS5aknmGQ
         dRcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i14-20020adffc0e000000b00323357b04f4si757417wrr.323.2023.09.26.03.11.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwSv09hrz6D96j;
	Tue, 26 Sep 2023 18:09:19 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:11:20 +0100
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
Subject: [PATCH RFC V2 20/37] hw/acpi: Update GED _EVT method AML with cpu scan
Date: Tue, 26 Sep 2023 11:04:19 +0100
Message-ID: <20230926100436.28284-21-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: nC8Tp4bqYSdu

OSPM evaluates _EVT method to map the event. The cpu hotplug event eventually
results in start of the cpu scan. Scan figures out the cpu and the kind of
event(plug/unplug) and notifies it back to the guest.

The change in this patch updates the GED AML _EVT method with the call to
\\_SB.CPUS.CSCN which will do above.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/generic_event_device.c | 4 ++++
 include/hw/acpi/cpu_hotplug.h  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index b84602b238..ad252e6a91 100644
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
