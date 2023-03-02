Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7961909ejc;
        Thu, 2 Mar 2023 00:35:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+V04n1FP7rsifCUpzjWd0/f6zr/dlQmhqoqYDu82ti8LJS9SQseAzoE0oQxKbCao6RYG8n
X-Received: by 2002:a05:622a:1828:b0:3b8:6d70:9fe2 with SMTP id t40-20020a05622a182800b003b86d709fe2mr15849737qtc.59.1677746128498;
        Thu, 02 Mar 2023 00:35:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677746128; cv=none;
        d=google.com; s=arc-20160816;
        b=KrKnxU33GMKnjRV75qQKxrm1hChP1eqjbZSPOmzG425B8tQ7PNlqYlhgNf4f7kSxOB
         yUqbIWsfEer4TMeC6IMlmtu+m7M7iDf06tigHX8Lw4uHdBg5A6Fvrm5SCjv5BgtZTvsW
         bYegBCp/ET3W138Ke8AqM2AwnQM1YR59PVyTzWKJx6K12fMz9BfH/RVD9yP5mC2RF5op
         RS9XmpfqNIICxfoPIT7OSVRLcAhVHaX4ZPByE9b+A5I4ZY+qseWJkSbmriQHfiot5gwQ
         iNDHok+NI9m7+w5Hb98nTmTxNO0tXlUyeS4oxM2d75WqnVW2Cn7U/SCIXVVQhUo+loHb
         SjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=mK9tqXrZVANih9PF7PI/TwHTz75DueFW9hq/Lbg2GQE=;
        b=pd4uxJT+FNNH1h27/WvGTfnA+Gyy8RzgHH6oysqE2CgySA4Ha8DPYFZbCh1wdSAMSJ
         YRA1G1rKNuHU65QMrZ9caD1JlPhNbfOKX+BGO6YsURTu8JOdk7nvVZR64NQ2kw5TQTk5
         wUrzKoHiHQAb6ylZ7PqCFi0FOdDMvcmhvi8yA1GiHGJ8/p/1tbbgobY5UH+FLMe4zMkG
         9wErdnV1FRpQ1JOyhizcSuJpHutQKhNAOMOVe3G46RkwPG2pyzFdcqbBBL3LiZsaU1qJ
         if3b9+//64IOzDMvhpMHKtmpr36YszqSxwTS+J4fxoLjqFvFRthmM10iTBh4zMQIQ5y6
         c3bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HE4Yi9DF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a05620a294600b0073baa13dd96si13622853qkp.302.2023.03.02.00.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 00:35:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HE4Yi9DF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXeHM-0005ks-Or; Thu, 02 Mar 2023 03:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeH9-0005g5-VO
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 03:26:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGu-0002aU-BJ
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 03:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mK9tqXrZVANih9PF7PI/TwHTz75DueFW9hq/Lbg2GQE=;
 b=HE4Yi9DF+79IPcd7pRtlDxBExjleIyJabkoWjLWU0DDriljOIRVod6r6399xz7xLQ2b+vZ
 /s6L6mpbYUVwdZIOUP7JPppXK+SmFzZd4WjEzMxh1DJjSo5nRxXSQ9ZCACxn2Kir9WjKJm
 d0Lz7T/86n4Hj4wlMNhSVaT2fSboZuE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-LoHeNPhMNNaXXThneQ285w-1; Thu, 02 Mar 2023 03:26:37 -0500
X-MC-Unique: LoHeNPhMNNaXXThneQ285w-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso5464023wmb.6
 for <qemu-arm@nongnu.org>; Thu, 02 Mar 2023 00:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745596;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mK9tqXrZVANih9PF7PI/TwHTz75DueFW9hq/Lbg2GQE=;
 b=6OsCAghZE4AaqHNxDqBJ76/+sXFM3BsWDUqGVbgpjiJ/BQHgJZQx1sQHmxWlMShhOy
 8UyzjTYqobNi+NR4GIrHn90VjZ1SQZmBMSyahnPjOYS8x1Iu9fQ7YwZuZ++jMqRDF8qF
 TCUhoDIB+51u5hUaVTF+7TfipSs8Ez629FdEr+HFuhI+xuYi/X54dlU/xRdaUettodyA
 +1hMzF1zFp1u2Xza/dx0XNeC62Cy3QAw6TU08ZFglqqEcz7gcF43qehObBLak1TC5vR3
 jQR38DWjYcViiLEnXiuBXxzhTR2yEgVhfNAwNK8LMFS0ZIrtkxy2LvgTB/IHVLuNbZ+A
 Sh9w==
X-Gm-Message-State: AO0yUKVRGr2tVwN0nRMoq+qo72itlVD2COaK/qsyyPH1MConUsWunySZ
 LcxAjWgByeHHEjsZEX1vWTZoMNjMRebx0Gu7/upaDbhxkZ0ZXPEijJCSx6uw9tcvbIZSt/lyMw7
 4t/aCt1ACdqru
X-Received: by 2002:a05:6000:88:b0:2c7:6a6c:c72a with SMTP id
 m8-20020a056000008800b002c76a6cc72amr6324000wrx.48.1677745596395; 
 Thu, 02 Mar 2023 00:26:36 -0800 (PST)
X-Received: by 2002:a05:6000:88:b0:2c7:6a6c:c72a with SMTP id
 m8-20020a056000008800b002c76a6cc72amr6323995wrx.48.1677745596224; 
 Thu, 02 Mar 2023 00:26:36 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c2f0f00b003eae73f0fc1sm2157736wmn.18.2023.03.02.00.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:35 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 40/53] smmu: switch to use
 memory_region_unmap_iommu_notifier_range()
Message-ID: <20230302082343.560446-41-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iyGLSAPIVvRH

From: Jason Wang <jasowang@redhat.com>

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230223065924.42503-5-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/smmu-common.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0a5a60ca1e..e7f1c1f219 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -467,20 +467,6 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
     return NULL;
 }
 
-/* Unmap the whole notifier's range */
-static void smmu_unmap_notifier_range(IOMMUNotifier *n)
-{
-    IOMMUTLBEvent event;
-
-    event.type = IOMMU_NOTIFIER_UNMAP;
-    event.entry.target_as = &address_space_memory;
-    event.entry.iova = n->start;
-    event.entry.perm = IOMMU_NONE;
-    event.entry.addr_mask = n->end - n->start;
-
-    memory_region_notify_iommu_one(n, &event);
-}
-
 /* Unmap all notifiers attached to @mr */
 static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 {
@@ -488,7 +474,7 @@ static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 
     trace_smmu_inv_notifiers_mr(mr->parent_obj.name);
     IOMMU_NOTIFIER_FOREACH(n, mr) {
-        smmu_unmap_notifier_range(n);
+        memory_region_unmap_iommu_notifier_range(n);
     }
 }
 
-- 
MST

