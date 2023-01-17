Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp22204ejc;
        Tue, 17 Jan 2023 15:25:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtpohnjYHWLvhUxWowIK7LKTXuet5NXqYLtYqZbBv28VX8BCWOg0JZRUdZ0pm7DkUcgS9Kg
X-Received: by 2002:a05:6214:5cc6:b0:535:2539:f6f5 with SMTP id lk6-20020a0562145cc600b005352539f6f5mr7010910qvb.19.1673997919576;
        Tue, 17 Jan 2023 15:25:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673997919; cv=none;
        d=google.com; s=arc-20160816;
        b=Q5V5NA+oGm4dKQ5tPbU+oCbhA0WMcI66WIJ8sOrbAoY2bXGm43msqTYYZsGhp7Gcow
         QE+BzFue74fsL9Ta784Wjj8dg/fk39f8zHJTy0QR3JlLu2RMZlpR2jdS9TT8uUv4Sb/f
         5K3QMKdTCGk36uWNuXtZ9a2sd2Q9kUKx4dq6UsZaFtQNvz/x11E07v+xyTkOkN64PWIP
         Q+m4I14u4Jgai8PahXIG5aYRwOaaSdlvDg71qzPW4PLTQkO13gDLoUixBZdHp4kf5G3K
         PrVZ/kbBFJW+xsHS+qdkT/977BxiDSW9kk4TDVt5mMYnYOb+gBiw+AB7YVhrlj22ndRy
         mt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=AQu6hUbwSrQutX6WZr/gHksgRunJPr0x30p8bvlE/3k=;
        b=dkCNHKThAMy87E7XF/My5xT0o5+czt4sZenvVxlBTnO65HmUhRy6Z5P3dx/3OSkI05
         RIPhVcU0U4V8zOXf6psmt8JWSgackx7/k1POK6Ay8UKF0JkNrwWDK/CVTGzpnJTSGlLM
         z/Dx6mKsSIzTg4fcXEJFPYIhs06aRqyhr8q9aYD6dpZuybyvbK97VR9Eywg+hwUObNu9
         oXWg7bJHTbaeHjuXjduPb+CzIaThpw2j1Sh3oqhWtJKcxD2mCTl2yoJFrBIncKOWfF/b
         drgH5A55g+LOc5e5/RkjkPavmpLViZ6LjItvJTPhbyBh8vHvbezDL1pSL0xmrDelO1ad
         GeRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=OJOHCroE;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=q2K66kMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf7-20020a0562142a4700b005322e153cf8si5698772qvb.94.2023.01.17.15.25.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 15:25:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=OJOHCroE;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=q2K66kMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHvK0-00021G-4a; Tue, 17 Jan 2023 18:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJy-0001zy-Mt; Tue, 17 Jan 2023 18:24:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJr-0003Jx-Pd; Tue, 17 Jan 2023 18:24:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F3975C0151;
 Tue, 17 Jan 2023 18:24:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 17 Jan 2023 18:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673997878; x=1674084278; bh=AQ
 u6hUbwSrQutX6WZr/gHksgRunJPr0x30p8bvlE/3k=; b=OJOHCroE65Fcxk7ho7
 sK/xmRczafhPQVN9L6GF0Kzf6Kxx4JU5jDXC40fBAE5LZeoPXyUAnrLLDeI0gQB6
 TgdRkSh+qUnjT1yk03QkIpAH31O9i52ilY2M9KI3d+qFKiRuLScNP9CujUUVKn6g
 +IganX9rnU71V8eKHhm8cG5hRMOtcCvXh+LrEpcw8hZ7Z2WGZoSQp+IyJ73SbhQI
 zjDPlcHhyqBB0Bf6aeGa+UCcBgLLtHfwtC/cICsM8ndy9hTrVcvrnGp+sFzk4A5D
 Ba5xWn/gC/A2rtr6qATC8fpMg5R2RIfzSGBxyKoA8swGK4ZEP2yIo4Pxi/FLl/RX
 FyWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673997878; x=1674084278; bh=AQu6hUbwSrQut
 X6WZr/gHksgRunJPr0x30p8bvlE/3k=; b=q2K66kMNUHY2VtIQuHiEVsfdMZ6UE
 BK7UeZaiiV8fOUJXSfu7SngvfrRFTx2hQoCUTpeku/4Qs7TntWwDRBW/GeRUIUhe
 DqH2W7BsiyHtIR0W11CaZtt0W5yTLBJw6Dit60T635Nls6UHuPLnNwGoF9peiE/u
 +JZAZTdICDQymawdNaSSro0RU9j5gkCbQmfTW68xDy9RlpkD11dWpTKrADV9k9z2
 GD58w/U0Qvox+O0uw7gdDW6eXSt6B78t4t+jv/S8rSsS1JsyAnic+EE826ooCx9Q
 tQ5WoJ1xPX4zoYussM+TBePuc8xXs+8RXr2hUN/VyaKeLox68b/P3JZ9A==
