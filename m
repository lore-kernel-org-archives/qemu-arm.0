Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6105414ejc;
        Tue, 7 Mar 2023 07:56:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8HSwPr/H1AF5QKN70+WhLPnPTG8GSaQVlnmeDf5JkfW/s7PvR9/W+xdZBzjKsqRJU1uLqN
X-Received: by 2002:a05:6214:1d29:b0:56f:6f5:502d with SMTP id f9-20020a0562141d2900b0056f06f5502dmr27228947qvd.17.1678204570509;
        Tue, 07 Mar 2023 07:56:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678204570; cv=none;
        d=google.com; s=arc-20160816;
        b=YkQ2mZIc6PAbEhsVvs36FgthK2mAOy7/dDPofZkwaXgJp8p/DQbyWzAEHWm2+jUmcJ
         aInPzqcnJiMckRhAZvD8PGGG4xq2BGyrFqNx07nCSjUrJjXZBgnRZRTqu9yeOuban8Wd
         ndjucbKmf7UldelMZrFxgFhvbbPorH9uAzLw3wiFleUlZUeqnZ4YpK5c/lzLQblJNj9i
         Z4j9Fhqh5Mv1cVxdfdYwap+f1Fty6z1gpljO7UTsWiXo0QyiD2RKhJZMJWiuVWfDluPc
         7UnNTJhu6/NRCgabrI3e7UxfH3XeGpNI1o0lwZ1ncHVapHN7CI4Cb0F3ofCyWJ78VcwD
         DuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=rCBycrxV7VA1Kanp+d8c6QcdCuaT65XdGN8Bw/UseBs=;
        b=qeTS62hQrrxBcpB9KSqbmMcSbbkP3LcMjw0H7kKHuhArQqMvXkD7cEX/jgJ010tWSJ
         SxzQkF6P4eEOyD8OVGCUoYrLh7Tze8/2uxlSFXFpZNKgHkc5Kc4G9IAPtWSo7RLlyem+
         Aglvb2Ks0aYS4YpBs1GIHm4dBTus3zksn9tueE9FGOyTehNb1n0k/i76FBh2sC5Gf7pC
         xkw38wFY1b4DrKT0TUI+giS2LSHkxleGYCrhCjnoPzgA4mWOk5zmuMg1byOqG+D1J/Eo
         fTfqYTtjzeGmBsfq2oa2Cxv54c5nvjrU9F70PmM2yRyoilkfd75yY3rlNTh4kz2ybksS
         VnOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05620a057000b0074077b10cf1si9279167qkp.502.2023.03.07.07.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 07:56:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZZfU-0006Jp-Ta; Tue, 07 Mar 2023 10:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfS-0006IS-0o; Tue, 07 Mar 2023 10:55:58 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfP-0000RQ-CS; Tue, 07 Mar 2023 10:55:57 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWKmK344Hz4xDq;
 Wed,  8 Mar 2023 02:55:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PWKmH4KP4z4x8y;
 Wed,  8 Mar 2023 02:55:43 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 4/5] hw/arm/aspeed: Added TMP421 type sensor's support in
 tiogapass
Date: Tue,  7 Mar 2023 16:55:27 +0100
Message-Id: <20230307155528.3655534-5-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
References: <20230307155528.3655534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=rbq/=67=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
X-TUID: zWiTQnvUunNd

From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

Added TMP421 type sensor support in tiogapass platform.

Tested: Tested and verified in tiogapass platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230307103334.3586755-1-pkarthikeyan1509@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7b5e603bc4..c1f2b9cfca 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -547,6 +547,10 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
     at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54, 128 * KiB);
     at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 6), 0x54, 128 * KiB,
                           tiogapass_bmc_fruid, tiogapass_bmc_fruid_len);
+    /* TMP421 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "tmp421", 0x1f);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4f);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4e);
 }
 
 static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
-- 
2.39.2

