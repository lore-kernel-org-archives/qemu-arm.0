Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2340327njb;
        Tue, 15 Oct 2024 03:08:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkmmnSDU9UUpRlYgedHVQc6l3ahmOik1rOQm1to2j0lvd1FwcnpLA8D5kEO8HTCbUDvZDwmpqfprluFw==@linaro.org
X-Google-Smtp-Source: AGHT+IH/74Je/nyTIIRGXD98Z5MAoaMp7gyGHqhm8eN+bHtvaqi1yTegfAyRTwZ0oL8Uij7cyL+P
X-Received: by 2002:a05:600c:3584:b0:430:570b:4554 with SMTP id 5b1f17b1804b1-431255ceaccmr127196965e9.3.1728986886905;
        Tue, 15 Oct 2024 03:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986886; cv=none;
        d=google.com; s=arc-20240605;
        b=cFp/0ITx2UWw0AvtjB/zSNHa13RLXVWIMSEgRTWD9nc/s2NZ0aVqBEJ2HXgGyES6nz
         C6iwZ9U0lPEamMR0OT90VA2fO03qM5NU2B5IxweqmmYhuZUP0HeEgDMzWqSaUtZdPNYx
         GXTDSfGt3piO9guQM3ddjVE5kLlgOHiWLDOmgQS9GKDVmBtqgEsoQvqQQ226QoLDMS8/
         +7dAurEU4TmdRFeMX/HQjtDSSsnlV223mpD1tiup4TtmLJN8CZEAiJrVfjRpXhc4gvJ5
         6Emr4i7gj78Ag5Jknb80vD75O6BvSubcjnPtX0EhIo0dIfRuni0iGBiikf0vDLw8VwAn
         mDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Arfdy6X8xVX/+8rEyfrsJzNZ/JtrD3Me6DPXtzWtwnA=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=aQptbi4IQfmePG17T5Wg7F+WlPyCdn7SoYqyCeGZsXicdKr/e+ecCduQXKCNFgiZIA
         Ad9IJ8YKf5XoUkSUp+cBuKjVJL1pSJY7Hny8AJ4Rt5dnrzSjwUUmwEJGXYqn5PsmAMLZ
         MJIJa6RE78K0qZ7R+UInGCLyIkylKbVkHRtfJrpAFUZ1ZIXb2N3l3A2iQz/Bpb2wMhn1
         jyiKcf09bRxt/yvAflKjD11TobV+FzMlWyes7rL4bXD1dUDwefxRiJJcfXMHXLqgpoAs
         SKjSucYnUQqd8YIlFFJw8tD8lXyOKQAQ2dK07bI/XTf+tQe2UrPr1mQs4nNm5he590bD
         GJCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fbed510si517848f8f.9.2024.10.15.03.08.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSVC62pjvz6K977;
	Tue, 15 Oct 2024 18:07:30 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 8593B1400D9;
	Tue, 15 Oct 2024 18:08:04 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:07:44 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 21/30] arm/virt: Update the guest(via GED) about vCPU hot-(un)plug events
Date: Tue, 15 Oct 2024 11:00:03 +0100
Message-ID: <20241015100012.254223-22-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: jcQxtlgLPkBx

During any vCPU hot-(un)plug operation, the running guest VM must be notified
about the addition of a new vCPU or the removal of an existing vCPU. This
notification is handled via an ACPI GED event, which is eventually demultiplexed
into a vCPU hotplug event, and then further into a specific hot-(un)plug event
for the *targeted* vCPU.

Introduce the required ACPI calls into the existing hot-(un)plug hooks, allowing
ACPI GED events to be triggered from QEMU to the guest VM.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b1eba8de8c..15d9c2d8ac 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3181,6 +3181,7 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     /* insert the cold/hot-plugged vcpu in the slot */
@@ -3213,8 +3214,18 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      * hot-plugged, the guest is also notified.
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
     }
+
+    return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
@@ -3223,7 +3234,9 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     ARMCPU *cpu = ARM_CPU(dev);
+    HotplugHandlerClass *hhc;
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
 
     if (!vms->acpi_dev) {
         error_setg(errp, "GED does not exists or device is not realized!");
@@ -3242,14 +3255,25 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /* TODO: request cpu hotplug from guest */
+    /* request cpu hotplug from guest */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err) {
+        goto fail;
+    }
+
+    return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
                             Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    HotplugHandlerClass *hhc;
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     if (!vms->acpi_dev) {
@@ -3259,7 +3283,12 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     cpu_slot = virt_find_cpu_slot(cs);
 
-    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
+    /* update the acpi cpu hotplug state for cpu hot-unplug */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err) {
+        goto fail;
+    }
 
     unwire_gic_cpu_irqs(vms, cs);
     virt_update_gic(vms, cs, false);
@@ -3274,6 +3303,10 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     dev->opts = NULL;
 
     cpu_slot->cpu = NULL;
+
+    return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
-- 
2.34.1
