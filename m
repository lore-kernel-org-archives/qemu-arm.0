Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp984495ejc;
        Tue, 26 Sep 2023 03:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGja+8THvyZL3Ufi2v2P5JzzFTx89pvEcQAeyndmbg/lC9QQ1CRmmB1Kncg/FbQk6ruNSZP
X-Received: by 2002:a05:6000:10e:b0:317:69d2:35be with SMTP id o14-20020a056000010e00b0031769d235bemr8382780wrx.30.1695723263492;
        Tue, 26 Sep 2023 03:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723263; cv=none;
        d=google.com; s=arc-20160816;
        b=SLrzTT1ldvUbm8enjVRbAmocBZEiVkGb3mjavQHur3ZQ1kr3j8CqpdCkSnI5BQJQ6J
         SThaufT7Aym5OQC8jSrD2CxCF3p9YFhWWwEmW3KEKaqPh9tSF6eQNq9bQhO0OM9XuAaH
         XZ24+wLw5XQZ5lhsyHT8Q6HL02QaRc4AmQF2xmsNaVCTdA/3FYj6vSpwOyrGSHv2jCoa
         nrkqG2MrzRRdR9XRLpPABLpjra3H9p2qiuUiBvM40jaGxbTn/82HkHukBo176zkl/UbX
         fhZJGRhKq9qNAGY7scMcPSYNtL8Rk1tcozWVFdOmBsYu7ca4+jeVlS0mccbQc50/vduJ
         yMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ssX8karBHUw+BmslLKs7x55paHeCjtLjJYLs95V1stE=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=Y+vNYWt1B3xgUh0j/gFpfdmSWwPYxkZaazmfr9OiBH4481u5olBjcdHd16HScn7CxL
         nY4wMRIMJ18kkuSmzW8LsDN2zlHrbFDoeD5KYOTUeu6p0/btgiKeQNIoD1kiNsJWrrBU
         mbUHreJr2eRYSAWaF6SALAjl3g5SB496wdfB/w/CORNHvZH2M3/GCJDjXKQfKjIejLI0
         Hr+lnNE0UyRpZseOh4WDd9+XsZy88I9WwTEJHpZiQoE2PIomCC8WG3rQdxlt6+0ZyP2Q
         58OLNGomW+7ft+TBn7v5jyx1JRoOW5ek1/ps9kyLk9MN8q/HHPiaiOepasoPc046iRTL
         ZdMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g11-20020adff3cb000000b003232f697f9esi1557537wrp.964.2023.09.26.03.14.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwX24Jgfz6D8cB;
	Tue, 26 Sep 2023 18:12:02 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:14:04 +0100
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
Subject: [PATCH RFC V2 29/37] arm/virt: Update the guest(via GED) about CPU hot-(un)plug events
Date: Tue, 26 Sep 2023 11:04:28 +0100
Message-ID: <20230926100436.28284-30-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 2AremaJ/UxFR

During any vCPU hot-(un)plug, running guest VM needs to be intimated about the
new vCPU being added or request the deletion of the vCPU which is already part
of the guest VM. This is done using the ACPI GED event which eventually gets
demultiplexed to a CPU hotplug event and further to specific hot-(un)plug event
of a particular vCPU.

This change adds the ACPI calls to the existing hot-(un)plug hooks to trigger
ACPI GED events from QEMU to guest VM.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b447e86fb6..6f5ee4a1c6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3157,6 +3157,7 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     /* insert the cold/hot-plugged vcpu in the slot */
@@ -3169,12 +3170,20 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      * plugged, guest is also notified.
      */
     if (vms->acpi_dev) {
-        /* TODO: update acpi hotplug state. Send cpu hotplug event to guest */
+        HotplugHandlerClass *hhc;
+        /* update acpi hotplug state and send cpu hotplug event to guest */
+        hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+        hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+        if (local_err) {
+            goto fail;
+        }
         /* TODO: register cpu for reset & update F/W info for the next boot */
     }
 
     cs->disabled = false;
     return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
@@ -3182,8 +3191,10 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    HotplugHandlerClass *hhc;
     ARMCPU *cpu = ARM_CPU(dev);
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
 
     if (!vms->acpi_dev || !dev->realized) {
         error_setg(errp, "GED does not exists or device is not realized!");
@@ -3202,9 +3213,16 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /* TODO: request cpu hotplug from guest */
+    /* request cpu hotplug from guest */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err) {
+        goto fail;
+    }
 
     return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -3212,7 +3230,9 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
+    HotplugHandlerClass *hhc;
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     if (!vms->acpi_dev || !dev->realized) {
@@ -3222,7 +3242,12 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
 
-    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
+    /* update the acpi cpu hotplug state for cpu hot-unplug */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err) {
+        goto fail;
+    }
 
     unwire_gic_cpu_irqs(vms, cs);
     virt_update_gic(vms, cs);
@@ -3236,6 +3261,8 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     cs->disabled = true;
 
     return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
-- 
2.34.1
