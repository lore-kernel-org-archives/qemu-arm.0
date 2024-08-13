Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp300573njf;
        Tue, 13 Aug 2024 16:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWJq6HG3xay0N0lWAlAFK97qWba0GbxTobWF0zlIqk13SVzwXEOqTDIhByGHLe5YmNzOVD5ZV0IzKDkemF2wHBkGv02yepz
X-Google-Smtp-Source: AGHT+IGBvF19RBPjAPZ77l5yj2pBBpgduiDGzFpzsSxS7cl3H9ZtUJMXVFc7odJH6apEdaKXo2RC
X-Received: by 2002:a17:903:22cb:b0:1fb:8a61:12b0 with SMTP id d9443c01a7336-201d64e82dbmr13322625ad.54.1723591466287;
        Tue, 13 Aug 2024 16:24:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723591466; cv=pass;
        d=google.com; s=arc-20160816;
        b=J+utpbCmn/QJruuJeLqmktv8A3tOrWbbpGotYTsVwyj0tgbPz1wPMjTFiGIq4dHk72
         vIstvt8G1BnGqGgB6OoeWk8AsHi7GQ2nZM9UTF7GELUe/7B/eyEuW1jhPGOq+ImR50kZ
         kMjvUE1avyKafClfTVMHMrbMhLYkP5PR9B7bpeDaeiBAsxyHx1eHyEFwXF140QBpal3C
         fMFIC9SeZdDfynF+KmPmY14kj8OtKVmyWNnB6al/0W+Yn8ef8VU3MlDNEsimGuEdORcR
         rZChSBaZM95eTdQQ/zkX9cht8O+oKsayN4PxotIsAmfOy5Gr/dFac6qXQsnwdzu3mMB5
         z2DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=4cQshYTXn7G7xUbe0YyREwBgCJi77k5puxhj3XWD7jE=;
        fh=Vn4UyuGjVUHCERUv++4wbTHvu1kw1xogaN+sH5GZFr0=;
        b=h4ZD5DcR1/Q+IsrcypaB+nFUi5P3WX48dANshnOHD5WXu79upNThKOME28/8kc/4ez
         iPj4oZNhrGYD33MNfI1B3wyxmMhGQlmFcX8D7emOGYw4ByUSjr3ZA4eVhWVLJPLStWol
         gFJy9A3DTtKL3d7kTQhPXVpovIGBecdqnd6pZUSYrChzdRzeD7i4X5wTf4SsPymm97SR
         5k/5jyRg1yVKEc/sLfhxgYn89/ncFNCVXw7TNd0qmxNeErip4EfHR8cR92LKfIHI0wa4
         Yn74HsvFQJc4QZ3Rhn5Qi3cjDtIi8QBXByIhbmdmjWXKW/G2+RuIE9GRHStyk91saRPz
         J9xg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Atx6KHHt;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285619-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285619-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-285619-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d9443c01a7336-201cd1511fesi27096205ad.177.2024.08.13.16.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-285619-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Atx6KHHt;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285619-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285619-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DA5AB22D79
	for <alex.bennee@linaro.org>; Tue, 13 Aug 2024 23:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE40C1AC432;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Atx6KHHt"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7D1ABED7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591451; cv=none; b=Om+07aXTZTvuVQE2Cn0lYTGZOh1zG75hHH7gXwTpzw6KixVYjCViMttI6Kn4LR6180bTPHIky8zOGhehdgv6cVALsKJFxVuSoGaxX2qaUd48zcCZyinYp1jxNkEhWVBbRQbsv+NYZACks7SXjq3Gd7gWuhSR/ZUEKjPK3976cho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591451; c=relaxed/simple;
	bh=45MNHs7xwOCcf8jbuaI6e0aY9LF+xP8P0gDiRaHXf2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjIZmkqYKY2UTMR0dXtajnCt0DO4EqcpT7TlwlzeCGPortV4a5QXT3F3PK44MxatPfPn5OKP4oo47F1D0n9VgJ8TZaDo5BKaUVJ1XkEqczvsF/s+JkhjPg0kUq4vj/6NcESYgGQ92x8zvXH2Dolx1iPXB/bjQCja/wFGH4U8Hgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Atx6KHHt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4559EC4AF0C;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723591451;
	bh=45MNHs7xwOCcf8jbuaI6e0aY9LF+xP8P0gDiRaHXf2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Atx6KHHtIoHUgD/4nzZ31kAnVXA6iKxU7WSpvFg2k9dn7aM76Do/ZsijOgH4ecFmE
	 oNMnayp1HG0NSTLZ4pPlqWwS1Jd7z3TXGqGtw7TQRgvrLok5UCWkM2oCJqCbhxCRxw
	 P3hpCkFN9PSDAc6HiwFE+KRQYT20PldRuJ9GVBvPwvD2OmAB+p8r7I+zZL6ZoehpHB
	 P2hjZWZd2UZbAtdV0LieG6BWr27QtJJ855sbUbmC1VIvIe6wm6tJZJopc6XWhOzkiq
	 LkqH/QgDD6d3suzn6+4LxuFsMaG2AmJznw71zkrWP7oBcc7gax28lLMHRzNYZA54KO
	 IZKRKzpToFT8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1se0s5-00000002asD-1KPM;
	Wed, 14 Aug 2024 01:24:09 +0200
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
Subject: [PATCH v7 02/10] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Wed, 14 Aug 2024 01:23:24 +0200
Message-ID: <41d72570cc4e1fa3239ebf61d91240ebbaba838f.1723591201.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: rsZyII862Yo+

Adds support to ARM virtualization to allow handling
generic error ACPI Event via GED & error source device.

It is aligned with Linux Kernel patch:
https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/

Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c           |  3 +++
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 12 +++++++++++-
 include/hw/acpi/ghes.h   |  3 +++
 include/hw/arm/virt.h    |  1 +
 5 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..13b105c5d02d 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -444,6 +444,9 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     return ret;
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 bool acpi_ghes_present(void)
 {
     AcpiGedState *acpi_ged_state;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f76fb117adff..1769467d23b2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -858,6 +858,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    aml_append(scope, aml_error_device());
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 687fe0bb8bc9..22448e5c5b73 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -677,7 +677,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -1009,6 +1009,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
+static void virt_generic_error_req(Notifier *n, void *opaque)
+{
+    VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
+
+    acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
+}
+
 static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
@@ -2385,6 +2392,9 @@ static void machvirt_init(MachineState *machine)
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
+        vms->generic_error_notifier.notify = virt_generic_error_req;
+        notifier_list_add(&acpi_generic_error_notifiers,
+                          &vms->generic_error_notifier);
     } else {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..fb80897e7eac 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -23,6 +23,9 @@
 #define ACPI_GHES_H
 
 #include "hw/acpi/bios-linker-loader.h"
+#include "qemu/notify.h"
+
+extern NotifierList acpi_generic_error_notifiers;
 
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
2.46.0

