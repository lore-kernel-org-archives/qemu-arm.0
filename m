Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp690329ejn;
        Thu, 13 Oct 2022 09:37:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Nowa3S4r/RK557QKkhXgxIOKk7d3Y7Win5xpNPsK9RNxaiA+DVsB6/dniA65Inp1sif0f
X-Received: by 2002:a05:620a:150b:b0:6ee:8d04:f70 with SMTP id i11-20020a05620a150b00b006ee8d040f70mr607129qkk.101.1665679056613;
        Thu, 13 Oct 2022 09:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665679056; cv=none;
        d=google.com; s=arc-20160816;
        b=LoP7cwuwE8skmm0TKiyIpLj1K8GlMmcZa1sZfZwQUa2+k9v2BQzviXH6ElyEYtx/iE
         rK6dYJqTO6Hh6Pyi1KjrpxxFPAtBVImGUiVzqG9fDR29tnq2n470wP8lu5rzYir1fPL+
         8LAavuqHzOlIUzQ0WENsXG17tzX02TxRftWkjfSSxAh2we3b3qr1I/Nv3bdTseEogZwz
         /s7INtIKOCWjND/FGfRF6ealgi7BGK3mQp2XhH5VqpUi2wnoSlIwzNmElxCu9HPmjLs3
         flnnHGX2TyvHhATL2JeVErpKC1b5KlmfodojPJSjXXA7Fe/H/X09GIH8VQhsBeWiaV7d
         JDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=7jTyR9QfxMPCMqOr811dOuw2DTMv00zC+/hsb3ZF26s=;
        b=iM7g1Bb3nZ5T9/zVUxL4IQTdkJpOtajx4KSb3bFDwPWPHH9d+rTpdSbf2HHMBZzOZb
         I2h7FkRDeiEbX6olN9otoXe/z3V9SyoM9lHB3cYhCSPUWHpyKYLcHtJRyyZfer/ziIM+
         Rizz3svt33vdtZu6jWxFyD6dKRfvi/hqW5vfiRwoBQ6BCR0DnO+aoWkNEoyFANU7/Gfh
         tPomUoAhSMOwdEKzcFT6sD6PBtbnkLXTAERhRWMtwn84rqJMQXA9X3mFK2ye45i2IqGK
         bz2aTfWxxu0V3qph+p70lfdBBf6EMIfZpvx7g6oLfgZZFaekj4L5wR67tIiTLNtkO4NQ
         AO5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s62-20020a37a941000000b006ee988f8491si51942qke.502.2022.10.13.09.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 09:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oj1DE-00036U-2u
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 12:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0ph-0000xj-FC; Thu, 13 Oct 2022 12:13:17 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41941
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pe-0002gf-BV; Thu, 13 Oct 2022 12:13:17 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF1L421Rz4xGy;
 Fri, 14 Oct 2022 03:13:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF1H1rHcz4xDn;
 Fri, 14 Oct 2022 03:13:07 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 05/10] m25p80: Add the mx25l25635f SFPD table
Date: Thu, 13 Oct 2022 18:12:36 +0200
Message-Id: <20221013161241.2805140-6-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013161241.2805140-1-clg@kaod.org>
References: <20221013161241.2805140-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=HNeY=2O=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F4xY7hg24Byk

The mx25l25635e and mx25l25635f chips have the same JEDEC id but the
mx25l25635f has more capabilities reported in the SFDP table. Support
for 4B opcodes is of interest because it is exploited by the Linux
kernel.

The SFDP table size is 0x200 bytes long. The mandatory table for basic
features is available at byte 0x30 and an extra Macronix specific
table is available at 0x60.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-5-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  1 +
 hw/block/m25p80.c      |  2 ++
 hw/block/m25p80_sfdp.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index ecdb9c7f693f..506817bdc952 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -18,6 +18,7 @@
 uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
 
 uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
+uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
 
 
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 5ddc544e1b83..ffed1d69d5a9 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
     { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512,
             ER_4K | ER_32K), .sfdp_read = m25p80_sfdp_mx25l25635e },
+    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10, 512,
+            ER_4K | ER_32K), .sfdp_read = m25p80_sfdp_mx25l25635f },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 6499c4c39954..70c13aea7c63 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -82,3 +82,71 @@ static const uint8_t sfdp_mx25l25635e[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(mx25l25635e)
+
+static const uint8_t sfdp_mx25l25635f[] = {
+    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x01, 0xff,
+    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
+    0xc2, 0x00, 0x01, 0x04, 0x60, 0x00, 0x00, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
+    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
+    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0x00, 0x36, 0x00, 0x27, 0x9d, 0xf9, 0xc0, 0x64,
+    0x85, 0xcb, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xc2, 0xf5, 0x08, 0x0a,
+    0x08, 0x04, 0x03, 0x06, 0x00, 0x00, 0x07, 0x29,
+    0x17, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
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
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(mx25l25635f);
-- 
2.37.3

