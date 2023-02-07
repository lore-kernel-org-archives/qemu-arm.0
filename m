Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5181929ejb;
        Tue, 7 Feb 2023 02:09:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+frQqIHBojsJeuEO6ifXDqOfyPOnymiwAwCOMfD+OziYQe8FWeIQUXjfdp27FUi+3P0PJ2
X-Received: by 2002:a05:6214:21ad:b0:56b:f7fa:4591 with SMTP id t13-20020a05621421ad00b0056bf7fa4591mr3390633qvc.29.1675764580048;
        Tue, 07 Feb 2023 02:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764580; cv=none;
        d=google.com; s=arc-20160816;
        b=AEEyg51Lmgq0vMwsZiitDYnrgJ+OVj+H1lZp8vpaVxDTT0BZ1CyJytOotBB9aaBgqN
         jtBlS3amJXuBvml7qCRePCOoqzoT0HTiFmIQ2ExrWMX3COCVqwpgRGdWh7QIzoFtJdWk
         vXoKbiK/+SaVjrPGwEAwHmECJmZed6VE4TV8Z7KSLzJbeprDwkzmE6ddOMNcrHIvLF5f
         u708cvM9V+kILhQYXjBg1tS+zcHeXKaUNqaayWMZBZYPDS94fqhrsbOEhJJXeMsGAK9S
         UHkgFMdsDq0GIYeO09IUoPgXB10s0R3XF4ZZILckQqeeCDjHSJLqPqsTaqwFAvYCJAui
         fgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=7Ur4RBY9AxpTv3dT8yaS1A1kSCJt3U7nyBuZiZX1/cE=;
        b=tLQ9TG/io3H9nJJRplkIE74uyz4lvbxODjux5R8SSTSbZ83hzS1MnD0ntchLMjzGxH
         wRCPuiKDNB+7DqcW1XOuVMQZt9V402+d0ryMx/psGhhrNBdxvbC6aEI8wFIiQfM0axis
         pZ0FnJHk3AK5FvnajMJ7e+Yu0ZIKZmE195nHICyRMK743xX+Qu/tIuPKWydFBMGe53T/
         Q69TRnRSuHzABzxexH+47ZUILApX1et8wjy9ijC3C7ErLV5N3HBg9aSW3tVF3/7t4l+W
         VCjm/xNq/G79ZtO7Txjm7iw0PHwAmRkTm+54Eu5abIAZrMh4FohelIAGIsXcJQURAFM4
         f4IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a0ce6e1000000b005387b6749d5si9093271qvn.542.2023.02.07.02.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPKu9-0000be-8U; Tue, 07 Feb 2023 05:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtZ-0000Qi-Jt; Tue, 07 Feb 2023 05:08:14 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtW-0002Nm-Vu; Tue, 07 Feb 2023 05:08:13 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zN800QSz4xxJ;
 Tue,  7 Feb 2023 21:08:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zN52ZXTz4xyy;
 Tue,  7 Feb 2023 21:08:05 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 06/25] m25p80: Add the is25wp256 SFPD table
Date: Tue,  7 Feb 2023 11:07:25 +0100
Message-Id: <20230207100744.698694-7-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cny0D4YKGPw1

From: Guenter Roeck <linux@roeck-us.net>

Generated from hardware using the following command and then padding
with 0xff to fill out a power-of-2:
	xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

Cc: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20221221122213.1458540-1-linux@roeck-us.net>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  2 ++
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index df7adfb5ce..011a880f66 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -26,4 +26,6 @@ uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
 
 uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
 
+uint8_t m25p80_sfdp_is25wp256(uint32_t addr);
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 02adc87527..802d2eb021 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -221,7 +221,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
     { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
     { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
-    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K),
+      .sfdp_read = m25p80_sfdp_is25wp256 },
 
     /* Macronix */
     { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 77615fa29e..b33811a4f5 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -330,3 +330,43 @@ static const uint8_t sfdp_w25q01jvq[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(w25q01jvq);
+
+/*
+ * Integrated Silicon Solution (ISSI)
+ */
+
+static const uint8_t sfdp_is25wp256[] = {
+    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x01, 0xff,
+    0x00, 0x06, 0x01, 0x10, 0x30, 0x00, 0x00, 0xff,
+    0x9d, 0x05, 0x01, 0x03, 0x80, 0x00, 0x00, 0x02,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xf9, 0xff, 0xff, 0xff, 0xff, 0x0f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x80, 0xbb,
+    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
+    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0xff, 0x23, 0x4a, 0xc9, 0x00,
+    0x82, 0xd8, 0x11, 0xce, 0xcc, 0xcd, 0x68, 0x46,
+    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xae, 0xd5, 0x5c,
+    0x4a, 0x42, 0x2c, 0xff, 0xf0, 0x30, 0xfa, 0xa9,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0x50, 0x19, 0x50, 0x16, 0x9f, 0xf9, 0xc0, 0x64,
+    0x8f, 0xef, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(is25wp256);
-- 
2.39.1

