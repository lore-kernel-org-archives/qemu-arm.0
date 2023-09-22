Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1417144ejm;
        Fri, 22 Sep 2023 09:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6N7w1oq4cT8iY1GD9vDheZvpuS8Jrv/eFUWWCL+wusMknfj6H40bh/71Y4R6gkD6FlQWb
X-Received: by 2002:a0c:9c0f:0:b0:658:571f:52aa with SMTP id v15-20020a0c9c0f000000b00658571f52aamr7882315qve.56.1695398404503;
        Fri, 22 Sep 2023 09:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695398404; cv=none;
        d=google.com; s=arc-20160816;
        b=r/N41hfS7LjpD0c36LF3yZpWL+y2evCjtDgf2HXs3mWwAw6Al2wyu1ypCrL5VHRkW/
         I0I5IityZha84Qn3C+ymXQcufKVg8OnJP5MQr/ZjbMUGS/cAzf2e+uoPEse4PzR18YLr
         h8LcN7tdOulasHabqP6JDMOn/7IbMaBN28FgHXB174k+ZhlAOn0Sls7CnlDaWhrxHWGB
         IWiR8zG76vMkNFmjIqNnqsKyM7rnwv8ge2qm5P78Fkfuju9tFCGPUK3wrTM9Yp41AJUx
         GsPWUuOqf4/XsWDT45AwdkqDVxlFHlnsArw906RYEmSzyUiQ1pKQ12tXLxsZ/B4WJ4iX
         UJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4DXYYKkkLplkLuiXGdZEk9d1n+vzA1C16cIgMjqY+Fo=;
        fh=S2APpbBrpM+VqLE1Vn55XwNx8S+N0ykq53OdZwk4Avo=;
        b=l5aPcM4j/ScB1dT54HSBZkmvVQIY9WLL4yIakLxkd6v1ZKraDdMEoit54/RcDgrmPJ
         fekSvdoiVH0eTWfZLLAAFxZMcU2mHEjfw/NaB59FFHDR/RLqswVyr89ZJJnIfix0VFgZ
         vYPdiYkuSjEJsu0koAbrOmV9FboWXJyK+yCLCBnpb4VvcL0SEzwgnA53KuI4VFGe+b9T
         2o/dYHuqv+IH3oMVFW53GWorG7XKyzkEDLJxRSKuku1Vx/5q3DsMP0brqXkJXdSXZKLQ
         aPcgBl3SquNwvMBl4wY48YNEL7mq8ubqSeQOIoB8gh197E9hqjFbNLJklhsBMiZ/8CgM
         35bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020a0ced21000000b0065894579876si2356914qvq.513.2023.09.22.09.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 09:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjiZB-00019H-OI; Fri, 22 Sep 2023 11:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjiZA-00018p-QL; Fri, 22 Sep 2023 11:59:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=/LOp=FG=kaod.org=clg@ozlabs.org>)
 id 1qjiZ8-00063T-VM; Fri, 22 Sep 2023 11:59:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RscQv0sdCz4wZJ;
 Sat, 23 Sep 2023 01:59:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RscQs0bnxz4x3G;
 Sat, 23 Sep 2023 01:59:32 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/4] aspeed/i2c: Clean up local variable shadowing
Date: Fri, 22 Sep 2023 17:59:21 +0200
Message-ID: <20230922155924.1172019-2-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922155924.1172019-1-clg@kaod.org>
References: <20230922155924.1172019-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=/LOp=FG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XLk9sAvzIV8P

Remove superfluous local 'data' variable and use the one define at the
top of the routine. This fixes :

  ../hw/i2c/aspeed_i2c.c: In function ‘aspeed_i2c_bus_recv’:
  ../hw/i2c/aspeed_i2c.c:315:17: warning: declaration of ‘data’ shadows a previous local [-Wshadow=compatible-local]
    315 |         uint8_t data;
        |                 ^~~~
  ../hw/i2c/aspeed_i2c.c:288:13: note: shadowed declaration is here
    288 |     uint8_t data;
        |             ^~~~

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 7275d40749a9..1037c22b2f79 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -312,7 +312,6 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_pool_ctrl, RX_COUNT, i & 0xff);
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, RX_BUFF_EN, 0);
     } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN)) {
-        uint8_t data;
         /* In new mode, clear how many bytes we RXed */
         if (aspeed_i2c_is_new_mode(bus->controller)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, RX_LEN, 0);
-- 
2.41.0

