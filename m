Received: by 10.25.205.13 with SMTP id d13csp2427613lfg;
        Tue, 13 Dec 2016 13:50:25 -0800 (PST)
X-Received: by 10.55.99.141 with SMTP id x135mr81342360qkb.147.1481665825298;
        Tue, 13 Dec 2016 13:50:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y6si28641608qkg.9.2016.12.13.13.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 13:50:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGuxq-0008RB-Os
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 16:50:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutP-0002b4-87
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutN-0007bl-Qk
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGutN-0007bO-KU; Tue, 13 Dec 2016 16:45:45 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADAD17EBA5;
	Tue, 13 Dec 2016 21:45:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLjOQV014685; Tue, 13 Dec 2016 16:45:42 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 13 Dec 2016 22:45:20 +0100
Message-Id: <20161213214522.25548-10-drjones@redhat.com>
In-Reply-To: <20161213214522.25548-1-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 13 Dec 2016 21:45:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 09/11] hw/arm/virt-acpi-build: don't save
 VirtGuestInfo on AcpiBuildState
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
X-TUID: SaSo9zqFbP4h

We can get to VirtMachineState without the need for saving a pointer
on AcpiBuildState. This is the mach-virt equivalent to "acpi: Don't save
PcGuestInfo on AcpiBuildState"

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7a1efd0dc538..137781646bec 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -706,7 +706,6 @@ struct AcpiBuildState {
     MemoryRegion *linker_mr;
     /* Is table patched? */
     bool patched;
-    VirtGuestInfo *guest_info;
 } AcpiBuildState;
 
 static
@@ -779,6 +778,8 @@ static void acpi_ram_update(MemoryRegion *mr, GArray *data)
 
 static void virt_acpi_build_update(void *build_opaque)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
+    VirtMachineState *vms = VIRT_MACHINE(machine);
     AcpiBuildState *build_state = build_opaque;
     AcpiBuildTables tables;
 
@@ -790,8 +791,7 @@ static void virt_acpi_build_update(void *build_opaque)
 
     acpi_build_tables_init(&tables);
 
-    virt_acpi_build(container_of(build_state->guest_info,
-                                 VirtMachineState, acpi_guest_info), &tables);
+    virt_acpi_build(vms, &tables);
 
     acpi_ram_update(build_state->table_mr, tables.table_data);
     acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
@@ -841,7 +841,6 @@ void virt_acpi_setup(VirtMachineState *vms)
     }
 
     build_state = g_malloc0(sizeof *build_state);
-    build_state->guest_info = guest_info;
 
     acpi_build_tables_init(&tables);
     virt_acpi_build(vms, &tables);
-- 
2.9.3

