Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4130707lfb;
        Mon, 23 Nov 2020 18:38:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqYTnXtvpx3wac6BOQl3oc6EYuptBgmgbnumVnNfDVhD+e/U7js3HZZ7seKlGYAEAWux7C
X-Received: by 2002:a25:9705:: with SMTP id d5mr3444481ybo.290.1606185530283;
        Mon, 23 Nov 2020 18:38:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606185530; cv=none;
        d=google.com; s=arc-20160816;
        b=jz9G/56javJdaanLodGQYVXpmD7jv+Ol3J3T/oMzCOiEMby/uyrJT9aWtF/XH73rIO
         uMa1JuEgr6yx0pVJCPCn+Nw3P/Zlyq+GwceKw3ET5pJxEoMUoSTFxcCyUGETsmkyMk2f
         7/5Deqswl95nEK/y1ONiQjyPs1J0U3zUKAvS+a3hcekoX616R+m+e7FonIbT2U7B0+HL
         R8q3fpPuv4Ewgtll/SIXeqIUBpZk4qTNe7YI48XT48XOTRa8N7pUgPhUIYhRn3SiJcU/
         JXBXwoLn5apTecM20dcIdjACzoc7abs6AyDtL8b4xONKJ5rMaySGS83r27W3rq18kytJ
         +eJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=CQgIRv4Jk09uTDjRLtjA0/a/WCW0uXnL86jUXFzWt/c=;
        b=XETCCY/+aOkBf2EZv7NJ+JfJB47zFlKhdSYPBNy4Pz09Swd+gnPD9IehERLd3jTRAy
         c8P7vyoO4wcUCwbkErTWcKGsA0yAgTbQTCOnFSBVrQGRzMNnaHZJAk2sm6mIp7ro825o
         OpqgOJp6rXhijZzZHxViTeSW5ZGDqaEMitBZywzwtwxSYfuXvvC2kCDY6h7wcLa/ZxF5
         AlTa1Axr1ZNYAqHYIBNUhDJ3BmqHQHBNnwqTiC3KCcX1ns8NeqOLtRQfCFZ8ypgjecP2
         jVXD0lcSZuMFVe/YuC2EaMOkfbYvbcXSScyyXf+u489kLOBQSqEoMir33C+j9kWoOR92
         DyrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g38si13991428ybi.291.2020.11.23.18.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 18:38:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khOED-0006lQ-M2
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 21:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1khODO-0006kb-Ny; Mon, 23 Nov 2020 21:37:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1khODL-0001Rm-DO; Mon, 23 Nov 2020 21:37:58 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cg7TX0s1fzhgSx;
 Tue, 24 Nov 2020 10:37:20 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.137) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Nov 2020 10:37:28 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH] hw/arm/smmuv3: Fix up L1STD_SPAN decoding
Date: Tue, 24 Nov 2020 10:37:11 +0800
Message-ID: <20201124023711.1184-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.137]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wanghaibin.wang@huawei.com, Kunkun
 Jiang <jiangkunkun@huawei.com>, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0UwlpTfYoE0g

Accroding to the SMMUv3 spec, the SPAN field of Level1 Stream Table
Descriptor is 5 bits([4:0]).

Fixes: 9bde7f0674f(hw/arm/smmuv3: Implement translate callback)
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index fa3c088972..b6f7e53b7c 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -633,6 +633,6 @@ static inline uint64_t l1std_l2ptr(STEDesc *desc)
     return hi << 32 | lo;
 }
 
-#define L1STD_SPAN(stm) (extract32((stm)->word[0], 0, 4))
+#define L1STD_SPAN(stm) (extract32((stm)->word[0], 0, 5))
 
 #endif
-- 
2.23.0

