Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp100252njk;
        Tue, 16 Jul 2024 04:16:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUD/yiNM6YYbdx9NQzafFE7H1jANefxuTL0zmLE7EnlKvllylcdMegN5Fr0IOZ5sBuQjohV7EEoFWmS8IA05LWDsYdQL3BY
X-Google-Smtp-Source: AGHT+IG8eKcDqRShn3S/NXAZi/w9maX0y/oRoL+5n1Sp3jF/J6sK57Bm7ZWIJNvaXfAvjBik9nY2
X-Received: by 2002:a17:902:da89:b0:1fa:ab25:f625 with SMTP id d9443c01a7336-1fc3d981399mr15208445ad.38.1721128615376;
        Tue, 16 Jul 2024 04:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721128615; cv=none;
        d=google.com; s=arc-20160816;
        b=MiFkHvpoXKVjMfaEP8jERkks+c3ddQ6HvsLR9H5LrGgl4XBJqTQaYegoHuCNWc50tW
         kx5y8Jkcw96Y+3kb1qGzi7jUvBmWjyq8c1jqjqjYutiTsKMKJLJD/m6QuKsXSB/Wlq53
         GeRVquTtEiNnxAt6eAsHQnk/+5y6CX9pRiShzhY4mkiSUtqek7r3a1ksYKYYnPBZgy4v
         BjvReL6fbksK+aanW9IRE1DteRSEhy/PWy4VahhCJH9CckEsvLuBy9xg4Gk5QdZbMWbL
         r2oOujjW/QegFdBrjT/pS1kG2O1UuGAsHmkuWCSscWBylN9nIWVGjgrRiAcKnTo6pwoP
         8NpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=914+jDm+ol8oiejJm/fh00RZCzRB388srXRVEdvCm8Q=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=VD5HH3qW4nHXs6BeNYenAlA9I3dhlNRY2Z2gVNvvBGo9VcR0u8KtjNEJ8QHOOSPPPR
         8ovceHTvendVXR7DSu2odqjf0UZUfOmX/TjI/8fYqsBEoSy1nFIz37PELesCtAapvIB7
         Rd7ydFh0M13qZXNor7EWDt8/lXyWJ9NocXnOVqBipShBk3bqvZ10R+uP1R263iWCgSsE
         2cKDiCdKZw8Hrny2u9VRFAxmp6n/JjBeqCOjhJWXzfSgCupG1Qrhea6plaKRwVNRsGAv
         dcpJ6daWCOqhzdlDsoXCzUkNIxNapMl7fOgl7+WXl8cXDl38c9RfLVFfs7SkaJu2Tk/0
         bWfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fc0bcb8a76si68643485ad.425.2024.07.16.04.16.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2024 04:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WNc0Y6Rl4z6K9BQ;
	Tue, 16 Jul 2024 19:14:37 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 96E0F140C72;
	Tue, 16 Jul 2024 19:16:50 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.92) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 12:16:29 +0100
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
Subject: [PATCH V16 4/7] hw/acpi: Update GED _EVT method AML with CPU scan
Date: Tue, 16 Jul 2024 12:14:59 +0100
Message-ID: <20240716111502.202344-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716111502.202344-1-salil.mehta@huawei.com>
References: <20240716111502.202344-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.170.92]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: dckQniq1lmBf

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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c         | 3 +++
 include/hw/acpi/generic_event_device.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 4641933a0f..15b4c3ebbf 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -108,6 +108,9 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                 aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
                                              MEMORY_SLOT_SCAN_METHOD));
                 break;
+            case ACPI_GED_CPU_HOTPLUG_EVT:
+                aml_append(if_ctx, aml_call0(AML_GED_EVT_CPU_SCAN_METHOD));
+                break;
             case ACPI_GED_PWR_DOWN_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index e091ac2108..40af3550b5 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -87,6 +87,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 #define GED_DEVICE      "GED"
 #define AML_GED_EVT_REG "EREG"
 #define AML_GED_EVT_SEL "ESEL"
+#define AML_GED_EVT_CPU_SCAN_METHOD "\\_SB.GED.CSCN"
 
 /*
  * Platforms need to specify the GED event bitmap
-- 
2.34.1
