Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4478544lfh;
        Wed, 1 Jun 2022 14:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQs5IQ1CtDkHilrZ6P4+gomqidD9eoHy5E1nTourT/Z8+3GsiD7+obZyGMdb8JbhhjyUvt
X-Received: by 2002:a05:620a:903:b0:6a5:8399:f1dc with SMTP id v3-20020a05620a090300b006a58399f1dcmr1375841qkv.170.1654117750749;
        Wed, 01 Jun 2022 14:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654117750; cv=none;
        d=google.com; s=arc-20160816;
        b=RPBrNrGMVdGDUnZDRXDY/PoA8X0ri5dqftBdTfVj5CP6lYLazIXdpo8aAkj8PDo5CP
         xTdSp9wpORHGsugq5WpSEq4ESW+EjzU2ZEeZQG+UW9SRfiEDXJdABpsxNuCXTcyDyaVE
         6ITGamD1sz0E1tJErm85HQPfavIfhUu9bm94tOV7GK8QAFJ+CrAmnOhD83OLwCtkelhG
         +Ii1N1+j6fLrvmg5ZfJKfHgJBHtoKf2whljRgltbQDb5xhQfFh41Vglmpo8PWJX9oESh
         RGPWf1+eKEYC8musazFFsdQ8kZ2we91OWbPzFt6sv8YK3KNe4jgUf9+8vH345e4E0Lhb
         4GyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=j1dmRX6JdLQttZNIrKMK0p1ihYzMGVycd1ijhAJTMXs=;
        b=dBWKgPV/+uP1rAizuuwRoEH0WF9GiTJuVJKKC3gvbKYS8uB8t8TD4hQy974aPhdUyV
         hIEmN8fRM3SmL0YBdQuFxQvahVuNnEsyvNRMrHeOcnIyyazzrxuzlY75xsCF1pIU305C
         a3vjNAX1pxKzd1rE02zTv9eG+uTtrY3UuPClgZigAI8h863CxPc2aocZ5z2YL+oxmWgq
         Cr6qSQ/rm95qh6+agB1wGvwvyLyVaNkybV9OA9dFgpoj3peLhpaXxwlSPwfZ6hEtviwj
         HayXFNstceyf8TmnVUA1geHl1ZoMqf2xzT/nmiBilqWad5S6WVrq9fZhTNciv5yx1Xi7
         WLSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=TjZ2dhZ4;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ZveSG0lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132-20020a370b8a000000b0069f805d8142si1241318qkl.718.2022.06.01.14.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 14:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=TjZ2dhZ4;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ZveSG0lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwVaY-0000o4-2Z
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 17:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa7-0000nN-CW; Wed, 01 Jun 2022 17:08:43 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa4-00021C-FW; Wed, 01 Jun 2022 17:08:43 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D45645C01A8;
 Wed,  1 Jun 2022 17:08:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 01 Jun 2022 17:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654117718; x=
 1654204118; bh=j1dmRX6JdLQttZNIrKMK0p1ihYzMGVycd1ijhAJTMXs=; b=T
 jZ2dhZ4smax/0vrZ6PoowGNCCeJ7ZOgbkSNHvMkCpD11nLhngI8nE4g+zeitGzp3
 rIOVT4FcTmpG4pmOUaNTcQTdbq1zPoAJV4lsYM9ccz4WqQs9LZnzbqf4U6UHgBml
 Pszn8kq7fCTfC0nldJ9Thj6Oz1eYUxsqmTQbF2AfVnWC4njEYMfdACoA5VmC2SUA
 Dt++iAKhwC86YXMrZlw0WuIvLSsGsY4UwD2zPKcqE1/s1Qb7irBXel/B/s2VL4ry
 JJY8aNl+olF69s7eiVjyW1XlKl7bxrE14AUOU82vMiD0f5fsRvC0Yy7/AZajJbPg
 67vkfcZLYsRr6dOvrcicg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654117718; x=
 1654204118; bh=j1dmRX6JdLQttZNIrKMK0p1ihYzMGVycd1ijhAJTMXs=; b=Z
 veSG0lmZtRFj9TGA9TLiBueYIvbW7N7g0+4cWK187voL+JtPf1ixyQYHtdQKRnKu
 HQ8TwbdOdYaNOn/n2LvhrHYEOcf+ElS1Bw3VlX1XIvNiGdw1Nvt/dIFBHpA9L0BX
 6hsVlrMKa1GNYad5asbskldoBDqC+v/l3aT9G3GAHc1tXqD7f98/bek01nLi8a7x
 EMxeaJvUvoDOPb3frFvei+1n8u2reOt1kGHiNiarYycSt5uY6XmlfDiMj88O/I0B
 f4OAZF5nmM7xZ3QCliGeAdIkYT9VM0V74r+Q+jryDFUT5dcifD3M8BZ4RFDu2CeB
 Kcn5DW++k0Nr54O72M4jw==
