Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1884797njc;
        Tue, 11 Mar 2025 07:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/oKsy2hYT/hLjOJxXN+SSe8bUNP5eWpUvg5DJkvQHokEH+L7nL4ifRVzck//d0EM6QqegEvNHRW1Plg==@linaro.org
X-Google-Smtp-Source: AGHT+IGTyo4pbLyuaKu2qgW9biIFhsmUA/V6uFaIDdtzGF13r/3aKu2m3011xYIdraQuJ6lv7e4W
X-Received: by 2002:a05:6512:3dab:b0:545:ea9:1a1d with SMTP id 2adb3069b0e04-54990e2c0femr4870817e87.1.1741702568136;
        Tue, 11 Mar 2025 07:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702568; cv=none;
        d=google.com; s=arc-20240605;
        b=APJnxq6O2CAOYdnEUESi4iQzpkanUJ0Ks1cmi7iuFibxURw2+6pnHLie86Q7zUUFXP
         Gv7ijxgZbzjDHSd550+qVv9KNShuzFbfsICksfMcOPEVh3bZ/Zr/W3aeKXY31yVYVpOA
         Ig4NG0HXRcgJJu327IiQrBZKVTQm52ZuG9dEFlXr5iFldRkvQ+FCirFfp43mvA5mDFZ6
         y4DPSmbjT8lQWWJHmLCY/PdMQmrLkdoydY/VFzroqTr+mN1/lKsJa5TwctmKYyN4YzH8
         1dhS2iCC5563Gve176QdwL716EMcJG9v0higPyEallqSwM+zxRDDov3XQA2SoMEwq/iX
         BISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=vdGUdGauL3ccsNkDRxNi5r3+cczzx/al1WceanBsWes=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=NFxqZ6HCD1RUm4zMzAoG32MqVO2Ps2/YlQqC9YMs8RXUS43uybtb2LqEBd9sCpeC67
         JghLg1XK3WGY+VXpfUOVpCPHP/usKwbuh3GNlxCxKs48AodpowXlNoIaE9TkSBqd1O+b
         w4sJFrS5zTQrcqiJpn28Mz69dxQ8ABPrNBqO5y2QKZnMbHxIg5DvYNb+UodjXNX0Q/9D
         pCcUavtDw9ojdgc/DIY4m5qYekF9G9zrvnJpPgN0L47hD9Wtiv/m5sVV9+I+tmvyxXFT
         UKUCHfGy/JxqqXi6NwvOq28Tml8RzpzV2VtlttDBq5WEtXJe6xNmDVfFJ2606YVBD/6N
         h27Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-5498ae43ec9si5118936e87.14.2025.03.11.07.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:16:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts0OB-0002oX-RA; Tue, 11 Mar 2025 10:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Nx-0002d3-9P; Tue, 11 Mar 2025 10:15:14 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Nt-0007LC-Uw; Tue, 11 Mar 2025 10:15:08 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwgH6HHVz6D9js;
 Tue, 11 Mar 2025 22:11:55 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id AB73D14034E;
 Tue, 11 Mar 2025 22:15:02 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:14:55 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 20/20] hw/arm/smmuv3-accel: Enable smmuv3-accel creation
Date: Tue, 11 Mar 2025 14:10:45 +0000
Message-ID: <20250311141045.66620-21-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
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
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: cE6fv6NeXAZx

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3-accel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index fb08e1d66b..812f8e358f 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -595,6 +595,7 @@ static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
                                        &c->parent_phases);
     device_class_set_parent_realize(dc, smmu_accel_realize,
                                     &c->parent_realize);
+    dc->user_creatable = true;
     dc->hotpluggable = false;
     dc->bus_type = TYPE_PCIE_BUS;
 }
-- 
2.34.1

