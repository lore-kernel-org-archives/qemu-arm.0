Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3621825lfq;
        Tue, 12 Jan 2021 07:01:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAYKi9SryNROh0OTISXCfk9uUBpSk29qqIhkktISggo31/Ptk94jQBRaVZlXy0jMyrvPFj
X-Received: by 2002:a25:ac25:: with SMTP id w37mr6731566ybi.522.1610463701064;
        Tue, 12 Jan 2021 07:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610463701; cv=none;
        d=google.com; s=arc-20160816;
        b=IFlU0GfTnQVtrdwxJctLxlu0QPuLjnLIU18yjI/+m3Z55gecg6Aomd/fcWfNP8JTN9
         3+9M5wgE79vbWcT0x34UUArtABZsGLHi6aiUMp+lmJolo4Ndkc/X1bU5oFA9fPsfPsD2
         MCaGAYBD6bRScMvUhD8/nZARcxslY9m6LmOM9vKP+xNt/73eIGXoF/9NszBxFtv0YZmO
         9c1lWwJGb9ZPD1/RajK3q2IrUtT4cPrDot2XguBKNXCIMnwHDogRit/GrcDRkqWz0R35
         SNjIfSXbjTG3PpI/KaMvEO05ndcYjib/4DIpe1QeKyONLzYNYBGUp8T36bSMYjQiGERA
         SJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PdFwrdJNlHNeKN1ZR3AWcNlXHaUv5kTriH28HT1ONsE=;
        b=c19o0O4vjIaI2YQLDDgd0m6CN77ED2Ry39/F6HMfL/w7Ja2VCHuq0QOD6O1XQe/Yzl
         lBMCMUU/Ab7G7DqcBTEH8t8ZRLdl6VWEbDGLXiTqPiFoQcvX5oOLPpERMoWpg2MGqX5K
         ByvYWMLyJVA5xzkT5P+T0xauNiwl4blMZNHnFhPZKAbY/eXn6cPm/wWTJB4ARWvq1OIY
         G4C2zjOTaJWMVn2OT4jMmUkRCI8i2OBO9FmvEM5Se6IFAJZNHwqaORof5NGuVPYLnzu4
         +99sSfa+6TKt3UmiUm2OYJuGFrM20gUoXXkAUtgFKM/mRXlN5oXpNEG/40ZhFcPcEl98
         fqqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jzBdg7mm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i136si2728323yba.368.2021.01.12.07.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 07:01:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jzBdg7mm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzLAy-00057p-D5
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 10:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5V-0008O7-50; Tue, 12 Jan 2021 09:56:01 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5T-0004ps-Dk; Tue, 12 Jan 2021 09:56:00 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z21so1611864pgj.4;
 Tue, 12 Jan 2021 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdFwrdJNlHNeKN1ZR3AWcNlXHaUv5kTriH28HT1ONsE=;
 b=jzBdg7mmfA4x01sDM2alMcCvuxxVAACStuygbnWbFw+cSnyMTQpfltBRIlnl/D9KSO
 1Exe58GomaponQIuV/1Dp/ag8g8/ykYsO1CWVVsm4FiIaQHOr2NofeJmtkr+Pr0aQxN8
 pSRJVDB8cGX05CjovOpEdwDwBllZbr8guxcD+p1GvQ4e2vY1OQSpkbT+XUdK97+sxCnj
 V+ps3noiNU/tPhVLV7GcSPDtI9p3hxk8/kZRjsG6HoAaOew85XdBfj9C17SxbM8hIyss
 SgPmycYt2bLzqQaDpnW3bJAduMc2MRa5SO/ttN4aI0Tj1cg+xQKtuYff4pNOFAAxARUa
 3AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdFwrdJNlHNeKN1ZR3AWcNlXHaUv5kTriH28HT1ONsE=;
 b=T4728BjMgnLK4kFHbqM3PU6AmsEqyhAu8lNxR818UCgdhqSiaemf9nd1cxiSC3BIAW
 r4ZHE3YtOVPO/gurcQcUUVWDSaJWkhsxy9s5+nYc4InqR+84aXwK9jtwVarYryJHuGms
 Qy9ICONhYjS8EoPCO1JInAjf2JrpdTe+tmV81BU+TxCy4YjiMpMMmKCyeJqLxdfDS6L1
 KlSl97hwSvTEjPeA27up+YVsrlQLjLKupjw4nInDjVnhRtuR83o7lEZdXlAVTvCncw+d
 178+1P6RmZJD5ZhgSEXU78EcgqtNw28fwkgvuTaDHgbRx88sBbyMCZTcfLmBTXQlly0p
 cuMA==
X-Gm-Message-State: AOAM533Z+AhOCz9cjtqeDhp+kCTCTjJek6twtSDYWj4es+C9upVl5Gqh
 5GHXel6Pr4s51fo6qIvTI08=
X-Received: by 2002:a62:14c4:0:b029:19d:d3f5:c304 with SMTP id
 187-20020a6214c40000b029019dd3f5c304mr5069333pfu.55.1610463357711; 
 Tue, 12 Jan 2021 06:55:57 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
Date: Tue, 12 Jan 2021 22:55:26 +0800
Message-Id: <20210112145526.31095-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
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
X-TUID: 3AHQGsE2II72

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

(no changes since v3)

Changes in v3:
- Simplify the tx fifo endianness handling

 hw/ssi/imx_spi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 5c2d818560..bbbf6afce5 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -175,7 +175,6 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
-        int index = 0;
 
         if (s->burst_length <= 0) {
             s->burst_length = imx_spi_burst_length(s);
@@ -196,7 +195,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         rx = 0;
 
         while (tx_burst > 0) {
-            uint8_t byte = tx & 0xff;
+            uint8_t byte = tx >> (tx_burst - 8);
 
             DPRINTF("writing 0x%02x\n", (uint32_t)byte);
 
@@ -205,13 +204,11 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
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

