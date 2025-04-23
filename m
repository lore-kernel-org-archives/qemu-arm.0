Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2858828njd;
        Wed, 23 Apr 2025 00:26:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqEY6HsRDHIiojlxoXd2VmyIdXHdGreo54V4juDDsY4LLJF/fYH+bQmjV2cG4JOsYPtpi7EfVeNfCuUw==@linaro.org
X-Google-Smtp-Source: AGHT+IFZbk0wZLJWq+p3aXUSGEfaPMv0LwbsKtqV4kZCB5BuoLL5006db5HyNVyzbplDIvya2xSY
X-Received: by 2002:a05:620a:1aa6:b0:7c5:e3ad:fa19 with SMTP id af79cd13be357-7c927f9a090mr2412416385a.16.1745393178018;
        Wed, 23 Apr 2025 00:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745393178; cv=none;
        d=google.com; s=arc-20240605;
        b=GTl6cepm3pCncxS5iTp3enSQdNBd7H5fX33VFIoSCy9Mo10nV0XXEPyHkYuk/tvhkK
         rwQNIe3Xc/Uijoa5SOhe7apocc4S2d+SdYfW3yaAZjFLFw1M6AK+h3Pp8ttEOzXmkcUr
         sQsXBIJ0D/6ZBQVs3Ema/n1AJk7LIaVY/TdXJXUE5alMAmjy+3wZHNpuaCDqdlZ4G4BJ
         zTSFkYajWJewjG9rMlsWyWrXVBJLiAV8AQpspfAYyvY/VLyP4TUrfeFyCN3bPtkPOGw7
         IsDpUhaBKNHJvheBy2vj0BMb2p2kE5HyjWGyVXoXwqbD4lkSRPQ/ff6C++BihFAvV8Go
         UOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=haOzF8pY/PNnBIkbbdpPg8F4e8uhbqZE92yLoxRVANE=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=C+Ll6k3LlbLzmsRlyUSSMshOAMtU/aq4Rc1aLVS/ntEw+9Wxz+goZH4JZkEyGNPnUh
         IYZ3yqSA1PiyfNe3H2buSBPqdKTccIO0YzUfl/3qs2I5Q2cijwN9196acLN6HuqbwQah
         6b8hx/uVf1jNoD9MAR1fazSRthseaRxJEakg0rmQbm31lmMpvQkE61hr2S4bN1pz4wV8
         VZyd2IDPEomocgpHUSrgi4MXKWKbVNSrSbg1GDlpKAYVCGAA+YQFQsozCG3GwK2lCagd
         EQBDSGlqwk+36/iVSSJAq2KDZ/7VokbyzoibzJOjmqhh60b2DvOwmQqUnwYkdbrWthFi
         Bu4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925addbb5si1288907285a.190.2025.04.23.00.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 00:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7UTZ-0002u5-R7; Wed, 23 Apr 2025 03:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7UTV-0002si-HX; Wed, 23 Apr 2025 03:24:53 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7UTS-0001Ov-HW; Wed, 23 Apr 2025 03:24:52 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 15:23:54 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 23 Apr 2025 15:23:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v5 11/11] docs/system/arm/aspeed: Support vbootrom for AST2700
Date: Wed, 23 Apr 2025 15:23:47 +0800
Message-ID: <20250423072350.541742-12-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
References: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
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
X-TUID: 1fvTpNi+P+LX

Using the vbootrom image support and the boot ROM binary is
now passed via the -bios option, using the image located in
pc-bios/ast27x0_bootrom.bin.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
---
 docs/system/arm/aspeed.rst | 96 +++++++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 97fd6a0e7f..e15e276a48 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,4 +1,4 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
 ==================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
@@ -39,10 +39,6 @@ AST2600 SoC based machines :
 - ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
 - ``qcom-firework-bmc``    Qualcomm Firework BMC
 
-AST2700 SoC based machines :
-
-- ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
-
 Supported devices
 -----------------
 
@@ -247,10 +243,78 @@ under Linux), use :
 
   -M ast2500-evb,bmc-console=uart3
 
+Aspeed 2700 family boards (``ast2700-evb``)
+==================================================================
+
+The QEMU Aspeed machines model BMCs of Aspeed evaluation boards.
+They are based on different releases of the Aspeed SoC :
+the AST2700 with quad cores ARM Cortex-A35 64 bits CPUs (1.6GHz)
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
 
-Boot the AST2700 machine from the flash image, use an MTD drive :
+Boot the AST2700 machine from the flash image.
+
+There are two supported methods for booting the AST2700 machine with a flash image:
+
+Manual boot using ``-device loader``:
+
+It causes all 4 CPU cores to start execution from address ``0x430000000``, which
+corresponds to the BL31 image load address.
 
 .. code-block:: bash
 
@@ -270,6 +334,26 @@ Boot the AST2700 machine from the flash image, use an MTD drive :
        -drive file=${IMGDIR}/image-bmc,format=raw,if=mtd \
        -nographic
 
+Boot using a virtual boot ROM (``-bios``):
+
+If users do not specify the ``-bios option``, QEMU will attempt to load the
+default vbootrom image ``ast27x0_bootrom.bin`` from either the current working
+directory or the ``pc-bios`` directory within the QEMU source tree.
+
+.. code-block:: bash
+
+  $ qemu-system-aarch64 -M ast2700-evb \
+      -drive file=image-bmc,format=raw,if=mtd \
+      -nographic
+
+The ``-bios`` option allows users to specify a custom path for the vbootrom
+image to be loaded during boot. This will load the vbootrom image from the
+specified path in the ${HOME} directory.
+
+.. code-block:: bash
+
+  -bios ${HOME}/ast27x0_bootrom.bin
+
 Aspeed minibmc family boards (``ast1030-evb``)
 ==================================================================
 
-- 
2.43.0

