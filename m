Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2284522lff;
        Mon, 14 Jun 2021 13:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUynJwKDXgeRq8x2jrrr6DOWmiq0Ov/RH5zlB+V494YWAkGr1DYeANfAaYe5EbwKFBoasS
X-Received: by 2002:ab0:2381:: with SMTP id b1mr14118621uan.93.1623701587325;
        Mon, 14 Jun 2021 13:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623701587; cv=none;
        d=google.com; s=arc-20160816;
        b=j4miW6VAvGx1p+hWfKq6Y7263YP79UX+WeW+l5ajUyVpYmBZAUL08+AhpDdfBPq5Rk
         FVHYpUqgqWJCrKbNwOuqjaGI+nFwrH1BxO/2dyY+Rx71VMoQzYduodyjmEocgNGGmpY6
         byFFcZoT4icxZq5CYrC7ov28HOpmxkUlSCsX56qwTsX1D96xZwksjh/KLflUVo1qnsVX
         kNWxtG+/a57ji/x7a0Nyqfy7S/5kvob9ERjXgl39ZXl+IYUnxvR2ApMlVOkDSGvySspC
         baB/Urs9J34A9ah3DwIwFkLTuLAeC9/VOaTpL8tXISy8odONKa7+wdnpv1CL27Q77i4A
         OaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1/ujT/H+jsCDhMHDnxsFjIbcqBjOv5SGrl9Ow17b7os=;
        b=JgXddSK48t2xfaGTEbvFJaLp6fOIO+Me/xo0m/N5HeVF0SOoPH/zl0w86+B7/RQ4jX
         g58bWj5SMkT+rPG5SbVJ1RMIruE9ebdmrp5MtE+rWfDu5KHhQ8OXy9XNTG46H23LXwzu
         mp9Yrfx1FMU4tg1UlB/58OyCW8gE+tUAIDp91MWPrDQwKXm/a4HOJus/fOA7W+r5hNA6
         bDRIfviO0oWBcfqtYORyHuGpeeydpkq/5qcTDdCWtDcz8vlKfuSfoBd6lUJjS59vmc4Q
         wvAmfFbThcK2489+ndy7L/H07vIXgrzTFJcWI4JWCqHm3QlfoQKV6rc7n1vlvgDbIVlN
         e7qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RP2mfWLY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si8002825vsp.304.2021.06.14.13.13.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 13:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RP2mfWLY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssxG-0006fo-DK
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 16:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuC-0001Fp-I8
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuA-0002tI-Lc
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/ujT/H+jsCDhMHDnxsFjIbcqBjOv5SGrl9Ow17b7os=;
 b=RP2mfWLY0IXnLxB6zqIvztk2V9Xf8ljJEAQT/gtuGqhgc7mOuGmuswZi9t7ifQ2zKF86/8
 IzEZAmWI0ZqOIRnjg4uHcx1P39i76cUSGj+NzjS+70FBW43igv5SI5qSfSwQyeKDsz7uhn
 FBhul4HZSLRDbgzQYxbHGMWdiu5SgR4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-J3C30FaJMr-nrw37E6n48w-1; Mon, 14 Jun 2021 16:09:52 -0400
X-MC-Unique: J3C30FaJMr-nrw37E6n48w-1
Received: by mail-wr1-f72.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so7527249wrc.16
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 13:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/ujT/H+jsCDhMHDnxsFjIbcqBjOv5SGrl9Ow17b7os=;
 b=aq3Fy5pl7AlvHeyVFUPyoBbcPtLN3vaaGlpHZfojTTrJRQBYzpFaVNnjpcjghOJhj/
 k9QpWzLnL5TTaG2k6oKk5JR3Hh8BuhxYrhOg4W6+VIq/d1qz7OSCqeUC+xtQR4LvBMo2
 AaHpEZh620AzLuFbcSHPrRyRSjNjY3WTi6aeWhEe7B5dQgQRvy9c6pXloGKofzOIakPZ
 fHY3tXSAZCtgx/tqugxC0+k3Ip1fTFFpOoMqnXc7les+ByvAMQSaMw+AXJL15sb9P3+R
 xhBIpNOedYRZhQNBX1JaaByj9Wl77tEXWNuhLZG0eqWF42ymZW9YkUssutsLL5nipWbJ
 P/9w==
X-Gm-Message-State: AOAM530uWgeUUpKSTOlFNZ6GA9CWDrmGmfxXYC7A5vqiPvzkuZlYiaCR
 Z4N+qPDaMigFxZYhe+35TidfNkyV1LHztmHzwHG0hMOxiS/DqfCwHA5xbUAyBkH8cA5nuFwycoZ
 jovnTrcYcSgl1
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr18165457wmf.47.1623701391381; 
 Mon, 14 Jun 2021 13:09:51 -0700 (PDT)
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr18165439wmf.47.1623701391214; 
 Mon, 14 Jun 2021 13:09:51 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c2sm374340wmf.24.2021.06.14.13.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:09:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] arm: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Mon, 14 Jun 2021 22:09:37 +0200
Message-Id: <20210614200940.2056770-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614200940.2056770-1-philmd@redhat.com>
References: <20210614200940.2056770-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KIyYOrb8mxBX

From: Stefan Berger <stefanb@linux.ibm.com>

Peter Maydell <peter.maydell@linaro.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-3-stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/sysbus-fdt.c      | 4 ++++
 hw/arm/virt-acpi-build.c | 6 ++++++
 hw/arm/virt.c            | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 6b6906f4cfc..48c5fe9bf18 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -437,6 +437,7 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
 
 #endif /* CONFIG_LINUX */
 
+#ifdef CONFIG_TPM
 /*
  * add_tpm_tis_fdt_node: Create a DT node for TPM TIS
  *
@@ -467,6 +468,7 @@ static int add_tpm_tis_fdt_node(SysBusDevice *sbdev, void *opaque)
     g_free(nodename);
     return 0;
 }
+#endif
 
 static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
 {
@@ -488,7 +490,9 @@ static const BindingEntry bindings[] = {
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
+#ifdef CONFIG_TPM
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
+#endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 60fe2e65a76..f1024843ddb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -205,6 +205,7 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(scope, dev);
 }
 
+#ifdef CONFIG_TPM
 static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 {
     PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
@@ -236,6 +237,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
     aml_append(dev, aml_name_decl("_CRS", crs));
     aml_append(scope, dev);
 }
+#endif
 
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -642,7 +644,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+#ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
+#endif
 
     aml_append(dsdt, scope);
 
@@ -745,11 +749,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_iort(tables_blob, tables->linker, vms);
     }
 
+#ifdef CONFIG_TPM
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
         acpi_add_table(table_offsets, tables_blob);
         build_tpm2(tables_blob, tables->linker, tables->tcpalog, vms->oem_id,
                    vms->oem_table_id);
     }
+#endif
 
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d4..9122e22ee0c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2599,7 +2599,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+#ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.31.1

