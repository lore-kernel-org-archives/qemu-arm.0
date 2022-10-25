Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4199602ejn;
        Tue, 25 Oct 2022 08:29:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rb+3Ovx4sJZe92sMZxUBQhYRwg8UgDFC3jfmyWZ0P7iKvL73eltdRJQJ6PiL/MV2V4yVB
X-Received: by 2002:a05:622a:1c4:b0:39c:f5a3:2f67 with SMTP id t4-20020a05622a01c400b0039cf5a32f67mr32075736qtw.29.1666711766091;
        Tue, 25 Oct 2022 08:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711766; cv=none;
        d=google.com; s=arc-20160816;
        b=OZOD28XYTaC/MeqU4hTbDa2VjWzgOR1KOkuOHbE7cf3lGpoEU/VbDkfQYdsHC0ZpEE
         eTGPEvPEDzDr7OKgjLW8voI+GUDVaIqzAVY7ccZyHfugzDAd5cZswqQlT0Ped6KNOGTK
         /5kUHpQWME4h7K5Whw5sZHCpm5F8HLwCbdaR71G/r/ciibyXZxD8pDtDKLq/krYn5F8D
         2X/3r89ZEcbvJzwYFAgaEeEn2GL5nSaUFopiqgHc33z9BvWHIhulPjhO+7pw7DP3882q
         KUGEVDHUg6FUOrRT3JLtFeIT1Zpd47Irn3bByR2biFq/tgnkcvwspg9xZiJ9O/VhRwZF
         7rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=RxkdWqZvHp5+PO9cVINHai4InjZvUl8dx6U08m6Gmto=;
        b=mnPzYRU9g0lTc9a5wbg4dljlgvwBFkWFGsb8cs+ykSoWjDe5pPsP+GyFT4qqZErUEM
         VBky1hHRU5JHmPkPFuZNzlGyQq1gWmGvanOe3FZuI5FuI+KRMhcZgNZJxZkPPnKWajMm
         Y2oUxMMoc5ayDXAhX6TauUcWmRpFYstyLWWfJP71fKDjUkziAhTyUgaEXPOzFM0iEx2Z
         HywgBPeHZgkk2TtNpzlFhAlazDeDfXPqKvKKb2syJ9YePWCD26gDP9SycEDDNZD3YqDL
         Qk9N2ChUCNbp0UlJpBDqVVoleEa9i2vupdBERACDpUTiSDah5qvvHSuJ3GeZxaUAHuyx
         9hWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo7-20020ad45f07000000b004b8fbe7357bsi2054535qvb.505.2022.10.25.08.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLkQ-0008D9-Pi; Tue, 25 Oct 2022 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkI-0007i1-HR; Tue, 25 Oct 2022 11:21:38 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkF-0004zu-8I; Tue, 25 Oct 2022 11:21:38 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbJD1F6hz4xGd;
 Wed, 26 Oct 2022 02:21:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbJ92T2fz4xGh;
 Wed, 26 Oct 2022 02:21:29 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PULL 12/16] m25p80: Add the mx66l1g45g SFDP table
Date: Tue, 25 Oct 2022 17:20:38 +0200
Message-Id: <20221025152042.278287-13-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sK+Z9qCGCbIU

The SFDP table size is 0x200 bytes long. The mandatory table for basic
features is available at byte 0x30 plus some more Macronix specific
tables.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-6-clg@kaod.org>
Message-Id: <20221013161241.2805140-7-clg@kaod.org>
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

