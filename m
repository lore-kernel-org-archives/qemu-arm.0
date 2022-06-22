Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1873689lft;
        Wed, 22 Jun 2022 02:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t60TQKPLH4wP1rYnn1g+qo4hXZYrJFzla0LI3lpj6MvXgPvprzb2r70iSr205ANtgvmuU4
X-Received: by 2002:a05:620a:4495:b0:6a6:dceb:87fe with SMTP id x21-20020a05620a449500b006a6dceb87femr1547073qkp.206.1655891884499;
        Wed, 22 Jun 2022 02:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655891884; cv=none;
        d=google.com; s=arc-20160816;
        b=ctjoYcwI/k6pRH3NRNylILZm/H7W26tcIsruC0INHt7H1uf8QoZtKsyEFv9H+lFwGe
         oneubqq3N9C3U1r6PLKkSC9laPf5uj8nqCUsEuZqupPksWIC6vEyb57GMgivODMZBaGy
         C52n8i1W+0J7ACDamFcOgPuQjUxt8EFwVmrZX0HgOWajn0gm+PcvcbQvLoIq+ueAt/77
         4j1lKHVjNw0+CnC8Oi2UfFMlws52IVcwOqpH7Abshfsm6kJYrxMs+1zIiYnOJkeBKbiK
         qsGxjBudQfEjPiJaaGbxY+4N5fY0xW1Ggrt9h6lKfKfHuZwTNmFpvRuskmF0bgUvERxu
         8uVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=67ERetP7CKAUW53CilYn6lPAeOd9R6EggIWbb/s/W8A=;
        b=KREWbHBVsnjDizKwjdSCHGk6/tkKfg96DZgq3hSYtucK+Klu/N5bJuAHactNku6R+i
         VaW1ftukpmHXdc6gg9gt9rQ8Fq8hw7wuiB7+5JgwdR1T35PBHGD6NBfRZKJ+h4ditW15
         lVhDkYubjIiZgX5P70W/I4pmmH736QjhNtguQRui3eAtDJXnW0HulaAUxloxDn6YcdS3
         0eEL0nGeHcZco/5FZo5LveAmjlEA8LXVCDsQFdA0I9wREh/1oksIY4KEjWeNx0+JHe5P
         /4rfJjaRvA6woFL19j6M8nR+1upD859Pby/LVtb7JrEahbEde8qWjjfLHP0P+mjRmpUd
         OSeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a408100b006a6f1c3070fsi13382035qko.586.2022.06.22.02.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 02:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3x7b-000152-V5
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 05:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5o-0006ux-9e; Wed, 22 Jun 2022 05:56:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5m-0004qP-Gw; Wed, 22 Jun 2022 05:56:11 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0S00ySz4xZg;
 Wed, 22 Jun 2022 19:56:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf0P6dGtz4xD9;
 Wed, 22 Jun 2022 19:56:05 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 16/19] hw/i2c/aspeed: add DEV_ADDR in old register mode
Date: Wed, 22 Jun 2022 11:55:17 +0200
Message-Id: <20220622095520.3683321-17-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: xAX91xiRsHFw

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

