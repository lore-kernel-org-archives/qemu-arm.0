Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1881372njc;
        Tue, 11 Mar 2025 07:12:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDERSyBbeDCnsK5584E2RTlnq3W01mpBo3D//9nTUM/LuZ0nkkzZGkvp5/m59R2PKk3HmIcM7AFLY00w==@linaro.org
X-Google-Smtp-Source: AGHT+IE2Dj5FWUKopOp7GTeyBkdUt7yTcf7Z/SFRIbsaFVpb+MAPjXKcCfllZAnpw+e5UML6/vcf
X-Received: by 2002:a05:6402:27cc:b0:5e6:44d8:eced with SMTP id 4fb4d7f45d1cf-5e644d8eebemr31193536a12.12.1741702338438;
        Tue, 11 Mar 2025 07:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702338; cv=none;
        d=google.com; s=arc-20240605;
        b=dOPgXsb4dg26HzD+wd1yezkW2k0gsXWuFA3+Ch51mZ2edlmVvR3pBB7+i1m490wVQu
         vrfdvZqT0KBkkLTSiaSug3XEuWTklqyzuOaw+4Kf9IadkuB01FU2RzrrNbd+0HT9Rd3y
         ZHO5HPlLa3qqsqNObimTVC9Qgum2mpB9keakafWDHdM5oGit+RO6fmoT+6ACjFf7dbuS
         gicIAcEvGqh6Zpga2OxhtRSzl0O4dquzf7acTKMGQtmL9AMAbbgt2uhISTF/Rma5ilPI
         O8siX6eQyxROCFyu0APLTYSNdPPAAYO/eiYrKCwjn+OtZ6WTPyT3s9k5HuZCLHh2n5pL
         mNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=CawNJVP/7ZlOL296MedQQS1yoXCFM/S857FlCi6csVs=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=AikTw530Ql2GOpPY7USoiLC8Tou233Pcwo2JsXW7piLeGU/uwiRjcLMYYDIKEA12m6
         lRXyQnbb7hG8uHr7oq6ROqO8ZyyaMXLNrRWxlHjOFv5aeITbAbeDMVeQnxD8GD0iCUmM
         fiF99uxrQLO787mNyJ5VRXys5/7sQL27nerfpb6rNDVQd1WtHu4c9iLpmVJ4u0uPjkz5
         PHQTjMmdlSoxuZGopBfn7dtQhShxAUX0n7GUbEdnmdPHkTkxjElH9l5v9Su46eatWnuJ
         7qxBedWilCiIW4R3jwpTI0gKS/WeFJSGcpb+IWZ/BIDbzN1A7l28CKewH0SkfBzyHjj0
         To2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5e5c765d60asi10628875a12.321.2025.03.11.07.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0Kv-0008R8-RL; Tue, 11 Mar 2025 10:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Kt-0008M9-Qu; Tue, 11 Mar 2025 10:12:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Ks-0006of-0S; Tue, 11 Mar 2025 10:11:59 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwcM4DR0z6D8Yh;
 Tue, 11 Mar 2025 22:09:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 30EE014034E;
 Tue, 11 Mar 2025 22:11:56 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:11:48 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 01/20] backends/iommufd: Introduce
 iommufd_backend_alloc_viommu
Date: Tue, 11 Mar 2025 14:10:26 +0000
Message-ID: <20250311141045.66620-2-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: ZZZRv+1maVoe

From: Nicolin Chen <nicolinc@nvidia.com>

Add a helper to allocate a viommu object.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 backends/iommufd.c       | 25 +++++++++++++++++++++++++
 backends/trace-events    |  1 +
 include/system/iommufd.h |  4 ++++
 3 files changed, 30 insertions(+)

diff --git a/backends/iommufd.c b/backends/iommufd.c
index 3c23caef96..3fac08c96e 100644
--- a/backends/iommufd.c
+++ b/backends/iommufd.c
@@ -341,6 +341,31 @@ int iommufd_backend_invalidate_cache(IOMMUFDBackend *be, uint32_t hwpt_id,
     return ret;
 }
 
+bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
+                                  uint32_t viommu_type, uint32_t hwpt_id,
+                                  uint32_t *out_viommu_id, Error **errp)
+{
+    int ret, fd = be->fd;
+    struct iommu_viommu_alloc alloc_viommu = {
+        .size = sizeof(alloc_viommu),
+        .type = viommu_type,
+        .dev_id = dev_id,
+        .hwpt_id = hwpt_id,
+    };
+
+    ret = ioctl(fd, IOMMU_VIOMMU_ALLOC, &alloc_viommu);
+
+    trace_iommufd_backend_alloc_viommu(fd, viommu_type, dev_id, hwpt_id,
+                                       alloc_viommu.out_viommu_id, ret);
+    if (ret) {
+        error_setg_errno(errp, errno, "IOMMU_VIOMMU_ALLOC failed");
+        return false;
+    }
+
+    *out_viommu_id = alloc_viommu.out_viommu_id;
+    return true;
+}
+
 bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *idev,
                                            uint32_t hwpt_id, Error **errp)
 {
diff --git a/backends/trace-events b/backends/trace-events
index 5a23db6c8a..a835827540 100644
--- a/backends/trace-events
+++ b/backends/trace-events
@@ -19,3 +19,4 @@ iommufd_backend_free_id(int iommufd, uint32_t id, int ret) " iommufd=%d id=%d (%
 iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%u enable=%d (%d)"
 iommufd_backend_get_dirty_bitmap(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t page_size, int ret) " iommufd=%d hwpt=%u iova=0x%"PRIx64" size=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
 iommufd_backend_invalidate_cache(int iommufd, uint32_t hwpt_id, uint32_t data_type, uint32_t entry_len, uint32_t entry_num, uint32_t done_num, uint64_t data_ptr, int ret) " iommufd=%d hwpt_id=%u data_type=%u entry_len=%u entry_num=%u done_num=%u data_ptr=0x%"PRIx64" (%d)"
+iommufd_backend_alloc_viommu(int iommufd, uint32_t type, uint32_t dev_id, uint32_t hwpt_id, uint32_t viommu_id, int ret) " iommufd=%d type=%u dev_id=%u hwpt_id=%u viommu_id=%u (%d)"
diff --git a/include/system/iommufd.h b/include/system/iommufd.h
index b93421ac7c..7e5507f2db 100644
--- a/include/system/iommufd.h
+++ b/include/system/iommufd.h
@@ -55,6 +55,10 @@ bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
                                 uint32_t data_type, uint32_t data_len,
                                 void *data_ptr, uint32_t *out_hwpt,
                                 Error **errp);
+bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
+                                  uint32_t viommu_type, uint32_t hwpt_id,
+                                  uint32_t *out_hwpt, Error **errp);
+
 bool iommufd_backend_set_dirty_tracking(IOMMUFDBackend *be, uint32_t hwpt_id,
                                         bool start, Error **errp);
 bool iommufd_backend_get_dirty_bitmap(IOMMUFDBackend *be, uint32_t hwpt_id,
-- 
2.34.1

