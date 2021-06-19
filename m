Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp256379lfg;
        Sat, 19 Jun 2021 02:58:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQfg+OvHDQ0ubbHUEfkhD9W31J4iA6yLodQFcmBJ4DsdjeTeE97J2Fi5nfsX4OJ59HaRl2
X-Received: by 2002:a92:2c02:: with SMTP id t2mr10327106ile.233.1624096723441;
        Sat, 19 Jun 2021 02:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624096723; cv=none;
        d=google.com; s=arc-20160816;
        b=sZVBghhZhpoi4hxfJpg26756ND60qsR5EsZmjbVOeju4mMUCNJR9uW2MHhT+11DiNd
         7nS+FrMSCKHwPRiu80cmEwq5IsvHqwbCRsYgiawAZ7aJpB8Wfxr7KUYnc7Qwp7kdtaCI
         hd+SrsfQzKLKwGMI2w11c8ONYh5yeT3wzaPE9gpUjX8CPKjWiFP0o4jR1wz5+3yzmfvR
         uoQWclfx3AVka7PRvhj/UTG1PuaIxGStWQGgF2mqIo0y9w/ww2xKdBwrtPU4+NTzbbo2
         YC5Iv6HQ/8aBjLHPm41FMwIwZVb+0Q5cGqZecDr5juxyZWrvlBONhnTPWn0y1kFURl5Q
         RwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=D9BFc/rfhNMyQ5XBo/I5RSMLye2BOlnuOQ72/QNhK4o=;
        b=f0mshRDT4zsS7GjRPeQh4f1whYMlSwO1Zz38OAyROfzcCruqLtEE/6/PXXgRpWSZgD
         F9BBMB/hif6KOOTH5zbpishjdtG3PMlieB04blHClRo02HaelV91WA4QwhWo9IfRkn+Z
         azRWBc94b4qXsXoOd7grw7cf4/nbd0QhF0QVkuP9W+el5DtLVcIjJnxEAGiwkQq94igw
         3jLeYd6cIEzXL74maulaBUZylUcvFZs38nk9lO1amu45l+I8C4kZ2VJ3EcxKuxDWCUOx
         vzVwNsqw8j1DGPSB0UAQzoifVolkrVAVeSHvydv+9uLaLSt47wF5Mw0dScwp5mtwSpAI
         c1Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si6085328ilo.33.2021.06.19.02.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Jun 2021 02:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luXkQ-00067j-QH
	for alex.bennee@linaro.org; Sat, 19 Jun 2021 05:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1luXk4-00066V-5i; Sat, 19 Jun 2021 05:58:20 -0400
Received: from zamok.crans.org ([185.230.79.1]:49662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1luXk0-0002DD-7B; Sat, 19 Jun 2021 05:58:18 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 89E80E0172; Sat, 19 Jun 2021 11:58:03 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] docs/system: arm: Add nRF boards description
Date: Sat, 19 Jun 2021 11:57:50 +0200
Message-Id: <20210619095750.3216150-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
 "open list:NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eLi/OkmoNblv

This adds the target guide for BBC Micro:bit.

Information is taken from https://wiki.qemu.org/Features/MicroBit
and from hw/arm/nrf51_soc.c.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 MAINTAINERS                |  1 +
 docs/system/arm/nrf.rst    | 49 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 3 files changed, 51 insertions(+)
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
index 0000000000..e30aba8b06
--- /dev/null
+++ b/docs/system/arm/nrf.rst
@@ -0,0 +1,49 @@
+Nordic nRF boards (``microbit``)
+================================
+
+The `Nordic nRF`_ chips are a family of ARM-based System-on-Chip that
+are designed to be used for low-power and short-range wireless solutions.
+
+.. _Nordic nRF: https://www.nordicsemi.com/Products
+
+The nRF51 series is the first series for short range wireless applications.
+It is superseded by the nRF51 series.
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
+firmware in hexadecimal format. Example:
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

