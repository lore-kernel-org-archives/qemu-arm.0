Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2496428njc;
        Tue, 15 Apr 2025 01:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnweEXVZQNVl6v3WMNz8CXmHfXMNVGkCQZUDJ3V1xS/d5Cf5oVxfy5HUe8uDXlO0Lbl1qvmltFTclBqw==@linaro.org
X-Google-Smtp-Source: AGHT+IF66H5vXePvYqEg/5R6Nmr6fxqlzlo91lFsSgvWO3SF4MMZBXazBWMAkeWFdP9FyXIhD/+P
X-Received: by 2002:ad4:4eeb:0:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6f2a1726fa2mr36855826d6.5.1744704875879;
        Tue, 15 Apr 2025 01:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744704875; cv=none;
        d=google.com; s=arc-20240605;
        b=gEkv+LVMC0WJmTe53mjkvnQN2Oye7Od7zdTzSp3/zM4FfGVuL+XEwWP9in4TJ3fqcU
         sxG2va4sf6mhgxlZpK6hUYAWgzf5maEfqaWJv0urnWf2UWYS3zjpwR02P7bsLRA5ZPlw
         9QaztoZGs/MN11p06xKD3CM1vFbBfgTHwSB4aQkxkUCYzSsuCVuk8C7VO2zteQ5SH2jW
         SBPs05AtjPtAYICthImB6MMng4MuuFYeTXoNaH6Q5zaH8LSDIK7nMOpaaPN9cikaCOzC
         G9QM27eyQ38mUDGdk1/L8V7prqaoe/YXUy0d5Ul8UBfTt21P5fM/OPvDfRGbpqFbVXGU
         +7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=DAxUZpT0qL99typQXrUkt+VSfEo0uuAtbPTA4ccGm7g=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=Bg0TijF40zbo154hZ63Ism2/vQnn+QxMcfSLWio4V7hMW5uDrOwJDioY1LEfOUasxt
         bIExTiujFusC5tZneNgYo6HSk+gaDI6ciuME9dBMusLm9X5opPUh3Iy/00wsPr8BnUSK
         Pf6vI13aIKAGHRo6VRJJjj55DW+mn0sBo7dbFta8jZSevNVOgh6JB3Q+TEgOqtg2WHJL
         jeb0dGr+Rx8Ms6fgkcxJWMUbvTkgxXqFspieyvIa83Ge70DTT4IHL2nMCykSWFupdzDV
         mfuyqrvW6QJsIY6nGXl1N+RqJEh63UD7L7Qp5p76+wxQr9UPyHfcYL++3d6thH/yKTnB
         a+lA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de970c68si126005166d6.125.2025.04.15.01.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 01:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4bPO-0004fs-CQ; Tue, 15 Apr 2025 04:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4bPM-0004aZ-37; Tue, 15 Apr 2025 04:12:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4bPK-0001rv-Fv; Tue, 15 Apr 2025 04:12:39 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZcGxz4H5Rz6LD5G;
 Tue, 15 Apr 2025 16:08:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id CC8F91402FF;
 Tue, 15 Apr 2025 16:12:36 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Apr 2025 10:12:29 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH 5/5] hw/arm/smmuv3: Enable smmuv3 device creation
Date: Tue, 15 Apr 2025 09:11:04 +0100
Message-ID: <20250415081104.71708-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
References: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
X-TUID: P20/bqHPg9Yu

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e3b8e13ca3..572119e472 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -2026,6 +2026,7 @@ static void smmuv3_dev_class_init(ObjectClass *klass, void *data)
                                     &c->parent_realize);
     dc->hotpluggable = false;
     dc->bus_type = TYPE_PCIE_BUS;
+    dc->user_creatable = true;
 }
 
 static void smmuv3_class_init(ObjectClass *klass, void *data)
-- 
2.34.1

