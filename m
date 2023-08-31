Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5060410ejc;
        Thu, 31 Aug 2023 05:41:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJuYmX0LVpH1qMSMc/Vdvdkm4diujB354I4T8SCimSEgSvc/lYhsfqT89EBvAlj5Ldw9U9
X-Received: by 2002:a0c:a9c8:0:b0:651:7e3c:d2df with SMTP id c8-20020a0ca9c8000000b006517e3cd2dfmr2635423qvb.50.1693485701826;
        Thu, 31 Aug 2023 05:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693485701; cv=none;
        d=google.com; s=arc-20160816;
        b=gHiJelAKi7SYjM3aGz3kbvdtv5d8M3QNP0BgRu7rSvKrgTS7UJOx1tdDlqu9oP+pwF
         9wud8kL0MSWgjeX6jdsR5ABrXg6BdONtJqtgTMamrKYhmxyRObEsTcYvaJHujZobZ4S8
         KVqghlMuy1P6cknAJwzuKRbfisWUirVClsFo8pMkHun+ivP5myQ5GmoxDQTsBg0+jePa
         zLIjKQUBSm5mUSyijCOGkGRvID3LHdoQxHNvMPRzvEVUpV6pRmIgkRp41rIXKMphOqbs
         6UibJjZW80CkR57A5sPrI4mVa021gXHwBktJLjgV7X1v/iHBYkwzNw/QjH3VBBtHtA+D
         0LOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Avp/5P0nwxY/Baur77QCW3VoEe/3lYR3HKX9RkrPeu4=;
        fh=ZmtjI5NZxuQHscZb+jg+lKi3cobjdKea+DPcFuQLEQ8=;
        b=ArTopPLOYlxOJtwNmAWdv2+OJCiC+lrXy4350lkW7pK/eaRNruoeEcxvAKegs6EMjJ
         fIUCZnr0JwSYtaNNhSlpC94jDkIxV08SRuZX3/Xgx67S0oqMtidxgATAOLpHz6Vw+CYa
         K6JaYHdk6ZYZ+7pumPpIPQN0YlvxebgpQhCPJfu5ah/jf2hkZCJYMz69J0ZlXdQutUgt
         WSYpPdHDDTR2/20awognQ02WopttsoChMX40R4lE+RfzPtWC6FerDbaa4X8MvQEzM904
         Y69SoMcofwNHxGEoxIkER1YXE8hlSm17ZUtYNRlshIjvNsMFjDgfYkq5t+oJgOJhXPfb
         I+NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020a0ce384000000b0064c76596a6bsi805998qvl.117.2023.08.31.05.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbgxo-0007zK-8z; Thu, 31 Aug 2023 08:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxh-0007uG-C7; Thu, 31 Aug 2023 08:39:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxe-0008FT-Tn; Thu, 31 Aug 2023 08:39:48 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rc12S4nKMz4wxW;
 Thu, 31 Aug 2023 22:39:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc12Q2s4Sz4wZJ;
 Thu, 31 Aug 2023 22:39:42 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 5/7] aspeed: Create flash devices only when defaults are
 enabled
Date: Thu, 31 Aug 2023 14:39:20 +0200
Message-ID: <20230831123922.105200-6-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831123922.105200-1-clg@kaod.org>
References: <20230831123922.105200-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 1+kqNpJ/xt0+

When the -nodefaults option is set, flash devices should be created
with :

    -blockdev node-name=fmc0,driver=file,filename=./flash.img \
    -device mx66u51235f,cs=0x0,bus=ssi.0,drive=fmc0 \

To be noted that in this case, the ROM will not be installed and the
initial boot sequence (U-Boot loading) will fetch instructions using
SPI transactions which is significantly slower. That's exactly how HW
operates though.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cd92cf9ce0bb..271512ce5ced 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -396,12 +396,14 @@ static void aspeed_machine_init(MachineState *machine)
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
2.41.0

