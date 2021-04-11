Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3064435lfr;
        Sun, 11 Apr 2021 05:31:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvLiOhNePywWp3wASmT6tQx59iZ9aa/W3YDTBoXuiXDL0P+Kmf5aHVTQk0QN9YZWMqG4YU
X-Received: by 2002:a05:6214:da5:: with SMTP id h5mr21990195qvh.29.1618144292056;
        Sun, 11 Apr 2021 05:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144292; cv=none;
        d=google.com; s=arc-20160816;
        b=CYK8Sw8kV4q/xRkqD13cNhwYtYk0IP/qIdOSRXzybUSHAQtOivIChcE9izH6xDV5LF
         3Okp2MwqKTttOxyLce4Qu9IS8BFWhYU0bYuPUr7iXKfO96uLBL5372EHKRWc1jAK+dzN
         9ylnnTohzJ9aySMCCa9vKnugFl5qHszaF2F+MK11Ed6Oh5/FC4BXLXTtIrV+aO0J3PNF
         Mnl+V6iCQyu67lprEKJoUQupPnq+K0Qp1KmTh24gHzP8CinAO1QfFdUn8eLuBboMUvQV
         bNFezMhMtwQTXKOqe65U71T0/TdkJKHXfk68XjWAd+ZWvdoXt4qPus+1MNDgC9B3QW1T
         QrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tB6fLc6z+iK7Df2g7CAelnyi0V1AD6fd2LgrMqhih1c=;
        b=We0mS+jH49NYWF7BJqx3bYecKruMAd3Ne5IRFNycWhgZY8MpSadoo7quZvDXOFqryD
         g/uP6JieqaoAebUtrQVa7/uKjIeQ4IhiT5mg5AZBdrjO58hMzRdljIibh4s0gxw1PBEC
         s8CC0Lv7110saBvTTA14GZyloJknEwuC0mRbcyLDx48foWCjl9tEG15BiU8tKOrDk8o9
         EYlJQha6A8fbkcXXEeRf9Iu/FUtQo9UqKHBcdf6RyGQ1+KMysGiC602c+igsVhB/mFK6
         6RZPU3lO3zrWtxCJ5ZA5NrvqPtoKNu1jGDYLLCzRdSNnebHRoBca4wNrq0lrf47a0534
         oI6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AusMjEZ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si6440969qtp.83.2021.04.11.05.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AusMjEZ4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZFT-00010K-38
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYyJ-0002zR-HQ
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYyH-0003wS-69
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tB6fLc6z+iK7Df2g7CAelnyi0V1AD6fd2LgrMqhih1c=;
 b=AusMjEZ4PyayYvPkSScGloHeqsr2as1bcBJd0n+AsVBib8jZjjK9TlSA2SR1Pnvq/7kSR1
 AWaL1HAs99+UWzaAjVKYjyESEJH49/rImI/1fOWKkem+xIB6JKjB9PcxxLmg5yzSLNvufz
 zfXiG/qDy2VBDsKBYAMxwAuERxtvx2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-bmomnDvmMTSxMP6TqHF_hw-1; Sun, 11 Apr 2021 08:13:41 -0400
X-MC-Unique: bmomnDvmMTSxMP6TqHF_hw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0B2D10053E8;
 Sun, 11 Apr 2021 12:13:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8CE10023B2;
 Sun, 11 Apr 2021 12:13:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 22/29] hw/arm/smmuv3: Store the PASID table GPA in the
 translation config
Date: Sun, 11 Apr 2021 14:09:05 +0200
Message-Id: <20210411120912.15770-23-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: G+ur8B7vd+0G

For VFIO integration we will need to pass the Context Descriptor (CD)
table GPA to the host. The CD table is also referred to as the PASID
table. Its GPA corresponds to the s1ctrptr field of the Stream Table
Entry. So let's decode and store it in the configuration structure.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/arm/smmu-common.h | 1 +
 hw/arm/smmuv3.c              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d0..d578339935 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -76,6 +76,7 @@ typedef struct SMMUTransCfg {
     uint8_t tbi;               /* Top Byte Ignore */
     uint16_t asid;
     SMMUTransTableInfo tt[2];
+    dma_addr_t s1ctxptr;
     uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
     uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
 } SMMUTransCfg;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 1ee81a25e9..a7608af5dd 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -358,6 +358,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       "SMMUv3 S1 stalling fault model not allowed yet\n");
         goto bad_ste;
     }
+    cfg->s1ctxptr = STE_CTXPTR(ste);
     return 0;
 
 bad_ste:
-- 
2.26.3

