Received: by 2002:a05:7022:6292:b0:68:2721:5dd0 with SMTP id e18csp1939074dle;
        Wed, 5 Jul 2023 09:52:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH7/cs8kXgTdnVZXYUJwgXBBn9G7UWuf/rXScIXXZzbmnOVR5badXq83XmKetrxrUWFYvfb
X-Received: by 2002:a05:620a:25cf:b0:763:b475:90ef with SMTP id y15-20020a05620a25cf00b00763b47590efmr20417932qko.69.1688575935082;
        Wed, 05 Jul 2023 09:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688575935; cv=none;
        d=google.com; s=arc-20160816;
        b=v+xuD5kVB7IzWbeWnElPJIf9coEfuad0rWGWhuivviso69V9/NXg1TnRXmJZU8Hgeq
         qFVLlqDpuHCqC2g6z8Cr0/GHISt82u1UcbfnGM4vNQXLTj94Kj+c2nt25bfrQHNHw75R
         vt3xdCK65+by5bdaMq3ne71Rp9fDV0tIgbznfsz0XB67jSMIzdtS+snQmLc9ZUeOCMAt
         zB8EyWwYpSwGoofqLp+3PqJsSxHk4y4mj325gvBdZlxRcNZiFMU45ZpopOu5/8I3/7fu
         FklBc/3NI5DZ8JXoswavFOmGuVYBFHav8PJQTH1suOl6ZDBOEuMJYXhL+TeTMTiTv5ZP
         zinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B+jWD8J30spDME4DbjhwZSLOayYk9MvKNCF70X1UfdM=;
        fh=5eD6j/FRNhiOVLdkQejPYFOxzIUKNOsVEWKd9nlc1ic=;
        b=PfK/iIDN58fdYqkPh1hsrWdStVvw9xnExjWIJiNMrQqcQAKL1couxPNcwN/iwJnLs9
         9BATbTP7QAHNGnBp1GZtM3+yJtYq9w1cwneJMJpSOjMfE7O0EVdMBle8H7VgKR68IYS4
         mQZjpSodayX/3Dg6G7xLjjQjOqwvCf/Ua/MlsUBqlU0q3qQQWVCS+lnH1cTppfh1yYS1
         NExJclIJKZBw/L0kDaQ3klViHGQ3Cxatxf2074A+CBxiAigfA/KS2dWSm6upZokVtlUs
         cswJCglu3h1wIx0mP0hCOZvcv4owE0Iz1CYLOwhHzt5Y0szMUvNiasfxCQ/4MMEN6kVq
         psxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W1DjP4HO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020a05620a219400b0075f930f86ccsi13057381qka.337.2023.07.05.09.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 09:52:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W1DjP4HO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH5jL-0002Mr-AD; Wed, 05 Jul 2023 12:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qH5jB-0002Hr-C5
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 12:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qH5j9-0006nK-QR
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 12:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688575899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+jWD8J30spDME4DbjhwZSLOayYk9MvKNCF70X1UfdM=;
 b=W1DjP4HOpcASqIYBhQwiLagf3tE34rUZ45uEn9lXmfw3ae5hB6btWvyLHyy/Gs2LCQay0h
 iWW8DbLy8dc+5M1c5Tw1Vm+KyrLJ0edt6+WxhB8Y+UYD+CDiTvkJCFOljlJBFgD86G9/qH
 m4W+aLsRMhyBeu2N5i2QrKm/KQRxy+U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-mtgGoX5TOgKlH4o1dTBOHw-1; Wed, 05 Jul 2023 12:51:36 -0400
X-MC-Unique: mtgGoX5TOgKlH4o1dTBOHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DFCF38294A5;
 Wed,  5 Jul 2023 16:51:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3140C1121314;
 Wed,  5 Jul 2023 16:51:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, clg@redhat.com, bharat.bhushan@nxp.com,
 peter.maydell@linaro.org
Subject: [PATCH v2 2/2] virtio-iommu: Rework the traces in
 virtio_iommu_set_page_size_mask()
Date: Wed,  5 Jul 2023 18:51:18 +0200
Message-Id: <20230705165118.28194-3-eric.auger@redhat.com>
In-Reply-To: <20230705165118.28194-1-eric.auger@redhat.com>
References: <20230705165118.28194-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: jx2qvs35g8c7

The current error messages in virtio_iommu_set_page_size_mask()
sound quite similar for different situations and miss the IOMMU
memory region that causes the issue.

Clarify them and rework the comment.

Also remove the trace when the new page_size_mask is not applied as
the current frozen granule is kept. This message is rather confusing
for the end user and anyway the current granule would have been used
by the driver.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8d0c5e3f32..4b711ddd09 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1101,29 +1101,24 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
                                           new_mask);
 
     if ((cur_mask & new_mask) == 0) {
-        error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
-                   " is incompatible with mask 0x%"PRIx64, cur_mask, new_mask);
+        error_setg(errp, "virtio-iommu %s reports a page size mask 0x%"PRIx64
+                   " incompatible with currently supported mask 0x%"PRIx64,
+                   mr->parent_obj.name, new_mask, cur_mask);
         return -1;
     }
 
     /*
      * Once the granule is frozen we can't change the mask anymore. If by
      * chance the hotplugged device supports the same granule, we can still
-     * accept it. Having a different masks is possible but the guest will use
-     * sub-optimal block sizes, so warn about it.
+     * accept it.
      */
     if (s->granule_frozen) {
-        int new_granule = ctz64(new_mask);
         int cur_granule = ctz64(cur_mask);
 
-        if (new_granule != cur_granule) {
-            error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
-                       " is incompatible with mask 0x%"PRIx64, cur_mask,
-                       new_mask);
+        if (!(BIT(cur_granule) & new_mask)) {
+            error_setg(errp, "virtio-iommu %s does not support frozen granule 0x%"PRIx64,
+                       mr->parent_obj.name, BIT(cur_granule));
             return -1;
-        } else if (new_mask != cur_mask) {
-            warn_report("virtio-iommu page mask 0x%"PRIx64
-                        " does not match 0x%"PRIx64, cur_mask, new_mask);
         }
         return 0;
     }
-- 
2.38.1

