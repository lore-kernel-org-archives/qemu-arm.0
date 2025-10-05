Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3010BCAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 19:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5UEe-0008Bw-Lr; Sun, 05 Oct 2025 15:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UEF-0007kf-JB
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UED-0006Sa-3t
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759691824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n2yaew7sPmdwqoSuzt/4g3R5wabDe7Wq8iiNEDRaEec=;
 b=SVE7WSN+JBPJuwb661DbbcNpCCq9sM0bCQ6FDAx5FotBlvnm7Tem3MHTtgDplQtEfzM6N8
 u8jBAuTMDkm0+/XK4ENh2YAoFHjYyR816aNbE8a7Ol/QOYPGmSbv6vlYGSFDlyqmd7bFMJ
 g4K3IG+Yv/SjT4F4j6wczXccazaCVlU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-KiuG4TFvObe0cq-cY4njhg-1; Sun, 05 Oct 2025 15:17:03 -0400
X-MC-Unique: KiuG4TFvObe0cq-cY4njhg-1
X-Mimecast-MFC-AGG-ID: KiuG4TFvObe0cq-cY4njhg_1759691822
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3fba0d9eb87so1552198f8f.0
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 12:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759691822; x=1760296622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n2yaew7sPmdwqoSuzt/4g3R5wabDe7Wq8iiNEDRaEec=;
 b=KWcW7i7KYLEt2l/0yX0NsvaN1oI9uAunou+xF3+RcqFJpoA7wObUzdXpE4J0DzFyQT
 mRItuIDn4diNLKVsl6IDC5IxXx7dEhy/Ztsu0aF/2GSjZTLOWMrclEo+g3l/iukZNQaQ
 qI2KOGWVKO0B7nOfUMaxDfnFazvl5FCjMb8IipgHKErA/xhof0S+Z4tQCprklONhaeiD
 ljpOXNcZrfUIMbErSF7kqpvMy6aXFf5+ZKz3babXB7V9mIvXnStqolGOprRYFqhO7o4g
 rtEw3fdr8ND3Vb/BCjhlG3TjjlySca8NFQqgmg8gw0o+0Mja41aU6U2KZRBRvb0ZkM58
 LAdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUax0JX0Bg93P+SdnnkqDKheeuVUJ+1miFYeDq9xe/StaWOueNA4I8pMf3SVAU7EpCNqCYPQIpPLA==@nongnu.org
X-Gm-Message-State: AOJu0YxRRdm5geGKabD/7JQZMe6wFvEjhW0m5HI/HVHUrmppRlFBOjuX
 kVSQzHlJTCW9Y+cTlULgWT1QCfBxFU2abm0NHTQLwQT7LucNzgFS438DTVOPIp2ZJImqHVnHwmK
 YyVkuZJVHtiWE++OgxUUrQ+JwO5nkzLP+lrZFA5CCXtXf5/gRKx4N9w==
X-Gm-Gg: ASbGncvPFfjuNRYk+NP/vZXM5pUD7F7Y7fe+FLInkcVIOBypjpVDl/bNONprVNbdnJ6
 paTDJlE+rSFf5pQ2yGP6d8Jx92uCK6r7Z8uaVt5oz4d39f4VfBjk1b3p2ZgY/xHoHFg/gQfLaSl
 Rwixz+Sp8Kkf+JCXiJraFiknMrDOcakAspNXkZoy8naG5o1eYRKslccGIqupAJ7Jatnw8T6Vqnn
 +r+FRQS1aKBct/B9f3i/iFXY649mja8oz3+s551gfTV+4VYyxJ+FWiBLuQSQPfw/Owas1HNvhgU
 KtEZizEsjFctZXVfuNHNlVnbE4ocJUiJqYeuqqc=
X-Received: by 2002:a05:6000:3105:b0:3e5:47a9:1c7f with SMTP id
 ffacd0b85a97d-425671b2410mr6544785f8f.47.1759691821733; 
 Sun, 05 Oct 2025 12:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRURCRu0Nwht+Dp8zRejMGpCvhKOig5UJaICV2rwPLpdKx7n6ZmoTroR9mTPUTjNIxeRzv/Q==
X-Received: by 2002:a05:6000:3105:b0:3e5:47a9:1c7f with SMTP id
 ffacd0b85a97d-425671b2410mr6544769f8f.47.1759691821273; 
 Sun, 05 Oct 2025 12:17:01 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9719sm17755739f8f.31.2025.10.05.12.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 12:17:00 -0700 (PDT)
Date: Sun, 5 Oct 2025 15:16:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 26/75] arm/virt: Wire up a GED error device for ACPI / GHES
Message-ID: <d352e33e1f92e60e12a00be1ea80f47b4e024c88.1759691708.git.mst@redhat.com>
References: <cover.1759691708.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1759691708.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 93MARwBsiNuqWmuGZDBsWP-B3XJKCRoho9LFtjQ1Hig_1759691822
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <3237a76b1469d669436399495825348bf34122cd.1758610789.git.mchehab+huawei@kernel.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 12 +++++++++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ea2cff05b0..e14ea0f9d4 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -174,6 +174,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    Notifier generic_error_notifier;
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ff3b7a794b..2b63008df0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1066,6 +1066,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    aml_append(scope, aml_error_device());
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 02209fadcf..6960f6113f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -693,7 +693,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     SysBusDevice *sbdev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;
     bool acpi_pcihp;
 
     if (ms->ram_slots) {
@@ -1050,6 +1050,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
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
@@ -2500,6 +2507,9 @@ static void machvirt_init(MachineState *machine)
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
+        vms->generic_error_notifier.notify = virt_generic_error_req;
+        notifier_list_add(&acpi_generic_error_notifiers,
+                          &vms->generic_error_notifier);
     } else {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
-- 
MST


