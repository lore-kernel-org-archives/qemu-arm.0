Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63F8CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 01:12:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3lGK-0005ci-En; Tue, 30 Sep 2025 21:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1v3lFo-0005RM-9F
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 21:03:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1v3lFA-00089A-VQ
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 21:03:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so68966795e9.2
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 18:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=opnsrc.net; s=google; t=1759280571; x=1759885371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3d/1PkHX+6ySvY2cHkD8QFKwUFKHxum1HSH+EnGsK+0=;
 b=ie+Wpi+NqHkLSNBCJGSqLtlniguWh0bA7VYS5WUGwL9sZ69Ox6v3JyHR/a2FEpTdI+
 Pya+ZTDFbVE9BjH95cVdyhut95D3gcULHx0ARTvR2shfVNF3NNv2AJ9r5W3bTnrx20/V
 Xk7r1OOjYue/mMV7NaU1QSP5YokojK95pXwKNtAi8Is0wofx1hJ4Ue6pug94Jc5yOE5c
 I9gPdgTsZiXGiC6fCytE5gKeRURBsudPzWxM/qjvuCDQLPlHXl3EntcUqyzKxXXT7Msp
 5x6jVMpkzftL0Xg06PcCMNBbQeW1CRgQsxjQBlgvPtjxqBN3u+akF8i7QFlNmrHwPaiE
 F6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759280571; x=1759885371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3d/1PkHX+6ySvY2cHkD8QFKwUFKHxum1HSH+EnGsK+0=;
 b=NNi8bfw7907qwr9bJQTjMXaPUHvGPaWOg3eX11Tfw2HHh/SMjw08eQfJhafzITguZ5
 An6KZC51DICQi6YSsyP5i00Y74BZYD1pbuDhD4hdZnGpeTmhCO+daEP7LqdIuRIK81eH
 6xFMdtwpaTz0PLkdAGlGDSfWhasDaamc1y/L1+3+aeKBkfUlqk1eA+6T0SIs2dfgVBmZ
 qrdnRK7PM9meHKNEQlkGTEyGL5LgqKKiZkrWIxWf2qIDjLNFEjDqIUHKq9WgXfqpKT+v
 ks5KGN9/Cj4E5FKYudafMRNUijFBQL/0vdUSorg2EgV/VFy35zLDigIkiThGgnRDawIu
 QTQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV22ezd5tD4wCOzzLio5Al2UrvbyLW6y4WIXhH5UqTV4ax4RNR3syM8Qegrkivqjd7RQax2uJhAhg==@nongnu.org
X-Gm-Message-State: AOJu0YywKEe9mzFOThHv80NT3k7VhteycuQPsebkT600VIES9bf3KLMI
 buAAbvmGCu3Yr9q5GuAlK0D7FivkbMwkHiJsgCWO0HWKfxGgJpE+LA2JkduN3aFyJjY=
X-Gm-Gg: ASbGncsQhkUBFD6i5w9racjKoIfsE9yC3H5vnHzSZz+FXk0D9ZJbnQP77fYTtIwIw39
 BD29yXS/Mv5fw5s6cxQ4x6rTDYkxIh9/y6/NmNDsCXJf6HTd7JFpZwcQ1wJy3wXJACxRyJR6oGk
 2vxadQUul92nmN19sklDqfP6lOdn6jWQRd0GxQ0B2YCF5Klicb4PJUm4JImEZK516pWd3vqjtDv
 /88N62yDTSbgXYHDdFFmqVcbSRPp5TwEtr+/bkimGLntJy0w8HvlY9d4ilP3QUHjELdrNw0vqTl
 dKZ/iBnKoYxHxH5LB6vPPXKXsRtTmJ6JJAdKnqmYTiCpv1HIkdzp4r+SlX3x6OLHdKwURSxd2iX
 Laf1vDSLmhznsx2JSk+FwzdyA+sW6GxUvmS6rWj3flGyw45VZo3WuNCYEcH2JyQKufoluy6MUKj
 /cOO6fChbkx4ZtpgSCC5GrULtKziWt6A8MszD+fOM7blU=