X-ME-Sender: <xms:VtWXYhyBUO1Btk7utIi0mEd50oVJ29UCZnPjdyXC43F9DjPrNtS3xA>
 <xme:VtWXYhQ9DPXJ9eokWFujjeSxpaUaeBMcioI8cIPqan-E8DIbqKxbWogaq0_CAM4Ko
 6uKXVlmh7sLWm39HMY>
X-ME-Received: <xmr:VtWXYrVR5vJDTInygCNCPvk0xwshiZ9iNk2eN07n7ySOsSvbgwgcKMLWOepU75iTDckdtIuEnFZqY9kVWFYa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:VtWXYjjUOOdnfx-hjzaxJ68daX4n3Dip0BmT-XHCdsQpl_LCoCsk0w>
 <xmx:VtWXYjBwwPGdiGoztkhtmYXnMPjUqJGXWWV-fqam_-TvgBXpu4zjqg>
 <xmx:VtWXYsKA4WD-eUi4hqcTZi7FsKHno7P5-SUxkytfRfAbLhocwzUV9w>
 <xmx:VtWXYgJIwbLy3icFIgOQTKWkcgp0-Wo-nDEwflP0JXevjEteMxN65w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 17:08:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-arm@nongnu.org,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [RFC PATCH v2 1/6] hw/i2c/aspeed: rework raise interrupt trace event
Date: Wed,  1 Jun 2022 23:08:26 +0200
Message-Id: <20220601210831.67259-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601210831.67259-1-its@irrelevant.dk>
References: <20220601210831.67259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MxHDFm9HlOFW

From: Klaus Jensen <k.jensen@samsung.com>

Build a single string instead of having several parameters on the trace
event.

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/aspeed_i2c.c | 55 +++++++++++++++++++++++++++++++++++----------
 hw/i2c/trace-events |  2 +-
 2 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 5fce516517a5..576425898b09 100644
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
@@ -31,6 +32,9 @@
 #include "hw/registerfields.h"
 #include "trace.h"
 
+#define ASPEED_I2C_TRACE_INTR_TEMPLATE \
+    "pktdone|nak|ack|done|normal|abnormal|"
+
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
@@ -38,23 +42,50 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
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
+        static const size_t BUF_SIZE = strlen(ASPEED_I2C_TRACE_INTR_TEMPLATE);
+        g_autofree char *buf = g_malloc0(BUF_SIZE);
+
+        /*
+         * Remember to update ASPEED_I2C_TRACE_INTR_TEMPLATE if you add a new
+         * status string.
+         */
+
+        if (aspeed_i2c_bus_pkt_mode_en(bus) &&
+            ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE)) {
+            pstrcat(buf, BUF_SIZE, "pktdone|");
+        }
+
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK)) {
+            pstrcat(buf, BUF_SIZE, "nak|");
+        }
+
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK)) {
+            pstrcat(buf, BUF_SIZE, "ack|");
+        }
+
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE)) {
+            pstrcat(buf, BUF_SIZE, "done|");
+        }
+
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP)) {
+            pstrcat(buf, BUF_SIZE, "normal|");
+        }
+
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL)) {
+            pstrcat(buf, BUF_SIZE, "abnormal|");
+        }
+
+        trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], buf);
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
2.36.1

