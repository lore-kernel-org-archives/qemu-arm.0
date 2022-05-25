Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1027163lfh;
        Wed, 25 May 2022 09:13:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjhDMVr9kzS1W/pkYds22uxBOXSdLjuaDFn9B5Od+Kg5+YeMEC8osWWzccvfgINlNBSmYC
X-Received: by 2002:a05:6214:2aa6:b0:45b:474:f9d7 with SMTP id js6-20020a0562142aa600b0045b0474f9d7mr26424642qvb.75.1653495210372;
        Wed, 25 May 2022 09:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495210; cv=none;
        d=google.com; s=arc-20160816;
        b=s99PW1Wl434nfp1YsFUx2T/ss/6j6WP9mzf+Hj2vDItSK5uXKiIpjLitNX/UWfxtLc
         jUlECizGa6q2+9X4HEiT+binCUp8M4pcR7fO3gVYJRmTw//JzqXZ425rThu1hV/IxmUr
         9lmTumNU8OwQEAoYt2ZjtM9QEgKU0uWfxOLdlm6pTldTVRSopZ03YWZWlxqRAvUUtajm
         Yuw2Hxk0VP1dH6UY301AlDDhGV4Zj4qBX3/z9J2EUykNKzcDQbzfvBNK4//+bzIhmIro
         UNvSqm+4SpWz3DXqQ1OFcF4iNSYIn//QDwLWIzy+aBe4b6uuU4eEe/rDOsfwUTO+oDPs
         OEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=AQIv7lhN1t8sXZwr/YRQ6zH04hEcEPJhdiM4VgW64hM=;
        b=Ae/aeELz+0srfTLjKkvrPS5Sv6uiNPPgGQmeDPjiKSb98UOUBwMc3d+algFDyb55dS
         9yEuShBri5RDMAaQiCBs6B9ONy2B5KQnciKFV2kku2N6ZKndiT6BTDRkQj37I/h9V2kw
         /pZJ5cRhFQ17h028x6W51+DpHbNGqKmGHA3DsM8Ljzqvu1BNuYFSpquiZ9YIPfb9OIEd
         gO75WhnXby4TIPD+GMDho0Gz2FfhstWh5BKGCPHmdCyfUsriueF3K8UN/DvSuQ6DBEum
         eko7cyO+WUbih0JmgfzTp3z9ZP6rY4N6BmYr9soDIF+iU7CT5AL8trGQepjKTeHmgF55
         /kmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020ac85b53000000b002f3c5f05d2asi1516050qtw.527.2022.05.25.09.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:13:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttdZ-0003bM-Sq
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSZ-000757-Gb; Wed, 25 May 2022 12:02:08 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:57957
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSW-0004A3-Pi; Wed, 25 May 2022 12:02:06 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRZ3LnXz4ySb;
 Thu, 26 May 2022 02:02:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRX4p4mz4xXj;
 Thu, 26 May 2022 02:02:00 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/15] hw: aspeed: Ensure AST1030 respects uart-default
Date: Wed, 25 May 2022 18:01:29 +0200
Message-Id: <20220525160136.556277-9-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s+89tyMTwWbp

From: Peter Delevoryas <pdel@fb.com>

The AST1030 machine initialization was not respecting the Aspeed SoC
property "uart-default", which specifies which UART should be connected to
the first serial device, it was just always connecting UART5. This doesn't
change any behavior, because the default value for "uart-default" is UART5,
but it makes it possible to override this in new machine definitions using
the AST1030.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516062328.298336-4-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast10x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index bb8177e86c87..faafb800f386 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -215,9 +215,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->armv7m),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
 
-    /* UART5 - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default),
                    38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* Timer */
-- 
2.35.3

