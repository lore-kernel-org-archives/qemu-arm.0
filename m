Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1283051lfq;
        Sat, 9 Jan 2021 04:45:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9bqeIZrfyB0mYj2+dyfQq3uvLnz87RNdNn8qZjoGAoZMpJIwb0eQyFJ1E9Jx4Tyj9S/K7
X-Received: by 2002:a25:aa91:: with SMTP id t17mr11368320ybi.394.1610196310681;
        Sat, 09 Jan 2021 04:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610196310; cv=none;
        d=google.com; s=arc-20160816;
        b=aeGDh5uhUXKfB2rTNjHOVvfLlz93cjJ5HK429ZurotGj07hkmublZExHyEUt5faSzh
         rRDft9s/FoN4NBx8nj2gWM2KZi0l/i689anTiPDOZeMG5pFcSoLWmPvI2qjai87FtJd5
         azkDXskry35vY3n8m6joJRd+5bET+nztSMJ4OCnluY7mrYL+Oug7R3dPjrKEQ2mn0/j5
         mqUgR0B+1tbbm+ccvCv5+Yj48lBpFRrtNSnwgJC+2uwimHSwLiPhGhkDp2yeWzsghbNa
         M9sv85kSR5BkCGopGq5E8mFA6rFugenxXf66B5qqldi8QQNYh8MdMtFB7q0EYhJ/zAnv
         faSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mG1MTXK9dNCfs7Rn1MWcFj8sMscSVuyy26GcmnPOYdM=;
        b=qpvABh8SWcfvjDh5s0pkuiM10morkXcaWjtvNBj60glGv4B0AnAiL9vRK4f0eRiBWg
         6pOhQ9vcuB+o8MEQtrw+QJjIRNxlCf9fgLf60wEqWLfXSjTLdmbtEUc50JujbzrxLYeU
         fat86P7sIfGSKYtTFO24mD6xQfz2wBvKwF/4liGbIH5xleX+4/wkVV5fwdM6f+P6bEaY
         eg/Yukto+Xt5W+7qgIZaTzOEWUwY+g9Fa2QhgJjCjQlHYTyiEcNUiJzInGtTrnl3fw60
         n119c1cJRTk/9f+Mxgpukn0yNIx2hynL3Q7M6Xw4zqHq2FDUicTGSDQpLemxgk09ROHR
         Xbyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pcYzFWX0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m184si13163785ybm.191.2021.01.09.04.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Jan 2021 04:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pcYzFWX0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyDcE-0000hV-1E
	for alex.bennee@linaro.org; Sat, 09 Jan 2021 07:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTv-0001W9-LX; Sat, 09 Jan 2021 07:36:35 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTu-0001mL-03; Sat, 09 Jan 2021 07:36:35 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 11so8018199pfu.4;
 Sat, 09 Jan 2021 04:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mG1MTXK9dNCfs7Rn1MWcFj8sMscSVuyy26GcmnPOYdM=;
 b=pcYzFWX0Y0ahryzO4n3aYv78WToGnijRSHa/OoRZPdYNXUL1VhvMQXJvTCphAIo6E4
 IqBXKb/89RvHo3zlXgrdbqOkn16bSwX0yopprU/52ph/rnwyAQm/BMY1kYjpvyXpj+8Z
 qcBxSNUn9460CiE0VEzGgHkDgWjqOGKu/4EUkUB0AWRaLyC9vmnTiWReCWl6SoBb4PB6
 JZfNb6mI+DKuRUhUdUTN4meXS0+IJ7xHx8ZYQtMqzGaAqwWAi6fhaT7HDb8Xc0FXKyNh
 t8fsjJzOqjNVW0w6YmQbw2Wh15xd03yzW7fvmtYP3TJKbJZ8x344hh04yuyQVqU8yp3T
 k5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mG1MTXK9dNCfs7Rn1MWcFj8sMscSVuyy26GcmnPOYdM=;
 b=jsjoHXgSaZEsKRgLGASAMYixeJcISiqthjDUPS9NiMSfWiW/OaKudHrnQHIXvouaCQ
 axTPRqhy5o5AzDi5Hswgj7EFpE78UaZmNm5vxz+she2CTLpCI8KBMn5S2v+lehkwM14y
 CjaseVQIg6v/tsYtiZ7Z9ZSzWgIJNc5ySS9fE8wdRemvexgzoJT0Fng7U5XqL3DWKpht
 BKYbcQLFdr3anmbPysVtRfngYpRwu1JwGvX+275dcQrd5a4V9oF58u235aJ89dVbBTDG
 cLXpdy9ub+GJhYJfmxn/6EwRrLV3DYMRaTuKXOUn2hMpG7NP2/oq8NGW16eOFMCBctQ0
 We+g==
X-Gm-Message-State: AOAM531AszTHEmJpyBCA8y/TSrDsc6XpVdJwgf9Cyi4denkOtpn/O/M8
 US5UgVZ9aoAVHJ00E5LBxwra5a790Ho=
X-Received: by 2002:a63:1d59:: with SMTP id d25mr11322861pgm.259.1610195792482; 
 Sat, 09 Jan 2021 04:36:32 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:31 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Sat,  9 Jan 2021 20:35:45 +0800
Message-Id: <20210109123545.12001-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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
X-TUID: 5stuJOrchEN6

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

Changes in v3:
- Simplify the tx fifo endianness handling

 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 68a32b689e..a81242e860 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -171,7 +171,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
-        int index = 0;
 
         if (s->burst_length <= 0) {
             s->burst_length = imx_spi_burst_length(s);
@@ -192,7 +191,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         rx = 0;
 
         while (tx_burst > 0) {
-            uint8_t byte = tx & 0xff;
+            uint8_t byte = tx >> (tx_burst - 8);
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
 
@@ -201,13 +200,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
             DPRINTF("0x%02x read\n", (uint32_t)byte);
 
-            tx = tx >> 8;
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

