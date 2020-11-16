Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3938482lfb;
        Mon, 16 Nov 2020 10:28:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyI+xKZPHtSHHAvfqNhwBa9g2EqGsPnVLGVTVf+PPeuul5c13QjFQZ9h9vHSUoAbTByEEoT
X-Received: by 2002:a25:3b87:: with SMTP id i129mr21812627yba.237.1605551293720;
        Mon, 16 Nov 2020 10:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605551293; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHo/Y2NLneQGtSvWrsm1hIFWWiAOSrcWwAkT4+x4cgbOMzueFy+KpmK0WdTCWP5SNX
         nVSSBTU64FPKqS0uooj6pQQ5DrBhTLtjPa+9vagT7jabsSGRZ8LO7r+GXjX+c3COXRp/
         00iIj+c5XcYPsEZM0IHKbFgnvSGNlHotgwgq4vX7JuvOWLWL+5xwEVmTvS4tn57DGumo
         DzcjsBmvlue/OEFzycgD2DPkFCRY5c3/9SgW+VG5lB14BKRnyge0YGkft0yq8+yxPKfQ
         EDo1xxulbdqSU3hDfgswZxk55x9pLHbnZc940/lEAnDd6NdQx7cT8RnnnF2ISedJGu+Q
         r2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y+sFOZWFNTvY5V5a4hIDUBDh8excWMeMZhzDWrZpTVY=;
        b=WvW3yC35kjuUIoRMtjFDsEHeQCvr4E6QAfp2mOdWrhCjlvm0uOuVbB1ETkBNlq1PSV
         GuP8aVolQWVSrNVELH0wZWaKlF4b+KmMN5h0n/2wlDUYCoOJlzoAs0F+bRVmQVrvCV3Q
         NFfQZP2s+Ng+ZjMrkuE8/HA+nYzcZxYH8Xb+LxPHWoDJC0QUhHJtyWygB+tYNDBu8/U8
         RRUt5up/w5ReyXQaVr5goIDpzDcVnWgDreFyTS4S2mKM1vCL95BPQFKIbxVd49MXSBuw
         3qYAUFTRM45U3gVTxXuubK0Yb47qLcTGi9egGt8OrYefmYEpGkZtIN08l9vVgSG3KerV
         Lovw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YkI4mRuZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si19926415ybq.162.2020.11.16.10.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YkI4mRuZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kejEa-0007hT-QW
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3x-0001tE-Sp
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3w-0001cT-6y
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+sFOZWFNTvY5V5a4hIDUBDh8excWMeMZhzDWrZpTVY=;
 b=YkI4mRuZgl+XCSm2ESUqptH7hmMS0RXm6pSYeOmpC+7TV0GYkGZ6ez0M/VgW4qBM1ehOg5
 lUgrPqy6N5Ypjhh5912NamvhuZrSgsG4raZ7nuxM2d4SfaPoqmh5l7WQBbsCfkn78YbRn1
 RjJ/sBDCBQmM7EP8a8HzDaGezBSREs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-eg5Fp-s0M5qUSGiUl5YTqw-1; Mon, 16 Nov 2020 13:17:07 -0500
X-MC-Unique: eg5Fp-s0M5qUSGiUl5YTqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5083C425D6;
 Mon, 16 Nov 2020 18:17:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9C7D5C1CF;
 Mon, 16 Nov 2020 18:16:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 18/26] hw/arm/smmuv3: Advertise MSI_TRANSLATE attribute
Date: Mon, 16 Nov 2020 19:13:41 +0100
Message-Id: <20201116181349.11908-19-eric.auger@redhat.com>
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
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sks605VzZfIf

The SMMUv3 has the peculiarity to translate MSI
transactionss. let's advertise the corresponding
attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/smmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4b33e14153..ace022371f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1519,6 +1519,9 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
     if (attr == IOMMU_ATTR_VFIO_NESTED) {
         *(bool *) data = true;
         return 0;
+    } else if (attr == IOMMU_ATTR_MSI_TRANSLATE) {
+        *(bool *) data = true;
+        return 0;
     }
     return -EINVAL;
 }
-- 
2.21.3

