Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1839348ejc;
        Mon, 16 Jan 2023 15:57:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsB+e1u2kv4m5euWYS5xcM1nt88Cmp5n2draomrh13gCFdWSy/UZ1V2JjtTuZZay9CTcexU
X-Received: by 2002:a05:6214:2b9d:b0:535:1982:93f3 with SMTP id kr29-20020a0562142b9d00b00535198293f3mr2023343qvb.17.1673913421504;
        Mon, 16 Jan 2023 15:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673913421; cv=none;
        d=google.com; s=arc-20160816;
        b=YEdlPxD/2bVCAbi6tJBmi1J+Wh4QX76q6ekztZR4A0lY8YUWcxrUpoUisVV9QPWIPW
         /NdLiSrRAkVqJGD+HtrbRIS9UBszN/Y2lxPCAqQSHtELvEzbT+0b6LTEroZLZ9c1/Wjx
         CIVuCvB7kg0oPyQnNueV6bvPe+t7cz45AmRQBLWjhCw5xS9sOC4erVsTaT3XUcgAvxxv
         4tkgAA1mi79DZhqfkljXSap1oi0v8LpDG5S+dMQ6tfwurs/mUdbBulVYCRlXhISeAJF1
         RV1sWotARXhrkgCQubN2Jz9dWa3hwaw6judvu2q5ROHwoDXmSzsusSUaT8S2VNG8wz8j
         BvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=aTvYK618bdAdxFFQMkEDPzyZk3Psz4ozaHTPo4oCoUk=;
        b=N5hfOexmuBuBGsFu/PjkuiO8KQ/DJS1qDbwMQ2rAQO4Eh8wJeaiGdnebJBwpLItYVT
         tVG6njqv0GIzEMnelc5ekiDDie+fVfPKaNQvEfSZ+q7SfpfKD8q7Jo/oNVB8briYFu64
         n0FO2iI8AaAMUEmuYdEKVi2XNTdbEeUPBIaqHkiYKXXnvoFmWk1Elaro8dAsArC68+Fr
         6+mcyJ4GbuB1FPu0umwN0zOQuRNH6ohnCn0sUHLjK37eITnNwtnEQvy+qWXNyJts2/YB
         lKPoEYkvYnYPpnxJ2jiHQToaF2VjBgGxkg9rNAaGPYpVZacgePp2vLYLH6lTa08ZGHcr
         O7rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=HDWcQtsT;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=bcH0wBTC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a056214202200b004c751151a10si18909203qvf.532.2023.01.16.15.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 15:57:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=HDWcQtsT;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=bcH0wBTC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHZKt-0002nd-SP; Mon, 16 Jan 2023 18:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKs-0002nB-De; Mon, 16 Jan 2023 18:56:18 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKq-0003nE-A9; Mon, 16 Jan 2023 18:56:18 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D305F32006F2;
 Mon, 16 Jan 2023 18:56:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 16 Jan 2023 18:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673913373; x=
 1673999773; bh=aTvYK618bdAdxFFQMkEDPzyZk3Psz4ozaHTPo4oCoUk=; b=H
 DWcQtsTvjwVEC6N5QvSLLUSKVm6exdaqommdnhiVPk9EkPiIBDUIZ5zlIT8MLSvT
 mZZEByBeUcT4AEl0Tm5WxwcNtYIPRUJtTQIBKR8wX+ueRJyf13MvxrUHs608DkXb
 6HevgCvna41fNvLXmCZlAnhuEqv2Tz3zPCdjoAz6Dcu1VkLrwvvcSj8aUAHSTmsC
 7h0p5WCrKNqfaItxvWZqI5tQhr7HjZqh55XM1/LLQb3TzUMDsk77RQJxi1WdWEGw
 xi/j57dt//lGemfKmnE5/0nX0/b8zb046XE8BzYcnBGklH0PAl4amQHkdx/vWEDf
 dxxz0ByYPKPytwm9ZXhmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673913373; x=
 1673999773; bh=aTvYK618bdAdxFFQMkEDPzyZk3Psz4ozaHTPo4oCoUk=; b=b
 cH0wBTCgRSfVhBKrihZxqB+6YI8gPA/vNwddnUwJI1ALQzQUnH1U2dx4us8/tgUr
 tMjKKBS6s3BiIeMQj/nn2PUS8h/2t7wQN/FOhmFyjwQHfAI53kRy3mKvXD9paDok
 3HkYHcDaOiQeCjHg3TqP+fwBsNisi4/0LWfehm7KYD3IHmZA6VGs+ad1+adkNByw
 k2RKfMY5yGxjL53NlROieOENEBtzR3G9KWVbryXKOU66HVYlXOBfpd2ywVdq7pho
 adnTdoGZ19cQRLkan4Zj/RgP/elt+OqeLdJlim0JlEkUDu4+bsYL85wQLRQpW6ht
 tjhFk/PPOohRIJXD2qPHQ==
