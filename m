Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3448954wrx;
        Mon, 4 Mar 2019 02:17:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyquHSh7RQ1xMSAN0g9d867mR01cXzDZ2aq59VQGJFXiCH8DTwMLR9T1NMCSfIYps7UOCKD
X-Received: by 2002:a25:6b03:: with SMTP id g3mr3901725ybc.480.1551694671233;
        Mon, 04 Mar 2019 02:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694671; cv=none;
        d=google.com; s=arc-20160816;
        b=JBxtnEWKBHBjxdZ3TiHihxKDYAMS7FPapJukwZDxZa7dW7RW9D3GUR0KbxioEj3sKm
         qKrP3e4GhLIf5Q5PX8NkTZ32h5mXbj6PfTlT+UTrNZBbI3SQvEOuD3IwoQTZM/GQ6S8S
         Adxn4GdEGrAp7pFYtUcCpp1UD1wYbaqbsvR/DT3VL3dslJsKjMGlZb5+W+xuXypOaq9A
         ksml2V3bwiUUCZZN8IPwQo9Fh7sklUKlSs8HgewJGLvl67d8ASxa5q1EdcqFgPVLWvox
         bbQSSr/G1n+N0S3zLxtsS3zJ+I3x7UK5cy5u30OI1Vb4x1SNf1CjjknUrRInGusOREQp
         7rhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uk08nrR13+ES0aG/nY/L6vZ7sj8HK+rb34uSSldn6pE=;
        b=m5638bAMpQcfPCj/BgNwYScNRx/BZedEU0nDm8WNSL9phhhuOsc6p6gRAfN9MhfX0O
         iB3/Gby0AkDjCKAda8Q48qdHzQpLHRPla1xhuv78cjaIFJhyC7kHur7KD56jqMetzSp3
         AeY2NFuEyLOeNLRZdh1SunZLOLrv6eD/FCa/QdjprUIP/d5oC+Edkmj7vUJ+LMtmew9f
         zx13A3yDteKJXYLY2slOXrJ+dw0DhBO9DyVanmI7M38jEkAs4C3MGEoGDy4VqMK2kuMo
         XhHDITGsiIDQDZi0B3zAuhlJjgw8kJwVY6gwGkBe9EpKSpOijUg2Rt0Xvmll7VG7ujwX
         0OHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v38si3117460ywh.347.2019.03.04.02.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0kfO-0004Hd-Ij
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcb-0001uY-S0
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:14:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kca-0000g5-Uo
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:14:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38986)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0kca-0000f9-Ld; Mon, 04 Mar 2019 05:14:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6DE830821C0;
	Mon,  4 Mar 2019 10:14:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFDA251F00;
	Mon,  4 Mar 2019 10:14:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Mon,  4 Mar 2019 11:13:37 +0100
Message-Id: <20190304101339.25970-9-eric.auger@redhat.com>
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
References: <20190304101339.25970-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 04 Mar 2019 10:14:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v12 08/10] hw/arm/virt: Implement kvm_type
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
X-TUID: c2B6cfiF+r0Q

This patch implements the machine class kvm_type() callback.
It returns the number of bits requested to implement the whole GPA
range including the RAM and IO regions located beyond.
The returned value is passed though the KVM_CREATE_VM ioctl and
this allows KVM to set the stage2 tables dynamically.

To compute the highest GPA used in the memory map, kvm_type()
must freeze the memory map by calling virt_set_memmap().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v11 -> v12:
- added Igor's R-b

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
index 2e788a0361..3ac6b152f5 100644
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

