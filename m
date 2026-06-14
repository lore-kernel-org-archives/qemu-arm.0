Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE3FCD98D2
	for <qemu-arm@archiver.kernel.org>; Sun, 14 Jun 2026 19:14:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYq9p-0007Pa-UZ; Sun, 14 Jun 2026 15:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYq9o-0007PA-IS
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 15:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYq9m-0001e6-FY
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 15:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781463965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgIY+nGCDvSIdDIV3G1LWmuhJbM/v5NYrOFOTkV+U/c=;
 b=A2RQ3DpE08ba0ss9l1A92GZ60hbFU/iW2Gf/4/BtrdklrX1CBZcJ/Xv8dpbjLteNLdBX7w
 MsTU44+uiBFQaMzVvgIPCGzk5ZR12AXJEJwy+OhG5pzCGKxiofaevncJIg+OXoHmN2kZFY
 pWLKjmY/WYc1EGQHjL8sILPqkNAWjXE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-sAZi6tycOSmse_5iIDYb-w-1; Sun, 14 Jun 2026 15:06:04 -0400
X-MC-Unique: sAZi6tycOSmse_5iIDYb-w-1
X-Mimecast-MFC-AGG-ID: sAZi6tycOSmse_5iIDYb-w_1781463963
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490ae3bcf4cso12092745e9.3
 for <qemu-arm@nongnu.org>; Sun, 14 Jun 2026 12:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781463963; x=1782068763;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QgIY+nGCDvSIdDIV3G1LWmuhJbM/v5NYrOFOTkV+U/c=;
 b=Ess5wC2EOcmYhBgyQHIIbVq1vBnF9uC3s2Q7LI0BpAedwuCTVO7vEXJLlds/GrV3uO
 WWYQTTInHxDX8p9CfMF3H5hak0WM2wUXVrC2c6jh7fvQlf0QutAxXZ5yK3eZKYAQIuTI
 WFKmyyZdcmJXebG/XfdiNZgRL0XCm+gm7YyzpnMy7NIgI1JoeOWlI43xhBAYW8QB70gi
 L/wqWGMRm6NYoTuLtzF/RWFScBA5QCJgQG5nT45Iyx2BJnle/M+/eH7bh4nz5Rf8A9uz
 zV1DO5rK2I0FOhVAAZe/bSB7FgsBFv5TrS3iaNSFaMAbWzwA2GmJhmzt8/Ar5HN5xlw6
 893w==
X-Forwarded-Encrypted: i=1;
 AFNElJ96wVO9jbYut57TdCzQweU+DqR3JkIJjfbgOtxAmUk2raIaxUbYNFsKxDjcP8IbdCjw2ETLl4x2ZA==@nongnu.org
X-Gm-Message-State: AOJu0YxGkeEk+NYUylfhlbqx6jS60o+vN7xXMCLIy15ztyhDXteZzs6y
 bu37V5qYcy1EFAyop+7ylezZOa0U+16uVobLsJMNAUi/gku/M88bcRszC9a2zNTalo5eznv8sSn
 N5z+ZP4kLl0tXjXSQjGYHOvdaGJWxSMCgTo7zlkEvbNnxfXgsxyAwmA==
X-Gm-Gg: Acq92OHJErJKm1O+cM8Wt9c5ksw/CFkAvLg+9s869hNSbTQdqKMrkfyOMvUSrHVCeQt
 vIhcjCD/4na2qrXSfl/w7n+4PVT74Ye/EQgvEJ2+lx0EvjBhpp4N8IHDJPfT1ElXgqO9iiVYNH5
 /nz6kEUhn3+DFPxhZlkiWtqDcoy5e8fWQ1p0Ap3qMloBhTXnINdVqj53W7N9m/6/yL42ApJpNSr
 AD19GAEKyoSE7WoTcwP7MTJaYUAJlB0g6lS8/AOg9BVvRi7qwpjX5Ac1MeBJjX2ucomQzG71+44
 3zlOgmhruS3vgQ6AUJlWs/SGwpLXztothiVkI6OZd78t3gXl885cYuInBE8cRIY5F7xqpsQTGF6
 0X+6yyakMZsbNqpavl/sYBnnZcGLBpQ1Yz9yfP/wywgQ=
