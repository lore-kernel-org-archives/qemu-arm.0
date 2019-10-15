Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5809684wrm;
        Tue, 15 Oct 2019 07:03:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvRZWRdjPKgMCguYqpvS2Pp9jNBpIsMQpG94bYwGdhAzSL43xFl2VH849rH2SOzsv32XqO
X-Received: by 2002:a17:906:2d49:: with SMTP id e9mr34064430eji.240.1571148182250;
        Tue, 15 Oct 2019 07:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571148182; cv=none;
        d=google.com; s=arc-20160816;
        b=PnDM2QO1i8QNBN7FT9os69GuyoSm+DI8Lxe2mzVHaVuB2RYEZ2J41drKWxvqsSdDv3
         Sje5vtQyd0hUz/7iDr2iMGq1R2vj3ZLfsM4sQnue+oCRcCegAZnUAf/xthmhCW7b7VOH
         6TE6mEJu+ink4Euplf/xnF77diwy1fCIJ7JYl/PPYXenYsSpw2QmjfNuAJN2vKkGY+9o
         e09HuH3b6oJ6x6YxWORZl4hs9vK93MKUhoEwdVbPUobG1xuWzil90wHJjHOjH10AI7Q/
         g/tvY4vwXdEM/SF+h7VlGDu0juK3D88h+SDO59f4LQsorVrGW0JX2Q5M/L0mxirwy6cT
         FXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5Y00I1eVSIIUo9bs/NLeUXNuw2FS3fSbQeRzmLoP4C0=;
        b=PpLCk2xqxAKbS3etpv6ksweIa9HpmuGd9VldxVnKdUzSLmd2t6QlutX15RXZjBC0Ee
         BGI/Rtp1ckDJfTIF6Iodc86LkW3pdgJdZE1JE9ni9cHG9l0mCSDYZcjVSOMCRY6MIEA+
         asgS1An3zlCafVgpzGN8Ms8MFdZm+AF4X4pzg9XP+WVlrS4wBzQaaOAnsT+I8YGOdMVc
         RnpC87af8It5cV8jp/Fh+nRfdNDJK6l4ItP8ufpVMuHHuSsya5AU4HxZXRoAKvpppzei
         lW18pN9TOlaKvwIa9njMKTRL+Dl1DBsxlM6ptvcxvu+tBp/fj8zFMK+eebT9xr1kk2dM
         ow2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b47si14176091edc.45.2019.10.15.07.03.02;
        Tue, 15 Oct 2019 07:03:02 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732426AbfJOODB (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 15 Oct 2019 10:03:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3773 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732416AbfJOODA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 15 Oct 2019 10:03:00 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 305DAD86F79D72C0877C;
        Tue, 15 Oct 2019 22:02:57 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Tue, 15 Oct 2019 22:02:46 +0800
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
Subject: [PATCH v19 1/5] hw/arm/virt: Introduce a RAS machine option
Date:   Tue, 15 Oct 2019 22:01:36 +0800
Message-ID: <20191015140140.34748-2-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191015140140.34748-1-zhengxiang9@huawei.com>
References: <20191015140140.34748-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: EOrgN545maSJ

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
index d74538b..130ea7a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1783,6 +1783,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
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
@@ -2026,6 +2040,15 @@ static void virt_instance_init(Object *obj)
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
index a720942..21ca4e0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -119,6 +119,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    bool ras;
     int32_t gic_version;
     VirtIOMMUType iommu;
     struct arm_boot_info bootinfo;
-- 
1.8.3.1

