Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1784089njb;
        Mon, 29 Jul 2024 06:21:32 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXgg1E/6r+4ovfPKiTuthn1kfTQhDoEfGCmN3wGPON51YYedGEYfXLc8/c5XRzpOBDkvZge5W3sQ5RlAitmLrwmNnBU9BmC
X-Google-Smtp-Source: AGHT+IEGDjoC2sdCq+fk4b2YlCMeAZlvCzIOnEacCQNJQoqEiIZj8HYc3/RXmNDtQ8zghTs0WaKn
X-Received: by 2002:a05:6e02:1aa6:b0:375:deb0:4c28 with SMTP id e9e14a558f8ab-39aec25e700mr73443845ab.6.1722259292663;
        Mon, 29 Jul 2024 06:21:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722259292; cv=pass;
        d=google.com; s=arc-20160816;
        b=pK4uvW/wOol4GghZpoJzg3VQVuhlC0EAZOopSuMnu6s2Teurs5hS73uDwgc07OPU33
         PqwGR/+MyOusJy51wM4cExP916C0UUiHyx3rMpHjt35+W5AgPdnGj2lYm2t/Te8Cty7s
         +9qBSh46W9Ch+MA/aZHuEZC8gsrhJ9wH3lHXWafb5U/7i9xrf4V9jkHJNo1pH9fsFa58
         HZQzUtU/CC+FyWcKd94JBvPfu3JIstesKi42lCzk1sRAaZAKXBWAP4bNeReVwOSPRV+t
         5ESbkkQ4o+H23szTulotEXZIZYRdt93U6s3NO5NRVk2HG7UkEK62s85/2jFIEe/6smkx
         p1Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=md7+OpX+0CeMFlHTQ/mtmkDxWU/47zk90Zn2B+5vwBA=;
        fh=Ebf3hIw4ixJFxwynFhzcEZmmieDh/B35ZMo227uL8gI=;
        b=TWyfqvUeoCfiMMFUQOqB3n5MGU2zWoOkW9l1cFeOMWgOeVvWycI8NSd2UkzvMWfD/h
         gQ9H6btoJe7bxGzYO3VjWlDkGsCbMFw/tx0XKmpIN01g4pxLTVAXCBSgHovzOH2TH7b5
         iNUSXtN82NdFmhHizLtdmzmHUMGiN3X8gmbxPUu/SGqwzInKlUCHYYQsM/lUOuYdLjUE
         nfU9jSLEUspoOSfyKrCtFniZWAnFrMVB8UqdnHRnQhXTLhrIqLOjJJW3/RUXrJY6LcQI
         gYzBg16qNqq3EcG08kuDM5E+To7M7gjLDPe6DGAnQC1oD1527oa9wjcArG54s9D5cV6N
         AEUg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lO29EFCs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265835-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265835-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-265835-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7a9f69dd8a3si9944151a12.242.2024.07.29.06.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-265835-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lO29EFCs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265835-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265835-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24409281287
	for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 13:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F182614D2BD;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lO29EFCs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4572149E09
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259281; cv=none; b=KEEbtjkf3hEz18xF7HPKlFpVER3UTTegA83kGQNO6RtebcIIyvCrvDM55uUTXZaGOD3w27+3Fkr34pRIS5wGSlptzf1hlavMcJ9IHCPy1aZdKkg489Nmo92HTv8hB70g+NwWjcr4oG0FEFlXa5fTIjo1/eEeGv+davBTVczDOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259281; c=relaxed/simple;
	bh=ZmUcBX7E8B/FtThp/dlCrriTKw6Fu3RSM8dN6Q3edOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4GNth+T520Pl8qD8XQAVPQ35qKB3MBy5l/CBVoXEHU7OhiYFGeU669jg7994H865H3HGaSltGE09HasJBCGHThWJEzSCUxLBNOtS7esRd4gpT4ehEwtd6BbYO3uMw7Vk+zUWK5oHtpWab8OUPG05nYZQuoGxDxhjdT6ActVsSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lO29EFCs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9C7C4AF11;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722259281;
	bh=ZmUcBX7E8B/FtThp/dlCrriTKw6Fu3RSM8dN6Q3edOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lO29EFCssrrjVjc4aIvEdDJUCx++CmAd+/Fw7bDr7Q/ekp5/W9AX0Xx/tX54fcr2k
	 5+In8rcGJ08aRdvjqvTjt/eukGO+P5MSaEfzj5QlYIpivSK7l5PcixeKXUC/eN+RUy
	 z+lN4x2/GxUYFPAsqr3STWvcPdeavnraZonOL4sK4CCoIpqBiw8wkpKuAjpCbAvRDn
	 2uNVoL05hPKgdcQGgskgX+bEE45OaSfceKrBcN28RCc/HpGVa1vqHUwGwVQeql5YEV
	 gmR9EIp9Wf7khPTuP9gno61MLO62sbM0OqHNFesjfqcRSdLiVuxZDk0YUKJqcj6nMZ
	 mE5ejrJS1EIjQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sYQJT-000000030VW-0Oxr;
	Mon, 29 Jul 2024 15:21:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 2/6] arm/virt: Wire up GPIO error source for ACPI / GHES
