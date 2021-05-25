Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4107271lfm;
        Mon, 24 May 2021 20:50:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5PnGvE2/uoTY2XBzLa69zcCFQ9HNMsjrT7kFnkys4J9ZJ2Fz8Mo0xAFbLT7R16JQzpWCW
X-Received: by 2002:a25:e443:: with SMTP id b64mr37764782ybh.379.1621914646970;
        Mon, 24 May 2021 20:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621914646; cv=none;
        d=google.com; s=arc-20160816;
        b=D38npOw9n8jh9VZi8FGoraFFgKgoTfTjqHK9uHYGn9oXQeV3S7ODiK/iUq8YQr6TJT
         sYWcgKw4qPRxOzMwMm6aHgXpptwQT+7/Nu8yfebgGmoKMdcqcYjtdwruUZRvzs+aLUFE
         yO5oHzW6DSO/HFLYgd+zE6Oa4YmFvtTahmtKOnzT48PnYNtEP6LYRpXF+Z7C6TuB7cRr
         D/br1L7lj+9OmGOKUKrr7Nkaea2elnaIAtj4KMyoH6KD63U1KCwoIEoU+u0tsrPVaIzc
         bnRD2ijA9Sdouzi8UCA+wWFbABROhRONv7ACGqa0mFBQFSA0aLs6ZN2yyc2/egPDJ/Oy
         BGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=3ZjghSdA+PTnHNRUrz0IR1SDnIYDrTmMV6zO5jAQe6o=;
        b=tD+Y5kies3gOjxtlaii5OPFLuVWe7D8wrh4cCdczoyfA7ugYGUF4YGp6dRvNmCCeYW
         LBkfZdyz+8iONQEfVAXMgrhCjp6AcNKUYB3ZRFK5vCrLQr7CcgXYwtEBCNSiG/QlnfY/
         rgCtntVq4P56h8pgxiPgslXNATc1tfpNEMYzCOblbinUAonbT4YuUiiQbdXZcj3oSs9x
         8HhXvspYEKDpBJxtkPD13MEWCD4aUVeFo8Z8T0b/bN8W/tUbnmi4iOK38ECDVFKzAYvY
         +lOmjVTx6YsKE4F2Q3aJpWJW4Jse0++QQkEFhPPo/5EraKzZ/xILR9PqX1q5/naWz9yn
         pnow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si15138685ybr.194.2021.05.24.20.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llO5e-0006jM-9J
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5L-0006Nb-8J; Mon, 24 May 2021 23:50:27 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5H-0001kj-7r; Mon, 24 May 2021 23:50:26 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fq0Qx54VVzmbJL;
 Tue, 25 May 2021 11:47:53 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:13 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:12 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 3/8] hw/arm/virt: Add a machine option to bypass iommu for
 primary bus
Date: Tue, 25 May 2021 03:50:00 +0000
Message-ID: <1621914605-14724-4-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJbkrrkP+4N2

From: Xingang Wang <wangxingang5@huawei.com>

This add a bypass_iommu option for arm virt machine,
the option can be used in this manner:
qemu -machine virt,iommu=smmuv3,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d..49d8a801ed 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1364,6 +1364,7 @@ static void create_pcie(VirtMachineState *vms)
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

