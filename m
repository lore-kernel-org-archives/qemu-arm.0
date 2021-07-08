Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp299616lfg;
        Thu, 8 Jul 2021 05:59:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3B1QTS1Pddk98fxYtpgFHdc2FmFjBh6W06N4u98BBVLyNfNTREc6ZBq1xjJNArolZsZc+
X-Received: by 2002:ab0:6805:: with SMTP id z5mr16274262uar.87.1625749161656;
        Thu, 08 Jul 2021 05:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625749161; cv=none;
        d=google.com; s=arc-20160816;
        b=G9jBT3iqWRjP+yfByR8Q4gH6T6TdEVHJIrxEUmr8V4FO/3MjxHVt7BJjFaPoBVvqs2
         iwalhYRalx3ZShIIib2V9oTUNgNFVCFd7ohC3jhZzlKA1P7d8zJFtWmBwsZpU+pQkXLq
         DvbvkCJavetdTNIs8VyG6W4WiZVN2KKXKMu8rhu7AIeh7cSbvZkhOQ/BP/YjjGuhY11Z
         b2qyHW0/12Q5N4k0iD3L8Cgd8QUSOGVSVIJ/VhmfclQNJyQu2MxkcWUPVB1s1XE4yPoT
         fzugcDUDDGTMk7FH7/HgqYOkfWp16Tg+BlDwROXut6L86gKdfDUhB78fR4Djc5V454ge
         HODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=dLBBOSd+riQ3r7UED4ykTr63nX8zh7KH8Gsgw7YnvCo=;
        b=XSpvYeQyf466vtDLgfBz9hcMPvJaFc++eezfP4SVaD32BZ6qJF+ht6X9TuF9IpaiPH
         +9xURCjXpSC0d0EUrridSCtC2d/vYC5hIH5kjLYXwHZfT9fyTs0/ySYBfO8kJ+FXhXwK
         vuuMgNQM3PRDe7IgigBWSo58vTn7nOxgF65yiR1rY/ZOhdmNWOtgiC7lYSyXWploNK0J
         qzDU5S7fTxaI341ZCnMJLTGcqKLkR+1cSoHU1bFEdjCOVgN7PoEDh123oQDzgPh54+CR
         G2Bh/G0vhS0sRQkjcHgld14vHhB9mp/i/ehEy23yUMrVv2VaA5i3/W0B0wdO8dIe5lfb
         yXVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si1761805vss.430.2021.07.08.05.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 05:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:60862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Tce-0003NA-Tp
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 08:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZK-0004Mq-UD; Thu, 08 Jul 2021 08:55:54 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZF-0005eF-8A; Thu, 08 Jul 2021 08:55:54 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLGQt0pytzcb9f;
 Thu,  8 Jul 2021 20:52:22 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:29 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:28 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 3/9] hw/arm/virt: Add default_bus_bypass_iommu machine
 option
Date: Thu, 8 Jul 2021 12:55:13 +0000
Message-ID: <1625748919-52456-4-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
References: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangxingang5@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: JDy84+7Re1xq

From: Xingang Wang <wangxingang5@huawei.com>

Add a default_bus_bypass_iommu machine option to enable/disable
bypass_iommu for default root bus. The option is disabled by
default and can be enabled with:
$QEMU -machine virt,iommu=smmuv3,default_bus_bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f06014..a2805977b8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1364,6 +1364,7 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
+    pci->bypass_iommu = vms->default_bus_bypass_iommu;
     vms->bus = pci->bus;
     if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
@@ -2319,6 +2320,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
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
@@ -2658,6 +2674,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
@@ -2725,6 +2748,9 @@ static void virt_instance_init(Object *obj)
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
+    /* The default root bus is attached to iommu by default */
+    vms->default_bus_bypass_iommu = false;
+
     /* Default disallows RAS instantiation */
     vms->ras = false;
 
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
-- 
2.19.1

