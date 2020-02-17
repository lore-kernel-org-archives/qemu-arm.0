Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5055384lfp;
        Mon, 17 Feb 2020 05:10:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZsJtBNQPQoTwQfd+Y19OnL8hCSzTy7YUbtJtr+54kDs+SEs9hmkH56DvCOXp0HDUlBmRz
X-Received: by 2002:a54:4816:: with SMTP id j22mr9916496oij.179.1581945044735;
        Mon, 17 Feb 2020 05:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581945044; cv=none;
        d=google.com; s=arc-20160816;
        b=myKlODAQXTmTrIUqI3ko6Ha4hWzDXXQbM0QS1tFEBeiS8RRgTLqARrHKJPLyQdRJ07
         oTxCajB87NUJTrv3MbAlhq2DQcessb3jx5xhegjxaGhqZreUC5GIkhnyUT12EbykhP1B
         Z/zWA4wjiBEyIGld5jiJhVpC2oIDG2H51d8kkq0U8Em/XnrGka89oVaqriTD3rTmnuZ3
         UVclWPHQCC33bYYEyjlr6r4m9F6fLM1DL/YVx3YDXAysSGSXaWeyXCe6B1jTKWgaTbDM
         wfCMi5ifJcwYXgHK24XPzDy6LDb8SkNs3QMRAiSUWL79OnjQIxgvGTFJgxHvxEpG4nju
         i2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Gh//WlSzjD9sSMlfPFU7zlR9DG5/MhK5H7WxQxK5Xg8=;
        b=eAEiTHkAsrD8nXdlTCjgMGoYUJnLqkgsewFA4ZZGdK6nQiIDLevRKopGGy8rHQ0rvE
         nSjwGC6gzb5FqwZDlZDhcUa8+TnTuq5NKd69J26d1W4jdQV7Z+V+2DhMn33iQkWKCejp
         hTw28JpHrkhNzoSHN7bfkbngQFWfzJ1isbU5VjhJkI/dPFXqqeMjT51LSZ13mOcsi8mU
         Iy46h8oAt1nqc4E6ZRAc0Sg+6R2UsAPc0e/R6XdC5vetLlhN8ZzLtTZm9ViplNidD8Xe
         uXyGEbPJexYFYx7AAOHNY4QclZ/N22tOzrgd1hVvv1ULBKo2EbQTOJOZt96cU2Oi6bd/
         h7gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b10si5923172oic.153.2020.02.17.05.10.44;
        Mon, 17 Feb 2020 05:10:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgBQNKk (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 17 Feb 2020 08:10:40 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:45252 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727497AbgBQNKk (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 17 Feb 2020 08:10:40 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 35A2E7B31B0D52699C31;
        Mon, 17 Feb 2020 21:10:36 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 21:10:29 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mst@redhat.com>, <imammedo@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <shannon.zhaosl@gmail.com>,
        <peter.maydell@linaro.org>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <pbonzini@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>
CC:     <gengdongjiu@huawei.com>, <zhengxiang9@huawei.com>
Subject: [PATCH v24 02/10] hw/arm/virt: Introduce a RAS machine option
Date:   Mon, 17 Feb 2020 21:12:40 +0800
Message-ID: <20200217131248.28273-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217131248.28273-1-gengdongjiu@huawei.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Nf69PATJX4Ll

RAS Virtualization feature is not supported now, so add a RAS machine
option and disable it by default.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f788fe2..9555b8b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1823,6 +1823,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
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
@@ -2126,6 +2140,15 @@ static void virt_instance_init(Object *obj)
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
index 71508bf..c32b7c7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -123,6 +123,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    bool ras;
     int32_t gic_version;
     VirtIOMMUType iommu;
     struct arm_boot_info bootinfo;
-- 
1.8.3.1
