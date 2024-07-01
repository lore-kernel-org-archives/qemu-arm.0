Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1229704njm;
        Mon, 1 Jul 2024 01:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpAqYT/co6DeTVWpStJLBtM9cyW/wSRhw1d/kH4dF78ZJWIos1vnWwqkgSvbhhhoStXA/Qa8ScyGj8SwBus3kjUR3W+GyY
X-Google-Smtp-Source: AGHT+IECV46bBlEeksvGm+fFsYdWjVbf15q6V+Oxe4GfhCn34Yikq/riSqchdYNZl7jfUPgBsL9r
X-Received: by 2002:ac8:5814:0:b0:445:938f:41a4 with SMTP id d75a77b69052e-44662e48d53mr53671411cf.48.1719823941321;
        Mon, 01 Jul 2024 01:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719823941; cv=none;
        d=google.com; s=arc-20160816;
        b=dfqjYkZG4XzdPnR+uewtdS7aJA9wGpHCS6sKztXZBNyah9GBu/7hNtoNsJsBVrZ3vf
         hx7d6qAlvI/kNPLhidW+dSgsiEZyEm8pp7QktsCaZ/PhcbjQWpQMdRytZL/M4dRN5hDq
         uRRF3GrIZosB6C876/WrASGF2gFhsgOD/ZVqdPElw9goDu0yaGi+o0zmJsDoS+qSk0IJ
         CQuAiKjC+AhiC7PktLNbnMOTNyYCcZVGsliVAUCFjW8OcC5/1OMCGOwWjUWGgP2VhVBh
         IbGnylPRyPRBdYXtDNgTa6AS2dEYzO3Rk1x+tENSb73TqomFpeao6Lg+muwLMLUZHsZr
         Uiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NFFaBa9+OudvDsG6jDu0J1ABcu3A6sayO2az7SCsvqs=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=ZoNlx5W4Qr7i8OlKXbUQrIuzrPxkeDcukk/vl/Nfhc/VnZr3/VqT3PiGh0x3evQnDS
         OrlHdmmk8Jb4SaD8pCdBagh3TWJim4SdGiWgg7/5ewzr7xw2adQR+e9WDVFDKcGjq13b
         ZtPjhZthpjxdZeiPyGXCdUPztIBQoLvDT9ywioizsVac4xVZzKw5n4vWI2c0RzVfCLus
         DTSoicJlEMAC5ldvNODRjA4c+0D2wBRvKQQdV+49C7ZYkTURbbXanV2dr5aliMFrkTIv
         PSUGlN8H0zfC5A4aw5iXhBhzqJULSw0sf/6KQGsfQUYe/VQsRqlurtCWDNJ3vkl9BTY7
         r2WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VHH5LNzM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514da659si74645621cf.704.2024.07.01.01.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 01:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VHH5LNzM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOClY-0005hM-FB; Mon, 01 Jul 2024 04:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCjt-00038n-MM
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 04:50:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCjs-0005Lw-6t
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 04:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719823819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFFaBa9+OudvDsG6jDu0J1ABcu3A6sayO2az7SCsvqs=;
 b=VHH5LNzM1k7qG4UHhm9sGsnTSt/Gk7wP/47ro5fkHpa8bRooF9wN6OZQ2M8+qpyBG5x3hQ
 LEz66FTnV2Tup5UpOLwXu9YqK7mQ5UENO4pgRtEqzHN5ueHPO4V9Cp5akxSfn8XwmcZzrh
 ZKYJodYI+kq+XAtlT3jbLd8T6C1ghQg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-nok7mDnpPimma0MmeQAeqw-1; Mon,
 01 Jul 2024 04:50:14 -0400
X-MC-Unique: nok7mDnpPimma0MmeQAeqw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1B32719560A7; Mon,  1 Jul 2024 08:50:13 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.22.9.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DC9FF1956089; Mon,  1 Jul 2024 08:50:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH v2 2/7] vfio-container-base: Introduce
 vfio_container_get_iova_ranges() helper
