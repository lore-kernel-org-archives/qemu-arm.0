Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp136376lfg;
        Tue, 9 Mar 2021 19:07:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUw0l63Wvf9mTJxoNGAeYqlZRtj1sA2epzO67ZhTmoty8scdESoPI1zGcYuzdBtKlokDYd
X-Received: by 2002:a05:6638:e93:: with SMTP id p19mr1279619jas.10.1615345632869;
        Tue, 09 Mar 2021 19:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615345632; cv=none;
        d=google.com; s=arc-20160816;
        b=X2p/o2OZ/3kbL8KI36p+QC66KCAl/LQYXR8u3DZM6z5I3DRb2fMsOZAsxQfxovq6wR
         3s/wV4DwdltaIM2kso5QHuYG5Urjo0dYbaGghVixjvpU6CqEYiP0IBB3f1tRwbiQRK1S
         dMJGh1gmQ8IZgnr/p6+mr3zuUGZHiOilNLr1JOnXvkjXSXEUs8+kVKZaNSCp0+rs2FGY
         IFvBNjsqOqSSbygR1BC4VPK5uZZoXYCBCqiQ/MYo3pEdY4eFdXBXQW3p9SvxuEB5ryqI
         tL7IbnfsomMqoKECF4SK83yrsjxmVgBxHby2QsKExL7WoEeFDU3mMMNLeV7dWBypGJv6
         ijzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Y2Nb8tq5y/EDmnDnapM01bA+KsUSaj4KAL4dF9y0ALQ=;
        b=TTyAMMibijFkn6c1X7YZ7Ve0yEUgcH+BR2kGRS4hD11Ov123mRZKHkicYg+dC9flZJ
         27XqgkbNXdQ2sWLzFuhmoklq+QfqLOirLH5fULIN0hLfzdl1kBid0S1yBVv1k03b1hnI
         gyLiWkNXKqqG16ZAIgGJQSOG8o3+/eHY9JZTPepxlLhnlTfPGY76as/w9KBoEnD+jIWq
         wPSr6md/tqvEy9plzD5BUrAKkQRNOfgYWhnIvAT9LpOXENmv6M4WadlFyFZ0X88PRlzL
         iKk5lg/KSvb4ITRimycpfUvBsBkxMUo5aT+IBYzTxWHlKqoUVURCcI6IZDBwKojy8b3m
         rdfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si14621724ior.7.2021.03.09.19.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 19:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJpBo-0000ig-2G
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 22:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp7z-00059L-0J; Tue, 09 Mar 2021 22:03:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp7u-0002vD-Tw; Tue, 09 Mar 2021 22:03:14 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DwH0F6C7Hz17HcP;
 Wed, 10 Mar 2021 11:01:17 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 11:02:59 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v4 2/3] vfio: Set the priority of the VFIO VM state change
 handler explicitly
Date: Wed, 10 Mar 2021 11:02:32 +0800
Message-ID: <20210310030233.1133-3-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20210310030233.1133-1-lushenming@huawei.com>
References: <20210310030233.1133-1-lushenming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, marcel.apfelbaum@gmail.com,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FI97LNsMx4ay

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

