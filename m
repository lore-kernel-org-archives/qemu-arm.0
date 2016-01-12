Received: by 10.25.159.19 with SMTP id i19csp572021lfe;
        Tue, 12 Jan 2016 07:25:40 -0800 (PST)
X-Received: by 10.55.21.163 with SMTP id 35mr40963635qkv.45.1452612336425;
        Tue, 12 Jan 2016 07:25:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a140si103338388qhc.57.2016.01.12.07.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 07:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ0pD-0004j1-PQ
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 10:25:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aJ0pB-0004ip-IB
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 10:25:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aJ0p8-00078b-D0
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 10:25:33 -0500
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:35773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aJ0p8-00078I-5L
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 10:25:30 -0500
Received: by mail-pf0-x22c.google.com with SMTP id 65so64411553pff.2
	for <qemu-arm@nongnu.org>; Tue, 12 Jan 2016 07:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=PlLoMG7dOBcabmGUakOu3YMMiMH+HYVS9M0YkYjyeyg=;
	b=AK4nPJfKdoMimEFQkPWE7A5Cs98Yh+Ei+4k4PKTxzyEJeDJ5gyweIIRclavF/E9Mya
	VNH4r5Tj6KPn9gtDA1sm0xJTU0WqpMmbbX4/Lx5CO7oeJCSsoEgcqcIpTDkc0c/geB47
	VzCx577dgi170yx1/2/PFDM7QmCruQGdA3ubs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PlLoMG7dOBcabmGUakOu3YMMiMH+HYVS9M0YkYjyeyg=;
	b=hWf4zBLtv5xoV2O63mjMObtnsc4kklvEOKSUNz+3dhM6miwU6Nv3i7v5DJlYiXxPix
	JBN/+3lMHRa4sBw8MaPYdM+E0BXZ610HZG3b2xGrnr6VUbxkXlMHf6OsGGuLyk7sti1+
	VciB+HrwCsvHyqExFqK5oU8l6sejZmzt6BuIwN/6LcTr9uP2cbnFOSoPRE7LhIu8GPRD
	GoY5rDPAEyyA76gBR9SkK86kbDXsZPxmDtjJWXipZMeBp0AoC6exsO5qkTOgdB/lEp2w
	ixFokp45E6C07MSou7GJhLWzlncKguYsHCUjMkGTRO7zsE22Gc3v4F4IwvC1BgzxFfVE
	knjg==
X-Gm-Message-State: ALoCoQkrUxeRgBdNKlBgtzwZa6rlFLvb6dqxIv4J0dRI5GzpFIi+UMAcs6v/FuznSQb677F48+moBkHHaVvdjCZnigs472SRig==
X-Received: by 10.98.65.203 with SMTP id g72mr35262806pfd.44.1452612329039;
	Tue, 12 Jan 2016 07:25:29 -0800 (PST)
Received: from localhost.localdomain ([39.182.11.117])
	by smtp.gmail.com with ESMTPSA id
	dg12sm152719278pac.47.2016.01.12.07.25.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 07:25:27 -0800 (PST)
From: Shannon Zhao <shannon.zhao@linaro.org>
To: qemu-arm@nongnu.org
Date: Tue, 12 Jan 2016 23:24:34 +0800
Message-Id: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22c
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, edk2-devel@ml01.01.org,
	qemu-devel@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com
Subject: [Qemu-arm] [PATCH] ARM: Virt: Don't generate RTC ACPI node when
	using UEFI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jt1KlMPKIgaE

When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
To DTB UEFI could call libfdt api to disable the RTC device node, but to
ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
device in QEMU when using UEFI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt-acpi-build.c         | 13 +++++++++++--
 hw/arm/virt.c                    |  5 ++++-
 include/hw/arm/virt-acpi-build.h |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0caf5ce..cccec79 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -575,8 +575,17 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     acpi_dsdt_add_cpus(scope, guest_info->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
-    acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
-                      (irqmap[VIRT_RTC] + ARM_SPI_BASE));
+
+    /* When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
+     * To DTB UEFI could call libfdt api to disable the RTC device node, but to
+     * ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
+     * device here when using UEFI.
+     */
+    if (guest_info->acpi_rtc) {
+        acpi_dsdt_add_rtc(scope, &memmap[VIRT_RTC],
+                          (irqmap[VIRT_RTC] + ARM_SPI_BASE));
+    }
+
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fd52b76..de12037 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1002,6 +1002,7 @@ static void machvirt_init(MachineState *machine)
     VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
     VirtGuestInfo *guest_info = &guest_info_state->info;
     char **cpustr;
+    bool firmware_loaded;
 
     if (!cpu_model) {
         cpu_model = "cortex-a15";
@@ -1124,12 +1125,14 @@ static void machvirt_init(MachineState *machine)
     create_fw_cfg(vbi, &address_space_memory);
     rom_set_fw(fw_cfg_find());
 
+    firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
     guest_info->smp_cpus = smp_cpus;
     guest_info->fw_cfg = fw_cfg_find();
     guest_info->memmap = vbi->memmap;
     guest_info->irqmap = vbi->irqmap;
     guest_info->use_highmem = vms->highmem;
     guest_info->gic_version = gic_version;
+    guest_info->acpi_rtc = !firmware_loaded;
     guest_info_state->machine_done.notify = virt_guest_info_machine_done;
     qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
 
@@ -1141,7 +1144,7 @@ static void machvirt_init(MachineState *machine)
     vbi->bootinfo.board_id = -1;
     vbi->bootinfo.loader_start = vbi->memmap[VIRT_MEM].base;
     vbi->bootinfo.get_dtb = machvirt_dtb;
-    vbi->bootinfo.firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    vbi->bootinfo.firmware_loaded = firmware_loaded;
     arm_load_kernel(ARM_CPU(first_cpu), &vbi->bootinfo);
 
     /*
diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
index 744b666..6f412a4 100644
--- a/include/hw/arm/virt-acpi-build.h
+++ b/include/hw/arm/virt-acpi-build.h
@@ -33,6 +33,7 @@ typedef struct VirtGuestInfo {
     const int *irqmap;
     bool use_highmem;
     int gic_version;
+    bool acpi_rtc;
 } VirtGuestInfo;
 
 
-- 
2.1.0

