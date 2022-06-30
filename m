Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp254470lft;
        Thu, 30 Jun 2022 04:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uFkLduyzpdGANvKUc4eAW069iOAnD4MGxhJr1XnPrv0TBGZnTYiiYkLw+o6B2x/RgSrIdJ
X-Received: by 2002:a05:622a:4d:b0:31a:ca28:707c with SMTP id y13-20020a05622a004d00b0031aca28707cmr6831753qtw.143.1656588455027;
        Thu, 30 Jun 2022 04:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588455; cv=none;
        d=google.com; s=arc-20160816;
        b=UnXXFKDSj8DBd1xrJNICfz0Ofc9uaEzsc7ecHISqVA6VVtntE7UVjJ4Flb4M9foqbQ
         nCtyfFgDp2JU2yWhRy701A1GcK87g9f/5zlFMTujoyRZm6bMmC5xmLGXYI6dimOM+yEH
         5lwcODyzKET1Sfhhh2LHDnU6JZl1+PFFxz6iDD8CHGWGi61VPhRoR7YB3+5Ir1hGaz/i
         3fs3JY5A+kVT2psk4LB81KDg4N+vDOT0M5UHIFyZOrX6Y6fRrXUTuoyIa37+P4NXw2O5
         rlRn6NvpgHA0LZvUPTgaKHcfJk6mh/U6/neT0l7xlhEx2D3Xgw+siM6FW3cgTwINVvxd
         mkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=xcsaWPc9Kk1epS7KD6J0SAw3CeUj7P8ToK7mDT98d90=;
        b=AdjR1DA+DwEV5GdGDe11+Q7TzZl/9VMRKNPeZKA0T1xL/MVSvyD4nF9sBlmLAPfBEp
         oXEeUatYuKsvzt62RKahGIpuo7naYR+9bFzSfa/rDUVObTtixIWEDc5TFVgylL8O5uBA
         8cd5X/xn75w2iLq+stZZ2CLx66eMUliI0GuxYY9MlfdE8DA7T77jrtKS4uKqFiJXwPIO
         YJLl/VCICofVyUy24pCbe/ZIQn0GuEaAQHvRMnGXnj1I1rQC2g2HVEegXBNXw23RLooq
         EmE1oiIKKVX6G4Nz3di3/Zc867R0+zfqMGSiU0boW8qdrHFgkML25hVq0Pl/uRZSYST/
         sLXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj6-20020a05620a190600b006a698f94df2si12556505qkb.189.2022.06.30.04.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sKc-0003xy-Ec
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI3-00082r-BC; Thu, 30 Jun 2022 07:24:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI0-00027m-LN; Thu, 30 Jun 2022 07:24:54 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbb61JS6z4xYN;
 Thu, 30 Jun 2022 21:24:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbb413TDz4xD5;
 Thu, 30 Jun 2022 21:24:47 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/27] aspeed: Remove use of qemu_get_cpu
Date: Thu, 30 Jun 2022 13:23:56 +0200
Message-Id: <20220630112411.1474431-13-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: Xk3Pp25gHqgc

From: Peter Delevoryas <pdel@fb.com>

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220624003701.1363500-6-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index dbb4a2e838f9..29d2e2ece220 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -318,7 +318,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < sc->num_cpus; i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-        DeviceState  *d   = DEVICE(qemu_get_cpu(i));
+        DeviceState  *d   = DEVICE(&s->cpu[i]);
 
         irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
-- 
2.35.3

