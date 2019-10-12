Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1938090wrm;
        Sat, 12 Oct 2019 02:46:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyS5Cl+haLmlGQh5v16WUtlRiui2YpHKWeRZ29zfHSbpsZs3aKuszL93JrgNOuzuBhK9rC
X-Received: by 2002:a37:a60b:: with SMTP id p11mr14789850qke.10.1570873599468;
        Sat, 12 Oct 2019 02:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570873599; cv=none;
        d=google.com; s=arc-20160816;
        b=vsg2ZpA2F2U6fTPNcCyHjoIeZoVZXHfN7w8fmT7aqe28oJUFaOd2tlr7dgVruNkQC5
         pXpk7ITEYjjlCKE65Jc1yRep2rL0XrOmMzO9iHW/bqcGdv5Ahkj/ypyELAm3kUGOgIhN
         aRDK2bon36O0m5ElwIBjLSIPCBQPOsLR248KgiyHzrcVy9dcGA4o/dw+BScLuICG02Ry
         Og0VKtSjiBWfCvaN3VuLKMlQaVyFPwPReSSwrmZwVaoLaadwE2FmEuj8qmqo/Q1BPMZC
         V6wd9pZgyNPQVx3GBkWxbb8mgVO7GvNO/u0VVhWpSm7yrWESPlnhoUK1NFENKTD4OMmy
         2B3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=b7xQYAOFvzZS6hNDZjta//fE+gtzm7t9zd8wvSanXRM=;
        b=Pvxphoj2pZN7Xfr7BmLYGFoZtQgZFKENIUvsav7CsKder5e+/i0TOsPt7hWo15uAZm
         Fr13edGdB7BhG4PlmZhKlqpGhcQKHf5iATIIqc4fOfD804Eu27BdC9Ul35+fpLbfq1yK
         TW3whwilDjU78L99OlgfTAcAg8QnnhHCpg5RlkXdyC7dLBvvIy8o81KFTx2IDm5k5eHT
         Jan5nsILRMsu95Wc2UOzlJL0uy3UvWS00f17kvVEZE8UPd2rrkxyPgYaU2vU5b/cU7ot
         RpyLKGcEmxl26qrcVknnlnV04TmUpXUGK8keW9KV0nqijBo9j8DyNSDinX8//1zHFPY4
         YDLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w54si11767938qvc.133.2019.10.12.02.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2019 02:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJDyw-0006fW-Ct
	for alex.bennee@linaro.org; Sat, 12 Oct 2019 05:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwU-0005TI-Jn
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwT-0003VH-4Y
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:06 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:4356)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1iJDwS-0003QR-BE; Sat, 12 Oct 2019 05:44:05 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65da1a04ec06-4ebdd;
 Sat, 12 Oct 2019 17:43:43 +0800 (CST)
X-RM-TRANSID: 2ee65da1a04ec06-4ebdd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75da1a0478f4-669b6;
 Sat, 12 Oct 2019 17:43:42 +0800 (CST)
X-RM-TRANSID: 2ee75da1a0478f4-669b6
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/2] isa/pc87312: use helper to be more easier to understand
 when using abstract QOM parent functions.
Date: Sat, 12 Oct 2019 17:43:23 +0800
Message-Id: <20191012094323.234788-3-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
References: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
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
Cc: hpoussin@reactos.org, f4bug@amsat.org,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fgNFQ+Zg2coE

Philippe introduced a series of helpers to make the
device class_init() easier to understand when a
device class change the parent hooks, device pc87312
missed helper, so convert it.

Cc: hpoussin@reactos.org
Cc: f4bug@amsat.org
Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 hw/isa/pc87312.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index b9bd57471e..13c1c43d2f 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -338,8 +338,7 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
 
-    sc->parent_realize = dc->realize;
-    dc->realize = pc87312_realize;
+    device_class_set_parent_realize(dc, pc87312_realize, &sc->parent_realize);
     dc->reset = pc87312_reset;
     dc->vmsd = &vmstate_pc87312;
     dc->props = pc87312_properties;
-- 
2.17.1



