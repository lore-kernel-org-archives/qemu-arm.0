Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1341952lfb;
        Thu, 26 Nov 2020 03:25:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWXUIwcog1kcNQ3e6ZQu8fEaYt7/MR6W+/AD+PTCuPOuXB7HiMoJH/u55AwZy4oa9CxUpz
X-Received: by 2002:a25:e8b:: with SMTP id 133mr2667177ybo.146.1606389907458;
        Thu, 26 Nov 2020 03:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606389907; cv=none;
        d=google.com; s=arc-20160816;
        b=tZD9zR62xDXvIDWVvXS+KlxvYf57mJLe6bvk+dMEom4TMVisZX0Nr0NVtjsdak7OS9
         1/lqpHXxssc5TqPx36oMoXTHp1Qf77lwX1LR3haAcD9DKmptSuqogYhtWXU8F30HKsAj
         bb3EnuzMCST9J5zSFZHc9lhtmlHpTxC/fv4mjOQ9VzYWEtRueyPvKowXDJ30KODrhIrT
         JlBaj4cKZSMz+l3ai63EKasGD1uMPe5s8cZMUbZjqYBRHDXA61ta50gu2LqLR3XrctGz
         l68o/pdECyTa8CfdvehVWsGQcbUI6G8BxmKstzYyVe6ICoRzGdCwX76EbTKH1W4cUD8d
         +hqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=zML+uhYjIblZkQZjepQTqIbeYZhpaJKBJ5lXgQ07pUw=;
        b=Hfn41Td1XJhGGX9/DDpxtrkIQPH6VVrXonSsNTj8Q+vqJI18a+zhJLI0yENKcDyP6U
         3jIfIbAP9UFao5X4fBEzO0ZBpuhbdliOTdxorCVkpxoI4zk6x6G9qGb2b3Y97rWsdaz5
         l0r7pBOkL8vBrrvtj+N61GRqiYBK2MMQqEyGq8wriDUtAHSKzNtr80t/jKfm/phfFKfK
         ru//r/BDHH8DiNDGnmBKZqikencWyMIILgTAuNn4sP+u7B2/o+x2tiaKMZ0NqMNeLtxM
         guqs0eNqHKTPlZine1A7R0gdnDvmUf4g9v8af3pCf8An9cM3Cgm7qqAC51jRdiiNmLNt
         /i2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j189si5070066ybj.105.2020.11.26.03.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 03:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiFOc-00052l-M4
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 06:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNN-0004Yt-Np; Thu, 26 Nov 2020 06:23:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNF-0003sl-Pk; Thu, 26 Nov 2020 06:23:49 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Chb3R4Q4Hzhh8q;
 Thu, 26 Nov 2020 19:23:15 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:26 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
Subject: [PATCH 5/5] misc/omap_sdrc: Fix bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:09 +0000
Message-ID: <20201126111109.112238-6-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
References: <20201126111109.112238-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uPfOuy33iyCR

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/misc/omap_sdrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
index f2f72f6810..c142fe0882 100644
--- a/hw/misc/omap_sdrc.c
+++ b/hw/misc/omap_sdrc.c
@@ -107,7 +107,7 @@ static void omap_sdrc_write(void *opaque, hwaddr addr,
 
     case 0x10:	/* SDRC_SYSCONFIG */
         if ((value >> 3) != 0x2)
-            fprintf(stderr, "%s: bad SDRAM idle mode %i\n",
+            fprintf(stderr, "%s: bad SDRAM idle mode %u\n",
                     __func__, (unsigned)value >> 3);
         if (value & 2)
             omap_sdrc_reset(s);
-- 
2.19.1

