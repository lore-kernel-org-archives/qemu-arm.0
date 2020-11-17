Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4207867lfb;
        Mon, 16 Nov 2020 17:42:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzClq1+tfI7D19m33xvYhHAenRBZGWtMEp23EO0LfX/nEOhzErSFQ4sOVJ1lPfig5y/nlJA
X-Received: by 2002:a25:6ec3:: with SMTP id j186mr23684565ybc.165.1605577340923;
        Mon, 16 Nov 2020 17:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605577340; cv=none;
        d=google.com; s=arc-20160816;
        b=YPzlYbJ1wXJ/X11sldLUKaOAmj9cRFnBfLLRG7/h2BnB/C8RTQ0o44HzOpL5hmSq7z
         GIcEz7EBqwcO57bKvrht9u/eC9P3tImu2OSxrpUWvfblgOiIx2wNb37zkEnBgY+ifb3V
         y80B3bLaX6CfezpmC0bXn+Su82vhDqyjB8VsJ91faC5CNtt9pfExNF94a3WnXqEfQxq/
         AeyJUHFzEcpXW1xsZaBgLMERX28fh/By55QjWLReLVdo6O7ueOCI2W+Qj4qhjrnexUVA
         q5Aqzd7Kg9/ThiJ2GpZnDZsWTbYE76+H2o96l63S3aarK0IGwNXg3rEQton7tsMYB7Jh
         eL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=yl1sI42v9pZAQbTEbzxo15UapNNS96cI5uP5/DCIXhU=;
        b=k51SQ+H/fwnnZb1cL5qerM3n2qZjyDhdObAHJJ7RNIcaAeyWR27a+ysakE49tGgdaX
         3xGGuQ9imY/efYnjiV/abD+NAngykjwYzoE5GJgV7Wyb6KJtKIyJPnVIafT5DY/xUScB
         guV1AtpPctEvfJW0d4B/wJwER2l7kKEdQntC2Ho2TSQOoTXXXoyd84WdevQwM3ONXU2A
         OaKOFkA95BlLqek6rg5pJPP6X4iTAXu4bkMDUhDWFRNwuctnuiKXOU2/ItPA3H9Wsc7Y
         6juEZztY5D3mhr6raih0wzVw2SWMY4Dq72HvD2IO+T3nc2k6gFGKKPF7iG/N8PR6iVki
         CS9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si18007355ybe.6.2020.11.16.17.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 17:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keq0i-0002tj-A8
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 20:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1keq0C-0002tS-8x; Mon, 16 Nov 2020 20:41:48 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1keq08-0004JK-8Y; Mon, 16 Nov 2020 20:41:47 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CZpYs0MZSzLnQ6;
 Tue, 17 Nov 2020 09:41:05 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.187.179) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 17 Nov 2020 09:41:14 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC] vfio: Set the priority of VFIO VM state change handler
 explicitly
Date: Tue, 17 Nov 2020 09:40:50 +0800
Message-ID: <20201117014050.1385-1-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 20:13:14
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 qemu-devel@nongnu.org, lushenming@huawei.com, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TXxIe39C2oBd

In VFIO VM state change handler, VFIO devices are transitioned in
_SAVING state, which should keep them from sending interrupts. Then
we can save the pending states of all interrupts in GIC VM state
change handler (on ARM).

So we have to set the priority of VFIO VM state change handler
explicitly (like virtio devices) to ensure it is called before GIC's
in saving.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
---
 hw/vfio/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 55261562d4..d0d30864ba 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -857,7 +857,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
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

