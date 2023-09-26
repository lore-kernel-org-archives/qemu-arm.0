Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp982250ejc;
        Tue, 26 Sep 2023 03:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQnDXTPww5f2FduTj+qTpUL3D9JgugeDEWtyeOCphexvJz9awuEawSTRAcNVQU5oEE4ONT
X-Received: by 2002:a7b:c84e:0:b0:3fe:2b60:b24e with SMTP id c14-20020a7bc84e000000b003fe2b60b24emr8279520wml.29.1695723008397;
        Tue, 26 Sep 2023 03:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723008; cv=none;
        d=google.com; s=arc-20160816;
        b=xe3UirUKVqE6Dy//gWOI63Iia6MnBSptABarEbwQkwksqVR/UnhMeqNXNY4jfo8acH
         zZcquJRaj33HFjzEzZwJeZf/d23Qd0ecwa9itiZBfZqiHjIgy+RUkIDgZ2q/+OsV82TL
         bPF6UYtrgJ5iKV1Rc4jJQNbxnkuMVpSr/fg71cPH4CUjR86NV1MEugz8cUFDqdiB//Lv
         ImfvZjMb9H76V/v5hsoHWztkvdgfxiS9VSoQwmjdfkk1vw+TIfoBGCLzWt/WgMYZun10
         migT1PTsFm/gW7YJdLaQ4QhyHQEIOmhzSnSClC0TSPjSZxK/CPrgIZDKNyWFOJckkJar
         74qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=CN8Sd3o8x0O2vsIldFs3OHZHbGYJwvIKIAB1Vw9p3l4=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=TE46ZZf0WsXaFksq5YPscPnaKA9Uu5aGGmu44yB4YT9KH940D2YDuTOpMroxL9Vha8
         4H/ptG4Nl0ogxICEBa2h1e3rhvTXmHNsvKpeNS1T1mTMlg3t5fcJuXqSrLM0hHIG3qij
         cZ2wgtCFcZu9fNis920SHRso7q7sqYHvHcjYrOdz22IcFREBHJ4nb1U2PoyEDTwr/0R5
         Orns9DbuYiZQigHicFGncV4fDJ/bPCo108cPguSJIuQc+raCLadMNouFju3V/ETa9mYu
         45jxjNzj1OF+rMMgaJZBWoDISRMpWj3hiQs2uOIZdq5erNZfBvhsJVAY94Pby9wuSRDH
         65Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g12-20020a05600c4ecc00b004051a2070b3si8144192wmq.9.2023.09.26.03.10.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwR73p2Wz6D98H;
	Tue, 26 Sep 2023 18:07:47 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:09:49 +0100
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
Subject: [PATCH RFC V2 15/37] arm/virt: Create GED dev before *disabled* CPU Objs are destroyed
Date: Tue, 26 Sep 2023 11:04:14 +0100
Message-ID: <20230926100436.28284-16-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: CyuklsK0Q1YU

ACPI CPU hotplug state (is_present=_STA.PRESENT, is_enabled=_STA.ENABLED) for
all the possible vCPUs MUST be initialized during machine init. This is done
during the creation of the GED device. VMM/Qemu MUST expose/fake the ACPI state
of the disabled vCPUs to the Guest kernel as 'present' (_STA.PRESENT) always
i.e. ACPI persistent. if the 'disabled' vCPU objectes are destroyed before the
GED device has been created then their ACPI hotplug state might not get
initialized correctly as acpi_persistent flag is part of the CPUState. This will
expose wrong status of the unplugged vCPUs to the Guest kernel.

Hence, moving the GED device creation before disabled vCPU objects get destroyed
as part of the post CPU init routine.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5c8a0672dc..cbb6199ec6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2376,6 +2376,12 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms, sysmem);
 
+    has_ged = has_ged && aarch64 && firmware_loaded &&
+              virt_is_acpi_enabled(vms);
+    if (has_ged) {
+        vms->acpi_dev = create_acpi_ged(vms);
+    }
+
     virt_cpu_post_init(vms, sysmem);
 
     fdt_add_pmu_nodes(vms);
@@ -2398,9 +2404,7 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms);
 
-    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
-        vms->acpi_dev = create_acpi_ged(vms);
-    } else {
+    if (!has_ged) {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
-- 
2.34.1
