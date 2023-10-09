Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp48338ejb;
        Mon, 9 Oct 2023 13:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaS9ZZoDHXJiWehtpJnD3uUe5t/VmJrPeSTmKPt1eTpQ3o0VRIwiLIOeeSjjoxkRV1hFkx
X-Received: by 2002:a5d:500b:0:b0:323:15d7:900e with SMTP id e11-20020a5d500b000000b0032315d7900emr13278534wrt.53.1696883875012;
        Mon, 09 Oct 2023 13:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696883874; cv=none;
        d=google.com; s=arc-20160816;
        b=ewIvkYwwI8zDt8J6YPaNIwVs3rNRuSbqlbmsat7tJ+c1wAjr7EwAmlNIithXf+fgK4
         kksHuHFKvf8G11rTFcs4c9YqHCcG8bSpWDGZe9EQSlVTRCQCUMpLQSugnZ3fdj7Ejvdw
         j1HAFzZunLbLpOdFwRBZEBs72s22Qj2bRfyjA2sLHD9ka7GyXdv4+VqAOoqDk5WgWFBm
         P20EI2ECQ97SvIM8kfd3+jN+c+DqplX1SP3Ke6XjeEmPnvK0PpOxja7Y6ZRS6tuCsvLt
         1ULxnz7Bm4rwUDrhYqX3rTdp4MsX29uUd/ZpI2jhwDkTF7yyoRbDY+ecPXf4pyyGDWgm
         khbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TSi1S9NMR/UqxPTLISWYkxZ5RoyBw3lpOeWuSRvyD9s=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=0cjAZ9gabZQhrqjik+OKjDpaNCwmk6waHOp1bO8OWK5KgnHdLRvYm0vhJpG7wSQx8L
         tXgMYEJkAOGEFg8t6XT3hYxkB3vOHF1UpwVCqSz/12ooRQo9h7UyDCFgk1saZ+dVy24d
         30hG/mjDu3Cco1C6izzpl8oQbFEKguj4mX/tTMi1WMBwtR2wY4pV1g5ec//N+sMP0lrD
         RapjofxWoFi0FQaFUZGPUIMF8lBkxvcPZfe63qai+0H6CxKkdJ9mt08HNxZhdjKTKmGx
         hUcLEUl97LIYzUzDUK1Xv8OrXDDronPZpKHywmwsXPIfd67fMlm2AJi/jLXVg4HsaOub
         ElXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id r1-20020adff701000000b0031ff84ea652si3921528wrp.753.2023.10.09.13.37.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S49kl213vz67lS1;
	Tue, 10 Oct 2023 04:34:55 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.175.116) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:37:32 +0100
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
Subject: [PATCH V4 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Date: Mon, 9 Oct 2023 21:35:54 +0100
Message-ID: <20231009203601.17584-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009203601.17584-1-salil.mehta@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.175.116]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 0jhdi2ZlEwl/

ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
stub to avoid compilation break.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
index 3fc4b14c26..c6c61bb9cd 100644
--- a/hw/acpi/acpi-cpu-hotplug-stub.c
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
     return;
 }
 
+void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
+                         CPUHotplugState *state, hwaddr base_addr)
+{
+    return;
+}
+
 void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
 {
     return;
-- 
2.34.1
