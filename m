Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1014762njb;
        Fri, 6 Dec 2024 09:23:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOmgRZjmlZTKXFzTu8dHjjTe7S1kVBbclfc/w3iF5yXfOP70Bcio+fWIITFtpjiHINbm+qOQ8bVLq+qg==@linaro.org
X-Google-Smtp-Source: AGHT+IFMJKhrciZVekBcUNNc5ED0h9JKm3RD2QDgrgE9JSfjHqIdElfVpf+G2xu4LPy7kutrkDpK
X-Received: by 2002:a05:620a:29d1:b0:7b1:4f21:39de with SMTP id af79cd13be357-7b6bca10b58mr734351485a.0.1733505835739;
        Fri, 06 Dec 2024 09:23:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733505835; cv=none;
        d=google.com; s=arc-20240605;
        b=fpysx+/qmrltbsHYfv4xHlizXjusEBZ95ClqtBb11nrhQZRTrzWaqYItmRdh973ve8
         fCiLbY+84mV3/HsCZPDc3hUiQgjjn1gNfLMoesXckQ18jAqvdrzKhMQ4wql3A9jcBtD0
         0u0czedlva5iztg4w4iVf+7ZB9n0ur0+7XaayiorXSMoVcCHHL09ECZglFCzJ+oiF94J
         K3dJc56JWhC137+dBNhwF3So5Aa1SjvPxLwOtLC9umsUlR+KP4M9S2/m/RGpS4wRitR2
         rJUUpOt9lqpdsN6pAFAV5YiDBCDehJM6mfXiURWFuWdmAefxC9AX3WGt2yud37sbw/Ms
         5nOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iU4M5dIxBOpwOh2YUKvJMXIb5raHuQKCQ0Jxjq0E/uA=;
        fh=LDn2J4ZvhJC0UF2TP4zO7FgurQWDiPRlsw1tmw1yJNo=;
        b=iygBLYFQIJZh5jfzDJPKHlx6/tG00EE9E+9Kt2Pqu/9YBrArm8E6j3SyU2Z/2YIQfp
         MAPQNMavk1ywUOntag9DKatayKTiTyzbaIMCtcZ8K/W3gtcwpW99LwQc3rlfC06xLLgM
         DhYH9LXFo+c3v6K2bNoO5sxb1RNb42sTchqu8XbIn7i+4/aqRiFCI8Wr5JW0cwiyhhuL
         shBodf8oMKvk6BnDYuIV0fbzZtxEX2wo6+VLgvl0kRdKC9xqLDWvCGWu+8XfxLemD91Q
         yKrKcEe9aHQMwjQXTYuost3sV1KnIqc6zaZBFz+4vhi8HtKA/akfEmubjI5cYT8IQqES
         2sCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lmipS22S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a90158si489936885a.288.2024.12.06.09.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 09:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lmipS22S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJc1c-0004OU-M5; Fri, 06 Dec 2024 12:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1O-00047Y-LM; Fri, 06 Dec 2024 12:21:42 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1L-0000xX-JA; Fri, 06 Dec 2024 12:21:42 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD4715C69BE;
 Fri,  6 Dec 2024 17:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A4DC4CEDE;
 Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505687;
 bh=WdvNgQYWShtxIcm6i2e5IyxmF2QzEyH+E6nYU6VJMwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lmipS22S0xFcj7zeHfFbGWONRb/0RcaK6mb+9jhVva21LHmVYBRQM5FzIfYZXTSj0
 q8qkNos//97wfy3QAdYNssoiyH74x+yUOR94+/KYJK53cYxgiXo3dfwJyMcGcYANny
 aCpWwyeyYWTZK22aLLTKFFaEk+sZa+wBBTYjBP2z7It0dUxD8JS0cDIS/zkx4f/siu
 eRlJo2FSOOniR6Iyv4/S/DChg+Knt6DTRt+psfnXEWQs8HYh0WFHMkumJal/iyj6jz
 R3rsL7Zy29iSrbt3WchqI2z83lqePoIxLD4mu/KrU2PaT+UHrAK4uKnOE9b+AoKbaM
 gBA0ukMpNiuUg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc18-00000005RKs-0Dd4; Fri, 06 Dec 2024 18:21:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 21/31] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Fri,  6 Dec 2024 18:12:43 +0100
Message-ID: <99c66bcc0229403ae61c5044371fed9b82e03b8c.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hrxCDqBk2+5j

Adds support to ARM virtualization to allow handling
generic error ACPI Event via GED & error source device.

It is aligned with Linux Kernel patch:
https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/

Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
index 46ce3f3bb07a..eb5b61f636d2 100644
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
index 1a381e9a2bd7..795d215521a3 100644
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
@@ -2403,6 +2410,9 @@ static void machvirt_init(MachineState *machine)
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
+        vms->generic_error_notifier.notify = virt_generic_error_req;
+        notifier_list_add(&acpi_generic_error_notifiers,
+                          &vms->generic_error_notifier);
     } else {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aca4f8061b18..24ab84cd623d 100644
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
2.47.1

