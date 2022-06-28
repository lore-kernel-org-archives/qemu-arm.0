Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3319301lft;
        Tue, 28 Jun 2022 08:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1skYejZE4Ch28c0OtFOlaNt17wOBt/IPSXU9AD0HcYq6+Kaoljew3loOL67FkjkASC1UraI
X-Received: by 2002:a05:620a:2991:b0:6a7:1dc:2f94 with SMTP id r17-20020a05620a299100b006a701dc2f94mr6905335qkp.639.1656431340219;
        Tue, 28 Jun 2022 08:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656431340; cv=none;
        d=google.com; s=arc-20160816;
        b=IsKhVEUMB23RLwuQKddi/ROu+fG5ERY2ZvGHkUNoKcWrTY/T08ipFh7cRqigUUNBn7
         XMTWndD0UzeJmgbve9OKVmKssXGKnIER9WQelEkcyZoGokgMowRSwz1WWa+35Og8ezRy
         K1ql/pZWl/PXK215vfTGLpADJwTd6Znj6rK63ApIQhRcBJUw4bOvJLA2oHlJZgB34o5Y
         GgXV9FhvG0PEu0xfBXOaHYLHG7aaRBamlC3dOtmaV6tHAM9bw1zu7xoBfHqJpQGK6/v4
         oQL4fWvg45x6jooQx36QX6X+lMjME6sgn4B4S1wH2eiwsh1wwyagKuwzWPZWZLirKXSt
         7LGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=+GAp6ER18ZdcHtOlhhrVygHpiMXwARn7FWfW6RrHb44=;
        b=EU3e8DUbkKUNGqhff/dEGnEnv3CTZKFq6YdZP2fWTZ5K+euOXkPGo60NFBiu7s3W2g
         3g4sMoccqILJskRtDIli6A2PqcnB7b8zZd0odvGJSvura9al8mQ/8tBMQmicd3R6MVg0
         MUIpD0+MkHx7tj5kI6wyHppu+N5gMnMQAbkqlGXdVs1K7KnwHZJWhpXWApMmQE+Z/xWv
         rw12VvUEravc+wcnxWO4z9OrdtJpY4uop0Oh03wP4AfGmt4wBeMqkN3Qfjihy1MADJUq
         OnMnCYCqe86Fs+hZESACgmCobfcVXyZcFf1IwMvUe9wOKxpp1zrrksJqCsPuaxl8CkMx
         AYbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189-20020a370bc6000000b006aee8668129si7252161qkl.136.2022.06.28.08.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 08:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6DSV-0004Va-Mm
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 11:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRY-0003iG-T1; Tue, 28 Jun 2022 11:48:01 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41423
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRV-0001oC-07; Tue, 28 Jun 2022 11:48:00 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXTWX2Vbhz4xYL;
 Wed, 29 Jun 2022 01:47:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXTWV2FtHz4xR1;
 Wed, 29 Jun 2022 01:47:50 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/3] aspeed/i2c: Change trace event for NORMAL_STOP states
Date: Tue, 28 Jun 2022 17:47:39 +0200
Message-Id: <20220628154740.1117349-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628154740.1117349-1-clg@kaod.org>
References: <20220628154740.1117349-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=xpXT=XD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: GCV5sE/HFNkw

Using a 'stop' string seems more appropriate than 'normal'.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 37ae1f2e04bd..9b41bc38964f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -58,7 +58,7 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
                ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH) ?
                                                "slave-match|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
-                                               "normal|" : "",
+                                               "stop|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ?
                                                "abnormal"  : "");
 
-- 
2.35.3

