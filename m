Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5037854wrt;
        Tue, 5 Feb 2019 09:51:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib4X+PcNLQirKzEVCK5H7Xysl2SzYHmHoO5mxCELjnEFyUvDml1HncRI+0c5gQW0+lrXZki
X-Received: by 2002:a25:320c:: with SMTP id y12mr2411396yby.496.1549389103828;
        Tue, 05 Feb 2019 09:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389103; cv=none;
        d=google.com; s=arc-20160816;
        b=ZozEzgleUKdGtaW2eS1yGC9se+Q1k2BAULa7hREsEgPb7ceft0/XoAsryQK+0p0cPZ
         aRUUhYjXHaDd4nqjARta56cQ1Ax4FKOyfjkqPfDdQFXEXQ+betn37eIGeaQcI3YFIRCX
         cr/RPyjn1yh0U7RPtJ3fM+9oUBrkvIjvY0p1ryuaMUOALlHqk7nc0hnLzUSMPFmne5eh
         XidAMWWYQcOakhjF0BowfCeKYGZwIVOwNigH6XCmJ1I3N5960ivBsF4RzL3T1FKWVR2l
         tfLL9ZHhW7bIs/gHO4nMEK2b3fEGnOLIycLkgPwKZD5tfHl5kItdEXUC55jCT0QfnbIf
         tfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gmD+TeYTNBa+qIE+FR55FpB7tO+DUdRn4nhh+8raXdY=;
        b=UzJE2Rx8nhVFzW6xxyogIxtVFxGBr+89bMfzlQbwXLfsbOms4ZEl97MT6Ega+5+8+t
         EHp4ioX6esYzp7yBLINoXI0hfbM5urTUSW0qc48Efo8acyLBnBlWrLdFU33jh8C9zz/k
         yfY4JiwGxrY6CyKeGYGvaH9UZgvrItTaxK1L0OlXfZvyT8TWD0gP6R5/VVLaRcSY19u/
         M6LeIwdAInInB1qc5Eczib3FRdKpubCQpUVk7Aao7YiNtfL9yde4jcbvOhLg5SImlK7o
         wX5WjROJfsR8nOiC7gqunRf8baTe5Oz/jSSsmC6uOnchll/6akzHycY82E+bcWVGH6z9
         oQPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si2298603ywc.412.2019.02.05.09.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 09:51:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr4sp-0006GD-71
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 12:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bh-0000EE-LM
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bg-0004KA-4O
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4bf-0004JR-MG; Tue, 05 Feb 2019 12:33:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F3E57F6C7;
	Tue,  5 Feb 2019 17:33:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9F5A17988;
	Tue,  5 Feb 2019 17:33:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:32:57 +0100
Message-Id: <20190205173306.20483-10-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 05 Feb 2019 17:33:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 09/18] hw/arm/virt: Implement kvm_type
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
X-TUID: QSGGRn+/KkZE

This patch implements the machine class kvm_type() callback.
It returns the max IPA shift needed to implement the whole GPA
range including the RAM and IO regions located beyond.
The returned value in passed though the KVM_CREATE_VM ioctl and
this allows KVM to set the stage2 tables dynamically.

At this stage the RAM limit still is limited to 255GB.

Setting all the existing highmem IO regions beyond the RAM
allows to have a single contiguous RAM region (initial RAM and
possible hotpluggable device memory). That way we do not need
to do invasive changes in the EDK2 FW to support a dynamic
RAM base.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6:
- add some comments
- high IO region cannot start before 256GiB
---
 hw/arm/virt.c         | 52 +++++++++++++++++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  2 ++
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2b15839d0b..b90ffc2e5d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1366,6 +1366,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineSta=
te *vms, int idx)
=20
 static void virt_set_memmap(VirtMachineState *vms)
 {
+    MachineState *ms =3D MACHINE(vms);
     hwaddr base;
     int i;
=20
@@ -1375,7 +1376,17 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i] =3D a15memmap[i];
     }
=20
-    vms->high_io_base =3D 256 * GiB; /* Top of the legacy initial RAM re=
gion */
+    /*
+     * We now compute the base of the high IO region depending on the
+     * amount of initial and device memory. The device memory start/size
+     * is aligned on 1GiB. We never put the high IO region below 256GiB
+     * so that if maxram_size is < 255GiB we keep the legacy memory map
+     */
+    vms->high_io_base =3D ROUND_UP(GiB + ms->ram_size, GiB) +
+                        ROUND_UP(ms->maxram_size - ms->ram_size, GiB);
+    if (vms->high_io_base < 256 * GiB) {
+        vms->high_io_base =3D 256 * GiB;
+    }
     base =3D vms->high_io_base;
=20
     for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++=
) {
@@ -1386,6 +1397,7 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size =3D size;
         base +=3D size;
     }
+    vms->highest_gpa =3D base - 1;
 }
=20
 static void machvirt_init(MachineState *machine)
@@ -1402,7 +1414,9 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
-    virt_set_memmap(vms);
+    if (!vms->extended_memmap) {
+        virt_set_memmap(vms);
+    }
=20
     /* We can probe only here because during property set
      * KVM is not available yet
@@ -1784,6 +1798,36 @@ static HotplugHandler *virt_machine_get_hotplug_ha=
ndler(MachineState *machine,
     return NULL;
 }
=20
+/*
+ * for arm64 kvm_type [7-0] encodes the IPA size shift
+ */
+static int virt_kvm_type(MachineState *ms, const char *type_str)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(ms);
+    int max_vm_phys_shift =3D kvm_arm_get_max_vm_phys_shift(ms);
+    int max_pa_shift;
+
+    vms->extended_memmap =3D true;
+
+    virt_set_memmap(vms);
+
+    max_pa_shift =3D 64 - clz64(vms->highest_gpa);
+
+    if (max_pa_shift > max_vm_phys_shift) {
+        error_report("-m and ,maxmem option values "
+                     "require an IPA range (%d bits) larger than "
+                     "the one supported by the host (%d bits)",
+                     max_pa_shift, max_vm_phys_shift);
+       exit(1);
+    }
+    /*
+     * By default we return 0 which corresponds to an implicit legacy
+     * 40b IPA setting. Otherwise we return the actual requested IPA
+     * logsize
+     */
+    return max_pa_shift > 40 ? max_pa_shift : 0;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -1808,6 +1852,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
+    mc->kvm_type =3D virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
     hc->plug =3D virt_machine_device_plug_cb;
@@ -1911,6 +1956,9 @@ static void virt_machine_3_1_options(MachineClass *=
mc)
 {
     virt_machine_4_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len)=
;
+
+    /* extended memory map is enabled from 4.0 onwards */
+    mc->kvm_type =3D NULL;
 }
 DEFINE_VIRT_MACHINE(3, 1)
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 3dc7a6c5d5..c88f67a492 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,8 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     hwaddr high_io_base;
+    hwaddr highest_gpa;
+    bool extended_memmap;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

