Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3532979njd;
        Thu, 24 Apr 2025 00:53:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7XFrBLKylPEjlnM1ixkzo8MCs2UVeW+5y/B5eyITJLkC+II+afaxUDrJZDu+FhoNxCoRHs9tJmMfuuw==@linaro.org
X-Google-Smtp-Source: AGHT+IGHOzGSeeyBF9imcEbn6HwDhXDk+1OLMDU96wHkY9B9uRpLVUIiq1uJXbx6ohpKV1UL9M78
X-Received: by 2002:a05:620a:30c:b0:7c5:3c69:2bd2 with SMTP id af79cd13be357-7c9585e5029mr190681085a.13.1745481182382;
        Thu, 24 Apr 2025 00:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745481182; cv=none;
        d=google.com; s=arc-20240605;
        b=Obl1KMnw370nc1IB+2Z5hS3ZlbFFAQ7be8FYns3eoKFmU57iMWBwzwcuzj2mGzVucd
         BhIEjoH/IOQszA09jI08+1cmPPifcE3Pvs8uzqjd/jPsUvEOOpjvoumFMdiIYgpyloKP
         XacUqmDRzl842gma68nDPxO+Z+6Ivhq5Jm5QVmrUrdpO6s6nsfMIvMkbZIfbWN4UxsWA
         z9NLWR76VWubtPlrGLq5vJAB0XmnEHCHLkv1IENKZNOgyBn3NfwfwD++peowF65pVpp3
         xlL679hjTJLhxAWNPz5sPXj5mOwd5i+g9QzByeCX71aojQQ7dgP5jYVBGAgwVVtNlSp4
         I4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=tXrVP6KY/sKsEcL5xHhErLgMEDr7pghz1glM5Vwkt98=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=ahNPyr5cb0c4BEXg2e/uWQ0A5kxZH0dlLkFJhjvVEaMVdNP/r7QxyFZUbeafJUGDj3
         G4A0MiX5hztDBBu2ZZZeEbpg2ybR2aHaiRrnRD75L41B7368vzBmmzBZHdHbtT0lN5o+
         stroS9rBmQ55GRt632OvEIxW/BGvnFCGhaY51A9xwPf6kgQQ2F2jAoc5LOwy0kfb4A3z
         8eqRSQ5388T78siCeGBw3bDpRT76re+k1pqrrYFtsyg8KATpTVYUGLH3H70TILWxS849
         WxpB+1NQezrijKfkx79rPXLSByyV48zxa3lQDZZyhI9xm/FMM/j0B0ezKYqyb+LfLCYP
         wZMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958c9e2f8si79883985a.49.2025.04.24.00.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Apr 2025 00:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7rNO-0001QT-94; Thu, 24 Apr 2025 03:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rNM-0001Oq-5M; Thu, 24 Apr 2025 03:52:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rNK-0006ez-9n; Thu, 24 Apr 2025 03:52:03 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Apr
 2025 15:51:37 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 24 Apr 2025 15:51:37 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v6 5/6] docs/system/arm/aspeed: move AST2700 content to new
 section
Date: Thu, 24 Apr 2025 15:51:33 +0800
Message-ID: <20250424075135.3715128-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
References: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3plBXikM8zk5

Moved AST2700-related content from the general Aspeed board list into a
dedicated section for Aspeed 2700 family boards. Improves clarity and
readability.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 docs/system/arm/aspeed.rst | 70 ++++++++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 97fd6a0e7f..08a33b7008 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,12 +1,11 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
 ==================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
 Aspeed SoC : the AST2400 integrating an ARM926EJ-S CPU (400MHz), the
 AST2500 with an ARM1176JZS CPU (800MHz), the AST2600
-with dual cores ARM Cortex-A7 CPUs (1.2GHz) and more recently the AST2700
-with quad cores ARM Cortex-A35 64 bits CPUs (1.6GHz)
+with dual cores ARM Cortex-A7 CPUs (1.2GHz).
 
 The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
 etc.
@@ -39,10 +38,6 @@ AST2600 SoC based machines :
 - ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
 - ``qcom-firework-bmc``    Qualcomm Firework BMC
 
-AST2700 SoC based machines :
-
-- ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
-
 Supported devices
 -----------------
 
@@ -247,6 +242,67 @@ under Linux), use :
 
   -M ast2500-evb,bmc-console=uart3
 
+Aspeed 2700 family boards (``ast2700-evb``)
+==================================================================
+
+The QEMU Aspeed machines model BMCs of Aspeed evaluation boards.
+They are based on different releases of the Aspeed SoC :
+the AST2700 with quad cores ARM Cortex-A35 64 bits CPUs (1.6GHz).
+
+The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
+etc.
+
+AST2700 SoC based machines :
+
+- ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
+
+Supported devices
+-----------------
+ * Interrupt Controller
+ * Timer Controller
+ * RTC Controller
+ * I2C Controller
+ * System Control Unit (SCU)
+ * SRAM mapping
+ * X-DMA Controller (basic interface)
+ * Static Memory Controller (SMC or FMC) - Only SPI Flash support
+ * SPI Memory Controller
+ * USB 2.0 Controller
+ * SD/MMC storage controllers
+ * SDRAM controller (dummy interface for basic settings and training)
+ * Watchdog Controller
+ * GPIO Controller (Master only)
+ * UART
+ * Ethernet controllers
+ * Front LEDs (PCA9552 on I2C bus)
+ * LPC Peripheral Controller (a subset of subdevices are supported)
+ * Hash/Crypto Engine (HACE) - Hash support only. TODO: Crypto
+ * ADC
+ * eMMC Boot Controller (dummy)
+ * PECI Controller (minimal)
+ * I3C Controller
+ * Internal Bridge Controller (SLI dummy)
+
+Missing devices
+---------------
+ * Coprocessor support
+ * PWM and Fan Controller
+ * Slave GPIO Controller
+ * Super I/O Controller
+ * PCI-Express 1 Controller
+ * Graphic Display Controller
+ * MCTP Controller
+ * Mailbox Controller
+ * Virtual UART
+ * eSPI Controller
+
+Boot options
+------------
+
+Images can be downloaded from the ASPEED Forked OpenBMC GitHub release repository :
+
+   https://github.com/AspeedTech-BMC/openbmc/releases
+
 Booting the ast2700-evb machine
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.43.0

