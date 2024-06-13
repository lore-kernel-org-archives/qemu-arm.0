Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp191856ejb;
        Thu, 13 Jun 2024 02:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNbaVvzWLMzVsWd6hBbLxonxRmWAyijrYgs7TjG2i/bI/69GdILL7bxd0Ty2g8BeHZXbj2uVrV6cPAz36LlLOXPWHbKgFp
X-Google-Smtp-Source: AGHT+IFq2uCbsBlzFav5iD6q0bh9R4AqpcYaTr8GtPLUflNy4w/Uvl4Tmyolz5aa2s4wccigHXT7
X-Received: by 2002:a05:622a:1899:b0:43a:f936:3ce7 with SMTP id d75a77b69052e-4415ac5bc0cmr37459671cf.53.1718270732380;
        Thu, 13 Jun 2024 02:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718270732; cv=none;
        d=google.com; s=arc-20160816;
        b=woA5CGGm7BWROCbB/HDKcoxorPFWfBBnhC89wYbGPfqfsbQf4BWHOppobrH6fhwYRw
         ccdVS9ou1Z7/ICgFtuJhga3MBQY8lbkGilLwM6Gs/D4aRWEaez4Sms3GzXzUGD6wq6Dr
         PbDA1Z8jsRl6BZ5nddihOG8gtj84nwiEEV38Ec2ZBwHSCuWvZAKrc4iG84aCrXwRuOpD
         Z6YsxYT1ABeEXYlISe34XINi6bXsxVJrRTAOihjoJNz17zKe1lDV2f+IFNsxqG1GTIxX
         76u40K7VC/pXNVsl1qIvM8aBqP+O/W4YhSZpc2lZuRFn40z4He881aXutQp79o6y2LFs
         mWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VJxQB3J/KK3J2NcdJlm9ObpzgS8HDFxzvPOt034qunE=;
        fh=NBkbC8z0yxZVnBu5+T/osSPCS2NzeZu/yHpj5pv7NrY=;
        b=zUpo/8HfyX4hbibgud33CUxrf4B3Cn63vxcv1acp2IaSygQdAINF8QJX679tNqvWW8
         MuRz2UnQlzHQRll+4NDNd4mIWCJ/ESPYyznWbIZ5RWwYu7x/bFMgR75RAl5EeV8BuVPt
         AVdMothgsRg16Kf1cu+Unio/zIx5LOVTSWCF4NuVg508T0SOiA7MTdH79iE7RD1YQH7R
         9rN0lFZMp+x6uTLpRtOPYhoAdQNHHqQtx/et1eoArNAvMZ1LYPUqgnMPEJjq/fNKHMyE
         xgPLdyp6oTplmRKyTA/jdOMoVcNn69o8LTYsdri71P0ymofq818w9SxeBLyARyS9e6xm
         7pXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZbmX3Bfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2ea68e9si10837921cf.323.2024.06.13.02.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2024 02:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZbmX3Bfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHghN-0004Qg-DB; Thu, 13 Jun 2024 05:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHghL-0004Q2-An
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHghJ-0005af-UE
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718270685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJxQB3J/KK3J2NcdJlm9ObpzgS8HDFxzvPOt034qunE=;
 b=ZbmX3BfxK06r6kos0UpOQNljZpdGREyH+JNdF8RdMY+qkdXZHAlA1QTGrUxCV23qYk34lk
 T7Dsh58/zfr1y22pULvhW/QztNQhFbpN9qKiCKAS2sV5cbb4VrBH9KwH9djzgLkTk6TOUj
 WZJUq0IK2I+AuLIAefocXUqI6aOodsY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56-zl7OgMWoOx2kuj1uuHFNwA-1; Thu,
 13 Jun 2024 05:24:40 -0400
X-MC-Unique: zl7OgMWoOx2kuj1uuHFNwA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A2BB6195605E; Thu, 13 Jun 2024 09:24:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9BD1C1956050; Thu, 13 Jun 2024 09:24:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v3 6/7] hw/vfio: Remove memory_region_iommu_set_iova_ranges()
 call
Date: Thu, 13 Jun 2024 11:20:08 +0200
Message-ID: <20240613092359.847145-7-eric.auger@redhat.com>
In-Reply-To: <20240613092359.847145-1-eric.auger@redhat.com>
References: <20240613092359.847145-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
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
X-TUID: 0rLXInmPK95I

As we have just removed the only implementation of
iommu_set_iova_ranges IOMMU MR callback in the virtio-iommu,
let's remove the call to the memory wrapper. Usable IOVA ranges
are now conveyed through the PCIIOMMUOps in VFIO-PCI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/vfio/common.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f20a7b5bba..9e4c0cc95f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -630,16 +630,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
 
-        if (bcontainer->iova_ranges) {
-            ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
-                                                      bcontainer->iova_ranges,
-                                                      &err);
-            if (ret) {
-                g_free(giommu);
-                goto fail;
-            }
-        }
-
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
-- 
2.41.0

