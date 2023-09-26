Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp982619ejc;
        Tue, 26 Sep 2023 03:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyFKOnfPgshe3WPlqrUDuBDGAtrVqaYGQ+aBbqFAlFKRh5yfp1BW/HF6PLqJ7q10n1KoXP
X-Received: by 2002:adf:b199:0:b0:323:2563:be13 with SMTP id q25-20020adfb199000000b003232563be13mr4988584wra.52.1695723044888;
        Tue, 26 Sep 2023 03:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723044; cv=none;
        d=google.com; s=arc-20160816;
        b=TGUCxoIDiC2eNJOuTeBuQmctRkYqseQ9tUimHumWDNAy83vGWiSVz8j9M+HljGW9SH
         pJ9A8iZJs0rJub45WcNPrxjcl/Lk/8pEJ09n0dYl1kEvnSQPHDbmYblWep7S1eaVVO5V
         EVXDCrNJ4AljtIhMUMB+aBjAVJHh7Be83Xa1WfnZz2nUCjGih8NMinsBEFq7hD2yw0uz
         zN4gR9oVUo8ifCCExithSj2dPOmLwtheMG5zni026Fr3Rus445OHhZk9FUo+dDChS8fZ
         KTO/P9hgvSS3TUE6vznrCAiscTwhs3cICOvh4sUWGptiVcOkBTbYUUadQ5EwwTsl3nKy
         KV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TEDa6w0oTXnxR4Jgn+YuQU2Q000UY1CpaaXc4vK2gO4=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=wQMQuNyCD2tNrodsx9bhiMZLp5hOqS/VeMOZjHBbLrXhWItsxftmDrzFlgpgQ16FVv
         JGresTJ5FtiaofHZrQ4c5ri3/Pz5StJrsaMTpYtc3KDri4srcnI28cyxe3wTIPKqPKeo
         CuKxBpxiLhfkAy2dsL1+zzk9CGle5dAXHCTgMfKnHjyVd04CZ+PckJgWgYio0ZG1LaNI
         EQotr0CmmC3ebeFMqPYlskxtUuHE+f2qvquXhJ6Q9SZKQsZmbiasWi6xN8hJNL3wdBON
         oJtQVpcwE3HxHKr5nwZURSs+EBB/0Imdapo+NtcloPOedfRzV/EXU2u00X9/4rVtP39I
         xiWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k3-20020adfe3c3000000b003215f081d20si6129316wrm.185.2023.09.26.03.10.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwRq5WLVz6D8y2;
	Tue, 26 Sep 2023 18:08:23 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:10:25 +0100
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
Subject: [PATCH RFC V2 17/37] arm/virt/acpi: Build CPUs AML with CPU Hotplug support
Date: Tue, 26 Sep 2023 11:04:16 +0100
Message-ID: <20230926100436.28284-18-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: fGuLI1fdM9bX

Support of vCPU Hotplug requires sequence of ACPI handshakes between Qemu and
Guest kernel when a vCPU is plugged or unplugged. Most of the AML code to
support these handshakes already exists. This AML need to be build during VM
init for ARM architecture as well if the GED support exists.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6b674231c2..d27df5030e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -858,7 +858,18 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, vms);
+    /* if GED is enabled then cpus AML shall be added as part build_cpus_aml */
+    if (vms->acpi_dev) {
+        CPUHotplugFeatures opts = {
+             .acpi_1_compatible = false,
+             .has_legacy_cphp = false
+        };
+
+        build_cpus_aml(scope, ms, opts, memmap[VIRT_CPUHP_ACPI].base,
+                       "\\_SB", NULL, AML_SYSTEM_MEMORY);
+    } else {
+        acpi_dsdt_add_cpus(scope, vms);
+    }
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
-- 
2.34.1
