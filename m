Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1877555lft;
        Wed, 22 Jun 2022 03:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sG77UHE9zpo5eArBBZiAV9gp/im2/SPSDTxvrfUiQ2y+SvrDd4fBQZKVZJGl15rKHH4FjC
X-Received: by 2002:a05:622a:406:b0:305:20a3:4b6b with SMTP id n6-20020a05622a040600b0030520a34b6bmr2114359qtx.565.1655892244081;
        Wed, 22 Jun 2022 03:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655892244; cv=none;
        d=google.com; s=arc-20160816;
        b=JV4g0ys25H0e3HjfKLwtCOF7qH1Q1u1ZKAeXurcNfXOmlkb1e2kCOUPI80gdNVPkMy
         uu2uNv6w6po0Oz+iIJa0+8Mf/xefosZmhb/sePhd7gvRGJkLztcDb0GQ29jFQTgikRxk
         r7zgpAsoaWnZN7cIpcj5aPVtwKbKT51H0m3yy5c/lWSkpnQ9kx69VexLtT9ZCbG+B9QX
         jsiGtraLNL2Ew0wgK1kB2dUGl+6smlGcAmlWbv0xAogTdj09OGGf5kTXyW2R53sYWWtB
         43Dh4CQB7z4Bvg0tAxV0RsvZ3dLMeVNroW4QJfaS9fhgEs8VsfebrnHH5lGiv3FI419P
         dwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3iDPKqxc1NZrZG0Mbmky+F12edhqPn/KXfT1fFHIpCI=;
        b=wEIDEj3FZAmfIYmK+aAv87ZsxXNvsNoEKFRhP8FP2aAxOUTfWWa9ayw/SV55DljzOs
         jgLFb2FELDyKStSHGUN0aQx0phSOLfcf0hdzlEZfoFIOqmxRSuEEV+R4QS37rkDB2BRk
         IE3HMTwUIHam0aLvDn0HWE8+jt4WtRGvg7PaUeMdAq0oesBMqVvdZfipNkotQYiuKXT5
         22Brc2UFksLJERjQuQoI/Q216GH7W2zfwwjgNF61eeed6WqdsiyP/zL7kYuJjc6vTKuB
         YxfM1p2TcnQND0eqKDanuAF4FgbWNXwBeNvOrpO1MUQyFCz+Rn1SWDso57w1d1/8ZdMF
         BadQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b124-20020a379982000000b006a6aedc4668si12007841qke.749.2022.06.22.03.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 03:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3xDO-0000pS-Gh
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 06:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5a-0006ER-3E; Wed, 22 Jun 2022 05:55:58 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:34347
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5Y-0004oJ-B9; Wed, 22 Jun 2022 05:55:57 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0931Cyz4xYD;
 Wed, 22 Jun 2022 19:55:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf072fwgz4xD9;
 Wed, 22 Jun 2022 19:55:51 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 11/19] aspeed: i2c: Add PKT_DONE IRQ to trace
Date: Wed, 22 Jun 2022 11:55:12 +0200
Message-Id: <20220622095520.3683321-12-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: FsNLWux20yiZ

From: Joe Komlodi <komlodi@google.com>

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I566eb09f4b9016e24570572f367627f6594039f5
Message-Id: <20220331043248.2237838-7-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 3 +++
 hw/i2c/trace-events | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 8b6a88315a5b..0e0cd5bec8d8 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -305,6 +305,9 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     bool raise_irq;
 
     trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts],
+        aspeed_i2c_bus_pkt_mode_en(bus) &&
+        ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
+                                                               "pktdone|" : "",
         SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ? "nak|" : "",
         SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ? "ack|" : "",
         SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "done|"
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 7d8907c1eede..85e4bddff936 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
 # aspeed_i2c.c
 
 aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
-aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5) "handled intr=0x%x %s%s%s%s%s"
+aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
 aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
-- 
2.35.3

