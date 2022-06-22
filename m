Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1887242lft;
        Wed, 22 Jun 2022 03:18:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uC31j0LZDHTJXEZ5NZOwmgzWXs9olROPPQ1MJgF0Tmf1feVdjiXai6GYZc4QFBq41Elp5N
X-Received: by 2002:a05:620a:4154:b0:6a6:ca1e:d899 with SMTP id k20-20020a05620a415400b006a6ca1ed899mr1613680qko.334.1655893130962;
        Wed, 22 Jun 2022 03:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655893130; cv=none;
        d=google.com; s=arc-20160816;
        b=MzmnSB5SWN569rpuGk5i5exjJG1SrXTJPiRkely7kRXRqDiFtE+hmhsXmrAwt64bQW
         Mu5xrbWBABseddaHII+EI4UI+EFYeFQuRplsoNpF92XC1ND8mrmzIoy8tPihe1n1WX/+
         5+caFOTlwbC8R7Ew1m0mDBI3BGcA9X7BkaevL3XsVB9abumVp41GBT5HfYrQ0mRntMjc
         P8sZUTKIpLg4jd8wKj1Bps31WlQSlzR+X0XjInBCPMRFzyJIYBh2VX7XV3SyadL2CxCF
         iqXpUsRhlAw5cqDiASTTyo/J820dRsfkji5oRF7pBpZju/ZWRumEXgG6uEp8v09spC/S
         9S8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=FHycG0NVWZ/EuOcfUt0VCGvSQE2TZyXXckh7qcZUD3Y=;
        b=KCi/JlIs9zqKtFrzBxDJa+Lf3o5KK4z591VnLSUrZ7SECtqZ/BWNC6uC5SlGcuK6wD
         bKlmO7AbAwbUO221xwnTDai/dulOZJxa9SkkIP3mnmayImsL009tLuTaATAYP2DsjOJP
         RZY3AIwQexXzM9ByrDiOetieX/rQWwsCf9aqSn7C3hDqz7OP3UZkp6RZ45dW03nau5Tu
         VciDyvNkll0pWG2p0fhXVIc3ZXzZecBJyVpIFQhZm0pLLs6f/ly9TAhWQhh7lnBrznXd
         hiFd+T5obnk6UnZtya/8fLCQzK13mUDQVrwYwO45GY6EypzwJjtVFPfpa2UN8v99ioJh
         vCyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a05622a001200b00304e906c50asi11779928qtw.126.2022.06.22.03.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 03:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3xRi-0004EN-E1
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5p-0006v2-0g; Wed, 22 Jun 2022 05:56:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5n-0004qA-B2; Wed, 22 Jun 2022 05:56:12 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0V25Vvz4xZh;
 Wed, 22 Jun 2022 19:56:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf0S3f83z4xD9;
 Wed, 22 Jun 2022 19:56:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/19] aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always
Date: Wed, 22 Jun 2022 11:55:18 +0200
Message-Id: <20220622095520.3683321-18-clg@kaod.org>
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
X-TUID: M88V3OfCPPI3

There is no 'slave match interrupt' enable bit in the Interrupt
Control Register. Consider it is always enabled and extend the mask
value 'bus->regs[intr_ctrl_reg]' with the SLAVE_ADDR_RX_MATCH bit when
the interrupt is raised.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index f9fce0d84b89..37ae1f2e04bd 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -32,15 +32,20 @@
 #include "hw/registerfields.h"
 #include "trace.h"
 
+/* Enable SLAVE_ADDR_RX_MATCH always */
+#define R_I2CD_INTR_STS_ALWAYS_ENABLE  R_I2CD_INTR_STS_SLAVE_ADDR_RX_MATCH_MASK
+
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t intr_ctrl_reg = aspeed_i2c_bus_intr_ctrl_offset(bus);
+    uint32_t intr_ctrl_mask = bus->regs[intr_ctrl_reg] |
+        R_I2CD_INTR_STS_ALWAYS_ENABLE;
     bool raise_irq;
 
     if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTERRUPT)) {
-        g_autofree char *buf = g_strdup_printf("%s%s%s%s%s%s",
+        g_autofree char *buf = g_strdup_printf("%s%s%s%s%s%s%s",
                aspeed_i2c_bus_pkt_mode_en(bus) &&
                ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
                                                "pktdone|" : "",
@@ -50,6 +55,8 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
                                                "ack|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ?
                                                "done|" : "",
+               ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH) ?
+                                               "slave-match|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
                                                "normal|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ?
@@ -58,11 +65,11 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
            trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], buf);
     }
 
-    raise_irq = bus->regs[reg_intr_sts] & bus->regs[intr_ctrl_reg];
+    raise_irq = bus->regs[reg_intr_sts] & intr_ctrl_mask ;
 
     /* In packet mode we don't mask off INTR_STS */
     if (!aspeed_i2c_bus_pkt_mode_en(bus)) {
-        bus->regs[reg_intr_sts] &= bus->regs[intr_ctrl_reg];
+        bus->regs[reg_intr_sts] &= intr_ctrl_mask;
     }
 
     if (raise_irq) {
-- 
2.35.3

