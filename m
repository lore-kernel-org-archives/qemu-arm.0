Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp134715lfg;
        Tue, 9 Mar 2021 19:04:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLlAdZM26YJ4tiuvJdtT5yCVU556nsdl3XuCw74G3TIJm6UmOICHbFA94sEzTM4jeoWaBA
X-Received: by 2002:a5e:9612:: with SMTP id a18mr969958ioq.209.1615345464858;
        Tue, 09 Mar 2021 19:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615345464; cv=none;
        d=google.com; s=arc-20160816;
        b=1E39pyKnleJW6loj8VdPzie5nmkDHBG7S7i2ZFls3kHnLEbcTbrYI+dWl2jxgtBXpy
         HPNVmiWJkvYf1qMIOWaAQF0nwEggxqPYMdDDh8anuEVh10bDtUpsvPPDGY+em3EDhhfS
         wuAlgIA0nW5DB4aT93zI/BgcF2jqQKXOW35BdpU2m5wZg4ROA5XU5ljVIC/uF3EyZzMU
         V5+stWhyFhePqqM4vdN/Kktqro8Mer1yE2xqmP2Rp9YvyiFa007n4sVRnjosNITkKuwK
         XETbwx42yiQwQWHw4Z89Qi1xhtE7vBtKLfciQgTMmiLXEdNGjyUpK7zI078CePpeX5wE
         O0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=vYqgkQ1x/vfigMIhu9dbGgx/sJioBofrIGyKxfXl56w=;
        b=NuxqnS8svPnBsCqbOoSS4XGqB+NeTXsaA786UZlUYVPfYLVGH3IhNnAeGtaMwq7ACt
         ePKFk2/5oDq6sWMcPkU8fEp5QgmWVcF4227yBa4VnRbnIsOitGmWzy2MF+zT5RIJ7FaI
         6etzcB+e6qeC+mI2mZR/Q+2QoqJVSKq2eWsPyJ9MeH8MOmFWS+8bouWoAIDW5y85UlN1
         h2BG1uEWsWZJlfASqDqr2+mBhsmRrPnen3DLHNlCV1glTcHt35cpilEwie/4LjWUin19
         m+fBur/hwserhYzd7wvpP0IooMGAWABoqvtZOV4xMv2JWisBleu/ur/cL/YjzoktADrq
         4wmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si15424260jai.48.2021.03.09.19.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 19:04:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJp96-0005c4-75
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 22:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp82-0005Ac-Mn; Tue, 09 Mar 2021 22:03:19 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp7y-0002y1-94; Tue, 09 Mar 2021 22:03:17 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DwH0L6dVXz17Hcg;
 Wed, 10 Mar 2021 11:01:22 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 11:03:01 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v4 3/3] vfio: Avoid disabling and enabling vectors repeatedly
 in VFIO migration
Date: Wed, 10 Mar 2021 11:02:33 +0800
Message-ID: <20210310030233.1133-4-lushenming@huawei.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8vPNrji2e2p

In VFIO migration resume phase and some guest startups, there are
already unmasked vectors in the vector table when calling
vfio_msix_enable(). So in order to avoid inefficiently disabling
and enabling vectors repeatedly, let's allocate all needed vectors
first and then enable these unmasked vectors one by one without
disabling.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
---
 hw/vfio/pci.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f74be78209..fece8c2504 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -569,6 +569,9 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
+    PCIDevice *pdev = &vdev->pdev;
+    unsigned int nr, max_vec = 0;
+
     vfio_disable_interrupts(vdev);
 
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
@@ -587,11 +590,22 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
      * triggering to userspace, then immediately release the vector, leaving
      * the physical device with no vectors enabled, but MSI-X enabled, just
      * like the guest view.
+     * If there are already unmasked vectors (in migration resume phase and
+     * some guest startups) which will be enabled soon, we can allocate all
+     * of them here to avoid inefficiently disabling and enabling vectors
+     * repeatedly later.
      */
-    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
-    vfio_msix_vector_release(&vdev->pdev, 0);
+    if (!pdev->msix_function_masked) {
+        for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
+            if (!msix_is_masked(pdev, nr)) {
+                max_vec = nr;
+            }
+        }
+    }
+    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
+    vfio_msix_vector_release(pdev, max_vec);
 
-    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
+    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
                                   vfio_msix_vector_release, NULL)) {
         error_report("vfio: msix_set_vector_notifiers failed");
     }
-- 
2.19.1

