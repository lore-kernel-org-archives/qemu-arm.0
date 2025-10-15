Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABABCCD18E
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 09:22:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8xeh-0002Bz-3f; Wed, 15 Oct 2025 05:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xeZ-00028U-Bf
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:39 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xe0-0007Hn-QE
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:37 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so907544066b.2
 for <qemu-arm@nongnu.org>; Wed, 15 Oct 2025 02:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760519875; x=1761124675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3TwBBdLUHAKhGiv26iGeP2UfTRRDnunnjZgIo/sg9k=;
 b=Oi9A5rvVpwcpO2fhL43PQvh00Y4XwC7n9AMjkxFn7iMl5Nqzd7MOmx7t6fuw0tGl1o
 4OKHxGYo2xGbRpJPLeif9oZ8Wz/0d7o2UWLAkt54gIQ/e8/0+l3S0UbgxTxRpLnRLFIn
 rllF1IYE17v+kaXBdv+aivixfcWyj+Wnv9+zUmIpw2+biNMTGWDZXOU+oVZJFkHW4nOm
 OuPprTm5bGVshG3Y256Y9l9QNFxzcwTj/q26LeiLO3TVeQhS1zQnMvIIsrHlxKj0k0gD
 XcFTAKo6bVkI7qY/l2dH+dzVI2oBctTcwxQyQm33iNLGt2xl6zy42dma4bGo3EZuui0d
 YyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519875; x=1761124675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3TwBBdLUHAKhGiv26iGeP2UfTRRDnunnjZgIo/sg9k=;
 b=utjPWNpT5D9PDrb+gkiE7/T5OkmHA+XrzeYOP/4qAnqpjLbfwvby+Z03JcDw1HruE1
 AjSCkWVQYwIQI9dXV6qhtNIhiAQAlq8w55GAvJ5x7NMUx8jxWfOxJRvRFJDt5pjIP/Uv
 mVFFYnZCZKdKPC1qBn3ResfTlvALqqKXzoI8u1XyAe7ifVY74BYFcPZX05/cD8U1GSyG
 3hXjwb043DFI9oKkM40FKZQS18ZcNdE6TFgAskh78CNzLwcW9GYT1oLdg6KqF1B67fjv
 AAEyWKXIyuCUinqbViB9jiyuG/HoxQv4ARjSUqljGldVT1Zl1Xnc6MSiHvOf4XFREyQN
 qtKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW6SwzfFdIXfLuMeTFBJJVenOrXSYbdAullM/nMlcp04DLFHwUAHa/WBluyYtREzAud6HTNeINJQ==@nongnu.org
X-Gm-Message-State: AOJu0YwiBw3Gy2W//AFEErSsbMIOM3Cvqjey1CaVDDsIY/dTHbSy6JcY
 pzmpXAhay0Yh6CnSHDmL7qYwnSKrG1gwhH0RydLNkFMROd8Az8A6Ay68
X-Gm-Gg: ASbGncuD3QykRFyKSODFS0qZwKUt4G3ZxLI9UNUwkyv9VDCZq20NSOFVtZdJbbyV5YU
 HzlX2z+r2WRhv7QJ2jeh9qwrGpanEQgbiQ2sT5214LDSXNAwPxEH8UprQDT1tX53cUCow/Pe8eH
 ZjujkStDfOP8vJ919gIYQJtOfMwPQcNPWpqDa+hJ65UIEP3jUe75XYyJFuhbxPNNN0xv5hAQJZv
 LNKg8ayxj2NHwETkFNpuEhBNpQPz9oUQbnXjDU6s4T35KxLAab4E6+LCL4p6UoKRaJdv/dnTrWh
 ZvRmsxrrhJxawZlqpA+THjVylWUwORELIuQNjy916h9bjVLMuOjBpfg4340R/h0kHAp922hfO05
 3EMjzyoqzVhb2GxSZ/JyUk9NVL/2xIgAUb2S25pCpWFr1A2CdJOe6LOf7/bOYOFBOE8RnHfED
