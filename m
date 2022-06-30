Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp263607lft;
        Thu, 30 Jun 2022 04:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDxpGpy3mtFco0H9Kvacf/yuFgA3QTCsuyh277578iG67zUeK0kiasHyt3F/u3gVKemQ5P
X-Received: by 2002:a05:622a:118b:b0:305:bc2:c7c9 with SMTP id m11-20020a05622a118b00b003050bc2c7c9mr7101984qtk.61.1656589303908;
        Thu, 30 Jun 2022 04:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656589303; cv=none;
        d=google.com; s=arc-20160816;
        b=NYg4lgiw9+m6OSNB6m7+eueI0ninL9nOSNxrYo4p6iQ8dbRp5R81K2IW8v4cM0y45M
         vzgM/eYB6JecHIGrB1ELTu1rTFZuy7XL4NYJTIT87ZHnvwz6vZssv1Z+ZUT+EaKsBnDE
         W5Gpp7G7eepeOzhJJz67aLGOZFG7GK145kVvm84XDsKK/FFTyHJFIBr3A4Ut5qvmrSd6
         O9d7rlo+kVRbuEXFzpn/QFqrqQlRtcQOyj36J29WvY9oxd5Jyhym7N19Bd9lTM5D7LLl
         PQiz+/f5xLq4FKIkpZN6WJ+B2OiA3/7gY5HIyNJMo+urd6obX7iPTPs2oJh0/Uakndro
         6sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=eT2n+wKci+39zV52wdvR4e5OleXjY6KxftqbA4F+07U=;
        b=duZQDM+jxg8MHr18a27ZAIWRP3qAeAtl0v9UOF5bu3QNLEh+6wi2jseOPNdejgvipz
         VvM89HmYfpXLlcyY0hRBF0tZl0TuxUsNGvdjV0u9WL3PrTbFIyj/8RRw7OsW09527UjK
         rqMucVv2YkiBMcy2Gp1gKIJZRBfLf4Y0DJQEz36DwZRqS1KHaQE+FUsN9XB7F7zcZdOm
         XKZgW9/TNb/U4DKiVJrxGv/TJkoVTTzw/YDbDCBq2223gKzJi7xA45XeXM973pQlVrpn
         qAKRqMqFG/u64Ggoy6N+abCgiLUKTZdxovYwRk8zDUFHk2yGNP+U6N8M6IzcDAnhf3K/
         q76Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05620a28c900b006af3bce2f2csi7198552qkp.101.2022.06.30.04.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sYI-0004rI-Kz
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIR-0000h5-Bc; Thu, 30 Jun 2022 07:25:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIP-0002Sx-Cv; Thu, 30 Jun 2022 07:25:19 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbZ75X8z4xDB;
 Thu, 30 Jun 2022 21:25:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbbX6qqXz4xD5;
 Thu, 30 Jun 2022 21:25:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 21/27] hw/i2c/aspeed: Fix DMA len write-enable bit handling
Date: Thu, 30 Jun 2022 13:24:05 +0200
Message-Id: <20220630112411.1474431-22-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S04IaWEecCVC

From: Peter Delevoryas <pdel@fb.com>

I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
seems to be because the Zephyr i2c driver sets the RX DMA len with the
RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]

/* 0x1C : I2CM Master DMA Transfer Length Register   */

I think we should be checking the write-enable bits on the incoming
value, not checking the register array. I'm not sure we're even writing
the write-enable bits to the register array, actually.

[1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148

Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
Message-Id: <20220630045133.32251-3-me@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 6429ab18741b..4e32b147ec2d 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                                                      RX_BUF_LEN) + 1;
         break;
     case A_I2CM_DMA_LEN:
-        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
-                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
+        w1t = FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
+              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
         /* If none of the w1t bits are set, just write to the reg as normal. */
         if (!w1t) {
             bus->regs[R_I2CM_DMA_LEN] = value;
             break;
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
         }
-- 
2.35.3

