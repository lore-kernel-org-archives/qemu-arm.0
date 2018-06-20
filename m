Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp762097wrq;
        Wed, 20 Jun 2018 06:20:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKBwBlelz9l3ahE50RyyypMiyz3mwkdx9YuRQqeNN6yF9rrqbrjEg28L4NiYUq8ita8fJRJ
X-Received: by 2002:a0c:a8e1:: with SMTP id h33-v6mr18189111qvc.131.1529500853186;
        Wed, 20 Jun 2018 06:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500853; cv=none;
        d=google.com; s=arc-20160816;
        b=MlwEFUYb6CA92a9jmulxU+GtgSOrErAY3LvJoPP0/Ai36CgIgHiqYKeZXUpgE4OZwk
         1nZhyzoDpF+9sXoj4kCtmGdqjTYQzfvxuEx0D01eq78Qpv1lyOfh6pEaWG/9xR0FZoqw
         EK5NrbHtio8OTXL6HUHgtOu0uC4rxQygH6DpBIZ6Z/I1aurkEC83DS620yrlVPo4U2Ud
         UnLjPnR8+h9h9VmPzcfafli5PCyRbG289L0Us7oMCrwit0ZJwXW8pjrCPtdiScQF1OxK
         kjpi4zOoSGa/0SRfGGfL9gGerrF71pyOLfNsCaDLvqH0sqN7k8EiKmr/yfVutVNiqdjV
         Lugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=WQ7o1u6q8GzkzHBBNTO3hgMTBTPetFgMmIsfcSNXDS0=;
        b=qeD/arA1YM9bV0AETPkyWcSo5xLltgcnFJ38TafMuQqXIDHA1LghboSpvvBn679Cjo
         g5NWT+coml52xIHGVLCWdL0Skt4/gVpLh78aGwKXy5OPt2TeR2QL12DSeJW9o/vs8UpP
         efZjIMVzuDGwfZIBCz7mT7yxRnxPUQY/MfXfgYCZAyNzurF1AnQTRqytDUXNP/2m2nd8
         f1yOeSHEdvpytTGeCu/InW+xZtaz9xSA13qfpZyxAwUg8LNQYMnphd4RnfoIbQij1nDF
         iVARg4nykQO+zmkunkgWS5q+UMcbfCYCQIqMd3tu2y7CL4qxRKFs5M+2Dvz/IkxnXRcq
         G8sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17-v6si705592qkm.198.2018.06.20.06.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVd2a-0007vZ-Hr
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:20:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq9-0004Xt-2N
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq5-0005jb-45
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:08:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53768 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVcq4-0005jB-VK; Wed, 20 Jun 2018 09:07:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90C074023827;
	Wed, 20 Jun 2018 13:07:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0C812026D6B;
	Wed, 20 Jun 2018 13:07:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 20 Jun 2018 15:07:33 +0200
Message-Id: <1529500053-21704-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:56 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 6/6] hw/arm/virt: handle max_vm_phys_shift
 conflicts on migration
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
Cc: drjones@redhat.com, suzuki.poulose@arm.com, dgilbert@redhat.com,
	agraf@suse.de, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wQdQ3ReMyPB6

When migrating a VM, we must make sure the destination host
supports as many IPA bits as the source. Otherwise the migration
must fail.

We add a VMState infrastructure to machvirt. On pre_save(),
the current source max_vm_phys_shift is saved.

On destination, we cannot use this information when creating the
VM. The VM is created using the max value reported by the
destination host - or the kvm_type inherited value -. However on
post_load() we can check that this value is compatible with the
source saved value.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 37 +++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1700556..667f754 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1258,6 +1258,40 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static int virt_post_load(void *opaque, int version_id)
+{
+    VirtMachineState *vms = (VirtMachineState *)opaque;
+
+    if (vms->max_vm_phys_shift < vms->source_max_vm_phys_shift) {
+        error_report("This host kernel only supports %d IPA bits whereas "
+                     "the guest requires %d GPA bits", vms->max_vm_phys_shift,
+                     vms->source_max_vm_phys_shift);
+        return -1;
+    }
+    return 0;
+}
+
+static int virt_pre_save(void *opaque)
+{
+    VirtMachineState *vms = (VirtMachineState *)opaque;
+
+    vms->source_max_vm_phys_shift = vms->max_vm_phys_shift;
+    return 0;
+}
+
+static const VMStateDescription vmstate_virt = {
+    .name = "virt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = virt_post_load,
+    .pre_save = virt_pre_save,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT32(source_max_vm_phys_shift, VirtMachineState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -1473,6 +1507,7 @@ static void machvirt_init(MachineState *machine)
 
     vms->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&vms->machine_done);
+    vmstate_register(NULL, 0, &vmstate_virt, vms);
 }
 
 static bool virt_get_secure(Object *obj, Error **errp)
@@ -1663,6 +1698,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
+    VirtMachineState *vms = VIRT_MACHINE(ms);
     int max_vm_phys_shift, ret = 0;
     uint64_t type;
 
@@ -1683,6 +1719,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     }
     ret = max_vm_phys_shift;
 out:
+    vms->max_vm_phys_shift = (max_vm_phys_shift > 0) ? ret : 40;
     return ret;
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 2674ce7..600d96d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -119,6 +119,8 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     char *kvm_type;
+    int32_t max_vm_phys_shift;
+    int32_t source_max_vm_phys_shift;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-- 
2.5.5

