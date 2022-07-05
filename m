Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4177385lft;
        Tue, 5 Jul 2022 12:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uLGvo0TSfuIzZqkJ/PsdAooeRqHNChdbAtrNOWr3yfd7S2X4sF9y3BzaNFugUMUnyOfCAb
X-Received: by 2002:ac8:5f13:0:b0:31b:b33f:2c09 with SMTP id x19-20020ac85f13000000b0031bb33f2c09mr29020293qta.686.1657048472405;
        Tue, 05 Jul 2022 12:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657048472; cv=none;
        d=google.com; s=arc-20160816;
        b=JqL1+16MMqG4i4gejD6MEElYFY80JWvsIxgACFOcOD8uiKCWyf+sdtWW/cJ18PYeeX
         OP+H7FfOv6zL8gjBqYpbR+rPhn9caV08IONoY4nzwC0UJzK9pWYoIvB1ib8mWadbHWDW
         PfGE0C1nLsutzeiQBeOblnmINT3JnV9IV78NWpKcn6KcR6bc5P6S6aS8J6F0HmHpqs7B
         MZw8+e3rNctnFTkCx/kcf1eEQz2Rq9Q9qGaMiK/lgW1W2UWA6TWPtAofVSWdT54ZaVVB
         Lfytru3zt2vfrxP+OcOspbDwTkElau6AO3EDE3xRBhtmlHrFG2oZsH8KgiVc/l7eFgZ6
         8wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=96mGIaGlFdmdXthJhBeohoBbi8sZAjUcJWCeLu+daBk=;
        b=UKm7/OETqMTj3LUXwUhImp320dhYsadPRMimxKKH/CVfTFX0I/x1eYencQ+IAj0dOm
         lpJpaQLf11WdJgmY0Mj5XWVDPfd7Gi4Oemt3YJktpF1SjBqIfE1zdgT8DvV8ZRg/U7oO
         7T5RNJAol3toc3i6mQKCIPOMS1DUJPJV/ruJEKxfSkVwMkqjco8Ai4J2EMX7mdkrpGwk
         GE2GI6ZjvQ8Kh+A21yPeD+gPGq1S1Z/dGG1vBzXAtTII/41yL5Fsql5A/pIz55KV0nMq
         gvdtDDq7vWr8OKlW6cX8f0LjArfN5ziunQ8y+Gc7cYuDl1uyR31jUCNY2JkIeIFKhyse
         6WGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=qiQxAeHU;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=rqYpTxF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl11-20020a05622a244b00b0031cc5db5aeasi4510099qtb.713.2022.07.05.12.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 12:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=qiQxAeHU;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=rqYpTxF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8o0E-00016S-HR
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 15:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzu-000165-QI; Tue, 05 Jul 2022 15:14:10 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:57813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzs-00015b-Nc; Tue, 05 Jul 2022 15:14:10 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7BF225802FB;
 Tue,  5 Jul 2022 15:14:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 05 Jul 2022 15:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657048446; x=1657052046; bh=96
 mGIaGlFdmdXthJhBeohoBbi8sZAjUcJWCeLu+daBk=; b=qiQxAeHURFTllnpk4V
 RhAvDw9eEfq6GrLXbuvOmisyXFBVQwaRM1Edho5tjJeeYtNM0wjiBdZTEj4ovfA/
 7xeVbsLqZbazoNDjkskyvSm7wBtUY6CvyMumk9i8zrk2h7Kx5IcJR0lFhTQcteCG
 oEkf8Z2gwR96mZlo6dEeNtH/ToLIc9NVw1A8FKt/vs0lNmluwelDTy+74jiPwl6g
 Ds1MB184lCkvJ031zr4nq51/v0SG7y3mPZFZg+B4IqVQQhmt28msl+MfSqDIz6oA
 sPlboWVsnvh0ozj84HRPujyzYRCWy7FCSC9pT4rjEJwFR5slhmBLtxAyehTpxXQ3
 tchg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1657048446; x=1657052046; bh=96m
 GIaGlFdmdXthJhBeohoBbi8sZAjUcJWCeLu+daBk=; b=rqYpTxF8BfKbfmjh3vG
 ILd8taTONkFamir2wx0Rfob2IsXJwlkXvVG2ZAzVsUZPW/bWoV/Kn9Dupix/h9Ow
 JmV5QYpiUU44nK2f1th2PKZQapLUMyW48JH3XGWvnMvyouf2a8X4VwF+e4eDeIQM
 p3wWzRQKprYGHkU69iCBn9ot2eXXQteb0cvvM7r+xQ+w7tbGrxialXn/9DjedC1d
 xA53ic6b2ZWn1wZC/51PkhWMFrRb7Zp7gSSr13cQeScFlqzvPUt7B5gzbc+8mSEi
 Hjy6YsN7K2sDrSpTauxD+9x8MIM4cjcF8p6spQS+R559Re4nc6plXyV7VE1vzFUd
 4qw==
