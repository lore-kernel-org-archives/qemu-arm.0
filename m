Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2521520lfb;
        Thu, 7 May 2020 19:17:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypJMwCJujhvVQqJhgSW3K8o+Pa/HKGtXjKx8e5d5XSG+LHVgemwadcwLGxWFEXZl/26RWGMy
X-Received: by 2002:a50:e70a:: with SMTP id a10mr306104edn.38.1588904271060;
        Thu, 07 May 2020 19:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588904271; cv=none;
        d=google.com; s=arc-20160816;
        b=tOj63D0El2Hxwbovd6e+L2d92+hmNNH0bhOPZdzUhwuPgZp9lbJclteeN+4GFnTuKG
         aV9fu7N32qkAuYNf0oy/cs2yGHkReXdUMpF97uOOMpea3U3s/jqqVKIZ0sJmuoeN7p/c
         xbur2z0RiDSgpH6djewDZMUBzfDgogIwW0/tTHI3SiRwsfTlybCxJ6kaNrDr+MHB1g9G
         ez4h+ZGysRBGBO3tgwIkrpUGvy3QwST0oDdIDmTmsM3YY5+Et2EPcjuFrnhFkdOrRVqJ
         /GQKUh5tVaj9YXP8wea6UtDD5vKGlPnyLYYhNf9AmmM1ecjupx4B0X2W6Y/5EKUWf3b3
         yKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=s+fvDRZ1CPRG/7H9NdYT/yaVKL6n50iFZFAJ/UH7uSY=;
        b=qb3Vo4xugOtzUUeMdmA5aJpdAwAJFpcGk+q+JiPoXBOAssuOMtIMA0NtRD/750NTAc
         +ZytvA0gurZFWC2+SsxxRvhbx/PCh5yG6mShxDWjVs6EXAKE3In9EDjJqVDxX+uePJmm
         C2731Y+GZ0uLVOx9aV991F14tXLgPBag9Ey8P5K98x2RBxglKjGF8yC/kGgqILCQ6lyX
         M4uM2SdYLBJX6OZgdMtWiFxPMdAfvUas4MAh2lvfsb0gp1Ct39vy2fwPqKbEdg3PTigH
         iVCtg8tV7SLnl3NDoaApi3bFSid+cXY5/Mt+zO8EDiZFmKJfUjEvdChpM3B0mRDhLsJx
         VaOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id g24si124136ejb.433.2020.05.07.19.17.50;
        Thu, 07 May 2020 19:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgEHCRt (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 22:17:49 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3907 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726689AbgEHCRs (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 22:17:48 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3926F49E0E95DF4F1FCF;
        Fri,  8 May 2020 10:17:46 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 8 May 2020
 10:17:36 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH RESEND v26 02/10] hw/arm/virt: Introduce a RAS machine option
Date:   Fri, 8 May 2020 10:19:22 +0800
Message-ID: <20200508021930.37955-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508021930.37955-1-gengdongjiu@huawei.com>
References: <20200508021930.37955-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: z2WjlOYDh5Fo

RAS Virtualization feature is not supported now, so
add a RAS machine option and disable it by default.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 171e690..2d46c3f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1995,6 +1995,20 @@ static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &vms->acpi, errp);
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
@@ -2327,6 +2341,15 @@ static void virt_instance_init(Object *obj)
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
index 6d67ace..31878dd 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    bool ras;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
-- 
1.8.3.1
