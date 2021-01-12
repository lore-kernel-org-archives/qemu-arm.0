Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3799634lfq;
        Tue, 12 Jan 2021 10:53:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBOln7qN5FEnG6A19TOzN60Lt80f6a1nukOfdUVHQY9sPpqyM6yCWe34MTbnabp/ciD1SM
X-Received: by 2002:a25:244:: with SMTP id 65mr1436663ybc.350.1610477623538;
        Tue, 12 Jan 2021 10:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610477623; cv=none;
        d=google.com; s=arc-20160816;
        b=AlB9NyA0JxaNwFz8eDMaTPdlQLOQFEa1ULGKciSDtPZ4VTssDn3sAWj7+KpMxW4hU3
         a07KcLA6r4lT5fMWJ7kitGQIBM5PwijmGwvhryGcaC1v3m6zQuQXZqJuAtpAQ3hyLC/m
         SW372uAFDynMooa7ixIiR5mem75bz7DVMFTqBvuiOAzD/YlaZJhf7jWiAA3IzglOxoaD
         x6a7Yi3ACsHjtHFM2nbhdg6V98RRoIRZn0AaOwHojNPebjgi+EgSexBBdrE2ag+K+it3
         /DVCm14T9PS14io4DzPAFs4PKDnXa4s6NxJ30QRLwlUY3jYvzzdhsBfBmBe6W9ZR1+VO
         wEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4l0kq3wxIJBsGcT12cxU3gmDmz9IWzR6E0aRKmJTUjQ=;
        b=HmgEvBvTFIla9mQZ5vCmA7NZs8gw/aajf7H2C1JTy/e5D93N4LZzkNQ+JYU1m2u0TX
         l55VUh2dwm4Shmfl2IP+ewIN5MxIsr4vmpsbbqlt1NU881ubwMiiTZAxaCGsgPp0VYhH
         sb4TOamaHpyBdHMxiRhEC2F6GPDIqesURlhTSYHaqIANtR77F8g4Hxrojd1pXih21Eq8
         ZnbR021SBoQ56HgeuOCe50wR5FFYN/Mw+m5GbJcIJl7QegNkPNfxjoX+tgo8AaXkCpgS
         KWdXvXj/HWOOrAQ+fkytS4zZea4dxq65sqmm+OU+08etZEWRMSRWq9wD8cs7GtrNizMj
         PpUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mFaV7NYm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si3208698ybf.392.2021.01.12.10.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 10:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mFaV7NYm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzOnW-0000fd-QN
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 13:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOXA-0002PW-Ni; Tue, 12 Jan 2021 13:36:48 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOX9-0007bO-6D; Tue, 12 Jan 2021 13:36:48 -0500
Received: by mail-ed1-x52c.google.com with SMTP id cm17so3473335edb.4;
 Tue, 12 Jan 2021 10:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4l0kq3wxIJBsGcT12cxU3gmDmz9IWzR6E0aRKmJTUjQ=;
 b=mFaV7NYmXIn6g4HptlIczJ+2QraPAoku178SziHN3Ki75DJqHBhEvxiMUFN9Db/nBx
 +hpOdBPj375NjffcD1HiIAs4TLsQpAJ3SS+TswKMivRx88KPUJ9KDomUrY4NOxyYm9OP
 kkT0DnHoxyD3eW1DWDNDV9rr0qpNuOs0BbiHOSJgWV1M5i1nla/YhnCt/7M4qY777ylt
 vsU4V9oZXrS4cp5QMIaaIVzk6ftBVMGoMDQO+lq/WvOTP6vZkFIK2a4TuYCpUwyNxT+p
 KueS7vkMS0OWpht6FpjzH2EztTtYqkHyle3ThJksYEMhKjsC0pu3vmRcOhN5IanM1qDq
 ooog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4l0kq3wxIJBsGcT12cxU3gmDmz9IWzR6E0aRKmJTUjQ=;
 b=TAIIQKe6L76Dv5S4lgpRqrMW80V99szn2Okt033+pFGjjZNLztLbKC+JMJuhpwlpj0
 Tts32xCoJZrh8XyYxWZKnmHrYAM+1g8dVGkCOy+5RlTHpb0667LAaO7Fn6MMTbD1JWMq
 jktMuijlZDKFFQitkNMIsIwOzEvxtIgskBo+pH+DbLD8AL3dVT7xLu5b3BYGSe05OkPR
 +kyNLT6nMsEzTofV4tl4vm9nYf84ZXNtCftDKuQh5nT+bEXb4HJzB6Ji4kNyIXZJ8pzQ
 lXUV06f7KMCfokf6aKkQ66Sc6hmvPNxgvwm0xemri9XR2V9rkb+RMJ7HVuk/tZPijYtX
 GTeg==
X-Gm-Message-State: AOAM5308XKw6FFVqk9SNkyuFXiCt1oXQ5ww420V0BqYOHKXfuMJxJIao
 947iIochQLjzwd/pFBKzYAw=
X-Received: by 2002:a50:fe0e:: with SMTP id f14mr372860edt.159.1610476605633; 
 Tue, 12 Jan 2021 10:36:45 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id k21sm1830660edq.26.2021.01.12.10.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 11/11] hw/ssi: imx_spi: Correct tx and rx fifo
 endianness
Date: Tue, 12 Jan 2021 19:35:29 +0100
Message-Id: <20210112183529.2011863-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hrrj1uGNIVMz

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
Message-Id: <20210112145526.31095-7-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index c4e2d2e1c97..38892698918 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -176,7 +176,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
-        int index = 0;
 
         if (s->burst_length <= 0) {
             s->burst_length = imx_spi_burst_length(s);
@@ -197,7 +196,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         rx = 0;
 
         while (tx_burst > 0) {
-            uint8_t byte = tx & 0xff;
+            uint8_t byte = tx >> (tx_burst - 8);
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
 
@@ -206,13 +205,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
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
2.26.2

