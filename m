Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp745044njj;
        Fri, 2 May 2025 03:28:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0SwHvj4aD55gOZCRQ84+PdedBKUVZRfqaqJfkSby0B+RII6zpVAVyTte6FXol5cqyUWN+zxJCMB8c5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE9H2LUWbb7emKwlP39e+CHBcxTtG4GHjpDBzJWKVX83q4YuKb8gOCPPcwxbbRC68eUHzw2
X-Received: by 2002:a05:622a:4a18:b0:47a:e70c:e1ac with SMTP id d75a77b69052e-48c30f6e31dmr27432861cf.9.1746181723066;
        Fri, 02 May 2025 03:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746181723; cv=none;
        d=google.com; s=arc-20240605;
        b=amrFIoRQy08IVidjK7RhRXautQEBlNOJv3mBX/nFgOhn5N2+yMiaBP9BCkKTGvNWjQ
         RiRVOfvd9QXRBYebyNy8k0KZlBohY9nRMPAlJp+Wy92WwT/faQmhRUVO7VZXR0gTbtEg
         PiHc3avDB1nLRfi3qxS2fCkKFXYY3wktkYaBBqA0ZFZnNcjWzy5pUXTcU8qUOjzheVj9
         svrmbArgtATtt/R1bdl5ZXrca7gsRqaA8jeQilPsRk0q/5Qt3ht7HhPewx9WamAnQIv/
         EbYDXxujXLvdjwOw3+TVTq0rSIZNgcs3JHV9D9NsQAVQYN9kziNINdqw+QG0wNmz5iN4
         BEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=flBMGs08llsc44Zw4c0jCtwyUpmWFaPFd7uPEjfidz0=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=jSr8KSwKzcbCvKeE1PE6WoXQzMS558Dhthvo41Qwn+OMVc5XXb3lAQyi4UARZH1K2a
         KxBr9quPTuxNrzR3PQjO7oXMBn/U/giXrPegE8Bxq4uglzDP7SX3rK1Sb098jq0iTOZQ
         Jb+fMlh/9oC52DENscmMNnEiGk5xXf4HWNGEvh4rPzakCEGwprOxCiApfB4yKrM4O9di
         BwCntwpIDpdxEvL0UkOccXqcLsgCCU3+QSK2SyapcmVjS1OWHo0kaq1nCggiVJ5h0Y/j
         Nfj7Sfr7l+boqrs6NFchys6VPsICcfODt9LNTxboEI1DX6j47AoGBZdjT1PZGVcC4FFF
         0m+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98247ab6si27302021cf.327.2025.05.02.03.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAndH-0000TA-9c; Fri, 02 May 2025 06:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAnd0-0000FX-Tv; Fri, 02 May 2025 06:28:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncz-0002At-A9; Fri, 02 May 2025 06:28:22 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZpnBm1zHXz67mJg;
 Fri,  2 May 2025 18:26:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 7908F1403A8;
 Fri,  2 May 2025 18:28:19 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 12:28:11 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v2 6/6] hw/arm/smmuv3: Enable smmuv3 device creation
Date: Fri, 2 May 2025 11:27:07 +0100
Message-ID: <20250502102707.110516-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JQERFMs+CNrA

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 605de9b721..e13950b7c5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -2022,6 +2022,7 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
     device_class_set_props(dc, smmuv3_properties);
     dc->hotpluggable = false;
     dc->bus_type = TYPE_PCIE_BUS;
+    dc->user_creatable = true;
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
-- 
2.34.1

