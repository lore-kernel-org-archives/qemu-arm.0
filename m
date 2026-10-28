Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616C606A324
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JU9L/11S
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM7Hn-0004lP-9a; Wed, 28 Oct 2026 13:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xM7HC-00023l-Cv
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 13:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xM7HA-00041V-IG
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 13:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793207843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V/oKjMzr8Rc7yu06F2y0n510k9UPr1g4Or92VUQbyVk=;
 b=JU9L/11SpJxKvTTGkVDAgQsXxt4dzVCfif3MM+r/HlTiIgmQWG/WdO9BPzWqLhf1Y290AX
 AGGkLjk4dW+fxSvkDS6rKBB1bDzrNOGI2l2/1/+IC5B4X2V0WFTs5pyIGLVyXSDeeCPk9h
 EwaAdIy6/ermIUl5mccoD2A0o/MZ0Dk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-EZocx24kOuOnlTJ9K5Xl5w-1; Wed, 28 Oct 2026 13:17:19 -0400
X-MC-Unique: EZocx24kOuOnlTJ9K5Xl5w-1
X-Mimecast-MFC-AGG-ID: EZocx24kOuOnlTJ9K5Xl5w_1793207839
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a77c1cbd15so11308385e9.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 10:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793207838; x=1793812638;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V/oKjMzr8Rc7yu06F2y0n510k9UPr1g4Or92VUQbyVk=;
 b=u4RjnHs100y3UPEQcYQ50KcAu9zrHtX0GCxVW4/MI/L3QCR1AwGc44Ooazbgz1ynVO
 n5n19winniGzy1qowFfvsbCN3s1SZ8WTFmar1vmb+wrw+zeYkdo4V7Vq/HWuskulDXc9
 Skig9XxoLVQ4N16KMv1AubD4xIIEAoLw70+jpVvK2uhIOGqMRGYXLJGsjCnqTZZgSvqK
 xqW8nXQ5uWZYt1RUpXT9zBS5Th2e5Zo2ILdXS+XaDnOmAoKO0pK2GbL5uJAOdaye+UTu
 Owa5SEo68QuHqO3vxLNlWIPBZ0h91B0sAxBiX3OuABVEEDZfaOum6ktFmgDN5qExovRx
 olEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAeNj933S8YNuYkYmrsX8nfDnyKc6+IiWMwntePiZxsLxmAu9N2upwn2aXk2saEiTqsXxxvEJMCw==@nongnu.org
X-Gm-Message-State: AFq9FYL82K+lUpgO8+e73qSkM4G2/n2OC3maKbJgYjewapF6boHafsPV
 5qEcmze7QTEiaSns+Q+LxP6p0z4fpctnAFFDDrbJB5zR7URu45wrnZLyaIgHbGq39o4ZqPvO6Cg
 QykbIZcePS3mIcPpLfll+EgOCfdX7rJwyaJomAQ+sX4HijRgSa3cB8w==
X-Gm-Gg: AYBFou1t2pofyPL6YzQch4UYiV+qwBxbqSdNZU74tCwFqat+2pTFa/fJjB8ZvR5PjdX
 DkBvNIbHmwpff2LcBpK2k349zWCM25lg9TqqgmaD2ulAC+0sjTmUPmubbBdwzFL66s+m2IGFePq
 8llM24KmVaxWNr/YSEP1ebAqF+15YUwBV/3etxznIgpCxf/r4RrytC3m+s4CcvciO2C9dNa39GQ
 LMbiymqL9C6dU8rIrMx79Bu9Gjhpd+/fU+3BRw0ZwsQWOZHCOyU3bzjINtYFvR+9bgDQthBTIGd
 PZGGMqqWNmfm9zONjFhFpnCWl1oDA3jnItAIQUqEYchDHT3zKSwYkJfa7degZeTDg91nVzdpUjx
 mvYWncLJLL73M3NC7JQkxfiKTJ1DycYtXc4tlAycn
X-Received: by 2002:a05:600c:3516:b0:4a8:cb23:f71b with SMTP id
 5b1f17b1804b1-4a966c4175cmr66999535e9.18.1793207838397; 
 Wed, 28 Oct 2026 10:17:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3516:b0:4a8:cb23:f71b with SMTP id
 5b1f17b1804b1-4a966c4175cmr66998825e9.18.1793207837805; 
 Wed, 28 Oct 2026 10:17:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa82516a45sm6021505e9.15.2026.10.28.10.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 10:17:17 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:17:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Clement Mathieu--Drif <clement.mathieu--drif@bull.com>,
 Yi Liu <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Xudong Hao <xudong.hao@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex@shazbot.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 71/78] backends/iommufd: Extend iommufd_backend_alloc_hwpt()
 with fault_id
