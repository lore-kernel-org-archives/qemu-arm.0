Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp683608ejn;
        Thu, 13 Oct 2022 09:28:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5M6ke5JppHSra8GcdEg8eY1kSbIM/ZuzSt04Q9WN8/H4CfKQAmT1vQnoa+ZeEAO5hC4TSG
X-Received: by 2002:ad4:5741:0:b0:4b1:d2a9:cda6 with SMTP id q1-20020ad45741000000b004b1d2a9cda6mr378099qvx.109.1665678502377;
        Thu, 13 Oct 2022 09:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665678502; cv=none;
        d=google.com; s=arc-20160816;
        b=QsH3et41h9T38PUEyI7k9V/UR0aroar8EgjvdIUEhwaWT6TEbNkBdPHxWd6lRgv8a8
         SoRntJg4w9UO8vRZjjTXw6fkrYAoiv9iLocpneqYtLLnKGjyEoa8TMvIpEexTH1FFAZ0
         N3eKkxV9Q5MEsIZCR2WEdZdz3zGqunWBNlU110ThsK7VL0BvehnYBOVdIUtGXIZix0bL
         FUV/imQGu0/SIPFJTOze1GLMsdxrJP0P/WgEZxtA5BKt44f7rMKvdqq0neU4+71MhG9T
         gUoI2BAaNKkXLxUTqA9qlm39gfCKZJIZfgpD/G+jY4Q4kZj2kNnKTb+kzsRyk5xI/f3L
         fRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=P+QpsHe5Lb6z4Pw7plrSBMLrQtDvH587ONG2MpF3ZgA=;
        b=Wf9lk4XbIZOP1xP+lN/YZp5R0DG2xpC8gfBrkqsvIG+I/WnzKNiCC7+dMB34wO/NuA
         FzqkXEM7zen3Ag6h09XStIUp7e2Jsc+b1V5TYDkBd+TVAz9cLX/gk6ZOZ+BpdLXQ+df3
         vqzbTbSq1jpSER3v+k1FH64U9usZjAWuohDheANw6yWGQOV3fKvS6siwWNm3ckT0/kqn
         BRVmwEsuIBcwpgzwylZBXmkC3yQjGAqNxEj2UErfhSaoVZY8HHh8q4DU24W5J4ztCfLy
         yULrw1rBE/KqJijLR8eOaYKcDVYk6NQNlFOBOA2fbJoWvnyiSLvHw3vTPeYU2YTzzaDy
         QrMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw6-20020a056214238600b0049904e31195si147561qvb.24.2022.10.13.09.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 09:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oj14H-0002BP-T5
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 12:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pk-00017X-Se; Thu, 13 Oct 2022 12:13:20 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:45493
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0ph-0002h0-IS; Thu, 13 Oct 2022 12:13:20 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF1Q2tQ4z4xH0;
 Fri, 14 Oct 2022 03:13:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF1M0ck1z4xGx;
 Fri, 14 Oct 2022 03:13:10 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 06/10] m25p80: Add the mx66l1g45g SFDP table
Date: Thu, 13 Oct 2022 18:12:37 +0200
Message-Id: <20221013161241.2805140-7-clg@kaod.org>
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
X-TUID: cseq0j4J9VP4

The SFDP table size is 0x200 bytes long. The mandatory table for basic
features is available at byte 0x30 plus some more Macronix specific
tables.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-6-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  2 +-
 hw/block/m25p80.c      |  3 +-
 hw/block/m25p80_sfdp.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 506817bdc952..ec829644b047 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -19,6 +19,6 @@ uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
 
 uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
 uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
-
+uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
 
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index ffed1d69d5a9..376be327e575 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -240,7 +240,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
-    { INFO("mx66l1g45g",  0xc2201b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
+    { INFO("mx66l1g45g",  0xc2201b,      0,  64 << 10, 2048, ER_4K | ER_32K),
+      .sfdp_read = m25p80_sfdp_mx66l1g45g },
 
     /* Micron */
     { INFO("n25q032a11",  0x20bb16,      0,  64 << 10,  64, ER_4K) },
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 70c13aea7c63..38c3ced34d2e 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -150,3 +150,71 @@ static const uint8_t sfdp_mx25l25635f[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(mx25l25635f);
+
+static const uint8_t sfdp_mx66l1g45g[] = {
+    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x02, 0xff,
+    0x00, 0x06, 0x01, 0x10, 0x30, 0x00, 0x00, 0xff,
+    0xc2, 0x00, 0x01, 0x04, 0x10, 0x01, 0x00, 0xff,
+    0x84, 0x00, 0x01, 0x02, 0xc0, 0x00, 0x00, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x3f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
+    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
+    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0xff, 0xd6, 0x49, 0xc5, 0x00,
+    0x85, 0xdf, 0x04, 0xe3, 0x44, 0x03, 0x67, 0x38,
+    0x30, 0xb0, 0x30, 0xb0, 0xf7, 0xbd, 0xd5, 0x5c,
+    0x4a, 0x9e, 0x29, 0xff, 0xf0, 0x50, 0xf9, 0x85,
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
+    0x7f, 0xef, 0xff, 0xff, 0x21, 0x5c, 0xdc, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0x00, 0x36, 0x00, 0x27, 0x9d, 0xf9, 0xc0, 0x64,
+    0x85, 0xcb, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
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
+    0xc2, 0xf5, 0x08, 0x00, 0x0c, 0x04, 0x08, 0x08,
+    0x01, 0x00, 0x19, 0x0f, 0x01, 0x01, 0x06, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(mx66l1g45g);
-- 
2.37.3

