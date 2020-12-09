Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4734392lfb;
        Wed, 9 Dec 2020 00:10:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygrifrqrYJac+by9PC6pr1kfIjvQFX7QhMKEt9wopgIYWgbBxJzcMWOs6GCezhs136PBDX
X-Received: by 2002:a25:d44:: with SMTP id 65mr1963097ybn.260.1607501452848;
        Wed, 09 Dec 2020 00:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607501452; cv=none;
        d=google.com; s=arc-20160816;
        b=kLpPsWL0AAbBPpO+Fz6dUMejbnNwD9Q7bY8u5h7axamunPBAs0jFkKHWBaU+AECszQ
         AM1RdVtfP9mj45eNwHPaCiOiY6oKoYo7wvV1qoeKJNC2fUuQff8s9xSIc3d8SBIuDrXu
         O4l9AwMo3KllkcrbeWeH2PZ7iEnsD5RK0NQRXPq2rofLJQxeeSfH00romeo6qXTHYAiW
         WWpNV03O8MOx95QJkO4SQYoZKejGqXYvS7au/Dps5yJH/8bZPU2yqrWBlWmeXXo5Hq0s
         fA38U567XBBUuqt5Fc/y59xzAVYO+xPd+3HcMz7nj0sDL3I4unkFgjLY9GTnw4UoEuRI
         A7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=i9yeRsb2G8OJiGFhGvBg8SGIrOzB/385BOFCgl7OyZc=;
        b=h/Jkx4XKO7s5JWee3c1S5AuBw5Y7awQVgSY5+En4FeGtFrjVE36Y2OCcsg5u8diPMH
         Irn/Chs6t2HRV1z96s4pY/oc8EOh6ghYYl/Llx7/bQhsRVcO476M8wGothS7srFUOZ3m
         Zx+fWK0u6LNgOHJcKodN8lXa91nXKRAMo1YXWJtgOq7s/NYibZGL9dezpTGwhCuK3kEg
         Fzi/5TX8T+xsxhcIi7UON8gZ8HzFDqEEASVso/Iub1RakD25wRjUZ5htOs+rSC0QjXfV
         wWgsNgM+fKCZlfwlx+kBfcThHCgamDpa5PCGP7oi2HtFXL6XDogWKu8FQpUAcq7jDSn+
         u8lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si1593689ybj.225.2020.12.09.00.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 00:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmuYm-0003ll-7W
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 03:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kmuYY-0003hL-Uv; Wed, 09 Dec 2020 03:10:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kmuYW-00075n-Nc; Wed, 09 Dec 2020 03:10:38 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CrV8S2fbkz15Zk0;
 Wed,  9 Dec 2020 16:10:00 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.187.219) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 16:10:21 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state change
 handler explicitly
Date: Wed, 9 Dec 2020 16:09:18 +0800
Message-ID: <20201209080919.156-3-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20201209080919.156-1-lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.219]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org, lushenming@huawei.com,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /254R+ajAxz/

In the VFIO VM state change handler, VFIO devices are transitioned
in the _SAVING state, which should keep them from sending interrupts.
Then we can save the pending states of all interrupts in the GIC VM
state change handler (on ARM).

So we have to set the priority of the VFIO VM state change handler
explicitly (like virtio devices) to ensure it is called before the
GIC's in saving.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3b9de1353a..97ea82b100 100644
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

