Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2247551lfc;
        Mon, 22 Feb 2021 18:24:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR7lwlUhLSkE1q3Rz4ev0OgqY/2P89C8VbM1QFN9ooLsdYUZpOj03fsdZiBid93t4C3u4g
X-Received: by 2002:a02:6f47:: with SMTP id b7mr24937864jae.64.1614047046118;
        Mon, 22 Feb 2021 18:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614047046; cv=none;
        d=google.com; s=arc-20160816;
        b=XHKJ4dGofOOg65cLf7fNIPDiIlmmjsN4SZN8Kc8FGQLPxyOM/HqPxwZO1Wn1mo2b+2
         LrlPUNNnFenvm7smlZy8Z6KyT3VcYUBJFNw78VXN3o5ySbSeBw0UWnaRy/QzfZVu4LM7
         0WFYE+lVmAbGgGbQRuiImal8VIJy10U3EnnOdwcXgwdytbUCUvzVKK5SwxcxaUbztZnH
         HpOhl0jle2B6LMQH59KY/mbRXQl7kjhs0R6kBXt/jP0y02m5HIcVHrY5dDqkteaHS/76
         SKYtccRQomfz0+RJTF/f88NcxvtqXGhkIntiN3R5Fd2UeSNES+CztR5T3fiBmYnC6rQw
         jNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Y2Nb8tq5y/EDmnDnapM01bA+KsUSaj4KAL4dF9y0ALQ=;
        b=ONrfskLR6FozCVy2AzF92eKGwE6zrd1nS/9c2ljZnB3wb7dIHMlCgjAlccfdKWsCpF
         uWgTJKG8BScnAbNBy6juQvqjd8nEim/i++RXqfTIxNP5mH24R7Hv6LHfM1MiZhe3GVIQ
         qE1JdMEPVTwmhOxpEiI3O5h8DOLOlsdp6Af8sGNQeJUcJwZPIle+uqFbLD4up2YOnlRx
         0LF1L3ienQ1An9OjNwsPJ96mZ69CRRraCNOSTTCK1FK374ZtpsXOsNDGfJRA9SQgDhtk
         Rfg/owW2wm69feW7TokPpD5W/yNeLKdtzD0eqwe/P6+Rnbleeo0cEDQ0uXN0ZsA+kLa9
         LN0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si17506267ilq.131.2021.02.22.18.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 18:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lENMr-0007IQ-CT
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 21:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENM0-00069P-Hi; Mon, 22 Feb 2021 21:23:12 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENLq-0000IU-70; Mon, 22 Feb 2021 21:23:12 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dl2q824dmzjRRd;
 Tue, 23 Feb 2021 10:21:24 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 10:22:51 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v3 2/3] vfio: Set the priority of the VFIO VM state change
 handler explicitly
Date: Tue, 23 Feb 2021 10:22:24 +0800
Message-ID: <20210223022225.50-3-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20210223022225.50-1-lushenming@huawei.com>
References: <20210223022225.50-1-lushenming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4jvPu+aihmQ7

In the VFIO VM state change handler when stopping the VM, the _RUNNING
bit in device_state is cleared which makes the VFIO device stop, including
no longer generating interrupts. Then we can save the pending states of
all interrupts in the GIC VM state change handler (on ARM).

So we have to set the priority of the VFIO VM state change handler
explicitly (like virtio devices) to ensure it is called before the
GIC's in saving.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index f5bf67f642..b74982e3e6 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
                          vbasedev);
 
-    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
+    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
+                                                           vfio_vmstate_change,
                                                            vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
-- 
2.19.1

