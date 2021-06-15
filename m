Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3070995lff;
        Tue, 15 Jun 2021 08:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcq6RNtrpwPBqmEayTAN99Lu3RHj9HBo0d0dV/WsCRo+fRZXnhKgk5OHsfVEAeMseVr8Pc
X-Received: by 2002:a1c:7913:: with SMTP id l19mr5975060wme.179.1623771498568;
        Tue, 15 Jun 2021 08:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623771498; cv=none;
        d=google.com; s=arc-20160816;
        b=t/c3yj9U7RJzs2k9Qs4lidZBZjHzPADaXOG6+oWPgOGvKkzE8Th8XCLyzmNJ2Y93ho
         Oe9cISF0LUxQw4OHCmF7+e2HvLJpHzPSB8F6lDXknyerfZNyCBfJlX/vuWVY5flQds2N
         XhIKoLk/VfYOqhi8dAbNsuLLxr2gPlaGeHsSnsbUP45oihERUtkLkeS6HWLtqg1JD5o8
         55/nH3l0f0rfninMHvJoVxts7tON6Uzqkr5BLVnF00kHgDycws6K0/yOaVd2R0YvS+FH
         S1YhQoMhSFkwpgaqRmpxJApPBA5/AARyezFC3x8V5zbw6DL5IxLWWYxorMZpSOsevF2w
         LF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Pu9uwqAEP30Fm+DIZc+TKd4pvqB9j5boLECYiyxolNg=;
        b=dWcwVoKRpuWjL79BVbbD8Jy1h3Hb1HyYVPsqaNlES5ZPxUmf2UqLHTxEQ5ciALpUK/
         +O2rk3L5g4w98L4Lyp52EPXXbpo6TF4qJldQrUXDOVO1TIlRvaYlEQDghvQEOtaPoIu+
         Puw9s39eoLnPa6tYrAFsULgZXghE8QmB8+hSkav/sgFcE0qZvvNURsHsmyMJvxO0qALv
         NN5Yc7uwXkYFugh/Bpq0UynqbFUKI1Jwt5U17puH/UolH7q9QWAbsZ8Bt1k7LuDw0FGO
         L18uskdCpOD7k3vPnV5aUbZ8/L0WOtrpdwL4583BLw+nqOtVopXPWni+wkX3egcM8g1I
         TnWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si4881040wmq.135.2021.06.15.08.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 08:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltB8r-0005cx-MF
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 11:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltB6T-0001WZ-Qe; Tue, 15 Jun 2021 11:35:49 -0400
Received: from zamok.crans.org ([2a0c:700:2:0:ec4:7aff:fe59:a1ad]:40644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltB6I-0004lg-CY; Tue, 15 Jun 2021 11:35:49 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 98A28E00A3; Tue, 15 Jun 2021 17:35:35 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2 3/3] docs/system: arm: Add stm32 boards description
Date: Tue, 15 Jun 2021 17:34:40 +0200
Message-Id: <20210615153440.1307729-4-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615153440.1307729-1-erdnaxe@crans.org>
References: <20210615153440.1307729-1-erdnaxe@crans.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a0c:700:2:0:ec4:7aff:fe59:a1ad;
 envelope-from=erdnaxe@crans.org; helo=zamok.crans.org
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
 "open list:STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GVYVYCrAD1Hp

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

