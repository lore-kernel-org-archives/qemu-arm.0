Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp879813njc;
        Wed, 26 Jun 2024 01:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmZvCsidHeuZPaTeHjg0YMes8kuOT2R/ys8Lyu2tycYPsZHDxguUtA89PqH0+JfskS2Y+NglQv0WtfQV8qtOGbN56cfEni
X-Google-Smtp-Source: AGHT+IEnUEQgDQXqKlispc1H4yJuVPO/P1rdnt+FspYD+s4mMqNsDBUM2B7q4Y6UGGfbv7fd+hfp
X-Received: by 2002:ad4:5187:0:b0:6b4:f98b:d57d with SMTP id 6a1803df08f44-6b53653ada0mr101203486d6.59.1719390500909;
        Wed, 26 Jun 2024 01:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719390500; cv=none;
        d=google.com; s=arc-20160816;
        b=gYLREeO6EKyqm7xgXxP8R9XQA67oshvH0y85deJsKYPl8TMPIC2jfxgJl8tm/SkSoI
         yaZwmlfpd5Qrdv8jCStH2JIy9RmpK+5wybSCaMJS+nnzLpmPHlmU1r0v2yFfX8NvZqQV
         hIYKFeE+2KKAuqhX4/QnsU03u1KVJ6fsZiG47iyesDvPqCdqbmmfKHHyTZN/V8VT5skG
         7y8AAH/1qbWeCy4jIygEUaKu+RBga6253Z4vQ1VVUd1p6VqGA5Bvz5+OMjc2ZBy6k/uO
         8UP+fgAB8kTti738KIwY6m+pH47GnhJnI96v+QjKDuar+l73SyF+ZU0GUjfMG1Z4QyRJ
         Pj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bZve/t/4IEVVs0YkFY83LrcVufG1gG2T8mz5Ir3gtRw=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=udHRLjdv2kavOsGw3C7g2gJNfLHkk7/64nD2cl+Bwqh8ZdVLbPsTXi1afb+aADFjWj
         i76DsVw+hdOzQnVQa16FrkU6xpOt7tS/Cz1SnpAUQ9+ZNVdljsPTblLuZP98JeyaAitQ
         vf6sifsflcso7IALzWAQ0Tk6Il5uXxDlk2cPyTGrkWrb9k4TFsE4OXTLYfJVQ1ETHx2/
         6u4pmEDzm+QAUeEQvO+b3lmqmXUdPnS+yfggMV5can5PiABJoBSiYBbGn06zT5sv7Raq
         OfnFOF+7RwIXjFzKknTfHl7dUpZReKPfhrsF9YzRbIodayv66RrpJL2tItAUVez4EK4k
         wQpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ft9pWlSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce913d07si1248939085a.322.2024.06.26.01.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 01:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ft9pWlSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMO0e-0007GO-JC; Wed, 26 Jun 2024 04:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0c-00078b-GB
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0a-0007CK-Ps
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719390484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZve/t/4IEVVs0YkFY83LrcVufG1gG2T8mz5Ir3gtRw=;
 b=Ft9pWlSiG4PegCELoFZT68HVirHC/o4KgbHrHqHBpfDVMLN1ewNcyTNFWiIL7VhooF7Ihn
 oS5ZXmD9dSh5vNdVpRhXGwgKFDx/jsjytblOY0ii+uP931MV/fU8RXNOa0jPwPoZC//Fal
 +VPQvmqeicRv4yAYOC5aXPlHatJ8cv0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-520-Dg7AECljMLuwnfeKL0Nlmg-1; Wed,
 26 Jun 2024 04:28:00 -0400
X-MC-Unique: Dg7AECljMLuwnfeKL0Nlmg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 46CA919560AB; Wed, 26 Jun 2024 08:27:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 554E61955E82; Wed, 26 Jun 2024 08:27:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH 4/7] HostIOMMUDevice: Introduce get_page_size_mask() callback
Date: Wed, 26 Jun 2024 10:26:49 +0200
Message-ID: <20240626082727.1278530-5-eric.auger@redhat.com>
In-Reply-To: <20240626082727.1278530-1-eric.auger@redhat.com>
References: <20240626082727.1278530-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AVTrNQ/jUH3k

