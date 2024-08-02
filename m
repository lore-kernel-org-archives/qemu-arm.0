Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp121877njb;
        Fri, 2 Aug 2024 14:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVYGiefndbQgsfg9VseeCQVrT2+W4JjXyOXxncyQW4/rEufAL8MIBQ5ryvHe0YZhgeZbtEI89P9WysK0SjT6I3/Q0Le8hOF
X-Google-Smtp-Source: AGHT+IEsTDl0vseYyjIWlIhhiSFw6Y7fG1aObwu8wHE96tLCaelDG1n/4JEj5dvgUk1Ktfk2xUi1
X-Received: by 2002:a05:6214:2b95:b0:6b7:a3f3:8b68 with SMTP id 6a1803df08f44-6bb983744d5mr46518596d6.31.1722635069319;
        Fri, 02 Aug 2024 14:44:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722635069; cv=pass;
        d=google.com; s=arc-20160816;
        b=JcBWvrakDLJtiCwptWQtjpboejK7NWKTo8OMiw+SavV0EzRycLEE5sNmgrQhzn4I9P
         amTh5RWBVG9BdLJ35ku/NvuynwImnEw9R2/5197d+Z+2A6LIwbe0j0NR60gc6BFXs1Jy
         g9tOHhjGAhbsuGiow8iVchTlKdH/qGbP+U7XcgA+CfmlglZC3CtdMB5hy/4m1c9zFwLT
         /ciZGn2xzbfMorZ3zy73Odjk/BgNif4QDzLZ+nvxVzuYY54W4Vug9hPq+zwlYmPv3EA8
         J91EzxMWuhhk1P+GvxWNmkBEXpRD7bKTFNxxz9d2Ew7uropQRONHypC+MK+dK/0eh/79
         hfXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=P1SacoitElzihLn3U/AA/Q+z97cb6cz3bVc8ngbbKVQ=;
        fh=Vn4UyuGjVUHCERUv++4wbTHvu1kw1xogaN+sH5GZFr0=;
        b=EqpisGZ31eUd5vE1QzzFD0QZvtxWSlhjUALY1ElOqSXuOs7MQWJMjquDbwrmytDKUM
         er5kkvEGa58b2m++svHpil/O67ulM1Ba9JRxnEo0ahp3Qn6hvkPp3HvXvkW6oRWAOIF4
         1cNuF2/pISIXKjF/Y79+fuja7gfDZzw3VL9w2mPluOiOfDBPqamw8OSqlVxVIWEMYn8H
         Hq7FywCYr3PPhpUoZm77/Hcg+BAH8bf+ksq9FODEeYPr9TGJN4sjLQnel4HSHbuAsjvP
         /Y/0Xjbwt5FCSM2YogF1Z0VJV16VAAEBnH9kd7H1xroZj2yZRzutuGV7AVgJN/1/Db2M
         mB6A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=P+GR71yS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-273170-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-273170-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-273170-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c86c7f8si28807746d6.337.2024.08.02.14.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 14:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-273170-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=P+GR71yS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-273170-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-273170-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D56C1C21739
	for <alex.bennee@linaro.org>; Fri,  2 Aug 2024 21:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A876132106;
	Fri,  2 Aug 2024 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+GR71yS"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1866E73446
	for <linux-kernel@vger.kernel.org>; Fri,  2 Aug 2024 21:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635064; cv=none; b=NAntT0xYgc/sytAip/laEbuBBfVub9eax7bB9mQDoRpNOsD/XUxgu8JBa/VChla1LCTrTWnmfUVOK5JU4+rpR1nmd3Vpw+cXEkJXl/ivhEllM1xtu9Kmcmr1MRXS+w5iIqNOnFEDLz2IZ7nab9JOp8hM76Dpz2J2TW+kH9J1OVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635064; c=relaxed/simple;
	bh=oBrmRMT6eVkZhSBwJ/tCQXBFfP8uBbfVpOcor3ldlVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZjOLdtM/r8wmpdI40eVl35Sr7mJxLwoCaG2hBgDmUaBXb4hn0r0zQncmr5d+Y0sxvXBGsFiM7einZQ+mYaEPjkdK7MOJn6w1orcOzdzX2ztGTCZCSXDbuHaP3MHQbbUMZp42MkwnzTyWKWKbuV7R5Ph2weS0hKAxlAPH3a98r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+GR71yS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9E5C4AF09;
	Fri,  2 Aug 2024 21:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722635063;
	bh=oBrmRMT6eVkZhSBwJ/tCQXBFfP8uBbfVpOcor3ldlVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P+GR71ySO4elhXHLcBnJY5xs7O1P+RAm2L5b5NPqDn/+LOJAXp6bzkLZduF/0HWBO
	 IqpYVcn2/bexTq+s1risYu7u9OKAx247lEgTkyV1YYKHpRy5wY0WnvKqpCObnezwiR
	 YQnn9aNIBdYbXJnuMElohcL6mMS9DnzjdnLjyx0nx8FFnhbkpmQ2FkxJ5ewlU4m228
	 pc6VHXb3zm9Zr/D2K+HwRKDIwIiCO0PWA02eFLqE8Grtzyl1YhAPm44yHLuRQOpdnA
	 1RQSD9G1fTlOtWsBoHlv9QR8D1iNqVKDC5Lb2bSTMMusUT+303X1p/pB9naf1niVD1
	 2WZ93wpP1Zicw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sa04T-00000002naJ-2sEj;
	Fri, 02 Aug 2024 23:44:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 3/7] arm/virt: Wire up GPIO error source for ACPI / GHES
Date: Fri,  2 Aug 2024 23:43:58 +0200
Message-ID: <d0607d8f6116ff841b6c6a17d20f6d7077063045.1722634602.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722634602.git.mchehab+huawei@kernel.org>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: L8P6khz34Ekq

Adds support to ARM virtualization to allow handling
a General Purpose Event (GPE) via GED error device.

It is aligned with Linux Kernel patch:
https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/

Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c           |  3 +++
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 16 +++++++++++++++-
 include/hw/acpi/ghes.h   |  3 +++
 include/hw/arm/virt.h    |  1 +
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..8d0262e6c1aa 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -444,6 +444,9 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     return ret;
 }
 
+NotifierList generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 bool acpi_ghes_present(void)
 {
     AcpiGedState *acpi_ged_state;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f76fb117adff..f8bbe3e7a0b8 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -858,6 +858,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    acpi_dsdt_add_error_device(scope);
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 687fe0bb8bc9..8b315328154f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -73,6 +73,7 @@
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/ghes.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
@@ -677,7 +678,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -1009,6 +1010,15 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
+static void virt_generic_error_req(Notifier *n, void *opaque)
+{
+    VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
+
+    if (s->acpi_dev) {
+        acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
+    }
+}
+
 static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
@@ -2397,6 +2407,10 @@ static void machvirt_init(MachineState *machine)
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
 
+     vms->generic_error_notifier.notify = virt_generic_error_req;
+     notifier_list_add(&generic_error_notifiers,
+                       &vms->generic_error_notifier);
+
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..6891eafff5ab 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -23,6 +23,9 @@
 #define ACPI_GHES_H
 
 #include "hw/acpi/bios-linker-loader.h"
+#include "qemu/notify.h"
+
+extern NotifierList generic_error_notifiers;
 
 /*
  * Values for Hardware Error Notification Type field
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index a4d937ed45ac..ad9f6e94dcc5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -175,6 +175,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    Notifier generic_error_notifier;
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
-- 
2.45.2

