Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp677880ejn;
        Thu, 13 Oct 2022 09:20:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4yHeRdNMYD/bQeYMGfPoQlfamdgENfT/Ap+ccCuxT9AM+usyfo0MIfcH6yZAy7JtE0YSXd
X-Received: by 2002:a05:622a:513:b0:396:378a:f0e4 with SMTP id l19-20020a05622a051300b00396378af0e4mr478774qtx.515.1665678022693;
        Thu, 13 Oct 2022 09:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665678022; cv=none;
        d=google.com; s=arc-20160816;
        b=X66NsTQBMHFeNKq8opu+7wa8bfBBA8rsA9n2l0CUemyOdMIhlr9f/Dl2d1RWmlnvPs
         HdRriOJ8dAmD9jGPzznquYWoWxXd0Z5DKFIdHx3B3qupjAFHOR6+GAZhru8GMDPekYam
         XPq9djdMhxEggpGQb+flLtm0sO+GoJhmk5jf7w6Di6D8WfvXH7io5IB/KD64kOQZhire
         jYULBEPLmrBrmeZxBD46nUl36qCiDslsV/ALei+faG/WHwHglzJcKObgj9Hjql+A6eQe
         CufOjQTsuEbAbZ/53hyy/Ez/TKE129y+rFYXEKenx5gQsb/enkHZMiLo7MHD995+jLP6
         nkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=+xAZpRqAdpGKAkunLdAH+4DeO4sPv2wiYBTKRdz57EQ=;
        b=HOVAUEtt30pCPRpTeX3REoMsd0DSv+fQ3VWjeIcP8qbTI5JCcpwFFrF+7PzwM8k7xY
         CulVmC2elEqi1wG2FBWLrz8m4gWKJuQIWEzAyQ/gLkPpwOWYKF0vU3XPmCUNBGTM6eD2
         wjXWGcJ7uVW5WRc2KHDI393ybpt1bJ5uIg0RGRSFpGt59La2suZ7hnk0ttn+R4Bz/Hi/
         ka49/jCczGJkM2sIgfKZBXbERVmfi+ooeQrf8r1Ly95Ea4vI3t+4vUv5nUxfDTVLF9BB
         XG3HHMQ9zPkeHQYRkgPwEDA26CtWr+4laX/woh7TNaQUKVU05CtP12v6kI0yOIEgqD3v
         Cn0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl12-20020a05620a1a8c00b006b941bc8a3esi54657qkb.280.2022.10.13.09.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Oct 2022 09:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oj0wY-0001Gv-5s
	for alex.bennee@linaro.org; Thu, 13 Oct 2022 12:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pc-0000vQ-2m; Thu, 13 Oct 2022 12:13:14 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41047
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pa-0002f6-4E; Thu, 13 Oct 2022 12:13:11 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF1G5FNzz4xFy;
 Fri, 14 Oct 2022 03:13:06 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF1C35BWz4xH1;
 Fri, 14 Oct 2022 03:13:03 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 04/10] m25p80: Add the mx25l25635e SFPD table
Date: Thu, 13 Oct 2022 18:12:35 +0200
Message-Id: <20221013161241.2805140-5-clg@kaod.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vUXtVpfynxeC

The SFDP table is 0x80 bytes long. The mandatory table for basic
features is available at byte 0x30 and an extra Macronix specific
table is available at 0x60.

4B opcodes are not supported.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-4-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  3 +++
 hw/block/m25p80.c      |  2 +-
 hw/block/m25p80_sfdp.c | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 7245412cc18c..ecdb9c7f693f 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -17,4 +17,7 @@
 
 uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
 
+uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
+
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 637c25d76e37..5ddc544e1b83 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -233,7 +233,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
     { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512,
-            ER_4K | ER_32K) },
+            ER_4K | ER_32K), .sfdp_read = m25p80_sfdp_mx25l25635e },
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
2.37.3

