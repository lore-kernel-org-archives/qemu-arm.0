Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2228807lfp;
        Mon, 20 Sep 2021 09:23:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykNITMTI+fKeBmXZeOFVuH5w9Sa8/JuQurkJIg0M6YS9+OYAj8C4DMR1jzS2lbRjzyId71
X-Received: by 2002:a05:620a:284b:: with SMTP id h11mr24366509qkp.438.1632155038501;
        Mon, 20 Sep 2021 09:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632155038; cv=none;
        d=google.com; s=arc-20160816;
        b=moQt4SbIhtF8Gbt+XAnHmkwTE+mZj2Ln8UCm7+PY2Epv+BLLpbNJzQGvbV1r4o5AAt
         pBP09OTDxg5C99GFl13H/2LJ+jivWzwz9RABAJL0vFz0vuNu4O2SfzNBnWhwVD8H9Roi
         hSdh7GedrQXxqqEVoFdUfYTd6kRs99K0skqcAqxHpkHAum42uJgCc1S7Kru/sP033Hae
         P9t09tgyvUFseckzrKz9nDtbDAg4Ecf00zXX0jWDsPCpP+RQM/PbG4eyFfMew0pJbmy/
         z/mnyUYCNyxdBGGXSIFZYz8jn6eZ044FtzWbCxU6frnkRZ/z/gqe6o1XOvuwAM02fv+n
         01YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=58C8HIEus3j9O8Y5Xv1+taHL9+k19vjFkdp24NQ5GVE=;
        b=Ssis6vLqOWLL9tGOZb6iFX1HS16NLut/i1xkbG6MVhfH2teU4WLPN9aL9NPNcnT1rt
         AUG604vKXUZS8YedB2Wf/kbAkphx3V3/65DiDjyim6GxsN8xJoyThmoEsBvLxT0ak7ad
         oy9y0HExQnwsQV1qCSQAUL43XGqYFb++N4neDTD2gdnVI4RZnJmb+aO6/cnkYdKyAXlo
         UPXvoju5GlmJjKW5J3l+kpN5W2aKmTvUmLtFlmmVqv7U6IhyOUll/t733ath1Yjgzo7i
         6YUkoSpn1kg6H+BAUTvrOQLwoG+QjCa8lsAvGXyCXG3CWePBFQoxYOURp2ix4+JIBeTz
         fCXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si7393333qvb.19.2021.09.20.09.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 09:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSM5F-0005u5-Vt
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 12:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4i-0005si-DR
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 12:23:24 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:54227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4Z-0004BS-J0
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 12:23:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id ABE242137B;
 Mon, 20 Sep 2021 16:23:13 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a54649a1-781e-46ce-bb71-77e61d2df4a1,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/12] aspeed/smc: Remove the 'flash' attribute from
 AspeedSMCFlash
Date: Mon, 20 Sep 2021 18:23:02 +0200
Message-ID: <20210920162309.1091711-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 05f2b684-835e-4125-b4a7-0f3918864506
X-Ovh-Tracer-Id: 13074231196256734057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+qaIe2Y1Tne

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