Message-ID: <1ea8e7ec0d6e27154ac8d2147623860d6a11efba.1793207602.git.mst@redhat.com>
References: <cover.1793207602.git.mst@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1793207602.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N1IklLc5id41LWlXcdKkhiL1dvzMdj6XDeINthj4kMM_1793207839
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

We should set flags IOMMU_HWPT_FAULT_ID_VALID when pass in a fault
object id in the caller.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Clement Mathieu--Drif <clement.mathieu--drif@bull.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20261020091955.1607161-4-zhenzhong.duan@intel.com>
---
 include/system/iommufd.h    | 4 ++--
 backends/iommufd.c          | 7 ++++---
 hw/arm/smmuv3-accel.c       | 6 +++---
 hw/i386/intel_iommu_accel.c | 2 +-
 hw/vfio/iommufd.c           | 2 +-
 backends/trace-events       | 2 +-
 6 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/system/iommufd.h b/include/system/iommufd.h
index 36b34b4899..79b8dabfb6 100644
--- a/include/system/iommufd.h
+++ b/include/system/iommufd.h
@@ -90,8 +90,8 @@ bool iommufd_backend_get_device_info(IOMMUFDBackend *be, uint32_t devid,
 bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
                                 uint32_t pt_id, uint32_t flags,
                                 uint32_t data_type, uint32_t data_len,
-                                void *data_ptr, uint32_t *out_hwpt,
-                                Error **errp);
+                                void *data_ptr, uint32_t fault_id,
+                                uint32_t *out_hwpt, Error **errp);
 bool iommufd_backend_alloc_viommu(IOMMUFDBackend *be, uint32_t dev_id,
                                   uint32_t viommu_type, uint32_t hwpt_id,
                                   void *data_ptr, uint32_t data_len,
diff --git a/backends/iommufd.c b/backends/iommufd.c
index 457b74a558..ecf4caee1a 100644
--- a/backends/iommufd.c
+++ b/backends/iommufd.c
@@ -317,8 +317,8 @@ int iommufd_backend_unmap_dma(IOMMUFDBackend *be, uint32_t ioas_id,
 bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
                                 uint32_t pt_id, uint32_t flags,
                                 uint32_t data_type, uint32_t data_len,
-                                void *data_ptr, uint32_t *out_hwpt,
-                                Error **errp)
+                                void *data_ptr, uint32_t fault_id,
+                                uint32_t *out_hwpt, Error **errp)
 {
     int ret, fd = be->fd;
     struct iommu_hwpt_alloc alloc_hwpt = {
@@ -329,11 +329,12 @@ bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
         .data_type = data_type,
         .data_len = data_len,
         .data_uptr = (uintptr_t)data_ptr,
+        .fault_id = fault_id,
     };
 
     ret = ioctl(fd, IOMMU_HWPT_ALLOC, &alloc_hwpt);
     trace_iommufd_backend_alloc_hwpt(fd, dev_id, pt_id, flags, data_type,
-                                     data_len, (uintptr_t)data_ptr,
+                                     data_len, (uintptr_t)data_ptr, fault_id,
                                      alloc_hwpt.out_hwpt_id, ret);
     if (ret) {
         error_setg_errno(errp, errno, "Failed to allocate hwpt");
diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index 91aca1aa14..66e6a5011a 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -268,7 +268,7 @@ smmuv3_accel_dev_alloc_translate(SMMUv3AccelDevice *accel_dev, STE *ste,
                                     accel->viommu->viommu_id, flags,
                                     IOMMU_HWPT_DATA_ARM_SMMUV3,
                                     sizeof(nested_data), &nested_data,
-                                    &hwpt_id, errp)) {
+                                    0, &hwpt_id, errp)) {
             return NULL;
     }
 
