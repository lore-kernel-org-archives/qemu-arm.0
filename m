Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp695600wrq;
        Tue, 3 Jul 2018 00:25:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpejTXfKeTOfi4/cRcyCTKsJC/JuibuTrqh+cT9A+Le/0MtbiDvfy6Uhg0noYQfHgq1GsXgr
X-Received: by 2002:a0c:b4a9:: with SMTP id c41-v6mr25363496qve.57.1530602754192;
        Tue, 03 Jul 2018 00:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602754; cv=none;
        d=google.com; s=arc-20160816;
        b=05Mez3kfaVywUPj89N8WCUO90XTfUmgGFLk2oVO7W2l9Redz8PpEZNCwCOp4Ltn+Us
         tlu1I9t547Q1aTpbNX8oEuCPQsDBI0keA8t4L34xxYkoNy2ermiN3sPlQ2lclNLO0IzL
         Ehk4jhIRXFof7t+r/nfMJTCL43hsL5jQQXkZQDMIOQl4hlV+rhH+LUeHUeyzOHLBDauG
         rzxIwcOtsIe7M7W741r/v3zenAPl771nWIsW6nleYWRlhdw513aaOdvj1/Nheaw1rOIQ
         NFo8b8ZKFePx604pTHNA0gKb2SJhg0RXsH1RQCOCh+2ShqJuQObmXsS4hegKw6yKOFby
         nh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/nrKjySqliKeIafMB6LjO/arGJLO7b/kgaulCq+zWro=;
        b=pVI4k09j6IcOkXT1HxMqpN9dgYVtCWYxFYcblES6J7T7RgMfZ32tmPdTZNMgjomciR
         uFBxPquA4C/MCE9EyXD/Do9qnFMEKD64bESS40NYPC1d4HVlMTwdHobiNQErVLTYL0AA
         UoY4lNcu5ueVl1FHQFHGaFr4hCV+sNl8BICPttzEOKFWoDiMhOHwzDFbFc46kreZT4db
         D5xr6Qa8ufBxBwqJPhuOkpJJRAhpncKLPvbcAfA+pn64NsVMKpCXDYzBwuAOZm7Ycva3
         6C0R6f4PbEGXpkPk1TCfKKAw7T/H+Rs63EN6lMveqzDCRoo8pilAyuLS/TjGlJdZcO1G
         T1JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126-v6si476539qkd.150.2018.07.03.00.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFhB-0004Do-Nc
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:25:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFfv-0003mR-OQ
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFbx-00055x-QK
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:24:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37094 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFbx-00054m-2l; Tue, 03 Jul 2018 03:20:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36B654075279;
	Tue,  3 Jul 2018 07:20:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45AA71C5A3;
	Tue,  3 Jul 2018 07:20:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:47 +0200
Message-Id: <1530602398-16127-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 03 Jul 2018 07:20:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 03 Jul 2018 07:20:28 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 04/15] hw/arm/virt: support kvm_type property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DvxqkLnphvPk

The kvm-type property currently is used to pass
a user parameter to KVM_CREATE_VM. This matches
the way KVM/ARM expects to pass the max_vm_phys_shift
parameter.

This patch adds the support or the kvm-type property in
machvirt and also implements the machine class kvm_type()
callback so that it either returns the kvm-type value
provided by the user or returns the max_vm_phys_shift
exposed by KVM.

for instance, the usespace can use the following option to
instantiate a 42b IPA guest: -machine kvm-type=42

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 45 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcd..04a32de 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1649,6 +1649,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static char *virt_get_kvm_type(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return g_strdup(vms->kvm_type);
+}
+
+static void virt_set_kvm_type(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    g_free(vms->kvm_type);
+    vms->kvm_type = g_strdup(value);
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -1710,6 +1725,31 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
+static int virt_kvm_type(MachineState *ms, const char *type_str)
+{
+    int max_vm_phys_shift, ret = 0;
+    uint64_t type;
+
+    if (!type_str) {
+        max_vm_phys_shift = kvm_arm_get_max_vm_phys_shift(ms);
+        if (max_vm_phys_shift < 0) {
+            goto out;
+        }
+    } else {
+        type = g_ascii_strtoll(type_str, NULL, 0);
+        type &= 0xFF;
+        max_vm_phys_shift = (int)type;
+        if (max_vm_phys_shift < 40 || max_vm_phys_shift > 52) {
+            warn_report("valid kvm-type type values are within [40, 52]:"
+                        " option is ignored and VM is created with 40b IPA");
+            goto out;
+        }
+    }
+    ret = max_vm_phys_shift;
+out:
+    return ret;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1733,6 +1773,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->plug = virt_machine_device_plug_cb;
@@ -1826,6 +1867,9 @@ static void virt_3_0_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
 
+    object_property_add_str(obj, "kvm-type",
+                            virt_get_kvm_type, virt_set_kvm_type, NULL);
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a870cc..1a90ffc 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -124,6 +124,7 @@ typedef struct {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    char *kvm_type;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
-- 
2.5.5

