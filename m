Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52358C53219
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:52:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6Zz-00034l-Mu; Wed, 29 Jul 2026 11:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Zu-00034D-Uh
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:52:19 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Zt-0003kt-Gy
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:52:18 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so10086705e9.2
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785340335; x=1785945135;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=S23pR2ZvsSLYFR0+0DeQ83TbuXFd8+C0obNCg2DOLig=;
 b=MX7gSfThsg/pnoAFCpysXe4yCtmEwbk8ffne00HJTMXbS+hW6Exxd4LRW6axgxAWrp
 p9ixepuV2ZWsn3W67mShI7+S6FDmjvBYG+j96/o39v3qNtA8yKT/2PexArU1MuFdVP3N
 liNXTsGnAx5jpD80Sga96DW7kqVM3yr691mYyDcdKLVkOaTe7OVuu2Leh0Ho5uVrleqL
 AuhW3ul38wTMAZT+M64vh7YAbLykTN5LSt+hvoFtQWfZ7me73T7onI+VODhH4W06/JYf
 8saXMXWenW79GNUftstc9TkmTtm1AAUW2G3jpF8Y9SyGcj+1G69QYkWvyOrZ7Mzq4Ao3
 PUWg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpL5PAlbj6MFIAuOrUCEEBTMo5TmMgEDvWXsjNk1atcSNjpcenCeIg90A6sjcLPQwY55GZm1XCvbw==@nongnu.org
X-Gm-Message-State: AOJu0Ywtk7pSSEyZrQfl2jzR/N6KTo455RD/0bmRqiUvcrlworM/uwAZ
 kcRP6a9veAxc3/7/OHG90AsraCJUiY5Lv6yH6YCUz1QjJLWaTMIL7PwX
X-Gm-Gg: AR+sD12pd4xlNUE5Hfk1Xn75qbW0/61ycMGRru0Mx9yJtrn43+qMHdl7zEJxvHrMNsX
 2oa1uAfzN98X9tUFOq0O+hcnYV7/l5E3fMjSgGkc5Pjbil3cC+bq5rLpBbaa3q7lLbPPl2Rj45e
 DBeJ0zf/ApRj7jWfvOUvKRHZifx90N0NWdtvaIqBID2M9azmHwLB0r+pz8M4yxo0a8U8uKx5vu8
 agIYzo8rryQhhktgQKMZQrjG9SWaMaAHf1lQAGGyErbF3RCWmqL3QP3OOF4qtWpTcYjbgOmUhT6
 o4K1m2ulu9tFs24AGZN3RLzjyR0HKD6Mf/yPbSNbE1KOLEWYsdhytwZS59euJtPfGeR3hQQgkEV
 pFYPfrC9SriUzxx65iAj/vUaPaXmA2mBpWm8YnPL+WfHgOkE29l7MUTiAHgaacTb62GXbMuTe1D
 vevoKZZT/2PzVSEPWYn7qymO9abKorftXkMWQe9RgucY1ok4IaMnf3FDHIfQKvXLuPRbYbojQm8
 4xa5gfZSKsiUWKXC95MqYpCjEt6waDzODW8
X-Received: by 2002:a05:600c:37c9:b0:495:5062:17f9 with SMTP id
 5b1f17b1804b1-496c6586ef5mr82687305e9.30.1785340334609; 
 Wed, 29 Jul 2026 08:52:14 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6abc703sm9232200f8f.9.2026.07.29.08.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:52:14 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:13:00 +0200
Subject: [PATCH 24/25] hw/arm: catalina: drive pca9554 io expander input
 pins externally
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-24-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337965; l=1675;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=EtxfxNQ4ajDXh5xrjgZPSfhgjy+Z8hKW5J2/81txDi0=;
 b=rMYVawj86TmRdA0ZIqeU6Z7QP5vJDeB+O4/UTS57BG0oWEM0HD+J4VbxBfuUdzBnPGrCnZPwi
 ZXM6tiNJQltAPqBOviArDenJybTyKeu4hoeENAHh4HHDK8asFxYIuHo
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f42.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Create io_expander5 (pca9554@27) with hw-dir=true so its pin%d QOM
properties drive the external input level of each pin, matching the
pca9555 expanders, instead of the legacy behaviour that forces the pin
to an output. This lets external agents, including tests, stimulate the
input pins and have the guest read them back.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_catalina.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_catalina.c b/hw/arm/aspeed_ast2600_catalina.c
index 928e140b21..69e072c932 100644
--- a/hw/arm/aspeed_ast2600_catalina.c
+++ b/hw/arm/aspeed_ast2600_catalina.c
@@ -545,9 +545,16 @@ static void catalina_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), TYPE_TMP75, 0x4f);
 
     /* i2c1mux0ch6 */
-    /* io_expander5 - pca9554@27 */
-    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6),
-                            TYPE_PCA9554, 0x27);
+    /* io_expander5 - pca9554@27 (external agents drive its input pins) */
+    {
+        I2CBus *bus = pca954x_i2c_get_bus(i2c_mux, 6);
+        I2CSlave *ioexp = i2c_slave_new(TYPE_PCA9554, 0x27);
+
+        object_property_add_child(OBJECT(bus), "0x27", OBJECT(ioexp));
+        object_property_set_bool(OBJECT(ioexp), "hw-dir", true,
+                                 &error_abort);
+        i2c_slave_realize_and_unref(ioexp, bus, &error_abort);
+    }
     /* io_expander6 - pca9555@25 */
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6),
                             TYPE_PCA9555, 0x25);

-- 
2.50.1


