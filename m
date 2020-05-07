Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1976423lfb;
        Thu, 7 May 2020 06:40:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypJrFkxeZCSwS/sFwxdIQFLl42I7b1apvLaNnHGAHDasUL5ftWqYVjDPpZuhok3dAkiFpHi9
X-Received: by 2002:a05:6402:b4c:: with SMTP id bx12mr12389859edb.247.1588858825441;
        Thu, 07 May 2020 06:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588858825; cv=none;
        d=google.com; s=arc-20160816;
        b=I/VJHAnuZh7ONZE26k4aN9Ay0yncFfVR1WMmjDaHkzmF/1kpJZIOMQgVAqrd0VTPdo
         E2T5Oa3fRlUT+eVR3ewZUYLFhIANf7X4MO4BImGbu6STH1QZm3ZshXWeDxUwslTok7CK
         rTKs7e2880cVfg+B5woE9hfn0ECxms/1Ma9hcyCnQr8IYobyNxNiU/wDsTM63ny4A3mm
         5/Qq+OzJdhxCgzSR9voC/lg8dAG8VJ4cjQX1+Ji5iPVt/6WBo+5HQhrABlfspURve8OS
         HHwOd1NE763U5adQXsT9PTnzNIyY4d7wOK/hI68BdhpA6emJae4sYQQT5aWBpj8q3ibv
         bR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=s+fvDRZ1CPRG/7H9NdYT/yaVKL6n50iFZFAJ/UH7uSY=;
        b=jypcCJ97UXzj6xFCC5V63as1fFBz/U/OVFGPXxcweMYeEGIaAeRNOBSuU5HqqqEWA8
         0PogUoY/TQUO8bPl08njYA3twFEDX1NFXB2ZCoQ3Zi258sXe3xi5wHWAxZjYewozZgXt
         XB2x0gIUPCUJXGs+VabG/TtXi8fLNWoAIxiHoYPwK2K3Bl1152AvkJPY14SSIgzgYstz
         3wcNHnWRaBqx++jFKUhVSPg5EjPKJSZ9y27oCjnD8OV8PirHPtET0RzEPPw2KlegyI/c
         4bGjRSdgvamVcZ1o+f/pKYsBsgbaUANOVLQjy7f9p7UXPsz59+E24wQAzWPYk2VcNYgI
         j7Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id ly26si3110289ejb.190.2020.05.07.06.40.25;
        Thu, 07 May 2020 06:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgEGNkX (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 09:40:23 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3894 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726222AbgEGNkW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 09:40:22 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id BA4842BD73B1A21FC33B;
        Thu,  7 May 2020 21:40:17 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 21:40:10 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v26 02/10] hw/arm/virt: Introduce a RAS machine option
Date:   Thu, 7 May 2020 21:41:57 +0800
Message-ID: <20200507134205.7559-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507134205.7559-1-gengdongjiu@huawei.com>
References: <20200507134205.7559-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qONhmQw+shPe

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
