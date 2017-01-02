Received: by 10.25.205.13 with SMTP id d13csp8539526lfg;
        Mon, 2 Jan 2017 12:11:29 -0800 (PST)
X-Received: by 10.55.152.4 with SMTP id a4mr55401103qke.69.1483387889413;
        Mon, 02 Jan 2017 12:11:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r193si31491627qke.215.2017.01.02.12.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8x4-0001EC-Hc
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:11:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8oA-0001hY-8u
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8o9-0003sR-4c
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8o8-0003s3-Sa; Mon, 02 Jan 2017 15:02:13 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E517B4D686;
	Mon,  2 Jan 2017 20:02:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOj017390; Mon, 2 Jan 2017 15:02:11 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:44 +0100
Message-Id: <20170102200153.28864-8-drjones@redhat.com>
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 02 Jan 2017 20:02:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 07/16] hw/arm/virt: eliminate struct
 VirtGuestInfoState
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2DsoKPhfbuIm

Instead of allocating a new struct just for VirtGuestInfo and the
machine_done Notifier, place them inside VirtMachineState. This
is the mach-virt equivalent of "pc: Eliminate struct
PcGuestInfoState"

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c                    | 20 +++++++++++---------
 include/hw/arm/virt-acpi-build.h |  6 ------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 67c0abb30b5b..d242980869bc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -76,6 +76,8 @@ typedef struct {
 
 typedef struct {
     MachineState parent;
+    VirtGuestInfo acpi_guest_info;
+    Notifier machine_done;
     bool secure;
     bool highmem;
     bool virt;
@@ -1222,12 +1224,13 @@ static void virt_build_smbios(VirtGuestInfo *guest_info)
 }
 
 static
-void virt_guest_info_machine_done(Notifier *notifier, void *data)
+void virt_machine_done(Notifier *notifier, void *data)
 {
-    VirtGuestInfoState *guest_info_state = container_of(notifier,
-                                              VirtGuestInfoState, machine_done);
-    virt_acpi_setup(&guest_info_state->info);
-    virt_build_smbios(&guest_info_state->info);
+    VirtMachineState *vms = container_of(notifier, VirtMachineState,
+                                         machine_done);
+
+    virt_acpi_setup(&vms->acpi_guest_info);
+    virt_build_smbios(&vms->acpi_guest_info);
 }
 
 static void machvirt_init(MachineState *machine)
@@ -1240,8 +1243,7 @@ static void machvirt_init(MachineState *machine)
     int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     const char *cpu_model = machine->cpu_model;
-    VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
-    VirtGuestInfo *guest_info = &guest_info_state->info;
+    VirtGuestInfo *guest_info = &vms->acpi_guest_info;
     char **cpustr;
     ObjectClass *oc;
     const char *typename;
@@ -1459,8 +1461,8 @@ static void machvirt_init(MachineState *machine)
     guest_info->use_highmem = vms->highmem;
     guest_info->gic_version = vms->gic_version;
     guest_info->no_its = vmc->no_its;
-    guest_info_state->machine_done.notify = virt_guest_info_machine_done;
-    qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
+    vms->machine_done.notify = virt_machine_done;
+    qemu_add_machine_init_done_notifier(&vms->machine_done);
 
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
index 2bcd22265cfa..925c4347381c 100644
--- a/include/hw/arm/virt-acpi-build.h
+++ b/include/hw/arm/virt-acpi-build.h
@@ -34,12 +34,6 @@ typedef struct VirtGuestInfo {
     bool no_its;
 } VirtGuestInfo;
 
-
-typedef struct VirtGuestInfoState {
-    VirtGuestInfo info;
-    Notifier machine_done;
-} VirtGuestInfoState;
-
 void virt_acpi_setup(VirtGuestInfo *guest_info);
 
 #endif
-- 
2.9.3

