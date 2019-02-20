Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5053905wrx;
        Wed, 20 Feb 2019 14:53:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iai07HGJ1KTeIwkJsbJ9bDYQ+SieYcr829zXVdqeld0uNzkB7ikr6xuJ4KaaqaRgs0vp+cM
X-Received: by 2002:a25:c9c6:: with SMTP id z189mr29210234ybf.377.1550703236906;
        Wed, 20 Feb 2019 14:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550703236; cv=none;
        d=google.com; s=arc-20160816;
        b=FWtUyuMcmUmRis6aVZfjOihF34SIJOUQVRoe1wEuu1fTPaLkV7X30doABw7k9c7Azo
         QnqILwM5/FuPSSbQUQS7CIz2HQHFzqaSvw1CxoxjTrPpGCkHi6YQyaKqEI6NyO0mlchG
         GdbcYrtT/umJKCy2KR5v5FFSbKF3dbNTwwWh/bjmmw+x7oWpszfvMjGzZNuHVUMOHkpS
         FAY4k9nPb4sFRsy/0F3KOBbhNFtdHBjNdf/lOB+41TAxqdYTZusKSOWvoxt6AzEtR+sX
         W2wj+DHJhDOP8tghO/S2kNl4g16THyCXDDrHPEWY5v89XfcYN29MX0tpxQL+0e9xHW/7
         JaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=yr0pqf+qYHQHIGUO7E0Iv5QVqcqEHzRJn/fIKjSFd+A=;
        b=CSKKCQSLpns/K51mUFG/3JwU84htjZjk0tH4VakeBS2XC4HRTt162c1pn05eyaky8T
         DmPDmLI2eB74k0AJPxQTzktueGTakCpIGx5yydNqsO5052vgX3TZqIyA+XVfv4z5nxlE
         iDbNok9VagpzypBtjr5MCZFsjsLnJuvRe+76GKpytAQTDSKM0hDVY+B1PSTwu8kV7336
         mXYNUQsGtx8ZyQI6qmjD23IHCyR47a6AM5y+o96K9UqB/PCU99o+Vetk4qBAmXNL8iN5
         UzESY7D8EnfihGl8xQmKvKCrmprlFNoRO7b619mxP98e4UwRf+dz46ktjayxQrDz44AL
         u7JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t186si2997243ywb.157.2019.02.20.14.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:53:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwakW-0006DY-AS
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXo-0004Dx-9W
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXj-00008r-AA
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXj-00008D-1d; Wed, 20 Feb 2019 17:40:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C20FA85376;
	Wed, 20 Feb 2019 22:40:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28BDE5D6AA;
	Wed, 20 Feb 2019 22:40:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:54 +0100
Message-Id: <20190220224003.4420-9-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 20 Feb 2019 22:40:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 08/17] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aMlTULVTxYzi

This patch implements the machine class kvm_type() callback.
It returns the number of bits requested to implement the whole GPA
range including the RAM and IO regions located beyond.
The returned value in passed though the KVM_CREATE_VM ioctl and
this allows KVM to set the stage2 tables dynamically.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7:
- Introduce RAMBASE and rename add LEGACY_ prefix in that patch
- use local variables with explicit names in virt_set_memmap:
  device_memory_base, device_memory_size
- add an extended_memmap field in the class

v5 -> v6:
- add some comments
- high IO region cannot start before 256GiB
---
 hw/arm/virt.c         | 50 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  2 ++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9db602457b..ad3a0ad73d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1437,7 +1437,14 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
-    virt_set_memmap(vms);
+    /*
+     * In accelerated mode, the memory map is computed in kvm_type(),
+     * if set, to create a VM with the right number of IPA bits.
+     */
+
+    if (!mc->kvm_type || !kvm_enabled()) {
+        virt_set_memmap(vms);
+    }
=20
     /* We can probe only here because during property set
      * KVM is not available yet
@@ -1814,6 +1821,36 @@ static HotplugHandler *virt_machine_get_hotplug_ha=
ndler(MachineState *machine,
     return NULL;
 }
=20
+/*
+ * for arm64 kvm_type [7-0] encodes the requested number of bits
+ * in the IPA address space
+ */
+static int virt_kvm_type(MachineState *ms, const char *type_str)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(ms);
+    int max_vm_pa_size =3D kvm_arm_get_max_vm_ipa_size(ms);
+    int requested_pa_size;
+
+    /* we freeze the memory map to compute the highest gpa */
+    virt_set_memmap(vms);
+
+    requested_pa_size =3D 64 - clz64(vms->highest_gpa);
+
+    if (requested_pa_size > max_vm_pa_size) {
+        error_report("-m and ,maxmem option values "
+                     "require an IPA range (%d bits) larger than "
+                     "the one supported by the host (%d bits)",
+                     requested_pa_size, max_vm_pa_size);
+       exit(1);
+    }
+    /*
+     * By default we return 0 which corresponds to an implicit legacy
+     * 40b IPA setting. Otherwise we return the actual requested PA
+     * logsize
+     */
+    return requested_pa_size > 40 ? requested_pa_size : 0;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -1838,6 +1875,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
+    mc->kvm_type =3D virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
     hc->plug =3D virt_machine_device_plug_cb;
@@ -1909,6 +1947,12 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
+    if (vmc->no_extended_memmap) {
+        vms->extended_memmap =3D false;
+    } else {
+        vms->extended_memmap =3D true;
+    }
+
     vms->irqmap =3D a15irqmap;
 }
=20
@@ -1939,8 +1983,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 0)
=20
 static void virt_machine_3_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc =3D VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
     virt_machine_4_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len)=
;
+
+    /* extended memory map is enabled from 4.0 onwards */
+    vmc->no_extended_memmap =3D true;
 }
 DEFINE_VIRT_MACHINE(3, 1)
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index acad0400d8..7798462cb0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -106,6 +106,7 @@ typedef struct {
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
+    bool no_extended_memmap;
 } VirtMachineClass;
=20
 typedef struct {
@@ -135,6 +136,7 @@ typedef struct {
     hwaddr highest_gpa;
     hwaddr device_memory_base;
     hwaddr device_memory_size;
+    bool extended_memmap;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

