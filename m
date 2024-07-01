Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1229922njm;
        Mon, 1 Jul 2024 01:52:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5BS3mP9bJyzCFTIEapLp+jVO6yLnqXvTrRpUqKnjiAbeFLQbWNJjK/H9fflxMlU2t+qGIEXBYtTKH9TM2SAo43Ff9y46V
X-Google-Smtp-Source: AGHT+IEo2wkCaKTF579EPSttn7UEnM1ScYBBlaxxehN4qVQQUkvAOjOs70P7orb06WEvNAoT5o+M
X-Received: by 2002:a05:622a:13d0:b0:444:a454:8922 with SMTP id d75a77b69052e-44662dd0c60mr39209521cf.27.1719823973528;
        Mon, 01 Jul 2024 01:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719823973; cv=none;
        d=google.com; s=arc-20160816;
        b=RD5EmBf9RPQLunAz1Vq+iMc8Y1Bl+5ms7bkBtxPE+nvcidRIZwYI3OwYLiTIAn6j/x
         o1VOqPtuq7ELIgf9Hq8XqCOXCezzk5uxU6kk2+I8PUq+yTCHza7rlAsjU/8znxT7oeIa
         wilGKJR8lIx4FXfqNaY5IsnsFTPljKzf7zEwjhuQLzTETYXnP8opcXGQdTsM1ZAe1qWL
         ud2DAX8e1QtyL8vw18EdK7VOYn6FzeZPc3rCFFlGqBrK2GV2iKBpkR4nSg9pudSBqPqT
         /sbtZ0UUDT8o1L1O32dUoavZD7FR0KsrJSXcNMv9YOfH30JFOtnn9xUa1NOc0XMjKHJF
         Gu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=obYWTln6nHrjs7PGbhjMcBsfACiPv20wdGYJfvcKL+0=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=HqayQ3ERxwMVT4pfPFQgYbldfIVJtyncBLrKmLp3WirJ3JahM+JnQ/O6Ut0u5Pf7no
         oBQeTkDMy9qH45jCW1BJvz3xsS/UCLPmGfz2NhbD5QNwmCdGFKEHYzoqvawhBRxrfmXV
         32k3F84xIs8I9r7s9ADgzhhc4EX9WIROf4m9UOyHWtWPZd5Id+FCuUgxUuf1ZeS4uDmF
         39ToJi56VGITxxJWrPo8jtR9EF5ERYCjE3jw6BCHplLfippEurt6Xqxi5F3+8HbfxB2l
         ns33YWiZ15Hy/g2ya2TbaDHKkBFif1pbq7+uEByvFcJB72CE3rk53MfQCxUJ9nAEuIqE
         WyTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=arxeFCpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44664c5fdf1si42929361cf.755.2024.07.01.01.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 01:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=arxeFCpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOClk-0005zO-HQ; Mon, 01 Jul 2024 04:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCjw-0003Qe-Jv
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 04:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCjv-0005MG-0m
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 04:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719823822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obYWTln6nHrjs7PGbhjMcBsfACiPv20wdGYJfvcKL+0=;
 b=arxeFCprfUwRzusa8h5lzKS26cjHXOeTg2zbF71vlbiWXH8YIlkh6prlz7U1e5nASZSMT/
 APTD5w1+YhZ91Nx8qY/sKL0ERmv0cmph+pCEWb7Qy6HTRuy5XItndVxT+NEt3soqN0f9E4
 S/NuYt+uK9qvwAFysUF5B3uYpzgfQMc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-WMsP3oQTNG6lXHbigi_1Ag-1; Mon,
 01 Jul 2024 04:50:18 -0400
X-MC-Unique: WMsP3oQTNG6lXHbigi_1Ag-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DE6C11945117; Mon,  1 Jul 2024 08:50:16 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.22.9.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7D20A1956089; Mon,  1 Jul 2024 08:50:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH v2 3/7] HostIOMMUDevice : remove Error handle from
 get_iova_ranges callback
Date: Mon,  1 Jul 2024 10:48:55 +0200
Message-ID: <20240701084957.1567641-4-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VZMTz10beeEF

The error handle argument is not used anywhere. let's remove it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 include/sysemu/host_iommu_device.h | 3 +--
 hw/vfio/container.c                | 2 +-
 hw/vfio/iommufd.c                  | 2 +-
 hw/virtio/virtio-iommu.c           | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
index ee6c813c8b..05c7324a0d 100644
--- a/include/sysemu/host_iommu_device.h
+++ b/include/sysemu/host_iommu_device.h
@@ -87,9 +87,8 @@ struct HostIOMMUDeviceClass {
      * @hiod Host IOMMU device
      *
      * @hiod: handle to the host IOMMU device
-     * @errp: error handle
      */
-    GList* (*get_iova_ranges)(HostIOMMUDevice *hiod, Error **errp);
+    GList* (*get_iova_ranges)(HostIOMMUDevice *hiod);
 };
 
 /*
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index 2ad57cd845..adeab1ac89 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -1166,7 +1166,7 @@ static int hiod_legacy_vfio_get_cap(HostIOMMUDevice *hiod, int cap,
 }
 
 static GList *
-hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
+hiod_legacy_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
 {
     VFIODevice *vdev = hiod->agent;
 
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index 890d8d6a38..211e7223f1 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -644,7 +644,7 @@ static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
 }
 
 static GList *
-hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod, Error **errp)
+hiod_iommufd_vfio_get_iova_ranges(HostIOMMUDevice *hiod)
 {
     VFIODevice *vdev = hiod->agent;
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index b708fb96fd..b8f75d2b1a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -615,7 +615,7 @@ static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
 
     if (hiodc->get_iova_ranges) {
         int ret;
-        host_iova_ranges = hiodc->get_iova_ranges(hiod, errp);
+        host_iova_ranges = hiodc->get_iova_ranges(hiod);
         if (!host_iova_ranges) {
             return true; /* some old kernels may not support that capability */
         }
-- 
2.41.0