X-ME-Sender: <xms:HeTFY_lP3czFzVnRkE8iJ3_fnGVZRovptZScnk7hd9ETUdXVyI_GuA>
 <xme:HeTFYy3flv-DsEqBRttivt6V5BYnsMI2FrpUNec9PcflX4WIftlQxclSw8dWAdqMX
 74nrcgksCbkxnGuBVY>
X-ME-Received: <xmr:HeTFY1rMmxpWZUs_L44NiHClpurFvU4WBnb9FfTokNpJwiv1az9nqCgufiZqzCz08eVa-wA8XGSzyVav_EUJwjMn7XEiWTo_72Fq7RqKZPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhggtgfgseht
 keertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvg
 hrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvhfevvefhtddvueevudelvedt
 ieehvdejjeeuvedtudegjeeileetheekgfeggeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:HeTFY3lKygHCJCL1Vfen7fRf87SJ8FqAB0Y1O7Om6VY3MMEaeFXvnQ>
 <xmx:HeTFY90v2lMEIcQzQwWfilXdYU2KZSaDE0Kdb1Qq5jwSsu7Sm8fBHg>
 <xmx:HeTFY2uLiQEHnjokYRXENykALQMBkwa9l6yoKv7NA6DeuerdKtt9Aw>
 <xmx:HeTFY6mO2gV5wnnwjYvN9Xolae1XssYLaLh-0AsRk26I7YM2xrSwGA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 18:56:12 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Date: Mon, 16 Jan 2023 15:56:01 -0800
Message-Id: <20230116235604.55099-3-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116235604.55099-1-peter@pjd.dev>
References: <20230116235604.55099-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: aBuf5hLnKf1q

aspeed_eeprom_init is an exact copy of at24c_eeprom_init, not needed.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 52 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1f9799d4321e..c929c61d582a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -660,15 +660,6 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
                           eeprom_buf);
 }
 
-static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-{
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
-}
-
 static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -701,7 +692,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     AspeedSoCState *soc = &bmc->soc;
     I2CSlave *i2c_mux;
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
 
     create_pca9552(soc, 3, 0x61);
 
@@ -714,9 +705,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x4a);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
     create_pca9552(soc, 4, 0x60);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
@@ -727,8 +718,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 5, 0x61);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
                      0x48);
@@ -738,10 +729,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x4b);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
 
     create_pca9552(soc, 7, 0x30);
     create_pca9552(soc, 7, 0x31);
@@ -754,15 +745,15 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785", 0x52);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
                      0x4a);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
     create_pca9552(soc, 8, 0x60);
     create_pca9552(soc, 8, 0x61);
     /* Bus 8: ucd90320@11 */
@@ -771,11 +762,11 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4d);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4d);
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
 
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
                      0x48);
@@ -783,18 +774,18 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
                      0x49);
     i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
                                       "pca9546", 0x70);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
-    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
     create_pca9552(soc, 11, 0x60);
 
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
     create_pca9552(soc, 13, 0x60);
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
     create_pca9552(soc, 14, 0x60);
 
-    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
     create_pca9552(soc, 15, 0x60);
 }
 
@@ -838,45 +829,45 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
 
-    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
-    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
+    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
 
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
 
-    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
     i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
 
     i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
-    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
 
     i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
 
-    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
 
-    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
-    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
-    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
 
     for (int i = 0; i < 8; i++) {
-        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
+        at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
         i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
         i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
         i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
@@ -947,11 +938,11 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
     i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
 
-    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
-    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
-    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
+    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
+    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
+    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
 
     /*
      * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
-- 
2.39.0

