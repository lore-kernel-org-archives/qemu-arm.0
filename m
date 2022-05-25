Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1029417lfh;
        Wed, 25 May 2022 09:16:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKk+7svLnWQiFmvUUuqO763y1lKE97ohDyns5S5fgWs3nRB5d3tyxNabPI4szSjkTISAUz
X-Received: by 2002:a05:6214:f2e:b0:461:f264:ba5 with SMTP id iw14-20020a0562140f2e00b00461f2640ba5mr26394894qvb.124.1653495397582;
        Wed, 25 May 2022 09:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495397; cv=none;
        d=google.com; s=arc-20160816;
        b=M5WLgQmkVrhYAda8XEJoYMWRVKwWj0pSSy91IkEjBN2ZNk+5A2ZFExdHedgzL7W9CZ
         l3WvrwwinUvwryR5OaRoPVBzgwmtSSn/L2ZK6yntnnVczzGDjnY1KNB9CM1+acixYrZA
         qKrteYdinT2kZ2ObTega++H93MfA7L41HwFQJkz2y+V3ZvsCy8drCLVaeXs80jhduATJ
         hcLEUI0IAzeHZfun+RjuS15bkR4vbW1IwYhcEao5JPCWzbYJwubwuQ9QT+I0VZq+188T
         im3+EZMFQVGGy5Ry+ZcJ5gW3/nrbud2zWFBCPe9xF19vNtU7z4fVAiykrcV7yL0Y1kvN
         SsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=8YvdMhsoGFshheaOFG2Ay4wP1NUm33m9LbHpfsNfT+U=;
        b=p28mq8xcuZenHvrLajVt8Lo2LxSNnYiva0XNatyYrgjU9/zFOceSyOjLH4CbfHKU3H
         Xigsnj0dSBMFMPvRXEfz9IeS0mX+0A/M+2wDJ1Musoj6BLdOfS6yY9+j8GqvWnBzzaMe
         GmmAqt5y4KTP/kdeL1BC7YNwUxgsPAoygI8OWIRxM/qUZXktIbQMk7UrMX8065JELQLI
         /yTsTldUgbjmY7PSsbAfZf88EmaubKM4uCBzG/9/M5SoJxUoOZPoNH4jxUznGFoavOAy
         b+nGMBjxKUB4+DpbXQjWtfqFSjCXL0d2GxtpJqHp6r+4B+p/hWKYzjPcMdzyZlg1f7KF
         Aoqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw1-20020a0562140f0100b004564d25bac7si1859064qvb.167.2022.05.25.09.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttga-0000S0-V3
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSb-00076f-9T; Wed, 25 May 2022 12:02:10 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51697
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSU-00049r-IW; Wed, 25 May 2022 12:02:08 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRX19Rtz4xbt;
 Thu, 26 May 2022 02:02:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRV2jprz4xXj;
 Thu, 26 May 2022 02:01:58 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/15] hw: aspeed: Add uarts_num SoC attribute
Date: Wed, 25 May 2022 18:01:28 +0200
Message-Id: <20220525160136.556277-8-clg@kaod.org>
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
X-TUID: tNhivuIccuPv

From: Peter Delevoryas <pdel@fb.com>

AST2400 and AST2500 have 5 UART's, while the AST2600 and AST1030 have 13.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516062328.298336-3-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast10x0.c     | 1 +
 hw/arm/aspeed_ast2600.c     | 1 +
 hw/arm/aspeed_soc.c         | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 709a78285b59..669bc4985571 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -91,6 +91,7 @@ struct AspeedSoCClass {
     int ehcis_num;
     int wdts_num;
     int macs_num;
+    int uarts_num;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index fa2cc4406c0d..bb8177e86c87 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -301,6 +301,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->ehcis_num = 0;
     sc->wdts_num = 4;
     sc->macs_num = 1;
+    sc->uarts_num = 13;
     sc->irqmap = aspeed_soc_ast1030_irqmap;
     sc->memmap = aspeed_soc_ast1030_memmap;
     sc->num_cpus = 1;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f3ecc0f3b7c0..a9523074a089 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -588,6 +588,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->ehcis_num    = 2;
     sc->wdts_num     = 4;
     sc->macs_num     = 4;
+    sc->uarts_num    = 13;
     sc->irqmap       = aspeed_soc_ast2600_irqmap;
     sc->memmap       = aspeed_soc_ast2600_memmap;
     sc->num_cpus     = 2;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 96bc060680c9..7008cd1af716 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -490,6 +490,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     sc->ehcis_num    = 1;
     sc->wdts_num     = 2;
     sc->macs_num     = 2;
+    sc->uarts_num    = 5;
     sc->irqmap       = aspeed_soc_ast2400_irqmap;
     sc->memmap       = aspeed_soc_ast2400_memmap;
     sc->num_cpus     = 1;
@@ -516,6 +517,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     sc->ehcis_num    = 2;
     sc->wdts_num     = 3;
     sc->macs_num     = 2;
+    sc->uarts_num    = 5;
     sc->irqmap       = aspeed_soc_ast2500_irqmap;
     sc->memmap       = aspeed_soc_ast2500_memmap;
     sc->num_cpus     = 1;
-- 
2.35.3

