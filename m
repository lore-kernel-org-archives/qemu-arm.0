Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2679540lfv;
        Mon, 1 Nov 2021 16:29:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO1zUpiYlmHE66wCK0KlEcNvRYYP1hr+MrLHCuGie6m4TEyF5klBl4zlil6zQjh0GbyPeJ
X-Received: by 2002:a9d:1783:: with SMTP id j3mr24238740otj.366.1635809384312;
        Mon, 01 Nov 2021 16:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635809384; cv=none;
        d=google.com; s=arc-20160816;
        b=MZXWx7KjBWGoQ6hVLZs1vxQuo/efkGYn8lcsFWX2vQZzJgYZ7YFLbqTWlpqugkE8Jl
         HJlQZJYFkdJ5VoFusBvcpCc8U6dOzzVk5qEntZVG3cwaKSKslpJCpSNAI1FrEshWnUzd
         ljm9iGXqc9CIeOgU+rWinlK7TbBK+yQqQjh1pKPBUQ+IvM9rMkzzat4PoHmnqs1qFKSQ
         FC2M9qsy68MWxUWKbA4GrrCBwgYFBCVphcvFBeXzxQRk/6EJ/lvCCqp4TR+Ya5ZXqL7k
         j14QyWFRLKfO9c1s+hhWFXUx89I4hD6JHnAcyCL3EbnqjacUEOz17g3vcM5wvhEZ2kOu
         hdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=Y1cuabKo+Ks9hRYNhU8759StOoTQ0i2j4/XnXE1Q61g=;
        b=O87S71F1zmrsWaI1eCrjJtfa0JUPlMbDnrEOZKgYLrgeK5OfFd+EcBB//8ypws9BdB
         aKE6flr6ufQNWO/f6562L9PXmPuVSi6OOvRlP8w4nXlXZBQbGx8Pvsi/bJEUxhocuHgB
         LjMLrews6DX+0qKn/EV7p3GkzQCD7FgIw+0eX0WJbBhDh6B9cmwJ/aVKTHJhIFB+meQx
         YKshdxxELLn2BF/EwrEWtMbIjVKZD+mcD7wDzq4RWlG0v2qr+KPjxsEaSFcM9q3Z6aMJ
         ful/WW92f78mJNuHrQinL1hiZ+7I7TZux3QeNgzSqkEz3b+GEKERKEKP9aD/a0oxIz7M
         05uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="YcT/fAZE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si2511600otk.195.2021.11.01.16.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 16:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="YcT/fAZE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhgkJ-0000Ei-KG
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 19:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OneAYQgKCD0vtgZnsrgfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfW-0002J9-O8
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:47 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:44797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OneAYQgKCD0vtgZnsrgfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1mhgfV-000317-7x
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 19:24:46 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 t75-20020a63784e000000b002993a9284b0so10147311pgc.11
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Y1cuabKo+Ks9hRYNhU8759StOoTQ0i2j4/XnXE1Q61g=;
 b=YcT/fAZEE8kr1aWMQS91oGsXqm9rMPjbxWqYHe4djv6pzXjnaIEzZixlqws3T6+7xm
 cQD2NwEaEAmhGJpvw4KGiy+CM0mB6MKcwyDLIEjd2RxvBH9mRgeKB9quQ/1kQo01sU/i
 IkdsogAvatq/oLuDeyDYGvYtlnPBxYu87jUO34oqMMHoC64KnAV3rS3JtD6c39mQgvZ0
 SPa0NFu33G1l6GIYM4c8U9tzuBTg4p1oIMb9hz4vCS/oN21qSasCXyRf1HdiGei+ZU32
 82lzf3peTaMQv10nvr+0NHVVkoDuEoz6+10xiAYYIyNhMHWU0NeepdyWhmu6cH69aMap
 C9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y1cuabKo+Ks9hRYNhU8759StOoTQ0i2j4/XnXE1Q61g=;
 b=xRdR4XRKK09FBRVS8e/Bg/DNYCYwto4YRn/qMy+szNCbEOpApRLovlgwRnLlrwIRhQ
 d1Yg54CMgFH7jhxf6j1YY6zLex6QXr6+NCg+EQK6HNpRLiZWsxfRZ0p67qBl/MwqLcyv
 +JvJVxF24qtr1arAh6nfnOxHM1TcFfg6pwd3b0glIas2sAcyfnnk9OBTMVn84s5RSwpF
 O5EXfaxU7zHre6EeGF4pCIKtDXKPOd031YUDLmQ3RmvM3hUCaXt15DBbE8ieOld3KB+G
 P5MGOSQIX4Ipw9U5jNcMPJfKGMPELgRIszOgYNOUCLSQ+fL6lKkgY8waJyt9gAI8OJVN
 MoWQ==
