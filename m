Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304037njc;
        Mon, 19 May 2025 23:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWAgoK/vhPODHFk2NK0wh+aKs1yZJZkI+K2Nj2aOJRqDhGhhychHl3ZmCd30JxiTM7lxNFXiUzFimr6Hg==@linaro.org
X-Google-Smtp-Source: AGHT+IEBmNvwkY4icH6og/DoakpoeksgxvMfN3kjC+/SuF4l765/n4Ytk9QQIs7XVEaVH4m5nMAT
X-Received: by 2002:a05:6a21:e89:b0:215:d4be:b0b2 with SMTP id adf61e73a8af0-21621a02357mr26344899637.34.1747723331767;
        Mon, 19 May 2025 23:42:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723331; cv=pass;
        d=google.com; s=arc-20240605;
        b=ga4QZZTIsmn205CWgsq2+wKEvhiwKWfQJrs9r2H2v5CHajg/5FaS3JDWw7uf969Nf9
         kxzPBlt60jmOjOOQYqnGCXYbJ9vsUK0evWMpiixrLjkHXkB83AEhsNGXZcE0F7srIS0M
         Cqi11ju5MheaC50A0tD4L3vu5E82vRirAPw4XRuwFelt62+ijuUSopyGfNU3NnfJH9ad
         E1+EYKv1L0ZOZUU1WDFtkcg6pHw3kRzdKZ+8FNlxN/d3HnPTm6KlSoeeXcMozFjiPT8a
         6i7B8YPcZqZfFGqtKKxID2SiadRxGdv5Bb72WRZ6Q4sEvVxXK76zc7JAvSunD8Mkb27v
         D6IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=+ZcwN4i7wRP34ymT/ZoWIZPkBXrgSTEn/0D6/O2j1d8=;
        fh=wyBY0joL2rFkghWGWNuqy9C8j0XMPMxVS1FMK51a+qA=;
        b=OtZMf9887WMVwQr3CNa26Fd5lArwNBfmIhKKb2FaodLAzIof82M6tCcpMrbD7W30HM
         HzZrY3rTGQkADpBbK6eClD3ZgzhH0vANUPCMxpqt9hj4veWNQqPC5wlHJKS/TwcG47+M
         J7pt+S9AJlQPwZY3SaLHP0YHj3kz2ZxaNIhUnWWMnM8AgquShPtV5PwP//kNzOMOq4+j
         rvgnBzlKACg+mqkZDM0BfnLFFjh2tqo1Froy32hWWBkrHm3dGClNFTqtGyZrK8OiGi2u
         A6v9mZH6XUJfCaxzC00h1yI0I2f93kChv8RkOvwq13vxDNa55FsKAU/dkaryl5cEHhan
         +9nw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Zsh3YVpR;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655009-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655009-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655009-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-742a97cf06esi11546733b3a.180.2025.05.19.23.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655009-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Zsh3YVpR;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655009-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655009-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD7E3B0E15
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E8325D1FB;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zsh3YVpR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FA25D1E3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=RSuMF5TzT7OEYB7rBPkXy771t3qODl2uLuSuCnBgyECDr4vNXGL1tPodh8zCZja8XFovXBoOy/oaRcdFdYgKCdi+OahHQ8GwNzWFt3HhCq7YB+tEPPZNabAmqTIZJysSB+UlEn3JsuEpPGgh52JtInlqJYE4W0NxED2dHqZbkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=iqKzCLpBXkIFI6v1NlURAzof90ZSGexhmC5aANXLHhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYO58YMZ2WgB9DBheE3Lk4dTPyazrh7WDOtt2J8Of/aza0Zug8BCn711JOhN8FIyzOqyZLnp+tzNrHtSdO/tkKvjdp6MPqC9xAfTpyCPGdcMsZ5MLGCvyNzhtAWGnNE+aSUdP3Mpao7AS+QTA6JVi5IVqIKeIotYCoD529PBSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zsh3YVpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38D1C4CEF1;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723315;
	bh=iqKzCLpBXkIFI6v1NlURAzof90ZSGexhmC5aANXLHhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zsh3YVpROz7e/Tngh+YeDT3xZVCwnjK2TUXZRoPYHJY7o+q8NYidLmJPB8IXOR3FS
	 rViwrVk5lrPE4kz1VyphGhxslKMGV0qiyVzKIDmVJrxT0YVfnLzquxUEd1fBImwnMB
	 a2NSBgcgTch81jkoIrVsBYeCL5NYAEChdIc3Dr8GCtxW6rucwthIeahO3lFe7QpC0l
	 Yo67i5mT6txjIAu5dxdJ1lOUyggVlKoTMKcBguYATwkTbULxmW0LxA3HmZJ890wet8
	 gASrUNF7K0BOWRSzS7uk+lDjm1qcQ6iXWz4M/oKalVGMI+Tsaswkus0UdA7eoGghhg
	 OTtQZ5l+Sg7Wg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfi-00000005qtw-0FMG;
	Tue, 20 May 2025 08:41:54 +0200
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
Subject: [PATCH v9 15/20] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Tue, 20 May 2025 08:41:34 +0200
Message-ID: <24f2c83cfb03ff405db4773ab0aacaceacc43738.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: nXEXrfUo14s5

Adds support to ARM virtualization to allow handling
generic error ACPI Event via GED & error source device.

It is aligned with Linux Kernel patch:
https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/

Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 12 +++++++++++-
 include/hw/arm/virt.h    |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3126234e657d..33a701d6ad19 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -857,6 +857,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    aml_append(scope, aml_error_device());
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a6cd085a37a..e994809512f3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -682,7 +682,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -1016,6 +1016,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
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
@@ -2398,6 +2405,9 @@ static void machvirt_init(MachineState *machine)
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
+        vms->generic_error_notifier.notify = virt_generic_error_req;
+        notifier_list_add(&acpi_generic_error_notifiers,
+                          &vms->generic_error_notifier);
     } else {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a1b0f53d218..16b505604b2c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -170,6 +170,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    Notifier generic_error_notifier;
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
-- 
2.49.0

