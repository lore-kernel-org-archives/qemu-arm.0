Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp731815lff;
        Thu, 17 Jun 2021 09:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfQU84qsl139FZO0Y6UFURklrQ0rYdhzCK2IUOSp6gsEQDlTwZqyeU5BtYfpTAuBUYNqMn
X-Received: by 2002:ac5:c96e:: with SMTP id t14mr1179345vkm.24.1623949045366;
        Thu, 17 Jun 2021 09:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623949045; cv=none;
        d=google.com; s=arc-20160816;
        b=CJrP5OEKAXHixZ7rWDnJn3lIK9LA9f7wrYEJTFw5nSQCvg4nMmJfosjMqsBdQdU18C
         O/igRwgwXNq5hUcnqatP1ooR8V3PKoJ3HPoLelkkrulg2XdugDvmPr2lfvplOEIGH1if
         XGZh4H0++SljUwfV4srLQ6WXwgxKemjG9o043G3Ac+1ZqAJD3CnayHwSEpc9AS/iZdLP
         ThelWqxDCR+Y77roVqjRrFRE+c2doVQVO2A5Bn9IHWu2/J7CqHVgEpONBQn+1AzOA8IX
         k/5gh66dYhgeoJ2VGLTVl06lmFdH3GysUq68TelTwXzYojvniqydtXhJyjAGNk65m589
         x6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Pu9uwqAEP30Fm+DIZc+TKd4pvqB9j5boLECYiyxolNg=;
        b=lLsqBBSnZFis9Tlo2eyJIr6zetZUF41SBn/raSeN6aFiEEfHSZ8Jau0oYAZeThEI8f
         yI4H0vJPTcUpFHqJktcdRUS/rEfoSu2UIBScWtdwdcV45ojlpAoK+xgERsPEECyq3CiC
         Iy0F1eoKw6iSwig7u+RUopnaXAQEjNmSYbQEBZxeGRMHi49SEzJNN2ccJPvDYsWuhMLE
         Xu8FBHluqKSekrjyeVMNquJvMpQFBxURt0lIYoUMicWv/GyLrcSiLbUg3innDtYzpS/p
         HZB2oKYyOP7M2GTzNATZe78yBbCshRj/hwInsClfspNsfBiuU2JUeir1h/fBEFDDrKCr
         hibg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si5403742uad.27.2021.06.17.09.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 09:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltvKW-0000tB-La
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 12:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltvKK-0000s0-U8; Thu, 17 Jun 2021 12:57:12 -0400
Received: from zamok.crans.org ([185.230.79.1]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltvKH-0005wX-32; Thu, 17 Jun 2021 12:57:12 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 45E4DE013B; Thu, 17 Jun 2021 18:56:58 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/4] docs/system: arm: Add stm32 boards description
Date: Thu, 17 Jun 2021 18:56:46 +0200
Message-Id: <20210617165647.2575955-4-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617165647.2575955-1-erdnaxe@crans.org>
References: <20210617165647.2575955-1-erdnaxe@crans.org>
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
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zRU+wUYkL6Pz

This adds the target guide for Netduino 2, Netduino Plus 2 and STM32VLDISCOVERY.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 MAINTAINERS                |  1 +
 docs/system/arm/stm32.rst  | 66 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 3 files changed, 68 insertions(+)
 create mode 100644 docs/system/arm/stm32.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 0aa8016936..47fb06e5fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -896,6 +896,7 @@ M: Alexandre Iooss <erdnaxe@crans.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/stm32vldiscovery.c
+F: docs/system/arm/stm32.rst
 
 Versatile Express
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
new file mode 100644
index 0000000000..508b92cf86
--- /dev/null
+++ b/docs/system/arm/stm32.rst
@@ -0,0 +1,66 @@
+STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``stm32vldiscovery``)
+========================================================================================
+
+The `STM32`_ chips are a family of 32-bit ARM-based microcontroller by
+STMicroelectronics.
+
+.. _STM32: https://www.st.com/en/microcontrollers-microprocessors/stm32-32-bit-arm-cortex-mcus.html
+
+The STM32F1 series is based on ARM Cortex-M3 core. The following machines are
+based on this chip :
+
+- ``stm32vldiscovery``  STM32VLDISCOVERY board with STM32F100RBT6 microcontroller
+
+The STM32F2 series is based on ARM Cortex-M3 core. The following machines are
+based on this chip :
+
+- ``netduino2``         Netduino 2 board with STM32F205RFT6 microcontroller
+
+The STM32F4 series is based on ARM Cortex-M4F core. This series is pin-to-pin
+compatible with STM32F2 series. The following machines are based on this chip :
+
+- ``netduinoplus2``     Netduino Plus 2 board with STM32F405RGT6 microcontroller
+
+There are many other STM32 series that are currently not supported by QEMU.
+
+Supported devices
+-----------------
+
+ * ARM Cortex-M3, Cortex M4F
+ * Analog to Digital Converter (ADC)
+ * EXTI interrupt
+ * Serial ports (USART)
+ * SPI controller
+ * System configuration (SYSCFG)
+ * Timer controller (TIMER)
+
+Missing devices
+---------------
+
+ * Camera interface (DCMI)
+ * Controller Area Network (CAN)
+ * Cycle Redundancy Check (CRC) calculation unit
+ * Digital to Analog Converter (DAC)
+ * DMA controller
+ * Ethernet controller
+ * Flash Interface Unit
+ * GPIO controller
+ * I2C controller
+ * Inter-Integrated Sound (I2S) controller
+ * Power supply configuration (PWR)
+ * Random Number Generator (RNG)
+ * Real-Time Clock (RTC) controller
+ * Reset and Clock Controller (RCC)
+ * Secure Digital Input/Output (SDIO) interface
+ * USB OTG
+ * Watchdog controller (IWDG, WWDG)
+
+Boot options
+------------
+
+The STM32 machines can be started using the ``-kernel`` option to load a
+firmware. Example:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M stm32vldiscovery -kernel firmware.bin
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index edd013c7bb..addd3d1613 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -96,6 +96,7 @@ undocumented; you can get a complete list by running
    arm/collie
    arm/sx1
    arm/stellaris
+   arm/stm32
    arm/virt
    arm/xlnx-versal-virt
 
-- 
2.25.1

