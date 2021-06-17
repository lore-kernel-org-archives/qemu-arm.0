Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp732691lff;
        Thu, 17 Jun 2021 09:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYyoH3TTgzLYNgaWOyXAC1ETjclN9ZjjVnFREYWKwgul/hZRdtyBZw+HNwEs3Xe9g1arvn
X-Received: by 2002:a9f:362d:: with SMTP id r42mr6593319uad.81.1623949124379;
        Thu, 17 Jun 2021 09:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623949124; cv=none;
        d=google.com; s=arc-20160816;
        b=KWNh/uSVX56gbrKC2TRmXRgq1tTBPS6cOOscMJ6WFpStvVnrT8WDBnDqTZG04G8R8+
         DqQ1dHCtFa7d5jOY0WFuxglyz8SuHgpkqZitR0Vwi+0FASKVpdTZ7ohg+9KomcDgORQR
         l8cfhwhGjO4l5Zhvt8e21Qho7RvQWa/jYYCrx7ihjA+csyISrUOuhSpq9sZ6pasZbdAx
         Sd7w2Peq1UOt8ZeVPlV3gm9Ati/eBPyBX3/8Jd018cddpvAqzkC6iOMujK1JRNEQx8C6
         QIwEeth+/fpmpvMEEHCUE3ltKWynelCl3WdkCwKGf5KkU4cg/yxzbYdPY7DelKPMk3BW
         fBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=pBD5FH0bxFyHcsdS949OCOVPf6vhDckBZtyAJuiVc5Q=;
        b=KyrL70Q7/2wN+faJDIUmRcBD4vLI2+nok3mkcMI0RnjE28gvdas6Uh8nofLp6SFlt5
         cpjyWvnhZLKzaWpXBwl7sk9kfYWzkv8XT9GdneqoWl1zFVpXFljn0ISpZdP9Z2SMFo5H
         BTAW6oOP7cwLXCOCsoM8qanImN9B2HlSn14cy+TBCnGrN+Uq7y3trJeyFlfKyZJktK0Y
         Q1odOHErdOxuteZlVmB14bOuRxT/iZWNHCDMgjtJYnChUud+xcLlT5QLIniuYa77nPTU
         vls/p7ER+4dpWlIG/dQbTSI/icj5sXgp3txNaRR0KGjuF0y++CIj5HSh31+S1BDtPTDa
         Xing==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y34si5390331uad.38.2021.06.17.09.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 09:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:49770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltvLn-0004Ea-N9
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 12:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltvKO-0000zU-3e; Thu, 17 Jun 2021 12:57:16 -0400
Received: from zamok.crans.org ([185.230.79.1]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltvKH-0005wd-2O; Thu, 17 Jun 2021 12:57:15 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id D6368E015B; Thu, 17 Jun 2021 18:56:58 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 4/4] tests/boot-serial-test: Add STM32VLDISCOVERY board
 testcase
Date: Thu, 17 Jun 2021 18:56:47 +0200
Message-Id: <20210617165647.2575955-5-erdnaxe@crans.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ikK3ch5+4cHg

New mini-kernel test for STM32VLDISCOVERY USART1.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 tests/qtest/boot-serial-test.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index d40adddafa..96849cec91 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -94,6 +94,41 @@ static const uint8_t kernel_nrf51[] = {
     0x1c, 0x25, 0x00, 0x40                  /* 0x4000251c = UART TXD */
 };
 
+static const uint8_t kernel_stm32vldiscovery[] = {
+    0x00, 0x00, 0x00, 0x00,                 /* Stack top address */
+    0x1d, 0x00, 0x00, 0x00,                 /* Reset handler address */
+    0x00, 0x00, 0x00, 0x00,                 /* NMI */
+    0x00, 0x00, 0x00, 0x00,                 /* Hard fault */
+    0x00, 0x00, 0x00, 0x00,                 /* Memory management fault */
+    0x00, 0x00, 0x00, 0x00,                 /* Bus fault */
+    0x00, 0x00, 0x00, 0x00,                 /* Usage fault */
+    0x0b, 0x4b,                             /* ldr  r3, [pc, #44] Get RCC */
+    0x44, 0xf2, 0x04, 0x02,                 /* movw r2, #16388 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x0a, 0x4b,                             /* ldr  r3, [pc, #40] Get GPIOA */
+    0x1a, 0x68,                             /* ldr  r2, [r3] */
+    0x22, 0xf0, 0xf0, 0x02,                 /* bic  r2, r2, #240 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x1a, 0x68,                             /* ldr  r2, [r3] */
+    0x42, 0xf0, 0xb0, 0x02,                 /* orr  r2, r2, #176 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x07, 0x4b,                             /* ldr  r3, [pc, #26] Get BAUD */
+    0x45, 0x22,                             /* movs r2, #69 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x06, 0x4b,                             /* ldr  r3, [pc, #24] Get ENABLE */
+    0x42, 0xf2, 0x08, 0x02,                 /* movw r2, #8200 */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0x05, 0x4b,                             /* ldr  r3, [pc, #20] Get TXD */
+    0x54, 0x22,                             /* movs r2, 'T' */
+    0x1a, 0x60,                             /* str  r2, [r3] */
+    0xfe, 0xe7,                             /* b    . */
+    0x18, 0x10, 0x02, 0x40,                 /* 0x40021018 = RCC */
+    0x04, 0x08, 0x01, 0x40,                 /* 0x40010804 = GPIOA */
+    0x08, 0x38, 0x01, 0x40,                 /* 0x40013808 = USART1 BAUD */
+    0x0c, 0x38, 0x01, 0x40,                 /* 0x4001380c = USART1 ENABLE */
+    0x04, 0x38, 0x01, 0x40                  /* 0x40013804 = USART1 TXD */
+};
+
 typedef struct testdef {
     const char *arch;       /* Target architecture */
     const char *machine;    /* Name of the machine */
@@ -144,6 +179,8 @@ static testdef_t tests[] = {
     { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
       kernel_aarch64 },
     { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
+    { "arm", "stm32vldiscovery", "", "T",
+      sizeof(kernel_stm32vldiscovery), kernel_stm32vldiscovery },
 
     { NULL }
 };
-- 
2.25.1

