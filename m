Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1543532lff;
        Sat, 7 Aug 2021 18:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7sIglyqFxrqz6OvsmzcBwyYuD+fAOiU0ilz+dLM7rT0t9b+poxPH/zMS0qx2j4damV9hy
X-Received: by 2002:a25:b84e:: with SMTP id b14mr22135088ybm.237.1628386474534;
        Sat, 07 Aug 2021 18:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628386474; cv=none;
        d=google.com; s=arc-20160816;
        b=KH/RW+fa6SoiBYd6luUegvjcHB/PtgRdJ+nEu9a+0ynBDjn64xRxKM851E5E8rDb/p
         Mkr/5PFBz7imdq4cCzvH8SnJatdYasa6iPEHBKfH0QDx+nT4sCA2lfzh2073fxJguREb
         AFff1yJwvOCvGonSDf+v4OqNzELwd5plsDPV7ftSGdPCFBtGnZKD0LDRN6F/ureuUOKk
         YV4YNqejPwsTJJ6pkdSlWzboXPTaxJHBs4B9t9RYDJihSQ5GmLbxtyd6r2zboqqNwocc
         c5qvIAL4rFr8yWnisfJDVUgXjA9pyWXXdgK0r9DvRJg8Be6GbdaQzeSxUmnXdFyJ+I02
         +ovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+9BsIZGgvgPMUOuiQBq2UHEDPz71+8oHL0hrWz+5YBE=;
        b=ykAGO/naz+rkWga3JVmtZTTqVLfESMnWzw2VoXW6x2IQIuIS5Sz9+cLHDOek8eHS8V
         2MU2UuHAuiujb9JvMimMlfiwJ3yabypO5cLpLQbGIrwhR5d2bwdyd0biSUtMblisAq6W
         IkYCQ6dZHB0MeYIIqjmAaTRiudiI8VdkkDeoFwoivHX/LXLrcFWcEN6g6mra8DGOVB1e
         y8/cdTutZmqvFZQtUsBMU6UwNyf/i7JDasDRZICU50ymeV7HNOmtaYKN1tK4AxRUr6c4
         rGJa9hXYAt1flqkHAVdCXBjE7LvPGn+bI4xZLAQJ76Fia8E2zrr2a8xBsw+JD33e2o3Z
         Cw7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rwOVcpdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y132si12414744yby.333.2021.08.07.18.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Aug 2021 18:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rwOVcpdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mCXhw-0006Bo-QF
	for alex.bennee@linaro.org; Sat, 07 Aug 2021 21:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mCXhe-0006Bc-KX; Sat, 07 Aug 2021 21:34:14 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mCXhc-0001No-RO; Sat, 07 Aug 2021 21:34:14 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 g5-20020a9d6b050000b02904f21e977c3eso13747490otp.5; 
 Sat, 07 Aug 2021 18:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+9BsIZGgvgPMUOuiQBq2UHEDPz71+8oHL0hrWz+5YBE=;
 b=rwOVcpdqr5LJYOGQ5VABqXPMN/V/rXxXuMF4f7M3qrq9GmRsPz08Uo7Cya9w7vnflk
 ZT3/I2W/UUyfY2NZCfEUI/3/qexGcmBIg0zIm/xog02UBjqPAYvpVm+rrEnQSnORLVrk
 hWQQ15mIlSuEZQyBthcfwh+7TwZZPblyt8X6kDDJ8upgdd/M13RQqkcc4rBSVJQZdYpT
 rqWZ7OUkB0NENt5qGkeKB1ev2VdY7OwQ/IKdjGMsLM8zEa7oRMSzdubvNlP12cRi9KJW
 J73/Eq8brkgjO8RyPK0TqSj7N0j303Iiv2VnjxIhGL7Asc2xcr2z6Rs8iluo+A+eB8GL
 Lnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+9BsIZGgvgPMUOuiQBq2UHEDPz71+8oHL0hrWz+5YBE=;
 b=SnsmxoE4i3Ti9TaVb7/TVk7xTBTzQPEcmyKgP4rdqzqS2jVNY9s2kTpOOu7mxoBhrE
 BUdpM7XSGnFCc+j/WtHGz3gLBNMekAWWY4iuf0o+EcKhRzoJ7ZUaX3Y2dZGbN6F8Hk0z
 VXIt8ySTGnkxTNocgiBnSMBrs0MCaxRsGZdfU/9oq02OSgG/l1MXO3CGnKcV/ZbBZZyw
 ziwxVsfEPaRRxesijhafuonnCbAvAD1AHF4912B/WD1LHR4Vs1b2/MvNUS/h8NhrQASI
 wiFz0XQyw6RQKIp2PUKn7O0XbYwcozuWlXPKZ4B1qPGI52Xk6vX5hoG8+Os2uUVQpDS8
 KAcA==
