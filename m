Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp879554lfc;
        Sun, 7 Feb 2021 21:26:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJympmqu9AWGN/26sBZvN9d1+z6k4SSyVTR2P9JODxiQtT6Fs2oNXLgwBaYxfBFibBj1wgon
X-Received: by 2002:a25:50d5:: with SMTP id e204mr1959750ybb.294.1612761986071;
        Sun, 07 Feb 2021 21:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612761986; cv=none;
        d=google.com; s=arc-20160816;
        b=qc33vqDRKWNkEkP6myOkvK5zWS9niuNQG1jumLoe3ab0ZAcPwciZDtK2Tg2BMusn/Z
         Ze0spCVdUCF9nxIaezMQH4rcgHRiL+LvrtvWbiXtZre55urTtF0jT6G5+CWhjGI1mQ+H
         Gm08r6gwKvzpa/75/ZSlyFCGZM5hq1U0hwgxuFOXyXOr2Qt5TB2d0AQC/34bLBzo3wsJ
         IPvAAT/wKMdt8W8Phjxrf7k23pc/YZt9nMi6ycN5GU122Y79HXsR7gxZ0wAUlTLCla8B
         QtYco59EcPybNyHYUMUyQnuwPZvYNm2ykBGZiySchcGICJyX6cRdO4d84QSO86m1IUVv
         KTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vlegheEyqXl7+NwMvyJSahCC2mYTto9ZEvw05hdEWZ4=;
        b=S1HTAvOsHgvfxRGAhD5fNeD5TLt9FjBPl8B0gskVhKBKZhvodz/4SP38XegT/XEP5j
         LIbu7WYgxD5UVsjbDaXohVnap7FXlyPHJPEyZnEOK2GKZYxy3nkPE3lOV7JAwaRBjBrO
         QTHxLiUh0XNd1ACvomiGddCCRFHEOvSWdPcDbX3dKkcwv1w6xFbc7r/sAUZpS2rOV6Qf
         xtMU1PgQQF7RfSc/Fm9Rc0KkSC12lcJ+NuJvJYrVrOwYxoteKlC9TXoGryJVVjM9KXcG
         a6VpXyVwiZVGpb7rTa+bL1QhIcmSTn9PqhZcopetCFKvLdmGQfYarwT3ColwW7D/jNm5
         hs+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BaL1JOPL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si17170026ybt.363.2021.02.07.21.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 21:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BaL1JOPL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8z45-0000QJ-EU
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 00:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8z3Q-0008KZ-CF; Mon, 08 Feb 2021 00:25:45 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8z3O-0005BM-Mj; Mon, 08 Feb 2021 00:25:44 -0500
Received: by mail-ej1-x62f.google.com with SMTP id lg21so22642238ejb.3;
 Sun, 07 Feb 2021 21:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlegheEyqXl7+NwMvyJSahCC2mYTto9ZEvw05hdEWZ4=;
 b=BaL1JOPLldeyfiXpNIMkeR7ihbFwDLlVejktHWu4EiHGEUQbOujxZN3TRqCzWeilas
 cidDCJELpxU4mSuLayaR0JU9bNvlJEUO1rf0DmAk1mJg+i3026h5MhRrBpfbFj7S+8C4
 jwjcZ0e7XZSUO+XVupwt2tI2K0wzlzuYqbt2w3p/et3/JcvbgkLpCY9/0bYphNnh6Rco
 AKpDy6XeI4nWBLLaQGXR4QLbkhXhqr7sIwu15wb5Ws4e1FjgDL1xAewbotOxhEjp7etU
 86cMK3dajOXVKT7NJno/9HYBBw4pi986e+KqbKdVho2H+ZyNqzFjRQs//rLYt4+u1Iag
 rqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlegheEyqXl7+NwMvyJSahCC2mYTto9ZEvw05hdEWZ4=;
 b=rF454Pe4TVrX429TUv9pEqGBLCFn1zHGNdVEfBnt1TVkzgJ7TOyNAftLtYYBgs5J8a
 tbbtNWeTBqD6qXkxWNvFN+9p93tX2gTiT/+1TAnmdc2rofQW+lJMTPrduvlWRn3RSPxw
 cqQPV5/OpaFhCpGpekrn8cNkATp9lXc6R6MFSiuRLe9OZV79UQp+hFgxdH9ahFsfhBw+
 UZTON5lXEabZex4XN2HBubunMHCaBsXMVefwTV7vO9WRPjPYlOU2+ADRneD4g/SECxUm
 Tvi1Hcqu6FA6VNHAh23XJp30yv17znBUqp0NBprzlNUvpTT3oyv9kSwy/qo0uPCuMkNP
 Lo2A==
