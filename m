Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1524292lfc;
        Tue, 12 Oct 2021 00:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/xPDY0wsvdBIZ7mVK2/m+uxeNh8/OJtJHwHUSfPe0ZKmy1FriDF9nMPgievl7zGDs4Ert
X-Received: by 2002:a37:45c4:: with SMTP id s187mr18284164qka.125.1634024638171;
        Tue, 12 Oct 2021 00:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024638; cv=none;
        d=google.com; s=arc-20160816;
        b=aquJg/Vx4GKOTBiaz0T1MUEDnMKMRBFOboaIhQrS8AZcBtA6H517Ea2LSR9icTre+K
         2vHGqHrC0/RDlxBu3+13eo2T0Pvlg3yKJb+0J5ARbTVo8g11sLnYG1va1EUXa/6MYdtQ
         s4PtQSNkpt8z3kPNy2HTaGQZkzdR4iYzooOy8AZmKjYHWEBsUtOSXaVhLrYHuZLpvOPl
         poA7El1upbQO8H3fNeOlcayFygzYH8Kp3q27n8ZdVOTLIyew1Z+XaQ0lr+omsaxA+wrX
         oPgNE3kUq7zE0sbhtVRscJxEIc44P3NxYQk4QYUZqvaT0PA92AMkTbVfVTXfXgR2Qu8M
         ykqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=58C8HIEus3j9O8Y5Xv1+taHL9+k19vjFkdp24NQ5GVE=;
        b=pQt7+vgwZLQNx4UlOOMYNYcYJUFszRJqsH4whCjI/rH9akvUfepFZooG5LF3uGHS9p
         Nt/e2/1kgr5qf5A0HFhorcwxBzRj/kmWuO9v4OVgnF1vo2L2M4p1z+jyrpgkb22t7/Ii
         RtWeqx+AKSLsY7JidoZ+7MtsPxcbHE7isMWNMZGCCnl+xHEqQjjFnSZlD4T1uHo6lbh9
         jBbB07jMDwRtQUBzmPMeM9xvveGBJhWb8OsGpY8jBcQeNULqbKRcILEei6dsB+2y76tf
         lezGYGEyZiGgXsrkvw3TmnIKmAedjFw676LCKPxJUM7ubTeSWYdEGcCc8wLCa0LQqJD1
         Nbnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24si6143278qki.225.2021.10.12.00.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCS5-00020e-G0
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM2-0000LK-Sb
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:43 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:54289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCLy-0004yz-L1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 87F20C407CEB;
 Tue, 12 Oct 2021 09:37:33 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00658ac48e0-ae70-41ec-925e-b2390c2da20c,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/18] aspeed/smc: Remove the 'flash' attribute from
 AspeedSMCFlash
Date: Tue, 12 Oct 2021 09:37:15 +0200
Message-ID: <20211012073728.257748-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2c298845-9f94-4391-8e02-40694004a168
X-Ovh-Tracer-Id: 4268568024199695209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tv7t1NBv1+NN

There is no need to keep a reference of the flash qdev in the AspeedSMCFlash
state: the SPI bus takes ownership and will release its resources. Remove
AspeedSMCFlash::flash.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index ba5f1dc5af78..854413594d9e 100644
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

