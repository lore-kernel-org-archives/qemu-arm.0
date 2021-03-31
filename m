Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp212460lfg;
        Tue, 30 Mar 2021 23:48:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmCIravnk2peUSN3pf3Fiou6l3LTO4tpV8Nq7LABKYdweNkNkvrKDoxGA3xC11gSMAJztM
X-Received: by 2002:a05:6e02:b25:: with SMTP id e5mr1583562ilu.119.1617173296437;
        Tue, 30 Mar 2021 23:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617173296; cv=none;
        d=google.com; s=arc-20160816;
        b=mKjnEWN5R1LEtz9ba10+RGq2L0GVp8y/jFX0CrL8b/wQB7h2LH+BJ3TypAU1bVFTKT
         mHPzDJP337W79e0pXldzMctGI4RXYWYPHKtjBtM+DJdh1FYqMY6amVody0l8a4k0Zq2w
         0jYjOuhwenycNqnjxqP8nXULNejpAbvOej6X6aCaZ7XVn1OrweQ9nq4fcBeS1+ekdcN2
         Wr5Yayk+MQ01Fk+NPmGaQZdqr8/iADQqxtkQtsr7LGES6pIwR6zuxpkiRpAjmSzBkV8A
         qAu6k/c5KRcYhsIg0F4WgcqMcx7sdXmTFPDmwep4avFpRGyAAg7hOtI9ZcAKliI6dmi1
         zFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=HXf5wyJ5slHiBxyeB5IikBY0qHYLcpEPDLdji+/73jQ=;
        b=YX+N++Acc/EWlfTskhkG/eVC9iLkwqOBaynCH6YtYp7IOynLQ+r/e5O51N08N8q24v
         sTh9gFf1ypRElUg7ufaoh4AcC9CJbVxifGVtHsJY1/kSXoQoNgctgUwL+UhrEb99DSEK
         Jr4IHPccU5lA2HcqGMvzE+4F9o4chQrnDgEvMbHNUJMILal6b+01tn//bl6YK7Cr11zY
         CldQAe7OPoxitHTx8z4SmWH1YUidoyUa4qSKotjym2cY5fxNoMXjy+LUeaEWo939Lqcy
         eWRvXGgqobmObNRBOdIhsfXizzYkYZPvEsNPYLv2WRko4nV5hAMhRNSqq9GkxOAUZpC4
         wzfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28si1113838jaq.75.2021.03.30.23.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Mar 2021 23:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRUeF-0000b2-Ny
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 02:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRUe5-0000ag-J2; Wed, 31 Mar 2021 02:48:05 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRUe3-0005fT-AZ; Wed, 31 Mar 2021 02:48:05 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9H015lNhzlWh0;
 Wed, 31 Mar 2021 14:46:09 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 14:47:40 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH] hw/arm/smmuv3: Support 16K translation granule
Date: Wed, 31 Mar 2021 14:47:13 +0800
Message-ID: <20210331064713.1782-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=jiangkunkun@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, Peter Xu <peterx@redhat.com>,
 jasonwang@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zddB01xrI3Bl

The driver can query some bits in SMMUv3 IDR5 to learn which
translation granules are supported. Arm recommends that SMMUv3
implementations support at least 4K and 64K granules. But in
the vSMMUv3, there seems to be no reason not to support 16K
translation granule. In addition, if 16K is not supported,
vSVA will failed to be enabled in the future for 16K guest
kernel. So it'd better to support it.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/arm/smmuv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b87324ce2..0a483b0bab 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -259,8 +259,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
 
-   /* 4K and 64K granule support */
+    /* 4K, 16K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
+    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
 
@@ -503,7 +504,8 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
 
         tg = CD_TG(cd, i);
         tt->granule_sz = tg2granule(tg, i);
-        if ((tt->granule_sz != 12 && tt->granule_sz != 16) || CD_ENDI(cd)) {
+        if ((tt->granule_sz != 12 && tt->granule_sz != 14 &&
+             tt->granule_sz != 16) || CD_ENDI(cd)) {
             goto bad_cd;
         }
 
-- 
2.19.1

