Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97840ejr;
        Thu, 13 Jun 2024 16:42:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFggLCRMTEq4EklCPjW3FUwvWXdIpH9rIFGLE4gsHygCqP0TK4sA1MvY2CrSJIkTtXozAu2YceCskHDYTjvxzxYbH3SU0s
X-Google-Smtp-Source: AGHT+IEQnwWhwZwgufQwCOMX+LsH2zkAAmKJhLcVv11Y6+j4eSDnGh5td6gk7ho537bOWtAbpbey
X-Received: by 2002:a05:600c:1c19:b0:421:805f:ab3c with SMTP id 5b1f17b1804b1-422b88b6808mr45060695e9.14.1718322147519;
        Thu, 13 Jun 2024 16:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322147; cv=none;
        d=google.com; s=arc-20160816;
        b=MvY88hizxWIp7Wm1Wh9ncOqjXordyH+o/kMo8pi2tbvy0SKyCTSlpW/L/IGQrKKZlH
         pRqqhKOyVwMR3Nm+LlPl+vGArXVfGaGvEOrK7xDi3qF8vEUw0GyeXH5A/fawmuPD+ElR
         Cq1h4iJOR/p6/qQRs4nRNtiVjxxSiVIcJMrEd0W+R2h/kPLpciuxXc4c9NnFmCClz8Rr
         CiwU/sGJvbFjpPcu44bW5eGXBr+c9kzd+1ZwKoBnByJidod99dDcHDJ4KoGxoA+gjamo
         Yv1l3P57jjCJeMBAlfOT+iVrWQvGA7Dv4k3rj6A8AJdLZmbcoxxJIrSnNwCBEta198eC
         iDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DP7QivFgquULKZDl/Et6BtzmUVgI9T2iZwpe2Wm/TFk=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=eRWNEI7BDDpyveBbGmx1xkCT8hi4kZM6S1aZMmhJ4ZpEi8NyQo4WW3ztxs51DuBTgR
         jazs1bfkRbTB5DlJ9QwpnfwyVRHc5SrYFaG00cpsolNPTZWnpTjfeBxKnl+gAbMETmgc
         Osg8YOxSy4XQ1vY5yZhHDuXGajE4iRZ9Cb4HuFdBe+dEnHa0Wmw6sV+NlwyEXV8tbKwz
         tV4ca/cUhHDJpMr2i7Jif5if7cNLF1Xa8jz5mTS2YpfEmLPPPBDCUHgUm3DSAedjgufL
         jZV0w2o5KYCuQklgy2chxwrpD7egOp+IuixmShHpz4Gx5sdecAls4ul+SJB4A3k9G81T
         REAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-422876d1d8csi28791575e9.176.2024.06.13.16.42.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f72734Tz6H7LJ;
	Fri, 14 Jun 2024 07:41:02 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 687561400D9;
	Fri, 14 Jun 2024 07:42:26 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:42:04 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 12/29] arm/virt/acpi: Build CPUs AML with CPU Hotplug support
Date: Fri, 14 Jun 2024 00:36:22 +0100
Message-ID: <20240613233639.202896-13-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: Pfrxg6iBDstc

Support for Virtual CPU Hotplug requires a sequence of ACPI handshakes between
QEMU and the guest kernel when a vCPU is plugged or unplugged. Most of the AML
code to support these handshakes already exists. This AML needs to be built
during VM initialization for the ARM architecture as well, if GED support
exists.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c3ccfef026..2d44567df5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -799,6 +799,7 @@ static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
     Aml *scope, *dsdt;
     MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
@@ -815,7 +816,18 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, vms);
+    /* if GED is enabled then cpus AML shall be added as part build_cpus_aml */
+    if (vms->acpi_dev && mc->has_hotpluggable_cpus) {
+        CPUHotplugFeatures opts = {
+             .acpi_1_compatible = false,
+             .has_legacy_cphp = false
+        };
+
+        build_cpus_aml(scope, ms, opts, NULL, memmap[VIRT_CPUHP_ACPI].base,
+                       "\\_SB", NULL, AML_SYSTEM_MEMORY);
+    } else {
+        acpi_dsdt_add_cpus(scope, vms);
+    }
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
-- 
2.34.1
