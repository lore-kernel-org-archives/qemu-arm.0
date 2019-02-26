Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11093942wrx;
        Tue, 26 Feb 2019 05:53:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaW3chWS+kX7DYhzxu9krJNjPawRToSlJoYE3q2BueHyQuzTJf2mjgT5BccbXbt2UjzfrP0
X-Received: by 2002:a81:9854:: with SMTP id p81mr18439759ywg.130.1551189221875;
        Tue, 26 Feb 2019 05:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189221; cv=none;
        d=google.com; s=arc-20160816;
        b=zgayeQCakA2At3IY9zQ4idR17ahKQ6caEoUmxtKA2CnYUiDCAQsBhK0l1C6CgxJe9C
         rzq5MKqqCNTKtUnNjRul4wWXe1mcI2/A9l3N1taLkUNx06VAufO8l9BU7YrzRdK7PFPN
         R626FtzSeWzzblfIWV+gTEQlp8FwhcPQF12jdzK/Ce6WTUKNFj3ch5TaEvuh8XbQf9Gl
         VwZmT89zKkeOx0mNbt9iXHFixewUbDIyfPYZkArjO6YjYupIMaiZ1ZS0u8xKRX7UNlHj
         khpzdJOytGGlFCCxbYhLr3GsyuN8axhZ3OE+BztsjJsot+j32ZG4tDkjKutYuHtu2Dru
         StNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UYHSy+YD6scAz6gnDdqcrOIqWQ8R/pgmj2NxzDSQxgQ=;
        b=MUqX2Qpcl21p1EwBxo1s8Vr8TNZaqTci9ggPBoKezskgrjpURleMRczBPdXvE47yQv
         RdhnvC2XTbtlcOa7WXesiS5DP2xg7PtImGcRTKuRC/ln65H7zMY69r5LTNxLl1ervAwH
         sJHz7e1RZIX0N+KsXwPvybl9j/3WdZ47Dzjh7s9zdJBVHG7tBLJ8gPJEDvtEdztFXNJN
         xh8lipwTpPMOZcPuJTFfdMewNhTIzMjO4weRWpVXKFLLUCropCu42m0t1HCfdCFjkJEB
         nUhItqMNVMOraw62aRMUf2ilxTejgVWlwTpCHTKOAdt9tIUvFMb6dmp+nWXNcMKHeINz
         7UPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j186si2956124ywa.432.2019.02.26.05.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydAz-0001YN-8N
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:53:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8W-0000Bv-8E
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8V-00074v-6z
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34180)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd8S-00070B-Jb; Tue, 26 Feb 2019 08:51:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9A283169B2D;
	Tue, 26 Feb 2019 13:51:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BABD5F9A0;
	Tue, 26 Feb 2019 13:50:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:04 +0100
Message-Id: <20190226135014.31854-9-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 26 Feb 2019 13:51:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8 08/18] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tWqwimA/FObl

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
index 172bb6c140..3981916931 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1828,6 +1828,36 @@ static HotplugHandler *virt_machine_get_hotplug_ha=
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
@@ -1852,6 +1882,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
+    mc->kvm_type =3D virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
     hc->plug =3D virt_machine_device_plug_cb;
@@ -1923,7 +1954,13 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
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
     vms->irqmap =3D a15irqmap;
 }
--=20
2.20.1

