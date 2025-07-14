Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33A5C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 23:29:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubSKg-0008AO-J0; Mon, 14 Jul 2025 19:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIZ-0004HX-Be
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIU-0005r2-1y
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752534561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsGvHLuViq0eG3d8AKEXA0j+N6nfPMsx/ttHRgiNFf8=;
 b=Labwx68q5SL0BNKp3zS8gulO+vJ26wj3qbu3tmhZdA9nQCCx4RO2BAQrRqSG/RvZTVDfPO
 wcytLPdQEbH+D+D21G3TRC9wNBkDiVp6WPLgQHWrfwzhkBSh5AdNYH2mlLMNZTK2qXQOrW
 Uyym6FhKgME07bVnZVdCkfQhjxDDZps=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-WXe5Bwa5Pv-ee1ilqc37aw-1; Mon, 14 Jul 2025 19:09:13 -0400
X-MC-Unique: WXe5Bwa5Pv-ee1ilqc37aw-1
X-Mimecast-MFC-AGG-ID: WXe5Bwa5Pv-ee1ilqc37aw_1752534551
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-456013b59c1so14814705e9.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 16:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752534551; x=1753139351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsGvHLuViq0eG3d8AKEXA0j+N6nfPMsx/ttHRgiNFf8=;
 b=IdaY5jH+pJ5Bt0Y1B4LJuZLGw9+AGkNCztMuzS7FS9efLX+ndUft9dvBRUFtQ2vwkY
 qnAXb2yv0CrIvC67//oEgE6uxASXDIqmPX8gdxMmHZcRyOZph5oODdGV+vtzXt0awUaf
 OeaApwFbsEjpzb/o5EjaVirFeuwPAOEk2TfaCDAM1EVgnJP/3XXgCReQyCzu4jrgZrPH
 vz6LQ+lrrtbXEkVG+26A3HZuQ/1zDHVjiYqS00VsfBCDiij6zhyQ1cOKDtjGHWoXhxF7
 4UCVOBwwdNogpyjw8pXOKyZuzUUZcLFJUmNErG9L2oKFmffSZ2/QtGh+hja8IlD67bEL
 REzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNg1dq9P5Cc3BcXGI8rQ0wldb5T/njEKpbHX/5HRQ0KqGYqfha+Q/hWF0fAbqVQ9rAbExkPEScbQ==@nongnu.org
X-Gm-Message-State: AOJu0YzgOjIm5rs5liOaYHmgBmIQpeJs1S9H2s6hETsPo8ug8hr8PvZq
 D9YKqLeV4v766pgTWqebH62/o3Ye1+uLiqB3bOMiVf7v73oX+0M7SYkumzP70zZ8XScm07UEO1C
 1r1K/uBSI8QYtkzghrBptPVNoCoOK2zZ1XlEOwgPTrewvp0cWFCsY7w==
X-Gm-Gg: ASbGncuuZLavYu1sOwPzKoZF6TCFUwZiLoaFxmoxfxT58F3uh0otvdsoiH7Qxg/ki8J
 +7Ttn9Aq2ehz47KxKLU1VXsJslaYrGeHdPqrGciw3m5cxzdCp2juDSIDhC0JrOlQOUe27u2v5hm
 pk0CeVvL1Jdlbq8Rufm/QWrRzttl/QzR8wvIaM0aWVBC+UbJC6LafhaRtACOpoyszeMXR7/5j2+
 EaU1by0FPTAHUGnMJIMMUtsavNrdy4YQ6u0rKmjtJ20e+2lxduLvuJYA+P2LZa9VO7yn3Rg/ZrJ
 xLRf5Df0k/ZuUnVnvooNZ4yiW0DB1k2a
X-Received: by 2002:a05:600c:620f:b0:456:2771:e654 with SMTP id
 5b1f17b1804b1-4562771e755mr3600335e9.24.1752534550915; 
 Mon, 14 Jul 2025 16:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGW68l2u+m2NscAhgpIkVRnoQOQSdxGgbPL86GHDJ/2260IraYJ0ERBlSzO4E801O6K+ZXqA==
X-Received: by 2002:a05:600c:620f:b0:456:2771:e654 with SMTP id
 5b1f17b1804b1-4562771e755mr3600165e9.24.1752534550514; 
 Mon, 14 Jul 2025 16:09:10 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456114a417csm66266125e9.25.2025.07.14.16.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 16:09:10 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:09:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 67/97] hw/arm/virt-acpi-build: Let non hotplug ports support
 static acpi-index
Message-ID: <63e48f0e334767ade8310f27f01ef73ba1145a34.1752534227.git.mst@redhat.com>
References: <cover.1752534227.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1752534227.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QxU17rvex1BGcxrm9vmNhINpyWKHZjsPYxHTUW9jrIY_1752534551
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
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

hw/arm/virt-acpi-build: Let non hotplug ports support static acpi-index

Add the requested ACPI bits requested to support static acpi-index
for non hotplug ports.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20250714080639.2525563-22-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 12 ++++++++++++
 hw/arm/Kconfig           |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f3bad69aa7..3dc1cfcd67 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -34,6 +34,7 @@
 #include "hw/core/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/nvram/fw_cfg_acpi.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/aml-build.h"
@@ -906,6 +907,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const int *irqmap = vms->irqmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
+    Aml *pci0_scope;
 
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
@@ -959,6 +961,16 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
+    pci0_scope = aml_scope("\\_SB.PCI0");
+
+    aml_append(pci0_scope, build_pci_bridge_edsm());
+    build_append_pci_bus_devices(pci0_scope, vms->bus);
+    if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pcihp_slots(pci0_scope, vms->bus);
+    }
+
+    aml_append(dsdt, pci0_scope);
+
     /* copy AML table into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1634e26fcc..2aa4b5d778 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,6 +34,8 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select ACPI_PCIHP
+    select ACPI_PCI_BRIDGE
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-- 
MST


