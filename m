Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4447322lfb;
        Tue, 7 Sep 2021 00:01:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZvYj1zd/tXoIUkQMiSnZkYs2DP04zpro4bvEhdYN+gb8F/aWSQZZrn+Uiv0tQLQDaTnxu
X-Received: by 2002:a6b:f214:: with SMTP id q20mr12752828ioh.84.1630998091614;
        Tue, 07 Sep 2021 00:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630998091; cv=none;
        d=google.com; s=arc-20160816;
        b=tFm5ESdigNQgIL7TgP2F6zYpxABhAuJi3hqI88qSxr4WSO8tMsi9hOjzU6z3VaRUUb
         wyFZ461q16u8PVF8uLSHkJslg+Jx5ANi7e/57QaLd15U5r0E32nmPIWBAXQHkND93YI9
         JJsdM0ZujxPmIo9GthTb06HrJqwV14pLiltT5+MloNDK36W5jhDINifTSlp++ZQnHcT4
         zjg5Twom88C7sepGWeBQA+kUCl+10msvizyJT3qteA6WmOBJKCh//nj4axyi1ac4Hh4h
         TBgdOYFYSp+drEsLSz0LpzHiEFdPlnOkPZq6gRQTBpQcedE7xPPljRZtCIai2hE6awkZ
         8CcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ow78Lq0aQwgxUAvuVL1yK1FPfgz/hxpbe9RwxF+Y5GU=;
        b=MRzSBwCjH5X8p1ip1ar1pRhZ4qnVlYXCdXMxrgr+P+fXFaXgI8GCFYckPllbrhvcyF
         VUrImDE8/hqRfEcR7IMqbXsNlfPWmIqk9A9gDb2g1pHBugCEB1fcvFdrtFXf43XtheTs
         CvgnRiCGWxbgPE1ayHjQCzTXHxQgy/evEYufvINAJHMIj+Gx5m9hcKySJ1qWPwFN8mF1
         l0hA385aYraXaqQ43KwAOIXDatqdV4eEN7e/f1KY0jJS/DVNimFlte+XRNtTpyJlOZMn
         WSfXdLGt9163NmYN1uX9tv3hGXkgFzQObKiuENCtVyoo1kHYII+p1IDLDEIREVndtRMP
         dW4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e43si10011761jaf.55.2021.09.07.00.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:01:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNV6o-000459-VA
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3y-0001ND-Kz
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:34 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mNV3u-0001Kw-1G
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:58:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 07D7E20C15;
 Tue,  7 Sep 2021 06:58:26 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002f07278b0-683a-48fa-8166-f4817a6263b1,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 05/10] aspeed/smc: Remove the 'flash' attribute from
 AspeedSMCFlash
Date: Tue, 7 Sep 2021 08:58:17 +0200
Message-ID: <20210907065822.1152443-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 14b2fe2f-6220-43ee-98ab-8bf640f8244d
X-Ovh-Tracer-Id: 977562596443065193
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9+tyAzOxaQIo

There is no use for it.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 -
 hw/arm/aspeed.c             | 11 +++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 0ea536a44c3a..f32f66f9a838 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -37,7 +37,6 @@ typedef struct AspeedSMCFlash {
     uint32_t size;
 
     MemoryRegion mmio;
-    DeviceState *flash;
 } AspeedSMCFlash;
 
 #define TYPE_ASPEED_SMC "aspeed.smc"
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 95ce4b1670ac..64c3a7fb66db 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -274,18 +274,17 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
     int i ;
 
     for (i = 0; i < s->num_cs; ++i) {
-        AspeedSMCFlash *fl = &s->flashes[i];
         DriveInfo *dinfo = drive_get_next(IF_MTD);
         qemu_irq cs_line;
+        DeviceState *dev;
 
-        fl->flash = qdev_new(flashtype);
+        dev = qdev_new(flashtype);
         if (dinfo) {
-            qdev_prop_set_drive(fl->flash, "drive",
-                                blk_by_legacy_dinfo(dinfo));
+            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
         }
-        qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
+        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
 
-        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
+        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
         sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
     }
 }
-- 
2.31.1

