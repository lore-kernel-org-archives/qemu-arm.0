Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1465284lfb;
        Mon, 6 Jun 2022 08:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXkUBpGTWZgPetJdf8vzwVoMpU1NoucOQmjCLZIBo47njQC+/kf2g57quRtOdp+9T32av8
X-Received: by 2002:a37:9e8b:0:b0:6a6:a4ba:5444 with SMTP id h133-20020a379e8b000000b006a6a4ba5444mr10386814qke.527.1654530509778;
        Mon, 06 Jun 2022 08:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654530509; cv=none;
        d=google.com; s=arc-20160816;
        b=xfvySvfYCdSuwKl12zbO5f/AINCQto4UQyiVldo9E7gkVPmNjlS/nqcKydOmj3JwPA
         19XPgntztZoIsZnY8VChhglH7lXtEGjkEp4WXxvyu7H43vgZ0mHa25qQomtoMzpGnUMy
         pX31tHTiZ/PYiJwbIRy0e/HFVQK6E1Xr4uA/ywvkktI5IWUpMz3z9n3PYDkzjioJD6/o
         +PoLXswIjx+StWNirkQBHuxPUHTUkbD13U4nvB+yDgXpkO5B5VOi9oAaKF7YLPIOv4xa
         ZL0Bz3fmxyc+HgDizQ6rvR5aNcQWqfDA4+sJ3j744sOE5jbLdGOD7ryx1fSIr81qKbUK
         yHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lUSpOrVyPYN+cdsEp1RgQUd9vf4YAXffNL0UwXnvJ3A=;
        b=WPyil457RY+uao73/Zem0IQOUHsRfaUpPoTSAks/c2H7y/X7b9ML61KZleiPy+jfv6
         Va5LcKNI4AJMGZ0NMAWHcrYUiDM6zoPZUP9RZcrkRSWcX1ZJsV0q7okdZv47OUV1sPWe
         a2LM1XeGmX8/1Wrm9q1Wvc6lltvBZDna5AUCTesd5O4mjJSigRhfXm0LRIcIvLYX1Smx
         yrXIRmOjMo2WoalNlQbW3JQ/tykhnwH7WqB9xqycXncbNrUs5jIXTtfwSO3U0FwlQCcD
         OFKTN3MELRbHBimNDrEZhfyMtU3AGCQB3hczKq6Lf24oRAjIcd522JVp/7a4p7DlaQG9
         80BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020ac87dc1000000b00304ede6965bsi1240701qte.573.2022.06.06.08.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyExx-0001S8-7E
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEM0-0006m4-GO; Mon, 06 Jun 2022 11:09:16 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:42737
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELy-0006Av-FW; Mon, 06 Jun 2022 11:09:16 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxj40hsbz4xZf;
 Tue,  7 Jun 2022 01:09:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxhy5Tt0z4xZY;
 Tue,  7 Jun 2022 01:09:06 +1000 (AEST)
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
Subject: [PATCH 14/21] hw/i2c/aspeed: rework raise interrupt trace event
Date: Mon,  6 Jun 2022 17:07:25 +0200
Message-Id: <20220606150732.2282041-15-clg@kaod.org>
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
X-TUID: xEuozP2PLnlM

From: Klaus Jensen <k.jensen@samsung.com>

Build a single string instead of having several parameters on the trace
event.

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg: simplified trace buffer creation ]
Message-Id: <20220601210831.67259-2-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 34 ++++++++++++++++++++++------------
 hw/i2c/trace-events |  2 +-
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 5fce516517a5..b70276a87360 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -38,23 +39,32 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     uint32_t intr_ctrl_reg = aspeed_i2c_bus_intr_ctrl_offset(bus);
     bool raise_irq;
 
-    trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts],
-        aspeed_i2c_bus_pkt_mode_en(bus) &&
-        ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
-                                                               "pktdone|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ? "nak|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ? "ack|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "done|"
-                                                                  : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
-                                                                "normal|" : "",
-        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ? "abnormal"
-                                                                   : "");
+    if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTERRUPT)) {
+        g_autofree char *buf = g_strdup_printf("%s%s%s%s%s%s",
+               aspeed_i2c_bus_pkt_mode_en(bus) &&
+               ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
+                                               "pktdone|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ?
+                                               "nak|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ?
+                                               "ack|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ?
+                                               "done|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
+                                               "normal|" : "",
+               SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ?
+                                               "abnormal"  : "");
+
+           trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], buf);
+    }
+
     raise_irq = bus->regs[reg_intr_sts] & bus->regs[intr_ctrl_reg];
+
     /* In packet mode we don't mask off INTR_STS */
     if (!aspeed_i2c_bus_pkt_mode_en(bus)) {
         bus->regs[reg_intr_sts] &= bus->regs[intr_ctrl_reg];
     }
+
     if (raise_irq) {
         bus->controller->intr_status |= 1 << bus->id;
         qemu_irq_raise(aic->bus_get_irq(bus));
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 85e4bddff936..209275ed2dc8 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
 # aspeed_i2c.c
 
 aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
-aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
+aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *s) "handled intr=0x%x %s"
 aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
-- 
2.35.3