X-Received: by 2002:a7b:cd0b:0:b0:490:b2c9:e284 with SMTP id
 5b1f17b1804b1-49220143bc6mr63060465e9.30.1781463962863; 
 Sun, 14 Jun 2026 12:06:02 -0700 (PDT)
X-Received: by 2002:a7b:cd0b:0:b0:490:b2c9:e284 with SMTP id
 5b1f17b1804b1-49220143bc6mr63060215e9.30.1781463962231; 
 Sun, 14 Jun 2026 12:06:02 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f4f6sm29121174f8f.16.2026.06.14.12.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 12:06:00 -0700 (PDT)
Date: Sun, 14 Jun 2026 15:05:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Xudong Hao <xudong.hao@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Cl=C3=A9ment?= Mathieu--Drif <clement.mathieu--drif@bull.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex@shazbot.org>, qemu-arm@nongnu.org
Subject: [PULL 007/106] iommufd: Extend attach/detach_hwpt callbacks to
 support pasid
Message-ID: <20fb2f6961f847392bdbc26f85017a73570af0b5.1781463125.git.mst@redhat.com>
References: <cover.1781463125.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1781463125.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IRimX0hWJ_jRgrejdcA9z2rmV4o9rlMAfKnCDXpvsRc_1781463963
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

Same for the two wrappers and their call sites.

Suggested-by: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20260527054658.1021096-3-zhenzhong.duan@intel.com>
---
 backends/iommufd.c          | 23 ++++++++++++-----------
 hw/arm/smmuv3-accel.c       | 12 ++++++++----
 hw/i386/intel_iommu_accel.c | 19 ++++++++++---------
 hw/vfio/iommufd.c           | 22 +++++++++++-----------
 include/system/iommufd.h    | 18 ++++++++++++------
 5 files changed, 53 insertions(+), 41 deletions(-)

diff --git a/backends/iommufd.c b/backends/iommufd.c
index 410b044370..cfde6f2b2c 100644
--- a/backends/iommufd.c
+++ b/backends/iommufd.c
@@ -539,23 +539,24 @@ bool iommufd_backend_alloc_veventq(IOMMUFDBackend *be, uint32_t viommu_id,
 }
 
 bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
-                                           uint32_t hwpt_id, Error **errp)
-{
-    HostIOMMUDeviceIOMMUFDClass *hiodic =
-        HOST_IOMMU_DEVICE_IOMMUFD_GET_CLASS(hiodi);
-
-    g_assert(hiodic->attach_hwpt);
-    return hiodic->attach_hwpt(hiodi, hwpt_id, errp);
-}
-
-bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
+                                           uint32_t pasid, uint32_t hwpt_id,
                                            Error **errp)
 {
     HostIOMMUDeviceIOMMUFDClass *hiodic =
         HOST_IOMMU_DEVICE_IOMMUFD_GET_CLASS(hiodi);
 
+    g_assert(hiodic->attach_hwpt);
+    return hiodic->attach_hwpt(hiodi, pasid, hwpt_id, errp);
+}
+
+bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
+                                           uint32_t pasid, Error **errp)
+{
+    HostIOMMUDeviceIOMMUFDClass *hiodic =
+        HOST_IOMMU_DEVICE_IOMMUFD_GET_CLASS(hiodi);
+
     g_assert(hiodic->detach_hwpt);
-    return hiodic->detach_hwpt(hiodi, errp);
+    return hiodic->detach_hwpt(hiodi, pasid, errp);
 }
 
 static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap, Error **errp)
diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index 862be814a0..2947e2e5dc 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -300,7 +300,8 @@ bool smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
         return false;
     }
 
