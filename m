Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1246568ejf;
        Fri, 7 Jun 2024 16:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiPyNwuT+GhtjoEeArn2h3G7iOABFJJSYQSM4/BnoNTK2tQ8QfeK4CzTFA63pTy8JUWaoobEFrYMY59eBE4ytfPrX3H5GP
X-Google-Smtp-Source: AGHT+IEN+sC5kynLUiwfttoFoXFrxAOxTQV+R4mTjH8k4F5mnKsI86WqPRR2vIUNMmiEmOvqWkY4
X-Received: by 2002:a05:620a:9cb:b0:795:413d:d56a with SMTP id af79cd13be357-795413dd608mr465455185a.37.1717804369267;
        Fri, 07 Jun 2024 16:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717804369; cv=none;
        d=google.com; s=arc-20160816;
        b=c2PT2oP08CQUD+jfUrvq6zP226qFqkwvcRMQXgSbarBAunyWm6h1CYKGwvaLMCjZaK
         tFEZQZ/fpGUNGgPkUi1DSVTJ3X3OrghyhiKhb2fVnzWgoHCxtQaKbVRsonGnyOl0h/O3
         LAtCuCOWI3ymyhGoia0W05XbGGK2XaZRvrRkk4FYUfGBkDOGUn5IlTbufBMO2LK2yUUa
         Wdn1hrd8/TrYJAHO65uQpCPkoow6BHfIvUx4vh3dPLXOQCkTxw83+9ak8fUOyKfADdEq
         1Saapm/bJl3fxTzSeTnV2V9KLO0GNTkzCtJ+kRyN6hfV284zmD+Es3Bx/qOe+1caE8Qz
         uepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NZxtuEQbwcSWkjTtgaPcpq0g8+TJ5S9KsG5IajnwesQ=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=X34q1A7ZRgqKrNcyP1qG6SHb3aI1P7prHgQaZHwq8t6QPRo+mfSEqO7QVKlc9t5uwe
         GqRBocNIAYK42RSpa3vSorkPJvV1UdYqL3eFvvH4442LiqlbAzYGpGia/v7EU5QaFJ9c
         zxxBiBjnGscj6h7KbPRIQzDbzrr3u1tqjrQpO5CcSE7l29jy7fSc425o00Hwb3xn2phT
         Qqw3lend6PDUtgcCnGy6q5dUDX3XVf1xEtIDKGF1K89a0okyVBW3m9LPZquUuBo3p3ZG
         kHTPh10Zkgdr3Zpl3P5axE3Xx8AstUutuvH3uni6Xqw2apf1VNABbUxXxy1hAomVtRii
         qoVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QXtGheql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44038b80b38si49998431cf.729.2024.06.07.16.52.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 16:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QXtGheql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFal0-0006rV-Cl; Fri, 07 Jun 2024 10:39:54 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFaky-0006lw-1H
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFakw-0003Pe-JQ
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 10:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717771189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZxtuEQbwcSWkjTtgaPcpq0g8+TJ5S9KsG5IajnwesQ=;
 b=QXtGheql1OaZvDJzgBShVisZq/Cexff6NPAdZsYSJjLLPuPz7gPkwPKyLuoMapQJwN/9i8
 d8D0NM7ZBo9k0USwa65LAgmCq+l+BDkyXWzexzja7ES2YYK1SjwRqBYuIxBhMGxLiUL9i8
 9QTAczoI18WfL8ryezDMlHySmyAeTXY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-gT1PyPkvOFaDGANimmSrCw-1; Fri,
 07 Jun 2024 10:39:46 -0400
X-MC-Unique: gT1PyPkvOFaDGANimmSrCw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 62E9E19560BB; Fri,  7 Jun 2024 14:39:44 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8B99F1956048; Fri,  7 Jun 2024 14:39:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [RFC v2 5/7] virtio-iommu: Remove the implementation of
 iommu_set_iova_range
Date: Fri,  7 Jun 2024 16:37:25 +0200
Message-ID: <20240607143905.765133-6-eric.auger@redhat.com>
In-Reply-To: <20240607143905.765133-1-eric.auger@redhat.com>
References: <20240607143905.765133-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: k1EhTD6VItv5

Now that we use PCIIOMMUOps to convey information about usable IOVA
ranges we do not to implement the iommu_set_iova_ranges IOMMU MR
callback.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 67 ----------------------------------------
 1 file changed, 67 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 33e9682b83..643bbb060b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1360,72 +1360,6 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
-/**
- * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
- *
- * The function turns those into reserved ranges. Once some
- * reserved ranges have been set, new reserved regions cannot be
- * added outside of the original ones.
- *
- * @mr: IOMMU MR
- * @iova_ranges: list of usable IOVA ranges
- * @errp: error handle
- */
-static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
-                                        GList *iova_ranges,
-                                        Error **errp)
-{
-    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
-    GList *current_ranges = sdev->host_resv_ranges;
-    GList *l, *tmp, *new_ranges = NULL;
-    int ret = -EINVAL;
-
-    /* check that each new resv region is included in an existing one */
-    if (sdev->host_resv_ranges) {
-        range_inverse_array(iova_ranges,
-                            &new_ranges,
-                            0, UINT64_MAX);
-
-        for (tmp = new_ranges; tmp; tmp = tmp->next) {
-            Range *newr = (Range *)tmp->data;
-            bool included = false;
-
-            for (l = current_ranges; l; l = l->next) {
-                Range * r = (Range *)l->data;
-
-                if (range_contains_range(r, newr)) {
-                    included = true;
-                    break;
-                }
-            }
-            if (!included) {
-                goto error;
-            }
-        }
-        /* all new reserved ranges are included in existing ones */
-        ret = 0;
-        goto out;
-    }
-
-    if (sdev->probe_done) {
-        warn_report("%s: Notified about new host reserved regions after probe",
-                    mr->parent_obj.name);
-    }
-
-    range_inverse_array(iova_ranges,
-                        &sdev->host_resv_ranges,
-                        0, UINT64_MAX);
-    rebuild_resv_regions(sdev);
-
-    return 0;
-error:
-    error_setg(errp, "IOMMU mr=%s Conflicting host reserved ranges set!",
-               mr->parent_obj.name);
-out:
-    g_list_free_full(new_ranges, g_free);
-    return ret;
-}
-
 static void virtio_iommu_system_reset(void *opaque)
 {
     VirtIOIOMMU *s = opaque;
@@ -1751,7 +1685,6 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->replay = virtio_iommu_replay;
     imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
-    imrc->iommu_set_iova_ranges = virtio_iommu_set_iova_ranges;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.41.0

