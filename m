Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3929032lfb;
        Mon, 16 Nov 2020 10:16:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjwhxj7/hmnkUUOcNOGgKFMESw2S3nrWDAG6Uq3sTlOLi5JP1Ny3kZQZsWif6jGYQLp0S6
X-Received: by 2002:a25:642:: with SMTP id 63mr28060365ybg.246.1605550579675;
        Mon, 16 Nov 2020 10:16:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605550579; cv=none;
        d=google.com; s=arc-20160816;
        b=u0+nRd24JpoADERcutbjnCm+rM3SkFX9HyjjI2LTALBqkrQVYSwNXcgk7MR1X/SKer
         TFVQUUO4Z69i6Bne5eeOYB/fWr9MI8kbqkkp97oxYet4FNsno6KO372sCop5P9dwkwZo
         49N5fBH5sEbJgrnoMra95lJbNmmpyClHjcBQpMC4bibNl91AyPCYapiv7zPDhefjQlXK
         36D6OVwhqj6gTzOc6+7l7UldiK0HluSjFWrWm7ERUj0nCbZqp/1FhJJeSKlXFAbbX18x
         IUjH3s30/1A1jdlgQcKfOoZf4p6pAFtZ40v7xF/sPoaXAx4NUEKS+47i0zh0Bv4gdspZ
         7Piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q4kRGxhzy3FEeBlyFlU74lUda6OeqW/C2Z+4NcRbH/8=;
        b=Gk0Z6ToL4BwdoKNY2Vq+kPgv4Mn3olTUwUhUkiOmOkUurHz1lTl560g3/BDyI/dNgi
         4RXFBja3eMPGh62zl0buk++Cs6wyQFSx6ccAYBtGtOz89sMt2N1tHRWW6ISyNyrVbLEx
         5PJCtftMtJxZg7id5Kf5uLy3Pu//XL7ipBtunn2jurZjE/Dzdq0WEKSOoHAaA7MhJK1t
         PIHU8xJELKQQgjfirboGb2QLBLNnj1Z7u4D9yfTwmM4kjWFzLmaoXWhDvM+uJgJPqPVl
         mLsgXRMpaJMGK3U87CjmWEZZJA+w7arDxDXmGAC3JRvyK8TnTn/QV5G+K1RDfoZq2H6H
         MIMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YTbST/cX";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si15636607ybk.258.2020.11.16.10.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:16:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YTbST/cX";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kej35-00088R-0O
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej1S-0007hV-V6
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:14:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej1Q-0000eG-9v
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4kRGxhzy3FEeBlyFlU74lUda6OeqW/C2Z+4NcRbH/8=;
 b=YTbST/cXZni1MPCHoQ5z74g5HDIYBhtJ9BxrZtngc6xlhR32FsMlM5GTQPW4Vourb05kJa
 OHsR5mIkrN8OMigVa3OiQhTiIDiSlVdqkWowJuO4aujYoXx7PBKuhXKcMGzh74iuze+e8n
 Ktk7uJ/Ou2Nkmro3QnqL+f22xWoqgW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-RRJppFrlPaC_3PunwDVdfw-1; Mon, 16 Nov 2020 13:14:34 -0500
X-MC-Unique: RRJppFrlPaC_3PunwDVdfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13565873113;
 Mon, 16 Nov 2020 18:14:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F3AD5C1CF;
 Mon, 16 Nov 2020 18:14:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 03/26] memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region
 attribute
Date: Mon, 16 Nov 2020 19:13:26 +0100
Message-Id: <20201116181349.11908-4-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UoCXnkWYZH7m

We introduce a new IOMMU Memory Region attribute,
IOMMU_ATTR_VFIO_NESTED that tells whether the virtual IOMMU
requires HW nested paging for VFIO integration.

Current Intel virtual IOMMU device supports "Caching
Mode" and does not require 2 stages at physical level to be
integrated with VFIO. However SMMUv3 does not implement such
"caching mode" and requires to use HW nested paging.

As such SMMUv3 is the first IOMMU device to advertise this
attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h |  3 ++-
 hw/arm/smmuv3.c       | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0f3e6bcd5e..d9261337c1 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -223,7 +223,8 @@ typedef struct MemoryRegionClass {
 
 
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_VFIO_NESTED,
 };
 
 /*
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 22607c3784..4b33e14153 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1512,6 +1512,17 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     return 0;
 }
 
+static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
+                           enum IOMMUMemoryRegionAttr attr,
+                           void *data)
+{
+    if (attr == IOMMU_ATTR_VFIO_NESTED) {
+        *(bool *) data = true;
+        return 0;
+    }
+    return -EINVAL;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1519,6 +1530,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
+    imrc->get_attr = smmuv3_get_attr;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.21.3

