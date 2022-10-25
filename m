Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4197221ejn;
        Tue, 25 Oct 2022 08:26:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4x4JmHlzEUKcWcP5u2HEuzUpQ1GTDCqR306Lc2sEn62i5wCpKepLTsMCz6YPskc1+K23Fo
X-Received: by 2002:a0c:a9cb:0:b0:4b4:746d:c0e7 with SMTP id c11-20020a0ca9cb000000b004b4746dc0e7mr32467052qvb.48.1666711578732;
        Tue, 25 Oct 2022 08:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711578; cv=none;
        d=google.com; s=arc-20160816;
        b=CAVbKkhseHGDWvOmwBBTxr2XQd5mekMVD180AVynZSDmGrhyloViZJ2Hy5Me8W1jtZ
         hxnShD7/JT6JPnmAMYQWJsdG6t+dkCnDNSNGoRcgQHIfhgV+8fIoDgsgy3N8dA4ugLvc
         GwqYbccqleGQvtubxnMXnzCi0/tGrj72aMOMEwCioZBty0CNPKZDwEkhEx9H+DpH067G
         MlOR5nDKZkjOCRrn7fBPaYH11/BX7k2Y5DaYAw/a0WfPHLaWV+pwujSaITCTIIskbx6/
         KI0pTMFQ0t/lImx8kqh3YYC6YDJ0he47vnyvvY0q5c63vatdPDh3aqeRwlGboKDYyyJ9
         dA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=kWKCZRww3UfmikHJjNlPX5LSMpnq9xITbbVD3pasuvU=;
        b=0/g0XCBQXqy2YaCymIhSqImB+j3WSYWd7KLVAD0Aa1J1h7YQ3dmebU6cWkY8ACnyFW
         Dro8xXhyb1mPOa0hDlBQUdzChzT21tIzUGjGSEveDF6+JDk9n9eH5O/Rgl+6w26eMO/4
         tQhb1AV+zGRtnBb31+qrlczO1Gk324Q/xf0gPGzWSInV22xxNR1FhJVwQgO2SSUQ/Cbf
         do02ctqru4tBD7RU7Jc5z+gccg6LqDm7nKU7ZI62ObfjjVqcMjFDU+pCA0JquIjRR98M
         60CldD5xoSxNeBNHZNl1oAFDSEpd+XXB+Luw7jLR5hmZzjD7KsvzPXc1orpQqTtNXCyA
         Zv7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv12-20020ad45cec000000b004bb9259f897si284298qvb.248.2022.10.25.08.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLjz-00079V-4h; Tue, 25 Oct 2022 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLjq-0006YQ-0T; Tue, 25 Oct 2022 11:21:10 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLjk-0004k4-1a; Tue, 25 Oct 2022 11:21:09 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbHW2KpPz4xGG;
 Wed, 26 Oct 2022 02:20:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHR5kFJz4x1G;
 Wed, 26 Oct 2022 02:20:51 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Peter Delevoryas <peter@pjd.dev>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/16] hw/i2c/aspeed: Fix old reg slave receive
Date: Tue, 25 Oct 2022 17:20:27 +0200
Message-Id: <20221025152042.278287-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qnDTJmGTbyI5

From: Peter Delevoryas <peter@pjd.dev>

I think when Klaus ported his slave mode changes from the original patch
series to the rewritten I2C module, he changed the behavior of the first
byte that is received by the slave device.

What's supposed to happen is that the AspeedI2CBus's slave device's
i2c_event callback should run, and if the event is "send_async", then it
should populate the byte buffer with the 8-bit I2C address that is being
sent to. Since we only support "send_async", the lowest bit should
always be 0 (indicating that the master is requesting to send data).

This is the code Klaus had previously, for reference. [1]

    switch (event) {
    case I2C_START_SEND:
        bus->buf = bus->dev_addr << 1;

        bus->buf &= I2CD_BYTE_BUF_RX_MASK;
        bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;

        bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
        aspeed_i2c_set_state(bus, I2CD_STXD);

        break;

[1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/

Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register mode")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Message-Id: <20220820225712.713209-2-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 1 +
 hw/i2c/aspeed_i2c.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 300a89b34301..adc904d6c1f8 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
     SHARED_FIELD(M_TX_CMD, 1, 1)
     SHARED_FIELD(M_START_CMD, 0, 1)
 REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
+    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
 REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
     SHARED_FIELD(RX_COUNT, 24, 5)
     SHARED_FIELD(RX_SIZE, 16, 5)
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 42c6d69b82f0..c166fd20fa11 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
     AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
-    uint32_t value;
+    uint32_t reg_dev_addr = aspeed_i2c_bus_dev_addr_offset(bus);
+    uint32_t dev_addr = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_addr,
+                                                SLAVE_DEV_ADDR1);
 
     if (aspeed_i2c_is_new_mode(bus->controller)) {
         return aspeed_i2c_bus_new_slave_event(bus, event);
@@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
 
     switch (event) {
     case I2C_START_SEND_ASYNC:
-        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
-        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
+        /* Bit[0] == 0 indicates "send". */
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_addr << 1);
 
         ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
-- 
2.37.3

