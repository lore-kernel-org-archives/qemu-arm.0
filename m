Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1897199ejb;
        Mon, 9 Oct 2023 04:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI+gCkBjN3ifb+VhWdCxDGMItNUrNxkGxyHxJRutIKVlz5tuqX+Bf2nIGSG5gZEzMF7618
X-Received: by 2002:a5d:60d2:0:b0:317:6fff:c32b with SMTP id x18-20020a5d60d2000000b003176fffc32bmr12836069wrt.53.1696851026309;
        Mon, 09 Oct 2023 04:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696851026; cv=none;
        d=google.com; s=arc-20160816;
        b=MyzcrY5VJc6xTouZfiOnO45H+2oJGN4xTQqj4XgH6HvdStMTokeiPEwgxJc19VWfQ3
         9fIbQltUVgjb/WRlWrRkzR4MLC7vWiJ1cHjM/SCnyDepuNuhwerjLNx8afoeroJMtXAf
         cL0JB+bZynDrWsRE5VAjdSACoLgmKeHtcx0M4EWTyFGxp25UfeDK/XFQHShAxm20pp6W
         YwOIuTaze1PT2J95LOQxbSKmLgc1zac2q5n3wjjOC//HeP5idU5Bp3mrox3a9P0jr2F2
         Ve0B91kjdnxWWr1Wu6GHBiBL0Xt4pRdDr+k5Ap4CcDTL/fONEWBEZ1TNadOY3eUFEZTi
         /ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TSi1S9NMR/UqxPTLISWYkxZ5RoyBw3lpOeWuSRvyD9s=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=09CeL1x/qtadSuDcRTdqz11t3h3QZ7ldWuc6WulFDvEWEUQKuv0hZyAYKOsVLDVxXj
         FoaVifhCCGy08dRIiceHAL9bm9BS8bb0fAoyQ9poX7lFWvFMBFFqAlsxqPL6FcbNk53Z
         8JOTcljVQ18TuZ03wUm9UTNIL19XDtKAK/gC2j7EgehcQZBd26we9AjPVCsOL+dA94MU
         U2ElgEjBCS5huLKZ7IX74cX7nPden9qS3g7hBjnqoTpxlpZJZ1zEIXVW/dwZ5gtf1PhU
         SOlmUP7jCcgo4iztdaO7fy7fE7LT+U4leXmxCF+m8L4JCc9tQjjG4og53SmAa6+hdn/2
         IoQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id x11-20020adfec0b000000b00323357b04f6si3509089wrn.513.2023.10.09.04.30.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3xb34Cl4z67GC8;
	Mon,  9 Oct 2023 19:27:27 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.154.91) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 12:30:06 +0100
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
Subject: [PATCH V3 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Date: Mon, 9 Oct 2023 12:28:05 +0100
Message-ID: <20231009112812.10612-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009112812.10612-1-salil.mehta@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.154.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: BNRFFdFsmMCC

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
