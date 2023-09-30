Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1858ejb;
        Fri, 29 Sep 2023 17:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIBaHD61msPa7DXPIkOL5GYt9jcYqIFVbRbIvZoTXSmF2N5B8v/mKHjiTBQWtP6rHm3ve3
X-Received: by 2002:a5d:60c2:0:b0:322:db93:41ab with SMTP id x2-20020a5d60c2000000b00322db9341abmr4942233wrt.0.1696033268567;
        Fri, 29 Sep 2023 17:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033268; cv=none;
        d=google.com; s=arc-20160816;
        b=A2U4/jbn6iH4zRYoaIae5aTA297utO169i/p3ceIPzuFLH71ZvQy2VE9ep5S/1lkav
         Q7UMzwGrF6+xux/fMVMvLmSpdWrnxQ474eZEaIZj2DWynIqP6VJxJ7rz0cdXXYppuQ5k
         PR6FztmDpjyxbhf1AA9frRl58wWJ0a4RsBQv9y6kfQ6F66E5fQMCsGRBKk/PZKExI/Re
         oU2kIpXXozve/y+L5ijVloIbDyv0uLSkETAnM/oqzJoc02uTLEDokqoKnnLU7P86SlrY
         1AMTPj8ggbnHbtiZBW19ZRxnj/R9yAKCDS1CtJLYbp2BQfNaWdkHdPyQ3tDPss23Vq+/
         K+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Fm4k48sj9nuhGGN76dK8DqdnrmCvQpUaXH4bYsQOxk0=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=tsAOQ1e5W8QPpYuAOqOg1WIHGo3p00gqTtmbCh8HqEMZtRC81+g+7zgyle9rxOxj5/
         wk7QvhbjpEPiZaEVknXfm8Uvf1Vb1hk4tnXxTdZLSfwbtM+mBhX1G/X7P5eSebGs/tO2
         xkYDYisJnaSGF5ch7KtARo26gQr084Fpbx1/thMvJSk+wHO7ILOGS/gaM5iZ7lP384JZ
         pJWq7rec7uJNeTsdQr/Yu0oXBukzdScEUaRr/FVqE2DWUK1NgckGD1n+VeMvufKKbICP
         O+UxopslKpsGvmlKiMvjeSecXC3LGZKgWFxBPwJa+nFAES6l0WhNpzMGfhXIJ8G8P8Hf
         ZuUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i15-20020a5d558f000000b00317779f81efsi1541823wrv.392.2023.09.29.17.21.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:21:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry7DG5v73z6K6fd;
	Sat, 30 Sep 2023 08:21:02 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:20:47 +0100
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
Subject: [PATCH V2 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Date: Sat, 30 Sep 2023 01:19:26 +0100
Message-ID: <20230930001933.2660-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 33tHgb95ehaB

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
