Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3904071wri;
        Mon, 4 Nov 2019 04:16:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyM9gHUeKzvSrv/f+Q+kKyGNc0TyVyE5RiD5281xDiTaLJ+SCXRx8nWFZiHqeMsNyQBnQ+D
X-Received: by 2002:a05:6402:70e:: with SMTP id w14mr2225961edx.95.1572869793806;
        Mon, 04 Nov 2019 04:16:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572869793; cv=none;
        d=google.com; s=arc-20160816;
        b=YzFqjbbmrGb0VM9txPLNyPOZeNtq9WRAvKzDGh+rstrdotl4zNlRTH/iUaqF7WY2P1
         LOB9UiSKKcKLjLY+EsjN63efl5CrXOJ23c5aki4hMfRARAP4yIHpHyUM8UC6xU1ffXOH
         dG9L1V+OvyFyujQgQ4wFfh/UyHRH+kXPw+CjqCRbZOSnjFelPXNxUnR1PkxIBD4Hp6Bv
         xVh5uqQlCEcPoGQrGobEn86LORz4o7T/m7qKn0Bc1KlJ3GuwIu7KmU/bF39jO0npq1Wl
         fvWgpJRAbgi4B1dZ9xILoVvja8WMRfXfd0WnEoa/zwcaHiffgXdtk1c8GmBClwjBWEEo
         exww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IbvMJLUbvwvGiIbDxq+d/EcgnnusId+H/M+XpHkZyt0=;
        b=Cz0y4l38znEgIX97c8t98gqVBGSr/dKF6duRNBKIeVoV/TeFKAXJ6FkqDGkbPWtEK7
         XUfHlU6ciGfIjLEZQAT7Far4NAocAZPHxdpsAWbNvR6snar4sE3zAo57+T7MWPpcXP1t
         WXGirfNp26Tzuxy6FbRVsODXAUZtMeri7R0dSkWhLlEfVKquy3y655KOssJ2a64M9AmM
         +MjH8X8B/LlqFrVHVmkzdSt5D6oPN5oWbc5BtCPji39BJKNy5q59r7BiUCCAVhCB7BJ9
         LENnpPgn/ykDyJynIICIgJjedcbGf8SPwjSLNFmu3/nNJTzy1NVN4J5reN42ZRUdLPmN
         YPMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j13si7513159ede.324.2019.11.04.04.16.33;
        Mon, 04 Nov 2019 04:16:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbfKDMQc (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 4 Nov 2019 07:16:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:5700 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727913AbfKDMQc (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 4 Nov 2019 07:16:32 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 908ACFC3B13359B9CC1A;
        Mon,  4 Nov 2019 20:16:30 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 4 Nov 2019 20:16:21 +0800
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
Subject: [PATCH v21 1/6] hw/arm/virt: Introduce a RAS machine option
Date:   Mon, 4 Nov 2019 20:14:53 +0800
Message-ID: <20191104121458.29208-2-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191104121458.29208-1-zhengxiang9@huawei.com>
References: <20191104121458.29208-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: EFGwe61bVBel

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

