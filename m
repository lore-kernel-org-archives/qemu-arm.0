Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140879njb;
        Thu, 27 Feb 2025 03:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWc4pikEDReRy9R+cGwy9pK/rTZGb+tAqakd+Yt/oO8aipgd6IhhpynPZjamvM3qIUbWCGuNSjevg46Qg==@linaro.org
X-Google-Smtp-Source: AGHT+IFnrQoASF6sXwz1/M8QCujtUPe8xPQYG9SmQ5W5nFo2cKlvguDaN+lR+eB8lPLNPQIiFwnc
X-Received: by 2002:a05:6102:cce:b0:4bb:dc3c:1b43 with SMTP id ada2fe7eead31-4bfc0086ce1mr14515303137.8.1740654293615;
        Thu, 27 Feb 2025 03:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740654293; cv=none;
        d=google.com; s=arc-20240605;
        b=Ktnq2V6mxj7n2SsUDnFanHVv92civMNKlZgLU87d3YdTcTmWvHu6t00ZFDhDylLddZ
         pOgEF6DJLVdCl4BunGzDYbf7DKxVg1Xr58YIYS13OsjjuEL5Qsdcw/ktexqyimNjjUpZ
         PvCVnp2ptnhGKgID/uqYP5gt2PPz+Jsq8VC3jFGlCTQgQNQLVrajvEFHT/8aYH7QJ7xz
         HcxIyh6Vb6L7AaIkFTIHJRHSMeohMioyQqK3oyWPlhHMSZ8JvEPJgp0kPF/Z3PeJEspb
         Z2zrdaM33JCXSvqU2rCR19GfVup3J/84aWMuQt6xjHJEHRn8zViUouWtcc6dZTGAVftG
         lJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+XipmQ0jDJj67BPrj1jPGhFR39lspEWh8ykqITyG578=;
        fh=wyBY0joL2rFkghWGWNuqy9C8j0XMPMxVS1FMK51a+qA=;
        b=SVmk7Xv5kaZp8YXDj6b5b1Qsy/lLMhFHm5KuwaMElMnf5D4UoVBTJpugLPZm7k0bT6
         4tcoYdmu3nLdFDD2uicQ16ujfnqxeu0N8VuqeB+vCbr/vZhngXwBqGtbMeephou9STVx
         s91JFcUV550FtuBRKh8NbxMeu2khzdN9FQMLz4NGD7v8lcRaFQFUCF7npIqpvfH/b8DX
         3zSOyJDpDjcpgDRlBKBFvTupcUIV26v0tkvC98yv2xP3jUbmHZVIGOKJtIc+SvW9c1iQ
         ux9YbtkS7tNEbXTgc1HamHZpbnw17fzshMho2o/14fJ/+44QM073hkfg2h56LKWbqpDU
         szfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="R8q/a+4t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c0348c9c09si135221137.583.2025.02.27.03.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 03:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="R8q/a+4t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnbgn-0004uQ-5X; Thu, 27 Feb 2025 06:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgW-0004mX-4d; Thu, 27 Feb 2025 06:04:08 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgS-0007Tn-8L; Thu, 27 Feb 2025 06:04:07 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 64B09615AA;
 Thu, 27 Feb 2025 11:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B184C4CEFA;
 Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740654238;
 bh=o3TjleCZG6iS4zia9WV1teoNfxlBqHpXtBTKFJ1b1Fs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R8q/a+4tzDcUVACrlUzEXq28+oEQp9GU5lbxDyCtoiOyWMuwOXd7MyuUVDu396ZYE
 gxzQQMxYZbDUtgqFfhim5CfGNHq6q4wGr0N6GHdjoAE/xlSfJds78T+g8i3GRFRPjD
 wLDJ9iObmPt2cASJ4svYJ8pj7u4XjbJ3SXWqoC0/NKf+8L4Aey95otjFSTwD/a2dwi
 9agldPfXvEC4JLNgU30MGGF64xbZoFVDmEHqWtCRU7DaJVTS9oIqvmL6L/Jn3eDc7Y
 L+gOTKw+UXGBGAgw7AAP9xxnj68ImfYvzFMCkzkv3/8G7J60ddDsw6cIUSVNYUYQOF
 XVheX/gRdugTA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgK-00000001mRW-1gi8; Thu, 27 Feb 2025 12:03:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/21] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Thu, 27 Feb 2025 12:03:45 +0100
Message-ID: <a7646c68ab3e643823d5627a717f3670062be5fb.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tm7WCfwSKQYb

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
index 03ee30b3b3f0..841078f65880 100644
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

