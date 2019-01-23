Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp520528wrt;
        Wed, 23 Jan 2019 02:19:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6A7Po/vdVgDGkB0vrmlX0oDIKlypu1nGYXb13/6sKLxsg7uM5rufkwU5CMbxD0NWjD/uHG
X-Received: by 2002:adf:91a3:: with SMTP id 32mr1810062wri.99.1548238770062;
        Wed, 23 Jan 2019 02:19:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238770; cv=none;
        d=google.com; s=arc-20160816;
        b=SfhvtEZKQNJUqE1iu/Cfx9pp8trJOwX1IGSAu6GKMMnrZRTtnoZ+5i41YEqiHb9eLw
         6ZeuB7O/U9gp4He+1v/VsWooMTtUPL1J0On8tO9iX2LZvrvaoWqj9q74xAQg05MOxhR1
         fCI59JsSvN5tYyOPz6FYOUmT645iWEwUX+qc7ySGLsXdh89IsJSXByUPdGL11n8XkMiH
         8rJ3VCbqGmMuHt1aJUZTYlspsDERIDLyOKhnE7O+f4C2tpuSAgurex5TykUbIDQZkhjY
         3S8uP9rrSarfSdMB5QWnd8NXEwBMeCxoUAeXM6e1sT/lRkgt821WbRRaLkTybWD7Nuof
         levA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HhkiGQcV9+P8dycvgepZ0ez2clr1PIKWvBjh50awcJQ=;
        b=Agr2HKQoNGDo/BCH53fNdXc383JbiwtCywDiSWsxwaHSUOFWnrm0ez8iCFOzNhCznT
         zboY3aRCEBF1u4ju6A23bI7G6jnL7/hN6cBJLG9AmDIj9uDRATeA3Lp0LCUYHlihIQ98
         Y2OutTxXPfPDMbXE2Q5mE4UbTYoNdT127iRj8Lb8Zg/ag192xgXRaM324062+wyhhj7H
         BluTg/MYJaII9RSxD7cnG5HiYBZj60XOmKqJVmRBEws6UslKAxfaRQoGMLw0HcbxkQA+
         9eMmNoNFc+YQ1o8e5D5s0nN5pGJSRoGuJlkg/Ft+1unK/y12XbExfLf0IilcgYJkzlHt
         YqqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si36484075wmd.69.2019.01.23.02.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:19:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFd3-000479-2q
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZd-0001bu-NN
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZb-0007O9-Q1
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9874)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZZ-0007Lw-1O; Wed, 23 Jan 2019 05:15:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19B787F6BB;
	Wed, 23 Jan 2019 10:15:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BAE56019F;
	Wed, 23 Jan 2019 10:15:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:49 +0100
Message-Id: <20190123101458.12478-10-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 23 Jan 2019 10:15:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 09/18] hw/arm/virt: Implement kvm_type
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
X-TUID: uMuDVQqRL+yW

This patch implements the machine class kvm_type() callback.
It returns the max IPA shift needed to implement the whole GPA
range including the RAM and IO regions located beyond.
The returned value in passed though the KVM_CREATE_VM ioctl and
this allows KVM to set the stage2 tables dynamically.

At this stage the RAM limit still is 255GB.

Setting all the existing highmem IO regions beyond the RAM
allows to have a single contiguous RAM region (initial RAM and
possible hotpluggable device memory). That way we do not need
to do invasive changes in the EDK2 FW to support a dynamic
RAM base.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea1fb3ddfd..a89ffbf4d7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1771,6 +1771,32 @@ static HotplugHandler *virt_machine_get_hotplug_ha=
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
+    /* device memory start/size aligned on 1GiB */
+    vms->high_io_base =3D ROUND_UP(GiB + ms->ram_size, GiB) +
+                        ROUND_UP(ms->maxram_size - ms->ram_size, GiB);
+
+    max_pa_shift =3D 64 - clz64(vms->high_io_base + TiB);
+
+    if (max_pa_shift > max_vm_phys_shift) {
+        error_report("-m and ,maxmem option values "
+                     "require an IPA range (%d bits) larger than "
+                     "the one supported by the host (%d bits)",
+                     max_pa_shift, max_vm_phys_shift);
+       exit(1);
+    }
+    return max_pa_shift;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -1795,6 +1821,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
+    mc->kvm_type =3D virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
     hc->plug =3D virt_machine_device_plug_cb;
@@ -1899,6 +1926,9 @@ static void virt_machine_3_1_options(MachineClass *=
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
index 3dc7a6c5d5..86d4c93120 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,7 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     hwaddr high_io_base;
+    bool extended_memmap;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

