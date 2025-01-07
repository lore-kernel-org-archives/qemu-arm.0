Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp240829njb;
        Tue, 7 Jan 2025 07:35:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJppXcfH/v3Qzc4ZAOMM2fAltfNMPe3O/RGG7EjAZI+m6f4HRVJKqH+uMRNfKLhbw0kSOFbFVlkLqemQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGVeYHgtIcXbjFI45XQ3Ui5ca/I7Lmgv0iyEaQAmK/olupUarGJ4b8AJUqVBaBP+nKINf9s
X-Received: by 2002:a05:620a:260b:b0:7b6:eef3:aeaf with SMTP id af79cd13be357-7b9ba5edfb3mr10703850285a.0.1736264124166;
        Tue, 07 Jan 2025 07:35:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264124; cv=none;
        d=google.com; s=arc-20240605;
        b=HRvPrckWNjncIjC8IpuiLIkH/oujr9G8pGnkgRT2YNEegZOKTzCT6ymA3nVzMqMbli
         Bc+/hgYoB+cvjuEWHQZPTUfuI/zjqLhlw1VhjspjW0C7OIEnEKfeIKC5qV2Y1hATrmpq
         cOV0ckjUOIED5efo1PYWLrbp/1XbcCUuJrSsTYiuX5C4tiRa04sTO2SjdUNQKe65AsRS
         0+c2EoH515TXSWJ9Uw+FGZEByRrQE/zgTpsBUPkrZrU/xIZ/a8LDGSQWpFkeeNhmrdFr
         GRw9E8Uow+la4UkwxDnMeu1+1SYwj56ChMDas33iBaLeWk9o6X4+I6ddBdaP7voX/BLQ
         unLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Oms5RWxiSjkIU9AQhaOd854sk01PnwCnlIaXt2N+Kh0=;
        fh=2A4XrmpWSce8Hg7gb/jK7T/bzdECrSdzPXJ+gvyt/8c=;
        b=j+qLNpNqRPoaYKNqI3E5d/aVvIXDGDLCnxaE7vNEKySPUgbdX09eX+TmKQiMYExog+
         nsSO5PG9yeYM6WNaaZ+tI13AcnNGNRDete4QfGBH/VpWmtxk8xPdgD+X6Ppljfm213en
         5tNDSpkXG567tgZhd6PW4EGoGYuJKVQNhDSuHWXoqksc9FVnACaP/ohS/FVGT5N17DzE
         fFjTWBnD067bV+PA4vPBJfcx1jglgtqQKKicaiR1oOD4udZNNKmNeqOh10R01ldr17sd
         4Fb1iSCeSG7Q1C5O83etcP2xMNR5hvPG5yWC00quCB7UC6CBZ1hwgaItD3630q/pcTLR
         gj1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QVi/SgIo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2ad6c4si4394632385a.93.2025.01.07.07.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:35:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QVi/SgIo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVBbH-0003Ym-G8; Tue, 07 Jan 2025 10:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBbE-0003Ni-BF
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBbC-00059t-Nm
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736264069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oms5RWxiSjkIU9AQhaOd854sk01PnwCnlIaXt2N+Kh0=;
 b=QVi/SgIoS50pYIMp+H5+ARShG1vJ6KyqdQHIVGSf5QudgjcFizoCzyESo1w6X9UqGn9WtC
 jmDIf5idoTcUlnqme5piNZMPXcMmGmpU0oBzZbORgWvotqGiz5cZuY5zxl1oSU9OV7R4H9
 GJNL/6saUdwBGV/dVsRlsTMsAkf1m78=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-gv3Jr0CwPpWRgZQywki7qg-1; Tue,
 07 Jan 2025 10:34:26 -0500
X-MC-Unique: gv3Jr0CwPpWRgZQywki7qg-1
X-Mimecast-MFC-AGG-ID: gv3Jr0CwPpWRgZQywki7qg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7E81B1977037; Tue,  7 Jan 2025 15:34:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.66])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4DA9919560BF; Tue,  7 Jan 2025 15:34:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BFD741800605; Tue, 07 Jan 2025 16:33:54 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 19/21] hw/arm: add uefi variable support to virt machine
 type
Date: Tue,  7 Jan 2025 16:33:46 +0100
Message-ID: <20250107153353.1144978-20-kraxel@redhat.com>
In-Reply-To: <20250107153353.1144978-1-kraxel@redhat.com>
References: <20250107153353.1144978-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FyigWkxfIH1vvGCwxK0_MeQMSdyKGyspZCoh9gmy_ks_1736264065
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 1t8g0z6HiTme

Add -machine virt,x-uefi-vars={on,off} property.  Default is off.
When enabled wire up the uefi-vars-sysbus device.

TODO: wire up jsonfile property.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/arm/virt.h |  2 ++
 hw/arm/virt.c         | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aedc9..393ea2cbec78 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -79,6 +79,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_UEFI_VARS,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -156,6 +157,7 @@ struct VirtMachineState {
     bool mte;
     bool dtb_randomness;
     bool second_ns_uart_present;
+    bool uefi_vars;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99e0a68b6c55..6856ecb4dcf2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -65,6 +65,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/irq.h"
+#include "hw/uefi/var-service-api.h"
 #include "kvm_arm.h"
 #include "hvf_arm.h"
 #include "hw/firmware/smbios.h"
@@ -181,6 +182,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_UEFI_VARS] =          { 0x090c0000, 0x00000010 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1369,6 +1371,24 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     return fw_cfg;
 }
 
+static void create_uefi_vars(const VirtMachineState *vms)
+{
+    hwaddr base = vms->memmap[VIRT_UEFI_VARS].base;
+    hwaddr size = vms->memmap[VIRT_UEFI_VARS].size;
+    MachineState *ms = MACHINE(vms);
+    char *nodename;
+
+    sysbus_create_simple("uefi-vars-sysbus", base, NULL);
+
+    nodename = g_strdup_printf("/%s@%" PRIx64, UEFI_VARS_FDT_NODE, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
+                            "compatible", UEFI_VARS_FDT_COMPAT);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    g_free(nodename);
+}
+
 static void create_pcie_irq_map(const MachineState *ms,
                                 uint32_t gic_phandle,
                                 int first_irq, const char *nodename)
@@ -2425,6 +2445,10 @@ static void machvirt_init(MachineState *machine)
     vms->fw_cfg = create_fw_cfg(vms, &address_space_memory);
     rom_set_fw(vms->fw_cfg);
 
+    if (vms->uefi_vars) {
+        create_uefi_vars(vms);
+    }
+
     create_platform_bus(vms);
 
     if (machine->nvdimms_state->is_enabled) {
@@ -2621,6 +2645,20 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
     strncpy(vms->oem_table_id, value, 8);
 }
 
+static bool virt_get_uefi_vars(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->uefi_vars;
+}
+
+static void virt_set_uefi_vars(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->uefi_vars = value;
+}
+
 
 bool virt_is_acpi_enabled(VirtMachineState *vms)
 {
@@ -3273,6 +3311,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
 
+    object_class_property_add_bool(oc, "x-uefi-vars",
+                                   virt_get_uefi_vars,
+                                   virt_set_uefi_vars);
 }
 
 static void virt_instance_init(Object *obj)
-- 
2.47.1

