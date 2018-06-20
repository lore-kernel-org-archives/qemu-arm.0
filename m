Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp753224wrq;
        Wed, 20 Jun 2018 06:12:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL656rbZmbWrEhbbRLgjgJCEAK8sPbj0IDsaz9H5FOuTlqCQor4H2viP4HYaFTBGUfYFogE
X-Received: by 2002:a0c:e74c:: with SMTP id g12-v6mr18325537qvn.203.1529500364876;
        Wed, 20 Jun 2018 06:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500364; cv=none;
        d=google.com; s=arc-20160816;
        b=UMLoGZ5HV/fsaSwnFl+Bxfb12JQcVDOm64+4KL/U8zc9mjUUDWn3oS6CElL/VyM0pa
         jqlTGy0lDnneOBieWJwb83B37Wvh8JOVBL8suO29s4i9L6lRU4sWCbof73r/b0eYWqR0
         Mp4y/QnJb70vdHTJ3FGUm/E771PGBw0ychxpkkL88Cfhmakv7gYOfHk2iXTOML5pjBDg
         P0OD0F4E5/RayI6Tpw8hfk/v0OHh/S7CQnSsBx2cvK+mPip1jXpunVw6Ochgp2nrA1mo
         k5Z5seXCx+GRZOE1J4KJL/dYENXplPhPtOK0ZS/w6l7AcC7QO4Z0Bj8SMmY2bkyLz84b
         XTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HGO0YS/T3sb0xCxuPmqzDrXgAKkMC9j+0zE9sTK8M8M=;
        b=P0y7TNxvnTG23o36fsskjEBWimY5PDV4WJpxbvMMpK6LP05nS8oDE+WwDYgx6s2Qa/
         cGjr6nVbYWljHCCiqc3YMZ0t/eQJGkZzAQQa3K69+mltBPxOrffyaP3CzVzIqOum5Tg1
         78Mcreq/9Zk3gnqVyI+SUWwvTuV/+2PbQ0+Qg1DnNJkv1supWAmD6PKFuIYlNadW3WJq
         tNfiFi7n31+YhBvc7NBde0jif8+SkboljpsVTgR8tAwEboe6dZft0wOweBaIuEixFEVf
         /s7v4g8c5ps1x9Pn7EF1527/8UbzBl8Wns7ETL4frNbTW7E3DyE1crCOrlrhEL5uYMNo
         S0Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2-v6si308152qvi.233.2018.06.20.06.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:12:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVcui-0008Mv-A1
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:12:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq4-0004SN-1n
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq3-0005iS-4f
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:07:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53758 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVcq2-0005i9-VY; Wed, 20 Jun 2018 09:07:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96C0E4023826;
	Wed, 20 Jun 2018 13:07:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E40B02026D6B;
	Wed, 20 Jun 2018 13:07:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 20 Jun 2018 15:07:32 +0200
Message-Id: <1529500053-21704-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:54 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 5/6] hw/arm/virt: support kvm_type property
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
X-TUID: OiV1FJVRQVg4

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
index dd92ab9..1700556 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1585,6 +1585,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
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
@@ -1646,6 +1661,31 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
+static int virt_kvm_type(MachineState *ms, const char *type_str)
+{
+    int max_vm_phys_shift, ret = 0;
+    uint64_t type;
+
+    if (!type_str) {
+        max_vm_phys_shift = kvm_get_max_vm_phys_shift(ms);
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
@@ -1668,6 +1708,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->plug = virt_machine_device_plug_cb;
@@ -1756,6 +1797,9 @@ static void virt_3_0_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
 
+    object_property_add_str(obj, "kvm-type",
+                            virt_get_kvm_type, virt_set_kvm_type, NULL);
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4ac7ef6..2674ce7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -118,6 +118,7 @@ typedef struct {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    char *kvm_type;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-- 
2.5.5

