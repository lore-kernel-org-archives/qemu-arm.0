Received: by 10.28.173.206 with SMTP id w197csp5984395wme;
        Wed, 17 Jan 2018 18:18:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBovhwhLSvIZQKANrus8zfwj44iQN0e2umKiqj+1AL8X3U5D5RMKXKpr+r+rV8+ItXAMF4FG+
X-Received: by 10.37.164.73 with SMTP id f67mr20364086ybi.214.1516241927567;
        Wed, 17 Jan 2018 18:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516241927; cv=none;
        d=google.com; s=arc-20160816;
        b=Dct1h7m/Jg8qIkZ/0hXa/m/SdwZkp0hm11lEXP3/2KOGZTXJMVSj6ISTF5zEUYkONe
         Ap4abp2j0y07uwLVxuDw79CJsEzIMsgCT8uSuXgU/agDvmldm6YNoMuoGP7dhJqNZUi8
         ngbnNDG5mTHKcoEJcxLVVE0HCQqjiQ/DAqXSyBd3ObxwRzC/VenjITIX8su2M4qK3h0/
         6v2nkrbjUjYgxKn/GTjpdz9yFFusm8NedWmwo3l33l8AsMVvVKbA88nbPiDsOW5th/a4
         +wzlPzMWCx7c6V2ZGBGxB+XfG4bWVa1pZ3QTY8WwXkSdQBG6j0E4obSpbHg6OHwMJ6Ve
         mXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6LY6rJTI/bQjbJU2Ns3YnJeX5pUffwzjKWjcqV8gdMw=;
        b=EyuPQ38uZ1iTTyG/OGVRrNYn1x3yd1SzHCUyHx/mrvnURPw/aN+YDegjllirtVdfOY
         p219b59ZLU7d0okyyeOFSAfe9rVebJoL/OzeZek7VR7+GiRviNCB7YG6OrdLJ0qbbBtv
         NWZQsjlvmapHkJFCbXEeEXWucR0sE2TMlk0oLPCt8xQK4a5mWJ/cpkHFMrQw0nWuwnpc
         gZb1YhmW+nRELKO1ih4tzR+aHidVQ9zDVGAEn0gCIEGhdqpw1WpJItxM0LHj7ukaaAQC
         gyqErhV6ndPGvF3HLgI5fTCk6Trt7OdwplDeNf9Ds22lDgoJe/fMwwSB27TScS1oMArz
         isMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 83si1443537ybp.624.2018.01.17.18.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 18:18:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebzmw-0007E8-T3
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 21:18:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ebzfH-0000k4-QJ
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 21:10:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ebzfG-0004iS-3D
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 21:10:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ebzfF-0004hr-Qc; Wed, 17 Jan 2018 21:10:50 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCED244826;
	Thu, 18 Jan 2018 02:10:47 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32BF717D8B;
	Thu, 18 Jan 2018 02:10:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Jan 2018 00:09:47 -0200
Message-Id: <20180118021000.27203-7-ehabkost@redhat.com>
In-Reply-To: <20180118021000.27203-1-ehabkost@redhat.com>
References: <20180118021000.27203-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Jan 2018 02:10:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 06/19] machine: Replace has_dynamic_sysbus with
 list of allowed devices
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@suse.de>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dBWWDrwEIrgO

The existing has_dynamic_sysbus flag makes the machine accept
every user-creatable sysbus device type on the command-line.
Replace it with a list of allowed device types, so machines can
easily accept some sysbus devices while rejecting others.

To keep exactly the same behavior as before, the existing
has_dynamic_sysbus=3Dtrue assignments are replaced with a
TYPE_SYS_BUS_DEVICE entry on the allowed list.  Other patches
will replace the TYPE_SYS_BUS_DEVICE entries with more specific
lists of devices.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcel Apfelbaum <marcel@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20171125151610.20547-2-ehabkost@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/boards.h  |  5 ++++-
 hw/arm/virt.c        |  3 ++-
 hw/core/machine.c    | 43 +++++++++++++++++++++++++++++--------------
 hw/i386/pc_q35.c     |  3 ++-
 hw/ppc/e500plat.c    |  4 +++-
 hw/ppc/spapr.c       |  3 ++-
 hw/xen/xen_backend.c |  7 ++++++-
 7 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 156b16f7a6..041bc08971 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -76,6 +76,9 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
=20
+void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type);
+
+
 /**
  * CPUArchId:
  * @arch_id - architecture-dependent CPU ID of present or possible CPU
@@ -179,7 +182,6 @@ struct MachineClass {
         no_floppy:1,
         no_cdrom:1,
         no_sdcard:1,
-        has_dynamic_sysbus:1,
         pci_allow_0_address:1,
         legacy_fw_cfg_order:1;
     int is_default;
@@ -197,6 +199,7 @@ struct MachineClass {
     bool ignore_memory_transaction_failures;
     int numa_mem_align_shift;
     const char **valid_cpu_types;
+    strList *allowed_dynamic_sysbus_devices;
     bool auto_enable_numa_with_memhp;
     void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
                                  int nb_nodes, ram_addr_t size);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 543f9bd6cc..7549895fd2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1591,7 +1591,8 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
      * configuration of the particular instance.
      */
     mc->max_cpus =3D 255;