Date: Mon, 29 Jul 2024 15:21:06 +0200
Message-ID: <e994c3944d31775d62bbd017dec3adff50ddf269.1722259246.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722259246.git.mchehab+huawei@kernel.org>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 8Wx9vbRlvdJv

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Creates a Generic Event Device (GED) as specified at
ACPI 6.5 specification at 18.3.2.7.2:
https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event-notification-for-generic-error-sources
with HID PNP0C33.

The PNP0C33 device is used to report hardware errors to
the bios via ACPI APEI Generic Hardware Error Source (GHES).

It is aligned with Linux Kernel patch:
https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/

[mchehab: use a define for the generic event pin number and do some cleanups]
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/arm/virt-acpi-build.c | 30 ++++++++++++++++++++++++++----
 hw/arm/virt.c            | 14 ++++++++++++--
 include/hw/arm/virt.h    |  1 +
 include/hw/boards.h      |  1 +
 4 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f76fb117adff..c502ccf40909 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -63,6 +63,7 @@
 
 #define ARM_SPI_BASE 32
 
+#define ACPI_GENERIC_EVENT_DEVICE "GEDD"
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
 static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
@@ -142,6 +143,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
 static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
                                            uint32_t gpio_irq)
 {
+    uint32_t pin;
+
     Aml *dev = aml_device("GPO0");
     aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
@@ -155,7 +158,12 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
 
     Aml *aei = aml_resource_template();
 
-    const uint32_t pin = GPIO_PIN_POWER_BUTTON;
+    pin = GPIO_PIN_POWER_BUTTON;
+    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
+                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
+                                 "GPO0", NULL, 0));
+    /* Pin for generic error */
+    pin = GPIO_PIN_GENERIC_ERROR;
     aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
                                  AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
                                  "GPO0", NULL, 0));
@@ -166,6 +174,11 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
                                   aml_int(0x80)));
     aml_append(dev, method);
+    method = aml_method("_E06", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_notify(aml_name(ACPI_GENERIC_EVENT_DEVICE),
+                                  aml_int(0x80)));
+    aml_append(dev, method);
+
     aml_append(scope, dev);
 }
 
@@ -800,6 +813,15 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
     build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
 }
 
+static void acpi_dsdt_add_generic_event_device(Aml *scope)
+{
+    Aml *dev = aml_device(ACPI_GENERIC_EVENT_DEVICE);
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C33")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
+    aml_append(scope, dev);
+}
+
 /* DSDT */
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -841,10 +863,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                       HOTPLUG_HANDLER(vms->acpi_dev),
                       irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
                       memmap[VIRT_ACPI_GED].base);
-    } else {
-        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
-                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     }
+    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
+                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
 
     if (vms->acpi_dev) {
         uint32_t event = object_property_get_uint(OBJECT(vms->acpi_dev),
@@ -858,6 +879,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    acpi_dsdt_add_generic_event_device(scope);
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 687fe0bb8bc9..5a11691f29f6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -997,6 +997,13 @@ static void create_rtc(const VirtMachineState *vms)
 }
 
 static DeviceState *gpio_key_dev;
+
+static DeviceState *gpio_error_dev;
+static void virt_set_error(void)
+{
+    qemu_set_irq(qdev_get_gpio_in(gpio_error_dev, 0), 1);
+}
+
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
     VirtMachineState *s = container_of(n, VirtMachineState, powerdown_notifier);
@@ -1015,6 +1022,9 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
                                         qdev_get_gpio_in(pl061_dev,
                                                          GPIO_PIN_POWER_BUTTON));
+    gpio_error_dev = sysbus_create_simple("gpio-key", -1,
+                                          qdev_get_gpio_in(pl061_dev,
+                                                           GPIO_PIN_GENERIC_ERROR));
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
@@ -2385,9 +2395,8 @@ static void machvirt_init(MachineState *machine)
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
-    } else {
-        create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
+    create_gpio_devices(vms, VIRT_GPIO, sysmem);
 
     if (vms->secure && !vmc->no_secure_gpio) {
         create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
@@ -3101,6 +3110,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "mach-virt.ram";
     mc->default_nic = "virtio-net-pci";
 
+    mc->generic_error_device_notify = virt_set_error;
     object_class_property_add(oc, "acpi", "OnOffAuto",
         virt_get_acpi, virt_set_acpi,
         NULL, NULL);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index a4d937ed45ac..c9769d7d4d7f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -49,6 +49,7 @@
 
 /* GPIO pins */
 #define GPIO_PIN_POWER_BUTTON  3
+#define GPIO_PIN_GENERIC_ERROR 6
 
 enum {
     VIRT_FLASH,
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 48ff6d8b93f7..991f99138e57 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -308,6 +308,7 @@ struct MachineClass {
     int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
     ram_addr_t (*fixup_ram_size)(ram_addr_t size);
     uint64_t smbios_memory_device_size;
+    void (*generic_error_device_notify)(void);
 };
 
 /**
-- 
2.45.2

