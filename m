Received: by 10.182.158.201 with SMTP id ww9csp359271obb;
        Mon, 16 Nov 2015 14:03:08 -0800 (PST)
X-Received: by 10.31.164.216 with SMTP id n207mr151844vke.36.1447711387692;
        Mon, 16 Nov 2015 14:03:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p16si132500vkp.10.2015.11.16.14.03.07
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 14:03:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:50372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyRrf-0003hV-B6
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 17:03:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJl9-0008T1-MC
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJl6-0007n5-Ih
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:51 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:34412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJl6-0007mN-D6
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:48 -0500
Received: by wmvv187 with SMTP id v187so176081215wmv.1
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i9ZMuJrLgHq1QsnJptaseFD09FJP/4n4RGdpXEKjyW4=;
	b=F6ajc2DPSfZgSsWsAxNq69uLA89AMcMxGvYoW7VTTHKNzpMjm/9YEjMGNQS6hajmdo
	KfVh3B6UkzgE3hWBfRJQ7etfzdHFqmUJCU4YfSUNhUrgjW4adz6qyLvRcar9RPHNPZ0J
	+EwR4navqpZq6t7lpHX2gh03jm0Ixe9bTnLSp1y3PgKnfQt7rUoRdmi0DItOzIgp94iy
	VzRIXDpkg3Jrle7vS1yHKOLY3vxAOoOXD2MzyFG/tcSYrbBl4uOVJq9X7hx1M0gwREGM
	zpYZD4zU0hdjk1gLnv63rwal3MP1NMdMk9tRpRp18F/41CqyKzaPByEJfl/uG2opgfV6
	OIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i9ZMuJrLgHq1QsnJptaseFD09FJP/4n4RGdpXEKjyW4=;
	b=PSbkLIIhvCuUOGXmlWAGAZJE1bsT8owDXeUW6v92hxjSfWcJeRYxeO+9x5o0bubZBD
	qV0fUtJaj85L2PjTDm/ZyN38lONR8qzeOlTDuPZSe6AuvkL0IsGO6ch+S1Ghbl9gtvnN
	w9TSog2aaR6q3t6tKpm1nLWRgYeaU6Ku6xEikuxGgwzU7PcyAnL4Pi5ezlK4JBBCrOnE
	h4SmS99uEjrTGQ5p99N8vNfFKc7kWOEdmKFR/ZVDvX8PMNUvqF7gjFz5lu12Wd+DOFnu
	9Avj1ZTDBxIlRSp5mu0zOyjm72Z1e2er5oI9pVjQTo/yEgUg4GHut+AZZc/KjT2fJ0yA
	63Ng==
X-Gm-Message-State: ALoCoQkwPyatCOJjEvb5JFcbiTbeROnofmHLptFwyXVe1oZAuG7xPi36a/jirmPlBqK++dPjgQWX
X-Received: by 10.194.89.135 with SMTP id bo7mr42509760wjb.147.1447680227876; 
	Mon, 16 Nov 2015 05:23:47 -0800 (PST)
Received: from localhost ([78.129.130.236]) by smtp.gmail.com with ESMTPSA id
	q1sm34524745wje.39.2015.11.16.05.23.45
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:23:47 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:03 +0800
Message-Id: <1447680189-2128-3-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::234
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 2/8] hw/arm/virt-acpi-build: Add GPIO
	controller in ACPI DSDT table
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KGCM+hGMoYcr

From: Shannon Zhao <shannon.zhao@linaro.org>

Add GPIO controller in ACPI DSDT table. It can be used for gpio event.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt-acpi-build.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3c2c5d6..bf6b934 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -323,6 +323,23 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
+                                           int gpio_irq)
+{
+    Aml *dev = aml_device("GPO0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
+    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(gpio_memmap->base, gpio_memmap->size,
+                                       AML_READ_WRITE));
+    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                  AML_EXCLUSIVE, gpio_irq));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 /* RSDP */
 static GArray *
 build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
@@ -539,6 +556,8 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
                       guest_info->use_highmem);
+    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
+                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
 
     aml_append(dsdt, scope);
 
-- 
2.1.0

