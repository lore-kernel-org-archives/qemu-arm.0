Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp865182njc;
        Wed, 22 Jan 2025 07:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWTt1OFo5PPCeHOCeJZsg0yowbcT1Zy5Pz9roVZQmnVZAeq6qrxLO1d8VlGpKCk9mT8Sv/ylCcQ0szk5A==@linaro.org
X-Google-Smtp-Source: AGHT+IFcoNtoWlnTbiMjGiZqQ+zMFI2plyQgPl5GAntyI/HenjzQtdUC99FsqQWAo/6sigg5CEen
X-Received: by 2002:a05:6402:524b:b0:5d0:9054:b119 with SMTP id 4fb4d7f45d1cf-5db7db07787mr48545831a12.21.1737560809094;
        Wed, 22 Jan 2025 07:46:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737560809; cv=pass;
        d=google.com; s=arc-20240605;
        b=JwwLxgqwbU6mJrGexsFukhbOz9odU70WwG9cDp/3oeqLUJpfQwVpo8Vx3OaOkPbkdi
         F75hMWIPQNM1Ps72ooPwXbth5LNgc+0vgI1lAKfnIPqHx/us/qjC7SRKp/GyTkYP7Xtc
         5LlnnockqKbiJBRChwHG3HQpr7QMbJjm0hvaYyRWyj6mzBhwFk7wki+1SB+5M/7sy4IQ
         3MdcFdSlSyGQf01S9ZAXKqYpes4xabNR6Ulj4Sok1iptJSwjfpLZDyaj3il1udX8GtIk
         VuRuBT2X0sTh2oQx/cjamkZbuVJJmP9UTQOv7BaaBCkoisSHnppoetyMgvkvgpDuhtUb
         zjKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Qso3LEdx63JcyHb1OnlFPDU8Mc0eBLHuELh6kAm+law=;
        fh=wyBY0joL2rFkghWGWNuqy9C8j0XMPMxVS1FMK51a+qA=;
        b=OLaBfvdQP40DQKx3w+BVrRFmNQwfnhNl/XQ+9MRKu3sYYWX5se+a/cvXgf9CNBzbG5
         QIzT3CVWIzKEYr82Domll2M+ADp5cwirniCS7TpOhKs+dIUKkvyebbDRL+IdMtSwHAwE
         q926G8sLG2VHAv2jKuJGGn1uSduT+fLduonn4b4ngJKxt8oz+2MwlwDPDyfOao3ZPOdr
         Wq6T1AflOpJZnCXRWH3Uj4YmvQuhVrw07M39NOlTTNYDqencVR9GEe9+3j3XWCGfWVvS
         +bfJ0LQEZtiJ4WHjqwpBAOKIunYP4PXs2fRZXcuP9ip2gC7YsqH4Ss7S7D3tcmDN/Z6o
         tiqg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SDhR+R6H;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485594-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485594-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-485594-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab3987416d4si778288266b.227.2025.01.22.07.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:46:49 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-485594-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SDhR+R6H;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485594-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485594-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C777218867A5
	for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 15:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E5B214812;
	Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDhR+R6H"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430A6214229
	for <linux-kernel@vger.kernel.org>; Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560800; cv=none; b=af02+flU4SzNJ9qmN1adeEqjcKI/ASu2pSCDjC0Db+SVMc84Y0CpKcuTd1HmQmipiS9Jk+yFrVsSOKNuswVFnvIx91usGmeuvCLvOiMuIZmfIbvwd84KDDF+WsG85ogFTzY/N8rq8FfDHHv4xJ6g6LpDXm//99BHnV9L2VsrSA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560800; c=relaxed/simple;
	bh=DpBhi2NBE9okKNGNpHnpH+sR4750egcuqhpcUlVucEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byxFr6zA9gMVcvfMpKxwHe0u2b2wlZaaCcPN64sfHFyoT2ZzltwSy/bCnzFym/U9WT6hK1lq/1Fuhmyv8kVfK6S/ypuyCoUpN56dJtxN314UiXoSwfzvYzxcdGWr5sC/dT1DHLLNonmzG6ijoN1Z0f4m5V1NeoW4+bMRqS/YaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDhR+R6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFAFC4CEE5;
	Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560799;
	bh=DpBhi2NBE9okKNGNpHnpH+sR4750egcuqhpcUlVucEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SDhR+R6HG2PV3nuXh/eSW5F46blAoy1ly2F/bhZ1XMgC/zE0IFHSdhT6O/EpUmsNA
	 Xfjs2Wxc9zmMvLxVFbVhb7kC7cVplHsH4d5Hmjtd15/I1nQily3LT18oTU/RiIlowl
	 0hCqOT0iBLOIYRyviDrXoe9EtPQTW8vXUtxHC+WIa6qTywv3JprGVVWllCnWthVTs8
	 oKoCcTzjjMc/PCTkoLb1XEfoLkJyaGbaumAri/Yx7a8WVSU/jZxPvhmimEfjSLOOt3
	 4HHpe7YMOEoqwJh6//WNNXR0bApIthAiL0Xy51CKM9M2e4w8UNHpwLquq4TCJXKB/T
	 8diHnGDv9SUjg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tacw9-00000008ogo-4BK6;
	Wed, 22 Jan 2025 16:46:38 +0100
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
Subject: [PATCH 09/11] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Wed, 22 Jan 2025 16:46:26 +0100
Message-ID: <c3f4777e308492a8b5a2c27a9ffada3a01df9680.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: XGUzpoyup6BO

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
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 12 +++++++++++-
 include/hw/arm/virt.h    |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ada5d08cfbe7..ae60268bdcc2 100644
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

