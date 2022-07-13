Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp75151lfp;
        Wed, 13 Jul 2022 01:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uohs/A7DCXKxD6Okd7aS2O0azvQ9yRV8D26qfuazpkJfOiDYMefO89aQ/vwLvi3V7MBfbK
X-Received: by 2002:a05:622a:148c:b0:31e:c2bd:9345 with SMTP id t12-20020a05622a148c00b0031ec2bd9345mr1660522qtx.607.1657700037816;
        Wed, 13 Jul 2022 01:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657700037; cv=none;
        d=google.com; s=arc-20160816;
        b=fBnAmEc5BgnZO1geWdp0T5WquF+5mTpAvPyPNNxU/93Xuf0uEllRcXx3mWWoZxqyuE
         u8iKs0/murZsEPRSLhXxDUcebRxGwNdWoP8SjFy4qBrVONdJupBkY+xmmkqCnHIpDT6s
         ZD/l55bA9HVIY1BsMNm2PPpSvKbIQCi2wBO2Kciw4QtIFApKWT39t3r45rYpbCj/z8HI
         eHVpSza0twXDw80c+rGFtc8tFFH+/N8b0ypJ6vR2A5ml9XhkAFeNT5SSrTZwQbmHp8co
         7s/35xGY0CqTDQ2TLGhmblH2kEL536ZSuiFEfHmXRwmc2Ra03FOtu9nqjsy/RpEv7Fq0
         oq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=7pJL5yOPgezv2qCipjwTiqcIS5lbr7yq/pz8CI6v6CQ=;
        b=wehtgbSToX/zgV08ec2J1ZnJTrVFEFVnQD4mLYRcZG4KlpTlmjVOCTfcIvOYA03cs+
         OH59XBLnrQNHPJkzlVrAzvE+ce9VQUg5vxl0fPirWMZL2Zi43Afh6GToyPygvmcK4g9/
         lRzFGYcgVWM6NP16X9SEU/iHxarxmNxQQYgp4Lyn+1ArRXbyx+rySCa+xnr4W/2HLkeR
         vrU8BlWZjdfV7V9P7UTg6Ta2bUz4y38yk4tEM4VoOPyUi+V9BKw4OyISz7UAIXefhi3+
         p1e/hjwbgzLCwRQxzmOAE7s5Ze/DVaMw5NVMSWw0hqxYtyfieZ9PQfm5XAtfv8poe4xW
         pf2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020ac84241000000b00304e9e13f91si5778815qtm.279.2022.07.13.01.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 01:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXVN-0000Qd-Aj
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 04:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXCN-0000Td-Bn; Wed, 13 Jul 2022 03:54:21 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:33587
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXCK-0002d0-V6; Wed, 13 Jul 2022 03:54:19 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHl6Cdbz4ySl;
 Wed, 13 Jul 2022 17:53:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHj5j1jz4ySW;
 Wed, 13 Jul 2022 17:53:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 19/19] aspeed: Add fby35-bmc slot GPIO's
Date: Wed, 13 Jul 2022 09:52:55 +0200
Message-Id: <20220713075255.2248923-20-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: I0BegDqNiprh

From: Peter Delevoryas <peter@pjd.dev>

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220712023219.41065-4-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b4355ee26a45..83150a19ea6d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1358,11 +1358,23 @@ static void fby35_reset(MachineState *state)
 
     qemu_devices_reset();
 
-    /* Board ID */
+    /* Board ID: 7 (Class-1, 4 slots) */
     object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
+
+    /* Slot presence pins, inverse polarity. (False means present) */
+    object_property_set_bool(OBJECT(gpio), "gpioH4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH5", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH6", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH7", true, &error_fatal);
+
+    /* Slot 12v power pins, normal polarity. (True means powered-on) */
+    object_property_set_bool(OBJECT(gpio), "gpioB2", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
 }
 
 static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
-- 
2.35.3

