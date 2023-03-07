Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6105659ejc;
        Tue, 7 Mar 2023 07:56:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/9QblSVAMrnB3fa+OCqwMwi0i8Ynl0vgDi1GGAKiVXKECH36UAEPBaG8ycFxgdy1fTDN4J
X-Received: by 2002:a05:6214:29ce:b0:56b:fc7c:e57c with SMTP id gh14-20020a05621429ce00b0056bfc7ce57cmr22704556qvb.51.1678204596936;
        Tue, 07 Mar 2023 07:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678204596; cv=none;
        d=google.com; s=arc-20160816;
        b=A5VvsWcsFp3kVC38njX9VhnO8knQW59IYZMFUXML3I+feXccYLy0hsAorMCo4RE02C
         Hg+acC89B+Hq53s6995dougua5wR3M3zkQV/gt2iIw0wRViMVb3IhPVM44LUYFxZr56r
         QwY1Sgdj+d6hSmyu2CJm7lwYKlVJArK1W7SmxWjRx9imwkvoKiX3gVryFNVCTvtNsQX/
         W8I8ZMqDKXG9JSkukpywzWy7C/LE/qyruoDyDinRK/l8VvRbCPnRcLYTWqFazweamTvJ
         VeuLHWZP3TfG1vFN/c/rTdEM3w7nQa4HWIDeHIcbTbRpreym8e5cyzEiGSPkUGs/hY+M
         Outw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=I0/ZzwKN4UzT7C1ibVFAYmh3y5O3LgSv1F+yeSLIehg=;
        b=w6MhYNf6VjZjDU4NNpS+DwKPGvOcTOX7FT42gGLj+nJNfUS0PHGA6VvkQx1K3cXAsc
         FvMUyhYr4lwmDwhur/AurFdW6kze70Ish9S+f/UgL0sMHL05W7jiWqn7VGEZwRZu/v15
         R+Gr0FkrWJvrMYLgrpLDVkoHoTb14qWsUWXkmnipzm8ZDA2Yo2uEy3CH0b2EGIrsfbap
         B76SFUG/I3TWdNSL7GM0i4iflw7MVwVUYazdy7EoTeNJYX3BFZAcHPuHMnt3JttWLScM
         ovs/8TQdYPjUE0HA5+kos5hS0c5ZP9HwSvZcY+/fyRTirfdhCWi8gMJN8lNoSEGMHyvd
         1/bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o143-20020a374195000000b0073bb1f6269dsi9162314qka.94.2023.03.07.07.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 07:56:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZZfU-0006JQ-JH; Tue, 07 Mar 2023 10:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfS-0006IU-7Y; Tue, 07 Mar 2023 10:55:58 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfP-0000RJ-Ag; Tue, 07 Mar 2023 10:55:57 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWKmH0dRQz4xDh;
 Wed,  8 Mar 2023 02:55:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PWKmF1mCbz4x8y;
 Wed,  8 Mar 2023 02:55:40 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 3/5] hw/arm/aspeed: Added TMP421 type sensor's support in
 yosemitev2
Date: Tue,  7 Mar 2023 16:55:26 +0100
Message-Id: <20230307155528.3655534-4-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
References: <20230307155528.3655534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=rbq/=67=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wQkyVTe2HnZc

From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

Added TMP421 type support in yosemite v2 platform.

Tested: Tested and verified in yosemite V2 platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230307095239.3583613-1-pkarthikeyan1509@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 86601cb1a5..7b5e603bc4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -524,6 +524,11 @@ static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
     at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x51, 128 * KiB);
     at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 128 * KiB,
                           yosemitev2_bmc_fruid, yosemitev2_bmc_fruid_len);
+    /* TMP421 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "tmp421", 0x1f);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp421", 0x4e);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp421", 0x4f);
+
 }
 
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
-- 
2.39.2

