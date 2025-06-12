Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421760njc;
        Thu, 12 Jun 2025 08:19:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW47yJrz6MUxrmX+o7Y7Ws22EPS4VSQnzaQnDpACzWK8visqZGYjBTRK7ukTO3LtAL+NBW6rVAY2F9tEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFtqa0hn2X4os9sSDfk3S36rQdPd2qldJyD7nbuIiRALxGYejgnfWzqDhsqshA+A7KRQG+w
X-Received: by 2002:a05:620a:4893:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d3bbd54ec2mr8205685a.24.1749741563634;
        Thu, 12 Jun 2025 08:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741563; cv=none;
        d=google.com; s=arc-20240605;
        b=d1nrzXFfh1ql4hXD5oiYMMyJ3XcJ1HwMJkBN7lSdQIjsJVZeZTDHGOVRZadfH+CmH3
         rHykRDfN2BwsL3m+sN2+dMRvnLmPz0A7rCWr+QfbizCk6HKOFDNWd2o1fG5X8MlJ/PUa
         KntJNakHLMvAOuPFDw9HLRTbZ5+MYV3rUWhEIKlF7FR2Ft8JCEXKKbjXkP4z5SPw65wF
         e9fNYF3BdZ0mXO6VhZnYI8lV0Mw+yxydGvpm3AxQLa/EVIaCU8mG0FkNnaB4ypYJeNLq
         bgWjpgXWycdkE1HYzk4kGeVUEDobBySxy6c1Iln8RD8NUZHFvLUoY85GBpyd73GcjLXV
         rj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+ZcwN4i7wRP34ymT/ZoWIZPkBXrgSTEn/0D6/O2j1d8=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=TtxNQd3KfyqdVyhAyNOOnFPSGGLj+gnyRUFuDCwv98s4FBrrofMfvCgv7AhTmdZJ1z
         VT/e1qcXvnHMul8AxUUTbqLKlwfQZ6l0YgrMKZrLoiXbnRdNwV2wQDEsU0bDBCMYZXL7
         X1kWaMKN1SDBNqXPAYK5UUT7he8XkBJVb+HWeQ9OrcnT+aEjK3JDnpjIwTkwtNuuC3Tf
         U4k5nNPJZx2vqUC0JA+nxysIM4GNlW7QflFZH8poPeLn81lQSmcFGnQsDk/doqJuq52A
         mtRHwEOHiJFsSVklbyTc7JnTLrncEMPl4NdiG1ouoxy9rMupZJJmzKJ/+dpS0u+/yDC6
         U4ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ivbqrX2e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ea712csi92897385a.184.2025.06.12.08.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 08:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ivbqrX2e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPjgz-0003UO-J5; Thu, 12 Jun 2025 11:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgm-0002ut-OZ; Thu, 12 Jun 2025 11:18:00 -0400
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgk-0006id-J7; Thu, 12 Jun 2025 11:18:00 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E06A4A7BC;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C021C113CF;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749741469;
 bh=iqKzCLpBXkIFI6v1NlURAzof90ZSGexhmC5aANXLHhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ivbqrX2eZ+mDL59O9crTVCtBzYStZpFK/IEHD4xeuUIp3dNxX3mfVZSGod2taY/ed
 dr7NOy15766W4oSRMCkOFH8kk3sl4sXXrwHBWo7kBQcyHhmQy6HDXvzkts8mSC8DPz
 mSU5gwsZUt9fF1k0V7VslvGj6oLV/qp0SO95gTw8Xaj8PWB3tMiAFC3l4jaQ2X988N
 Re6SuOn5OFTEbY1fGa4VMD1+Ta5KUuK/1eNAXqz69pcU1JBrH3bEUDy/6L4UqENa+a
 a/d8sIU3OOAzmsZs42VAkhvp+VaFTGbaF/VQUoF0Ko4+fy2AFpMpmj+tP3+pTe2ppG
 Lc6+MrMRlFW/g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgZ-00000005Ew6-27CH; Thu, 12 Jun 2025 17:17:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Ani Sinha" <anisinha@redhat.com>, "Dongjiu Geng" <gengdongjiu1@gmail.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Yanan Wang" <wangyanan55@huawei.com>, "Zhao Liu" <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 (RESEND) 15/20] arm/virt: Wire up a GED error device for
 ACPI / GHES
Date: Thu, 12 Jun 2025 17:17:39 +0200
Message-ID: <8e8abaaea1d6058b0f9147dda355238f06704784.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c0a:e001:78e:0:1991:8:25;
 envelope-from=mchehab+huawei@kernel.org; helo=sea.source.kernel.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zih8xfip38P7

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

