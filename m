Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1466110lfb;
        Mon, 6 Jun 2022 08:49:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIMoB9tQo3HF6OTj0K0Kc4aJYohWWGmYeUoFwZHGvlSqD0SnbXKNHXOdaSYXt9YMqLdYqU
X-Received: by 2002:a05:622a:3d0:b0:304:b6c5:dc26 with SMTP id k16-20020a05622a03d000b00304b6c5dc26mr18861925qtx.237.1654530585796;
        Mon, 06 Jun 2022 08:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654530585; cv=none;
        d=google.com; s=arc-20160816;
        b=FJ+awmMuyyGN/ZDSd7DCsPSg5USvHo5kprlHVEV9Rslac91Pg7X1gfTl/P6mUDd3UE
         XRMFDU1doXtHLDvT7MpsGK3wYrsVlSGz/JhZ2Irp/9lZzTtT3Bdr11sOaOsGFsyjyPGd
         cduOJh/bwiiydcIxBGwb3Rs0s7i8KlytWQpAtc6ZaXRzoQw8VzxoB7JK+UZxXYvcWp4S
         u12xgnvo59ZLUj/PQvpBJEJ01yKcaBrgYeVDeZcB67J6xB5dH3lZS1RQrCxR2pxzHWgF
         D08BZlHAjv/04i6CkcO/AX888aQ19X7oSnUXOFcIVd+Kr/26dp5Wv0Uyp3oiWqhW0t0c
         iGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=/z/JCNyQUPBTTNBiSvTFNxpCGSFis+uLLz0ic6CUtFU=;
        b=LPc0En9C2nWApqtGHqSpufWpu6WlZm/evp56ALcPwvRBdqITXUPT7+ywIasL3Ra+57
         ysya6f24bHfrDv2WaGC/bk0Y4RKCgArF344Q3yHciP4JLIj3YYHQDXeywrlHLHp1Bhjc
         EYUPLvK27M6QuVgMywPOY/Va0sCZIgGx1VYQReVq/gV152Vvl1s50NhP1/tQ9bG9hGgs
         WMUUqDdxiG2iQH8we04+p5WJX1rWIxzsdpNAYYLr0TZ2z0b6aY+oPbqJ6tr1fUWE5Q3t
         DpJ6a3676ro/1HNgw2ToFPj9PuXPWR68xYDwAIMoK2P+MYobi//6NpvyRmiiQuCgmMTQ
         DrPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s66-20020a372c45000000b006a4f5b0d913si7758384qkh.82.2022.06.06.08.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEzB-0004VF-A0
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELG-0005Lb-R0; Mon, 06 Jun 2022 11:08:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:38129
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELD-0005zp-MG; Mon, 06 Jun 2022 11:08:29 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxh92H7Kz4xZG;
 Tue,  7 Jun 2022 01:08:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxh373m7z4xZB;
 Tue,  7 Jun 2022 01:08:19 +1000 (AEST)
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
Subject: [PATCH 06/21] aspeed: i2c: Add PKT_DONE IRQ to trace
Date: Mon,  6 Jun 2022 17:07:17 +0200
Message-Id: <20220606150732.2282041-7-clg@kaod.org>
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
X-TUID: lENUOocIgwXt

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
index 948d8dc2bb11..f179f78ee9d0 100644
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

