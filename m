Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1884314ejq;
        Mon, 8 May 2023 01:00:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ41vWcpI6jWP7C4/mrOhrqCI6PyPOTcZncwuPSq3VL9BAxLHFkUFTUV6b1aNBBSHg4arvFN
X-Received: by 2002:a05:6214:20a5:b0:5fd:7701:88c5 with SMTP id 5-20020a05621420a500b005fd770188c5mr10380321qvd.6.1683532849443;
        Mon, 08 May 2023 01:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532849; cv=none;
        d=google.com; s=arc-20160816;
        b=OdhDeH/drJd7V8CU1TKpCBnnNcjbCNnHwhPeOr2yCkoz7RRz7kALxbeLp/uev06RsG
         ySahE4VqLcmzjgybDLdAikfPnqjBH4KhZY5jFkDV5b2jBIAwoy4Av/l3sXdPkQJ8ucLr
         7f20FTYypDK8luK2pfbtX6GWXn8Dxe7Z+sVvACLMOHbk4lAKR7b0sd63NpoW1hSynvi+
         wELMOSUNLY+xzB3rmIb6pJMKi6H8mL90QCmYfo3BV0S6bRjVVQ0qry1eGGQ7dz0ShARd
         eE7JAYJBvD/aIKStd1Y1ZR/yKlt2lOUcytg9Za6JGqQUr2zC4OHsGfA04hs8r7w5dP/T
         IzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=nybtdIEjeOy99ymTtI/4laYoxxFoDx3enp/zcygKTjc=;
        b=p0pueyVO/Ctz/v40CjBr05opJMx9Qw77ROy7rjJdlsat/58yrSxixT98E9Ajp19coJ
         JZFmGnJn3dIT/ePdERik6cFH4cizCIU9ULST5UO8fks/dR4ejb5OKBK6jHdWIKdQyr7I
         d7mABuYFIn3rDyB9BZBnryUTltxVhyHvgLaublNQjEjj187R91pr48q1WGHSe0B657GR
         Br5+QfAQ+7wMDW47KaSmgyB0HtE8qtQbrAmG7ZzhzphIJsGy91J9qlyCTXK2gNxweBui
         l434LEjgbAZTBvU0obMc8IDl44gtxSXeeT8tweFEPN5WZ29B3e7cpnb07DvKOYxJz76H
         TobA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05620a13ae00b0074e325175aasi2737939qki.393.2023.05.08.01.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:00:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvvmk-0008BG-8b; Mon, 08 May 2023 03:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmT-00082N-Np; Mon, 08 May 2023 03:59:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmS-0001Al-0O; Mon, 08 May 2023 03:59:37 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDGF2BRBz4x44;
 Mon,  8 May 2023 17:59:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDGC0yPCz4x48;
 Mon,  8 May 2023 17:59:30 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 08/12] aspeed: Create flash devices only when defaults are
 enabled
Date: Mon,  8 May 2023 09:58:55 +0200
Message-Id: <20230508075859.3326566-9-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: 1lJbtNBbKJWI

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
index 9a15899cbc..a8832c0072 100644
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
2.40.0

