Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3879350wrg;
        Tue, 14 May 2019 04:22:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEbpOObAnIUWX0IzsW1gNOHWWLHplgs/QWjB+SgEMwKTqf2yub+K8ZR3RnicXcIk4cHa7h
X-Received: by 2002:aa7:87d7:: with SMTP id i23mr39995601pfo.211.1557832926549;
        Tue, 14 May 2019 04:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557832926; cv=none;
        d=google.com; s=arc-20160816;
        b=XSty4/9dpHFNm0ebXO9uZ1lCeiEXbbsg2mfdoVjCTmyyGDJrfhgWKdRLMFNizLWrCS
         +w3UXxxakBnBjKmBkOqOmF5lwCeAq6G3Grw2ifVxOhDYIoWjaeIKD5yU1FGLgPfSrRKa
         kCZLBNcH5FNXdkM8hEMcCwaG23iIjAvBkwOO7b23d4dyxMGb+iPi2eHHxka5vq4OtM0+
         N7o3rH2H7lMq9S/v7ld4hqhhhfIoVwZhbn+fGDwZNhrKwwhonirGEneYndz7tKsrX4Ec
         nBavUOCD3DnPzChVtZH3dEC8na1rv+isKBEAjz3bPtBT57pMOipjdpiP20b4bpxjW3Wy
         1v6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=YRM/madZ1Dbrz5/sYHgeB1CEkIqLHKvQHJKeSTHEcks=;
        b=OKNCNj/m44Bhn64PiA/etD4iZkvy+1FcNCnk87sdbG4591E2u120SGBwlJhEtGWRla
         x4/VQcQMPS3p2cIH57YE6htuM3Xq41I8VrN1NfbvjomP0ACARbQ4PvWfswYEUTb09yC+
         GIfXNuVj4VOYsUIIHQkD4oU1ZIMLQiHMXxIKKHHmWjE+iBcA0TmNaMxO5c0wwNIl6AEH
         OvqEWuKCw/OhI4+p/Hdzjcz4kzRdUUSrGDdtpybVKEkuEMb7I+D0NbLn8X3qV2hKDIrO
         ZsQW9baARnlA9VKpPknHQp2QaZZtd9hc7fvfWzFt/f69B2ALd4pN+iYDl4M+LY2pNb4k
         lxcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 202si20024040pgh.575.2019.05.14.04.22.06;
        Tue, 14 May 2019 04:22:06 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfENLWF (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 14 May 2019 07:22:05 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44092 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726363AbfENLWC (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 14 May 2019 07:22:02 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2FDC12560BFF5A8ED008;
        Tue, 14 May 2019 19:22:00 +0800 (CST)
Received: from ros.huawei.com (10.143.28.118) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 May 2019 19:21:49 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [PATCH v17 01/10] hw/arm/virt: Add RAS platform version for migration
Date:   Tue, 14 May 2019 04:18:14 -0700
Message-ID: <1557832703-42620-2-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.118]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9roX+OzNBjRi

Support this feature since version 4.1, disable it by
default in the old version.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 hw/arm/virt.c         | 6 ++++++
 include/hw/arm/virt.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5331ab7..7bdd41b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2043,8 +2043,14 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 1)
 
 static void virt_machine_4_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_4_1_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_0, hw_compat_4_0_len);
+    /* Disable memory recovery feature for 4.0 as RAS support was
+     * introduced with 4.1.
+     */
+    vmc->no_ras = true;
 }
 DEFINE_VIRT_MACHINE(4, 0)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4240709..7f1a033 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -104,6 +104,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_ras;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
-- 
1.8.3.1
