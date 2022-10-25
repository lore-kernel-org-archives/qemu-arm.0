Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4200208ejn;
        Tue, 25 Oct 2022 08:30:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6sgsk0LnvTUXIVqQAMO9Ci7f4ibqO3g8NCmfb/DqIatm7r6YcQUaRi6CJF4n63aahc4Fsf
X-Received: by 2002:a05:620a:2587:b0:6cf:7ece:e1f9 with SMTP id x7-20020a05620a258700b006cf7ecee1f9mr26807681qko.182.1666711812474;
        Tue, 25 Oct 2022 08:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711812; cv=none;
        d=google.com; s=arc-20160816;
        b=c3sUVxGlIKCMUTPzv+nGLOV3k3pARBmG0dOtNmqQtw8jc2TeMSDDVM50DhzrDaQzmT
         u6SboxAjNgprEOVyWvI4Nxz27P4eTaX5giuZsg4dSSekDHAhwY20brngs3jgFTr1mNUt
         +kGszoMwMVtXnvxwOxjj1/lzgP44wrwKdffRDPjK+XKToJDaDw4vQOVJHWqbUB5nCNbr
         ZUeqSQO4pqq98Wmkx3e/J0SVAatlIS9zMLsZgx6Epgn/2nGsOHp4BPbO/nJ0zdIuo9UF
         ZyAU3AFMhfh7Ox5EXH4QcEqH/BS2PItxmfn1ECos6l2/p6TnSlvtr00+2lgKGzwHlFvn
         O7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=OPlOLCilTcy7V4p4lOhTHccjc8mXBDC2M8BZ+MaLD2w=;
        b=brAzfpl0jgqXjN/YdfVmbZg3iCB8N9xuIPvi9OprprBXfYsag7dNqAgo98GKJZqlmm
         fa7HVgIjoaFnayedOLcfbcmeHIMv/yczk4CVT4npp6fYUOBRropkBahSSv0g+Jjt+YYT
         rsNa/OWppjkQ3VRgmF13+Z1trWNdUAytks+Ivo+RLYHTVKMqe+LnbK73Eou9Q8e56/6o
         38J4FbfdeoZHEkx3bA0AZaNQA6d4nBMTRZQgEI/980ixWXjM4+bfuqK0vkstWAhJeOVm
         n3TiQNgs6odrFLVkv++DlnSD+KPCcpFstKE3SZZuNOWUBhp1HK20ds8+lSSiU7PqBmVM
         gsaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do4-20020a05620a2b0400b006ea81e7b8c1si1915648qkb.134.2022.10.25.08.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLkS-0008IR-5k; Tue, 25 Oct 2022 11:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkJ-0007of-Tu; Tue, 25 Oct 2022 11:21:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkG-0004yp-Ts; Tue, 25 Oct 2022 11:21:39 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbJH3W9hz4xGl;
 Wed, 26 Oct 2022 02:21:35 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbJD4vrkz4x1F;
 Wed, 26 Oct 2022 02:21:32 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PULL 13/16] m25p80: Add the w25q256 SFPD table
Date: Tue, 25 Oct 2022 17:20:39 +0200
Message-Id: <20221025152042.278287-14-clg@kaod.org>
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
X-TUID: nX/6YbFvokR8

The SFDP table size is 0x100 bytes long. Only the mandatory table for
basic features is available at byte 0x80.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-7-clg@kaod.org>
Message-Id: <20221013161241.2805140-8-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  2 ++
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index ec829644b047..595be9000daa 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -21,4 +21,6 @@ uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
 uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
 uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
 
+uint8_t m25p80_sfdp_w25q256(uint32_t addr);
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 376be327e575..6119c57c8980 100644
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
2.37.3

