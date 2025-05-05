Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2307153njj;
        Mon, 5 May 2025 02:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiSKrRd0E9TyKeW7s29eLd+t9N7cbEIywHPt1NfCmQfV3dX+Cvhh9BcGsm88Nlzs/kkPF6VF8mow2hYA==@linaro.org
X-Google-Smtp-Source: AGHT+IFouUQzgFngV2UUYAGGldCdRHiuq9Xf9joPAOoOsGcnQNQBmW56Fqc83jgiFJJM7QO97Xbc
X-Received: by 2002:a05:6000:310d:b0:3a0:7fbb:65fe with SMTP id ffacd0b85a97d-3a09ceb8761mr5483579f8f.26.1746436378048;
        Mon, 05 May 2025 02:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436378; cv=none;
        d=google.com; s=arc-20240605;
        b=GnMOqG0B+M8rwCC3jta4XiG6VBZ7qOSCRngRjHTCQ8xu1tc1zFYqKS+Ld1ODgSL/p7
         eZpnj/7K+BjxnypbX+1Ozlb/sUdZjNaAVGPlscgWy+MjyYEG3AqY6rlH878hzOsEe6FY
         QBrpI8c5uQic/j+TnzBZSjApIWY8qLeLouEOS2pM/5VpolkJK4njPjySPLfZupZj1Y2P
         8EwJ2t/z2yWLeBioRxiGx/oduHhCUIvLwLzWk0/OfaoDHbKp4lZLbh0ULQFSyTYXX6Yc
         cVFWzAGC5l+5sm53I7jnZxvBwgjJdQ2EMCQQWX8wtqDS6S5OrGIHv3MO579nxLeCDLpY
         x4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h1/HMKZKPdedsTTheTmVJq//CFPLp8wuzx1oWhneYEw=;
        fh=O3GBR2OOT5hhNkvxv+rlHs7YTTnYAArA4Xdium3ocZU=;
        b=D96/sb/oR73ID7fq1Nu9lK9zlh0QQIGZiZ2Psxp1+OgjDKbvOghcIBfLNqim/SvxYh
         WcWYdZt1R/YELzK7QvYr1F9m5jY3fDuofhqvn0UN1PooBc5cfMymUr1HRMCMO8Ssq9Q9
         58Sy9gRER2onewYEANoSddPGTfWBBaCwryNkQk9/cQDFuvTIu88Z09w7OuJJNbYHr7+D
         l1D68mS1cW1TKeQ7QhIUzXvYF4auKRSLpfoDFOKZxIGskazBO2FI2hWZi7nHnWp5GRF4
         ZIiRWI0hprDd3y7qX9zvpmZ7cG8MSPbu/0mxGm9jD8hw2kWAt/Q3O5mihtoE7JfULYnZ
         BXUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AyZkACj5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b00a28si4891108f8f.535.2025.05.05.02.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AyZkACj5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrqy-0004Bq-8E; Mon, 05 May 2025 05:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnk-0000NU-Sj
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnd-0006Re-AH
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1/HMKZKPdedsTTheTmVJq//CFPLp8wuzx1oWhneYEw=;
 b=AyZkACj5W6VXDpuZf2uLdrooTTshllfbu9HQIFziOZcmhL+92LE5Zbe4kZB5Mpkr+Wt/Tk
 0h9hRH0wN0jNIsRxDvf8AIjBnzDPgfo6DOVelJEixnF4ND77ukkMVgv6iaEY8OJfd25bDE
 Gr6ja8bTDMcuTFerxLjKHLY9i15K0Cg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-jsnrJXnTMf2bUC89IdftWA-1; Mon,
 05 May 2025 05:07:40 -0400
X-MC-Unique: jsnrJXnTMf2bUC89IdftWA-1
X-Mimecast-MFC-AGG-ID: jsnrJXnTMf2bUC89IdftWA_1746436059
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 828041955DCD; Mon,  5 May 2025 09:07:39 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DFA6F30001A2; Mon,  5 May 2025 09:07:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 23/23] docs: Add support for ast2700fc machine
Date: Mon,  5 May 2025 11:06:35 +0200
Message-ID: <20250505090635.778785-24-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AcbMQFBJZ+ww

From: Steven Lee <steven_lee@aspeedtech.com>

- Updated Aspeed family boards list to include `ast2700fc`.
- Added boot instructions for the `ast2700fc` machine.
- Detailed the configuration and loading of firmware for the
  Cortex-A35 and Cortex-M4 processors.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Id41312e9c7cf79bc55c6f24a87a7ad9993dc7261
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250502103449.3091642-10-steven_lee@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 docs/system/arm/aspeed.rst | 69 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 014545f4440f..58a8020eec23 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,5 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
-==================================================================================================================================================================================================================================================================================================================================================================================================================
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``ast2700fc``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+=================================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
@@ -255,6 +255,7 @@ etc.
 AST2700 SoC based machines :
 
 - ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
+- ``ast2700fc``            Aspeed AST2700 Evaluation board (Cortex-A35 + Cortex-M4)
 
 Supported devices
 -----------------
@@ -285,7 +286,6 @@ Supported devices
 
 Missing devices
 ---------------
- * Coprocessor support
  * PWM and Fan Controller
  * Slave GPIO Controller
  * Super I/O Controller
@@ -353,6 +353,69 @@ specified path in the ${HOME} directory.
 
   -bios ${HOME}/ast27x0_bootrom.bin
 
+Booting the ast2700fc machine
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+AST2700 features four Cortex-A35 primary processors and two Cortex-M4 coprocessors.
+**ast2700-evb** machine focuses on emulating the four Cortex-A35 primary processors,
+**ast2700fc** machine extends **ast2700-evb** by adding support for the two Cortex-M4 coprocessors.
+
+Steps to boot the AST2700fc machine:
+
+1. Ensure you have the following AST2700A1 binaries available in a directory
+
+ * u-boot-nodtb.bin
+ * u-boot.dtb
+ * bl31.bin
+ * optee/tee-raw.bin
+ * image-bmc
+ * zephyr-aspeed-ssp.elf (for SSP firmware, CPU 5)
+ * zephyr-aspeed-tsp.elf (for TSP firmware, CPU 6)
+
+2. Execute the following command to start ``ast2700fc`` machine:
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
+       -device loader,force-raw=on,addr=0x430080000,file=${IMGDIR}/optee/tee-raw.bin \
+       -device loader,cpu-num=0,addr=0x430000000 \
+       -device loader,cpu-num=1,addr=0x430000000 \
+       -device loader,cpu-num=2,addr=0x430000000 \
+       -device loader,cpu-num=3,addr=0x430000000 \
+       -drive file=${IMGDIR}/image-bmc,if=mtd,format=raw \
+       -device loader,file=${IMGDIR}/zephyr-aspeed-ssp.elf,cpu-num=4 \
+       -device loader,file=${IMGDIR}/zephyr-aspeed-tsp.elf,cpu-num=5 \
+       -serial pty -serial pty -serial pty \
+       -snapshot \
+       -S -nographic
+
+After launching QEMU, serial devices will be automatically redirected.
+Example output:
+
+.. code-block:: bash
+
+   char device redirected to /dev/pts/55 (label serial0)
+   char device redirected to /dev/pts/56 (label serial1)
+   char device redirected to /dev/pts/57 (label serial2)
+
+- serial0: Console for the four Cortex-A35 primary processors.
+- serial1 and serial2: Consoles for the two Cortex-M4 coprocessors.
+
+Use ``tio`` or another terminal emulator to connect to the consoles:
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
2.49.0