-    mc->has_dynamic_sysbus =3D true;
+    /*TODO: allow only sysbus devices that really work with this machine=
 */
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
     mc->block_default_type =3D IF_VIRTIO;
     mc->no_cdrom =3D 1;
     mc->pci_allow_0_address =3D true;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c857f3f934..0320a8efa1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -334,29 +334,44 @@ static bool machine_get_enforce_config_section(Obje=
ct *obj, Error **errp)
     return ms->enforce_config_section;
 }
=20
-static void error_on_sysbus_device(SysBusDevice *sbdev, void *opaque)
+void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type)
 {
-    error_report("Option '-device %s' cannot be handled by this machine"=
,
-                 object_class_get_name(object_get_class(OBJECT(sbdev))))=
;
-    exit(1);
+    strList *item =3D g_new0(strList, 1);
+
+    item->value =3D g_strdup(type);
+    item->next =3D mc->allowed_dynamic_sysbus_devices;
+    mc->allowed_dynamic_sysbus_devices =3D item;
 }
=20
-static void machine_init_notify(Notifier *notifier, void *data)
+static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
 {
-    Object *machine =3D qdev_get_machine();
-    ObjectClass *oc =3D object_get_class(machine);
-    MachineClass *mc =3D MACHINE_CLASS(oc);
+    MachineState *machine =3D opaque;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
+    bool allowed =3D false;
+    strList *wl;
=20
-    if (mc->has_dynamic_sysbus) {
-        /* Our machine can handle dynamic sysbus devices, we're all good=
 */
-        return;
+    for (wl =3D mc->allowed_dynamic_sysbus_devices;
+         !allowed && wl;
+         wl =3D wl->next) {
+        allowed |=3D !!object_dynamic_cast(OBJECT(sbdev), wl->value);
     }
=20
+    if (!allowed) {
+        error_report("Option '-device %s' cannot be handled by this mach=
ine",
+                     object_class_get_name(object_get_class(OBJECT(sbdev=
))));
+        exit(1);
+    }
+}
+
+static void machine_init_notify(Notifier *notifier, void *data)
+{
+    MachineState *machine =3D MACHINE(qdev_get_machine());
+
     /*
-     * Loop through all dynamically created devices and check whether th=
ere
-     * are sysbus devices among them. If there are, error out.
+     * Loop through all dynamically created sysbus devices and check if =
they are
+     * all allowed.  If a device is not allowed, error out.
      */
-    foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
+    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
 }
=20
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machi=
ne)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index d6060043ac..d0b0e5b422 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -299,7 +299,8 @@ static void pc_q35_machine_options(MachineClass *m)
     m->default_machine_opts =3D "firmware=3Dbios-256k.bin";
     m->default_display =3D "std";
     m->no_floppy =3D 1;
-    m->has_dynamic_sysbus =3D true;
+    /*TODO: allow only sysbus devices that really work with this machine=
 */
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_SYS_BUS_DEVICE);
     m->max_cpus =3D 288;
 }
=20
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index e59e80fb9e..438118c29b 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -15,6 +15,7 @@
 #include "hw/boards.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/kvm.h"
+#include "hw/sysbus.h"
 #include "hw/pci/pci.h"
 #include "hw/ppc/openpic.h"
 #include "kvm_ppc.h"
@@ -63,7 +64,8 @@ static void e500plat_machine_init(MachineClass *mc)
     mc->desc =3D "generic paravirt e500 platform";
     mc->init =3D e500plat_init;
     mc->max_cpus =3D 32;
-    mc->has_dynamic_sysbus =3D true;
+    /*TODO: allow only sysbus devices that really work with this machine=
 */
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("e500v2_v30");
 }
=20
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dfd352c473..95f7f95dd1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3786,7 +3786,8 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
     mc->default_boot_order =3D "";
     mc->default_ram_size =3D 512 * M_BYTE;
     mc->kvm_type =3D spapr_kvm_type;
-    mc->has_dynamic_sysbus =3D true;
+    /*TODO: allow only sysbus devices that really work with this machine=
 */
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
     mc->pci_allow_0_address =3D true;
     mc->get_hotplug_handler =3D spapr_get_hotplug_handler;
     hc->pre_plug =3D spapr_machine_device_pre_plug;
diff --git a/hw/xen/xen_backend.c b/hw/xen/xen_backend.c
index 0f849a26d2..82380ea9ee 100644
--- a/hw/xen/xen_backend.c
+++ b/hw/xen/xen_backend.c
@@ -564,7 +564,12 @@ static void xen_set_dynamic_sysbus(void)
     ObjectClass *oc =3D object_get_class(machine);
     MachineClass *mc =3D MACHINE_CLASS(oc);
=20
-    mc->has_dynamic_sysbus =3D true;
+    /*
+     * Emulate old mc->has_dynamic_sysbus=3Dtrue assignment
+     *
+     *TODO: add only Xen devices to the list
+     */
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
 }
=20
 int xen_be_register(const char *type, struct XenDevOps *ops)
--=20
2.14.3