X-Gm-Message-State: AOAM533u7LmoGd5Z0fO4rqlPRN0O71pDKFu6Qg80+FEroMxirjHTGsUu
 yHirgaO9Vn38HbriPqwndfw=
X-Received: by 2002:a05:6830:25c6:: with SMTP id
 d6mr11570530otu.226.1628386450144; 
 Sat, 07 Aug 2021 18:34:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c26sm2396340otu.38.2021.08.07.18.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 18:34:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Date: Sat,  7 Aug 2021 18:34:06 -0700
Message-Id: <20210808013406.223506-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8qpIp1Ee2Fy

The control register does not really have a means to deselect
all chip selects directly. As result, CS is effectively never
deselected, and connected flash chips fail to perform read
operations since they don't get the expected chip select signals
to reset their state machine.

Normally and per controller documentation one would assume that
chip select should be set whenever a transfer starts (XCH is
set or the tx fifo is written into), and that it should be disabled
whenever a transfer is complete. However, that does not work in
practice: attempts to implement this approach resulted in failures,
presumably because a single transaction can be split into multiple
transfers.

At the same time, there is no explicit signal from the host indicating
if chip select should be active or not. In the absence of such a direct
signal, use the burst length written into the control register to
determine if an access is ongoing or not. Disable all chip selects
if the burst length field in the configuration register is set to 0,
and (re-)enable chip select if a transfer is started. This is possible
because the Linux driver clears the burst length field whenever it
prepares the controller for the next transfer.
This solution  is less than perfect since it effectively only disables
chip select when initiating the next transfer, but it does work with
Linux and should otherwise do no harm.

Stop complaining if the burst length field is set to a value of 0,
since that is done by Linux for every transfer.

With this patch, a command line parameter such as "-drive
file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
flash chip in the sabrelite emulation. Without this patch, the
flash instantiates, but it only reads zeroes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I am not entirely happy with this solution, but it is the best I was
able to come up with. If anyone has a better idea, I'll be happy
to give it a try.

 hw/ssi/imx_spi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 189423bb3a..7a093156bd 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
     DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
             fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
 
+    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
+
     while (!fifo32_is_empty(&s->tx_fifo)) {
         int tx_burst = 0;
 
@@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     case ECSPI_CONREG:
         s->regs[ECSPI_CONREG] = value;
 
-        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
-        if (burst % 8) {
-            qemu_log_mask(LOG_UNIMP,
-                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
-                          TYPE_IMX_SPI, __func__, burst);
-        }
-
         if (!imx_spi_is_enabled(s)) {
             /* device is disabled, so this is a soft reset */
             imx_spi_soft_reset(s);
@@ -404,9 +399,11 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
             /* We are in master mode */
 
-            for (i = 0; i < ECSPI_NUM_CS; i++) {
-                qemu_set_irq(s->cs_lines[i],
-                             i == imx_spi_selected_channel(s) ? 0 : 1);
+            burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH);
+            if (burst == 0) {
+                for (i = 0; i < ECSPI_NUM_CS; i++) {
+                    qemu_set_irq(s->cs_lines[i], 1);
+                }
             }
 
             if ((value & change_mask & ECSPI_CONREG_SMC) &&
-- 
2.25.1

