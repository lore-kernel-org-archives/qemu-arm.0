Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp674800ejn;
        Thu, 13 Oct 2022 09:16:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xICKdQLshhQOV5kZewYuE97YcxvRlI/C7ogpRVSSHNP3ywd5sp1nvQzSTf4Gp9NzMzDpQ
X-Received: by 2002:ac8:5b87:0:b0:39c:b5a6:193b with SMTP id a7-20020ac85b87000000b0039cb5a6193bmr470545qta.461.1665677765570;
        Thu, 13 Oct 2022 09:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665677765; cv=none;
        d=google.com; s=arc-20160816;
        b=FQiCigSDaNx8brIwjpdX8qGvghTjtNI2wdNpKGZ7C3EhjBHpH5LVd3HSNbeKSckxRf
         g/7e0EHV9o43qeID2BB70CO52PPGOD1TPEzPHreWXsjY7MAt88iXbBaCg/BS8WCq/X23
         W5p8sYoP3PqoC8oK41eK+cV334zvCcUDk6apNgkCvzvydlM3MpUSO4oSaA41WkleJ9+C
         7Xx3AKfXr+uJQejma2rDPwjZGfDkXAag58AcxU7Ir9guOwd54PD8nb2gfy1C0jIU1pOf
         hdkAKTSj+3GOUEr/6t/YYWqOyuG+mRA5+k6yNNmgsxSJz3EdmOJabwkEtiN/xbIfJUPG
         nQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=sOShrUiwHtWYk/q1riPCbHiO/7XqSOWqSNIOc826uwc=;
        b=WuuvbUHcKztHWNISAxkPrk3y+NBc5Pu51iLgFxLqmwf00ecEBveEmJ4nOuZZHQ/Rk4
         vyp2PCZt9/lB7LxpGuZmkggsYm6v+dpF6lvidkswqf8ieP6IfU7gMHG4/wjMYF2beBIW
         I25y7469pezWEk88XPsOMMGpnh8ya040Wd+eJP3tCigqvO9roMNvSmJHi23VPbFDao86
         Z+CNOaiIE9ltqx+ZTv0NJNYidH2det+47ZelqndiG5kjTpeSm8d177IUPhfbBb24r2Tz
         sVmO/SQUFTiUaPVTNoZ3lL2MH63hOCvFbxCz+j3vW8ajTDo/q8sxUOPAlD1YqFCGC0uv
         g2bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib8-20020a0562141c8800b004992a5c6dd4si136985qvb.58.2022.10.13.09.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 09:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oj0sO-0004df-W5
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 12:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pX-0000po-VK; Thu, 13 Oct 2022 12:13:07 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:36919
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pW-0002eW-3k; Thu, 13 Oct 2022 12:13:07 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF1B6chsz4xH2;
 Fri, 14 Oct 2022 03:13:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF174Sgzz4xDn;
 Fri, 14 Oct 2022 03:12:59 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 03/10] m25p80: Add erase size for mx25l25635e
Date: Thu, 13 Oct 2022 18:12:34 +0200
Message-Id: <20221013161241.2805140-4-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013161241.2805140-1-clg@kaod.org>
References: <20221013161241.2805140-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=HNeY=2O=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0HUAArJsIwNE

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 13e7b28fd2b0..637c25d76e37 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -232,7 +232,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
-    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
+    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512,
+            ER_4K | ER_32K) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
-- 
2.37.3

