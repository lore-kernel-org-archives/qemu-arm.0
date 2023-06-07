Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp4846ejb;
        Tue, 6 Jun 2023 21:43:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sHO50xBnFfjQqcnaLfzB0OlN77umK6vPMYKj1FhC4Y1pW5hc8Dl/oEbNQFxXsiTA6g4d/
X-Received: by 2002:a05:622a:58a:b0:3e6:2bba:87f3 with SMTP id c10-20020a05622a058a00b003e62bba87f3mr1854824qtb.47.1686113019873;
        Tue, 06 Jun 2023 21:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686113019; cv=none;
        d=google.com; s=arc-20160816;
        b=xYRIZCrPi0TqV/tqDFfrn4FzKdWP1hDvg072+vBCVBkk97Jv9sxdMGDWtRCsqo7Ma9
         NWkiYPV5BXc34KrEI+r21lagwbvxPHR3fRIIzj8gJyfduMvi5RbwwWhPdxjVLB8ftd99
         SJwggvoyyDeaw+drzbLII2QoL0v2Ngm98m8BuM+W8xPq0eyec/nbKLhRLai65/dMM06x
         lAlbVe/yl4gHt5tltm7yVgzs+6LnRT9Nlz+tyCMCfMytSYzIONxahJR00Vuv4Mjp/H00
         rSUQkl+fCZeRlxnbSuzr6+5aZtt9YsPaMVFUdUKC+bnVoTqumMdA5tYUZ5TO7PC9iaAW
         hnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4rvC4XZKKkqLQMinSknxgw8pXMBbfDKa7X9vDC+wi2k=;
        b=RHSYlefv+B8xIbBkJRHiXPNAiqB8VcGknDqO0W0FuNPsRodcSEWk0/LYbgKYvRUvxt
         +z5rRgcvd1vYnw8vuutBShhY+zxiYmovcyQbpKB1HFoDsf8vki5r2YlbgYSSzd9dQLeL
         WEaSDTDbPM53PKxDDsoIBKnH0m+dtLVvgf4TS3SBLjmq8N6pz67ibPK0emapRNdWbjD6
         PhpsFEX0xg2o6mr/TSNzQypWl2xcvZxdr2SWEDkqIfrjcS2HHSQLPFnsG/qE/M9uasXa
         sNzTvEURAo5auT2UVXvPO8Qh3l667JsH2LaCWBnABl5F3ZKEOUbK+0YA2LWjj4v0/MqC
         RxAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020ac87e94000000b003f491be1a76si7285490qtj.774.2023.06.06.21.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 21:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6kyN-0001sQ-Gl; Wed, 07 Jun 2023 00:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kyF-0001q7-5G; Wed, 07 Jun 2023 00:40:32 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kyC-0003rP-4q; Wed, 07 Jun 2023 00:40:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQd2Rdnz4x4B;
 Wed,  7 Jun 2023 14:40:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQZ5fhMz4x41;
 Wed,  7 Jun 2023 14:40:22 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 08/12] aspeed: Create flash devices only when defaults are
 enabled
Date: Wed,  7 Jun 2023 06:39:39 +0200
Message-Id: <20230607043943.1837186-9-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607043943.1837186-1-clg@kaod.org>
References: <20230607043943.1837186-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: OxEk7BRz3Msm

When the -nodefaults option is set, flash devices should be created
with :

    -blockdev node-name=fmc0,driver=file,filename=./flash.img \
    -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0 \

To be noted that in this case, the ROM will not be installed and the
initial boot sequence (U-Boot loading) will fetch instructions using
SPI transactions which is significantly slower. That's exactly how HW
operates though.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e5a49bb0b1a7..efc112ca37b0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -387,12 +387,14 @@ static void aspeed_machine_init(MachineState *machine)
     connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc,
+    if (defaults_enabled()) {
+        aspeed_board_init_flashes(&bmc->soc.fmc,
                               bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
                               amc->num_cs, 0);
-    aspeed_board_init_flashes(&bmc->soc.spi[0],
+        aspeed_board_init_flashes(&bmc->soc.spi[0],
                               bmc->spi_model ? bmc->spi_model : amc->spi_model,
                               1, amc->num_cs);
+    }
 
     if (machine->kernel_filename && sc->num_cpus > 1) {
         /* With no u-boot we must set up a boot stub for the secondary CPU */
-- 
2.40.1

