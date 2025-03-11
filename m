Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1881913njc;
        Tue, 11 Mar 2025 07:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLLagXY/5dSi7/Y9wg8vZ9FOoVcK0Ltugtza8r5jjCibFtBo0s3QlsJ+Ab4TGejtI36LrYBloOvU/isg==@linaro.org
X-Google-Smtp-Source: AGHT+IH7/M1T4I6yg3Ht+7KwUHuy4vkUKCQxi//4EdthvDJEubFa5YPCXpoBdeRANmX6AcjUI3v0
X-Received: by 2002:a5d:584c:0:b0:391:47d8:de3e with SMTP id ffacd0b85a97d-39147d8e0c5mr8718571f8f.46.1741702375815;
        Tue, 11 Mar 2025 07:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702375; cv=none;
        d=google.com; s=arc-20240605;
        b=Hy7HHXI4Mkbel1+P5CP8oAjiZz3xX3co7Cr29LPMUD4zHEMwsbXKPnQkFdu2QpV2/4
         7zdoBNAQozxAXyTJOSRybZ4DAZSosOuPxze4YXdV0Mb7vXV8KExut+6BfbVX+lPL19Dw
         uuRWzP2lsEucem+epKwwoAZR/JlRtA/UJ2tzBJSYh7/m7nOcx+0aqfCk4zkRGUWeFgCN
         vmK2ulwc8tLO11r0neJ+BGFdEXze7ukY36CCzWVUqjK5qUd1iQXjRI5lUFmA9wtZX9sD
         6UlPiLFJga90u9BGUU/hXv9O7zj8Xitc2B8f0v6oxXOgzFOgT31viaM4fMqEPA8Thma2
         pw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=J6PyL26X4Z+fd9pva+ozBZ9+vSE3kJO60n8J0OVLIDI=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=ZSNfc7LNzTwFRbo3vtJzjF9D0+lPuOf+8Dowi4mcMqz//w1jPxgyCQ/znFsslC7owU
         gwnHKzzjRa+uKSB/C7EI7ztv49myowOK8UmdrkTEA8qsEZ237w06gi0qPkWQ7Oub/+hx
         IlfIzy4dbsLJXX8um+KUN8DP141AAZnjPzX8L+WH88i7QYOgORaxyisoDjRX9HhQOzqO
         TKjG18WoY9/TuESDbeHrVR1kWspxZYRJaL403qSUrqpAFetwHDZaohZVhF9dpiin0x4D
         FtVvjxFH8yH+t4kxanjSCKACXKrmx4+cNEJl9T/Iq8VXOYQ6kN2Flj/2Hvs3Dct3DUXZ
         IyHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912bfda85bsi8806675f8f.127.2025.03.11.07.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0L7-00009Y-69; Tue, 11 Mar 2025 10:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0L5-00008y-CU; Tue, 11 Mar 2025 10:12:11 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0L3-0006qs-Jk; Tue, 11 Mar 2025 10:12:11 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwcb03GGz6D8cc;
 Tue, 11 Mar 2025 22:09:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 951F1140D26;
 Tue, 11 Mar 2025 22:12:07 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:12:00 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 02/20] backends/iommufd: Introduce iommufd_vdev_alloc
Date: Tue, 11 Mar 2025 14:10:27 +0000
Message-ID: <20250311141045.66620-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nF+2N13DssGa

From: Nicolin Chen <nicolinc@nvidia.com>

Add a helper to allocate an iommufd device's virtual device (in the user
space) per a viommu instance.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 backends/iommufd.c       | 26 ++++++++++++++++++++++++++
 backends/trace-events    |  1 +
 include/system/iommufd.h |  4 ++++
 3 files changed, 31 insertions(+)

diff --git a/backends/iommufd.c b/backends/iommufd.c
index 3fac08c96e..3511dd32ab 100644
--- a/backends/iommufd.c
+++ b/backends/iommufd.c
@@ -366,6 +366,32 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
     return true;
 }
 
+bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
+                                uint32_t viommu_id, uint64_t virt_id,
+                                uint32_t *out_vdev_id, Error **errp)
+{
+    int ret, fd = be->fd;
+    struct iommu_vdevice_alloc alloc_vdev = {
+        .size = sizeof(alloc_vdev),
+        .viommu_id = viommu_id,
+        .dev_id = dev_id,
+        .virt_id = virt_id,
+    };
+
+    ret = ioctl(fd, IOMMU_VDEVICE_ALLOC, &alloc_vdev);
+
+    trace_iommufd_backend_alloc_vdev(fd, dev_id, viommu_id, virt_id,
+                                     alloc_vdev.out_vdevice_id, ret);
+
+    if (ret) {
+        error_setg_errno(errp, errno, "IOMMU_VDEVICE_ALLOC failed");
+        return false;
+    }
+
+    *out_vdev_id = alloc_vdev.out_vdevice_id;
+    return true;
+}
+
 bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
                                            uint32_t hwpt_id, Error **errp)
 {
diff --git a/backends/trace-events b/backends/trace-events
index a835827540..86c8f89e8a 100644
--- a/backends/trace-events
+++ b/backends/trace-events
@@ -20,3 +20,4 @@ iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) "
 iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
 iommufd_backend_invalidate_cache(int iommufd, uint32_t hwpt_id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d hwpt_id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
 iommufd_backend_alloc_viommu(int iommufd, uint32_t type, uint32_t dev_id, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
+iommufd_backend_alloc_vdev(int iommufd, uint32_t dev_id, uint32_t viommu_id, uint64_t virt_id, uint32_t vdev_id, int ret) " iommufd=%d dev_id=%u viommu_id=%u virt_id=0x%"PRIx64" vdev_id=%u (%d)"
diff --git a/include/system/iommufd.h b/include/system/iommufd.h
index 7e5507f2db..53920bae5b 100644
--- a/include/system/iommufd.h
+++ b/include/system/iommufd.h
@@ -59,6 +59,10 @@ bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
                                   uint32_t viommu_type, uint32_t hwpt_id,
                                   uint32_t *out_hwpt, Error **errp);
 
+bool iommufd_backend_alloc_vdev(IOMMUFDBackend *be, uint32_t dev_id,
+                                uint32_t viommu_id, uint64_t virt_id,
+                                uint32_t *out_vdev_id, Error **errp);
+
 bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
                                         bool start, Error **errp);
 bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,
-- 
2.34.1

