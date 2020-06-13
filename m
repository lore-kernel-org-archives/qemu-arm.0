Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp454285lfm;
        Sat, 13 Jun 2020 14:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHv/25Tsji2w686iOKwrSCCE09EqRirNuYD+uJKt90LZ1JaJcb/3YKKjPUitBWqeF/q3GH
X-Received: by 2002:a25:5306:: with SMTP id h6mr32791119ybb.466.1592085349279;
        Sat, 13 Jun 2020 14:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592085349; cv=none;
        d=google.com; s=arc-20160816;
        b=vcWULHPTGCiU55sc9Sg77JM/NcMUbglk5OFXlikYZMmqy+6JFfeMdPGaev2Cab2XVJ
         PFm3SisCK0H19Ljg03fBvS290gbxOzT4AbkWb0dLxzQAp7ReMx2NmlkoI9rqmyHsKMeg
         ht5vuBlEt2Npied22VX9z4kRwFaZsIRYPyY2PAvlqPn5syz/tivZSncQcuh+z1iBCYHs
         iRQBafCRPT8m2FYsalq5Ox/CtauYv2WrgaD0lBtQBRcgTvNriJ/GOiuM0hL+b/ladpYs
         zx/L7bnhqotcOkpx0IMDa4qcfUF/0bK/8clxbMfmS3st4TiuDSLoiNLUAzgx2nIsc0bL
         YYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=DDsgQ3Pog920JIm5bLvsTd5mDAwYeZy/ZJEHpmaOBZw=;
        b=ptM0c9LMJ5LznFsaFT6j63LutVPGKOHWNe2Ky8YSH1P1HYA4qZ4lEWJlF1jUAQbQnf
         mAhSPshXD7V8Y6E/lGwV8u2mzx4ygA03IsHUEGVYfKWCtSEM1PRPf3WPaDQTZJtb8+wt
         70cx1myRmHefhj3/4CvVXBBZ9DiKhRVUoUulyV4Q/8Hrq+HmptzYL5zsuv4xMBTJ6jNp
         Lpz3S6TYK0T56mdgbHy/7I6IfB2lPNWUxOh4te3G8KLL04cAS91R365KliGk2P6R/++x
         dlVs/c2OYWjbnxFE5deRPLPk5XJArqMwlTo4ak8XXYX53tINh96Q1vx4hgqNd1NcS6b6
         nAJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q72si8526574ybg.133.2020.06.13.14.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jun 2020 14:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkE7w-00078F-50
	for alex.bennee@linaro.org; Sat, 13 Jun 2020 17:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyT-0007Nv-SI; Sat, 13 Jun 2020 17:46:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3779 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jkDyR-0003S2-KM; Sat, 13 Jun 2020 17:46:01 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6BC59460F2B0A7FB873E;
 Sun, 14 Jun 2020 05:45:56 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.30.60) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sun, 14 Jun 2020 05:45:46 +0800
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH RFC 16/22] arm/cpuhp: Add/update basic hot-(un)plug framework
Date: Sat, 13 Jun 2020 22:36:23 +0100
Message-ID: <20200613213629.21984-17-salil.mehta@huawei.com>
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
X-TUID: okIl1jq2nfTF

Adds the new cpu hot-unplug hooks and updates the existing hotplug hooks with
sanity checks.

Note, Functional contents of the hooks(now left with TODO comment) shall be
gradually filled in the subsequent patches in an incremental approach to patch
and logic building which would be roughly as follows:
1. (Un-)wiring of interrupts between vcpu<->gic
2. Sending events to Guest for hot-(un)plug so that guest can take appropriate
   actions.
3. Notifying GIC about hot-(un)plug action so that vcpu could be (un-)stitched
   to the GIC CPU interface.
4. Updating the Guest with Next boot info for this vcpu in the firmware.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0faf54aa8f..ac2941159a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2324,11 +2324,23 @@ out:
 static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
     ARMCPU *cpu = ARM_CPU(dev);
     CPUState *cs = CPU(dev);
     CPUArchId *cpu_slot;
 
+    if (dev->hotplugged && !vms->acpi_dev) {
+        error_setg(errp, "GED acpi device does not exists");
+        return;
+    }
+
+    if (dev->hotplugged && (vms->gic_version < VIRT_GIC_VERSION_3)) {
+        error_setg(errp, "CPU hotplug not supported with GICv%d, use GICv3 or "
+                   "later", vms->gic_version);
+        return;
+    }
+
     /* sanity check the cpu */
     if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
         error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
@@ -2361,6 +2373,10 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
     virt_cpu_set_properties(OBJECT(cs), cpu_slot);
+
+    if (dev->hotplugged) {
+        /* TODO: update GIC about this hotplug change here */
+    }
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -2375,10 +2391,75 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     cpu_slot = virt_find_cpu_slot(ms, cpu->core_id);
     cpu_slot->cpu = OBJECT(dev);
 
+    if (dev->hotplugged) {
+        /* TODO: wire the gic-cpu irqs */
+        /* TODO: update acpi hotplug state and send cpu hotplug event to guest */
+        /* TODO: register this cpu for reset & update F/W info for the next boot */
+    }
+
     cs->disabled = false;
     return;
 }
 
+static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    CPUState *cs = CPU(dev);
+
+    if (!vms->acpi_dev || !dev->realized) {
+        error_setg(errp, "GED does not exists or device is not realized!");
+        return;
+    }
+
+    if (vms->gic_version < VIRT_GIC_VERSION_3) {
+        error_setg(errp, "CPU hot-unplug not supported with GICv%d",
+                   vms->gic_version);
+        return;
+    }
+
+    if (cs->cpu_index == first_cpu->cpu_index)
+    {
+        error_setg(errp, "hot-unplug of ARM boot vcpu %d not supported",
+                   first_cpu->cpu_index);
+        return;
+    }
+
+    /* TODO: request cpu hotplug from guest */
+
+    return;
+}
+
+static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                            Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    MachineState *ms = MACHINE(hotplug_dev);
+    CPUState *cs = CPU(dev);
+    CPUArchId *cpu_slot;
+
+    if (!vms->acpi_dev || !dev->realized) {
+        error_setg(errp, "GED does not exists or device is not realized!");
+        return;
+    }
+
+    cpu_slot = virt_find_cpu_slot(ms, ARM_CPU(cs)->core_id);
+
+    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
+
+    /* TODO: unwire the gic-cpu irqs here */
+    /* TODO: update the GIC about this hot unplug change */
+
+    /* TODO: unregister this cpu for reset & update F/W info for the next boot */
+
+    qemu_opts_del(dev->opts);
+    dev->opts = NULL;
+
+    cpu_slot->cpu = NULL;
+    cs->disabled = true;
+    return;
+}
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2417,8 +2498,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
 static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
-    error_setg(errp, "device unplug request for unsupported device"
-               " type: %s", object_get_typename(OBJECT(dev)));
+    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_unplug_request(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "device unplug request for unsupported type: %s",
+                   object_get_typename(OBJECT(dev)));
+    }
+}
+
+static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_unplug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "device unplug for unsupported type: %s",
+                   object_get_typename(OBJECT(dev)));
+    }
 }
 
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
@@ -2535,11 +2631,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
+    mc->has_hotpluggable_cpus = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
+    hc->unplug = virt_machine_device_unplug_cb;
     mc->numa_mem_supported = true;
     mc->nvdimm_supported = true;
     mc->auto_enable_numa_with_memhp = true;
-- 
2.17.1


