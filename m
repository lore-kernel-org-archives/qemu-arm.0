Received: by 10.25.21.156 with SMTP id 28csp1921287lfv;
        Tue, 19 Jul 2016 19:48:59 -0700 (PDT)
X-Received: by 10.55.190.199 with SMTP id o190mr35694128qkf.192.1468982939360;
        Tue, 19 Jul 2016 19:48:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si385900qkh.77.2016.07.19.19.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 19:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPhZC-0007ab-MI
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 22:48:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfih-0000ZU-Gd
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfie-0006eQ-P9
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:38 -0400
Received: from exvmail3.skhynix.com ([166.125.252.90]:61936
	helo=invmail3.skhynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bPfia-0006cN-W7; Tue, 19 Jul 2016 20:50:33 -0400
X-AuditID: a67dfc59-f790b6d000004b07-c5-578ecad4903f
From: Kwangwoo Lee <kwangwoo.lee@sk.com>
To: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 20 Jul 2016 09:49:04 +0900
Message-Id: <1468975744-12587-4-git-send-email-kwangwoo.lee@sk.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsXCNUdUWffKqb5wgwVnjCwa7oVaLFy1jNni
	9NEOZov/v16xWuzf9o/VYs6ZBywWC7oXslkc793BYjHt1B1Wi6fLfrNazNvwgsmB26PlyFtW
	jzvX9rB5zDsZ6PHk2mYmj/f7rrJ59E3/wBzAFsVlk5Kak1mWWqRvl8CVcfdfF1PBWdOKR31T
	mBoYN2p0MXJySAiYSBzfcIcFwhaTuHBvPRtMfMn5I+wgNpuAhsSpDfeBarg4RARWM0s8br3G
	BJJgFiiW6N7+lBXEFhZwkli/rpsRxGYRUJX4umYOkM3BwSvgLHH4dTGIKSEgJ7HgQjpIBaeA
	i0TX+k1gq4SAKt78fsYKMl5CYAubxJeOU6wQN0hKHFxxg2UCI98CRoZVjCKZeWW5iZk5xnrF
	2RmVeZkVesn5uZsYgYG5rPZP5A7Gnlb9Q4wCHIxKPLwcx/rChVgTy4orcw8xSnAwK4nwCu0H
	CvGmJFZWpRblxxeV5qQWH2KU5mBREuddsiAnXEggPbEkNTs1tSC1CCbLxMEp1cAY8MDafN/H
	Q4fa2D9ef9S3RHiv7vzOPe+OHChuCprjGLz0Be/mdw83f1jfFdcY2edae8O61qaKp3ayz1bR
	rhX7LfLNvn4Mm2SgczWw/uh6G8XA6dyfn/qkP7ts9W72/+srqr5kHfvb47/LMzOts8WzvH7q
	oo1v/1uv0uvnsMljfMcm5ud1bqaQEktxRqKhFnNRcSIAP4D/H0gCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsXCFdOSpnvlVF+4wYSHmhYN90ItFq5axmwx
	dVULk8Xpox3MFvM+n2K3+P/rFavF/m3/WC3mnHnAYrGgeyGbxfHeHSwW007dYbV4uuw3q8W8
	5WtZLOZteMHkwOfRcuQtq8eda3vYPOadDPR4cm0zk8f7fVfZPL7d9vDom/6BOYA9issmJTUn
	syy1SN8ugSvj7r8upoKzphWP+qYwNTBu1Ohi5OSQEDCRWHL+CDuELSZx4d56NhCbTUBD4tSG
	+yxdjFwcIgKrmSUet15jAkkwCxRLdG9/ygpiCws4Saxf180IYrMIqEp8XTMHyObg4BVwljj8
	uhjElBCQk1hwIR2kglPARaJr/Saw8UJAFW9+P2OdwMi9gJFhFaNIZl5ZbmJmjplecXZGZV5m
	hV5yfu4mRmDQLav9M2kH47fL7ocYBTgYlXh4OY71hQuxJpYVV+YeYpTgYFYS4RXaDxTiTUms
	rEotyo8vKs1JLT7EKM3BoiTOe/yjUriQQHpiSWp2ampBahFMlomDU6qBsf5E7Av5w0IF1r8O
	iT775GNaf+/RzOKZfmkn/gfs7TNSz2sM+nN44eppy9c33dsR+KTjx0yp/GMXIsPaXsQ/0gnK
	3h7qurb0pnVeTkSTYM8vRvelzQfmRbTVN3P4TP85XTdqkkxhit1U8+AZs0x02syMXvLu3lQQ
	dEFkY9PlCfFGc+2MF+58rsRSnJFoqMVcVJwIAIFvAQ82AgAA
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.90
X-Mailman-Approved-At: Tue, 19 Jul 2016 22:48:47 -0400
Subject: [Qemu-arm] [RFC PATCH 3/3] hw/arm/virt: add nvdimm emulation support
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
Cc: Hyunchul Kim <hyunchul3.kim@sk.com>, Kwangwoo Lee <kwangwoo.lee@sk.com>,
	Woosuk Chung <woosuk.chung@sk.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bYOsx3Jk9TTL

This patch enables evaluating NVDIMM on aarch64 virt platform. The
option - nvdimm - passed after machine type is disabled by default.

The command below has been used to test the feature:

./aarch64-softmmu/qemu-system-aarch64                          \
    -machine type=virt,nvdimm=on                               \
    -cpu cortex-a57 -smp 1                                     \
    -bios ~/oss/edk2/Build/ArmVirtQemu-AARCH64/DEBUG_GCC49/FV/QEMU_EFI.fd \
    -m 512,maxmem=2G,slots=2                                   \
    -object memory-backend-file,id=mem1,share,mem-path=./nvdimm1,size=1G \
    -device nvdimm,memdev=mem1,id=nv1                          \
    -fsdev local,id=r,path=/media/sf_Share,security_model=none \
    -device virtio-9p-device,fsdev=r,mount_tag=r               \
    -kernel ../linux/arch/arm64/boot/Image                     \
    --append "console=ttyAMA0 acpi=force"                      \
    -nographic

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
---
 default-configs/aarch64-softmmu.mak |  2 ++
 hw/arm/virt-acpi-build.c            |  5 +++++
 hw/arm/virt.c                       | 34 ++++++++++++++++++++++++++++++++++
 include/hw/arm/virt-acpi-build.h    |  1 +
 include/hw/arm/virt.h               |  4 ++++
 5 files changed, 46 insertions(+)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 5790cd2..295816b 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -8,3 +8,5 @@ CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
 CONFIG_MEM_HOTPLUG=y
+CONFIG_NVDIMM=y
+CONFIG_ACPI_NVDIMM=y
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 28fc59c..c3caaa9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -648,6 +648,7 @@ struct AcpiBuildState {
 static
 void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
 {
+    AcpiNVDIMMState *acpi_nvdimm = guest_info->acpi_nvdimm;
     GArray *table_offsets;
     unsigned dsdt, rsdt;
     GArray *tables_blob = tables->table_data;
@@ -695,6 +696,10 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
         build_srat(tables_blob, tables->linker, guest_info);
     }
 
+    if (acpi_nvdimm->is_enabled) {
+        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
+                          acpi_nvdimm);
+    }
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
     build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f7ff411..f9db19c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -94,6 +94,7 @@ typedef struct {
     bool highmem;
     int32_t gic_version;
     MemoryHotplugState hotplug_memory;
+    AcpiNVDIMMState acpi_nvdimm;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
@@ -180,6 +181,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_ACPI_IO] =            { 0x09050000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1376,6 +1378,7 @@ static void machvirt_init(MachineState *machine)
     guest_info->irqmap = vbi->irqmap;
     guest_info->use_highmem = vms->highmem;
     guest_info->gic_version = gic_version;
+    guest_info->acpi_nvdimm = &vms->acpi_nvdimm;
     guest_info_state->machine_done.notify = virt_guest_info_machine_done;
     qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
 
@@ -1413,6 +1416,18 @@ static void machvirt_init(MachineState *machine)
                                     &vms->hotplug_memory.mr);
     }
 