X-Google-Smtp-Source: AGHT+IHRdDsT1RAOSF3kAiKK2Tu3EectRNRiOrgC1ZbY7bH5hpBDTXxVCHt05ceFQOLhIYQooXwHcA==
X-Received: by 2002:a05:600c:468f:b0:46e:447d:858e with SMTP id
 5b1f17b1804b1-46e612dce3dmr13937645e9.28.1759280571088; 
 Tue, 30 Sep 2025 18:02:51 -0700 (PDT)
Received: from localhost.localdomain ([90.209.204.182])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb985e080sm24587426f8f.24.2025.09.30.18.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 18:02:49 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	mst@redhat.com
Cc: salil.mehta@huawei.com, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 imammedo@redhat.com, armbru@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 will@kernel.org, ardb@kernel.org, oliver.upton@linux.dev,
 pbonzini@redhat.com, gshan@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, wangzhou1@hisilicon.com,
 linuxarm@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, shahuang@redhat.com, zhao1.liu@intel.com
Subject: [PATCH RFC V6 16/24] arm/virt/acpi: Update ACPI DSDT Tbl to include
 'Online-Capable' CPUs AML
Date: Wed,  1 Oct 2025 01:01:19 +0000
Message-Id: <20251001010127.3092631-17-salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=salil.mehta@opnsrc.net; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Salil Mehta <salil.mehta@huawei.com>

This change emits AML in DSDT to support vCPU deferred online-capability on
arm/virt. It wires the CPU OSPM coordination paths so that CPUs which are
administratively disabled at boot can be brought online later under policy,
providing hotplug-like functionality without claiming full hotplug support.

The AML connects the CPUS scan method to a GED handler so QEMU and the
guest OSPM can coordinate CPU add/remove while the VM is running (e.g.
device-check, eject-request, _EJ0, CPU scan, _OST status reporting).

It also fixes an ACPI namespace load error:
  AE_NOT_FOUND resolving \_SB.GED.PSCN
Error excerpt:
[    0.070518] ACPI BIOS Error (bug): Object does not exist: GED_
[    0.071457] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.GED.PSCN],
[    0.073084] ACPI Error: AE_NOT_FOUND, During name lookup/catalog

Root cause was build order and naming: the PSCN handler must be created
under \_SB.GED using a short ACPI 'NameSeg', and referenced elsewhere by its
fully qualified path. The GED device (and PSCN) are now defined before the CPUS
AML, preventing the early lookup failure.

Notes:
  * CPU enumeration remains from MADT (GICC). CPU0 is Enabled; other CPUs
    may be Disabled but Online-Capable.
  * Policy (which CPUs start disabled, later enabled) is administrative
    and not decided by OSPM.

Tested: boot with EDK2/ACPI; no AE_NOT_FOUND for \_SB.GED.PSCN; generic CPU
devices register; sysfs topology group warnings do not occur.

           DSDT.dsl (Not Working)                                                    DSDT.dsl (Working)
           ---------------------                                                     ------------------

DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)        DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
{                                                                        {
    Scope (\_SB)                                                             Scope (\_SB)
    {                                                                        {
        Scope (_SB)                                                              Device (\_SB.GED)
        {                                                                        {
            Device (\_SB.CPUR)                                                       Name (_HID, "ACPI0013"
            {                                                                        Name (_UID, "GED")
	    [...]                                                                    Name (_CRS, ResourceTemplate ()
            Device (\_SB.CPUS)                                                 	     [...]
            {                                                                        Method (_EVT, 1, Serialized)
                Name (_HID, "ACPI0010")                                              {
                Name (_CID, EisaId ("PNP0A05"))                                          Local0 = ESEL /* \_SB_.GED_.ESEL */
                Method (CTFY, 2, NotSerialized)                                          If (((Local0 & 0x02) == 0x02))
                {	                                                                 {
	    [...]                                                                             Notify (PWRB, 0x80)
                Method (CSTA, 1, Serialized)                                             }
                {
	    [...]                                                                        If (((Local0 & 0x08) == 0x08))
                Method (CEJ0, 1, Serialized)                                             {
                {                                                                            \_SB.GED.PSCN ()
	    [...]                                                                        }
                Method (CSCN, 0, Serialized)                                         }
                {                                                                }
	    [...]
                Method (COST, 4, Serialized)                                     Scope (_SB)
                {			                                         {
	    [...]                                                                    Device (\_SB.CPUR)
                Device (C000)                                                        {
                {		                                                    	  [...]
	    [...]                                                                    Device (\_SB.CPUS)
                Device (C001)                                                        {
                {                                                                         Name (_HID, "ACPI0010")
	    [...]                                                                         Name (_CID, EisaId ("PNP0A05"))
                Device (C002)                                                             Method (CTFY, 2, NotSerialized)
                {		                                                          {
	    [...]                                                                    [...]
                Device (C003)                                                             Method (CSTA, 1, Serialized)
                {                                                                         {
	    [...]                                                                    [...]
                Device (C004)                                                             Method (CEJ0, 1, Serialized)
                {		                                                          {
	    [...]                                                                    [...]
                Device (C005)                                                             Method (CSCN, 0, Serialized)
                {			                                                  {
            }                                                                        [...]
        }                                                                                 Method (COST, 4, Serialized)
                                                                                          {
        Method (\_SB.GED.PSCN, 0, NotSerialized)                                     [...]
        {                                                                                 Device (C000)
            \_SB.CPUS.CSCN ()                                                             {
        }                                                                            [...]
                                                                                          Device (C001)
        Device (COM0)                                                                     {
        {	                                                                     [...]
	    [...]                                                                         Device (C002)
                                                                                          {
        Device (\_SB.GED)                                                            [...]
        {                                                                                 Device (C003)
            Name (_HID, "ACPI0013")                                                       {
            Name (_UID, "GED")                                                       [...]
            Name (_CRS, ResourceTemplate ()                                               Device (C004)
            {	                                                                          {
	    [...]                                                                    [...]
            OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)                        Device (C005)
            Field (EREG, DWordAcc, NoLock, WriteAsZeros)                                  {
            {	                                                                      }
	    [...]                                                                 }

            Method (_EVT, 1, Serialized)                                          Method (\_SB.GED.PSCN, 0, NotSerialized)
            {                                                                     {
                Local0 = ESEL                                                         \_SB.CPUS.CSCN ()
                If (((Local0 & 0x02) == 0x02))                                    }
                {
                    Notify (PWRB, 0x80)                                           Device (COM0)
                }                                                                 {
                                                                                      [...]
                If (((Local0 & 0x08) == 0x08))                               }
                {                                                        }
                    \_SB.GED.PSCN ()
                }
            }
        }

        Device (PWRB)
        {
	    [...]
    }
}

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt-acpi-build.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7c24dd6369..5e5acb3026 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -931,6 +931,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     Aml *scope, *dsdt;
     MachineState *ms = MACHINE(vms);
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
@@ -946,7 +947,30 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, vms);
+    if (vms->acpi_dev) {
+        build_ged_aml(scope, "\\_SB."GED_DEVICE,
+                      HOTPLUG_HANDLER(vms->acpi_dev),
+                      irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
+                      memmap[VIRT_ACPI_GED].base);
+    } else {
+        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
+                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
+    }
+
+    /*
+     * If the machine supports bringing administratively disabled vCPUs
+     * deferred-online under policy, build AML to coordinate the addition and
+     * removal of CPUs gracefully with the OSPM while the VM is running. This
+     * includes events such as device-check, eject-request, ejection (_EJ0),
+     * CPU scan, _OST status reporting, etc.
+     */
+    if (vms->acpi_dev && mc->has_online_capable_cpus) {
+        acpi_build_cpus_aml(scope, memmap[VIRT_ACPI_CPUPS].base, "\\_SB",
+                            AML_GED_EVT_CPUPS_SCAN_METHOD);
+    } else {
+        acpi_dsdt_add_cpus(scope, vms);
+    }
+
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0],
                        (irqmap[VIRT_UART0] + ARM_SPI_BASE), 0);
     if (vms->second_ns_uart_present) {
@@ -961,15 +985,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                          (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
                          0, NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
-    if (vms->acpi_dev) {
-        build_ged_aml(scope, "\\_SB."GED_DEVICE,
-                      HOTPLUG_HANDLER(vms->acpi_dev),
-                      irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
-                      memmap[VIRT_ACPI_GED].base);
-    } else {
-        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
-                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
-    }
 
     if (vms->acpi_dev) {
         uint32_t event = object_property_get_uint(OBJECT(vms->acpi_dev),
-- 
2.34.1


