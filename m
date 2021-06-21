Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1812481lfg;
        Mon, 21 Jun 2021 00:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqTTxeJdy5p5IrHdJNAPpvMq2L4sE11kqseC+9o+GLDPkyjAvhy0pI8IKyiPFUdvcYIlif
X-Received: by 2002:a25:f449:: with SMTP id p9mr30229642ybe.259.1624262297758;
        Mon, 21 Jun 2021 00:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624262297; cv=none;
        d=google.com; s=arc-20160816;
        b=cOCYq9LqcNxbDJ72KLz5hnXJ5qzRSbRlwdc/IbO5p6ikMXpP+fNZERGoxG+Ry49ESK
         /mfBmvGSqxeGbudxxG75fIMZe4GSXmZUdObm0cGRKRcMifXENDqlwqB2Arq9UqHVNUQS
         td/5+v/rilgiuneUsrtrzedczyiyG87JTZg/g5iWXys/MKJ0YqciSjHGGYacnDrr9GcY
         w7feeMFZm6Un4E/89WerzFoTR8pjISSAgumEBw0iTsPqeQJODsKN8VY3xTt6/Sg1jsiE
         +c/435Wf1A8j3z63Rp7o04+hUqYZMCGy8v/hj8JYs8J6gUoA7yMo354Q4etmWCbp9358
         uYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=O6SB2hEk9Jb5Y5+xv+O6sHJ4IF0NLaTbKExT1OCN2Zc=;
        b=k/eFpe0F17aXJYqTgNCrt2vjqxWOntwTNa6mGeQ4wx7rP0YvbomXwq2dxSkYpaoDJ9
         IiwlamuUC98B97h+qWunJa+gLDhaALRpDeVYsLDT19aFJucbUtKjwDmYNRgyQ3feirsU
         byyHkfiCqigHOB2pZhY4Z9rjxyUH4H5o1vMon10o+Zy9JmMjKkVpydCjFj27dNQo6daJ
         1oe+vVLcbIzNhiqCIYXx3HDb3DgCo0oFyLNdt+DUK1B0HuBrvX9VDCABLWYKTvYhnhLY
         K3TZmckJHRpWZPRzU86LqYxBu8/IWFKdui29bFABicPsCI4B6KYDM2jWrZ2MglWYNXIW
         36Og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w63si9594271ybe.263.2021.06.21.00.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 00:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvEoz-0000Su-3f
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 03:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lvEof-0000Se-Ny; Mon, 21 Jun 2021 03:57:57 -0400
Received: from zamok.crans.org ([185.230.79.1]:36304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lvEoZ-00015g-GI; Mon, 21 Jun 2021 03:57:57 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id B0884E014D; Mon, 21 Jun 2021 09:56:52 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2] docs/system: arm: Add nRF boards description
Date: Mon, 21 Jun 2021 09:56:25 +0200
Message-Id: <20210621075625.540471-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.230.79.1; envelope-from=erdnaxe@crans.org;
 helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Su Hang <suhang16@mails.ucas.ac.cn>,
 =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list : NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hkT2ORh1QCQa

This adds the target guide for BBC Micro:bit.

Information is taken from https://wiki.qemu.org/Features/MicroBit
and from hw/arm/nrf51_soc.c.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS                |  1 +
 docs/system/arm/nrf.rst    | 51 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 3 files changed, 53 insertions(+)
 create mode 100644 docs/system/arm/nrf.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 636bf2f536..7c54611cc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1031,6 +1031,7 @@ F: hw/*/microbit*.c
 F: include/hw/*/nrf51*.h
 F: include/hw/*/microbit*.h
 F: tests/qtest/microbit-test.c
+F: docs/system/arm/nrf.rst
 
 AVR Machines
 -------------
diff --git a/docs/system/arm/nrf.rst b/docs/system/arm/nrf.rst
new file mode 100644
index 0000000000..eda87bd760
--- /dev/null
+++ b/docs/system/arm/nrf.rst
@@ -0,0 +1,51 @@
+Nordic nRF boards (``microbit``)
+================================
+
+The `Nordic nRF`_ chips are a family of ARM-based System-on-Chip that
+are designed to be used for low-power and short-range wireless solutions.
+
+.. _Nordic nRF: https://www.nordicsemi.com/Products
+
+The nRF51 series is the first series for short range wireless applications.
+It is superseded by the nRF52 series.
+The following machines are based on this chip :
+
+- ``microbit``       BBC micro:bit board with nRF51822 SoC
+
+There are other series such as nRF52, nRF53 and nRF91 which are currently not
+supported by QEMU.
+
+Supported devices
+-----------------
+
+ * ARM Cortex-M0 (ARMv6-M)
+ * Serial ports (UART)
+ * Clock controller
+ * Timers
+ * Random Number Generator (RNG)
+ * GPIO controller
+ * NVMC
+ * SWI
+
+Missing devices
+---------------
+
+ * Watchdog
+ * Real-Time Clock (RTC) controller
+ * TWI (i2c)
+ * SPI controller
+ * Analog to Digital Converter (ADC)
+ * Quadrature decoder
+ * Radio
+
+Boot options
+------------
+
+The Micro:bit machine can be started using the ``-device`` option to load a
+firmware in `ihex format`_. Example:
+
+.. _ihex format: https://en.wikipedia.org/wiki/Intel_HEX
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M microbit -device loader,file=test.hex
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index edd013c7bb..5277ac0242 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/musicpal
    arm/gumstix
+   arm/nrf
    arm/nseries
    arm/nuvoton
    arm/orangepi
-- 
2.25.1