X-Gm-Message-State: AOAM533V6StMgXmOR/1gaiV2tebDwEdjznA2uv4oBYohKEuYF9He20ob
 qeZbTdvVI5lMsr2mBbF1ZQk=
X-Received: by 2002:a17:906:2ccb:: with SMTP id
 r11mr15607538ejr.39.1612761940761; 
 Sun, 07 Feb 2021 21:25:40 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id zk6sm7961098ejb.119.2021.02.07.21.25.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Feb 2021 21:25:40 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/ssi: xilinx_spips: Clean up coding convention issues
Date: Mon,  8 Feb 2021 13:25:23 +0800
Message-Id: <1612761924-68000-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VamzVarWyN5u

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xilinx_spips.c,
as reported by:

  $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

(no changes since v1)

 hw/ssi/xilinx_spips.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index a897034..8a0cc22 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -176,7 +176,8 @@
     FIELD(GQSPI_FIFO_CTRL, GENERIC_FIFO_RESET, 0, 1)
 #define R_GQSPI_GFIFO_THRESH    (0x150 / 4)
 #define R_GQSPI_DATA_STS (0x15c / 4)
-/* We use the snapshot register to hold the core state for the currently
+/*
+ * We use the snapshot register to hold the core state for the currently
  * or most recently executed command. So the generic fifo format is defined
  * for the snapshot register
  */
@@ -424,7 +425,8 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     xlnx_zynqmp_qspips_update_ixr(s);
 }
 
-/* N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
+/*
+ * N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
  * column wise (from element 0 to N-1). num is the length of x, and dir
  * reverses the direction of the transform. Best illustrated by example:
  * Each digit in the below array is a single bit (num == 3):
@@ -637,8 +639,10 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
                 tx_rx[i] = tx;
             }
         } else {
-            /* Extract a dummy byte and generate dummy cycles according to the
-             * link state */
+            /*
+             * Extract a dummy byte and generate dummy cycles according to the
+             * link state
+             */
             tx = fifo8_pop(&s->tx_fifo);
             dummy_cycles = 8 / s->link_state;
         }
@@ -721,8 +725,9 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
             }
             break;
         case (SNOOP_ADDR):
-            /* Address has been transmitted, transmit dummy cycles now if
-             * needed */
+            /*
+             * Address has been transmitted, transmit dummy cycles now if needed
+             */
             if (s->cmd_dummies < 0) {
                 s->snoop_state = SNOOP_NONE;
             } else {
@@ -876,7 +881,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
 }
 
 static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
-                                                        unsigned size)
+                                  unsigned size)
 {
     XilinxSPIPS *s = opaque;
     uint32_t mask = ~0;
@@ -970,7 +975,7 @@ static uint64_t xlnx_zynqmp_qspips_read(void *opaque,
 }
 
 static void xilinx_spips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                               uint64_t value, unsigned size)
 {
     int mask = ~0;
     XilinxSPIPS *s = opaque;
@@ -1072,7 +1077,7 @@ static void xilinx_qspips_write(void *opaque, hwaddr addr,
 }
 
 static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                                     uint64_t value, unsigned size)
 {
     XlnxZynqMPQSPIPS *s = XLNX_ZYNQMP_QSPIPS(opaque);
     uint32_t reg = addr / 4;
-- 
2.7.4

