Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E532CD4F35
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 11:00:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wN7Kg-0000rX-Su; Wed, 13 May 2026 07:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7Fg-0003BT-T3
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7Fd-0001UP-7K
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488b150559bso51712225e9.1
 for <qemu-arm@nongnu.org>; Wed, 13 May 2026 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669739; x=1779274539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GoZtt2lK0yUwG4pPWSgeKyahL320UQGIppVE1LDSKSc=;
 b=F9ccWNLDfM+DYN5txf/quuaVrjM46nkHX2TqPG8sSdEqnZAgerMrTceuX9Y77EjNKk
 tTJtGtBoTGaZByTxVvZIT/1iSU1stX537v4zJnbrzYGoP2h5MlghRhKaC1aaqIi1J0a+
 Z1jvviaeU222UQsXnueYFvHMWYachhEs8kRV75YMylh7hqHcdxm2/H+rhVE8q7FYG5lB
 AP7c4LSt2InpYa9QPrinZR9CioxJB6TGUg1Ul0kvFJIXpj4Z8+cTUtI5JMbIyR3gw0xe
 gPn/2s59Hr5PfV5U57KerazmcQw/7bAfGzRqoFW8a7PusLdy3GSwA1HnGqASlycqE87D
 Tx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669739; x=1779274539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GoZtt2lK0yUwG4pPWSgeKyahL320UQGIppVE1LDSKSc=;
 b=oECi/oXNlZlAunzl/pQi6CNDMQT3EpEVOa3g8aLgxwXTZ2If6FFNYC/Os9s1wRdi95
 ES4qoUBU6w2K+qGlLGorjCQDl9A6QbCYQdNGQ70daRQ0XQwM5wkdDqM/HK0ScNSwtbAw
 jlF+ir5B1O4o9/pOBpawTUW2BqPhudw1GzQgFPThtwd94rQ355vuzH9jNLwy4zP2jimi
 9KqEh6/RPL3Ofo7bn4o4UdH8ey29Rh4riVLwTPSHRwhwLPIfSdI1QjEuodL5BWCzroRJ
 aslQoLVvkBTRQRSZION2Mx7bNlUn3H1sOo5vFi3pHOwbF9vwRtZDxyPorJ4ef54vJFdt
 6mOw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ks7Qse8157/rDErB5H0uUrXBZmBQVPHm0JvdQ7hfYe3bQn2DcAbJ8zHnvqfSAyafXTZmWgEBxWw==@nongnu.org
X-Gm-Message-State: AOJu0YxnvqyR1Nd4Ju6nwVSF2LJrgoWEzaDojvfC3honIq+/G9E40bX0
 8hCofj9xsTiblc4zOVz8aCL9E784DoqWKgBMwcMJyhPVRfmI6IcbZyrO
X-Gm-Gg: Acq92OHnb9IB4mgOQPzKkmTnI/hE+zF4UP4l4imH7cop3GDtYlFxeHrNIYhpT08hYMa
 rWka3hrwXsGY9pzqsHgp3P88VpP6PLTqC4ua67hHy8WAlgZaGZdFy0AGrTW88U6vllm4nBuSTqy
 3hNq8/9s5UGDzF9ndz7qPuo62LMF6F5hi+qpEQRtCWHbdFvNRI8Ov1P8+FuA+juUDxjn15QgE84
 WCP5kZCRSbcguysfL84UsITrbURAwnIiZWvY76Rd9SwmNDz/JGl4tvoKsyil9h2WyY+MyXv3w8D
 RShyt2RZXoV2bTJv0kxto7cT5AfOIl6yIBGeWHbZwMCp0t47x+DTdWuONENtZ5e8Zq/UWiTMF0r
 xgaIaxfUiyeT67uPA4n+gjVkjYG1F68UVLfy1QRHG9dyIzmzJ4bnag0uOmXDWzh++5s5rkK4cd2
 OuJ+G74cbHIMJo7jCLhC5YwtRP6ucVqUgVruNI/1iEKCtf
X-Received: by 2002:a05:600c:8b13:b0:48a:6315:da26 with SMTP id
 5b1f17b1804b1-48fc9a53bdbmr40751085e9.26.1778669739592; 
 Wed, 13 May 2026 03:55:39 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.196])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410d9fsm56062295e9.6.2026.05.13.03.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:55:39 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH v6 15/15] docs/system/arm: Add support for Beckhoff CX7200
Date: Wed, 13 May 2026 12:55:17 +0200
Message-ID: <20260513105517.146706-16-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513105517.146706-1-corvin.koehne@gmail.com>
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
index c57102a414..fbe8ef5584 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -82,6 +82,7 @@ Board-specific documentation
    arm/aspeed
    arm/bananapi_m2u.rst
    arm/b-l475e-iot01a.rst
+   arm/beckhoff-cx7200
    arm/sabrelite
    arm/digic
    arm/cubieboard
-- 
2.47.3


