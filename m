Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4523935lfp;
        Sun, 16 Feb 2020 17:25:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwl5dOp5q3a7bjjbVh+EWP0KNj2kzFJmFByJeI/RXAXo7G4P4kQMFYpK79M22YkV/g+CPQt
X-Received: by 2002:a05:6808:244:: with SMTP id m4mr8689143oie.125.1581902730655;
        Sun, 16 Feb 2020 17:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581902730; cv=none;
        d=google.com; s=arc-20160816;
        b=FkkfO075nKe7NeS9t6IL0qS2xIGBUzofBsq3QMCoaiAkIuKmP+tG8D3KPszJKRZUpw
         ibChP/usBOqLRbKhHYflMzEzuuK4sinlxTBU7giX409ZzF4ni6dO/asqani6QFygFaQI
         Ux4wehZjyF8pD53fQ+EM5Vaw2IK8f89IR/FKganJa21WQSHPgUnEkGWqEAvrDjdnmcIj
         UR9PERAOyMJ1YfvdicrdulNayE4WJVvUnAKAWzUQPYcevgb769JBiEvKentcN2An4+SG
         c7a9OUvEJf0nlY7KCWwHYS/dAKsONsft48rlGUwBhh5EemlNr1Z80p0D9+wML/v2YQ1J
         he3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Gh//WlSzjD9sSMlfPFU7zlR9DG5/MhK5H7WxQxK5Xg8=;
        b=IMERDHJfZWDLGmnbh8F3lmfGJoSXmOC+YjHXQYHH9sTDgNWhZyxE+AZvVDjEwL45fH
         I3QglOTfe55OSn2rRq/JL1B675z942iSURchGcy2QSBsM5D6J6LEsWvIWhC5uhxTy2so
         eNYi+r77IjNdhmQ5oyzKXtlSzY0NLVlIE/vXLMLjHjj1n7ie/+tjxTdoHu9Pcji9z7Mb
         luqWwgMpMKNtHIiKxC5cLXWqc8/M+Qv7snxkBxm+48Ci/4OwL9jrCM2C3E9dgKHh3F1R
         yt0vcW9btZCPg/5dlQNOA9WRWY0Kgv3jgGYBe1kZQ2UAsZUDGtdPfflFXdkyiX0rNspO
         sXxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z14si5843662oth.15.2020.02.16.17.25.30;
        Sun, 16 Feb 2020 17:25:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgBQBZ3 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sun, 16 Feb 2020 20:25:29 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37608 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726650AbgBQBZ3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 16 Feb 2020 20:25:29 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 268FCEF1D9D1814F2F6E;
        Mon, 17 Feb 2020 09:25:28 +0800 (CST)
Received: from huawei.com (10.151.151.243) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 09:25:17 +0800
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
Subject: [PATCH RESEND v23 02/10] hw/arm/virt: Introduce a RAS machine option
Date:   Mon, 17 Feb 2020 09:27:29 +0800
Message-ID: <20200217012737.30231-3-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20200217012737.30231-1-gengdongjiu@huawei.com>
References: <20200217012737.30231-1-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.243]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: BvzKJV4zHz2C

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
