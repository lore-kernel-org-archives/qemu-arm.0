Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp726215wrr;
        Sun, 10 Nov 2019 17:44:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxB7HCFXNy4B470QYvkx0WmB/WqhKxVEIKQtBgqSO5ucfPcHRFqBFL/3O2yrGJf0NuGmukM
X-Received: by 2002:a17:906:f109:: with SMTP id gv9mr20713472ejb.196.1573436672154;
        Sun, 10 Nov 2019 17:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573436672; cv=none;
        d=google.com; s=arc-20160816;
        b=lRFjPMNv4m68WnTGr4TUHQQtR3bNW6/7wTG6admxn6rRwCVASuHAnuX6I6DjsCx/W5
         i3VsFam6cOhGApESKAdxIAImHVQpnAA/6aaMGv4BpKupUYjIpDy82gN7K1B0Njakk43T
         fC3wnVI578tY9/IurhYRS/N2QPA/kEvLYCHe5WBp10e+J3CII+sx4pGgowo8tQftN75S
         yZlxqz5eU9m+MSpoMv6suIGdPjEJuPgnjBgkYKCoptJebhu3EUYdXJa37JPnrgp8GDnG
         B1ETMJ2yrsYMrHOLRQwV6Bc+F5yZYn+1mQM1s1Y/1vL9p1gsGdqwnHlb/7bHGV5ePIaG
         f2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IbvMJLUbvwvGiIbDxq+d/EcgnnusId+H/M+XpHkZyt0=;
        b=oSpSGpTPKe5ul/jKTua99jWU9NbEyPFiTc111sBlHD4s6sOLbhFlfrWEnZ+NQ/U94H
         pgFoc1++WD8kCOSHd2BOwW6jpxiMnzlCgXeK1j/pua7q1ClxiFppUQ8OVi48MSag1Dd0
         0KO/IN9hYJix/wUBngDqBLQyC0JPm0FEnDTj+033OFD/RuuQmfzaMOi52uxS0OqkLXfU
         LS5Ktx/rdhlNmwb1d4tklltzySk+NeixxTBrTfaEZoyYDXY/f0CiHAavmrbXo6yU41Vh
         aReOh9vHRm0jcHdiPrebXa5hdLKEmEh+GWW6oR69JqaKI2YfT1T7TBfNqfEpc5v5rE37
         OHlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id uz25si8556637ejb.43.2019.11.10.17.44.31;
        Sun, 10 Nov 2019 17:44:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKBo1 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 10 Nov 2019 20:44:27 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:55648 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726754AbfKKBo1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 10 Nov 2019 20:44:27 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 07E0995406B7BB897352;
        Mon, 11 Nov 2019 09:44:21 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 11 Nov 2019 09:44:14 +0800
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
Subject: [RESEND PATCH v21 1/6] hw/arm/virt: Introduce a RAS machine option
Date:   Mon, 11 Nov 2019 09:40:43 +0800
Message-ID: <20191111014048.21296-2-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191111014048.21296-1-zhengxiang9@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 83UcmzJfOWp1

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

