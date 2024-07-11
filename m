Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp57346nji;
        Thu, 11 Jul 2024 02:52:29 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWIEYwOhJYJu8/oQqT5ozqzUR4R9zqECrTQ9TWRhnwpQ5fG/gCXUaJaym5Ur0cEc9WB/2XNLTHCnMZ8I8qUMDCLhdsALweX
X-Google-Smtp-Source: AGHT+IE51QEYDYQyWI23mbf16RIs0Z6rEwnzpVg6L2AKWqqIq2BdaF+ChtHA2KlFkafVRgbTUklw
X-Received: by 2002:a2e:8297:0:b0:2ec:6639:120a with SMTP id 38308e7fff4ca-2eeb30bbb0fmr54014201fa.10.1720691548787;
        Thu, 11 Jul 2024 02:52:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720691548; cv=pass;
        d=google.com; s=arc-20160816;
        b=uJU962Mt/hUnhvYSU1IHzzzSZ+iiD552Y7QFPQsUjoj2NpN41KeJM2XzxEFQcYHZdI
         lTnYE1wqxJ04wzmy/+v3j181rpxVXDhv16axl/Qg+djoVd6IvdvbkB1Ixyut2Ud5mBON
         xjhAQt72dqU3tYDTpC3CJwQzyGmr6a90m5Qk/IMvsNxoHIro1O8HTgdajjxduPfYV+iA
         5z/3l01aW4vbciRkUKcf8wh0JyHHSVhic+hw1FzOOzWGyLQYZx2RDijbtKG4tQambvlI
         4lGHrzM+BF/Z6mG8G+b3wqqLpxZrFGrqQ6X/4CeRxyWwmGfNa5sKO/rDYPVXqFlloSaV
         qoog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=3MQ3rnibaeJidCq07HUDpwZxpuFEpNAKEB4+n2AF0iw=;
        fh=yooRKJ48XxtKHfLJqZixBJLhyGsz9vmTj7RbqfBFoBg=;
        b=PhLvwiRbPmzc41D4xy2LoIPuD6qL/6QTt+APup5mAAVuIsAe5kYLYDjXt04fI8nQiz
         ayP0Ukcr/62hdmzTgzpNxmnGM1IOEYqUqiRVbawa6epKAQoJjkMXiJ0m3BSiLqYHyYx0
         TNZuAvTlFHzDIcg+C/BUfkHnw22pLqnu+c080LdrHA+d5gwJ4JWoZlJNHffkCC3//KmF
         R3yzd2haSipqDPsGWKtwZusuHNjbTjPNZl93Q9vXs9vBWRy2Kt54s4kXGr0DsBS8ZF9U
         TfY/VbhU10Ep7cxgepirIyniZeQhvizsOK/iaV3doDXyWFdZYnqH1zXBi39U6d2XJWui
         o7mQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=qe4YXY+v;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248917-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248917-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-248917-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-594bdf56092si3013055a12.441.2024.07.11.02.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-248917-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=qe4YXY+v;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248917-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248917-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6A041F217BB
	for <alex.bennee@linaro.org>; Thu, 11 Jul 2024 09:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2704C157491;
	Thu, 11 Jul 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qe4YXY+v"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B515572D
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691540; cv=none; b=qdfFrtSkm6sW98ngij1dAsba80NSzs0haxUbIlaVXxjjsIdX/JV7oL9uot/ya+XbWwg2Y9joxJ4/LumP3fVPUhcXzdxxesv91TQfnAz78a81cVo9h0GRs38Ed6Ux9HrWRo+Df8liM2P38TbtOCEiVSAEHd5UuBkKnqfSOA5ROQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691540; c=relaxed/simple;
	bh=oPxrpTAEvoEtkTNmqS8GMR2oMRzJETZZcVQAB+T3Viw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1MJwKswD1aaPGjqw0UjTha/sGvFMQ6yTufdBxzpnDlp95h1n6EVzej7fiu57bjjEijquLfCZrTgyxv932VBkdkms+p+hSeJYWEVPRR3NjoxT85I8Es+JGFmjYpwcHkew8XuZOJ5GCUNNSot+BBhtbAJdgoAvaMsFf9FjLzZb6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qe4YXY+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B2BC4AF0A;
	Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720691540;
	bh=oPxrpTAEvoEtkTNmqS8GMR2oMRzJETZZcVQAB+T3Viw=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=qe4YXY+v9IEsXJoyvwYfwUUE5tJKEkbkLOSH65iqoHll3BpSa1n9JdaCE6yGg2czm
	 4ZaXWQmb7nmYajK0fgqEZ7ko4rKA58Y0Dk45I+sgGNdIEvm8pBgQfX8nuaj6+UWTP3
	 IBJ3hB1xofkj9jbYj8t7vedwaI39yo852qGykjJ4xyMngYaXg+S35ql4IXVHFEdJ90
	 utSfSwW/bEnheSC4HNv8ZKROe51DU56fKFWlc22Cmwyq+5OLr6DgUdBprWbymrJhHr
	 ndaTGObokLJtD8WE53UWHcn+R0okVvszAZRY/KjXnUigZ7SK0BkxhRO7geDQcPziTA
	 Zbi8T6wMflbrQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab@kernel.org>)
	id 1sRqTK-00000002jZd-2RXJ;
	Thu, 11 Jul 2024 11:52:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	linux-edac@kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 1/6] arm/virt: Wire up GPIO error source for ACPI / GHES
