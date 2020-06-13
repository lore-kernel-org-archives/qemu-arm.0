Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp453534lfm;
        Sat, 13 Jun 2020 14:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxFNEWkyVxtfmR+AnVZKQsg7qKEhqQuF51PCkaSUbUb5O7jU0XaR9sXp3NvQQICxcCUXrj
X-Received: by 2002:a25:bf8c:: with SMTP id l12mr34428455ybk.447.1592085232782;
        Sat, 13 Jun 2020 14:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592085232; cv=none;
        d=google.com; s=arc-20160816;
        b=udbG8iXEGQKLajgETpkleSojcjPzC7z8JIclvMXqLno9L/ws03gYFwdnIMLQlscp4N
         rqgQDXp6Ti5NH2gMwwprAadw0WspMu2l22ztlMlxbUPhgy0oy8FhRWwt/G/56mSk22a8
         XIP9aWQcg2xK9cRuAVCnXcXcfgourQugeOuNO82V9ZasoNUFqJtiP/JLgfIPK/iYX2Kb
         i6qw6+Mfdwc79W8zvEtns6RRaDfA5442agGuKlq2zfq11Q+nT/dGz9YPKXiwFKR19NE9
         aJMafd3/oG+QXtdMvDO1zkCOK5LsgRJEeevnSB+TKmGx8YzMkc2Lxtr11UjwFeaDuNp8
         yTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=z4lgztjpd1SkPgIwvHxJKxGQBUh5hAt7spQX00OeWD4=;
        b=KrM/F4GnHJVTRtOd9NNd/uucA9Do5bdfUgOsJdltBUGyMWYmaSNQhMZeN3xZY61/+6
         rjlIzQHXeeUFu+ZBRomPIBlDgd1HoCZYv+aoHpXhZiifju/XBaE0VxNhNxyO0hQeQAva
         ekWUu/9hgG0f5J1L4YQ28eRWgralIp0l801mOjaUpISP2f6d1greD/JUJRce0funRoQ8
         KX7UbiYV9T20Fp1k7KLzzCuoVO1RGskH+G4yBr5QloaAsRfWAs19yF6M1OMrw//Yyf2Y
         GRVvPxRBfywo/tntx6dO2MqgynER5+l6ElPobOP5+4jvQo+0ynWGrMbWFEHyhOzBPSxc
         ESdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v88si9111013ybi.197.2020.06.13.14.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkE64-0003oW-5i
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyn-00085c-6h; Sat, 13 Jun 2020 17:46:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3780 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyl-0003Uq-7x; Sat, 13 Jun 2020 17:46:20 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AC81130E46CC7F90ACB7;
 Sun, 14 Jun 2020 05:46:16 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:46:10 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 20/22] arm/cpuhp: Update the guest(via GED) about cpu
 hot-(un)plug events
Date: Sat, 13 Jun 2020 22:36:27 +0100
Message-ID: <20200613213629.21984-21-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20200613213629.21984-1-salil.mehta@huawei.com>
References: <20200613213629.21984-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.30.60]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 17:44:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, sudeep.holla@arm.com,
 gshan@redhat.com, mst@redhat.com, jiakernel2@gmail.com, maz@kernel.org,
 zhukeqian1@huawei.com, david@redhat.com, richard.henderson@linaro.org,
 linuxarm@huawei.com, eric.auger@redhat.com, james.morse@arm.com,
 catalin.marinas@arm.com, imammedo@redhat.com,
 Salil Mehta <salil.mehta@huawei.com>, pbonzini@redhat.com,
 mehta.salil.lnk@gmail.com, maran.wilson@oracle.com, will@kernel.org,
 wangxiongfeng2@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ptjtNqKNtxot

During any vcpu hot-(un)plug, running guest VM needs to be intimated about the
new vcpu being added or request the deletion of the vcpu which is already part
of the guest VM. This is done using the ACPI GED event which eventually gets
demultiplexed to a CPU hotplug event and further to specific hot-(un)plug event
of a particular vcpu.

This change adds the ACPI calls to the existing hot-(un)plug hooks to trigger
ACPI GED events from QEMU to guest VM.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b4cfd53a59..db7eca1b84 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2451,6 +2451,7 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     MachineState *ms = MACHINE(hotplug_dev);
     ARMCPU *cpu = ARM_CPU(dev);
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     /* insert the cold/hot-plugged vcpu in the slot */
@@ -2458,20 +2459,31 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     cpu_slot->cpu = OBJECT(dev);
 
     if (dev->hotplugged) {
+        HotplugHandlerClass *hhc;
+
         wire_gic_cpu_irqs(vms, cs);
-        /* TODO: update acpi hotplug state and send cpu hotplug event to guest */
+
+        /* update acpi hotplug state and send cpu hotplug event to guest */
+        hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+        hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+        if (local_err)
+            goto fail;
         /* TODO: register this cpu for reset & update F/W info for the next boot */
     }
 
     cs->disabled = false;
     return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
                                     DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    HotplugHandlerClass *hhc;
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
 
     if (!vms->acpi_dev || !dev->realized) {
         error_setg(errp, "GED does not exists or device is not realized!");
@@ -2491,9 +2503,15 @@ static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /* TODO: request cpu hotplug from guest */
+    /* request cpu hotplug from guest */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err)
+        goto fail;
 
     return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -2501,7 +2519,9 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
+    HotplugHandlerClass *hhc;
     CPUState *cs = CPU(dev);
+    Error *local_err = NULL;
     CPUArchId *cpu_slot;
 
     if (!vms->acpi_dev || !dev->realized) {
@@ -2511,7 +2531,11 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     cpu_slot = virt_find_cpu_slot(ms, ARM_CPU(cs)->core_id);
 
-    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
+    /* update the acpi cpu hotplug state for cpu hot-unplug */
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
+    if (local_err)
+        goto fail;
 
     unwire_gic_cpu_irqs(vms, cs);
     virt_update_gic(vms, cs);
@@ -2524,6 +2548,8 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     cpu_slot->cpu = NULL;
     cs->disabled = true;
     return;
+fail:
+    error_propagate(errp, local_err);
 }
 
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
-- 
2.17.1