@@ -632,14 +632,14 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *hiodi,
     if (!iommufd_backend_alloc_hwpt(hiodi->iommufd, hiodi->devid, viommu_id,
                                     0, IOMMU_HWPT_DATA_ARM_SMMUV3,
                                     sizeof(abort_data), &abort_data,
-                                    &accel->abort_hwpt_id, errp)) {
+                                    0, &accel->abort_hwpt_id, errp)) {
         goto free_viommu;
     }
 
     if (!iommufd_backend_alloc_hwpt(hiodi->iommufd, hiodi->devid, viommu_id,
                                     0, IOMMU_HWPT_DATA_ARM_SMMUV3,
                                     sizeof(bypass_data), &bypass_data,
-                                    &accel->bypass_hwpt_id, errp)) {
+                                    0, &accel->bypass_hwpt_id, errp)) {
         goto free_abort_hwpt;
     }
 
diff --git a/hw/i386/intel_iommu_accel.c b/hw/i386/intel_iommu_accel.c
index c3677775e9..c8f2835204 100644
--- a/hw/i386/intel_iommu_accel.c
+++ b/hw/i386/intel_iommu_accel.c
@@ -100,7 +100,7 @@ static bool vtd_create_fs_hwpt(VTDHostIOMMUDevice *vtd_hiod,
     return iommufd_backend_alloc_hwpt(hiodi->iommufd, hiodi->devid,
                                       hiodi->hwpt_id, flags,
                                       IOMMU_HWPT_DATA_VTD_S1, sizeof(vtd), &vtd,
-                                      fs_hwpt_id, errp);
+                                      0, fs_hwpt_id, errp);
 }
 
 static void vtd_destroy_old_fs_hwpt(VTDAccelPASIDCacheEntry *vtd_pce)
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index de482128bf..90ddb54f4c 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -486,7 +486,7 @@ static bool iommufd_cdev_autodomains_get(VFIODevice *vbasedev,
     if (!iommufd_backend_alloc_hwpt(iommufd, vbasedev->devid,
                                     container->ioas_id, flags,
                                     IOMMU_HWPT_DATA_NONE, 0, NULL,
-                                    &hwpt_id, errp)) {
+                                    0, &hwpt_id, errp)) {
         return false;
     }
 
diff --git a/backends/trace-events b/backends/trace-events
index b1c1d89dd8..2f242feb78 100644
--- a/backends/trace-events
+++ b/backends/trace-events
@@ -16,7 +16,7 @@ iommufd_backend_map_file_dma(int iommufd, uint32_t ioas, uint64_t iova, uint64_t
 iommufd_backend_unmap_dma_non_exist(int iommufd, uint32_t ioas, uint64_t iova, uint64_t size, int ret) " Unmap nonexistent mapping: iommufd=%d ioas=%d iova=0x%"PRIx64" size=0x%"PRIx64" (%d)"
 iommufd_backend_unmap_dma(int iommufd, uint32_t ioas, uint64_t iova, uint64_t size, int ret) " iommufd=%d ioas=%d iova=0x%"PRIx64" size=0x%"PRIx64" (%d)"
 iommufd_backend_alloc_ioas(int iommufd, uint32_t ioas) " iommufd=%d ioas=%d"
-iommufd_backend_alloc_hwpt(int iommufd, uint32_t dev_id, uint32_t pt_id, uint32_t flags, uint32_t hwpt_type, uint32_t len, uint64_t data_ptr, uint32_t out_hwpt_id, int ret) " iommufd=%d dev_id=%u pt_id=%u flags=0x%x hwpt_type=%u len=%u data_ptr=0x%"PRIx64" out_hwpt=%u (%d)"
+iommufd_backend_alloc_hwpt(int iommufd, uint32_t dev_id, uint32_t pt_id, uint32_t flags, uint32_t hwpt_type, uint32_t len, uint64_t data_ptr, uint32_t fault_id, uint32_t out_hwpt_id, int ret) " iommufd=%d dev_id=%u pt_id=%u flags=0x%x hwpt_type=%u len=%u data_ptr=0x%"PRIx64" fault_id=%u out_hwpt=%u (%d)"
 iommufd_backend_alloc_faultq(int iommufd, uint32_t fault_id, uint32_t fault_fd, int ret) " iommufd=%d fault_id=%u fault_fd=%u (%d)"
 iommufd_backend_free_id(int iommufd, uint32_t id, int ret) " iommufd=%d id=%d (%d)"
 iommufd_backend_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%u enable=%d (%d)"
-- 
MST


