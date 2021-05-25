Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4107675lfm;
        Mon, 24 May 2021 20:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC3WUcy7u5wtiehttoMSyEhH5RZKrUB4WvSA4QNUy/vr0gkhMaMqHNLQ8R4yupwadvKiAm
X-Received: by 2002:a05:6602:72f:: with SMTP id g15mr18749216iox.5.1621914693125;
        Mon, 24 May 2021 20:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621914693; cv=none;
        d=google.com; s=arc-20160816;
        b=BYOvXvxvVjQWUYDkY8f1eVeFjDSMb93G1cL/5TnBSfDyDRcN3FceHNnJKn48DK92XH
         kIGPHZzsBGZSauGMhf9ZuthMjtcmalW5j7NkplkJdRgzmRC5fGn21oWZbmLZvOWILIA3
         eq5cFAGYUXfjpAEnpI3ymItjU72DVFbZ4HNeNnKxcfps543mJkBd/ZRp4Knfi9OhCEt1
         bpyIqh8BKU7eu98UJMi19Wn4dgMyQ98vRzgoXm0gMmOhfrcQH5m/ZMhVvCX4TpBuOkZt
         j7jv3EiZF6UZMEryjgEwIgFLCOPuOlTkO0IQO77i8cac7CrxE7qODY9cPOHYv6qElSx/
         SyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=zQR7K/NC1gheAO/fMZ2ct1/gGP49dbdki15kBTMeN6o=;
        b=keVMLlxpEOOVJlb5vhU6NGiWOq/1vJXtAWoy1mSMIkO7lVfwKp+ulelAWVWVz6MeLs
         Y0RJEt4sPxMy73CML6Ph71ZK/lVxvVeaL/V/DuaK0f5Wxa6r2XflXof6JpTUEWe4z3tW
         bo4i1s12iRsmQbKa6qXJ4ti0S5jAPIdWTTebQqyND4NaN0ko4sKxcSHafsZjU3MrYkZW
         RUpw7/Js1zRtvHkKlrLQp+2FHqbHWq2RHx2vC84tI5PWSAdwfLqJ7oDmcV9dHSMqp0ad
         4eOIKZPhFcpzPX0CqZIavxf+ussaYsyv046uRUdxOxIeA+U6ofeurjJjPb/OmVQQZEpG
         WbBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si16958883ilj.58.2021.05.24.20.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llO6O-0001LB-Fw
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5N-0006Ry-CF; Mon, 24 May 2021 23:50:29 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:3635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5H-0001kk-QM; Mon, 24 May 2021 23:50:29 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fq0QL73dLzBwKr;
 Tue, 25 May 2021 11:47:22 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:14 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:13 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 4/8] hw/i386: Add a pc machine option to bypass iommu for
 primary bus
Date: Tue, 25 May 2021 03:50:01 +0000
Message-ID: <1621914605-14724-5-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangxingang5@huawei.com; helo=szxga07-in.huawei.com
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
X-TUID: 9S/hxrnWSS8T

From: Xingang Wang <wangxingang5@huawei.com>

Add a bypass_iommu pc machine option to bypass iommu translation
for the primary root bus.
The option can be used as manner:
qemu-system-x86_64 -machine q35,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/i386/pc.c         | 18 ++++++++++++++++++
 hw/pci-host/q35.c    |  1 +
 include/hw/i386/pc.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8cfaf216e7..865a6e4c7a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1530,6 +1530,20 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_bypass_iommu(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->bypass_iommu;
+}
+
+static void pc_machine_set_bypass_iommu(Object *obj, bool value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->bypass_iommu = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1629,6 +1643,7 @@ static void pc_machine_initfn(Object *obj)
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
+    pcms->bypass_iommu = false;
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1753,6 +1768,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
+    object_class_property_add_bool(oc, "bypass_iommu",
+        pc_machine_get_bypass_iommu, pc_machine_set_bypass_iommu);
+
     object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
         pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
         NULL, NULL);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..ade05a5539 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -64,6 +64,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
     PC_MACHINE(qdev_get_machine())->bus = pci->bus;
+    pci->bypass_iommu = PC_MACHINE(qdev_get_machine())->bypass_iommu;
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1522a3359a..10a464744a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool bypass_iommu;
     uint64_t max_fw_size;
 
     /* NUMA information: */
-- 
2.19.1