+    if (vms->acpi_nvdimm.is_enabled) {
+        AcpiNVDIMMState *acpi_nvdimm = &vms->acpi_nvdimm;
+
+        acpi_nvdimm->dsm_io.type = NVDIMM_ACPI_IO_MEMORY;
+        acpi_nvdimm->dsm_io.base =
+                vbi->memmap[VIRT_ACPI_IO].base + NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm->dsm_io.size = NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm, sysmem,
+                               guest_info->fw_cfg, OBJECT(vms));
+    }
+
     vbi->bootinfo.ram_size = machine->ram_size;
     vbi->bootinfo.kernel_filename = machine->kernel_filename;
     vbi->bootinfo.kernel_cmdline = machine->kernel_cmdline;
@@ -1550,6 +1565,20 @@ static HotplugHandler *virt_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
+static bool virt_get_nvdimm(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->acpi_nvdimm.is_enabled;
+}
+
+static void virt_set_nvdimm(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->acpi_nvdimm.is_enabled = value;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1620,6 +1649,11 @@ static void virt_2_7_instance_init(Object *obj)
     object_property_set_description(obj, "gic-version",
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
+
+    /* nvdimm is disabled on default. */
+    vms->acpi_nvdimm.is_enabled = false;
+    object_property_add_bool(obj, ARCH_VIRT_NVDIMM, virt_get_nvdimm,
+                             virt_set_nvdimm, &error_abort);
 }
 
 static void virt_machine_2_7_options(MachineClass *mc)
diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
index e43330a..167bbb4 100644
--- a/include/hw/arm/virt-acpi-build.h
+++ b/include/hw/arm/virt-acpi-build.h
@@ -33,6 +33,7 @@ typedef struct VirtGuestInfo {
     const int *irqmap;
     bool use_highmem;
     int gic_version;
+    AcpiNVDIMMState *acpi_nvdimm;
 } VirtGuestInfo;
 
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 35aa3cc..c5cf7e3 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -32,6 +32,7 @@
 
 #include "qemu-common.h"
 #include "exec/hwaddr.h"
+#include "hw/mem/nvdimm.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -48,6 +49,8 @@
 /* 1GB alignment for hotplug memory region */
 #define ARCH_VIRT_HOTPLUG_MEM_ALIGN (1ULL << 30)
 
+#define ARCH_VIRT_NVDIMM      "nvdimm"
+
 enum {
     VIRT_FLASH,
     VIRT_MEM,
@@ -70,6 +73,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_ACPI_IO,
 };
 
 typedef struct MemMapEntry {
-- 
2.5.0