X-Google-Smtp-Source: AGHT+IHUguSygxcid9NBMRmtzkqRkLlbFkDo7Z+do6kIUo0reSSQnIOjB9aVImbBfTWyTiL7i/fkIA==
X-Received: by 2002:a17:907:3f8a:b0:b3f:ccac:af47 with SMTP id
 a640c23a62f3a-b50ac1ccce8mr3300142566b.31.1760519875438; 
 Wed, 15 Oct 2025 02:17:55 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e7a23dsm182069966b.23.2025.10.15.02.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 02:17:55 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH v3 14/14] docs/system/arm: Add support for Beckhoff CX7200
Date: Wed, 15 Oct 2025 11:17:29 +0200
Message-ID: <20251015091729.33761-15-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015091729.33761-1-corvin.koehne@gmail.com>
References: <20251015091729.33761-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: YannickV <Y.Vossen@beckhoff.com>

This commit offers some documentation on the Beckhoff CX7200
qemu emulation.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
---
 docs/system/arm/beckhoff-cx7200.rst | 57 +++++++++++++++++++++++++++++
 docs/system/target-arm.rst          |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 docs/system/arm/beckhoff-cx7200.rst

diff --git a/docs/system/arm/beckhoff-cx7200.rst b/docs/system/arm/beckhoff-cx7200.rst
new file mode 100644
index 0000000000..f060319b0f
--- /dev/null
+++ b/docs/system/arm/beckhoff-cx7200.rst
@@ -0,0 +1,57 @@
+Beckhoff CX7200 (``beckhoff-cx7200``)
+======================================
+The Beckhoff CX7200 is based on the same architecture as the Xilinx Zynq A9.
+The Zynq 7000 family is based on the AMD SoC architecture. These products
+integrate a feature-rich dual or single-core Arm Cortex-A9 MPCore based
+processing system (PS) and AMD programmable logic (PL) in a single device.
+The Beckhoff Communication Controller (CCAT) can be found in the PL of Zynq.
+
+More details here:
+https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Zynq-7000-SoC-Technical-Reference-Manual
+https://www.beckhoff.com/de-de/produkte/ipc/embedded-pcs/cx7000-arm-r-cortex-r/cx7293.html
+
+The CX7200 supports following devices:
+    - A9 MPCORE
+        - cortex-a9
+        - GIC v1
+        - Generic timer
+        - wdt
+    - OCM 256KB
+    - SMC SRAM@0xe2000000 64MB
+    - Zynq SLCR
+    - SPI x2
+    - QSPI
+    - UART
+    - TTC x2
+    - Gigabit Ethernet Controller
+    - SD Controller
+    - XADC
+    - Arm PrimeCell DMA Controller
+    - DDR Memory
+    - DDR Controller
+    - Beckhoff Communication Controller (CCAT)
+        - EEPROM Interface
+        - DMA Controller
+
+Following devices are not supported:
+    - I2C
+
+Running
+"""""""
+Directly loading an ELF file to the CPU of the CX7200 to run f.e. TC/RTOS (based on FreeRTOS):
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M beckhoff-cx7200 \
+        -device loader,file=CX7200_Zynq_Fsbl.elf \
+        -display none \
+        -icount shift=auto \
+
+
+For setting the EEPROM content of the CCAT provide the following on the command line:
+
+.. code-block:: bash
+
+        -drive file=eeprom.bin,format=raw,id=ccat-eeprom
+
+The size of eeprom.bin must be aligned to a power of 2 and bigger than 256 bytes.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index a96d1867df..e634872b97 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -82,6 +82,7 @@ Board-specific documentation
    arm/aspeed
    arm/bananapi_m2u.rst
    arm/b-l475e-iot01a.rst
+   arm/beckhoff-cx7200
    arm/sabrelite
    arm/highbank
    arm/digic
-- 
2.47.3


