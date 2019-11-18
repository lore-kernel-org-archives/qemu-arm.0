Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2260126lfq;
        Sun, 17 Nov 2019 17:55:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJniLk132ih6HQdT7oM3OfWjSEfQEP8BjyEDa/gMm2LRXQSPLbDBTG7kZzdHjdvMh1i9xq
X-Received: by 2002:a37:470b:: with SMTP id u11mr22962957qka.172.1574042102155;
        Sun, 17 Nov 2019 17:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574042102; cv=none;
        d=google.com; s=arc-20160816;
        b=HuwPEl9EF7+hMuL8fqfgQMWXItey5h64m43qva4NJZG7aITB88cUVPn7beAAPu+Tsa
         vzvf+RnbcRXXwYn4lo8KDIQXBajldecgqoBtIZteqW5fKnvtaJL25KssIsj/JIopZ7cs
         a9FncIAp5GHmaNGaIBrT1bQT07j8AvbH3BDoHjvK2148sYdpmbS6plczeVRVU17Yrtts
         cXibaLH3wonPrfs/8+91g1AOESHzwtErKH9ucBhCSkm2sM4+nif4P8pWIp/eL4zVB/t4
         ejw13bs8fQDJmw+xjlo5mgaxs/xMnK+XS/M2A3CDFXdgBV9NZJ8JIU7A/UdqlA9o0ep5
         5gKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=3zxYkbBJCs7ZOKXGaOme8Tc+CHkk0Fy0OgAs6ozk6Ws=;
        b=dIIsi1UuIgiFDMjWaJRie/vDWFG89nLEqaTW3tU/z18zSbveXXr7ECF6cIRHROuFm3
         Jl98S98QWREYWgTvW1Wcp13PpYKqk4xoQXkdFhEp+jBlRXYX84R0345RNzp5zAPQ1s2W
         Yby1qXCf2ccvNjBsWMhUMt579UDjIkxOcX2+K1Ci0lr/CQMk7iitEc0OjAN1FFkqiyHs
         vcribBtzr9eYNMJ/qLTA5U/lYFe/sNin2bdm50reRus1QDFo1DfHIOB98d2UmYuvCw8W
         kffnjcREQ6+TXK7ocJa8v1+TTrGfmMGRAQbxe0DYDfI1Rcgxuco7yuhP0yyMjMB1J1eO
         TBzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si10381200qks.0.2019.11.17.17.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 17:55:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWWFp-0004hZ-JS
	for alex.bennee@linaro.org; Sun, 17 Nov 2019 20:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iWVzj-00011b-R3
 for qemu-arm@nongnu.org; Sun, 17 Nov 2019 20:38:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iWVzi-0003n4-IF
 for qemu-arm@nongnu.org; Sun, 17 Nov 2019 20:38:23 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37120 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iWVzi-0003jR-86; Sun, 17 Nov 2019 20:38:22 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B3A27D43981738ABCBF8;
 Mon, 18 Nov 2019 09:38:12 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 18 Nov 2019 09:38:06 +0800
From: <pannengyuan@huawei.com>
To: <clg@kaod.org>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>
Subject: [QEMU-DEVEL][PATCH] gpio: fix memory leak in aspeed_gpio_init()
Date: Mon, 18 Nov 2019 09:37:45 +0800
Message-ID: <1574041065-34936-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
X-Mailman-Approved-At: Sun, 17 Nov 2019 20:54:54 -0500
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
Cc: PanNengyuan <pannengyuan@huawei.com>, qemu-arm@nongnu.org,
 kenny.zhangjun@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IPesuABVZdos

From: PanNengyuan <pannengyuan@huawei.com>

Address Sanitizer shows memory leak in hw/gpio/aspeed_gpio.c:875

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 hw/gpio/aspeed_gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 7acc5fa..41e11ea 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -876,6 +876,7 @@ static void aspeed_gpio_init(Object *obj)
                                pin_idx % GPIOS_PER_GROUP);
         object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
                             aspeed_gpio_set_pin, NULL, NULL, NULL);
+        g_free(name);
     }
 }
 
-- 
2.7.2.windows.1