This callback will be used to retrieve the page size mask supported
along a given Host IOMMU device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/vfio/vfio-container-base.h |  7 +++++++
 include/sysemu/host_iommu_device.h    |  8 ++++++++
 hw/vfio/container.c                   | 10 ++++++++++
 hw/vfio/iommufd.c                     | 11 +++++++++++
 4 files changed, 36 insertions(+)

diff --git a/include/hw/vfio/vfio-container-base.h b/include/hw/vfio/vfio-container-base.h
index 45d7c40fce..62a8b60d87 100644
--- a/include/hw/vfio/vfio-container-base.h
+++ b/include/hw/vfio/vfio-container-base.h
@@ -88,6 +88,13 @@ int vfio_container_query_dirty_bitmap(const VFIOContainerBase *bcontainer,
 
 GList *vfio_container_get_iova_ranges(const VFIOContainerBase *bcontainer);
 
+static inline uint64_t
+vfio_container_get_page_size_mask(const VFIOContainerBase *bcontainer)
+{
+    assert(bcontainer);
+    return bcontainer->pgsizes;
+}
+
 #define TYPE_VFIO_IOMMU "vfio-iommu"
 #define TYPE_VFIO_IOMMU_LEGACY TYPE_VFIO_IOMMU "-legacy"
 #define TYPE_VFIO_IOMMU_SPAPR TYPE_VFIO_IOMMU "-spapr"
diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
index 05c7324a0d..c1bf74ae2c 100644
--- a/include/sysemu/host_iommu_device.h
+++ b/include/sysemu/host_iommu_device.h
@@ -89,6 +89,14 @@ struct HostIOMMUDeviceClass {
      * @hiod: handle to the host IOMMU device
      */
     GList* (*get_iova_ranges)(HostIOMMUDevice *hiod);
+    /**
+     *
+     * @get_page_size_mask: Return the page size mask supported along this
+     * @hiod Host IOMMU device
+     *
+     * @hiod: handle to the host IOMMU device
+     */
+    uint64_t (*get_page_size_mask)(HostIOMMUDevice *hiod);
 };
 
 /*
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index adeab1ac89..b5ce559a0d 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -1174,6 +1174,15 @@ hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
     return vfio_container_get_iova_ranges(vdev->bcontainer);
 }
 
+static uint64_t
+hiod_legacy_vfio_get_page_size_mask(HostIOMMUDevice *hiod)
+{
+    VFIODevice *vdev = hiod->agent;
+
+    g_assert(vdev);
+    return vfio_container_get_page_size_mask(vdev->bcontainer);
+}
+
 static void vfio_iommu_legacy_instance_init(Object *obj)
 {
     VFIOContainer *container = VFIO_IOMMU_LEGACY(obj);
@@ -1188,6 +1197,7 @@ static void hiod_legacy_vfio_class_init(ObjectClass *oc, void *data)
     hioc->realize = hiod_legacy_vfio_realize;
     hioc->get_cap = hiod_legacy_vfio_get_cap;
     hioc->get_iova_ranges = hiod_legacy_vfio_get_iova_ranges;
+    hioc->get_page_size_mask = hiod_legacy_vfio_get_page_size_mask;
 };
 
 static const TypeInfo types[] = {
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index 211e7223f1..7b5f87a148 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -652,12 +652,23 @@ hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
     return vfio_container_get_iova_ranges(vdev->bcontainer);
 }
 
+static uint64_t
+hiod_iommufd_vfio_get_page_size_mask(HostIOMMUDevice *hiod)
+{
+    VFIODevice *vdev = hiod->agent;
+
+    g_assert(vdev);
+    return vfio_container_get_page_size_mask(vdev->bcontainer);
+}
+
+
 static void hiod_iommufd_vfio_class_init(ObjectClass *oc, void *data)
 {
     HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_CLASS(oc);
 
     hiodc->realize = hiod_iommufd_vfio_realize;
     hiodc->get_iova_ranges = hiod_iommufd_vfio_get_iova_ranges;
+    hiodc->get_page_size_mask = hiod_iommufd_vfio_get_page_size_mask;
 };
 
 static const TypeInfo types[] = {
-- 
2.41.0

