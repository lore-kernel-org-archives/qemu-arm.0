Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp596852njl;
        Tue, 8 Oct 2024 20:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXngzCpqrWgpT5hdL6g3oUCUjRvdNdav+jq2EwmZevfUj+VqJWfLlBa3vEV1TDM/8yj8nJyJ6hyQjyJfw==@linaro.org
X-Google-Smtp-Source: AGHT+IElRc73z8bwzHR388YfXlv6ClP4vywB8fElERVQybrT9t8vDlVA02yvxe9THfLnVxWUyWJ+
X-Received: by 2002:a05:6000:102:b0:37d:326d:305a with SMTP id ffacd0b85a97d-37d3a9b522cmr584446f8f.2.1728444448414;
        Tue, 08 Oct 2024 20:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444448; cv=none;
        d=google.com; s=arc-20240605;
        b=UGiepJjCkMazWxh5OQDA/ypYDNcyjM9wMYEUwwZjFUWZhrl9Wtzqoypl6NdCRzSq9O
         eJDXucjaMFXXMQ9zBEdeLXNstSdvlX4IHOlaCTHfaPketnNdlPA+otao9GDdri+Ml9wN
         FFtrNrJpg8gKPUpLzVADDplsi5Ob43LDoeX2m0YPdCrAoAeL8mff46Rv1R1Ksumxuhfb
         xWvmJb3i7sbwYDCzsV28upaEPlqh6z1R2PP1cYY+gu3eBK7gjTn9jfCcVAxOETYhTA3b
         gJkpekeVoAEfHoWrYyTS1p6wD2BwBFYlcSE0/ZOezvWwmsWSrgL3qDbOGfm8Ei1lHPOe
         qsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=arhogGnJ6dNB0KkQoAHHR/oqGsMimf1KO6moCN5zM64=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=gqtKPm/YpB5B/NlLa7KnHXBiMlLePfQgCfcwwTznkt4GZTgRyshryekXTgaD+8GJHh
         eaWo4ScOLwPv36gE0/F9wK0jJpukxr931XeGkmHqkjui4ZTQAhFJNoEuf1u+eyWPoSld
         LBStJ/eZC0z51yG+Q4RBEbahejdf+ZI9BzyPKoJtAN7Wqc3eatj/sub76CPzzjfEfoku
         PD+wLNnffLe+VJbiXpzqj48yF13m1PKDsnQdpB++dX00ZsMiy1OQ3xU8/5XIWWa+aWz5
         xvSgpJ2vDuiIssO9uguoDyPjxyo1/OZvMDBhoy+Ujmba85E5LShs/1cCERioS7ftk1T0
         dKZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d16913360si3890071f8f.57.2024.10.08.20.27.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdWJ5BvHz6LDCR;
	Wed,  9 Oct 2024 11:23:08 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F6A2140114;
	Wed,  9 Oct 2024 11:27:27 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:27:08 +0200
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 24/33] arm/virt: Update the guest(via GED) about vCPU hot-(un)plug events
Date: Wed, 9 Oct 2024 04:18:06 +0100
Message-ID: <20241009031815.250096-25-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: c5K8V4GwIppq

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
index 8cb66c11a1..5d440f9121 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3183,6 +3183,7 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     /* insert the cold/hot-plugged vcpu in the slot */
@@ -3220,8 +3221,18 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
@@ -3230,7 +3241,9 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     ARMCPU *cpu = ARM_CPU(dev);
+    HotplugHandlerClass *hhc;
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
 
     if (!vms->acpi_dev) {
         error_setg(errp, "GED does not exists or device is not realized!");
@@ -3249,14 +3262,25 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
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
@@ -3266,7 +3290,12 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
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
@@ -3282,6 +3311,10 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     cpu_slot->cpu = NULL;
     cs->disabled = true;
+
+    return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
-- 
2.34.1
