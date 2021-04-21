Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp218411lfb;
        Wed, 21 Apr 2021 01:08:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/E3mohjOK7FKQRrm2SUTRS5p2J0a4Gbge0oYQsEH099AwJk/gWjVc5iNifuaBhvN/0IYV
X-Received: by 2002:a67:2245:: with SMTP id i66mr24040194vsi.36.1618992495270;
        Wed, 21 Apr 2021 01:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618992495; cv=none;
        d=google.com; s=arc-20160816;
        b=SX98CIpFClrXCsAfjPitRWdlJBMKHiDY8gVUWGw1X8YTbd+koWx5u9Nb76MtI2E+rt
         oYI62BTLdyfU2srY/Y6XGaGsoJEf33UiQlqm82k89N+qXoYBw0fr9O2FwpGDn2Sxm0ph
         YEBNVq3sQ5uutCG/nJwSKy0igw5sDcK2/3fab/mzNGLiQcwSrGtWmZg2Lg3YfKWg8+qJ
         /MREKka66UkfOh/wuPkEnCCpLHnd5uEXczXXXrtK5Ms6yfHCxOXaQEGitfaob7ixSXWi
         01XDqJEBBIhmySHMgXGAjrI4HAVPt9LXYfoR2tysMld9bCrU5/w513d9nwvv+Dy4G+j1
         KXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=bU5zFh8iYCtm8oAbkYXkcwL8KEeFb8OxsuUOIuTgYrI=;
        b=BnIXRjiez457J1j6LjxixtR/1VNfenNQ0lxmSjms+YPXlWpPV1jwu4gByJB9iuBl8S
         2ZUYBBQ1XcQwblY3Scy9Ui91uHabX7vdLIABivn7MYekfq3i5S7FxQ+uY7vRVJaa/19P
         8sBG119GBizoBdYI6ur3KPwg+0WVROak8FNrDw865giIeOEWdlCBPrZDkGICNYXL9GvK
         8QZq7s6XVehdt+f4FIvo+Xr947a/7/nUXJUsCeUdsK2nO9s897VoLZvYePV2EVJga1jc
         85RTBjFpEHpD/yU/lWX4FXsViy9jFEK0je2hkghfXbggnSEWsjfIz02a2Cyxx/itS4fy
         GFbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si589226vsg.313.2021.04.21.01.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 01:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ7uA-0004kn-IC
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 04:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rd-0001Fr-Lh; Wed, 21 Apr 2021 04:05:37 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rY-00023w-6y; Wed, 21 Apr 2021 04:05:37 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FQCjW5KSYzlYqQ;
 Wed, 21 Apr 2021 16:03:27 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:15 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 3/8] hw/arm/virt: Add a machine option to bypass iommu
 for primary bus
Date: Wed, 21 Apr 2021 08:04:58 +0000
Message-ID: <1618992303-19556-4-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
References: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxingang5@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5WUweP7VYAA7

From: Xingang Wang <wangxingang5@huawei.com>

This add a bypass_iommu option for arm virt machine,
the option can be used in this manner:
qemu -machine virt,iommu=smmuv3,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f01d9041b..0ce6167aab 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1366,6 +1366,7 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
+    pci->bypass_iommu = vms->bypass_iommu;
     vms->bus = pci->bus;
     if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
@@ -2319,6 +2320,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool virt_get_bypass_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->bypass_iommu;
+}
+
+static void virt_set_bypass_iommu(Object *obj, bool value,
+                                              Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->bypass_iommu = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -2656,6 +2672,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
+    object_class_property_add_bool(oc, "bypass_iommu",
+                                   virt_get_bypass_iommu,
+                                   virt_set_bypass_iommu);
+    object_class_property_set_description(oc, "bypass_iommu",
+                                          "Set on/off to enable/disable "
+                                          "bypass_iommu for primary bus");
+
     object_class_property_add_bool(oc, "ras", virt_get_ras,
                                    virt_set_ras);
     object_class_property_set_description(oc, "ras",
@@ -2723,6 +2746,9 @@ static void virt_instance_init(Object *obj)
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
+    /* The primary bus is attached to iommu by default */
+    vms->bypass_iommu = false;
+
     /* Default disallows RAS instantiation */
     vms->ras = false;
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..82bceadb82 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -147,6 +147,7 @@ struct VirtMachineState {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    bool bypass_iommu;
     VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
-- 
2.19.1

