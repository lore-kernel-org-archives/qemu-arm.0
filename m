Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1415467ejc;
        Fri, 13 Oct 2023 03:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqRw5Anz314Ku4jV1n5gpF2iJtx5mYGXzwUJ3lwPwbCk1ns30geuXdUGid1xcL+SVp3VMV
X-Received: by 2002:a17:902:d4cd:b0:1c4:3294:74ca with SMTP id o13-20020a170902d4cd00b001c4329474camr26875500plg.17.1697194386754;
        Fri, 13 Oct 2023 03:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697194386; cv=none;
        d=google.com; s=arc-20160816;
        b=g7ECOvVSg5I5guvI1Shc4otPc47X0EZPOndz/GDvYQ0dS9l+UC+b4WeidnwSDaWGwB
         ghDWTklS+3Y5t77r+hrqBfI+/kK3j8suxEmnlTROOipmOFKkk+S58sL0lQ1RmFX4/FJ8
         5g+zS5pldIcGB4Pg72frBwimmvhPhIu+XjJfUNK3nsSgwcuUsMtj64JUa70LRMFJzmqf
         Id33jFZn8pUE/jFi/hQAWhJdfP27JlrvHgKPagWLF+eiG55EzZ5kCsP5KgtOdNaG3ZT2
         xUWZwfDQyO3Ld7s6hAVcThz8n0w+dk/mj+HzzV/SeEriBwf8ccemGDo1tRIKwsSY6bqd
         UDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=2w33hEvehnRjYFMZif2nebZt/6mjxUX7VUBTtc/BjO0=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=cQwEHEIbMoClcp/MqiS+K+Ym2TYbQaRT7K1NugrmAQCpNDUgKgDB9tm1sZ473V9PXC
         8N/ZGtmfWDb6S034/ZPAP3H+84efO9ToOGSRAAoJezBJJ1kWMQPyJbRNez0wwbccc/6B
         7hmsfjJktGci1dB1eNmK6ewmlZQKoXysDBfcWZk9+g8es/jgMtLkAkNlOUu/GYPDU3sB
         v7SqAPFtL0enASk6DHS/rmG8b3OjTa0BSXWStDiw+mKhcQZ/DdduPqebobSXGb0czHN+
         mj3xHFXylF3zG2VWKaX6ZLVYzhK6L+K2HS+oGdvZZ9+pxweJ0og0sQkxMbVLoM+LQdkg
         02Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o9-20020a170902d4c900b001c7388413besi2023893plg.529.2023.10.13.03.53.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6NYr6xztz6J9fm;
	Fri, 13 Oct 2023 18:49:52 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.247.32) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:52:44 +0100
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
Subject: [PATCH V6 3/9] hw/acpi: Add ACPI CPU hotplug init stub
Date: Fri, 13 Oct 2023 11:51:23 +0100
Message-ID: <20231013105129.25648-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231013105129.25648-1-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.247.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: TXbM/Dn1bzwj

ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
stub to avoid compilation break.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
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
