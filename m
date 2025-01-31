Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp586458njb;
        Fri, 31 Jan 2025 09:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVQFSFQFLKFNQtO2WBi+N/y2jlwuOuaVs3SL+NO2DUqBI8D1vUuyvWRamLPwAImllijcKgvcMQPbq5cug==@linaro.org
X-Google-Smtp-Source: AGHT+IEfhn88Wt+hiIxk4RqasEPJWmOUqB3PSQFuQjislwD5QJcdiKgPxDqggQTduZBTZ1WA3zd6
X-Received: by 2002:a17:907:6ea7:b0:a9e:b150:a99d with SMTP id a640c23a62f3a-ab6cfc87b20mr1437521866b.5.1738345398403;
        Fri, 31 Jan 2025 09:43:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738345398; cv=pass;
        d=google.com; s=arc-20240605;
        b=QunbU8gphi2LEvn1kXwwm1M81jEI4aNuOulyhaCNQnsGUT6FxpChJEiXH2cR43Topc
         VqgTrkl/UVnWoghkaWEQRdmxw/LoSOCEz48G/4lfkCCXwBzyKh2GibA+8xZ0QtJsGP5L
         30ThMJsrwJGXzrYR44/9zIEw16ivjnLXEajNoSLWhZlHQKOQXVHheKIjRrmEgnr8M/bN
         GwuelFpniEWvA/eS0aRmPrpJExMhyF6m5NEioxgQel9zOvfFBsFPoukIZy83ww2W7WVS
         Lo/dcZ0QR/4H9kyBELPVntQ4i0x8QzZ3s9ydcyl8vTSMzW1kcEI6Gyhfto4JzoJkUWiF
         FVyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=m7OPO0VFHpFvDKRiiJhIr2tJNzUBPbt5InegebC7WB8=;
        fh=wyBY0joL2rFkghWGWNuqy9C8j0XMPMxVS1FMK51a+qA=;
        b=b5TVCTWKNy9yMt7NGVOGZ2Al6/T8luDaIWUbw2bf0BaigGdMB+/zFVIn68Tt5YsXyI
         1xRBYKVNLwKkmTKumFny/l6f12egOCKyYC5R9Xu2GSrGL84OtO0nXBsuoelugjtC9dIi
         utN3NwZLJY7icNKJVvBFL8j9xbMt38beImtjSqrFrucLiLbw+ADPYVIV+aDO9KfMtHTv
         r8ZrTru4VUXClAPUhSymKQSCPNYJCy4I8LO/nDg04NsRErRDiCkVwMaK+4EVtQpLtcxb
         41mVf7dCd4nOzeUqo+SVnHTQarRb8XLSWgojVLVDd4CgxJ//C/L+vnSGQ9d3keMfD3EK
         zmsQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uu7uOFpk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494840-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494840-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-494840-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab6e4a563basi342340566b.629.2025.01.31.09.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:43:18 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-494840-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uu7uOFpk;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494840-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494840-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F9B188AD69
	for <alex.bennee@linaro.org>; Fri, 31 Jan 2025 17:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A80B1F0E5E;
	Fri, 31 Jan 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uu7uOFpk"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DED1EEA4A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=ZzSw9scYhYhlTcbODfh+jLpUoa8aGMPaZFQfStLY7jkb0j94rHPFZ44Kvg/KHrS8oPGpi5TFwP/PteRUD0znraGYqEe0fCS3SN7861Bxz5W5HPYFd2UKxqlbzdriWF7PK3MIzdJArKn/PocOMKOW3ct5voI8V/SDEY5Nrzf/CdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=QSTUWZybLwKEuHhzy1b5msVuOfgk/fxo5j1qp+e+UjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILrssO5uGJo368HAPtCFxJ9bGdFxtNCGy+RNLT+UHdw40ZAoNMweJmjRocCzETerBZ7XK/wei6y63/Lk/qqZDT2Z/A6SjgQvkkAK1RezE1n8kUpTSVBExVHYyJ9BNs5URV6P1+yuykEJ6fUiOxx414FacXmUVoTEX7ogriFarmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uu7uOFpk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920A7C4CEE4;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=QSTUWZybLwKEuHhzy1b5msVuOfgk/fxo5j1qp+e+UjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uu7uOFpkDrLPXT3VaMqFtiuPmOAn9Nvn+xl9OUURFLcUqJhNPZkdPRxlgJ90zRE3U
	 kHkVnI5+sjW2EvE9zffY2MmluI01BORRdXwTC9m8qqW5+mMUY401EfFtcbiQzD+Y6w
	 kqfdUs69oI85vuGJladHNXww95BR1X0crUgdRTIJmPRmaaSRnMqfZyZRJ2cwWZXHLl
	 TKTlOpC0QNDEY0TdRx1JXB9vWmalI4v1xHZSP4XaG7tNJ4HsjrjtWM0q+6/hDNrqnA
	 E+a3ZeWxtV49HwAInRaDr6ofd0ES6w8FvjZoHWdL5gds+lQ8sIfdfmyvQyhH9PG7sK
	 T3btdSk87TEEA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006ghM-1FFJ;
	Fri, 31 Jan 2025 18:43:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/14] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Fri, 31 Jan 2025 18:42:52 +0100
Message-ID: <9811005112f9e9446258e7c4922fbf4bc473224a.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 37jjJhD6Aa9j

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

Changes from v8:

- Added a call to the function that produces GHES generic
  records, as this is now added earlier in this series.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/generic_event_device.c |  2 +-
 hw/arm/virt-acpi-build.c       |  1 +
 hw/arm/virt.c                  | 12 +++++++++++-
 include/hw/arm/virt.h          |  1 +
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 180eebbce1cd..f5e899155d34 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -331,7 +331,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
-    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9de51105a513..4f174795ed60 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -861,6 +861,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    aml_append(scope, aml_error_device());
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99e0a68b6c55..e272b35ea114 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -678,7 +678,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -1010,6 +1010,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
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
@@ -2404,6 +2411,9 @@ static void machvirt_init(MachineState *machine)
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
+        vms->generic_error_notifier.notify = virt_generic_error_req;
+        notifier_list_add(&acpi_generic_error_notifiers,
+                          &vms->generic_error_notifier);
     } else {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aedc9..f3cf28436770 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -176,6 +176,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    Notifier generic_error_notifier;
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
-- 
2.48.1

