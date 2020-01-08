Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp614591lff;
        Wed, 8 Jan 2020 03:32:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyuvwJJWC9TlablmF/YWmoG89VUOuQf6fzsc+QXgwc5Q7C5ZL4IMsUoZpsGRvR92GQnK9m6
X-Received: by 2002:a9d:6a5a:: with SMTP id h26mr3934977otn.103.1578483155226;
        Wed, 08 Jan 2020 03:32:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578483155; cv=none;
        d=google.com; s=arc-20160816;
        b=a/KJ7YLxuPcirP2fkFXs27vQkDB3YniahKDSYwYwXjReLp7jDy/n6PO8sFJyk/I7OI
         uwXPFVfguo6HtN/xAcKBoFjcXUitwEN7usBfCVHNIBN0fSAG2CaXXnJHa50eMB+/JbFY
         N9fZjcNuReP3VsfeWE9BZHDcOyj7wHdq8mCSZK7y8sjl+JXN/DSsJkaK/baff8frSPs4
         BysPIUwSG/G5toPKNoDWTjDEM84TPtEqQFLSuGoDSZiSiShpXocLOzSXCQYsgS79ZoRo
         Dt3v/KFMBGGhBbqOyMKps2j9pjDYTofLLUKKYWfxJOX8WnJAKdNCEM7gvBixfsNyxIfr
         7FyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=unvcPK2BQ2vkBelbvnBtN2iBrW0LhrAXHZiC5iNf1KM=;
        b=TwriTx7HBAOX2CfQEAym6nnWNTz9SG5MQQ30psHft61jUIEH/tRp4XdjD2TjP81q78
         AJMy7SkVN7ojJC1fcylYmT1LcHZ2/Vmla7WUdcj8rSQJA/VO68dwsEEx7u3LeMvDoVW/
         NlsKeiv6uy2eTn8IaPh6rHs3Jf11nDs6vHcM0TS5yXDrNOTLc2j/e4KgDP8dMHbezaAp
         wcSyPde9pksQL/p41lTTYzmwiQml68npovyDp8RHPkrBRfbyrKnUD5fEBafjORZRSJug
         e4aJ7kTaXupwdbI+gaIoyXyA1f8LTkxHRwu4aHipuO69nU6pTtIjby0yydPOnWFE9CSj
         x5Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a12si1673119oie.87.2020.01.08.03.32.35;
        Wed, 08 Jan 2020 03:32:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgAHLce (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 8 Jan 2020 06:32:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9128 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726098AbgAHLce (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 8 Jan 2020 06:32:34 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9367E28A300D5AB3394B;
        Wed,  8 Jan 2020 19:32:32 +0800 (CST)
Received: from localhost.localdomain (10.151.151.249) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 19:32:25 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <gengdongjiu@huawei.com>, <mst@redhat.com>,
        <imammedo@redhat.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>, <xuwei5@huawei.com>,
        <jonathan.cameron@huawei.com>, <james.morse@arm.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>
CC:     <zhengxiang9@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v22 1/9] hw/arm/virt: Introduce a RAS machine option
Date:   Wed, 8 Jan 2020 19:32:15 +0800
Message-ID: <1578483143-14905-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: +tKZkmEBoYdN

RAS Virtualization feature is not supported now, so add a RAS machine
option and disable it by default.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Acked-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f4..fe2571f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1818,6 +1818,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static bool virt_get_ras(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->ras;
+}
+
+static void virt_set_ras(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->ras = value;
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2121,6 +2135,15 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
 
+    /* Default disallows RAS instantiation */
+    vms->ras = false;
+    object_property_add_bool(obj, "ras", virt_get_ras,
+                             virt_set_ras, NULL);
+    object_property_set_description(obj, "ras",
+                                    "Set on/off to enable/disable reporting host memory errors "
+                                    "to a KVM guest using ACPI and guest external abort exceptions",
+                                    NULL);
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 38f0c33..15057f7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -122,6 +122,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    bool ras;
     int32_t gic_version;
     VirtIOMMUType iommu;
     struct arm_boot_info bootinfo;
-- 
1.8.3.1
