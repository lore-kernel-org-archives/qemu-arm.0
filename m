Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1466391ejb;
        Tue, 14 Feb 2023 09:19:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8NYKEzBzRi2/mAwHlUb+yQIU2JEz+GYIZ5Yy3QK+pkUhIzGQBBiMfioG0O/2EgeIg24BHE
X-Received: by 2002:ac8:5704:0:b0:3b8:6d57:939c with SMTP id 4-20020ac85704000000b003b86d57939cmr5624180qtw.0.1676395183778;
        Tue, 14 Feb 2023 09:19:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676395183; cv=none;
        d=google.com; s=arc-20160816;
        b=ClI063Tz6IKD2ZcAQY0fDkgNINCeV9ty3pagwZRsKwuIDY3LV3hbQkB4UrgTUVPxwi
         2eYvFEnQA3dpc2tXKmbG41N+txHk/lo0tMcOS8T4jG3liIPOWC1EYkZEdTUYd2lGqEMQ
         zlpG2Uv/2MrvEG8L24LQWKCeg7inwJR7PZn0EBwYYyPOkM4RD/LssdwjRhRb82FjS963
         4/p6NQ6eBVypXBGh2/If/KSGlGV498A0xGZ5tAhaezlasxnqKjDJmBwx/BxxJiS14Qc/
         JZy+28zKgy8EhP9xNgkty/0y90DW6WjOoRXowEbjaGW/NwUFVd7owbbJWymMrLNw+YT9
         kpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=BjpRnsTU78SKF+QJvXHnKtO0ErVldNmBZYYNytpmS6U=;
        b=gtO7QRH4We3+s9F6EpirIHCSpqPoAmE0bsw7nrpuVCz03f2E84+2w9ARAo+81XRYC3
         x1EvsECdeFNL2Yk3ESjxmQ+vmSbVb0bQhbL+J95wcRYcQcP0Rp0JlzkSJAZ82RzzN9ZL
         yJbbOSGuqucmCodu86wd2cilj/+FZS3alMeIJqSwWdK+s/xLbOzo9SRLpMBJBZ0/rRM4
         fZ662fTgOJjS47Pd8ATaQRer+PFUgnNhpdeLWUQH3/lbBPPUSgii8B+K43daPUUHFyjv
         jmzSTmlhCVkv8t7IHqIV2i/ow+/au4/0BvtUCWiIODfcqmp4HTq9P29baDblKQymOiBF
         gRBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05622a119500b003ba10333aa9si13004762qtk.522.2023.02.14.09.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 09:19:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyxQ-0001lV-9e; Tue, 14 Feb 2023 12:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxO-0001kp-Cr; Tue, 14 Feb 2023 12:19:06 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxM-0004s3-N4; Tue, 14 Feb 2023 12:19:06 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGSc336rkz4x8C;
 Wed, 15 Feb 2023 04:18:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGSc04cCHz4x83;
 Wed, 15 Feb 2023 04:18:56 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 5/8] aspeed/smc: Replace SysBus IRQs with GPIO lines
Date: Tue, 14 Feb 2023 18:18:27 +0100
Message-Id: <20230214171830.681594-6-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
References: <20230214171830.681594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o2uqSQ4Msnhq

It's cleaner and removes the curious '+ 1' required to skip the DMA
IRQ line of the controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 2 +-
 hw/ssi/aspeed_smc.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..7c28546d7f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -293,7 +293,7 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
         qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
-        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
     }
 }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 22df4be528..7281169322 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1134,10 +1134,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* Setup cs_lines for peripherals */
     s->cs_lines = g_new0(qemu_irq, asc->cs_num_max);
-
-    for (i = 0; i < asc->cs_num_max; ++i) {
-        sysbus_init_irq(sbd, &s->cs_lines[i]);
-    }
+    qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", asc->cs_num_max);
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-- 
2.39.1

