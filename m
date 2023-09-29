Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3221474ejc;
        Fri, 29 Sep 2023 05:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4fvphSQ31pReWNCJhUC8iKMOKhM5NrawLtLdIex4ALS8XfOUtxZ/GWU6aB1ilSkPkOZ4A
X-Received: by 2002:a5d:4047:0:b0:31f:f2d4:a71a with SMTP id w7-20020a5d4047000000b0031ff2d4a71amr3789812wrp.8.1695991533413;
        Fri, 29 Sep 2023 05:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991533; cv=none;
        d=google.com; s=arc-20160816;
        b=uiek0IPPaNDRkWyeeWOA7wax9X0q86GIuDSPUyr8MfemsvBMkVBwA9irho5JwTGCX7
         KrHe9pB1mW5js7spfu9bGNKK9+LFH2MVR8IIlqXp/Q2bCgwk34/SfDxT+kZkt0dFiYit
         n+w1Lm1mN8OniMSzYr2DGifGjgerYTHSpQ1Qff1aRtBvV7PvgLX8m33vvU6MiVi6Hnl/
         TZHuMqD4ZPG8bLe1LMYd6O8OpbrcIW246p3NchnJqgMZQMMcry/ry12rs0qdBi/1gFY/
         VTi8ucp5Ope2RxGGJFf+2hK+ExKAROuva/63IMVNMRi/W7jKRxQlzdU+1T+x17F5gGQb
         oKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Fm4k48sj9nuhGGN76dK8DqdnrmCvQpUaXH4bYsQOxk0=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=QNgPHAN1XptFUXP5a6SiXYM5FIpe4dF34gWmwfWB1kTExO48e+HB3bsKfmheuc8elG
         hmFemE393ZqA6TKbZg20MFrkqQZmnj2V/IBUtMhC6ctqBZKUwLB9H7jL5uaDjEg+D7wh
         WEvMWhYRTmKJIyeTl/36AE514btqBg2v04+9DHj1O67o1gYu6YdGQd45La3Tu53roFhr
         6o4YNsws0O+XkS8lMVK+guLBAcg5zQqLimlKph2wFiPMqOclThfDXn0iVPEMEwFYsv/H
         35OOo5rbqIaVi0Lbp4VC85H9J2yQF7/c5O/9p0Z1hGwkPziGQ1m869MHPs8BgVrP0jZL
         HhaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m4-20020a5d6a04000000b003231dd2e6c9si6918632wru.663.2023.09.29.05.45.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rxqkv3hZjz67hmj;
	Fri, 29 Sep 2023 20:43:03 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:45:12 +0100
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
Subject: [PATCH 3/9] hw/acpi: Add ACPI CPU hotplug init stub
Date: Fri, 29 Sep 2023 13:42:58 +0100
Message-ID: <20230929124304.13672-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230929124304.13672-1-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: AwHCbt8cNy/Z

ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
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