-    if (!host_iommu_device_iommufd_attach_hwpt(hiodi, hwpt_id, errp)) {
+    if (!host_iommu_device_iommufd_attach_hwpt(hiodi, IOMMU_NO_PASID, hwpt_id,
+                                               errp)) {
         if (s1_hwpt) {
             iommufd_backend_free_id(hiodi->iommufd, s1_hwpt->hwpt_id);
             g_free(s1_hwpt);
@@ -575,7 +576,8 @@ smmuv3_accel_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *hiodi,
 
     /* Attach a HWPT based on SMMUv3 GBPA.ABORT value */
     hwpt_id = smmuv3_accel_gbpa_hwpt(s, accel);
-    if (!host_iommu_device_iommufd_attach_hwpt(hiodi, hwpt_id, errp)) {
+    if (!host_iommu_device_iommufd_attach_hwpt(hiodi, IOMMU_NO_PASID, hwpt_id,
+                                               errp)) {
         goto free_veventq;
     }
     return true;
@@ -665,7 +667,8 @@ static void smmuv3_accel_unset_iommu_device(PCIBus *bus, void *opaque,
     hiodi = accel_dev->hiodi;
     accel = accel_dev->s_accel;
     /* Re-attach the default s2 hwpt id */
-    if (!host_iommu_device_iommufd_attach_hwpt(hiodi, hiodi->hwpt_id, NULL)) {
+    if (!host_iommu_device_iommufd_attach_hwpt(hiodi, IOMMU_NO_PASID,
+                                               hiodi->hwpt_id, NULL)) {
         error_report("Unable to attach the default HW pagetable: hiodi devid "
                      "0x%x", hiodi->devid);
     }
@@ -879,7 +882,8 @@ bool smmuv3_accel_attach_gbpa_hwpt(SMMUv3State *s, Error **errp)
 
     hwpt_id = smmuv3_accel_gbpa_hwpt(s, accel);
     QLIST_FOREACH(accel_dev, &accel->device_list, next) {
-        if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->hiodi, hwpt_id,
+        if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->hiodi,
+                                                   IOMMU_NO_PASID, hwpt_id,
                                                    &local_err)) {
             error_append_hint(&local_err, "Failed to attach GBPA hwpt %u for "
                               "hiodi devid %u", hwpt_id,
diff --git a/hw/i386/intel_iommu_accel.c b/hw/i386/intel_iommu_accel.c
index 18ca5a801a..3beadab035 100644
--- a/hw/i386/intel_iommu_accel.c
+++ b/hw/i386/intel_iommu_accel.c
@@ -121,8 +121,9 @@ static bool vtd_device_attach_iommufd(VTDHostIOMMUDevice *vtd_hiod,
         }
     }
 
-    ret = host_iommu_device_iommufd_attach_hwpt(hiodi, hwpt_id, errp);
-    trace_vtd_device_attach_hwpt(hiodi->devid, vtd_as->pasid, hwpt_id, ret);
+    ret = host_iommu_device_iommufd_attach_hwpt(hiodi, IOMMU_NO_PASID, hwpt_id,
+                                                errp);
+    trace_vtd_device_attach_hwpt(hiodi->devid, IOMMU_NO_PASID, hwpt_id, ret);
     if (ret) {
         /* Destroy old fs_hwpt if it's a replacement */
         vtd_destroy_old_fs_hwpt(hiodi, vtd_as);
@@ -141,22 +142,22 @@ static bool vtd_device_detach_iommufd(VTDHostIOMMUDevice *vtd_hiod,
 {
     HostIOMMUDeviceIOMMUFD *hiodi = HOST_IOMMU_DEVICE_IOMMUFD(vtd_hiod->hiod);
     IntelIOMMUState *s = vtd_as->iommu_state;
-    uint32_t pasid = vtd_as->pasid;
     bool ret;
 
     if (s->dmar_enabled && s->root_scalable) {
-        ret = host_iommu_device_iommufd_detach_hwpt(hiodi, errp);
-        trace_vtd_device_detach_hwpt(hiodi->devid, pasid, ret);
+        ret = host_iommu_device_iommufd_detach_hwpt(hiodi, IOMMU_NO_PASID,
+                                                    errp);
+        trace_vtd_device_detach_hwpt(hiodi->devid, IOMMU_NO_PASID, ret);
     } else {
         /*
          * If DMAR remapping is disabled or guest switches to legacy mode,
          * we fallback to the default HWPT which contains shadow page table.
          * So guest DMA could still work.
          */
-        ret = host_iommu_device_iommufd_attach_hwpt(hiodi, hiodi->hwpt_id,
-                                                    errp);
-        trace_vtd_device_reattach_def_hwpt(hiodi->devid, pasid, hiodi->hwpt_id,
-                                           ret);
+        ret = host_iommu_device_iommufd_attach_hwpt(hiodi, IOMMU_NO_PASID,
+                                                    hiodi->hwpt_id, errp);
+        trace_vtd_device_reattach_def_hwpt(hiodi->devid, IOMMU_NO_PASID,
+                                           hiodi->hwpt_id, ret);
     }
 
     if (ret) {
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index f86f6f0d7b..78e7b6a045 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -934,21 +934,21 @@ static void vfio_iommu_iommufd_class_init(ObjectClass *klass, const void *data)
 
 static bool
 host_iommu_device_iommufd_vfio_attach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
-                                           uint32_t hwpt_id, Error **errp)
-{
-    VFIODevice *vbasedev = HOST_IOMMU_DEVICE(hiodi)->agent;
-
-    return !iommufd_cdev_pasid_attach_ioas_hwpt(vbasedev, IOMMU_NO_PASID,
-                                                hwpt_id, errp);
-}
-
-static bool
-host_iommu_device_iommufd_vfio_detach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
+                                           uint32_t pasid, uint32_t hwpt_id,
                                            Error **errp)
 {
     VFIODevice *vbasedev = HOST_IOMMU_DEVICE(hiodi)->agent;
 
-    return iommufd_cdev_pasid_detach_ioas_hwpt(vbasedev, IOMMU_NO_PASID, errp);
+    return !iommufd_cdev_pasid_attach_ioas_hwpt(vbasedev, pasid, hwpt_id, errp);
+}
+
+static bool
+host_iommu_device_iommufd_vfio_detach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
+                                           uint32_t pasid, Error **errp)
+{
+    VFIODevice *vbasedev = HOST_IOMMU_DEVICE(hiodi)->agent;
+
+    return iommufd_cdev_pasid_detach_ioas_hwpt(vbasedev, pasid, errp);
 }
 
 static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
diff --git a/include/system/iommufd.h b/include/system/iommufd.h
index 2925d116ac..4257e50f62 100644
--- a/include/system/iommufd.h
+++ b/include/system/iommufd.h
@@ -138,14 +138,16 @@ struct HostIOMMUDeviceIOMMUFDClass {
      *
      * @hiodi: host IOMMU device backed by IOMMUFD backend.
      *
+     * @pasid: target pasid of the device to be attached.
+     *
      * @hwpt_id: ID of IOMMUFD hardware page table.
      *
      * @errp: pass an Error out when attachment fails.
      *
      * Returns: true on success, false on failure.
      */
-    bool (*attach_hwpt)(HostIOMMUDeviceIOMMUFD *hiodi, uint32_t hwpt_id,
-                        Error **errp);
+    bool (*attach_hwpt)(HostIOMMUDeviceIOMMUFD *hiodi, uint32_t pasid,
+                        uint32_t hwpt_id, Error **errp);
     /**
      * @detach_hwpt: detach host IOMMU device from IOMMUFD hardware page table.
      * VFIO and VDPA device can have different implementation.
@@ -154,15 +156,19 @@ struct HostIOMMUDeviceIOMMUFDClass {
      *
      * @hiodi: host IOMMU device backed by IOMMUFD backend.
      *
-     * @errp: pass an Error out when attachment fails.
+     * @pasid: target pasid of the device to be detached.
+     *
+     * @errp: pass an Error out when detachment fails.
      *
      * Returns: true on success, false on failure.
      */
-    bool (*detach_hwpt)(HostIOMMUDeviceIOMMUFD *hiodi, Error **errp);
+    bool (*detach_hwpt)(HostIOMMUDeviceIOMMUFD *hiodi, uint32_t pasid,
+                        Error **errp);
 };
 
 bool host_iommu_device_iommufd_attach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
-                                           uint32_t hwpt_id, Error **errp);
-bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
+                                           uint32_t pasid, uint32_t hwpt_id,
                                            Error **errp);
+bool host_iommu_device_iommufd_detach_hwpt(HostIOMMUDeviceIOMMUFD *hiodi,
+                                           uint32_t pasid, Error **errp);
 #endif
-- 
MST


