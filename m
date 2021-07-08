Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp304746lfg;
        Thu, 8 Jul 2021 06:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW5lhLKikC8tV846pidEUM4432sL0Uvywfbus2LzXkZTSM/AIXTrmdjCo6Px06ksc1GC+8
X-Received: by 2002:a05:6402:34cd:: with SMTP id w13mr12200428edc.377.1625749463835;
        Thu, 08 Jul 2021 06:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625749463; cv=none;
        d=google.com; s=arc-20160816;
        b=qLLMRUfR/38YLv5AQLmNgXuPsn9vpWhd5GlQIB0gwY58cRhBfiLtAseEmqOcIrjSlG
         lLMS9zgsuFyDtjDocsSpO/TB/riRvYX8QeRXTVg3CYibB5bAZQgR5nEV9Bu5p6s5zkVt
         JgmOO7QRrmo0H/CjY4XqlFJiahHXhLUS7kS8LTZ36dNvHXZnZxz4mPqHwVw632VMsluD
         nxoKJaVtWFRcMAzWPiiW5ZdIs7gd8kOh+PD/gmwZNommX3Wa0N56EX1X8YxrrEMWELvm
         Et/ZT45M6rLidAvDdce7dDRuCE0f3lKT+DZ8Pk90tCVy8EygGdVRgCoZKG5j1TUtnC/v
         PPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=JJZulcQwVtCo7yTuaj+1P6pPVzazDqoMwM3zMPLh4wo=;
        b=XQuqoF8MDcZeiCOuute+VGUNYaPPejnDEPgUO4bdn3yOZDWnntRehOjMXUUZ1e0fbl
         TwN0UNBIAFpNxbof7LLu7vVI4czV6FD5j+3JzjXK8KWtLJ8YhMCK6bl+VjnUUG73bcXY
         OBAIlNcvK68ES+WMnOcsYdLPt8ms74Xb1xSBl3KXSOxNuU9iP1B9iGqsHz0qMIJVJ4iK
         OXudBbgVB6d1E1oAMWcpFP0JxdiVtiafYOGd9yxT1S59J4c+XF9YJozytfFTNHgzAu/P
         VoQ81CqJe4cw8r3PqtTzMDiR/NW2TaZb9XX2e4x4JrgGkPewKu51km0XkxefGNYtphta
         USOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hp33si3043880ejc.559.2021.07.08.06.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 06:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1ThW-0003fT-UJ
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 09:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZN-0004Yz-Vo; Thu, 08 Jul 2021 08:55:58 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZF-0005Z3-AV; Thu, 08 Jul 2021 08:55:57 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLGQT4mHkz77mk;
 Thu,  8 Jul 2021 20:52:01 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:30 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:29 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 4/9] hw/i386: Add a default_bus_bypass_iommu pc machine
 option
Date: Thu, 8 Jul 2021 12:55:14 +0000
Message-ID: <1625748919-52456-5-git-send-email-wangxingang5@huawei.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 48zf7rG/QXBj

From: Xingang Wang <wangxingang5@huawei.com>

Add a default_bus_bypass_iommu pc machine option to enable/disable
bypass_iommu for default root bus. The option is disabled by default
and can be enabled with:
$QEMU -machine q35,default_bus_bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/i386/pc.c         | 20 ++++++++++++++++++++
 hw/pci-host/q35.c    |  2 ++
 include/hw/i386/pc.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8e1220db72..257d70f6e9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1522,6 +1522,21 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_default_bus_bypass_iommu(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->default_bus_bypass_iommu;
+}
+
+static void pc_machine_set_default_bus_bypass_iommu(Object *obj, bool value,
+                                                    Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->default_bus_bypass_iommu = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1621,6 +1636,7 @@ static void pc_machine_initfn(Object *obj)
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
+    pcms->default_bus_bypass_iommu = false;
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1745,6 +1761,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
+    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+        pc_machine_get_default_bus_bypass_iommu,
+        pc_machine_set_default_bus_bypass_iommu);
+
     object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
         pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
         NULL, NULL);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..826a05d7f3 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -64,6 +64,8 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
     PC_MACHINE(qdev_get_machine())->bus = pci->bus;
+    pci->bypass_iommu =
+        PC_MACHINE(qdev_get_machine())->default_bus_bypass_iommu;
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 87294f2632..fd741119fa 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -44,6 +44,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
     /* NUMA information: */
-- 
2.19.1

