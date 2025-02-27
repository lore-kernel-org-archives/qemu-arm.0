Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp323211njb;
        Thu, 27 Feb 2025 08:02:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUw6DqFGOU32oXJ/rNReodbHN5xb3mb9ldSz+OeOSQXxEaf8jGJ8KRh1sDNiZXzHrZaDS89qUJqgRKpog==@linaro.org
X-Google-Smtp-Source: AGHT+IE0XLFu+hFaCAHpq6QwJo3pEXAD34SajEu2O2cYei/TODSOLJUmeN80KEPdfmDLKYKid0VL
X-Received: by 2002:a05:622a:268a:b0:474:b753:e264 with SMTP id d75a77b69052e-474b753e320mr16612461cf.50.1740672124801;
        Thu, 27 Feb 2025 08:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672124; cv=none;
        d=google.com; s=arc-20240605;
        b=V/MHfg0AeWcg+UpcgRzX2XkwMVDU6i/G8+ge2OKt7HsnN/ChObci8IHOks/TKfnDZA
         1uzrhq1BYmWmXe0mrv7c5qdeJv0CfuBeHjcmjUs/6Gei521gvFRCBLxZTNYFhsVkM5iy
         v2f79hTZqX8D6ebRb16wSvVFI8ofndIXmar7g7PURGOzsbtBfwGNnEI0d139oQn0EhC0
         W5TBvbRW2CHllPSomjAgeiLpO7KpEKjpU/UVu79u0i1jJzCBYodBfY/3FaxuyndsALeT
         BJpgOzYPsjsKpzsdv114KUCbGvjgJrJQ4sl9N3StsQ3Ms2dd+hsmbg6IB0u6ZcsUFY2P
         Wjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GxB7l65hTJPciCHC6Jg40wV/hBMb36FwjD1iohx+Rgo=;
        fh=wyBY0joL2rFkghWGWNuqy9C8j0XMPMxVS1FMK51a+qA=;
        b=i6Gx7PNyUbR3nYF2cNb1RtJnY/g92xOFIdeQcwO8VWLpAraE5j2lt5NcB/7UnBrY1t
         dmbDW4RMPGfdHGW/is0jo5r7fYpCdM8zOIwm6Uuu2LHxFLy8f4eRaxjXGhs5r+ZbETxL
         7JKIO1R18kZaOJnDFs24zt27B4Ew6MMCd98yrfTeFgkrD/jfpoYYfOj6EcUT64sF4SjU
         vnsN4IDzyyB6OAGShAmRLtxczN+rKPnxS457OypqUrD2tsP/1oKD4lpq7JbwGxKwaPCx
         hzHVL8pVsDY2aMfV2I8jMBiWqI1CFViRr3jhDMpwZh12kKQBSGQJu2JjvHRHiTKcePAK
         ksWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TUDFQaHW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474691acabbsi14822491cf.141.2025.02.27.08.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:02:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TUDFQaHW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngK4-00074z-9p; Thu, 27 Feb 2025 11:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJx-0006yb-UA; Thu, 27 Feb 2025 11:01:10 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJt-0007GH-D2; Thu, 27 Feb 2025 11:01:09 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B02375C5A4D;
 Thu, 27 Feb 2025 16:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01364C4CEFC;
 Thu, 27 Feb 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672063;
 bh=qzKO9Ht4URhGw0bTLxngjN7XfmL3ZPZGPSViPyPm/yo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TUDFQaHWsMrPx5UrkP70MSDB0yKxZTANx0OdO//VBbPe5yzSsLhzdoPi00lnuYn3G
 KvToaqOJBB2kRkCgG9iPJpczrUTAbzhBSW/dyMDwO5ctFRe0UmBe01Yd8Y9hwUq6UX
 74jykQj79zRwpq3DsCpzXSE3wmO2O9/9qSlmAym8/oCtv8X74M+1vS4tm1QbIJLZ39
 UZzW7C1COXXK4uWFfvTAh+nm64l5iXEpTq+U306tFoAvAG/8z74xdb4ftET0kK7mco
 akrMkl0XOe7DRikk8J9bD2YOuagM6tQQ0ufNFttCQ7IdxwmRlObFml0LR2IOsXnUOU
 eSZ2yv+9GVbNg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJp-000000023bb-0SCO; Thu, 27 Feb 2025 17:01:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 14/19] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Thu, 27 Feb 2025 17:00:52 +0100
Message-ID: <42c066d580dc0c6414053c7b95446f003d7999ef.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LBT/nhmAnwfC

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
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 12 +++++++++++-
 include/hw/arm/virt.h    |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5443615d976d..2bf9118fda55 100644
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
index 4a5a9666e916..3faf32f900b5 100644
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

