Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp581789lfq;
        Tue, 5 Jan 2021 21:59:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB7z2AllJEGeG5Y9n4fsz+AU5a+9RX1n8IK2UfKzkRapKlIARwd9LR1/21wwQRTNagHf2T
X-Received: by 2002:a25:bf82:: with SMTP id l2mr3975294ybk.1.1609912745733;
        Tue, 05 Jan 2021 21:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609912745; cv=none;
        d=google.com; s=arc-20160816;
        b=pYS7P/4FFdtby9pmw+oDppNPS54C8fe2T6CuEwxNESPE8anlVrcUbC+uxdFTjRFDmo
         njrsyUkBAOpSSskyqZPs7wPp5II9g6s4uUtN03AQ3tJMWUajHx1Fe6B2adPA83sEp/de
         7nmOqUl2z2Rxqf8Ui45lT9G+i4cShAeW1S6ZQ0AAA3+24/iddmRO+X8xtEDfhqsiTNVz
         d04vcnjcnam/JXDT0HrKdXDETnCAdqD06Phv3KSjOkwm4r0zeIDzhRIP4g0BNLbQknWA
         agxNF2o8ofHCetVjaCHwiQ0xDvKF5QXMixbTgh9DX8efnpp4RqxoNGLmctW68UlhVDaZ
         iJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1pk+YIujJUj7e3iQ8JqgaH4k0EIfTRLkfSX45O6GJA0=;
        b=BuogoSbdjMxHdYXL6ihQc+OkHZJqo85PUfyjlyC6VD5gGKdx/k6HudfmLZ3mR5ustX
         75U2wZ/eCEZOSdmmwMjm358mz0MJDcKSHhCWLrSD5R5n5Jv4eYJ3aTIbEe6x73fqQ/GF
         qqm2+rXwIaxn4xnIGEvE8Pl5iWJkAbJyNSQtFw0HrjxP5Nme4Dlp+tIrKmjWUErRggyn
         pQgPdsHTUqHHBuUqjcyd4bXWWXiAv/l5kImgQqStGu/f8NVFNLPtm0y32xAseJhdXjdk
         k4gUzB76Q2UKqX/4+Kk2r1Yog+q/paxJTqF82LBRwQ0yWKDZT1YYkbctaWbMTQZoinA/
         D6Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qXNJ6YJc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e134si1741984yba.92.2021.01.05.21.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 21:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qXNJ6YJc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kx1qb-0000Wb-4c
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 00:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nV-0005Me-2f; Wed, 06 Jan 2021 00:55:53 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nT-00051s-Ds; Wed, 06 Jan 2021 00:55:52 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s15so1009188plr.9;
 Tue, 05 Jan 2021 21:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1pk+YIujJUj7e3iQ8JqgaH4k0EIfTRLkfSX45O6GJA0=;
 b=qXNJ6YJcFKp7BJQL0ktxtvk4OqQOR5Rr3OUNVrABhXKnaNWOvOE0b9XONhahlG6GG5
 c81HQSkxuZXkhwgLmFjcHsDWIeBk7d4L5PqSMvYz+JkBDYN5ujBiipoLZ/QA4JWsJhkW
 h+WMMV9zwiPdsynOkBLFd7Flhw3PU0d32nA+xs6LDjpWPoastlAKqgOMXBxjfq+A5CeO
 DR3br5j606Wp9eHm24CBZ456ISImtVWKFpKM5GIWjKmvs4tGmC3WZcISyGymOlKLTUlw
 QF/iJVAktYVo2zs7gfIbwUiJD+kLXltH9emeBLoEo6r7iPLTDHZHjsISre9QyuCRsrVA
 kfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1pk+YIujJUj7e3iQ8JqgaH4k0EIfTRLkfSX45O6GJA0=;
 b=s1ZnqQMnIdWBD8cuHYBYHtSwcY39gYZ613qDfAmJUoZp2JhCCWMLpNKkDb9wa2pAHs
 aA8MgpD01GEtN+DkLJhiLoWj3WuMz+eYj0au5yvRm2otZcWeBDhI09FnENYLJCAbH7C4
 jW0kmhlWibZFaNDQCd4dURQNi8E5FoMIAV4shfJ49G0lc4tG/5+jhv9pk46FY3y4ziq2
 YE1nlBeYp1STlinKJlxg3eqRb6r5G1b1R2zopZMSUvSEwN+N62BcgKRPDUDeGDhr7Dc2
 dXapMYJ3FPXo75tRsz7Z39F90yccazGQ6enadSXFsOwTRP2wqZzNe77WAPOvBGBiNhl8
 KBsA==
X-Gm-Message-State: AOAM531xv5EeO4qqxutnn8tYszuwIcrYM9G4QQ0eCdYPouu1DqVCidVl
 E7jOCE180qBPX7SAWq7/IqY=
X-Received: by 2002:a17:90a:d70e:: with SMTP id
 y14mr2675871pju.9.1609912549894; 
 Tue, 05 Jan 2021 21:55:49 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c62sm1070503pfa.116.2021.01.05.21.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:55:49 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Wed,  6 Jan 2021 13:55:22 +0800
Message-Id: <20210106055522.2031-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106055522.2031-1-bmeng.cn@gmail.com>
References: <20210106055522.2031-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmfIhYH/6vtY

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

(no changes since v1)

 hw/ssi/imx_spi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 0cf07d295c..d45aaae320 100644
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
@@ -180,10 +181,18 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         tx_burst = (s->burst_length % 32) ? : 32;
 
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
 
@@ -193,12 +202,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
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
2.25.1

