Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AC4C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 23:16:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubSIk-0004b0-An; Mon, 14 Jul 2025 19:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSHm-0008EX-8S
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSHj-0005jR-Vy
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752534515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=plxvBEcPHMctPzf6xD9j7d/D3J7YMP4bRSmar6SnUeM=;
 b=TdkiGaB6xoMsQkihPdWnmDETp4YIHCC2iFwSj4vYmeyFvE24zF2uplw8oGromcbIAsFLkb
 Jm4F+R2eRQi0jyhya3oJdco4/57p26QJsUAtLODGnurLb0T8BXNQbad9QjhpROW8soh7W8
 RNAhUPVHB5UHvHLu8Dd+e8PrKccHMcU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-G2F6akumPfyPXLlo_TQ7yA-1; Mon, 14 Jul 2025 19:08:33 -0400
X-MC-Unique: G2F6akumPfyPXLlo_TQ7yA-1
X-Mimecast-MFC-AGG-ID: G2F6akumPfyPXLlo_TQ7yA_1752534512
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-455ea9cb0beso26557415e9.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 16:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752534512; x=1753139312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plxvBEcPHMctPzf6xD9j7d/D3J7YMP4bRSmar6SnUeM=;
 b=EBJyf1LqquEYFEokx3DldcP/ZkMpmiHCh1uR3ImxJOfaxP84VFm0YoIngVqyfhuDuj
 P7FPtD4gaKnRiKm7tZc/Jf449PdFKNcCnWSnKOr8nSa7K8vsZ659sj+hBAmA/9g0fwSo
 BEzKoMla0QKEPjq+DW89YB/TaWIAhZWrb+dsUhykx1ZQxtL7uFyTX7vIjrsxSJiumpy4
 fzEWpByklMkZicVvc8SSA7PPsEbg2hQFQX+qPK9bIvUxGkMHGZzPp6UYYoilgsKQ+5QI
 eN0p/h9VZo5zaCz6Uy3XLOO6V86955i/924D6xtTC84SribWyIPt5RTKVSKohL7ocMYT
 4IEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjvZOhWddK6DnxEMwJ1rCmDM02VfUIEQCvrgGV5nrvfwyCZOUst4KCiftsUze/mPQ2z+D72uwJqw==@nongnu.org
X-Gm-Message-State: AOJu0YxBhxqU9GCkPQhU42ORS7+uKagzDn8AINplKLZKcaavdF6gSqeS
 KjKYt+yt6ZEqIzsD81ocD4KR1bS65tMpARW5JyKhkWkxiuL0eudSSdc7BULfiD4EE5BqYTtbS0X
 95LKvbyihn8hpZfnc3liAoTk1rQSOCEu+a+hO9GVFmmY65rN6ZQPKeQ==
X-Gm-Gg: ASbGncv8ugFE6ILYLGSNsBQE/ftVZ2lig9gBGDYkNGAQi9ettZwPSILiPUyfB9zQLXm
 CpaTHJvFOLCsxKiQCYdZDQWwCk4fvkFgsj59FeLyFC/vWkGfdaCdkzrfB+fcYc9i5sGetCUWMqa
 pIvXYjiAX+ZFxFUfgDjpOYDGuou4idBBpy2sNWfLYhkJWUbvIjvdGIajvRAILXhPQsue8HF7iBk
 d47I5I8WlUiD7nrirVggRg8V9dEBOA44Drbe4hoSru1x0ozWf0RLoVJIL5H9Se1pAhbkRq/DS4L
 L2VjGk1ew3vfWWKHu1TP7IgGmGJ5wYFa
X-Received: by 2002:a05:600c:3b17:b0:455:fc16:9eb3 with SMTP id
 5b1f17b1804b1-455fc16a2ccmr88895015e9.33.1752534512264; 
 Mon, 14 Jul 2025 16:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBoIXJHcEcQ8Muau466UevAvgsGG48A6dX83SmCqWaG5XQXmJXTlJKhdgBYsCCLywhd1Ss2Q==
X-Received: by 2002:a05:600c:3b17:b0:455:fc16:9eb3 with SMTP id
 5b1f17b1804b1-455fc16a2ccmr88894845e9.33.1752534511786; 
 Mon, 14 Jul 2025 16:08:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e262c6sm13329144f8f.85.2025.07.14.16.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 16:08:31 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:08:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 53/97] hw/pci-host/gpex-acpi: Use GED acpi pcihp property
Message-ID: <48d3d65d86eb120f8441e49a1552a5094345f599.1752534227.git.mst@redhat.com>
References: <cover.1752534227.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1752534227.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wE0n1QrHe7J245JV1k9NYwqPDDwEsK85IMaylQHLkQw_1752534512
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Eric Auger <eric.auger@redhat.com>

Retrieve the acpi pcihp property value from the ged. In case this latter
is not set, PCI native hotplug is used on pci0. For expander bridges we
keep pci native hotplug, as done on x86 q35.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Message-Id: <20250714080639.2525563-8-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci-host/gpex.h | 1 +
 hw/arm/virt-acpi-build.c   | 9 +++++++++
 hw/pci-host/gpex-acpi.c    | 3 ++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 84471533af..feaf827474 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -45,6 +45,7 @@ struct GPEXConfig {
     MemMapEntry pio;
     int         irq;
     PCIBus      *bus;
+    bool        pci_native_hotplug;
 };
 
 typedef struct GPEXIrq GPEXIrq;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 782b17b966..f3bad69aa7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -144,12 +144,21 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
     bool cxl_present = false;
     PCIBus *bus = vms->bus;
+    bool acpi_pcihp = false;
+
+    if (vms->acpi_dev) {
+        acpi_pcihp = object_property_get_bool(OBJECT(vms->acpi_dev),
+                                              ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
+                                              NULL);
+    }
+
     struct GPEXConfig cfg = {
         .mmio32 = memmap[VIRT_PCIE_MMIO],
         .pio    = memmap[VIRT_PCIE_PIO],
         .ecam   = memmap[ecam_id],
         .irq    = irq,
         .bus    = vms->bus,
+        .pci_native_hotplug = !acpi_pcihp,
     };
 
     if (vms->highmem_mmio) {
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 80fc2bf032..44737a8d81 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -203,6 +203,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             if (is_cxl) {
                 build_cxl_osc_method(dev);
             } else {
+                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
                 acpi_dsdt_add_host_bridge_methods(dev, true);
             }
 
@@ -278,7 +279,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
-    acpi_dsdt_add_host_bridge_methods(dev, true);
+    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
MST


