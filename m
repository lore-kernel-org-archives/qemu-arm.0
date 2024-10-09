Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp596068njl;
        Tue, 8 Oct 2024 20:24:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJI972QqTDGpmS3YlnkyhaNWBmedL9uf7R1HY/NqwFXq6pEcKK8JJuLjqj+m1XA7t0f35exNslf7zVCg==@linaro.org
X-Google-Smtp-Source: AGHT+IEf04bTTf2QqVZgz4czGVy7IdkaweCmM5aqmukRgJUXlTHeO/B8ZIU1AKeOVZhFRJ6WQmiK
X-Received: by 2002:a17:902:f642:b0:20b:7ca4:1f69 with SMTP id d9443c01a7336-20c63708c64mr16455175ad.4.1728444275455;
        Tue, 08 Oct 2024 20:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444275; cv=none;
        d=google.com; s=arc-20240605;
        b=S24mO4xBJlmTuYTsiD/9sdMTxyrz7eDrLR4wSnpuezcOwfEmRlwoHE7T41BS670IfL
         eIYKiAs2dM+SQK3r3muO2+fIxqApNoWysn2CNaOJN8RXBGQRRq71lRC6AUR6Yb16aKlY
         fd2xGbd7XdTYiV0opXaKBZ0tfzLg9edsayE5GwNPBL5tr0mC+HwLFRUCOTyhY7aXD09+
         yh5X/r/i3TftmiockpwtEnUMXgZLyH/+yO17mrSk9Lx1ruZb6bLFT14215MC6TWknZCX
         jTF6bgQ9mbvtaH9GMXrjOwnxvixTsmm0v+YU7bWE+IkLfwMEFSAC8jMTrQa8hp9vK/Gg
         llnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=revuXMrGrRU+Q9rweA+U9wyL4NdSGi+3OW/3A2QTz8o=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=KiHQ0wv3WRsYiimW009m2xOaGiB8VlAcFC6ZTwdzbEWMsGn+b25Q1rJvu1rY4blS4M
         YcA6vd9LuC49bHPh2NBqO7g+7ZGKDzrzyqS2Yc7z7rwyUJpGzt7Jmj+wGbcMdxv2jp3q
         uyx9pFGWd5ZucMgK9VKLk+q/Jb+EY68uLd1ZevYSLhA8YUA5KLCAYNXsIK9PW8S7RKjc
         +SBD+k9o0qIS/mUe8j0cYEromKRzmWJKYLhDMcyul4+gTDF4dgm+EKO03xH6g71OkjXP
         dddnjoKxRZPTDGmi0N1eGD5MlMZGwn4zdB6rTarUmUVhXENeI9K/T0KnylQhNzPcr20I
         wGbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-20c62f4f092si9087225ad.13.2024.10.08.20.24.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdWR12GMz6K6h7;
	Wed,  9 Oct 2024 11:23:15 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BE4D140452;
	Wed,  9 Oct 2024 11:24:31 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:24:12 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 15/33] arm/virt/acpi: Update ACPI DSDT Tbl to include CPUs AML with hotplug support
Date: Wed, 9 Oct 2024 04:17:57 +0100
Message-ID: <20241009031815.250096-16-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 5ADpej+6bqKx

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
