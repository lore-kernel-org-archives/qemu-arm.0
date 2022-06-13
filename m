Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1398119lfb;
        Mon, 13 Jun 2022 06:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFqiXWonsvq54+Aljo5J/j4BYYQdCPUNTJM9pzeaH/2On22db8uTkbqfqfS4DdPpPn5WdN
X-Received: by 2002:ac8:7d05:0:b0:305:2a4b:d86b with SMTP id g5-20020ac87d05000000b003052a4bd86bmr7636083qtb.234.1655128381974;
        Mon, 13 Jun 2022 06:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655128381; cv=none;
        d=google.com; s=arc-20160816;
        b=FL54tQjeo9OMVETq2OQOyz6su1Mcjftep7m8nhDmKTPo2UqlsW2qPHJxKviUXzalAY
         MVqgNq+rYqI8uvNiI6K23nK1TfA3OUZHW2EAMQfdiSwbT0N8j0cs6VRzIMVQZ1YrJ9Q0
         zgfvMfA5jYlXZfT2TgbLswlZX823ytWHH06SzfmDyNzV0ETK7bctWg6GChCRYe3ifx/4
         ri4NQuR45wUEn6slwOuG4jAXE7fKcuaAMdvLrZw1an501ngh/CZfl+XA7iuOxbEBBCoG
         wtJeCGI8DalgXbi7/oMc4vIajC1j7wUnRxwq3DVERvfws1dYcE5/ygvoDViQmNZV6B1s
         rp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=FHycG0NVWZ/EuOcfUt0VCGvSQE2TZyXXckh7qcZUD3Y=;
        b=ehoFNelA3hSAYhtAHc/DNoG0vlXVSMfIP1uaqSVzsD/AGptl0o/TybqaDvQcHNGFI0
         FaMyu0QkoQsFd9mwvb2LBchbjLwn9FY+UPhdgzsQzQpR36lPkR4phUoJTWbqX2QGW9OM
         5sa1cnkQNEisDnNS1sr/VnbZXQQXDl1P7Zz/2CG0ETsUmX6WBfFwfBL6ZTQcMlLMCUU9
         BL4x2a8VBAWV7PfHDOod3T7a70CX/SxazI4+MGKHuY95UjGlMRbkyOP/fSgymW3IAcNg
         8DVLCbR+L1wq5s8TFEvnuX5yy15YR5PlELMjSS5sfw1isiDhX6zm34d8g9Z1ntFePsWW
         rNRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020ac841d0000000b00304f6f41998si3389759qtm.455.2022.06.13.06.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0kV3-0006Uo-GB
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k6W-00036Z-Ep; Mon, 13 Jun 2022 09:27:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:47025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k6U-0004si-IF; Mon, 13 Jun 2022 09:27:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC6c140rz4yZB;
 Mon, 13 Jun 2022 23:27:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC6V5nbqz4yTh;
 Mon, 13 Jun 2022 23:27:30 +1000 (AEST)
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
Subject: [PATCH v2 17/17] aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always
Date: Mon, 13 Jun 2022 15:25:39 +0200
Message-Id: <20220613132539.2199772-18-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
X-TUID: 61N+e6xgAYnc

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