X-ME-Sender: <xms:fY3EYiJI2nVkOKDL10B8DkdIW_GL02CtXDNETF6qL-1fxqZXOlcf_A>
 <xme:fY3EYqJeDY4q_ZQ7PdnQ5EopiPCpO2xIy6bkqyP-dWtNZagJ17zbyK5cTaI1xjvff
 5UWOgPn50xl9siPYW0>
X-ME-Received: <xmr:fY3EYisvby9_uEM1iai4ogAYVwQtGCyvaWgEX2c3CT0PnS44aixvvobY-ETw4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpedvgffhgfekheehgeeguedvfeethfeifeelfffgueevudeuiefgffffvd
 ejveefleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:fo3EYnYjPyH0zMyaa0xStfl_kV7gjLElsNYpndQJb2dzUdIIV5omRA>
 <xmx:fo3EYpbhySKK8dbwtV6IE3jywqAKxH8JjZPa6KqksvBQDNhXBC4F4Q>
 <xmx:fo3EYjBt0Ls1hjtqbZajBRtg9Tawy1kAP-BRE5GgYE0RNnkjPlZilw>
 <xmx:fo3EYuP50bvioe38i6VT-94OFszTIH41SWeD5BLfs5P0PrwhnlX4Pg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:05 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] hw/i2c/pca954x: Add method to get channels
Date: Tue,  5 Jul 2022 12:13:52 -0700
Message-Id: <20220705191400.41632-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: akJLhE1RLXTl

I added this helper in the Aspeed machine file a while ago to help
initialize fuji-bmc i2c devices. This moves it to the official pca954x
file so that other files can use it.

This does something very similar to pca954x_i2c_get_bus, but I think
this is useful when you have a very complicated dts with a lot of
switches, like the fuji dts.

This convenience method lets you write code that produces a flat array
of I2C buses that matches the naming in the dts. After that you can just
add individual sensors using the flat array of I2C buses.

See fuji_bmc_i2c_init to understand this point further.

The fuji dts is here for reference:

https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c                  | 29 +++++++++--------------------
 hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
 include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6fe9b13548..bee8a748ec 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 15, 0x60);
 }
 
-static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
-                                 I2CBus **channels)
-{
-    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
-    for (int i = 0; i < 8; i++) {
-        channels[i] = pca954x_i2c_get_bus(mux, i);
-    }
-}
-
 #define TYPE_LM75 TYPE_TMP105
 #define TYPE_TMP75 TYPE_TMP105
 #define TYPE_TMP422 "tmp422"
@@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     for (int i = 0; i < 16; i++) {
         i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
     }
-    I2CBus *i2c180 = i2c[2];
-    I2CBus *i2c480 = i2c[8];
-    I2CBus *i2c600 = i2c[11];
 
-    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
-    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
+    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
+    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
     /* NOTE: The device tree skips [32, 40) in the alias numbering */
-    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
-    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
-    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
-    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
-    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
+    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
+    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
+    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
+    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
+    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
     for (int i = 0; i < 8; i++) {
-        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
+        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
+                                 &i2c[80 + i * 8]);
     }
 
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 3945de795c..6b07804546 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
     return pca954x->bus[channel];
 }
 
+void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
+                              const char *type_name, I2CBus **channels)
+{
+    I2CSlave *mux = i2c_slave_create_simple(bus, type_name, address);
+    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
+    Pca954xState *pca954x = PCA954X(mux);
+
+    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
+}
+
 static void pca9546_class_init(ObjectClass *klass, void *data)
 {
     Pca954xClass *s = PCA954X_CLASS(klass);
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
index 3dd25ec983..3a676a30a9 100644
--- a/include/hw/i2c/i2c_mux_pca954x.h
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -16,4 +16,17 @@
  */
 I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
 
+/**
+ * Creates an i2c mux and retrieves all of the channels associated with it.
+ *
+ * @bus: the i2c bus where the i2c mux resides.
+ * @address: the address of the i2c mux on the aforementioned i2c bus.
+ * @type_name: name of the i2c mux type to create.
+ * @channels: an output parameter specifying where to return the channels.
+ *
+ * Returns: None
+ */
+void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
+                              const char *type_name, I2CBus **channels);
+
 #endif
-- 
2.37.0