X-ME-Sender: <xms:Ni7HY9o6IUEifoW5dkIVb1al4uqNN6XRxQqpLHGuWCUxpkxzu162DQ>
 <xme:Ni7HY_oG9CrFUnov94PAUm0V6R3Dlz7Ddlhedur1XvjBHYzVFb3IoI_pX4-DzQuxw
 EFHeSmmj61pTZvoMLU>
X-ME-Received: <xmr:Ni7HY6PsA7q64IUXS-RU54IFfM-pr9hWWwvYGzG02QFETWcWCau0DN3NCQBmR0Yjjs6px6ItLWTFy26ooCZKce15PxxSwN_x_IdSKL-1Lps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:Ni7HY46fbX_zls56231X3UTDlKczxNFv0vknOgoaLtBpCednlsc89w>
 <xmx:Ni7HY85HMjbKY2_cp0bVuuAdILLNlIhcQnPSBVGFSDYWbc2_dUBNWw>
 <xmx:Ni7HYwhDupY22Mere8DYGjRhfeCFtJffGsHv6SDmDC2keQlGQMCzKg>
 <xmx:Ni7HY-tDY9Svcs9FqHMPh9hZ-IQRmDbEgJ2qlGo0RTx1OhrAwCJEkA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 18:24:36 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v3 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Date: Tue, 17 Jan 2023 15:24:25 -0800
Message-Id: <20230117232427.74496-4-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117232427.74496-1-peter@pjd.dev>
References: <20230117232427.74496-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: y91hfYHQ+Ey5

Allows users to specify binary data to initialize an EEPROM, allowing users to
emulate data programmed at manufacturing time.

- Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
- Added at24c_eeprom_init_rom helper function to initialize attributes
- If -drive property is provided, it overrides init_rom data

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
 include/hw/nvram/eeprom_at24c.h |  2 ++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 98857e3626b9..f8d751fa278d 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -50,6 +50,9 @@ struct EEPROMState {
     uint8_t *mem;
 
     BlockBackend *blk;
+
+    const uint8_t *init_rom;
+    uint32_t init_rom_size;
 };
 
 static
@@ -131,19 +134,38 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
 {
-    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
-    DeviceState *dev = DEVICE(i2c_dev);
+    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
+}
+
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size)
+{
+    EEPROMState *s;
+
+    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
+
+    qdev_prop_set_uint8(DEVICE(s), "address", address);
+    qdev_prop_set_uint32(DEVICE(s), "rom-size", rom_size);
 
-    qdev_prop_set_uint32(dev, "rom-size", rom_size);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+    /* TODO: Model init_rom with QOM properties. */
+    s->init_rom = init_rom;
+    s->init_rom_size = init_rom_size;
 
-    return i2c_dev;
+    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
+
+    return I2C_SLAVE(s);
 }
 
 static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
 {
     EEPROMState *ee = AT24C_EE(dev);
 
+    if (ee->init_rom_size > ee->rsize) {
+        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
+                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
+        return;
+    }
+
     if (ee->blk) {
         int64_t len = blk_getlength(ee->blk);
 
@@ -163,6 +185,7 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
+
 }
 
 static
@@ -176,6 +199,10 @@ void at24c_eeprom_reset(DeviceState *state)
 
     memset(ee->mem, 0, ee->rsize);
 
+    if (ee->init_rom) {
+        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
+    }
+
     if (ee->blk) {
         int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
 
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index 196db309d451..5c9149331144 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -19,5 +19,7 @@
  * @bus, and drop the reference to it (the device is realized).
  */
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size);
 
 #endif
-- 
2.39.0

