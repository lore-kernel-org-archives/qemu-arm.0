Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1453955lfb;
        Mon, 6 Jun 2022 08:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+sleiZnpp24Mcviv3j+cnI2bOURlF3ABoifL++A8cDvQv/FurQXKMSPOrq7yGKHFjzzT2
X-Received: by 2002:a37:aa0e:0:b0:6a6:9436:a792 with SMTP id t14-20020a37aa0e000000b006a69436a792mr12154271qke.668.1654529483842;
        Mon, 06 Jun 2022 08:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654529483; cv=none;
        d=google.com; s=arc-20160816;
        b=IydGifAjasspuwECLPMiW0Cqy4z74MeS5pxu0G4cGJNoPQXjNTibdcGt/xnCdX6HmT
         tOb3ZPr8/9FuGUK5au1RkIezxPO8sCLwDwafWt5eMXvu0tS9KOjlO8eENEY7cxvRs3Oz
         9cX/4/fOQnseOLyUKubFvubbBKAeyKQkHNOHethvchDpbjlgFYhltSfSHbi2cgA5rGqN
         is6aAPmhntBqSZ2MaWlP7WueTY+Vrj9kVqhFqVtcbiUsIQtQ1xG1ddDF77o7kIgruIrd
         Uek4MLC+yYCyEDVy7pym/z/XwCMtGDrp0zJUYWBoA7tqKPMaDbH/BiNMqBIp5sRptIFi
         l3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=EEq8fZE60pfoyaoo5pXmdvt8ZJE8BxCuIyVwiGQ9Ccg=;
        b=uUxgJxFJxF4XV92x6ajFvK//fkFjxxgJww8VHvh2ZDtV2/85S6X//syDoS9GUAogXa
         wDQayKg0lQgjv+4CtGtPNS0YQE7tjkFvNlXYfT/1Y51WXZvYkWoUkWL1NtJm3L0paD2M
         8O8dERQYAxh2c9sxDfBuwFG9cg6ZAismAMAIwiQN18e4uhMf2z/nfkTr4A5RSo8Ur/T1
         b9tdaH3yS7aGtJN9zVRhmtFcPXyVjLnjxKhVSsMVLaJwWtDboUxc93pu3KYDEcUC5wXZ
         hpeC/DNGADmMhZtWrjC9CVyZMGYEcrk5rvymQJNtGAwB13KXxjIDLi9hg+g6G0XDpIbB
         LUXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020a05622a004c00b002f35aeef1f3si8129556qtw.397.2022.06.06.08.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEhP-0008Ly-7f
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMW-0007wY-7d; Mon, 06 Jun 2022 11:09:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMS-0006EC-G4; Mon, 06 Jun 2022 11:09:46 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxjd4FbNz4xZg;
 Tue,  7 Jun 2022 01:09:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxjX1tFMz4xZY;
 Tue,  7 Jun 2022 01:09:36 +1000 (AEST)
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
Subject: [PATCH 19/21] aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always
Date: Mon,  6 Jun 2022 17:07:30 +0200
Message-Id: <20220606150732.2282041-20-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
X-TUID: t+y+QgIkcQd0

There is no 'slave match interrupt' enable bit in the Interrupt
Control Register. Consider it is always enabled and extend the mask
value 'bus->regs[intr_ctrl_reg]' with the SLAVE_ADDR_RX_MATCH bit when
the interrupt is raised.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 59245079002b..f30098bebbab 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -32,11 +32,16 @@
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
@@ -60,11 +65,11 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
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

