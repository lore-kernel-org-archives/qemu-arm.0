Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4478983lfh;
        Wed, 1 Jun 2022 14:10:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs4ngzHpDsNUMh0AgrYycuI36qeziUo2pwxBrqDv4VK731kFIdacEQ/24Eay7zbEwGuBy0
X-Received: by 2002:a05:620a:40c8:b0:6a3:5599:3b74 with SMTP id g8-20020a05620a40c800b006a355993b74mr1110237qko.769.1654117810105;
        Wed, 01 Jun 2022 14:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654117810; cv=none;
        d=google.com; s=arc-20160816;
        b=lyzIjMCbAK8FdD24FpA94w62Fu0i5egidpg/2OYMjU4PDCzXyFRKgPwOkY6afg5zC4
         Yqf2wyeOf6E8PDSCVewoaCIApQS7kVjw9U1VEGga7ESWKQVEmjnXm9lsYQYeXYPAjiz9
         IRr/UmFaaAPY7LgFm+axc5vd28dxKSXWiXtI3tS4xC8g4HoUdBL7MXRhy+Lt/bY2daia
         Y5+yi4GA2gzObXur2qIK7yOoSz4x0kbTaH4Owh8BzpZN0nz5ZLiPaKCnUeKhxLNFZrDp
         +gfFqiN4JNlLhjsPxOig+2/nkXmBfLVWFxuePbuSX7UimruTYfZtZY7wNakezRBOxPBX
         e/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=agWTpPN5g6Ngdn7NFU5D5UXTWDyetqvjbfAd0JxUuP4=;
        b=G1IF3r4gIZUYwh0gkkiOeWqqP93XJ8LQl1Kp+SocuaGLz5m5rjeuJoBB353sqidGsU
         WowlFZ4LbGeC3KUnVobmb2QPNsZc7nJFOzu9S+O8/Jm6GUfUaXbujGLqw1QcT85tj57n
         AvdxEP6dL54gWQBh57s0h8yonQPHlRZAKYK6wXq2oaF0xywMT8aGaAVkYnaqLhUVxKRk
         2CfnU9rEsFQTcK9iyfioH7WTRGWbYFynd+rRzPIbLhJApoqzgi35/BkEYnBU8SW88+Ub
         3LggTKlL0ArgqGLL5xlsF92hRy4tEb9xPda9uUP83YiIhpyZGt8mj3KL9zUZXIONeTlk
         AWLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=F85+IZzJ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=T5Kyr2MF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az43-20020a05620a172b00b006a62c4bc399si1642198qkb.478.2022.06.01.14.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 14:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=F85+IZzJ;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=T5Kyr2MF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwVbT-0001eu-Lv
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 17:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa7-0000nW-HI; Wed, 01 Jun 2022 17:08:43 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa5-000224-Sq; Wed, 01 Jun 2022 17:08:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 229FA5C01C2;
 Wed,  1 Jun 2022 17:08:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 01 Jun 2022 17:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654117721; x=
 1654204121; bh=agWTpPN5g6Ngdn7NFU5D5UXTWDyetqvjbfAd0JxUuP4=; b=F
 85+IZzJceowG7EBMiKYT8UBAPYq/YcUcyio8x35QnjVN0MOli1h+2nwO4+vJWXSC
 olOpALkgMiRCJvxQLyk0/XAbrM6BSXz06VcFsEPhsruFP6pBx3c3b/Yl/GGOCTO0
 +Rx5hcWdmHswSGm2JM0yNWxEvwNNqt7imrf0cbcYLYjA7TuUKq44q/OR/CZ1pIlt
 2vvIQygjgtuczuCOswmHeBhPLiy3CDxYEJBy0j21oK8T5UdYWHsHmdeaY1LCGRfq
 jY5ZJ0MQVtQKX0iqe9DavO5VmjeqijdRsokF1wcmAiE2d7KaAX5rTCXrE441weLr
 HB+MZOoNV1yqE/EapiHCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654117721; x=1654204121; bh=agWTpPN5g6Ngd
 n7NFU5D5UXTWDyetqvjbfAd0JxUuP4=; b=T5Kyr2MFvQqkXpvxni5staFBcVQLX
 DFPMdBwdzUsaWu0YEXrzdqHtgX6amTeoZ5Bhxy69yPFoKyDXSm/1LsQmvfloSAWb
 4xZRVlhp+Tb2VxDEJNIzwxvh35dVNNyjZ12SUi8ZQZfVsIsz4natJXMXoYM3gTAk
 RKufZh6jnh9sokhlnWlFnOjIRgorSMcjTSQm1Xyf0/k3/pE7Wsgg43+2hLjE9CXq
 A07Y4o5okxFSDU4lxr0MXDooYM7A5eln1u9InNZeOZL3/Z1H0I/qt23iyuKNtlZ1
 Sf3YAW6kn6J85hQOwnfPO4ub+xn4YVlxLQzx5I4QJHodYdwE1sr1G2Q2Q==
