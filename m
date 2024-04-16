Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp246190ejd;
        Tue, 16 Apr 2024 02:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWDEIACDAEJp+y/+1CjlkoY9PEr53I3piBODzj0rDLIh49wQ28Fai9p8JESfiSsxeZF+itDXL+MRkmbxKt+oG41XTfyGTj
X-Google-Smtp-Source: AGHT+IF0MW4PfeCu8G5jIT/CoYwIHVedg2G9id1l3vMQO16GXlZsGyjHv3AXsXu5Lo4DdsumjW4M
X-Received: by 2002:a05:620a:4ef:b0:78e:ce85:1f3b with SMTP id b15-20020a05620a04ef00b0078ece851f3bmr11638661qkh.2.1713259320840;
        Tue, 16 Apr 2024 02:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713259320; cv=none;
        d=google.com; s=arc-20160816;
        b=zxjhVG4bFppNfcdVZYLhsC8iIpWd4eDNYDCs98NMLOM3tmZa2KArStIsTvZBvWqF24
         Ol5XkmZuZhPsgX4A5+fb8fQmJfnBeT+JntOwveIsYVmcCMFTesuTY/X6qc7clTAIDqeW
         +TU5vPQ7Dm1UGJeCV9eoqVnGY12DP0YvD5WlqN+B6CgsipmuPcMxwqfhLtkL7N+0SXiW
         QGca7eDZ/0PMtUGsIKzBFqPQnUqlFHFOrVylpWyH6PPzHAhZFLqlIjoF985ViBT6kP7r
         8NI+/oBMwXqjEcz26d/zjfvUlATSkfcKylQZFpwbwtaKoFjWbf/IcDPItd0M5GhPIAQJ
         X7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JCFHxzDPs5hgIDf2c86kn8Bw7DYO0Ujl9sUCHVvXMss=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=xnovwIba7riIx0lPLcmG6rS1mGNKjKqPviYg4V+MGfCblKMzriJeAbKTBRVpXhfwXt
         y2W+8Yl22PVrdEKuHPd7YzjKgEFoQ8BytnPHaq9k0ZqusYQeRgWqVTp01QbDxYDmzY4y
         cZ8FvH6BYsE0Gfu0MG0bGboCHDMBI5Sr4hazQOHqrqvYXQEontxpbljPX5K/Jrzi5VQc
         pU8pHsr08/Mj/HJMUk6q25TQBHilYikAN6u/yFlggObrBvxlyYRDOq9HYwv+c+u6yedf
         ONK31+TaisRc+wZFDVr04uyRF3HpI9I0WhGNV83RMiWrmjLRorfaWlawwDqXqN8MwQvQ
         ZQMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020a05620a40c700b0078be871ef52si13065484qko.376.2024.04.16.02.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 02:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rwf0m-0005O0-Nc; Tue, 16 Apr 2024 05:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rwezg-0003cX-K7; Tue, 16 Apr 2024 05:20:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweze-0007iy-MZ; Tue, 16 Apr 2024 05:20:48 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 17:19:12 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 16 Apr 2024 17:19:12 +0800
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
Subject: [PATCH v3 16/16] docs:aspeed: Add AST2700 Evaluation board
Date: Tue, 16 Apr 2024 17:19:03 +0800
Message-ID: <20240416091904.935283-17-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AenFM8ErjzMD

Add AST2700 Evaluation board and its boot command.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 docs/system/arm/aspeed.rst | 39 ++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b2dea54eed..320ff2a4cd 100644
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
+       -device loader,force-raw=on,addr=$((0x400000000 + ${UBOOT_SIZE})),file=u-boot.dtb \
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

