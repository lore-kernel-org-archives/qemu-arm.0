Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2338842njb;
        Tue, 15 Oct 2024 03:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWS8Z4TYABXyAjenBy2d/hDUgtEE9SyfRr7urWG6kC+hCeWHaC353dFlUHNdHHd37iv2dKYH/HFDIJ6/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFSV1kK1awvqJVZXkYiUy0MBhh8ibbpgN70EZq5qolVFLfmBOt31pkiO3KuzecQhhDSloXO
X-Received: by 2002:a05:6512:4289:b0:539:ddf1:ac6f with SMTP id 2adb3069b0e04-539ddf23e40mr5628236e87.46.1728986725422;
        Tue, 15 Oct 2024 03:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986725; cv=none;
        d=google.com; s=arc-20240605;
        b=fPnpNBOCkmcos9cZjxrhUYrYePmVkpCpdDprx5r0UwYDb3Xwv5YkFheNwXEGoZX6iO
         39GNmUa6Z0mpN98SM+keRqmnVhcpa2DN3G+gl2w5HuuERvUl6TRR1f05Ed/j0j4NKahY
         B5fyy9g5YMMrq6NDw2kF0nLShxDAO8Zue4/J4Um1dtBndRsol+y0GpIVv4w8XFxpFfvJ
         8wamuVHvXmlyMqrHDRR/bZcxgzk4zfuiH9YcF4smvRNHFQ2TvpBJnqlfnbQrPt+GkU6O
         r5gwokaEc7ZwtKwGCKD/WBFeDU8zuAt6+u6Ex7eqgmDJPuLWVOlgHI8T3aTkauyejWlx
         NxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=revuXMrGrRU+Q9rweA+U9wyL4NdSGi+3OW/3A2QTz8o=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=jY1Enl5s2SyEbBGP9ry1ZOP5ZfVUYKH7nXAMWpPZ648Hpyt1JJafIKJOtDlnX+XqtN
         YkfXSfocEvZpd4RH3Cg32HyoxHaIWVRtt7wYaGeL1M9iipf/qodJDlzyN+O3qkh9piD2
         kXtl1OsokHCTdGpjyagYbGiFNE0iHElPts3fjIKZWCWXkuKuTslebHVIDelqGNkfrnu4
         x1WM4RksjbUx79QyGEaHfRRDoYG92oE1vllZ3mkCeXlUrDj6IxqyNZjEh945MXZgMfvb
         iNRzAM2/fc8S1f+bApVqC32dqCSqSuSlKuyQ0J7iXAmWJTixk5aym+IuYejNIskq6ZSO
         WY0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fc06808si508658f8f.234.2024.10.15.03.05.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV6q1D5xz6FGpc;
	Tue, 15 Oct 2024 18:03:47 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 5FA4A140A34;
	Tue, 15 Oct 2024 18:05:24 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:05:04 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 13/30] arm/virt/acpi: Update ACPI DSDT Tbl to include CPUs AML with hotplug support
Date: Tue, 15 Oct 2024 10:59:55 +0100
Message-ID: <20241015100012.254223-14-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: FWtc5AS35/yQ

Support for Virtual CPU Hotplug requires a sequence of ACPI handshakes between
QEMU and the guest kernel when a vCPU is plugged or unplugged. Most of the AML
code to support these handshakes already exists. This AML needs to be built
during VM initialization for the ARM architecture as well, if GED support
exists.

TODO (Peculiar Problem with AML):
Encountering the following ACPI namespace error when the GED AML is placed after
the CPU AML.

Error excerpt:
[   75.795774] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.GED.CSCN],
[   75.797237] ACPI Error: Aborting method \_SB.GED._EVT due to previous error
[   75.798530] acpi-ged ACPI0013:00: IRQ method execution failed

Preliminary analysis:
The error is definitely not related to a `forward declaration` issue but rather
to associating the `CSCN` (CPU Scan event handler) method with the `GED` scope
before the `\\_SB.GED` scope is created. Therefore, it appears that the GED AML
should be initialized prior to the CPU AML.

As a result, I had to move the GED AML before the CPU AML to resolve the issue.
Everything about the two AML sections seems identical, except for their
location. Any insights?

==============================
Summary comparison of DSDT.dsl
==============================
[1] Both working and not working DSDT.dsl Files are placed at below path:
    https://drive.google.com/drive/folders/1bbEvS18CtBn3vYFnGIVdgcSD_hggyODV?usp=drive_link
[2] Configuration: -smp cpu 4, maxcpus 6

           DSDT.dsl (Not Working)                                                    DSDT.dsl (Working)
           ---------------------                                                     ------------------

DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)        DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
{                                                                        {
    Scope (\_SB)                                                             Scope (\_SB)
    {                                                                        {
        Scope (_SB)                                                              Device (\_SB.GED)
        {                                                                        {
            Device (\_SB.PRES)                                                       Name (_HID, "ACPI0013"
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
                {                                                                            \_SB.GED.CSCN ()
	    [...]                                                                        }
                Method (CSCN, 0, Serialized)                                         }
                {                                                                }
	    [...]
                Method (COST, 4, Serialized)                                     Scope (_SB)
                {			                                         {
	    [...]                                                                    Device (\_SB.PRES)
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
        Method (\_SB.GED.CSCN, 0, NotSerialized)                                     [...]
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

            Method (_EVT, 1, Serialized)                                          Method (\_SB.GED.CSCN, 0, NotSerialized)
            {                                                                     {
                Local0 = ESEL                                                         \_SB.CPUS.CSCN ()
                If (((Local0 & 0x02) == 0x02))                                    }
                {
                    Notify (PWRB, 0x80)                                           Device (COM0)
                }                                                                 {
                                                                                      [...]
                If (((Local0 & 0x08) == 0x08))                               }
                {                                                        }
                    \_SB.GED.CSCN ()
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
 hw/arm/virt-acpi-build.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f76fb117ad..32238170ab 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -805,6 +805,7 @@ static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
     Aml *scope, *dsdt;
     MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
@@ -821,7 +822,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+    /* if GED is enabled then cpus AML shall be added as part build_cpus_aml */
+    if (vms->acpi_dev && mc->has_hotpluggable_cpus) {
+        CPUHotplugFeatures opts = {
+            .acpi_1_compatible = false,
+            .has_legacy_cphp = false
+        };
+
+        build_cpus_aml(scope, ms, opts, NULL, memmap[VIRT_CPUHP_ACPI].base,
+                       "\\_SB", AML_GED_EVT_CPU_SCAN_METHOD, AML_SYSTEM_MEMORY);
+    } else {
+        acpi_dsdt_add_cpus(scope, vms);
+    }
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0],
                        (irqmap[VIRT_UART0] + ARM_SPI_BASE), 0);
     if (vms->second_ns_uart_present) {
@@ -836,15 +858,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
