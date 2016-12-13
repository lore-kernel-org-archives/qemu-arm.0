Received: by 10.25.205.13 with SMTP id d13csp2427508lfg;
        Tue, 13 Dec 2016 13:50:10 -0800 (PST)
X-Received: by 10.55.168.139 with SMTP id r133mr95269328qke.160.1481665810737;
        Tue, 13 Dec 2016 13:50:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a145si28618017qkb.2.2016.12.13.13.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 13:50:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGuxb-0008Cz-OE
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 16:50:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutG-0002SB-P0
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutE-0007WH-6B
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8137)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGutD-0007Vy-Uy; Tue, 13 Dec 2016 16:45:36 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14B07C6565;
	Tue, 13 Dec 2016 21:45:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLjOQQ014685; Tue, 13 Dec 2016 16:45:33 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 13 Dec 2016 22:45:15 +0100
Message-Id: <20161213214522.25548-5-drjones@redhat.com>
In-Reply-To: <20161213214522.25548-1-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 13 Dec 2016 21:45:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 04/11] hw/arm/virt: eliminate struct
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, mst@redhat.com,
	ehabkost@redhat.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5d34pTvjhypj

Instead of allocating a new struct just for VirtGuestInfo and the
machine_done Notifier, place them inside VirtMachineState. This
is the mach-virt equivalent of "pc: Eliminate struct
PcGuestInfoState"

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c                    | 20 +++++++++++---------
 include/hw/arm/virt-acpi-build.h |  6 ------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 18aa3672739d..0657f9ae8722 100644
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
index f5ec749b8fea..d74d7a1af650 100644
--- a/include/hw/arm/virt-acpi-build.h
+++ b/include/hw/arm/virt-acpi-build.h
@@ -36,12 +36,6 @@ typedef struct VirtGuestInfo {
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

