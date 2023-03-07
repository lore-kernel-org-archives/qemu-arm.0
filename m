Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5777887ejc;
        Tue, 7 Mar 2023 02:35:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9WpNrKs2jFpDnMoM+08YHj3EcYzfghJvw9ZKNlGRaPUatFXO4KM5e1c/HMaph2ItjK4218
X-Received: by 2002:a05:6214:2a8a:b0:56e:bc62:e151 with SMTP id jr10-20020a0562142a8a00b0056ebc62e151mr21660007qvb.7.1678185341870;
        Tue, 07 Mar 2023 02:35:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678185341; cv=none;
        d=google.com; s=arc-20160816;
        b=L3aS5PigOBAsj3sngd4OiGDT5UCluD680pBjF3oQYRSyU5oeOFMIxwi4XUlaFQaMXn
         fHgdExuiGItjri7fpLgaBfBcSnqjbOGgvAupVwWZ4Upu/UodCDTHZpUCb3DquDjkb4pR
         ehb8aQsil2f13iIih3j9R5NV2pkJ96ph18zDwX64tK4pyV50upgsdP+xVjvhqU9l1jjr
         OZ4TIIl6FEdZr0yMKDJiCeA1HylgqZSTczd61wTtVRCpfVp8GTCKfufk9WJ+kKiMsBFL
         ZCqLZ9gRVctslA1QWfW6yNGkQ3Ax3cR8MJ8JcynHJtpG0+SD8tH8/5FG8HIZSAlx2/pW
         sSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tCjmdbsQxid1obaHtp3lgEThZD4SzjxFBhumiAsIbiQ=;
        b=rVz+wx4hKt2rOdCZsCy4Cd1Rt684q8/6wCdGtJ+k9rwldyxCjtZx5sHmYxiQh/pM5q
         84UUP59HDlFKvbWw/jBeuP8IwIMM2fqcEJyybXurHPBnb4OB0n/CRJ5UHEziZGa2K2hS
         6+0tdgz+NteklITaV6ShgbDidGdVrumbTLKlPwkj2sYaDgFEgn0FW/8LT8swRyEHcqIF
         evDFPypnAytTHzcS8ZEkHIECzLa4+oJAnkrAtQw8yLQof+/otift4UNAtOPb7SfVYTVx
         uH0uJHibgFiE8K7Sbknl/hxiWl8AFse34D/H3j4peMYhvPgtRR/BEsQ6hMobeRSWcOTi
         VoYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KVwLC4E1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a05620a450700b00742820e752dsi10553636qkp.316.2023.03.07.02.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 02:35:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KVwLC4E1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUfK-00082M-KO; Tue, 07 Mar 2023 05:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUfI-00081d-Bj; Tue, 07 Mar 2023 05:35:28 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUfG-0005Qf-P0; Tue, 07 Mar 2023 05:35:27 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so16139551pjh.0; 
 Tue, 07 Mar 2023 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678185324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tCjmdbsQxid1obaHtp3lgEThZD4SzjxFBhumiAsIbiQ=;
 b=KVwLC4E1g7PTI/g8IQ84zryA6uFSzt436z5ZuoGi4rzqulx852FJXgdypy5mrLZgXH
 gFrEqxe6b1gw8I4VijplLDHC/j+Cr//MQR+rYqqZqzPJDLZkcrkhdDa8V7cTyIwzPMSC
 vGnwsmyBZhOdv9jJqzjYWr/SKV0uaz77d5zULC3f0O4jvc0AiXuksTQznRpWNGct0WOB
 WCa3H/cX7+UaEtX1a0fOXJyoKSt9Rd3cdBvBIP9Nb5TwdJNaKQl1ObHYFLPhj+ctlBGT
 UpzrBe4tcdTqjR59r9G5yjwj2Fi9KhS1EwOjZGTTl0yo0gSvV/O3/kRQvglaPtULqZZp
 4vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678185324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tCjmdbsQxid1obaHtp3lgEThZD4SzjxFBhumiAsIbiQ=;
 b=TRXBC2kOUUnc/1+J5h7+RMg63J+gQ7kw+WxH81BqDS+r71xJuYE6L9Il/HlkPFqHqM
 nEsGMz/dS1Ab2dBkGn0Ju93bJjfPUPPxR2XrlQ0CS0mnMVNjF6dw8IPd3pVGQrpWnew5
 0vxR48ER0tTVWi5m/rMSWNGsz08GXcMJdVlQWDZwi/OaYcUA8pf+RzKe/KBbzdzcN8x/
 s2hgT3FZupWq0/Hgjfi6JqJdZ9QqJ8mPr0pqyOSQYhIZmG5ye1yiw6+UW11FFIZ9hIu/
 tyx6d0Z1jVNhYIlx3bYkT7+NWSlnCKAnF02bY93NfWYMAtA1DD9GqRR4tLEcC2PduiCX
 QPDw==
X-Gm-Message-State: AO0yUKWXlLC8ZzotGhvYIuQcn1SLfkzyWXTVO31ezvJE9vE/7JUAbdtW
 5BH3AMr9cVfRnOuNhWDm1YY=
X-Received: by 2002:a17:90b:1b45:b0:237:c565:7bc6 with SMTP id
 nv5-20020a17090b1b4500b00237c5657bc6mr14839477pjb.10.1678185323814; 
 Tue, 07 Mar 2023 02:35:23 -0800 (PST)
Received: from hcl-ThinkPad-T495.. ([2401:4900:1ce1:a87f:e556:a76c:ebd0:7cad])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a655b4e000000b0049f5da82b12sm7518428pgr.93.2023.03.07.02.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:35:23 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Added TMP421 type sensor's support in tiogapass
Date: Tue,  7 Mar 2023 16:03:35 +0530
Message-Id: <20230307103334.3586755-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QL0cOm3HJjc+

Added TMP421 type sensor support in tiogapass platform.

Tested: Tested and verified in tiogapass platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 86601cb1a5..c1843693fa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -542,6 +542,10 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
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
2.34.1

