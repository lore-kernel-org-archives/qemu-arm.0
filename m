Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2247446lfc;
        Mon, 22 Feb 2021 18:23:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL4Ly7UJdN8Qi4tatm0KDUNsDPm9eyVO4eeeGGZvKrw7nzyD4lmdjetI46s0JVyvBBQ8Cf
X-Received: by 2002:a05:6e02:1564:: with SMTP id k4mr17900364ilu.282.1614047032003;
        Mon, 22 Feb 2021 18:23:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614047031; cv=none;
        d=google.com; s=arc-20160816;
        b=toKF8PKL5kmIC8wvWkEGBLThYr8pdd12vU8y5mKARJFBDKtK7l4+gNwyj4JEBEj0zD
         5lKAAw1MWmp958/tsYQH6DcdHnLSNt5+CaRuMufUmX1Tkl5iAEPIWwMZ4M+/uxri7fIS
         GqoQMQnPHMMiREnkJENNPSBIngSK+WQYFTj2PMy+ga6FWWRsjM/f1JZhq6q0oL80FzS1
         SxrZKFlFbKVEbWeJxKn68nsrA7jveGW6mQJK62M41OYJ6ms2eIoIYswItiZszkjsKSa3
         1wBF3LmgAzKoGz8Mg9bCSAdauJw90nOgeHwCmfdfeJd0NoZgJMXZNzW6aGYF5ItafBYM
         1I/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8CBAJkRMxtrCg7KxrhvykHCG2p+lXF1jwDt162j1T2c=;
        b=Bwyb/boAMR+6AUOCcylhkkGVLwmV935wbOSK69bZlgH24rX4CKrElnMFb5D10B+dX0
         i5iZH8jWqYNt3kGQ837Lvg4W6EGXF18SoZNEqJNJze618jQ6Zu+0H/+F1a8DNLzsOhXX
         YBFDAoAIejpP/6OsFt0v2MlXuElgBcUsxcGG6li8y5PAHDYEOmW8cu020NCTqyLMwG6r
         ndi57vTOJOsUgDnpib8rKSOf/9YfO6gyG7KmMJ0NvX8/jO4VJRMdOGnJRj7cgQIGbDzJ
         jNoiEi372Kq2FCPzu5Q71Nb9O1rqMjTfPrtCZAsGPnQ3jKZDAa2Mq2A3Ox47F0C3nuYR
         dk/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e30si10036578iov.72.2021.02.22.18.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 18:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lENMd-0006rZ-8e
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 21:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENM0-00069E-7e; Mon, 22 Feb 2021 21:23:12 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENLq-0000IS-7K; Mon, 22 Feb 2021 21:23:11 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dl2q82RPczjRSt;
 Tue, 23 Feb 2021 10:21:24 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 10:22:53 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v3 3/3] vfio: Avoid disabling and enabling vectors repeatedly
 in VFIO migration
Date: Tue, 23 Feb 2021 10:22:25 +0800
Message-ID: <20210223022225.50-4-lushenming@huawei.com>
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
X-TUID: 1nmDRrn1502c

In VFIO migration resume phase and some guest startups, there are
already unmasked vectors in the vector table when calling
vfio_msix_enable(). So in order to avoid inefficiently disabling
and enabling vectors repeatedly, let's allocate all needed vectors
first and then enable these unmasked vectors one by one without
disabling.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
---
 hw/pci/msix.c         |  2 +-
 hw/vfio/pci.c         | 20 +++++++++++++++++---
 include/hw/pci/msix.h |  1 +
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..e057958fcd 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -131,7 +131,7 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
     }
 }
 
-static bool msix_masked(PCIDevice *dev)
+bool msix_masked(PCIDevice *dev)
 {
     return dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] & MSIX_MASKALL_MASK;
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f74be78209..088fd41926 100644
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
+    if (!msix_masked(pdev)) {
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
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..b3cd88e262 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -28,6 +28,7 @@ void msix_load(PCIDevice *dev, QEMUFile *f);
 
 int msix_enabled(PCIDevice *dev);
 int msix_present(PCIDevice *dev);
+bool msix_masked(PCIDevice *dev);
 
 bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
-- 
2.19.1

