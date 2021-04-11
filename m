Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3066483lfr;
        Sun, 11 Apr 2021 05:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoeiagRs/xqyFOVcV4r/4HnfSccZpGDf0VQZpuQtjDTJ+ni65hC4WlcPopcxy2nFpxVr3d
X-Received: by 2002:a05:6638:1124:: with SMTP id f4mr8832140jar.27.1618144503653;
        Sun, 11 Apr 2021 05:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144503; cv=none;
        d=google.com; s=arc-20160816;
        b=fYkYN3qb5qPxCLVNS1A+m18p4a+bXQg+qXJFkIX66vJh5+VCBzJNq7z7K5Swc5JSnK
         JVDgSc+9EzildPDCOnhdmXlFkIx5n55z/oBynxXXR9G4us5dfWOzfcSBWfyy2AvbghXi
         kC5d5feUdUJoFY7f4xFSV7KeaDQeFw6FrTOBZsJ3qbA0A9AXjmBmkTT6a3zHi4E3Wj55
         96ZS9Ws9jK4L60c9HGv2wjOzU51X2Hsc+nh4hVJrkI4vSjX7IHo2vT7FaSoVVw/RtEJM
         dPKrGmUuZy9itI5DkyBVz3r8JChhMgcS+IxAlA3m4EwlzAXjIdFQkXU6lU8GUXSQoTvG
         xPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YWV+8IBPlf7a0zvHPB4uR4YpkNMx18Nql4nxq/5UYak=;
        b=QWAniuVu3INkiuO8cpN8SDIGLVFKQ6FrllEEDlGN3ujG3lIZUBd32wydhzEUAazaxI
         t1GTqzdtEIaKYY6ZHhs+XuGX42mNQ2nGLWOcyCjXNVxdWyYXB09j10KVmqSd6259+HZ8
         bUB3M3eVPBwaKyeaiq+OSOj5SvO34sa9G24e9z+hjIEIb7sZf+1ryarEEkILIm8bIFCK
         I1LfTaWUREP31Yw0wblb4liTrqqX0H5LhN2Va89At3aYdZ1HjIzp2zac99L4XB1Nfr8C
         JguuLMHoOJNw1X6slXehsPIdraopl1xw7lV8M7Ou91FjTHk3P6m+HfykjwQeqniSmxV7
         TfwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J6w/5SwA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si9877424jak.102.2021.04.11.05.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J6w/5SwA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZIs-0004y2-Tt
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYyX-000377-Lc
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYyU-00041y-N5
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWV+8IBPlf7a0zvHPB4uR4YpkNMx18Nql4nxq/5UYak=;
 b=J6w/5SwAAwhrTWlRTsN8J2V61VtVlItC0V6zqOVOVkB5vAgVspbdBYQtFnE+RVh+fnEuYS
 yPVH0sVI5jIM9CTF0LmFd7NYWWHjR7LRNXxG4+mljmNuQxKX9F9WZj0oRr6FF/H0BPD004
 CzLAetmOydtmfB5tC7Emsgy1hRS8j6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-CR6hzGSZMF-wqaGxXce3zA-1; Sun, 11 Apr 2021 08:13:53 -0400
X-MC-Unique: CR6hzGSZMF-wqaGxXce3zA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B800318397A0;
 Sun, 11 Apr 2021 12:13:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75A7410023B2;
 Sun, 11 Apr 2021 12:13:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 23/29] hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA
 invalidation
Date: Sun, 11 Apr 2021 14:09:06 +0200
Message-Id: <20210411120912.15770-24-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xss/SLkCuq9G

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose and accordingly set the flags to
indicate its presence.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- set flags
---
 hw/arm/smmuv3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a7608af5dd..7beb55cd89 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -832,6 +832,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     event.entry.iova = iova;
     event.entry.addr_mask = num_pages * (1 << granule) - 1;
     event.entry.perm = IOMMU_NONE;
+    event.entry.flags = IOMMU_INV_FLAGS_ARCHID;
+    event.entry.arch_id = asid;
 
     memory_region_notify_iommu_one(n, &event);
 }
-- 
2.26.3

