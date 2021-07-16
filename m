Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1394192lfc;
        Fri, 16 Jul 2021 08:22:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6zKqCJAIU/TzcIYUzACcAi/1Y+Utjhgsv3FL6uVZKWwZufkPXlwWyhdWaqJEujHsens8C
X-Received: by 2002:ac2:4356:: with SMTP id o22mr8503529lfl.309.1626448922786;
        Fri, 16 Jul 2021 08:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626448922; cv=none;
        d=google.com; s=arc-20160816;
        b=pzDu35Qq6ajBbIaDb7BnjPPeozxZsxMaxc62mz5bBTTaBVjBooso0sH8Lr/hxAFZNd
         phPlCB+U3RVl/LhOEI7n+ygvQcqJ8CV1RQCtczzwlvRunwYgWvOX9SvmORCTQs3IqzrC
         4XbXZ0DGpGpdFJ2Sl26ciI40VriQLsnpaRcDrBn8gJs0CUqSnxHq8mM1FSyAzhoU+vXl
         CG7JqI9BB5/Yux/OCEke/z3HCfj46pdpbCQ1uAaBropGwFe5SF4+9DhTMOeSm9aMLUgn
         ByxCTUVSSHXhzkxtRc/zNeEh2QzyE+x0CuRdDLMFFriF4A2N4ButiyTMEKYidMNbHMpC
         J6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
        b=TrC9W7fDHh+BAKmtHLjMkDiH7AOnnX59xLw8Agolyk6H4X5T/ANaZdgGuxsdugBGTE
         NpBxbrMSiBSgTYp0+gimtL0pbCrW/HjO4B++vlOeLJ2Mnz6XqA4lEdBp97SGZ890S0xW
         D/j/4MzPYhvkUFmfObQfV2Dg3I197TZ9mbV+cTFpQ/sFLwoI92hUv+AzN0SVZKE4A1sP
         MZbQYtcZxAH1YsYj9fHKFXHOUGmeJsu7fygosuO6UlpuLcvSNl3rYvXsmjtEFnJLqDo6
         /1av9q5xdRsmRj/hg2TZJ6CpwHInUBGAPL5wqMbaVk/xATY5FIsOQ6X4rM2fEXeJn4xq
         VOVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OR0NYFCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si15716186lfi.78.2021.07.16.08.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 08:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OR0NYFCE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4Pf7-0006A1-Fr
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 11:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYv-00018W-1F
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 11:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYt-0004Fh-CW
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 11:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=OR0NYFCE7DDDSBcJaERChJ0eF/DQY6VDuTYXhI9zJWW5bgZ4aAtIHDHkfu8NizJWbXtXe7
 G4DChqX0NBtihBCbtoI07Lp5+nNPFD0m1OsODSH3lMvhj/3RRZ5IrZR78ygQwUmsE381iw
 E2LuduCEaAHls/0FqbB8vkybeT1Rf+E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-X2jPJ-rsMsukKObSg2kADA-1; Fri, 16 Jul 2021 11:15:33 -0400
X-MC-Unique: X2jPJ-rsMsukKObSg2kADA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a4-20020a0560001884b02901401e436a18so4952794wri.21
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 08:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=XoA0xO95v1E9/QmPuvJHCRp5NAj5wxH3zVESUPN2U1VC6PEGqMtl8aAg4H4YOy8spJ
 YuSEGITuUuC9BthvyYSjFzZEYZz9EYLzsVbZ6bXf07jWAHQBEKQD3/40QeHS+LnYNfJ2
 2KzCVB5KzxQL43jtIH2k+aLiyaeCMaZeYgr6Bc4JptUorDcxzYDBMO//m1519cW8MooS
 YJIG5jNTm+nBgYMhRbzE4bAFh/Xvlgn8NekcmdcLAYQne9dHidOmFP2WcPnyxBpMod03
 lOCaqhsxT0bDOgbFDNpL2kinoI4NginqdI+cC/53efnjTVKp48yW00u3tPBte3bMbSMm
 /2Fw==
X-Gm-Message-State: AOAM5319DGnQCClZeLWl1h75or4aoF31yrU8BSbP3fWVndv0shLsePTF
 Q+xVinISaL+b7pPOomtSHSj4MManagunwSRGG/MJwlYXSIh/8WDdc5CwA1rTi8fnVtJPuiUJb+Q
 NoagfAMlb8ocq
X-Received: by 2002:a5d:6e07:: with SMTP id h7mr3828698wrz.233.1626448532073; 
 Fri, 16 Jul 2021 08:15:32 -0700 (PDT)
X-Received: by 2002:a5d:6e07:: with SMTP id h7mr3828677wrz.233.1626448531888; 
 Fri, 16 Jul 2021 08:15:31 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id l16sm12460724wmj.47.2021.07.16.08.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:31 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 12/19] hw/arm/virt: Add default_bus_bypass_iommu machine
 option
Message-ID: <20210716151416.155127-13-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
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
X-TUID: rJOym+yfhfG7

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

