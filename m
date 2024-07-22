Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1739547njc;
        Sun, 21 Jul 2024 23:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUrPpMHp0YURy3gA4YPuStdjZmzmgKwa/MCYwAexOglEA8HsAOkwD13nzsFJ3vifjlSzYxrfzfZGxyiCdJVJc3n2Iuf+NNM
X-Google-Smtp-Source: AGHT+IF/Qk8V5eLTv2Cb7AIfsBHFZupou+hFeGJxmLiMmxyuiTYsO4oAC9zPSu8ESs+T5Mgwsz/4
X-Received: by 2002:a17:90b:70e:b0:2c9:63e9:845b with SMTP id 98e67ed59e1d1-2cd273d4a14mr2634737a91.9.1721630787219;
        Sun, 21 Jul 2024 23:46:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721630787; cv=pass;
        d=google.com; s=arc-20160816;
        b=nqKrpMy2Cgk6AQ2wmesK9nGRZfH7Atsre8s2AxDnXzfoPhvCJUIBazSqGI3kTlwG6K
         LcXeJVwZMpz/QDz89655UiQNd0C3oaAzELQKGbqdlLqjucFRjt0QgVwHbfaMGVKnfZ7v
         Xoo8KOXx3Xartzlg9duoNdEBwTr55EcJSYpOMAn6FFT8uiACczF8jOJoKpqlftQUOvjl
         l0pZR4U64xg5DBUCeOS/WD8N6fnOim/4KLeSzriV0VT/q5WE+XU8Iue+Ty6wrqIijz4k
         xY9k3F7Pq1K09BpfuRjK0NsV9YB3MD/UnnGDp6TygVphZoiAgEOKEDf+nPgIz0YBrfE8
         xyRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=MQ77F8l1Gt/Gmy0Gnzd+lWaNfaxVpCvy+aB7r6YEROI=;
        fh=/B7EtmmS+KbblsW2oOjxxHq2tjTn4QfIwwPQ3mQ0L/E=;
        b=gRqaJT5aqth+znxPLVWFNs28cY0yJdM4cumD3bMl3pOtY3OnGtrxa1aCYrHXnoWsEE
         HNtzs18hqEIC211M62MRAztrDQTp33ql3J0DNQpp4I97blseNzydqKk3Qqi6LR38kXME
         YFLU6nU5D4bA6JmjOOqsPhRhiFUOiDLDCea+krHBKZDfh6Y6Gtf7Jk6ZD6ZJVpPDTjW3
         MNbVNVhXOpKgVcJCbpNHA8b7cJPtYRbm5uY6aqlgUEJ8HA+TWPnD+hkNTfG6yblPW6XT
         Azmqb2a225NSfkWwQZbZqWuN0cl+236JqnrnhvvUK2XXiuPMn9wRy81Sns+A6yEfEC+5
         veoA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JME1cRyt;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258516-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258516-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-258516-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2cb7755bd92si8209947a91.158.2024.07.21.23.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-258516-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JME1cRyt;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258516-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258516-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD0D280E81
	for <alex.bennee@linaro.org>; Mon, 22 Jul 2024 06:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFA4199B8;
	Mon, 22 Jul 2024 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JME1cRyt"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4A1803D
	for <linux-kernel@vger.kernel.org>; Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721630776; cv=none; b=hEzw7fkJEX04w11ltbXHXIU0RBtmKUZ2xWa6U3SzGqLWshSr/wACwGyedDboCt7Y8WMXxMjd2+s5BgbWWind6qtrtpGndG9Q0tTqVD6cx5aUSvsaP0dmcM9kvzab2hmi4w+xfxucr3zSyWH1Nn4j9Ak4OxV0Qr7AVl0j/NEQmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721630776; c=relaxed/simple;
	bh=5TngikYjgFjtcp97UwnkMRJH/Pu5HAa83aYM1pizKYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSvA51IHJe6MUaKza521keb80D5i3ccV0+tZNs1tMtHLUvDugl+0ptS8O/72eq8+ZzmoHbiQOYaWqESWTov3OR34EejP35DItoK1bzya78gqebgYO/ECkjgUwGaxCS6rEzkG2/e1nhDI+GxtE/Wqhz9sy2Y847Zff4fGBNKsn3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JME1cRyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371C8C4AF0F;
	Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721630776;
	bh=5TngikYjgFjtcp97UwnkMRJH/Pu5HAa83aYM1pizKYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JME1cRyticsFJaOFrO2Q2tqUVQNKYgdy4qoFAuD0Vb4Jri5g79d8Hu0QCbI16ayng
	 SxeOl7v3x5RoomOsxFXlF4UPQ40LwPGISGY398inb23j7RSjlVCGY49IDWf61uC6VH
	 m5pwD6VBpbJ4uG0jQMlcP5/Z5A7tZouD75pU30qFSPuYnNd8WXoqC8mmbtec+vVWgt
	 VJzhxVnOj/V0zlAYn230VWtCZvVF7GTJOwu2abQYoYBwYb5GTefh0iSRjhPXoLpAek
	 PJhMjlTvU4XK763sEK0Xrclu5dKbEnRgnC3Ihxh+x3szY4XXsqFJLecFMIvNZluCoT
	 lfbzb1JNoACbA==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sVmoI-00000000WQl-0vYS;
	Mon, 22 Jul 2024 08:46:14 +0200
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
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 2/7] arm/virt: Wire up GPIO error source for ACPI / GHES
Date: Mon, 22 Jul 2024 08:45:54 +0200
Message-ID: <034a7e86761e09996001394c98ffb8201ac52cd2.1721630625.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Kw1N1fsMSiNt

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Creates a GED - Generic Event Device and set a GPIO to
be used or error injection.

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
index c99c8b1713c6..f81cf3a69961 100644
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
 
+    mc->set_error = virt_set_error;
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

