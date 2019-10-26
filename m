Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp150425wri;
        Fri, 25 Oct 2019 20:25:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwH6O63gOGXubJ/PelvIrznJD2Goo8zjIC8J9bZciNSPuve3QY/lZpo3s4vij9WMRkesBED
X-Received: by 2002:a50:ac1c:: with SMTP id v28mr7774922edc.156.1572060327009;
        Fri, 25 Oct 2019 20:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572060327; cv=none;
        d=google.com; s=arc-20160816;
        b=FI6NOHfku721dV+kgTdy7TTjEs5m0Oq84KpbsdyvpBiJncJUeiAkQO0nFmOHh5tdKG
         JQGq8/PW8u3dS+NrCOEtenjaBg/Tny3DME6aCw1VGO4SEpE7GJ/I7xkRNoBAbsFlslrg
         PMcdRIPG3xDc0Jg4sbVhrAxR70/zZ8007FPEERZO2gbZeaq60gBo2upJ+rFfdlPiZ9q/
         FaPs97ca0iPCZBk9wiRiy2t6iUwMUqSMetn6pnN0y0xF+BQkFwXENXtOopm632bT1pjO
         veqYrKxfj+9H6FbeTEUp8lt+PVR3TMKFXIRBZWjoJyqs6ko4h+R3xX5xql7fFDCgQoqr
         t/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IbvMJLUbvwvGiIbDxq+d/EcgnnusId+H/M+XpHkZyt0=;
        b=X6t4GATuieLK0wlfiX1EnizRGWUhEiTuGs0SQ54n1uOKhDAbab9d/Xl6PEtVGlmati
         lDdjtvtZLCCvMw3495IuYADxGZgaeuyABSqSIUZpSTEtA47S6iJFbPGunwBmmjBHjJ6F
         ma/WLaskx68fiCHkP5KMFAlNPWq81nDmSGtfA29+BIhK/aKP9sIqEgaFr2PT8necKPZd
         DPJuNTtjIKwEEVs3u+W27b7+Xa6HKf3LdTyWdZ13j3Y5Rr3/ZLDzTWGWBRN6GJ2Zc9Ms
         DSDg+PzrSdC5s8Qa4iXQ0G3k2BFYJyuLoAqv11hVw3nqPOTAWf4aM6ssJ2XZq/rdaToq
         5JuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a24si2708554eda.446.2019.10.25.20.25.26;
        Fri, 25 Oct 2019 20:25:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfJZDZY (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 25 Oct 2019 23:25:24 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:56786 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726365AbfJZDZY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 25 Oct 2019 23:25:24 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 65B8137A655395890911;
        Sat, 26 Oct 2019 11:25:22 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Sat, 26 Oct 2019 11:25:11 +0800
From:   Xiang Zheng <zhengxiang9@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <jonathan.cameron@huawei.com>,
        <xuwei5@huawei.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <linuxarm@huawei.com>
CC:     <zhengxiang9@huawei.com>, <wanghaibin.wang@huawei.com>
Subject: [PATCH v20 1/5] hw/arm/virt: Introduce a RAS machine option
Date:   Sat, 26 Oct 2019 11:24:43 +0800
Message-ID: <20191026032447.20088-2-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191026032447.20088-1-zhengxiang9@huawei.com>
References: <20191026032447.20088-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: anLqpdQDZxHX

From: Dongjiu Geng <gengdongjiu@huawei.com>

RAS Virtualization feature is not supported now, so add a RAS machine
option and disable it by default.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d4bedc2607..ea0fbf82be 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1819,6 +1819,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
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
@@ -2122,6 +2136,15 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
 
+    /* Default disallows RAS instantiation */
+    vms->ras = false;
+    object_property_add_bool(obj, "ras", virt_get_ras,
+                             virt_set_ras, NULL);
+    object_property_set_description(obj, "ras",
+                                    "Set on/off to enable/disable "
+                                    "RAS instantiation",
+                                    NULL);
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 0b41083e9d..989785f2f7 100644
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
2.19.1

