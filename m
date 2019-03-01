Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp645178wrx;
        Fri, 1 Mar 2019 05:48:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgjeXG/FSglxfyLJrXd0QHBhXvZQqLPo5sXfl1WpMnVxP/Bo+3h8MpI1bLYyEQsyulul98
X-Received: by 2002:a81:55ce:: with SMTP id j197mr3591388ywb.100.1551448107078;
        Fri, 01 Mar 2019 05:48:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551448107; cv=none;
        d=google.com; s=arc-20160816;
        b=KnwquFFBsaV4KiX01qbw+mF3gSClRtmPFOB93WLCTiZKu7S1fexJgO99+LsCpxZAEp
         ppdi1qFZugQeKyT7NyIuSQhuqyAIt7AY73O6C/fupcSuLyNlEWs01yzqZkjHgvpXI1lC
         DO5o1aELMtK1vPx82bJoDOKa3lDcDNsXu1DT/a3MJ8ME5gnw2KGesPCUxW7CWW8XlPVu
         kLC3hwqHt6wdZ6GPgVdjESx2TQV1CnZr5HWEGWJx4HRD7J6S1tcg/nRCnFXPdCYB6oQH
         AGrrORc9qpK8DfbgtirFp4jo9pipRhbWMM8jDhBQfZkQ1dUhWO8esSMjHu8Hc3TAoIrm
         iSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=srbYiVQhPHVLDxmHIb4RK53DfFFMo0MdJ9Xp5MdGyTo=;
        b=DXFJktxwYu6tQ/Tlwua8cIXZMqYxJcygxegmkc8xE2rwRQ5sNqQ6CyCwZ1m12bX5Lw
         pOAoAwZTZ2EivnCYqfacZ8Urisq+zonWrT1AP4eybOIcaw5UnfKYwmvZnSCujtvnoHsd
         n8ZOI7h1vd8EtlSo98VMefyXmekikDdHOVRrT17JpwBt/oYXRdPsklAKjicGgzBXZD8h
         wAqVdlYCRdm1lCgNBKFOvlVNIhiCRR3Wc76hIyYYVNZURVvVC2NOauzkdhPKNrLtJ7sc
         z5qJehNqf2alRQ1SiLP4ddHTOjwpanAoxC0YkHaMBnqNqsgOvAz61n7NRy7lyiTF4FSS
         803A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w69si12341265yww.428.2019.03.01.05.48.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:48:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gziWY-0003Dk-FU
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:48:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziW0-0002wA-Ge
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziVz-0002qt-LV
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:47:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10339)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gziVz-0002qV-DC; Fri, 01 Mar 2019 08:47:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94DE430D78BB;
	Fri,  1 Mar 2019 13:47:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D012E5D704;
	Fri,  1 Mar 2019 13:47:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Fri,  1 Mar 2019 14:47:07 +0100
Message-Id: <20190301134709.4695-9-eric.auger@redhat.com>
In-Reply-To: <20190301134709.4695-1-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 01 Mar 2019 13:47:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v11 08/10] hw/arm/virt: Implement kvm_type
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Res8lItRo73

This patch implements the machine class kvm_type() callback.
It returns the number of bits requested to implement the whole GPA
range including the RAM and IO regions located beyond.
The returned value in passed though the KVM_CREATE_VM ioctl and
this allows KVM to set the stage2 tables dynamically.

To compute the highest GPA used in the memory map, kvm_type()
must freeze the memory map by calling virt_set_memmap().

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v10 -> v11:
- replace !kvm_enabled check by !vms->memmap

v7 -> v8:
- remove vmc->no_extended_memmap and vms->extended_memmap

v6 -> v7:
- Introduce RAMBASE and rename add LEGACY_ prefix in that patch
- use local variables with explicit names in virt_set_memmap:
  device_memory_base, device_memory_size
- add an extended_memmap field in the class

v5 -> v6:
- add some comments
- high IO region cannot start before 256GiB
---
 hw/arm/virt.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 624f417cd4..300eaae26f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1440,7 +1440,13 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
-    virt_set_memmap(vms);
+    /*
+     * In accelerated mode, the memory map is computed earlier in kvm_ty=
pe()
+     * to create a VM with the right number of IPA bits.
+     */
+    if (!vms->memmap) {
+        virt_set_memmap(vms);
+    }
=20
     /* We can probe only here because during property set
      * KVM is not available yet
@@ -1829,6 +1835,36 @@ static HotplugHandler *virt_machine_get_hotplug_ha=
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
@@ -1853,6 +1889,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
+    mc->kvm_type =3D virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
     hc->plug =3D virt_machine_device_plug_cb;
--=20
2.20.1

