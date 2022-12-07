Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp493355ejx;
        Wed, 7 Dec 2022 05:37:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4iGNBfig+dLdnQobisaHkstnVh9EGh1g13oTFwh3FzqBcWy1iJXqfWhfdjjnezKQjTS2eV
X-Received: by 2002:ac8:7087:0:b0:3a7:f5e5:66a7 with SMTP id y7-20020ac87087000000b003a7f5e566a7mr631393qto.371.1670420264248;
        Wed, 07 Dec 2022 05:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670420264; cv=none;
        d=google.com; s=arc-20160816;
        b=LZntWwaHlSD5+md4g6Ngktr6/yhqJCwhS6b3bzg3iDJCuK8s9MEAUK9It6QU7vNGUA
         euO3sj8iDsxcGEDyenTiL5w+Y+R4vK0K9b6CFTXmjkTwcF8N0977ql41oU6OJDsgXRTj
         D77bs3v1KPh5/87VfCLLRWBK6LQrSvQ1T8pjW2sF8cYPMQF48sd1LN89Is1oedBnig/Q
         GfcNkbbNgPEXcro3nZu8wOGSas/O4IpcYbLMq/+Eleqzx6c2hYvy4neEa2iO2+LlJsdF
         7u08SkrDsALdRSG9pnrcrovJxCzuoXPq1S67xjZ4FPz5C7DMZrGNONbKe6Ofqrbex69f
         cMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5/UyHJl48vBSnvkt5+gx7qkBlKO/QFIhbVzFp57PQ5s=;
        b=WG8nohdAIp/0YWPC4KRfVoWSND28nWEyE+zjlFs4xMT1w/2W5lPcDjEXpzhVafUyE1
         307yIzf+w5LP/8QOoRz2dqP+Kp26UGxRyVWUEY/or2WnYYXTuALYd+SspLvo56bu5VrM
         L1EnPIhh2axkMe4IxjrP8YGOZl9SPQjtlK30MnWZaZmBa5hAIqjfwBS6HgZlZwrW9M2D
         i+/4Vxw7oNQb5HGGOJYrrIpMWm6boBgnwbuwXALggqZvSzhl/5z22WeNv4uZmyPoHfon
         lDRuBkCutTZTIgqW1yHk22n9N5dyHEKI0GxoRKJmavxpdOvhwMz2jXS5158ozVXnHfuE
         fRuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X1mQ+kH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n65-20020a374044000000b006fc9abecd0asi9384087qka.474.2022.12.07.05.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Dec 2022 05:37:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X1mQ+kH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p2uc6-0002M5-OB; Wed, 07 Dec 2022 08:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2uc5-0002LZ-GK
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 08:37:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ubo-0006Sr-12
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 08:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670420226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/UyHJl48vBSnvkt5+gx7qkBlKO/QFIhbVzFp57PQ5s=;
 b=X1mQ+kH6/UpYLFnfaz6Be3AH7vNhCtPTgovygjso6lVFb20uo0J5NUPBjF533Cgfqwko/q
 JIhRbyB9i/SAyk7b7ANIlQ+oQPPqOdaprNVgbFAds02O/ByQ4GJ4kYOGqVuAYyxxyOg+4W
 /E7ukq1INVkn4fD/l2kWcog6nxeTmUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-2JP6O_pdMFGyOYd3wVnk7Q-1; Wed, 07 Dec 2022 08:37:03 -0500
X-MC-Unique: 2JP6O_pdMFGyOYd3wVnk7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A40B3185A7AD;
 Wed,  7 Dec 2022 13:37:02 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBCD79E70;
 Wed,  7 Dec 2022 13:37:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 peterx@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
Subject: [PATCH for 8.0 2/2] virtio-iommu: Fix replay on device attach
Date: Wed,  7 Dec 2022 14:36:46 +0100
Message-Id: <20221207133646.635760-3-eric.auger@redhat.com>
In-Reply-To: <20221207133646.635760-1-eric.auger@redhat.com>
References: <20221207133646.635760-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MqLprlyLb/Og

When attaching a device to a domain, we replay the existing
domain mappings for that device. If there are several VFIO
devices in the same group on the guest we may end up with
duplicate mapping attempts because the mapping already exist
on VFIO side. So let's do a proper remap, ie. first unmap
and then map.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes 2f6eeb5f0bb ("virtio-iommu: Call memory notifiers in attach/detach")
---
 hw/virtio/virtio-iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 30334c85aa..099dec1f31 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -277,19 +277,21 @@ static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
     return false;
 }
 
-static gboolean virtio_iommu_notify_map_cb(gpointer key, gpointer value,
-                                           gpointer data)
+static gboolean virtio_iommu_notify_remap_cb(gpointer key, gpointer value,
+                                             gpointer data)
 {
     VirtIOIOMMUMapping *mapping = (VirtIOIOMMUMapping *) value;
     VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
     IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
 
+    virtio_iommu_notify_unmap(mr, interval->low, interval->high);
     virtio_iommu_notify_map(mr, interval->low, interval->high,
                             mapping->phys_addr, mapping->flags);
 
     return false;
 }
 
+
 static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
 {
     VirtIOIOMMUDomain *domain = ep->domain;
@@ -489,7 +491,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     virtio_iommu_switch_address_space(sdev);
 
     /* Replay domain mappings on the associated memory region */
-    g_tree_foreach(domain->mappings, virtio_iommu_notify_map_cb,
+    g_tree_foreach(domain->mappings, virtio_iommu_notify_remap_cb,
                    ep->iommu_mr);
 
     return VIRTIO_IOMMU_S_OK;
-- 
2.37.3

