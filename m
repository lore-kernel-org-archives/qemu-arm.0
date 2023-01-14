Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp240590ejc;
        Sat, 14 Jan 2023 09:02:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXszltvH4Da8QeFERYGZ8/P8ztkOWSe7W3nxYFsOS7PsYqhOfH7xJXAPZ6EmoA7sTK0kGySz
X-Received: by 2002:a1f:e3c7:0:b0:3d3:5124:a6df with SMTP id a190-20020a1fe3c7000000b003d35124a6dfmr36759822vkh.9.1673715768214;
        Sat, 14 Jan 2023 09:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673715768; cv=none;
        d=google.com; s=arc-20160816;
        b=XACzqvn8s3rXWpB/v/PFPemHzCX4hpCrQ5nt8mnhVe2P2pbG89uctNPwgoYIOSD/D+
         jWp/1eocwjDTHK+pxbwNkSpdBjhOVIn8uig4iUAOUjDxFOlM7hGwZNS0NX9f8IDRr6no
         TA2PTu+iMD1wu++syBiC+Wz1b0H+nxOR7/gl8OCa793KkqpVlVxwL6Uw8NVy1fnbfgd2
         DsxYypKwG2KMUuwTzkQJ29jbEPFPr7/bQ8C1HgivXzQ+A/emxCPBCJW2YkWnupgFbEhD
         /bh/5Js8n357O202GMh/5WPUgNi5ohqlC7vh99DzksUY4TIr5STeN6wP99Y4Dr8XkNob
         /G9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=EbYaZrkbCWYeOIXGtBNnoWtWbkun5h7rBW5SJQIkYfk=;
        b=ma6YtoSwIC8+om9+uu1LRKPfhWrVh4oWoj86abeEy26Qzu+ocw5JaEKP8XUDSb4o4l
         9h4BjJGGBnuw9MbO6iDVCxNuCD2v7BZRqqv1Qz/QAw90JDIOUhr/dEcc9v8A34fYppzF
         M/GHwt2JDPY4iznACvgdA2oF90U+A2zy8tD8JtSnzGvXCXrKLrkEgTJ7VS7/9fd8gwcu
         rVKQ9sy+mywp98dEBRxo9R0nywn/xQHuqP82W08XtYBOww+qtSqpLWOcjLzFE6wkBh/V
         BrSzWzMiLipftb5OwIJKtQ2qOLHj601GIVjQT3rYtdRcLUgc7vzRLI17rgBvqU3zhEU3
         1ldQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=GOKYkAXO;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=KhLdVZtY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m76-20020a1fa34f000000b003b7d189cf55si6596434vke.180.2023.01.14.09.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Jan 2023 09:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=GOKYkAXO;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=KhLdVZtY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjv6-0005Xk-VK; Sat, 14 Jan 2023 12:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjut-0005Er-7v; Sat, 14 Jan 2023 12:02:04 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjuq-0005Q7-Le; Sat, 14 Jan 2023 12:02:02 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 460C65C00A6;
 Sat, 14 Jan 2023 12:01:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 14 Jan 2023 12:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673715718; x=1673802118; bh=Eb
 YaZrkbCWYeOIXGtBNnoWtWbkun5h7rBW5SJQIkYfk=; b=GOKYkAXOAwE8Fm3wPw
 3j3axAITXUlnWsZj62M1d+E27w6J+u/B8aBS8O7OceG3mTN83pc4rKf5ehgwxRDG
 Dit/sfpzImSk82/iUXdTneHh0voErXFrxKVXC3cKxgjk8XcDJp7hbOoUvAd19aSk
 L0JtPaX5Le3tGVIAL2pMude7PO2Mg/4Ku/cFtcEiotRi8ScN91rEfPefJ8tzcjyn
 iZ+C2jT3+Ko7QExWXVdxDf4raOwBnq4dsDPZobt86O6Pd+i0Chxv84+1ksRo+Lgk
 tXF1f6Sr4o1XaWnnhjJXPdF2pgi6zEp9A3IK/aEcDQlVJmiSmgTyQvhZX1tQnozi
 N4Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673715718; x=1673802118; bh=EbYaZrkbCWYeO
 IXGtBNnoWtWbkun5h7rBW5SJQIkYfk=; b=KhLdVZtYTA40SzbezYT0mKUBeXCuA
 LpTS1ycYXxHBrv35y/CFOhV8uhmADau+2DqfBdF0fZ08rjK3AnMQbvO9R05mFmIR
 NXz+cThGGB2LP+7VKMdKBzvlfC0Ug3voYdb83oCFtoXXdXR/bZjycOBakQYZA5B4
 2qFPSFZU44y+Roy4ouNlGAHayeNmSv6HdDSrmX+hsKRe26aqnFDZnLg0AJPT9Otp
 PTpEuVj+ykiSiE79Z1j1b1exRYnNXOCkuxGTOKoepAljP1vDEu8LteIaY6Cqs67b
 b59Mm8CqFILg6yLFu+kiY1gbTgtNaV+SYV5GQQSAICYn6SUarsKrZ5JbA==
X-ME-Sender: <xms:BeDCY1MUbdLVf7yAjKW_XyLA9-M2SRYzGKdXumqNiNsvAUac3eM7BA>
 <xme:BeDCY39VLpe52ibLTsuDQ9acAAmcckPcWJj1_kTe5RxhMucS1ODjPaaH7QyeuCBy7
 EPEA81EnCdfhY77mZ4>
X-ME-Received: <xmr:BeDCY0TZ_uleBWZMnVMkUapKJ3K-Y7tzFs1y2Mh1rCLntWfxAa1oEU8t7p4BoeGEZ-3Km_tC9dfNPsN9AuFgHUpcXvf1YFr42GMXK0O_LKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieek
 vdelteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:BeDCYxsGSSCuc1UyAdW9d64NhvDSfXDgXwikbkWk5YhVtsmtsPUKBw>
 <xmx:BeDCY9efu6EPyRWy10QNVJFSSLDVbzMmAe30jQaK_4bkAg7jB5ivyA>
 <xmx:BeDCY93UmLue6fE-Nz0L-i8noNG4XUmcu8Uy5EbAeh2mu4KYcIkM8Q>
 <xmx:BuDCY8ya5pFQQSebwwAfe60mIyBHv7rlRYUvJ1wMmGRc_5_uv_Izqw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:01:56 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: patrick@stwcx.xyz, peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/nvram/eeprom_at24c: Add header w/ init helper
Date: Sat, 14 Jan 2023 09:01:46 -0800
Message-Id: <20230114170151.87833-2-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114170151.87833-1-peter@pjd.dev>
References: <20230114170151.87833-1-peter@pjd.dev>
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
X-TUID: Y3wAx6OMbZkU

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c         | 10 ++++++++++
 include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/hw/nvram/eeprom_at24c.h

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 2d4d8b952f38..0c27eae2b354 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -12,6 +12,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "hw/i2c/i2c.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sysemu/block-backend.h"
@@ -128,6 +129,15 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
     return 0;
 }
 
+void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
+{
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", address);
+    DeviceState *dev = DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rom_size);
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+}
+
 static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
 {
     EEPROMState *ee = AT24C_EE(dev);
diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
new file mode 100644
index 000000000000..9d9cf212757c
--- /dev/null
+++ b/include/hw/nvram/eeprom_at24c.h
@@ -0,0 +1,10 @@
+/* Copyright (c) Meta Platforms, Inc. and affiliates. */
+
+#ifndef EEPROM_AT24C_H
+#define EEPROM_AT24C_H
+
+#include "hw/i2c/i2c.h"
+
+void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
+
+#endif
-- 
2.39.0

