Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1025307lfh;
        Wed, 25 May 2022 09:10:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw12PtC6gwDOCtNgAsnUVke3LZ3NMZQXcYgiHyrOGaAga475dJ34wLuu0Zxh+OoIHvM5eiZ
X-Received: by 2002:a67:e154:0:b0:337:e26a:c216 with SMTP id o20-20020a67e154000000b00337e26ac216mr1862139vsl.71.1653495047653;
        Wed, 25 May 2022 09:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495047; cv=none;
        d=google.com; s=arc-20160816;
        b=fM9+m6hl5rlG1Vy02RLoJL0m+i01fWgLaGZGlOErYkHmPZjocu3LV4kjOv7/dJQwpv
         a4iDjR6OdKHsGztJsxGdh1iA0KSpS3dDYyv+M37+l8BXk9lL7c2mAt/+g2Ps00yWNh+F
         W1wSqtLlK8kNMAk0DNU6GFVmXAUNHlGAWOIAWFTCAK6imj1FOIo4vvnWQN8AtwSzut8v
         Z1UYMl5hZVVXxpbXsZ3hzTrVQncTkb51dqq1yrRoc4NCsCO+/jShecW+094VIiGXSi7/
         g04FH1bp5yMG9boZv2cRmlw/BkHkaAPH6FZRSi0WLlrDgLnYgDf02XQYDSS2h3GGW75I
         UYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=f/YlY+imtyN4ledA28EV4IxWHSSs54SGKAA719OT3Ks=;
        b=0c34W6AmdlUvX28oJWGxKeO9zr4DrY86VtoAPcxgs2am6RAUmgQWCUl2jW0LlGfIlb
         ru2wGLqnvZV6CaMt0eE83/sw+BOOiJsw/DUhSiZLSEtfnEPwjIJcOUFjcqZDsEKBx2ra
         Z8eEbveyBXZPvRauqpnbfx+zho+qM7+PZAgLoslE7juJGQzd0hRq3H2CBtvhRYp1q4zC
         7o5iRthDsc/cYsUFr93FgmyDmgsrjN4v1HhGUG4F4tcI6M1jsJqaSTb+b4370wdFL6iZ
         kUdQDilSbY/gnNAxRkEm/SYUkHRCUMa8hVMTpOq6QVFV7gXSIjg5mCRtvFqv7G/WI1fH
         dQfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25-20020a67f319000000b00337b55aee2bsi324506vsf.175.2022.05.25.09.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttax-00063n-5F
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSM-00073E-Kg; Wed, 25 May 2022 12:01:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSK-00048Y-JO; Wed, 25 May 2022 12:01:54 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRF2d46z4xDK;
 Thu, 26 May 2022 02:01:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRC26Bhz4xXj;
 Thu, 26 May 2022 02:01:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/15] docs: add minibmc section in aspeed document
Date: Wed, 25 May 2022 18:01:22 +0200
Message-Id: <20220525160136.556277-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
X-TUID: yk1F0b3jrqJo

From: Jamin Lin <jamin_lin@aspeedtech.com>

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220506031521.13254-2-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 60ed94f18759..6f2e4fb53d49 100644
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
2.35.3

