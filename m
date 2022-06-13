Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1395211lfb;
        Mon, 13 Jun 2022 06:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUmRPS71KBA3ZVjX1fSaobsx8pLuIg0kWCMz6SGEi2kuzi1Ut33yDuz4CHoUP00NXdMrVy
X-Received: by 2002:a05:620a:12b9:b0:6a7:1832:bdd4 with SMTP id x25-20020a05620a12b900b006a71832bdd4mr17388607qki.193.1655128101678;
        Mon, 13 Jun 2022 06:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655128101; cv=none;
        d=google.com; s=arc-20160816;
        b=atuTdkHcVTT0ZKQo6e0jbsgxwzctvDSsrIArTGKnSn433AcUDJxGM+9ebLCUMg4fkA
         LCVpHr0hkVQ5rUaY8YYr+VM5OkJq0xHHqbyjJlx2mzZosduoGGnIBjp9enVZyJnx9VbV
         2OdRNWdbe6vyzWPdQ+PoHBcyVrbzyjpBouyYk8/Df2/iC90uDKq/toMVde+ABDY0TOCB
         4t+vODCbxu92qxk4FRCiIsq8qE3nhJSWU/wFRKtyQaWvAV22xVQdbU/UvazCjxGVrtCQ
         50H6LkE8bPLsYfyyuSyyR5+mlQst3N6370G4SE4GTJ7m69Mavfv0m/EkSNOqpOFD+Hms
         3ZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=67ERetP7CKAUW53CilYn6lPAeOd9R6EggIWbb/s/W8A=;
        b=cT6o5zaDKPFAoJcXWWQ/qt4tEJD/DMTm7+qKXfscciRp1dUsoiCIFrNnfZpRwcTWJT
         kMaWIgMiNp26H9qPJVlaGTKcMfHj8DRhdQz8nIfY2DatAqL9nwWFP6wj8OKx4zcE1BEc
         P1mZmj45SlphwgxtiP63M3srphb1C8fJ3UFeZFplKTABDo8cKK8M9y+jB9xjw3K2Wgxr
         UcZMM98tILhbEHANntzggysWgPR9O45rcb+4j2BhylH1B34YwMEp0YkbmXCElNVjQj/F
         ppSe/XFLhDHs/+Az1PZe3zHOO52Lxb5rjUQ3dWOYb2RYVXxFZbPHVYry/AqfavcUAOCi
         yExA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a056214202300b004621a92ee46si5268604qvf.505.2022.06.13.06.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0kQX-0005zD-5P
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k6Q-0002kk-Kq; Mon, 13 Jun 2022 09:27:34 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39801
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k6O-0004r9-LL; Mon, 13 Jun 2022 09:27:34 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC6V25RVz4yWH;
 Mon, 13 Jun 2022 23:27:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC6N6tCrz4yWZ;
 Mon, 13 Jun 2022 23:27:24 +1000 (AEST)
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
Subject: [PATCH v2 16/17] hw/i2c/aspeed: add DEV_ADDR in old register mode
Date: Mon, 13 Jun 2022 15:25:38 +0200
Message-Id: <20220613132539.2199772-17-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: Fl9jfGsaCIz5

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
 hw/i2c/aspeed_i2c.c         | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 0cd245a00963..1398befc104d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -295,6 +295,14 @@ static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
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
index 43ac9491ec36..f9fce0d84b89 100644
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
-- 
2.35.3

