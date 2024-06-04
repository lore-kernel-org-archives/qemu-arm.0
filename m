Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718041ejs;
        Mon, 3 Jun 2024 22:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqsbyS1DFNdqIU6MQNH8EzRtbXelaROP42eS36XM+K1zDusqdEQx0cYdcnsj77rmrsZ2P095CJRBWFVRTirCAOeLm0Ko8o
X-Google-Smtp-Source: AGHT+IGLGNd5LuxSDYZULMB/Mpn0LwZM5STf9dCO8JTG/AZJ9QB9VJqjqYCTrBL4WaP0GsZCcPxi
X-Received: by 2002:a05:6102:354a:b0:48b:a957:ecdc with SMTP id ada2fe7eead31-48bc23b217dmr11202687137.32.1717480029861;
        Mon, 03 Jun 2024 22:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480029; cv=none;
        d=google.com; s=arc-20160816;
        b=xozFSSG1f1qznn5bZQaB4kN0GS8rXtNqcWY1CkBQ3qhuOhsX/mPZTD0pteh3FMzxzW
         oB7G+OYcezh7fJGENmRy9cDAD9u0ealtmdBNG58DIZwxGyLbKXakDo5xlP5CVP7KtyX7
         kFi5o/ywSpJlLUlkOlUFVhbxNRrGZpVFApI2+9GyvhFEn2D62iw34ZcKwx/oMvXSdHX6
         vjKEJT7FVsOdREJrobgUTd+8KBQycHKXTm2D51A7K1emydPp3/ujU25SVHON0IjuoKZ9
         Y/v22m4MBPLaY/jm05uGMnpF6PAMQqgXSVAqi2cIn17Voa0ljWthRIALXiauJHMITmN6
         //vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=SlNV3UmTswHYEZMXyH1Mq0y5Yl+gvzeUggoEwDFmsqM=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=h+0GikP7qpLQK5mVzn2g/3orncUjlSbwvcI0+WjRmkGxW3clGLVXR8L8X8pAc59iju
         P2HvmvQe/OP+hsBbDka0FIaJLbTGb0ZHLV0Lntub8SbCvdvdDBPFXXXtg91Ba0WlPLN5
         /Nng12lOp7W6EMHCZo86mBCcJ85F7hYaTDIyc6DozFRln1dmC7iTIlRJpHSfhYlJ9abO
         Sq/YHB2SG1qpu66Pbm11l9YsUH7HpA/Glhxy8KjjeoG5uq5o2MLAkJcFxFpwwg8rWXvj
         h7XmEY+H5rZ69bIC3UVlx0uD8JoyRTVFckLHGOMxYFVyHnIHWCen/fbMbmikQ7jnN97b
         ysaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f059b3si992468385a.113.2024.06.03.22.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEN0J-0007LG-1M; Tue, 04 Jun 2024 01:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMzo-0006su-9K; Tue, 04 Jun 2024 01:46:11 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMzm-0000aq-Ib; Tue, 04 Jun 2024 01:46:08 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:48 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:48 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v5 17/17] docs:aspeed: Add AST2700 Evaluation board
Date: Tue, 4 Jun 2024 13:44:38 +0800
Message-ID: <20240604054438.3424349-18-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: haDjaDaP7Yfd

Add AST2700 Evaluation board and its boot command.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 39 ++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b2dea54eed..cd9559e3e2 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,11 +1,12 @@
-Aspeed family boards (``*-bmc``, ``ast2500-evb``, ``ast2600-evb``)
-==================================================================
+Aspeed family boards (``*-bmc``, ``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``)
+===================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
 Aspeed SoC : the AST2400 integrating an ARM926EJ-S CPU (400MHz), the
-AST2500 with an ARM1176JZS CPU (800MHz) and more recently the AST2600
-with dual cores ARM Cortex-A7 CPUs (1.2GHz).
+AST2500 with an ARM1176JZS CPU (800MHz), the AST2600
+with dual cores ARM Cortex-A7 CPUs (1.2GHz) and more recently the AST2700
+with quad cores ARM Cortex-A35 64 bits CPUs (1.6GHz)
 
 The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
 etc.
@@ -38,6 +39,10 @@ AST2600 SoC based machines :
 - ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
 - ``qcom-firework-bmc``    Qualcomm Firework BMC
 
+AST2700 SoC based machines :
+
+- ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
+
 Supported devices
 -----------------
 
@@ -66,6 +71,7 @@ Supported devices
  * eMMC Boot Controller (dummy)
  * PECI Controller (minimal)
  * I3C Controller
+ * Internal Bridge Controller (SLI dummy)
 
 
 Missing devices
@@ -95,6 +101,10 @@ or directly from the OpenBMC GitHub release repository :
 
    https://github.com/openbmc/openbmc/releases
 
+or directly from the ASPEED Forked OpenBMC GitHub release repository :
+
+   https://github.com/AspeedTech-BMC/openbmc/releases
+
 To boot a kernel directly from a Linux build tree:
 
 .. code-block:: bash
@@ -164,6 +174,27 @@ under Linux), use :
 
   -M ast2500-evb,bmc-console=uart3
 
+
+Boot the AST2700 machine from the flash image, use an MTD drive :
+
+.. code-block:: bash
+
+  IMGDIR=ast2700-default
+  UBOOT_SIZE=$(stat --format=%s -L ${IMGDIR}/u-boot-nodtb.bin)
+
+  $ qemu-system-aarch64 -M ast2700-evb \
+       -device loader,force-raw=on,addr=0x400000000,file=${IMGDIR}/u-boot-nodtb.bin \
+       -device loader,force-raw=on,addr=$((0x400000000 + ${UBOOT_SIZE})),file=${IMGDIR}/u-boot.dtb \
+       -device loader,force-raw=on,addr=0x430000000,file=${IMGDIR}/bl31.bin \
+       -device loader,force-raw=on,addr=0x430080000,file=${IMGDIR}/optee/tee-raw.bin \
+       -device loader,cpu-num=0,addr=0x430000000 \
+       -device loader,cpu-num=1,addr=0x430000000 \
+       -device loader,cpu-num=2,addr=0x430000000 \
+       -device loader,cpu-num=3,addr=0x430000000 \
+       -smp 4 \
+       -drive file=${IMGDIR}/image-bmc,format=raw,if=mtd \
+       -nographic
+
 Aspeed minibmc family boards (``ast1030-evb``)
 ==================================================================
 
-- 
2.25.1

