Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp135367ejc;
        Tue, 17 Jan 2023 18:43:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvvJqgJijouj/4ompr83WH1T5X7ngpUj3o8XbF+2ac0MARMze8nr6XeqBsJG0n/lDw05oY/
X-Received: by 2002:ac8:4a03:0:b0:3b6:3c95:7352 with SMTP id x3-20020ac84a03000000b003b63c957352mr6556064qtq.13.1674009822112;
        Tue, 17 Jan 2023 18:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674009822; cv=none;
        d=google.com; s=arc-20160816;
        b=Ora3BUR98uI9/BeZrCKYXTfFLhxZq2KXRW+tCbQ2Ufk3Y7odI0NNb8QYeNfCrr7jJN
         5SqQvoOhZh84IGO/J2kwGU6ieRfqpwzGlROnlX7EsFMhdmixQeBExT44tVi1HGxWcgnv
         aEz8UbKvONTZZFnGnmq9D3b5WUG6Zm9qY9lSdw7x9P84ZJUqZQ8TZTI7bsHriatJ1ulN
         m7MBBayKRB65Fqd29fq4YUs8ZLVGbzCAx3Axoq+fVo5oIYFv+HRaSfXt/bbSAvg4qXGe
         ttKebN3X1bGZJZ0Z73F3/rY1FLGxQInehV9H7EWpEnGcFBsHw3Xhk7AFNf/0ldQllxHV
         /9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=V8MxqXvBtv6gjCtHzwIxy0r9m1Is5M4oNLKG6RTErL4=;
        b=dbcrJTNWWcE/+9Q+vkQzGBlQNwhUiD+fbhdrfOKd2utGtsjgW+pmzUhXpXPYIxLD3L
         MSWjM6EXvZWbB+oFXzp2Hwc6S4l7eH67LozDhR0ndPDl1VhTSZ/mUrQ9DernmDCnQX8F
         Zzy8npYJ5VzRG3PKb7oylGOFaRDl7tAW8wSUM8byThV3Z5r/Ihkd67cQ6pBTVITuV+nU
         Cvi6kIEF4p8B5fD/I6N6eBbwhdKAD8LQeFH+JRl+mNjxnhDwHh0+fDRRnf+BiypxtI/5
         t/NtovbnyKi4p1jD7rBPpb0/7lA5r4YUFqI1eTkqT+w0geAP5PAsGG4D0/QVzhlglHTX
         II/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=vfqJtb8j;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=KyTLQW8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc12-20020a05622a59cc00b003b634f3ac17si3440916qtb.550.2023.01.17.18.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 18:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=vfqJtb8j;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=KyTLQW8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHyPH-0005W7-Fx; Tue, 17 Jan 2023 21:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyPD-0005TY-45; Tue, 17 Jan 2023 21:42:27 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyPA-0006qH-Q5; Tue, 17 Jan 2023 21:42:26 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DC2265C00FB;
 Tue, 17 Jan 2023 21:42:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 21:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1674009743; x=1674096143; bh=V8
 MxqXvBtv6gjCtHzwIxy0r9m1Is5M4oNLKG6RTErL4=; b=vfqJtb8jgtJAQ6Gdlo
 VkkZdoEvNPk7CThc1xtVTW6z6PW3T9/49fo21GvEzZH1Lrf3kKH0qfQH1sXF1WZ5
 A0/V7YyIrSqOkpMmUBcnl6xJM19Gj1U59Gd+avzU8NxQuQZ0zFpa0NwMnARs2Kyv
 jU5mEd2/8qAG/koTeZ+pcH3r/y0dZZR8caBxExuNQHywBUjNzGwJ0yHG0szaDkOn
 q7xYV7AuMVeD9Ipy+rfFriXgHnj1yDu8pLmVOSHrnZS2dBUykpWsee30ktebRF9g
 eq3k6TJCqA+R4XA4W9DW1/r+ptJTsidvf37eANTD0C2hvjWjv98H4SxKAk5WgBRZ
 jZYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674009743; x=1674096143; bh=V8MxqXvBtv6gj
 CtHzwIxy0r9m1Is5M4oNLKG6RTErL4=; b=KyTLQW8dSnLwO3Z60zGF3VNKRbJ3T
 meuKUVzXtqDNkpnH8kDtTLB7p9HuapXs4KYOYUms1XyGRxZrFw11e7dMOgQnx8hi
 oFUm/zujs91P1w1G5y7aGPa/akbD0VUMjtB1RAY/SpsIBsFeo/2Wc8y9Urz1uj4v
 u6UReUJGdjx82JpVDz/IFYjxYsmc0CenX237qUdtiGkSlqgyuvCTCEe+AryYapi9
 jXPHK6b0/xm9n5dk57P5dBKCB7epVdo8ePus5/WYU/jl+X51/qfJ1FWFY78bX+Y5
 +vrrmFQBWbkkmkARjr26BgfIPPWQ6Z4at/Cy59vJlhXZn2vFpPIZdKrzg==
X-ME-Sender: <xms:j1zHY8J9BQraIORPcJO3GZ9tqhHcfWZEwr6WO1lkXUjv3FTvIkBbyw>
 <xme:j1zHY8LzIKa74Vn6RDEgZWgtcLjrql2K1aOx7rtexd-9hzSCXcm1uRefys40c-3gS
 jLSWnO7C9w6UCB_Pnc>
X-ME-Received: <xmr:j1zHY8ttQEGYXLXhLdbXAOJvLgwkT9XqfnAR6sevjJHXgoUFMFjcW23ErWmgovwbk6SSHhzRi9GQDURD3B6bGHQtod3OMJALCIlJv5eMyok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:j1zHY5aNGjHsXR29vk3zYcyrZGV8z2Q9iS39Nc399kOzAVhrhmA3Nw>
 <xmx:j1zHYzbRDpqZNVssYK8h26N_1j3IGFOPBOysXDUbQimQMzAPkYvXAA>
 <xmx:j1zHY1A09BqHHqjMdBIqglC3hwP7PRxMAWzR1CZzmN4CQ0wromlz6Q>
 <xmx:j1zHYxNf4ilkTvKbyXx8vlftQalQjUHUO1E8jemguB1d0orLzw71FQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 21:42:22 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Date: Tue, 17 Jan 2023 18:42:12 -0800
Message-Id: <20230118024214.14413-4-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118024214.14413-1-peter@pjd.dev>
References: <20230118024214.14413-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
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
X-TUID: EM8Ri8FjPJ0Q

Allows users to specify binary data to initialize an EEPROM, allowing users to
emulate data programmed at manufacturing time.

- Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
- Added at24c_eeprom_init_rom helper function to initialize attributes
- If -drive property is provided, it overrides init_rom data

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
 include/hw/nvram/eeprom_at24c.h | 16 ++++++++++++++
 2 files changed, 48 insertions(+), 5 deletions(-)

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
index 196db309d451..acb9857b2add 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -20,4 +20,20 @@
  */
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
 
+
+/*
+ * Create and realize an AT24C EEPROM device on the heap with initial data.
+ * @bus: I2C bus to put it on
+ * @address: I2C address of the EEPROM slave when put on a bus
+ * @rom_size: size of the EEPROM
+ * @init_rom: Array of bytes to initialize EEPROM memory with
+ * @init_rom_size: Size of @init_rom, must be less than or equal to @rom_size
+ *
+ * Create the device state structure, initialize it, put it on the specified
+ * @bus, and drop the reference to it (the device is realized). Copies the data
+ * from @init_rom to the beginning of the EEPROM memory buffer.
+ */
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size);
+
 #endif
-- 
2.39.0

