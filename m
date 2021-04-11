Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3059385lfr;
        Sun, 11 Apr 2021 05:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVRLCrmdl+Up+8g8t7U83QOTaFFuv6HOj9zZ0ZNfdXRP83+g3kGyWZ3/oLccv+p6py2kvG
X-Received: by 2002:a5d:9659:: with SMTP id d25mr19422707ios.146.1618143707106;
        Sun, 11 Apr 2021 05:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618143707; cv=none;
        d=google.com; s=arc-20160816;
        b=DdizBrhor42eiCXBoDPR61ntchEL0YivS8APZVC83WInmz3Giz9+e9R2gcdAwNJvlj
         QSX0HgkGvQzXO9GV6/AUEzDuZXBErxqZmbRB875oDSPgFpE4SYGrlrSIspqIz3rm+fRX
         o4BUkWskm765QCU8yDVqz7kZWDYnAxXAoqhxPycErWySco8R4pJ2L+sVI+6ZuTVaMrLC
         3B3XtKRTMzWL3Crd8nEnC2Gb6LtUntaV3gyCShFQ2z/dusUzpxzDQ7WsUZjjcugqOocL
         TSDVX46wYdBPZg08hLA0ZssbqmEZ031nePPLpMI7nzPgfu/gOcHWj6pDZWt/+9NQaAEL
         5x6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N2Nn/8mZV6/42NfAO06vb++YOJeBPuhixqOGmTZa19A=;
        b=XWNeJv71VZOjSuMmvYFp8qP4iPzkiUSH4oxVYqkqUvaM0A2/SrXo2DI26NIjb5XdmU
         r9fxrHOPYpSteU+wKLQ0PEEFWgw4sfxR15wQmWqlwKUkWxmRuVunPv+1k7FJq4OmC6vy
         A/0Kw/Fn4FVxPA6E9sFkyeUM5Xa6ta/Lf72L6lROCEXZFMln8hmUd40vHO7VaedV5ZyI
         1m5MdKa3h21FrGsfNu0btnfQQ34rMTiGY2Kvfk6Ow1whhlm0j4C5lc0TuGbuoVhosU/K
         JxJDiPevZCQ9Zp1q6Wlq0eoxjj8/81DjlE6ltWAEp8akTYQKwQvgM36MCz3c9IcMXV9o
         /xzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="f7/xBOpD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si8498937ile.56.2021.04.11.05.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="f7/xBOpD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZ62-0000f2-CJ
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYvq-0000Wp-57
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYva-0002lR-NQ
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2Nn/8mZV6/42NfAO06vb++YOJeBPuhixqOGmTZa19A=;
 b=f7/xBOpDhAusE42ye9M2X0gL6L4aXigg/n4hPW7R6M3z3yFw+INHTpbZ4rEkR+LNa2DcXK
 pECRGHZ0yeTPG9JlnHTMGZcgAW7vVlluzbE+Z4lD0Q70Xe7QBZVO7aXGjru7YPxCM9G0hX
 o3xO/CWdlCwMTgdIqCUzHMlBO7EtR/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95--LDkPYHjOMmBAyGZIb8q7w-1; Sun, 11 Apr 2021 08:10:50 -0400
X-MC-Unique: -LDkPYHjOMmBAyGZIb8q7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D56985B364;
 Sun, 11 Apr 2021 12:10:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB63310023B2;
 Sun, 11 Apr 2021 12:10:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 07/29] memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region
 attribute
Date: Sun, 11 Apr 2021 14:08:50 +0200
Message-Id: <20210411120912.15770-8-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/TMNFdnZI7X

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
index 94b9157249..3af3cc1adb 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -273,7 +273,8 @@ typedef struct MemoryRegionClass {
 
 
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_VFIO_NESTED,
 };
 
 /*
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a4436868ba..7166008ab0 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1582,6 +1582,17 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
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
@@ -1589,6 +1600,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
+    imrc->get_attr = smmuv3_get_attr;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.26.3

