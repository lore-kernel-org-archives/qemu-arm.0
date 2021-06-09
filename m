Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5275376lfa;
        Wed, 9 Jun 2021 03:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5cNiX6A37LCzlAR8kb8YWQ1JZgGjJWFIFlN+/RUe6uzkGds8MC6GlCDPTkCOJgQIPN350
X-Received: by 2002:a05:6638:33a2:: with SMTP id h34mr24844470jav.60.1623236352853;
        Wed, 09 Jun 2021 03:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623236352; cv=none;
        d=google.com; s=arc-20160816;
        b=QVUFcM80gwD+aAB4qJv2GUyW+wlii9N4imshyJ887dXnQ4Nx4IKPBnzpbkqvAg6Sdu
         bA4L4QetKTnwqtaoBi5ZCQDzDwXY1Pa7o5bp/tUHz4i6Iq/tZC0NSRUTGYTJpbZHBHv/
         JdEK7G563c8wbrLdnpUt7zx/hrZ7xDjFLsVmdEKW1ShPLHdMqOZp0in6vwO1KZbVYOwk
         HreT5RG39vxOxlN4tuBO4GxgDu85gGhQKvbKZuGmWX9TwzbSZEeQVaqFubouqqXeofY+
         KnmLHFpJaecDoMwrV7V44qv5mx/wQyeWQcteHSbuuc66Dr/ZFtlwT2ZRRJsul4r8ud+M
         /E8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xFg7MnO7nvJnkVMGtL3sSINZ09D7gupmzHvbV9EVQ2w=;
        b=0EpTTPbUC/22ljgtD+PyrTRFbXGApRM//IDRQWOFm/8BeUuoxvassmOACT+ylgTvQY
         sl0Luf3HJYC5UbUFuioctaPKTxPKZUnwEsn90BRRQxW1HivYn6USn7HO5EGFHhpc/inC
         ENabkal9ulhFaOTrf59jd1G7j2XKGcVyWWKXF+vdgNgCIcR/r8SZqHaNhd5ELK29KY5I
         bLOJPoVGZpkt/CmPvUcxqKgDkp9wnAL1AOl1jJInBhLeB3fWdA5xoySgWyPar6q0BgCv
         fjtc9s9HV76lBkiW2gspuEEcJbacti6uc3B/dq10dqCF8rm5JBQHztcUAXg9+TS71Mlp
         nmiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thLOVocl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si2772766ilk.86.2021.06.09.03.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 03:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thLOVocl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqvvU-0006Ih-1n
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 06:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqvuq-0006Fg-NZ; Wed, 09 Jun 2021 06:58:32 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lqvup-0006wO-B7; Wed, 09 Jun 2021 06:58:32 -0400
Received: by mail-pg1-x536.google.com with SMTP id n12so19088543pgs.13;
 Wed, 09 Jun 2021 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFg7MnO7nvJnkVMGtL3sSINZ09D7gupmzHvbV9EVQ2w=;
 b=thLOVoclJfn2G1GQAA1c1iJ80kOYifVXln7fwRI4dZzEBzXu0BmbBGWkv4t6ogqbyE
 OtuSBUTBbnUpbjtt7dJIQtU+G0D1iDt5Ulw9BQtXYtzUD2GjnYcM+liDRXWWi5AjZUPf
 7T08GE/k9hJEnEzgtVM8thbef+s17FGe1TVCJxRYtEcSHYeLHr6CpwGSvmdqnUE+eFX6
 0ycuUON5+QWRLKFJl1IYHTMPMead9CTX4ONPw1cjqS9wowoNdz7DDXC3foeVgJ801gRx
 yhbM86l0ptGspjMjzffw0qYjarkQ9mhyxiXXXpXNw4WMP6A6VUdwC9CNvftDfQz4DI+t
 f4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xFg7MnO7nvJnkVMGtL3sSINZ09D7gupmzHvbV9EVQ2w=;
 b=Ddz/VRinB3rufKUG39IUkJXXMZUOj5H0AxMxOjc3iaImRDXrLuq1nA6L1D+dVHjLYA
 coUK8sMDA/h5jcO23+3O+fASvBeYBE2/zvWHwtbUEyFxrIEU0APsUjY7LQOFFhVpZFKL
 Pucw+Q8CiBboz2FKF/GIMxqvPcvbdxzyjBmZekLvQo6xC7PJeoIeVaCKnujo9Es579s8
 6NzYotqLdHApHQFzz7OFIIFG3iMDATKmItMgqGH4rtAEgSN/XD6juJHMy9VrFW7GiNj8
 +mj+9sRm9lVwVZgk2jt+MC0+7KpyiitIhFjFgh6KjGltLt5Tz96uRExR48yx+JtDUmn9
 cedw==
X-Gm-Message-State: AOAM531+tcFB0RFa4paNqaj+oXtppPbr0NUY+SmqSi8AvxE2YXi/TRMs
 3AOFpqMyL054Fque/In5GHQSjaO9W7U=
X-Received: by 2002:aa7:83c1:0:b029:2e9:6822:69ef with SMTP id
 j1-20020aa783c10000b02902e9682269efmr4810035pfn.23.1623236309782; 
 Wed, 09 Jun 2021 03:58:29 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id c3sm12866923pfl.42.2021.06.09.03.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:58:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/2] arm/aspeed: Add DPS310 to Witherspoon and Rainier
Date: Wed,  9 Jun 2021 20:28:02 +0930
Message-Id: <20210609105802.17015-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609105802.17015-1-joel@jms.id.au>
References: <20210609105802.17015-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sPjAIlU40XSA

Witherspoon uses the DPS310 as a temperature sensor. Rainier uses it as
a temperature and humidity sensor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0eafc791540d..619ad869dd71 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -597,7 +597,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
-    /* Bus 3: TODO dps310@76 */
     dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_slave_realize_and_unref(I2C_SLAVE(dev),
@@ -612,6 +611,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
         qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
                               qdev_get_gpio_in(DEVICE(led), 0));
     }
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", 0x76);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
 
@@ -693,9 +693,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
                      0x4b);
 
-    /* Bus 7: TODO dps310@76 */
     /* Bus 7: TODO max31785@52 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x61);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", 0x76);
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
-- 
2.30.2

