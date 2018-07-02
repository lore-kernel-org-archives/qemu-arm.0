Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp113789wrq;
        Mon, 2 Jul 2018 10:26:32 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfQppBZRLGgKWorYK0abOP0ViqWZ1YSc9NtAelQjxAGqDYb+wFW3crWFFG8RyqSH9so7/2Q
X-Received: by 2002:ac8:42b:: with SMTP id v43-v6mr23076349qtg.319.1530552392625;
        Mon, 02 Jul 2018 10:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552392; cv=none;
        d=google.com; s=arc-20160816;
        b=xi2eZ8vFU4/y+ji+vYVmLV6KBJT3qYICu5MzX9z0DYwLDWrgNy7RnjXFVSoCmNxUWH
         Gh3PoRZPprV4iSE4V4Ld/Y1Sxs2GxkCfE4npacaVVBo3YzE2Z78+zOLdISaBsl5J1jlv
         wuXxRQz1+y6cLviCcR3HTcJIqRn23JFP8sfSrEpslMVFu1aovSUmLmBzKDkoMvc12d8E
         iafjCYYr0dBtEpFx1VsLNQmNIAYDICTOL7tTXzIpMGjbQcs+bhLaslX3D0evqvRmf9iL
         N9LdSjTvvJDYAb+SF+adxcjwIKwF2xQxswGch13rsBo0krH7v3RBaaZt/TZY1lieh0tI
         p3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xNxBANOb0bvJTa3yqtT2Jv6j5tmqtdhshJG5FN2TL+g=;
        b=sjXH+XSzmRjb0iJlo1Pqh1lbyYd1X4pSr7+Ig0bUezeB2t2iHWr6p+Ma9O1eR+nYZa
         mjcTzUGImfLYb1VreX2mH0PCTml40J1ZaiJUyD/qTqcdUHq2y7t5Zs3uoIKznbky7I6C
         cPhyey/SV8dq2jeVK5G/l4/L0sEa+7pkmJ8K8T0tkphf8veCnJWJlznMbImNTgjxl/sw
         4kAh3n+d8o+lqt6dzmmS7KaFnRqWCrNTbbrbjFjP5p/OHe5MUlR2OKKfiouWzOLA6te0
         Hh+u+osHo7qYSLtSQtQyzzpq2ODKPl7Vs1qhJYrfksQ5QAbVF7LxS3lT88h8mu+hiDCC
         kDqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s47-v6si4084712qte.73.2018.07.02.10.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2at-0002Wd-Vo
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:26:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Xn-0008VE-NP
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Xm-0006W5-Hi
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44636 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2Xm-0006Vf-Bo; Mon, 02 Jul 2018 13:23:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E18B440122DE;
	Mon,  2 Jul 2018 17:23:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEE7A111AF38;
	Mon,  2 Jul 2018 17:23:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:32 +0200
Message-Id: <1530552162-15533-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 02 Jul 2018 17:23:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 02 Jul 2018 17:23:17 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 05/15] hw/arm/virt: handle max_vm_phys_shift
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UMcrsV1qMxcp

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
index 04a32de..5a4d0bf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1316,6 +1316,40 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
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
@@ -1537,6 +1571,7 @@ static void machvirt_init(MachineState *machine)
 
     vms->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&vms->machine_done);
+    vmstate_register(NULL, 0, &vmstate_virt, vms);
 }
 
 static bool virt_get_secure(Object *obj, Error **errp)
@@ -1727,6 +1762,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
+    VirtMachineState *vms = VIRT_MACHINE(ms);
     int max_vm_phys_shift, ret = 0;
     uint64_t type;
 
@@ -1747,6 +1783,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     }
     ret = max_vm_phys_shift;
 out:
+    vms->max_vm_phys_shift = (max_vm_phys_shift > 0) ? ret : 40;
     return ret;
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 1a90ffc..91f6de2 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -125,6 +125,8 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     char *kvm_type;
+    int32_t max_vm_phys_shift;
+    int32_t source_max_vm_phys_shift;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
-- 
2.5.5

