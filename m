Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1512547lfj;
        Thu, 5 May 2022 20:16:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuYC/I8mncN2ji2uUZ3sm8Mel54HQD/nOxDTiu4vvwPYOkddEzVxlsGZbTdhPuuMi1kuG9
X-Received: by 2002:a05:622a:309:b0:2f3:b965:f1d with SMTP id q9-20020a05622a030900b002f3b9650f1dmr1075911qtw.314.1651807000119;
        Thu, 05 May 2022 20:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651807000; cv=none;
        d=google.com; s=arc-20160816;
        b=mPCuFfl0uFGD+W7OmZSUOz3Yv7KFfzxeZH13X2K+tRcG9yVG5J0VVwvXwJNfUt8Qz9
         LkKV+C+dE2vFuIdGPmJB/t9eXCHVj7SFLGeyN8RNujRgHGE1PBunrto/oOKRdce1KsQb
         khaoLr6I68D3vQwPi6W4a9Va28zELZFFtCk6xZEJVTJjub9GnRpJH2xZiG/burpSmj0E
         F6ESqWHSyFgqqdalKTszRY12YYQuEGgEbT7hvmmJuFtgdVcjJfzj+ab7QqWugaYO25Jy
         F5nDnx0QHMzgBGkX5GyHKe2cAU10moGhX+SodEQp8Qupn9Z70lOpt3PxZ345bIA2shEN
         6aAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from;
        bh=Y3vOAO0zXWXvnPSNEPPX08mQgDhVClF/sgwB2hhX31M=;
        b=h7kcvS2pW516IC8K6FxCuCfRhmH1Uvi5gzNF7chldZsjk9w1OKc3Er531/XRX/Fsx1
         c+VIOrLYczpFEULCWbtm8n7uHw0CQiE8hcykERDXpHnNQwspO+ShjtnhvcofpvQ2X6ov
         5mPsq/raYkSkFhETn9dBNR6ALbNUOH0Le6zp/4hWb4gAHO6zgwSR9r2FML9CA668qapD
         dmnoAt5KA/3ids7Qxc9Vece+vI5EMgbDUNJs1RbWdWHxa0yeKr/uyIZdqVWGf6aVUBdE
         F6JKDvimmHr7JT45AakiFPJo4DHZzQShaaijo3eolwPisxUVccv2c5MUZQbFU/gsg3q2
         1E8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a37dc06000000b0069fb40e49a3si1813360qki.217.2022.05.05.20.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 20:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmoSN-0007O6-KQ
	for alex.bennee@linaro.org; Thu, 05 May 2022 23:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nmoSC-0007La-IM; Thu, 05 May 2022 23:16:28 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:40033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nmoS9-00073w-T7; Thu, 05 May 2022 23:16:27 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24632OOh041963;
 Fri, 6 May 2022 11:02:24 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 6 May
 2022 11:15:22 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v1 1/1] docs: add minibmc section in aspeed document
Date: Fri, 6 May 2022 11:15:21 +0800
Message-ID: <20220506031521.13254-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506031521.13254-1-jamin_lin@aspeedtech.com>
References: <20220506031521.13254-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24632OOh041963
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MVVnQ3yeWJ4z

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 docs/system/arm/aspeed.rst | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 60ed94f187..6f2e4fb53d 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -120,3 +120,64 @@ FMC chip and a bigger (64M) SPI chip, use :
 .. code-block:: bash
 
   -M ast2500-evb,fmc-model=mx25l25635e,spi-model=mx66u51235f
+
+
+Aspeed minibmc family boards (``ast1030-evb``)
+==================================================================
+
+The QEMU Aspeed machines model mini BMCs of various Aspeed evaluation
+boards. They are based on different releases of the
+Aspeed SoC : the AST1030 integrating an ARM Cortex M4F CPU (200MHz).
+
+The SoC comes with SRAM, SPI, I2C, etc.
+
+AST1030 SoC based machines :
+
+- ``ast1030-evb``          Aspeed AST1030 Evaluation board (Cortex-M4F)
+
+Supported devices
+-----------------
+
+ * SMP (for the AST1030 Cortex-M4F)
+ * Interrupt Controller (VIC)
+ * Timer Controller
+ * I2C Controller
+ * System Control Unit (SCU)
+ * SRAM mapping
+ * Static Memory Controller (SMC or FMC) - Only SPI Flash support
+ * SPI Memory Controller
+ * USB 2.0 Controller
+ * Watchdog Controller
+ * GPIO Controller (Master only)
+ * UART
+ * LPC Peripheral Controller (a subset of subdevices are supported)
+ * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
+ * ADC
+
+
+Missing devices
+---------------
+
+ * PWM and Fan Controller
+ * Slave GPIO Controller
+ * PECI Controller
+ * Mailbox Controller
+ * Virtual UART
+ * eSPI Controller
+ * I3C Controller
+
+Boot options
+------------
+
+The Aspeed machines can be started using the ``-kernel`` to load a
+Zephyr OS or from a firmware. Images can be downloaded from the
+ASPEED GitHub release repository :
+
+   https://github.com/AspeedTech-BMC/zephyr/releases
+
+To boot a kernel directly from a Zephyr build tree:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M ast1030-evb -nographic \
+        -kernel zephyr.elf
-- 
2.17.1