X-ME-Sender: <xms:WNWXYvPcDFolrt1q0nDuYCJuKYRzr-c7n8Nbuov-z1JXxFGfHex98Q>
 <xme:WNWXYp-B9pfviKOZGZmiAGEf5wcCVGY7dml45YOO942Yg9Kl-ZXEVbAQgoR3_T0ji
 Mz-4DUrk-rMuwfGW5o>
X-ME-Received: <xmr:WNWXYuRiXoQQjWYrWK5bzS5QIz0FXac4nLziw23EfK_sJu_vmHN9HmlaQSDFiVKItlvJ0oe3Itbimy7-AE4_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WNWXYjtfHFDQwAfC1M44kBuew_D_B7QHMBZNb_G9ONwOIjIf7ppuFQ>
 <xmx:WNWXYndSS8q3_bQdCiOlbPRjtkICnw62QA_2v6t5Z3UrZ75iE1SFnw>
 <xmx:WNWXYv2iw4bzrabnX2NOzODE_r2KPDr-LINYn_5TmyeudZ0JBDuZzw>
 <xmx:WdWXYv1uLLg1bHqCIkjBoMVA67yKDHh96p_242YAB29v8ouRM_J-7Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 17:08:39 -0400 (EDT)
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
Subject: [RFC PATCH v2 2/6] hw/i2c/aspeed: add DEV_ADDR in old register mode
Date: Wed,  1 Jun 2022 23:08:27 +0200
Message-Id: <20220601210831.67259-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601210831.67259-1-its@irrelevant.dk>
References: <20220601210831.67259-1-its@irrelevant.dk>
MIME-Version: 1.0
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
X-TUID: yRUhQGdId0N3

From: Klaus Jensen <k.jensen@samsung.com>

Add support for writing and reading the device address register in old
register mode.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/i2c/aspeed_i2c.c         | 5 +++--
 include/hw/i2c/aspeed_i2c.h | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 576425898b09..5a7eb5579b01 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -104,6 +104,7 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CD_AC_TIMING2:
     case A_I2CD_INTR_CTRL:
     case A_I2CD_INTR_STS:
+    case A_I2CD_DEV_ADDR:
     case A_I2CD_POOL_CTRL:
     case A_I2CD_BYTE_BUF:
         /* Value is already set, don't do anything. */
@@ -741,8 +742,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
         }
         break;
     case A_I2CD_DEV_ADDR:
-        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                      __func__);
+        bus->regs[R_I2CD_DEV_ADDR] = value;
         break;
     case A_I2CD_POOL_CTRL:
         bus->regs[R_I2CD_POOL_CTRL] &= ~0xffffff;
@@ -1060,6 +1060,7 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
 
     s->regs[R_I2CD_INTR_CTRL] = 0;
     s->regs[R_I2CD_INTR_STS] = 0;
+    s->regs[R_I2CD_DEV_ADDR] = 0;
     s->regs[R_I2CD_CMD] = 0;
     s->regs[R_I2CD_BYTE_BUF] = 0;
     s->regs[R_I2CD_DMA_ADDR] = 0;
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 79c6779c6c1e..03fe829a3a57 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -297,6 +297,14 @@ static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
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
-- 
2.36.1

