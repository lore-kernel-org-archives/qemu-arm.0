Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp567551lfm;
        Fri, 10 Apr 2020 04:45:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypL3uXL8cUe1nQkBPCFz5J4FcVTZWnLvzbob+z44VMWaiEbOK3XCtnBxnv32ifQoFUKaknIn
X-Received: by 2002:a37:7783:: with SMTP id s125mr3512528qkc.492.1586519132019;
        Fri, 10 Apr 2020 04:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586519132; cv=none;
        d=google.com; s=arc-20160816;
        b=s6eLMjEsVhvK33KOjVPGM1ndHix5qUyvTKqB192RYNSY0Im6956LD0Uy4PK5xLNq4I
         B13IJp5NFxtAxBpS18o4eUwpS7O1+7GT64AB4noMSzz8dvgllyzMZZyqsbPf1UWz3GIJ
         wBY/GKQpzHkQ/6d0sribOd1xxs5kd4Nnlkz13FIGpTXUQainhC8ug5lInQRmtzKRikt4
         uzo9Opgw4kR1cixeRsC0nOf7UplDkAQ7QdcLPkj7U4DcdR1mI04V1ybKqAL0LaTtCFgz
         cnZD2QUwbXqAAgLmUOQZwAdPEj2Vb3HpnPQbJdkrCuVvj5wSe7jtYTrVG65woGPP1FIy
         pgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=k7HwuDtV7E/9Fyoyiq9KRa0XPNDWx0iJSfi2hXOG870=;
        b=xvM7bhC95quNpDIlUxqjdlZft6/YKFa3PQIUM+9Vrv7skxtB0MtdZkLiRZ/AGb4tjN
         YvdYDiJeQySboNv1r/209KJGT2TUxdVaMisvE7DgURlkPRaWauxqEgQu2+1BAqpP9r5i
         vIILtC/pdm7G2WtmhTU5EsiBjg2mxkucE1U+JCXTeWu3MLlJ7TeXgQjWVefHqhhfCpss
         lTjbpoIVwVFuxzg6gMuVEdPiF0ijRPfmC0pdOYzgjoyn50LiESZUk5ktsT6ShZgUs/4N
         SnpBABHKskmRaU65my3c6UUmv9+PQqB+MbTDiBmQliH1fSTcdl6csgOi3ugUgvMyNgmp
         Y2mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w7si879148qvf.49.2020.04.10.04.45.31;
        Fri, 10 Apr 2020 04:45:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgDJLp3 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 10 Apr 2020 07:45:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52032 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726059AbgDJLp3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Apr 2020 07:45:29 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 60B8438307DD1EF37A4E;
        Fri, 10 Apr 2020 19:45:27 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 19:45:18 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v25 02/10] hw/arm/virt: Introduce a RAS machine option
Date:   Fri, 10 Apr 2020 19:46:31 +0800
Message-ID: <20200410114639.32844-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200410114639.32844-1-gengdongjiu@huawei.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1lGjXKaYlmyJ

RAS Virtualization feature is not supported now, so
add a RAS machine option and disable it by default.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7dc96ab..20409b9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1960,6 +1960,20 @@ static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
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
@@ -2284,6 +2298,15 @@ static void virt_instance_init(Object *obj)
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
index 60b2f52..6401662 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -131,6 +131,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    bool ras;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
-- 
1.8.3.1
