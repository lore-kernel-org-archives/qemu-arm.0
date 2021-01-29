Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1125961lfo;
        Fri, 29 Jan 2021 05:28:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZulBRFuZfouYQ3XvvNP69nVDl3NAqbYrKnygyAG+96R07i0ScNLkSEOBrVpRS49NH9YtM
X-Received: by 2002:a25:344e:: with SMTP id b75mr5690346yba.377.1611926935786;
        Fri, 29 Jan 2021 05:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611926935; cv=none;
        d=google.com; s=arc-20160816;
        b=DG7AqBw3Zxr+PptjzX6v5mv7LkgnaXyZ352AvBq3sCztIRAVhlBXBVjOHEIQgtt6Gk
         lEVf4fgsg3NuBKsiWfKQKiyXKbhTA1BjiniLUVEL8Lidkr5zLbUCgKYrolPV0cTTk4dc
         jjbY+QLI84/pXtLo1LL+i6zDlL0oHkh+KZqOglElj2Pk2DkGYVucOK9ESDWPby9SrdRk
         H8yzUSMqgyg4BXR0rFaeqPUbHWgl92dREegBq5ZLnHJSerLXt+Ziqy3IcoiyNJgvAzfa
         ekBeHecig5poLg47iefLhKdXQe9M0b1TIaNCzBzQLU9NrznCI3jZuoK5DKM+GTRq2nvh
         M3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5mXXyyknt34UXruqKVI1mRb9uaGtIfcaWSlxoOQ+8iA=;
        b=KUzwtI45PPmkROicSNetRytNnL5KYWPe4q2tk2zCZr3YQY9psEWI2TB7ztVUKfubVE
         S8li8LOesE6E3R+wSwiKQ9OlJsfCa0+D05VY8UgTZZ/t6SrotPZZXI600EDZSJyDL6nB
         miSVzmygvVyPXRiI4dyzyNP4uDGxOxGEehM1LtDpZUmLvd0ztbA/w5CFqjxUY5SeEkW9
         3uRTwwNzyOfDk91/sKxC9RRJ+Ni0Kbl22FzFnnJkbHTyscsWWDYsI7AO2TDdXH53syF3
         fZUOI+xY5aj+eHnRxM993WsoEkuqmutt5loAht3vetNLapyYgtbyOZhN+h7ojwU6fZyH
         v1AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0+Ihryo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si8820094ybk.80.2021.01.29.05.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:28:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0+Ihryo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5TpX-00082G-3b
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tl8-0003oz-Bq; Fri, 29 Jan 2021 08:24:22 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tl6-00082F-Nl; Fri, 29 Jan 2021 08:24:22 -0500
Received: by mail-pf1-x42e.google.com with SMTP id e19so6221381pfh.6;
 Fri, 29 Jan 2021 05:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5mXXyyknt34UXruqKVI1mRb9uaGtIfcaWSlxoOQ+8iA=;
 b=b0+IhryofXgzeqY/ClfgBYRj1BGdTbR0F00TslTqkjyhVRlWYmUStnxQEK9GO622UB
 nanKSaSp2uKzgTVTHq1GIE2ey2agSRhilKZX7WbN4AMuOAOJun6amrLbiIPfmfDNeH7M
 K1y/IFD4sOKXVZsVsQ1Dit27HEn4zvcsJf/zgiuFJoBEOQxF8rTOV3IJzCi0IdZ3+qPO
 oATD6Fsy98GVAgQJSghr8ycrtBH/cUNrr9il8BBnn8YYqYwMxd8aMM6QVA9vCLB2E95Q
 OD6ht5ioOnDFnelWfXetB2o8gnnmFxHdyQCjei7aSiLZppjYLFXNzLkMq2vrV80ZEh2d
 Nb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mXXyyknt34UXruqKVI1mRb9uaGtIfcaWSlxoOQ+8iA=;
 b=CxJ1k75yi+2mvDUjqdVDVyMbd5ULklldt+7iNgHjwuhuEQP6ahnpkye0N7GZwfDZNh
 0QXo1GRe4RsxjnvdmvfoU2SUdO2mF/l9aPp84nEFFJwR0vcRNOzDW+J3JuSBuWsBy5aF
 qDPfIvyYKu4HOl3VHm5fNMIRwuezd4bS/IuqUKkdtwmReQn4784sQ73YsnjTiBMYVQfZ
 6UHLV85H1aUzYUX6WiunUlZ19JLXb045uDQ0XCOSNCvEh2oZJUOWvrbbYpIkzXboYrYC
 2GWu5wYPqC24lPRfKUdSQmJ/MUT4BemYUg/lcrAPtuK/9k9M9ArymKkeukyzHCNZbPe8
 PDOQ==
X-Gm-Message-State: AOAM532tEna3Gzd+vPClS42xbvUXun1TyA631UoVc3Lai5xfcNOaQsMi
 DMWxvxfC8We2pWA66UxiM8Y=
X-Received: by 2002:a63:c64:: with SMTP id 36mr4751076pgm.282.1611926659235;
 Fri, 29 Jan 2021 05:24:19 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
Date: Fri, 29 Jan 2021 21:23:17 +0800
Message-Id: <20210129132323.30946-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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
X-TUID: 9uAKNbvIQAMT

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the block is disabled, all registers are reset with the
exception of the ECSPI_CONREG. It is initialized to zero
when the instance is created.

Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
     chapter 21.7.3: Control Register (ECSPIx_CONREG)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[bmeng: add a 'common_reset' function that does most of reset operation]
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v9:
- Add a 'common_reset' function that does most of reset operation,
  leaving ECSPI_CONREG clear in imx_spi_reset().

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] rework imx_spi_reset() to keep CONREG register value

 hw/ssi/imx_spi.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 8fb3c9b6d1..e85be6ae60 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -228,15 +228,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
             fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
 }
 
-static void imx_spi_reset(DeviceState *dev)
+static void imx_spi_common_reset(IMXSPIState *s)
 {
-    IMXSPIState *s = IMX_SPI(dev);
-
-    DPRINTF("\n");
-
-    memset(s->regs, 0, sizeof(s->regs));
+    int i;
 
-    s->regs[ECSPI_STATREG] = 0x00000003;
+    for (i = 0; i < ARRAY_SIZE(s->regs); i++) {
+        switch (i) {
+        case ECSPI_CONREG:
+            /* CONREG is not updated on soft reset */
+            break;
+        case ECSPI_STATREG:
+            s->regs[i] = 0x00000003;
+            break;
+        default:
+            s->regs[i] = 0;
+            break;
+        }
+    }
 
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
@@ -246,11 +254,19 @@ static void imx_spi_reset(DeviceState *dev)
 
 static void imx_spi_soft_reset(IMXSPIState *s)
 {
-    imx_spi_reset(DEVICE(s));
+    imx_spi_common_reset(s);
 
     imx_spi_update_irq(s);
 }
 
+static void imx_spi_reset(DeviceState *dev)
+{
+    IMXSPIState *s = IMX_SPI(dev);
+
+    imx_spi_common_reset(s);
+    s->regs[ECSPI_CONREG] = 0;
+}
+
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t value = 0;
-- 
2.25.1

