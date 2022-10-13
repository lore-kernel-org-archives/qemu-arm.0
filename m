Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp683443ejn;
        Thu, 13 Oct 2022 09:28:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6AZj+4YP5kEDp2h/Vt4ebapn32WcljTvT5eke8kn1a1uOwE0pGhXJbYHbICubO5GJphkiZ
X-Received: by 2002:a05:620a:458a:b0:6ee:7de8:5187 with SMTP id bp10-20020a05620a458a00b006ee7de85187mr546225qkb.393.1665678488902;
        Thu, 13 Oct 2022 09:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665678488; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlKHnl29hNFebGpinQ4dYDnESJgttHkkUh57zA0oQc/aKGdFVXFQEtvjhnTisK6PhX
         6O8dz1CL5J/Ap3DcOJioZfihLBwZiJ6ymBnhYtOvMpdi216cYQjgVcr3LgYuX4W6TsYj
         StWP0t96rndwWMv6L7i4CSB2HGmBlQyg9oc9CFh21ucyk0tSlKy8jTveGHOs9uGl1vw/
         dRkANX/HRuQTgKvxuckPnj6RZdEP9GpmsR6yXSqwYL5IMp256Jfx2a3FKfJ6NfXMvUW4
         S5Q6GRpq9XUp/yK2d4sQnU5/oRUQp7a8TJjbEQR+xRFtuXzGtGoR9Ks+u9kSmzP/k0kS
         EeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Rw5+J0r/cAiKmqsLgopH6YubA0eJp3pDGReEXH2bXgA=;
        b=nBHdGUlYAEk+An7YFoaGl9OdxlxmABu2NrRsqPLC0fWCpqqz0e6h2sfmLfkkpMk0d8
         nSU9DR1WVufb4P/qTRn9Sg8dcQ7ggn19EJhzJYFOC0pQzc9S9zGWo45JWlwf1nfDjJWp
         ZoZ8BQTiY66jPtYZbZiTYsxaLkZa1YqnZtnsbtb4YNao2rjX6AqpX9k7w45G42XDwYNL
         b7RNqqrWtUwPvz+0FtvLWBRRlHVKSFOi2pzlaF1hhRJmD80OTdd5zdStaNflYGFB/2mC
         dp0UruWofk7m3/IIRUW1/kAXjhnGGlPN0oftH+3j3dPnUw5qa+rUaDlI/XzSP66rcWDQ
         NShg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn5-20020ad45de5000000b004a5a85361f6si114124qvb.441.2022.10.13.09.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 09:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oj144-0000x4-BR
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 12:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pz-0001pL-8T; Thu, 13 Oct 2022 12:13:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0px-0002ky-Jf; Thu, 13 Oct 2022 12:13:34 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF1k1XSWz4xGw;
 Fri, 14 Oct 2022 03:13:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF1f6KwCz4xH1;
 Fri, 14 Oct 2022 03:13:26 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 10/10] arm/aspeed: Replace mx25l25635e chip model
Date: Thu, 13 Oct 2022 18:12:41 +0200
Message-Id: <20221013161241.2805140-11-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013161241.2805140-1-clg@kaod.org>
References: <20221013161241.2805140-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=HNeY=2O=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: afPH9+eQOlbW

A mx25l25635f chip model is generally found on these machines. It's
newer and uses 4B opcodes which is better to exercise the support in
the Linux kernel.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-9-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc5c1e167773..f8bc6d4a1406 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1099,7 +1099,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2400-a1";
     amc->hw_strap1 = PALMETTO_BMC_HW_STRAP1;
     amc->fmc_model = "n25q256a";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size       = 256 * MiB;
@@ -1150,7 +1150,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
     amc->fmc_model = "mx25l25635e";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = ast2500_evb_i2c_init;
     mc->default_ram_size       = 512 * MiB;
@@ -1200,7 +1200,7 @@ static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
     mc->desc       = "OpenPOWER Witherspoon BMC (ARM1176)";
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = WITHERSPOON_BMC_HW_STRAP1;
-    amc->fmc_model = "mx25l25635e";
+    amc->fmc_model = "mx25l25635f";
     amc->spi_model = "mx66l1g45g";
     amc->num_cs    = 2;
     amc->i2c_init  = witherspoon_bmc_i2c_init;
-- 
2.37.3

