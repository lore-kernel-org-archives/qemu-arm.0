Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1467051lfb;
        Mon, 6 Jun 2022 08:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi0+TM8d8t/f7fTKxF2gl1IykF1gQHPEPt/zZGEgZBgfqplX8brfGumtlpuDBzQWgWulJ1
X-Received: by 2002:a05:620a:461e:b0:6a5:b906:ad92 with SMTP id br30-20020a05620a461e00b006a5b906ad92mr15891142qkb.261.1654530669159;
        Mon, 06 Jun 2022 08:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654530669; cv=none;
        d=google.com; s=arc-20160816;
        b=SAXgTLRm+Uqu/KCz7UBw15cRKy6Xo7Jaqxcu8/zp6Zx2tfyXCYD3RRkKwjkyGlUH6n
         CHIc4V4TvFFviaey3CboMFWeqjITU0y3XDo8Lt9ddF37NIYMAchrVacESAwcHRoEu31s
         r1sws+JWzV73/Hslo2jzgxKzuIGSHXxMaTXCqOb+AmmOsQfW690XRDs6gElM3n8NnLJ0
         TBhaC7OnHCmUS5cOeidS+l/7avyvC6YJVVpyKek8mB3Uj99Kj7w07Zz1p5IXEMjLh0SJ
         Tdi/96XYSmXThC3q+hIza3pqDowtx+HMBAwnvE2+zCDeJe+O+pWqsH7vEUsso8slikmi
         dfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=B2YityMFr4jXy6EW5ViiGs4h+QB/HSqRHJzrQnbL5G8=;
        b=eQ46C/h48KxWc8afP0it217jdi1j6U3sRwI1jTziGFk10agpC/xCMPgytZqWiEMdZU
         1xsL5L3MV476I9KzfHLyIxjcz4JC33xdhu6lQ+BnCvr9qsu06rYSz+bTe75LmZtBZfEI
         6Ghf76kaGeR/Tu3Qp8qnFgyuYZPitEw5+tzx6rMhMTkcvJHoeVAn0txfyl5NtIsmP6ly
         z009WoUX2nEz8v17ddF5GfXFH/LjTn4MvJFO6sRF5nDwm3pj1aztAWM8tcL4dJjFl4P1
         +oZoNMuOG3CfrM5RLnX+yeJBh+Q0etW7Bv+AXkpAHNgxY/4F3bhJBt793e8dXHNUURuy
         /Buw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020a05621421ea00b0046416eb8c83si7292014qvj.321.2022.06.06.08.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyF0W-0006Dx-H2
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEM7-0006yg-0p; Mon, 06 Jun 2022 11:09:23 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:37631
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEM5-0006BK-2V; Mon, 06 Jun 2022 11:09:22 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxj96mYHz4xZZ;
 Tue,  7 Jun 2022 01:09:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxj44KXZz4xZY;
 Tue,  7 Jun 2022 01:09:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 15/21] hw/i2c/aspeed: add DEV_ADDR in old register mode
Date: Mon,  6 Jun 2022 17:07:26 +0200
Message-Id: <20220606150732.2282041-16-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cY9eQKdYCG8K

From: Klaus Jensen <k.jensen@samsung.com>

Add support for writing and reading the device address register in old
register mode.

On the AST2400 (only 1 slave address)

  * no upper bits

On the AST2500 (2 possible slave addresses),

  * bit[31] : Slave Address match indicator
  * bit[30] : Slave Address Receiving pending

On the AST2600 (3 possible slave addresses),

  * bit[31-30] : Slave Address match indicator
  * bit[29] : Slave Address Receiving pending

The model could be more precise to take into account all fields but
since the Linux driver is masking the register value being set, it
should be fine. See commit 3fb2e2aeafb2 ("i2c: aspeed: disable
additional device addresses on ast2[56]xx") from Zeiv. This can be
addressed later.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg: add details to commit log ]
Message-Id: <20220601210831.67259-3-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 8 ++++++++
 hw/i2c/aspeed_i2c.c         | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 79c6779c6c1e..03fe829a3a57 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -297,6 +297,14 @@ static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
     return R_I2CD_CMD;
 }
 
+static inline uint32_t aspeed_i2c_bus_dev_addr_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CS_DEV_ADDR;
+    }
+    return R_I2CD_DEV_ADDR;
+}
+
 static inline uint32_t aspeed_i2c_bus_intr_ctrl_offset(AspeedI2CBus *bus)
 {
     if (aspeed_i2c_is_new_mode(bus->controller)) {
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index b70276a87360..379dbc1379cb 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -83,6 +83,7 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CD_AC_TIMING2:
     case A_I2CD_INTR_CTRL:
     case A_I2CD_INTR_STS:
+    case A_I2CD_DEV_ADDR:
     case A_I2CD_POOL_CTRL:
     case A_I2CD_BYTE_BUF:
         /* Value is already set, don't do anything. */
@@ -720,8 +721,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
         }
         break;
     case A_I2CD_DEV_ADDR:
-        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                      __func__);
+        bus->regs[R_I2CD_DEV_ADDR] = value;
         break;
     case A_I2CD_POOL_CTRL:
         bus->regs[R_I2CD_POOL_CTRL] &= ~0xffffff;
@@ -1039,6 +1039,7 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
 
     s->regs[R_I2CD_INTR_CTRL] = 0;
     s->regs[R_I2CD_INTR_STS] = 0;
+    s->regs[R_I2CD_DEV_ADDR] = 0;
     s->regs[R_I2CD_CMD] = 0;
     s->regs[R_I2CD_BYTE_BUF] = 0;
     s->regs[R_I2CD_DMA_ADDR] = 0;
-- 
2.35.3

