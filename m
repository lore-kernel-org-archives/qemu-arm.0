Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp77029lfp;
        Thu, 21 Jul 2022 23:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ueiArudN/XnQ/cSzTqSGQwGXahHpFsBAt9Rn0Y6cNvIf5Y5p9jVJ0toLa9f8O+aaGigqox
X-Received: by 2002:ac8:5ccb:0:b0:31f:bfa:1aa7 with SMTP id s11-20020ac85ccb000000b0031f0bfa1aa7mr1760773qta.215.1658472312027;
        Thu, 21 Jul 2022 23:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658472312; cv=none;
        d=google.com; s=arc-20160816;
        b=JaiqXCH3S8UiotZESpQ+sfPAqpC5BRJiRRNrqWD2vOHmUvfPapLdq2pJofnZMtibOv
         BVH9Z2A/P1T36guerCIs097Z1mq/0d0EOhkOjwbcYxIkjBABfr26otCZ4QqvsvLxhfpH
         mz32ZWVqUw171f9YJqd2fRCd5HNb5W2bx2RWX6zF1uCY/LoUZQyE84kxPSMq4cxQfiUV
         BgFq7p73e/yjNS+uQkNlvvsL+32doUBA9rNqjABNd7v9+DJQJ2Iuq4sPyZ4lZdQIDpAe
         FcAJ6zxbrJkzFcI29FqW6XLCngcZsB6LJubb/rQsu5IQRe0AN7n0xRVRJrpXUmIyWZ/j
         nl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=J8jyQ7PXOO4aG7CXrZhUAYYb9or8N2tqVOSD+VckYzo=;
        b=uVmlekqvyJxYsWy3teSc5Hl4yktj1ikko+YgHycNbYoCzvKvnY0IqO2lllMg/aKmVG
         NZ/iuN2tnvvYU9gS8s4DLpHRGJ8ZhZ4bBkq5s/lLPXDXBaEL0ttkbKZBef/ZWb1ExnEV
         nHNrQAHpAX959b6F9uoXPhvktYXrSObFD/ZzZzKk/yghqRqWntXfrbqZr3enFkDFjB6X
         3CyNYF0x3sQPvIdNG2xIIxMlB62rFRDGgWmM1+F1AsOaRWMX9dYeI5QNPVObP7EYig/E
         HjABANzQ+BBWVtGS7P5ieek9zZ3zm9gNPUCY/7ZDCKnZMlI/9AY9AfD6vx9VZwZ77Or+
         4iTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd13-20020a05622a4d0d00b0031ec3d5a3d6si2619436qtb.61.2022.07.21.23.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 23:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEmPP-0006mS-Bs
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 02:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmHF-0008Cu-Nb; Fri, 22 Jul 2022 02:36:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmHD-00017m-GW; Fri, 22 Jul 2022 02:36:45 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lq08Q30VZz4xG6;
 Fri, 22 Jul 2022 16:36:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq08L447Gz4xFy;
 Fri, 22 Jul 2022 16:36:34 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 6/8] m25p80: Add the w25q256 SFPD table
Date: Fri, 22 Jul 2022 08:36:00 +0200
Message-Id: <20220722063602.128144-7-clg@kaod.org>
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
X-TUID: Fh7pTQtsHQzq

The SFDP table size is 0x100 bytes long. Only the mandatory table for
basic features is available at byte 0x80.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  2 ++
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 468e3434151b..f60429ab8542 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -21,4 +21,6 @@ extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
 extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
 extern uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
 
+extern uint8_t m25p80_sfdp_w25q256(uint32_t addr);
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 52df24d24751..220dbc8fb327 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -345,7 +345,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("w25q64",      0xef4017,      0,  64 << 10, 128, ER_4K) },
     { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
-    { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K),
+      .sfdp_read = m25p80_sfdp_w25q256 },
     { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
     { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
 };
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 38c3ced34d2e..5b011559d43d 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -218,3 +218,43 @@ static const uint8_t sfdp_mx66l1g45g[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(mx66l1g45g);
+
+/*
+ * Windbond
+ */
+
+static const uint8_t sfdp_w25q256[] = {
+    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
+    0x00, 0x00, 0x01, 0x09, 0x80, 0x00, 0x00, 0xff,
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
+    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
+    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
+    0xff, 0xff, 0x21, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
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
+define_sfdp_read(w25q256);
-- 
2.35.3

