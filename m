Received: by 10.25.205.13 with SMTP id d13csp2429021lfg;
        Tue, 13 Dec 2016 13:54:11 -0800 (PST)
X-Received: by 10.55.114.70 with SMTP id n67mr93733013qkc.185.1481666051129;
        Tue, 13 Dec 2016 13:54:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k127si16576674qkd.147.2016.12.13.13.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 13:54:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGv1U-0003wh-5h
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 16:54:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutL-0002WA-2s
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutK-0007Zo-0T
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGutJ-0007ZI-Qr; Tue, 13 Dec 2016 16:45:41 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8B3561B83;
	Tue, 13 Dec 2016 21:45:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLjOQT014685; Tue, 13 Dec 2016 16:45:39 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 13 Dec 2016 22:45:18 +0100
Message-Id: <20161213214522.25548-8-drjones@redhat.com>
In-Reply-To: <20161213214522.25548-1-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 13 Dec 2016 21:45:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 07/11] hw/arm/virt: pass VirtMachineState instead
 of VirtGuestInfo
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
X-TUID: yS6xHNGxj4iH

Only two functions take VirtGuestInfo parameters. Now that guest-info
is part of VirtMachineState, and VirtMachineState is defined in the
virt header, pass that instead.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 3 ++-
 hw/arm/virt.c            | 8 ++++----
 include/hw/arm/virt.h    | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index db44e2dd5f12..f7ce6aeed307 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -822,8 +822,9 @@ static const VMStateDescription vmstate_virt_acpi_build = {
     },
 };
 
-void virt_acpi_setup(VirtGuestInfo *guest_info)
+void virt_acpi_setup(VirtMachineState *vms)
 {
+    VirtGuestInfo *guest_info = &vms->acpi_guest_info;
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7860fade52f1..bcf8a2954c16 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1156,9 +1156,9 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
     return board->fdt;
 }
 
-static void virt_build_smbios(VirtGuestInfo *guest_info)
+static void virt_build_smbios(VirtMachineState *vms)
 {
-    FWCfgState *fw_cfg = guest_info->fw_cfg;
+    FWCfgState *fw_cfg = vms->acpi_guest_info.fw_cfg;
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product = "QEMU Virtual Machine";
@@ -1191,8 +1191,8 @@ void virt_machine_done(Notifier *notifier, void *data)
     VirtMachineState *vms = container_of(notifier, VirtMachineState,
                                          machine_done);
 
-    virt_acpi_setup(&vms->acpi_guest_info);
-    virt_build_smbios(&vms->acpi_guest_info);
+    virt_acpi_setup(vms);
+    virt_build_smbios(vms);
 }
 
 static void machvirt_init(MachineState *machine)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 77d25dbddb62..cbedc682ae99 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -128,6 +128,6 @@ typedef struct {
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
 
 
-void virt_acpi_setup(VirtGuestInfo *guest_info);
+void virt_acpi_setup(VirtMachineState *vms);
 
 #endif /* QEMU_ARM_VIRT_H */
-- 
2.9.3

