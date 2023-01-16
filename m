Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1839704ejc;
        Mon, 16 Jan 2023 15:57:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMgARHGR8+qiIXa69P82xyRkzO+dFck3sTSi+nf2aL1F2Rvyz4Wu1vNVdtJzAAue14BEwx
X-Received: by 2002:ac8:70d1:0:b0:3b6:3b60:e6 with SMTP id g17-20020ac870d1000000b003b63b6000e6mr1160434qtp.62.1673913457236;
        Mon, 16 Jan 2023 15:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673913457; cv=none;
        d=google.com; s=arc-20160816;
        b=VNVb8R3BrToNWXcmCBg+VNFLMp05CiHK/nD4EUO5yNuoNc1c1Wtws2fSYVLqXCaLBP
         lA/c7KE7+wEQDiu/PFNIdSxXAArsDyrX60OgO85d2Dhg6iINoQrU54YKWn9MbkYCpCJ3
         7336VoL3fK63tpE81Yvuey7C6tWXVaYGD4v8XuN7G9V2tNjSE1VjF2j1UWggblhcw8Cu
         LOO6O8yEBvEDzdhepEtlK75yDrcBOKuEpoB63iWrDXI0dOFaQWlkKrtlLHM+BPkko7bZ
         w/5yofrZMouTg95d8MsoljWcqGZbsJQTbv0dCCYaKc2MXXmF46EJ7Oe7dj30uFGnDI8e
         +mNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=Yg87V+uFvIXEOuCwR+81glmyot4C0Ue7T6KLQQ4e77o=;
        b=HXhySTc/1vTmwjoxa1B63/NedNMlhewRsexZnRdU1fF40nNMjvrQCehM0VSCmhsEv5
         SAJx64wn5uqVQpj/KUrsxJOtjgTaQLC07CJbMKo4js5QkElF+qhCikjZYiCyfTdkki6U
         8nnxjhipqpRXrz1jJaBq23A+l9JYVS6GEedx1Z7YWG+JYUGxzwYQHCzwAGk5Rjn5scUU
         a4oXCwKmXt4+qefuTcOkSglqzi6s67n98KWQ0Fcj7aXK6d5bZB6EfpZcthsuNRILpLxe
         dCCa7sGRW2VK9APjBqEVPOje25sDm13eziph+DXt5dGHcmhWzKGPQ+LbeAuBe6Knw5Nj
         kT/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b="y/4BYlnu";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=QyOej0il;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020ac81188000000b003b62e24d23fsi2625092qtj.651.2023.01.16.15.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 15:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b="y/4BYlnu";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=QyOej0il;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHZKv-0002oA-Mm; Mon, 16 Jan 2023 18:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKu-0002nu-Fw; Mon, 16 Jan 2023 18:56:20 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKs-0003nS-R0; Mon, 16 Jan 2023 18:56:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AF43B320093A;
 Mon, 16 Jan 2023 18:56:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 16 Jan 2023 18:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673913376; x=1673999776; bh=Yg
 87V+uFvIXEOuCwR+81glmyot4C0Ue7T6KLQQ4e77o=; b=y/4BYlnuw8cDVm2azS
 s0W/eip7q1MYvEKT3Fl2w80QXc0wBE6VIv0iSIi90MOKPllDyVCIg4p9G/jajK8L
 dCbx80wynBnQJdJ0HVFrOZZzmZBLnsOlxBee3tgJizJ0sNU+Tsl0BrnWzY+Wzp20
 XFIkmttV9hDl3MeNc3PEyojXO5UU/qpWwI4uLQQaqvpL4+RIVMEEjxbM2uy6Z+Iq
 N2Hz6j0eWcFLUGinjnlX6J7R3nvLY+BCTxzIURmUX91+GZIeu5GsLjmnVv5dEMFa
 IFQJNrq9MFrk6bhzWnSpC71iFlcDvzkhq125ASJmce7AVMZnIq9ApfUepGymHL9g
 c4Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673913376; x=1673999776; bh=Yg87V+uFvIXEO
 uCwR+81glmyot4C0Ue7T6KLQQ4e77o=; b=QyOej0il1OPFz///c7z3Bl9gyPom4
 /vC6PMu01qj3Ef9hxaoo4XiGmr5LzvUz3j2EpQXnFo61C/VRW7aMuBRVXIJnaxSk
 SKGIwDGlQsfJlspyHu6mo/5rjPqQavMIoyiSbReUTiiOcqx2Cw7WlhavxUNYxm4H
 QnjAJ8xT7kiObxk0q7z/BoY9/33rYokZMn79jgpbCQFlzSj1lOmje9oMi3xHteC/
 jxNXQ+5V8STqGsBi2pHR1j190e6FUIyuFLzjwLFTfKsn+sm0HC8uzh7H5/zJ+t+v
 RSpoaBGH25k55K0SAxNWRUWLlUhY923YizWN8iWW8UKN6Vm8bLIS2YUgQ==
X-ME-Sender: <xms:H-TFY5NYKZzbNjpnfkM59pA-vii5oXhHvK8VjMHCgEhHK3lyj6U2ZA>
 <xme:H-TFY7_kqAyFLJFuG0ZiE7JdHBR45nVjfa1LxsyxsL7brRdYyFqqPls1IfsUutJB6
 dzRjNZ4W3EvdDEpDFk>
X-ME-Received: <xmr:H-TFY4RX4ZowzFUkDoOxrpr-wP9aRzPgfJYRMSKen5RpkZqPHaolXzDLFEWmyjZRAER8K_VrHVjcNxgz4PgrU5qcCxpzHEMh0PlOiVPhPOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:IOTFY1tHJtGh7thtM9X0SMZa6plGsFCAQuRoBWCiYqszVOOrvDaZ9A>
 <xmx:IOTFYxfoj1894Du0MfsgM43ioVwQ-r8dAUeTnKh__w_lOPuh824v-Q>
 <xmx:IOTFYx0Y5WJyEx9jbkebMMkbNBaVKClPWnpmutEqMCfRXsthb8kksw>
 <xmx:IOTFY7scocGJeYI0QR9ku1__kZAMt8PHiQQFcpizese74TRhaL1bEw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 18:56:14 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Date: Mon, 16 Jan 2023 15:56:02 -0800
Message-Id: <20230116235604.55099-4-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116235604.55099-1-peter@pjd.dev>
References: <20230116235604.55099-1-peter@pjd.dev>
MIME-Version: 1.0
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
X-TUID: kClqbdOc2v8A

Allows users to specify binary data to initialize an EEPROM, allowing users to
emulate data programmed at manufacturing time.

- Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
- Added at24c_eeprom_init_rom helper function to initialize attributes

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
 include/hw/nvram/eeprom_at24c.h |  2 ++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 98857e3626b9..bb9ee75864fe 100644
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
@@ -131,13 +134,26 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 
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
@@ -162,7 +178,14 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (ee->init_rom_size > ee->rsize) {
+        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
+                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
+        return;
+    }
+
     ee->mem = g_malloc0(ee->rsize);
+
 }
 
 static
@@ -185,6 +208,10 @@ void at24c_eeprom_reset(DeviceState *state)
         }
         DPRINTK("Reset read backing file\n");
     }
+
+    if (ee->init_rom) {
+        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
+    }
 }
 
 static Property at24c_eeprom_props[] = {
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
index 79a36b53ca87..e490826ab1d0 100644
--- a/include/hw/nvram/eeprom_at24c.h
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -6,5 +6,7 @@
 #include "hw/i2c/i2c.h"
 
 I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
+                                const uint8_t *init_rom, uint32_t init_rom_size);
 
 #endif
-- 
2.39.0