Date: Thu, 11 Jul 2024 11:52:03 +0200
Message-ID: <b9cd4a65d3389102def662a8bc09ffaa622265f7.1720690278.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720690278.git.mchehab+huawei@kernel.org>
References: <cover.1720690278.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: YAUP1dF8D5UV

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Creates a GED - Generic Event Device and set a GPIO to
be used or error injection.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
 hw/arm/virt.c            | 12 +++++++++++-
 include/hw/boards.h      |  1 +
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e10cad86dd73..b6f2e55014a2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -63,6 +63,7 @@
 
 #define ARM_SPI_BASE 32
 
+#define ACPI_GENERIC_EVENT_DEVICE "GEDD"
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
 static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
@@ -155,9 +156,14 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
 
     Aml *aei = aml_resource_template();
     /* Pin 3 for power button */
-    const uint32_t pin_list[1] = {3};
+    uint32_t pin = 3;
     aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
+                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
+                                 "GPO0", NULL, 0));
+    pin = 6;
+    /* Pin 8 for generic error */
+    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
+                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
                                  "GPO0", NULL, 0));
     aml_append(dev, aml_name_decl("_AEI", aei));
 
@@ -166,6 +172,11 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
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
 
@@ -800,6 +811,15 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
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
@@ -842,9 +862,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                       irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
                       memmap[VIRT_ACPI_GED].base);
     } else {
-        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
-                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     }
+    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
+                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
 
     if (vms->acpi_dev) {
         uint32_t event = object_property_get_uint(OBJECT(vms->acpi_dev),
@@ -858,6 +878,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    acpi_dsdt_add_generic_event_device(scope);
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0c68d66a345..874a8612ef2d 100644
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
@@ -1014,6 +1021,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
 {
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
                                         qdev_get_gpio_in(pl061_dev, 3));
+    gpio_error_dev = sysbus_create_simple("gpio-key", -1,
+                                          qdev_get_gpio_in(pl061_dev, 6));
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
@@ -2385,8 +2394,8 @@ static void machvirt_init(MachineState *machine)
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
-        create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
+    create_gpio_devices(vms, VIRT_GPIO, sysmem);
 
     if (vms->secure && !vmc->no_secure_gpio) {
         create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
@@ -3100,6 +3109,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "mach-virt.ram";
     mc->default_nic = "virtio-net-pci";
 
+    mc->set_error = virt_set_error;
     object_class_property_add(oc, "acpi", "OnOffAuto",
         virt_get_acpi, virt_set_acpi,
         NULL, NULL);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index ef6f18f2c1a7..6cf01f3934ae 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -304,6 +304,7 @@ struct MachineClass {
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
     int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
     ram_addr_t (*fixup_ram_size)(ram_addr_t size);
+    void (*set_error)(void);
 };
 
 /**
-- 
2.45.2