X-Gm-Message-State: AOAM531s9Roa+upb1HqsGm5ki29U9GDaWFc1NKCcpWn1DYHa7GU8TgiH
 utFuA/c9/s3/bwYdiMSh6/4Si2abv069zg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:b70f:b0:141:88fb:6506 with SMTP
 id d15-20020a170902b70f00b0014188fb6506mr27295438pls.28.1635809082537; Mon,
 01 Nov 2021 16:24:42 -0700 (PDT)
Date: Mon,  1 Nov 2021 16:23:46 -0700
In-Reply-To: <20211101232346.1070813-1-wuhaotsh@google.com>
Message-Id: <20211101232346.1070813-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211101232346.1070813-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 6/6] hw/arm: quanta-gbs-bmc add i2c devices
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3OneAYQgKCD0vtgZnsrgfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: bKLGD8TvGwoH

From: Patrick Venture <venture@google.com>

Adds supported i2c devices to the quanta-gbc-bmc board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 82 ++++++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 8c72024007..e3f0d337ab 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -257,10 +257,12 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
 
 static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 {
+    I2CSlave *i2c_mux;
+
+    /* i2c-0: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), TYPE_PCA9546, 0x71);
+
     /*
-     * i2c-0:
-     *     pca9546@71
-     *
      * i2c-1:
      *     pca9535@24
      *     pca9535@20
@@ -269,46 +271,60 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
      *     pca9535@23
      *     pca9535@25
      *     pca9535@26
-     *
-     * i2c-2:
-     *     sbtsi@4c
-     *
-     * i2c-5:
-     *     atmel,24c64@50 mb_fru
-     *     pca9546@71
-     *         - channel 0: max31725@54
-     *         - channel 1: max31725@55
-     *         - channel 2: max31725@5d
-     *                      atmel,24c64@51 fan_fru
-     *         - channel 3: atmel,24c64@52 hsbp_fru
-     *
+     */
+
+    /* i2c-2: sbtsi@4c */
+
+    /* i2c-5: */
+    /* mb_fru */
+    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 5), 5, 0x50, 8192, 0);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 5),
+                                      TYPE_PCA9546, 0x71);
+    /* max31725 is tmp105 compatible. */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0), "tmp105", 0x54);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1), "tmp105", 0x55);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 2), "tmp105", 0x5d);
+    /* fan_fru */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 5, 0x51, 8192, 1);
+    /* hsbp_fru */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 5, 0x52, 8192, 2);
+
+    /*
      * i2c-6:
      *     pca9545@73
      *
      * i2c-7:
      *     pca9545@72
-     *
-     * i2c-8:
-     *     adi,adm1272@10
-     *
-     * i2c-9:
-     *     pca9546@71
-     *         - channel 0: isil,isl68137@60
-     *         - channel 1: isil,isl68137@61
-     *         - channel 2: isil,isl68137@63
-     *         - channel 3: isil,isl68137@45
-     *
+     */
+
+    /* i2c-8: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 8), "adm1272", 0x10);
+
+    /* i2c-9: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 9), TYPE_PCA9546, 0x71);
+    /*
+     * - channel 0: isil,isl68137@60
+     * - channel 1: isil,isl68137@61
+     * - channel 2: isil,isl68137@63
+     * - channel 3: isil,isl68137@45
+     */
+
+    /*
      * i2c-10:
      *     pca9545@71
      *
      * i2c-11:
      *     pca9545@76
-     *
-     * i2c-12:
-     *     maxim,max34451@4e
-     *     isil,isl68137@5d
-     *     isil,isl68137@5e
-     *
+     */
+
+    /* i2c-12: */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 12), "max34451", 0x4e);
+    /*
+     * isil,isl68137@5d
+     * isil,isl68137@5e
+     */
+
+    /*
      * i2c-14:
      *     pca9545@70
      */
-- 
2.33.1.1089.g2158813163f-goog