Date: Mon,  1 Jul 2024 10:48:54 +0200
Message-ID: <20240701084957.1567641-3-eric.auger@redhat.com>
In-Reply-To: <20240701084957.1567641-1-eric.auger@redhat.com>
References: <20240701084957.1567641-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jswG7ZHkkiZX

Introduce vfio_container_get_iova_ranges() to retrieve the usable
IOVA regions of the base container and use it in the Host IOMMU
device implementations of get_iova_ranges() callback.

We also fix a UAF bug as the list was shallow copied while
g_list_free_full() was used both on the single call site, in
virtio_iommu_set_iommu_device() but also in
vfio_container_instance_finalize(). Instead use g_list_copy_deep.

Fixes: cf2647a76e ("virtio-iommu: Compute host reserved regions")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/vfio/vfio-container-base.h |  2 ++
 hw/vfio/container-base.c              | 15 +++++++++++++++
 hw/vfio/container.c                   |  8 +-------
 hw/vfio/iommufd.c                     |  8 +-------
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/include/hw/vfio/vfio-container-base.h b/include/hw/vfio/vfio-container-base.h
index 419e45ee7a..45d7c40fce 100644
--- a/include/hw/vfio/vfio-container-base.h
+++ b/include/hw/vfio/vfio-container-base.h
@@ -86,6 +86,8 @@ int vfio_container_set_dirty_page_tracking(VFIOContainerBase *bcontainer,
 int vfio_container_query_dirty_bitmap(const VFIOContainerBase *bcontainer,
                    VFIOBitmap *vbmap, hwaddr iova, hwaddr size, Error **errp);
 
+GList *vfio_container_get_iova_ranges(const VFIOContainerBase *bcontainer);
+
 #define TYPE_VFIO_IOMMU "vfio-iommu"
 #define TYPE_VFIO_IOMMU_LEGACY TYPE_VFIO_IOMMU "-legacy"
 #define TYPE_VFIO_IOMMU_SPAPR TYPE_VFIO_IOMMU "-spapr"
diff --git a/hw/vfio/container-base.c b/hw/vfio/container-base.c
index 50b1664f89..809b157674 100644
--- a/hw/vfio/container-base.c
+++ b/hw/vfio/container-base.c
@@ -83,6 +83,21 @@ int vfio_container_query_dirty_bitmap(const VFIOContainerBase *bcontainer,
                                                errp);
 }
 
+static gpointer copy_iova_range(gconstpointer src, gpointer data)
+{
+     Range *source = (Range *)src;
+     Range *dest = g_new(Range, 1);
+
+     range_set_bounds(dest, range_lob(source), range_upb(source));
+     return dest;
+}
+
+GList *vfio_container_get_iova_ranges(const VFIOContainerBase *bcontainer)
+{
+    assert(bcontainer);
+    return g_list_copy_deep(bcontainer->iova_ranges, copy_iova_range, NULL);
+}
+
 static void vfio_container_instance_finalize(Object *obj)
 {
     VFIOContainerBase *bcontainer = VFIO_IOMMU(obj);
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index 2e7ecdf10e..2ad57cd845 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -1169,15 +1169,9 @@ static GList *
 hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
 {
     VFIODevice *vdev = hiod->agent;
-    GList *l = NULL;
 
     g_assert(vdev);
-
-    if (vdev->bcontainer) {
-        l = g_list_copy(vdev->bcontainer->iova_ranges);
-    }
-
-    return l;
+    return vfio_container_get_iova_ranges(vdev->bcontainer);
 }
 
 static void vfio_iommu_legacy_instance_init(Object *obj)
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index c2f158e603..890d8d6a38 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -647,15 +647,9 @@ static GList *
 hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
 {
     VFIODevice *vdev = hiod->agent;
-    GList *l = NULL;
 
     g_assert(vdev);
-
-    if (vdev->bcontainer) {
-        l = g_list_copy(vdev->bcontainer->iova_ranges);
-    }
-
-    return l;
+    return vfio_container_get_iova_ranges(vdev->bcontainer);
 }
 
 static void hiod_iommufd_vfio_class_init(ObjectClass *oc, void *data)
-- 
2.41.0

