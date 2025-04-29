Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp122613njm;
        Tue, 29 Apr 2025 02:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGLjQqf1aBfGps6Y+J/vL78jwqzCmyI7Nx+A+fQJR1fAFQgYAeAa//9MQvKI2S56sMYoACTmf1S4BZ6g==@linaro.org
X-Google-Smtp-Source: AGHT+IEEM0at68DU47UjRyDovcVjMiby46sZIV0SVqSDywEx8lE3A2BJTtNGGVxbf5LnFhIBegSP
X-Received: by 2002:a05:622a:2487:b0:476:923a:f1cb with SMTP id d75a77b69052e-4881567418fmr52627451cf.41.1745918495343;
        Tue, 29 Apr 2025 02:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745918495; cv=none;
        d=google.com; s=arc-20240605;
        b=OosOJ/aAImoJVxfKx8NjpniAggK0jEY1UdzEdElTzxz5NOA+/h6fbQ6ZJO7bzbgE5+
         uzsq37+m4Oh42Tv2yXjNT1PrxRCiga1UurJTFw7exLEjow+gIhMINQYMtiD43ptELE43
         uPeDL1hgbto7NkO1E0hdOZQ0u0+CbTG3MrCHEsqG9ypAka+Kj5KnV2nka92ABrxu8mMp
         LNYypcksCoFuflsfFa+hqtVRRjnZNAapZ7jLn+WDpeWknggmL0mc5EnAQP92eWA587wZ
         w0yUA/23tLwKQ2yX13NMwWUvIMnC59OOOP2oMV8STZIalKP7JFYk1+ataxoWZgq+aMDa
         HAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=B1giw9RSVARI80jdWC7wjiEKq7SUobN1xBYdnUDY0m0=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=IRxb3wyigTZG72F4fK3oA/BWFtEW4DkOUCNpS1V7CL2+3o5tqCvxsL2METQ2ZCfMoK
         QMwlaRIQwySNs04n3b2IMBPR85VQgSrv361ARUD83JkIZjdrPkoU8c5+ZCycNL1frJno
         eUvFwInhWyFGN2DUSNeUM6i1U1M2Tlszh/g6Q7DiO2BEyg7K/UNUS7dAiHoZXameGEzu
         dbnEbKuWm+GejJpIG3oVHf3PGGPO3qjKWMS4NJ8utsAEeB2ixkTkBeb9zw0zPtd3bxfJ
         iOk0XqsTuTf0nIQwz4p+37hDc4IIX0VL+bduG7yqpb2s9gHgUYV/6xuLX63zb3udvBSx
         YX+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1987083si120807941cf.243.2025.04.29.02.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 02:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9h7v-0005oQ-MN; Tue, 29 Apr 2025 05:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1u9h7t-0005jg-9O; Tue, 29 Apr 2025 05:19:41 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1u9h7r-0004Ff-6S; Tue, 29 Apr 2025 05:19:40 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 29 Apr
 2025 17:18:58 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 29 Apr 2025 17:18:58 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v3 9/9] docs: Add support for ast2700fc machine
Date: Tue, 29 Apr 2025 17:18:53 +0800
Message-ID: <20250429091855.1948374-10-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429091855.1948374-1-steven_lee@aspeedtech.com>
References: <20250429091855.1948374-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P3HOpKK9TIwg

- Updated Aspeed family boards list to include `ast2700fc`.
- Added boot instructions for the `ast2700fc` machine.
- Detailed the configuration and loading of firmware for the
  Cortex-A35 and Cortex-M4 processors.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I48d90589d29ae6bb70a172e1798f18c0c38e6e22
---
 docs/system/arm/aspeed.rst | 61 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 97fd6a0e7f..160472411f 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,5 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
-==================================================================================================================================================================================================================================================================================================================================================================================================================
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``ast2700fc``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+=================================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
@@ -42,6 +42,7 @@ AST2600 SoC based machines :
 AST2700 SoC based machines :
 
 - ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
+- ``ast2700fc``            Aspeed AST2700 Evaluation board (Cortex-A35 + Cortex-M4)
 
 Supported devices
 -----------------
@@ -270,6 +271,62 @@ Boot the AST2700 machine from the flash image, use an MTD drive :
        -drive file=${IMGDIR}/image-bmc,format=raw,if=mtd \
        -nographic
 
+Booting the ast2700fc machine
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+AST2700 features four Cortex-A35 primary processors and two Cortex-M4 coprocessors.
+**ast2700-evb** machine focuses on emulating the four Cortex-A35 primary processors,
+**ast2700fc** machine extends **ast2700-evb** by adding support for the two Cortex-M4 coprocessors.
+
+To boot the AST2700 full-core machine, follow these steps:
+
+  1. Configure an MTD drive for the four Cortex-A35 primary processors.
+  2. Load:
+
+   - SSP (Secondary Service Processor) firmware on CPU 5 (``cpu-num=4``).
+   - TSP (Tertiary Service Processor) firmware on CPU 6 (``cpu-num=5``).
+
+.. code-block:: bash
+
+  IMGDIR=ast2700-default
+  UBOOT_SIZE=$(stat --format=%s -L ${IMGDIR}/u-boot-nodtb.bin)
+
+  $ qemu-system-aarch64 -M ast2700fc \
+       -device loader,force-raw=on,addr=0x400000000,file=${IMGDIR}/u-boot-nodtb.bin \
+       -device loader,force-raw=on,addr=$((0x400000000 + ${UBOOT_SIZE})),file=${IMGDIR}/u-boot.dtb \
+       -device loader,force-raw=on,addr=0x430000000,file=${IMGDIR}/bl31.bin \
+       -device loader,force-raw=on,addr=0x430080000,file=${IMGDIR}/tee-raw.bin \
+       -device loader,cpu-num=0,addr=0x430000000 \
+       -device loader,cpu-num=1,addr=0x430000000 \
+       -device loader,cpu-num=2,addr=0x430000000 \
+       -device loader,cpu-num=3,addr=0x430000000 \
+       -drive file=${IMGDIR}/image-bmc,if=mtd,format=raw \
+       -device loader,file=${IMGDIR}/ast2700-ssp.elf,cpu-num=4 \
+       -device loader,file=${IMGDIR}/ast2700-tsp.elf,cpu-num=5 \
+       -serial pty -serial pty -serial pty \
+       -snapshot \
+       -S -nographic
+
+After starting QEMU, the serial devices will be redirected:
+
+.. code-block:: bash
+
+   char device redirected to /dev/pts/55 (label serial0)
+   char device redirected to /dev/pts/56 (label serial1)
+   char device redirected to /dev/pts/57 (label serial2)
+
+
+
+`serial0` is the console for the four Cortex-A35 primary processors, `serial1` and `serial2` are the consoles for the two Cortex-M4 coprocessors.
+To connect to the console, use `tio` or other terminal emulator:
+
+.. code-block:: bash
+
+   $ tio /dev/pts/55
+   $ tio /dev/pts/56
+   $ tio /dev/pts/57
+
+
 Aspeed minibmc family boards (``ast1030-evb``)
 ==================================================================
 
-- 
2.34.1

