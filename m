Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp64140lfc;
        Tue, 13 Jul 2021 15:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBuPr/7J1F8dglz+/hnqlRsBZlR1rtyK/h3LtzGRhI84MeluB+NqlKwtwlIdbR7II/BsaY
X-Received: by 2002:a0c:f181:: with SMTP id m1mr7179328qvl.15.1626215165721;
        Tue, 13 Jul 2021 15:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626215165; cv=none;
        d=google.com; s=arc-20160816;
        b=WTXE2UgeOn7QwkldFZ/3V/ijbse214pBsLvoWdhUGOsXZ3KnounCe3/1aEka8Q63GX
         etzNfKeyJHDG/vgijhpTs7Cz1eHjXzSAAwbkcc1Z9qQzjuyHZ/mk7Siw7KF9nN82hu20
         vjB2+TmlhDXR9nZX2uyps7JynRnhfjQZ4O0B6fWYtgw7LDacx2B0IlUoMpqcZ7wViGm6
         8RLKZyZetGUdfdfzQxk+Y0z2OvhfziMPlXmOuNjDJqyeLTTsniWAILu3WKp30aeEopHF
         uGmhB83a5kzT8zNBEVx4YT6d5mgV93lTzEPFXYgZHuFEx6LN3VvDd+NiTF6bxkQoUH9I
         1p+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
        b=FqbROqKnA4koU0nAn5PkY0cY3fpGIalmGM1f/H26ABJ0k8SvOEXTTjqCzyR7lb9fOY
         WvGcgOoUoNVPxPh8H7M6Pm8yZ2PDSu0WXh5xaKFLM6H163jzkwM79AU2fAArF5uvKL/W
         WcDycs8Ixbr1rxkN5Fm7HHyijxI2btOc3Fy3abxHwTZwv2er+5ihbegEsKfln9mRpRB4
         TGP27jSMaOo3rS8F3DW3fypAvDkclAQ3mWrtdq8Xz2UvuynYVyamKLzfC0HLObBfCBOj
         CeI6myaZSbX6tPlezE+F36fzLC+OQmrVa2Zfb/RWtNe9g6hUUs3ZECSJmufbl1nbWmiF
         MDhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qdw8Z80m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si151767qko.77.2021.07.13.15.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 15:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qdw8Z80m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Qqq-0007jK-VZ
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 18:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcP-00081B-OL
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 18:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcK-00089K-PO
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 18:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=Qdw8Z80mwRSXb39XNg8Hkk1+eTgcC30PTzyCKz+EAXBTNQfJ8ao9e5nHHdwqeNqCzGzXHV
 VwSwQEAaegU9hEyCObnfR80s4xkdT5uP6e8ed0asquCJsRl7nV8j8Kw+xxLOqkUoz+ftXD
 V595U9UlIwZUiCsd85r80J93mBgOidg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-eBhCbz22NVe7f-LPGSvdsQ-1; Tue, 13 Jul 2021 18:11:00 -0400
X-MC-Unique: eBhCbz22NVe7f-LPGSvdsQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i10-20020a5d55ca0000b029013b976502b6so345533wrw.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 15:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=Gkm0ixEQH52VIthdO4ZPc8WZBNi8NmpQpLBGKaX5PPRm/Gcm1DIFIj7IUfKbonsPmu
 aHLEl9kmskeMioZtmvBWbK5UBejMl8kaQvMsupupMiJtq7vXBfYxuKmm8JbPotYqhw+/
 r6CBmjQDdKOzT0b38/ryijt9NZ64TNo78pAVSC+KdpyuAxFOZhTaH3F6oiFchKN9S0Rx
 GKm/VSEOHI8wqzV0E8rCT7foWpFwzy6TWFZoQGGLhW/UZZIvuw7WJ+AaNR/FV3CUmtt3
 dfeomGGHDRgwKgPWrOt3uGcrqbgUUGeXcSmnZHCIbJin5FTK3MKYqDeiaCHiMPsh/mYZ
 M1BQ==
X-Gm-Message-State: AOAM533P3NfRiliHHyUIi68cj/D1wZnWd4C+CDKEeKiPGVythMs011c/
 n40WqJZCJH70vFOk3cW0+CHGGA5vdvtxbIYaFaswJ6hQ14OP7UiTc8V8IRqr1RD6aKpDQMHmpRV
 1geb4WrAi/xZ9
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr7327327wmp.43.1626214259303; 
 Tue, 13 Jul 2021 15:10:59 -0700 (PDT)
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr7327313wmp.43.1626214259099; 
 Tue, 13 Jul 2021 15:10:59 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id t22sm284297wmi.22.2021.07.13.15.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:58 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] hw/arm/virt: Add default_bus_bypass_iommu machine option
Message-ID: <20210713220946.212562-17-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Xingang Wang <wangxingang5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DlznzeX0wx8t

From: Xingang Wang <wangxingang5@huawei.com>

Add a default_bus_bypass_iommu machine option to enable/disable
bypass_iommu for default root bus. The option is disabled by
default and can be enabled with:
$QEMU -machine virt,iommu=smmuv3,default_bus_bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-4-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/arm/virt.h |  1 +
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..9661c46699 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -147,6 +147,7 @@ struct VirtMachineState {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    bool default_bus_bypass_iommu;
     VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 93ab9d21ea..81eda46b0b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1367,6 +1367,7 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
+    pci->bypass_iommu = vms->default_bus_bypass_iommu;
     vms->bus = pci->bus;
     if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
@@ -2322,6 +2323,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool virt_get_default_bus_bypass_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->default_bus_bypass_iommu;
+}
+
+static void virt_set_default_bus_bypass_iommu(Object *obj, bool value,
+                                              Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->default_bus_bypass_iommu = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -2661,6 +2677,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
+    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+                                   virt_get_default_bus_bypass_iommu,
+                                   virt_set_default_bus_bypass_iommu);
+    object_class_property_set_description(oc, "default_bus_bypass_iommu",
+                                          "Set on/off to enable/disable "
+                                          "bypass_iommu for default root bus");
+
     object_class_property_add_bool(oc, "ras", virt_get_ras,
                                    virt_set_ras);
     object_class_property_set_description(oc, "ras",
@@ -2728,6 +2751,9 @@ static void virt_instance_init(Object *obj)
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
+    /* The default root bus is attached to iommu by default */
+    vms->default_bus_bypass_iommu = false;
+
     /* Default disallows RAS instantiation */
     vms->ras = false;
 
-- 
MST

