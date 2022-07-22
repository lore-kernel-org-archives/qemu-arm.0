Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp76828lfp;
        Thu, 21 Jul 2022 23:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vxVoZuXzZolv1/6AxWrBGW+QjzSO+Fk0VROYqt+I9GHm2MEIdP+BagJpHJM50iVnknINsV
X-Received: by 2002:a0c:f3ce:0:b0:473:3c5:d378 with SMTP id f14-20020a0cf3ce000000b0047303c5d378mr1860143qvm.48.1658472282083;
        Thu, 21 Jul 2022 23:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658472282; cv=none;
        d=google.com; s=arc-20160816;
        b=DrQFK7dC4ot1vTLk2XmFBVOLRN1d4iEymQ+PzwMVV52NTc3bawvPBJzTBtB2CJl+Gw
         koktpiwoBInTsKRH5Uad2FevMzr2qZN8WY63xOmG4FjIFwEyhaPMnn5Reju0mvAVk9dl
         pT2rO/7bY9D19EqJ5fbQ+NjGN0fpuYk4GQnkM025UsfoIHxtk9Kh8K2eXID/K5sx3fQU
         zF/9WNcmSUaMVMBSUaLrQg1J1n9vO+nOm4sn5Hz3v2XpIH6fxX011I783HCSzQqSmjPC
         vLKwl6QJGou2apy59OgFNRUv2zsdRL1N1pPUVv//L0B+gkDhlu+AuyaTTvpASmspewjn
         /Cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=W8sPO34sGbNtTaju9h5+Tgmx5kBxFuJ3yqdgwPWE3m4=;
        b=SxyGNaY/675+CqHypxINWXmuBhaF/vzKa5cs1wNNJTY6Cf2nOCpPq+Do2QFEKPmuRw
         9a4p6az/urPadKVJx+PiG4RLG/TkBDp156Q3jNNoGEAVuTCca9EDTbouA/93VO5VIP3T
         9uvVkqHr2G2DMriXAmDD+v6jYIMAgrMaRpSjhNN4B+I7DH74jC1StTsmq7cBNljdUttc
         bsHFVQPIqrA/aPbX3DykkoCZ4D7vrksqwSAC2nbI712XiiASfjnmhKaR1NcgAYBZwOX0
         a0K97r7tEQm8Ddd4yHuuXxFXzSUB0pYN66RxaeV0Cy9LDiwDrM9NLxY0z51MVAbCpQez
         J11Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020ac85c4e000000b0031ec3a29e76si2812938qtj.533.2022.07.21.23.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 23:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEmOv-00060H-JP
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 02:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmH1-0008As-AZ; Fri, 22 Jul 2022 02:36:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmGy-00014c-IK; Fri, 22 Jul 2022 02:36:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lq0890WRRz4xG6;
 Fri, 22 Jul 2022 16:36:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq0851ZyYz4xFy;
 Fri, 22 Jul 2022 16:36:20 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 3/8] m25p80: Add the mx25l25635e SFPD table
Date: Fri, 22 Jul 2022 08:35:57 +0200
Message-Id: <20220722063602.128144-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220722063602.128144-1-clg@kaod.org>
References: <20220722063602.128144-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 8fIOdDG/woeU

The SFDP table is 0x80 bytes long. The mandatory table for basic
features is available at byte 0x30 and an extra Macronix specific
table is available at 0x60.

4B opcodes are not supported.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  3 +++
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 26 ++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index d3a0a778ae84..0c46e669b335 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -17,4 +17,7 @@
 
 extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
 
+extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
+
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 13e7b28fd2b0..028b026d8ba2 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -232,7 +232,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
-    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
+    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0),
+      .sfdp_read = m25p80_sfdp_mx25l25635e },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 24ec05de79a1..6499c4c39954 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -56,3 +56,29 @@ static const uint8_t sfdp_n25q256a[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(n25q256a);
+
+
+/*
+ * Matronix
+ */
+
+/* mx25l25635e. No 4B opcodes */
+static const uint8_t sfdp_mx25l25635e[] = {
+    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x01, 0xff,
+    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
+    0xc2, 0x00, 0x01, 0x04, 0x60, 0x00, 0x00, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
+    0xee, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
+    0xff, 0xff, 0x00, 0xff, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0x00, 0x36, 0x00, 0x27, 0xf7, 0x4f, 0xff, 0xff,
+    0xd9, 0xc8, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(mx25l25635e)
-- 
2.35.3

