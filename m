Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp99092ejr;
        Thu, 13 Jun 2024 16:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOqbf2Va56IKWH7rYo49Slm4jUDB7xXDIej/cXzrwGV+uwKveV5H6ycBfrd+LevQhTuoDkloSNrkiuX47NfdqPdNcrYmtR
X-Google-Smtp-Source: AGHT+IGhOPKQ8A+P9WXd7mrv8qUFphca6e4l5ZNaeETYloL/aiUx5BXhsqHHSa/ufUBTTEbjT1VL
X-Received: by 2002:adf:f20b:0:b0:35f:2287:7ba6 with SMTP id ffacd0b85a97d-3607a77ad56mr831003f8f.53.1718322374145;
        Thu, 13 Jun 2024 16:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322374; cv=none;
        d=google.com; s=arc-20160816;
        b=xSeDbOdpWyp1Y8d2FF7VHXZ8mG4a/RayZtf+6CufH1Q81wxqZfthobmsCQk0PIZLmZ
         lO+ai3Tw/k9UMIj2rhSz98p95WhxaBwzU6QuRYMbKJojTFHq4uL0JFbsdP3ddfgUlPjf
         tihMB909RhV7PscY98tlCc8D921nkT3p75uRmGQuFn+qbGPjeonUTeRA5RHk+rUd3sYu
         6VTZztxSvm2OWi3hAKl4dxGbJPMGtbrimUfqQ7GkMmMn6KSNOrYW6xBas1Y/IoP5kV0E
         sq2sV4pr1Nn0iP84ziWv0yGPCu6u+u86O445wIrrTKxd5LpsB3SxZkh20lKs19yHz/06
         RHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=UqjDGrMVpwBsxpYyT/rhxM4TQiMCLFl336upNWhqBCY=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=i2iBG5EpyMeRSYYWSj7VtaiUcQA3lwdOQmRNbbEi+c0Eqa3oC3I2nZkgptUFpDKOF2
         vs6iNHzQrFCKASS/wjLQtynCpv9HeCQx+xgIQ/7IADhvjQKtthPWLrhN7IuE9x2YiyWS
         qiGWTrSodwd6GmmLcTzltRfxknveBupY2/Um0YtxGvq9TwHB3t5e2NzY4pIWMkK7eehY
         9DhqaShuB1X0qCJX68cZHdbDZ3A03y5Xxig8AX4ETCHm8NgcBFD0NzDnvB+Qrfyxu9sd
         a1spRBSHnev4MFZSmRj5CluhK+tFsQWDxnGtrWMd0lcTOdxh07xx76Kfnn733XHwuMxa
         7feQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36075138d39si1419766f8f.1067.2024.06.13.16.46.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0fCP3vpSz6H784;
	Fri, 14 Jun 2024 07:44:49 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 046F5140594;
	Fri, 14 Jun 2024 07:46:13 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:45:50 +0100
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
Subject: [PATCH RFC V3 22/29] arm/virt: Update the guest(via GED) about CPU hot-(un)plug events
Date: Fri, 14 Jun 2024 00:36:32 +0100
Message-ID: <20240613233639.202896-23-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: s8c8uaDWg/ur

During any vCPU hot-(un)plug, running guest VM needs to be intimated about the
new vCPU being added or request the deletion of the vCPU which is already part
of the guest VM. This is done using the ACPI GED event which eventually gets
demultiplexed to a CPU hotplug event and further to specific hot-(un)plug event
of a particular vCPU.

This change adds the ACPI calls to the existing hot-(un)plug hooks to trigger
ACPI GED events from QEMU to guest VM.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f7e07bd8e..4fa2b7d9e7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3169,6 +3169,7 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     /* insert the cold/hot-plugged vcpu in the slot */
@@ -3181,12 +3182,18 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      * plugged, guest is also notified.
      */
     if (vms->acpi_dev) {
-        /* TODO: update acpi hotplug state. Send cpu hotplug event to guest */
+        HotplugHandlerClass *hhc;
+        /* update acpi hotplug state and send cpu hotplug event to guest */
+        hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+        hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
         /* TODO: register cpu for reset & update F/W info for the next boot */
     }
 
     cs->disabled = false;
-    return;
 }
 
 static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
@@ -3194,8 +3201,10 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    HotplugHandlerClass *hhc;
     ARMCPU *cpu = ARM_CPU(dev);
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
 
     if (!vms->acpi_dev || !dev->realized) {
         error_setg(errp, "GED does not exists or device is not realized!");
@@ -3214,9 +3223,12 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /* TODO: request cpu hotplug from guest */
-
-    return;
+    /* request cpu hotplug from guest */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
 }
 
 static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -3224,7 +3236,9 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
+    HotplugHandlerClass *hhc;
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     if (!vms->acpi_dev || !dev->realized) {
@@ -3234,7 +3248,13 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
 
-    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
+    /* update the acpi cpu hotplug state for cpu hot-unplug */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     unwire_gic_cpu_irqs(vms, cs);
     virt_update_gic(vms, cs);
@@ -3246,8 +3266,6 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     cpu_slot->cpu = NULL;
     cs->disabled = true;
-
-    return;
 }
 
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
-- 
2.34.1
