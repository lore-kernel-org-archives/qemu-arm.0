Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp981528ejc;
        Tue, 26 Sep 2023 03:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+TvGlVEKWFH1mOr3p5F2S4V2FJ4BQCzs7eZOEIgbVN5O1pwjObnkAQ6/zUOu3UtgzamtY
X-Received: by 2002:a5d:6550:0:b0:320:c9c8:5f14 with SMTP id z16-20020a5d6550000000b00320c9c85f14mr7536025wrv.29.1695722935091;
        Tue, 26 Sep 2023 03:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722935; cv=none;
        d=google.com; s=arc-20160816;
        b=EHTmnp8ArTv6YgB5pGNwYaID4j26ti1GX4KhpLLr8jYAWvc2hzX2uU7mGO0B6G5wgf
         uP6YZYESzECiJCDjR1KUTguazNMEyjo+n1Edr2IvQS/LpEnD8eEz7HP7m04wCM+M+wIv
         8hrP6LEq3qhm0QaAgyJRDj2j99rAIA6jSXfQ/iywdouMzCdhc9Tsnbf4RxRcv1t2CNHp
         0odQ2MKmJIorYIgJdF4BtqSx3QoWc4c80bs00JjajGIIxJp8IA9uNE0zYdEhWGYcclpl
         VflVNAM0Cue4TsH6gtWUB5l0cTWhcyn7bC46L5Mwh1pbWwXbsHimaefjSjP0Sxk6zm1E
         UDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=po40+ccab/9EBgXShoc1/KsnvB52h/UNro1muw6qx+I=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=hcMIvhmDxWFd5j10rDMUPYyUuWDp4JEkicy1ZMvAEwnr+01ocbeWap/CyOufaL6hzW
         jWLW7VwWZHAtXY3EpJ5ryg163fwj3NaVqkf3yHZddWdX/a72MWeWN20VMAHkyQr94CXp
         wepOHiTJdF9aSzY4zuwfAHhLbcHP1Pc9xOCi8gI3j+DhjD7b+U5/dH0gXyyChsCamBrO
         YEotkk2evPD3HcQXSKrQZLw1DGYJYOiVLXceb4ejuOc7MzSFljtOadYRCR8JjyPl3VIm
         bRKcowsIq5uva1M+ly7JTSwf4EpZ+q752UQnCJiWpQqRPAa0CsjmaesU3Nqa1VzPfJgs
         hA/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g6-20020adff3c6000000b00320093f2a1bsi5703597wrp.194.2023.09.26.03.08.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwLg1mkpz6J7s5;
	Tue, 26 Sep 2023 18:03:55 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:08:36 +0100
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
Subject: [PATCH RFC V2 11/37] hw/acpi: Add ACPI CPU hotplug init stub
Date: Tue, 26 Sep 2023 11:04:10 +0100
Message-ID: <20230926100436.28284-12-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 6l4c5c9p5Q7e

ACPI CPU hotplug related initialization should only happend if ACPI_CPU_HOTPLUG
support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
stub to avoid compilation break.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
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
