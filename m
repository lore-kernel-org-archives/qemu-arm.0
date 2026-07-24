Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCA4C531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 13:03:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnFYq-0006CR-7J; Fri, 24 Jul 2026 09:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huang.botsz@gmail.com>)
 id 1wnFMq-0002kH-Rw
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 08:51:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <huang.botsz@gmail.com>)
 id 1wnFMo-0001KJ-Nj
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 08:51:08 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-382ef647e20so368840a91.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784897461; x=1785502261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/NYB5VPamLxRl003Nr1YAoItm9vYqHIxFyNoTTbDu5k=;
 b=Cm75Dhio4Ijm2AjNQPIAMHB+q/a2KwNRCQaWYcw5wBV4Ldulou3sTlgGh009Sa2bq+
 DqUxv6HbjpVO04lka1yNI/jV4i+HyU5znBluD/Rjre1rRItRwkymNgJWLoJR6Wz8MUp9
 pXtfMLMWsXp7Gzf5WzCYu2jhUV2vI0KvtCpYYK4wivz7UYafkHMyp4/ldAEglPhOzE7d
 +GZYn1OT+gFwd6EjjK6YNYxwjmGyDYBroJ8nrQh/OegY6eIexE5CbR0YhSYZ5W3jkl0u
 FViRhtWqL55CvRAz7hH9tRH17zjFZuXdvSS2HxFKdiqUyrkgbH8PpR2ByddvV8EfBD+H
 DXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784897461; x=1785502261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/NYB5VPamLxRl003Nr1YAoItm9vYqHIxFyNoTTbDu5k=;
 b=GYibE38YERTCTsEH5ZpmdjLrOl1iPKHG6KmDLXFvystwPHfZpDhy3KWY9RpYGR71dU
 EN10vrteQSzQ1+RCMgMXrmL7CEufrPir0+adk3DczJ4CsQmQmm/NyKGheHEv83xQnApe
 4PyQKnAVx/4iqZb3I0K9nBPG3sjQJ8hC/mHd895iz9ou6TweJNRsJbzLNiUUhw8vM8/P
 mOEbGq69uqzYjXB79mSD209HCT5OvCDc2f6Ce7N90UYsUxNvmRqQmUcUt0V4QP1ottVT
 rC27UOM9+wa63FkXJT7nOFqZNpMLBXGAnvD3Ub9Mea311pGzgmT1nx7R7tzVW+tOCXv/
 wQWA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMeFlao/SIrMUeCtDjGxJiLyX52BC3sG+/9opmZEIrOnZqPIbcaTa+m4FqD6AElYY0jLq62v+Ifg==@nongnu.org
X-Gm-Message-State: AOJu0YzUSBqbpMceiCYK6ZUy7I0pcP/bDxojuIVVhcv1S839JBKtVgbd
 XbZwPIZ4LK7d2eZbxRk9b9oSaNlfB4YixlQr8YUl9F8rbpMYew7oT6nX
X-Gm-Gg: AR+sD11pI+llVLq4wtktnyhExJyKxHfVRSZWZjYn4RF0wKjg39D8pxKwJFnWlTjz8fE
 bNWpImliSNrYRvdUKbF1HgAyN3EarwCLS85p8AWV5eWQdtbhHOg2Q9iUU9zRpnwTqOEUGjxB01i
 MD8Jz8fE+BZQGb1DJxpRbjVREaU49lCNonpl+y1yMPU72675eYGXrX6yUcuPE7U5Ct4JEiciuWH
 K35JI/noHNahfg7i95mSZ2CgBEcMDr2GozTlZ62L7Go7bAVwrK/LquiP2ZRzE8xnfM9E3VxseAk
 Ru5tVv/uYeT85HuJ531rQBDIiXVCucDFstGLqp7EautNYuIR4XXTLveC2/3kHuQ/FRhj/n8kL/o
 s5KwHt77rlgU+UrgvjVE8EYV/DFawAaZF65xid0QFra/H0xcsepdhNU9Sfa+0zNj6fEjNVxxeJj
 U+B95/aIgC/BbqGzwDFQLiRnwjXiWbW2Q44Jw+4c3xcdY3BRC5PGIvbgvcrlagmBFdwOUMWgGU2
 YrCtA3Dnrtv1tFBfAvqJz/A04w9SH7E/y1cVHxxsnp7qCiz4Hvqvdja096dlzZkSYzydSoDSapE
 hRKhLFxBUKpb9wNz9w==
X-Received: by 2002:a17:90b:2b47:b0:36a:5d1f:7b6 with SMTP id
 98e67ed59e1d1-38ec6453e68mr6966372a91.2.1784897461185; 
 Fri, 24 Jul 2026 05:51:01 -0700 (PDT)
Received: from botszhome.. (118-171-20-196.dynamic-ip.hinet.net.
 [118.171.20.196]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03adb224sm1449004a91.2.2026.07.24.05.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 05:51:00 -0700 (PDT)
From: botszhuang <huang.botsz@gmail.com>
X-Google-Original-From: botszhuang
 <22925483+botszhuang@users.noreply.github.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@mailo.com, qemu-arm@nongnu.org,
 sef1548@gmail.com,
 botszhuang <22925483+botszhuang@users.noreply.github.com>,
 botszhuang <botszhuang@gmail.com>
Subject: [PATCH] fix BCM2835_I2C_CLKT
Date: Fri, 24 Jul 2026 20:42:20 +0800
Message-ID: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=huang.botsz@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 09:03:30 -0400
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

hw/i2c/bcm2835_i2c: Correct CLKT register offset

The Clock Stretch Timeout (CLKT) register for the BCM2835 I2C controller is actually located at offset 0x1c, not 0x20.

The previous incorrect value caused the guest OS to read from and write to the wrong memory address when configuring the I2C timeout, which could lead to unexpected controller behavior.

Update the BCM2835_I2C_CLKT macro to match the hardware specification.

Signed-off-by: botszhuang <botszhuang@gmail.com>
---
 include/hw/i2c/bcm2835_i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/i2c/bcm2835_i2c.h b/include/hw/i2c/bcm2835_i2c.h
index 45f876df22..519c65f765 100644
--- a/include/hw/i2c/bcm2835_i2c.h
+++ b/include/hw/i2c/bcm2835_i2c.h
@@ -38,7 +38,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2835I2CState, BCM2835_I2C)
 #define BCM2835_I2C_FIFO    0x10                  /* FIFO */
 #define BCM2835_I2C_DIV     0x14                  /* Clock Divider */
 #define BCM2835_I2C_DEL     0x18                  /* Data Delay */
-#define BCM2835_I2C_CLKT    0x20                  /* Clock Stretch Timeout */
+#define BCM2835_I2C_CLKT    0x1c                  /* Clock Stretch Timeout */
 
 #define BCM2835_I2C_C_I2CEN     BIT(15)           /* I2C enable */
 #define BCM2835_I2C_C_INTR      BIT(10)           /* Interrupt on RXR */
-- 
2.43.0


