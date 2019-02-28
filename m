Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp691788wrx;
        Thu, 28 Feb 2019 07:14:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia2TZO+7oRkSr9oMpBauZZB4/2BgVeHyTVgGoqEsmZAR9OK+/zTZX5VNKz6qSBeUpjHfvjA
X-Received: by 2002:a25:8882:: with SMTP id d2mr6882252ybl.381.1551366886376;
        Thu, 28 Feb 2019 07:14:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366886; cv=none;
        d=google.com; s=arc-20160816;
        b=I2/VrcG0XfUpyhZ+9OK8ht4woX73rZ+8xVI+PZFGSUFv+VAECIMSPqiWpa3TyQu9BS
         D5zdeDLse1NlIgMsxLnLtnoW/U8mRlrUfh/Y864dOys/Xu7GazMQBre9kTubWGEtiI9x
         g53+yLulOkZyq8iEN3HdLXQ0Z6FC9eRXE3qs7PS0sdLzlfsKx+EC1sHImGO+NuStUKTz
         O4Xpvgh6QVdWsWxIu2Ao9G2Mzha23EUye3WDo4wU0TvIhCchIXZJzKx/hFTNz6zKypuO
         kgF0XPM6oBBgabYic3YR+Ur+xpqCN/COaCECaOEPYlWtDLVeAKHEVg/DZoOVhzMp3sVA
         puAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=hTcEugA5GHVJWMiOzmvrKQxPcorpxWkMtWWvbw4F6Hg=;
        b=v+0z1kXj5SXDUeCGv6veL3W+EWbLhr5u8iDirOAoTRH1Md5wDUPaZmvyJfZtwgac35
         01a7i8kJG5fqjd0FDF2D9OIjupCHyOqMiieulC13J4Hw62CpKeW7+lv6Y0HdKNtci8h5
         a9h7jN9xFnRAQefC7SCVM9T/Y4zpfJ7ogXdUmD+hOuX/2VJDZSJV59DRCgize7BKfAR/
         6+Z1mZ4rx1CerEAzCjS5/QwQsgioBaAw94cHU9ds5blaTJ51s1uDJ0//W/fyE1hd2LQW
         Ediwq6RvtOvIsjOHaxukr+NOhAyIg13Z/KcDv/81fZG938cxRt1BuqVL9IBZsOeDeqLV
         EgCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z187si6756559yba.39.2019.02.28.07.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:14:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNOX-0001nx-Px
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNF2-0002CI-MM
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEs-0004PC-1M
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:23863)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNEq-0004OC-Mg; Thu, 28 Feb 2019 10:04:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A6D4E9E38;
	Thu, 28 Feb 2019 15:04:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB9441973E;
	Thu, 28 Feb 2019 15:04:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:22 +0100
Message-Id: <20190228150324.25973-9-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 28 Feb 2019 15:04:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v10 08/10] hw/arm/virt: Implement kvm_type
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
X-TUID: 8NXWv+P1PSE6

This patch implements the machine class kvm_type() callback.
It returns the number of bits requested to implement the whole GPA
range including the RAM and IO regions located beyond.
The returned value in passed though the KVM_CREATE_VM ioctl and
this allows KVM to set the stage2 tables dynamically.

To compute the highest GPA used in the memory map, kvm_type()
must freeze the memory map by calling virt_set_memmap().

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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
index d7aa7d3f9d..7a158571b7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1439,7 +1439,13 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
-    virt_set_memmap(vms);
+    /*
+     * In accelerated mode, the memory map is computed in kvm_type()
+     * to create a VM with the right number of IPA bits.
+     */
+    if (!kvm_enabled()) {
+        virt_set_memmap(vms);
+    }
=20
     /* We can probe only here because during property set
      * KVM is not available yet
@@ -1828,6 +1834,36 @@ static HotplugHandler *virt_machine_get_hotplug_ha=
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
@@ -1852,6 +1888,7 @@ static void virt_machine_class_init(ObjectClass *oc=
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

