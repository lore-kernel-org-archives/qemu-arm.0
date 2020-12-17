Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp969730lfq;
        Wed, 16 Dec 2020 21:29:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk+mML8TXWLtb2b0LncynWozX5hWY3xule1DVklyXUUMQItUmXYuKafQ4xOUWwNDCSfVE0
X-Received: by 2002:a5b:101:: with SMTP id 1mr29466482ybx.507.1608182958681;
        Wed, 16 Dec 2020 21:29:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608182958; cv=none;
        d=google.com; s=arc-20160816;
        b=IhyfVZLckauWwdiZT7Lo9PEpAjlj6e+r8at3YUvpU5j51k9bMeFNHioRpjyutaxypZ
         KK1HPMqA1LSl00mCYLklIQavJdCIP/3iwGjibk35uwJK7eQ+MfBfLEqG8Dr+pXqaa+UM
         I0+jFr8YFg04isku4lVXQiAZmeQTTziDSVGWIleDPt7N4BUT7AcbmOo2n+dgPWc3JbnQ
         vsunN/m1R0GQUNGwWpbNcgOhXD9ScjEB+MDhV305hDdPFjzko0thx7UsgxUTxaQBAdDB
         /hUnQmY10Cwq9wzOYnA8RIj+U6EjYpgajHgrY9FzKJIWRHnJQjCbghM1uBjnQx0rfhl6
         flxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=SOssY3xDk4ALFrqhJCocmmiqoBMCXjnTjoStBiOMek4=;
        b=L1F6+5OeuYE8a+Uwwv8ao8Xx6DGZDZnTR5Ma5mOiVea59OxYESAB03kusTjtI+5AQp
         0bh9PRodL1+WLmfZTjpj8UMUTIFw8ztc0IdIarKFNtDadan/6lQ7HkZwoNMb127V2lLu
         4S0TCgYCw8yJvKVLMxstkYUO2050w8nk/1y0jYOauP1AAjFpWQdT08ziFc3/0M4qJpFA
         QneyrtSHSQ2lcUekcodL/6+VkAlt2BN3Ci3ZAQBZvxEvXQIXU4kV6gOpHQJcG7wCWu9V
         bQUaZ6L6on7K4d/ODLaMC4VO2HcVJTLbbsPbpo4ADzapzd9Kg5hLVGVNDsi3PczGhs/R
         k9dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=px2bI0hJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si3215028ybi.210.2020.12.16.21.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 21:29:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=px2bI0hJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kplqm-0005cb-I2
	for alex.bennee@linaro.org; Thu, 17 Dec 2020 00:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kplqL-0005bL-3x; Thu, 17 Dec 2020 00:28:49 -0500
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kplqI-0006SY-J8; Thu, 17 Dec 2020 00:28:48 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id d11so12776251qvo.11;
 Wed, 16 Dec 2020 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SOssY3xDk4ALFrqhJCocmmiqoBMCXjnTjoStBiOMek4=;
 b=px2bI0hJROlnAP2Auy2e7Qk0hSHSb5u74ECThzkpvPrhcEQnJcUu6PsOo2QZ59saOL
 /wdIdPUyDf2ALmDIGRSc8g7gKquoLKvYT+LVrUijNjZyjecPkdfuksxQ3yIk1aW+v2S/
 ZuSUx2jndm280nWbtX2SFJIsc4FzucFEPRS97nbzw4bzZ+e5jBlQaAehc6Z9QlXqJ09V
 mZSUmLpLJzGIB2/hmeeXrEB+aaaXg/vPT3+ZMQ49zyhaSay2s7nrgjUhABDnZCuOV0mS
 d91lDfq+jJPIFxZlY+vvWqEohphCJS0i/zPBmImML8WTZP5kU/2+pr8Ws15dZ/yqPxMM
 QrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SOssY3xDk4ALFrqhJCocmmiqoBMCXjnTjoStBiOMek4=;
 b=KumEcujQ8Echax2gYZ1yr9J1+6BEhFpi17rCaLvFV2DA/xt7DK2nGtYffZhEMKUz7w
 ONgFbBHXWcBkDfvPyHWjdUTxqPSTaEaZcw1pDCq4lAVHELB/FzUTBmZ6gx7tsbP9z3wU
 +1u1BrEozdMr1TFPQozx5ajTkPjtSOqmvq/p7oXUFWjGQtSSKgfZ104FFq3cmQvd0n/e
 IM5kIHjtOW5DuvtQWFCZBFFR+h/69d8af1rwAbBUQgHcXH1TfhikDR8api2IhBKZjA9Y
 zsDaOLEVUrgLJhvB8W8Qmi9DcrXVbVmqDEcoogMfb+LqZCGafpEYe8OqdKd2/pCntLxl
 PW+Q==
X-Gm-Message-State: AOAM533DYgP2zJuH+XjiVc8BcmHlY6M4NTUSZRCvpDgshjOEgY/1/Yr5
 WTqhcFB9T6Ua6TI+gedm9MM=
X-Received: by 2002:a0c:df94:: with SMTP id w20mr46171146qvl.33.1608182925249; 
 Wed, 16 Dec 2020 21:28:45 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id i13sm2674072qkk.83.2020.12.16.21.28.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Dec 2020 21:28:44 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Thu, 17 Dec 2020 13:28:33 +0800
Message-Id: <1608182913-54603-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hVmzslFAsobP

From: Bin Meng <bin.meng@windriver.com>

The endianness of data exchange between tx and rx fifo is incorrect.
Earlier bytes are supposed to show up on MSB and later bytes on LSB,
ie: in big endian. The manual does not explicitly say this, but the
U-Boot and Linux driver codes have a swap on the data transferred
to tx fifo and from rx fifo.

With this change, U-Boot read from / write to SPI flash tests pass.

  => sf test 1ff000 1000
  SPI flash test:
  0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
  1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
  2 write: 235 ticks, 17 KiB/s 0.136 Mbps
  3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
  Test passed
  0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
  1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
  2 write: 235 ticks, 17 KiB/s 0.136 Mbps
  3 read: 2 ticks, 2000 KiB/s 16.000 Mbps

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/ssi/imx_spi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 509fb9f..71f0902 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -156,13 +156,14 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 {
     uint32_t tx;
     uint32_t rx;
+    uint32_t data;
+    uint8_t byte;
 
     DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
             fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
 
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
-        int index = 0;
 
         if (s->burst_length <= 0) {
             s->burst_length = imx_spi_burst_length(s);
@@ -183,10 +184,18 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
             tx_burst = 32;
         }
 
+        data = 0;
+        for (int i = 0; i < tx_burst / 8; i++) {
+            byte = tx & 0xff;
+            tx = tx >> 8;
+            data = (data << 8) | byte;
+        }
+        tx = data;
+
         rx = 0;
 
         while (tx_burst > 0) {
-            uint8_t byte = tx & 0xff;
+            byte = tx & 0xff;
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
 
@@ -196,12 +205,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
             DPRINTF("0x%02x read\n", (uint32_t)byte);
 
             tx = tx >> 8;
-            rx |= (byte << (index * 8));
+            rx = (rx << 8) | byte;
 
             /* Remove 8 bits from the actual burst */
             tx_burst -= 8;
             s->burst_length -= 8;
-            index++;
         }
 
         DPRINTF("data rx:0x%08x\n", rx);
-- 
2.7.4

