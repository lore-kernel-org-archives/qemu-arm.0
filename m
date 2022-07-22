Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp74736lfp;
        Thu, 21 Jul 2022 23:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ubh0Y6yslWsQnuF1SLjkSQcnZdx2Qlrms1tc0/rXJH1Me+GBhiDNkl3mhBfLDN8SIYrn46
X-Received: by 2002:a05:622a:248:b0:31e:ec07:7c28 with SMTP id c8-20020a05622a024800b0031eec077c28mr1792209qtx.595.1658471985883;
        Thu, 21 Jul 2022 23:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658471985; cv=none;
        d=google.com; s=arc-20160816;
        b=mYvRYe6einnxKH5F6IITz9nZt7B5brYmOnDzKg/zvrZtJuRgIMCSP8k+cyq6UY6Bb/
         6vwlPxDUgOHlwby4Eq2sx0dsjeGdWgBpPDLaZxKhAmhQ9SbPi0glTSdF/y6Po2Wl6Ft2
         crNqRoY69Rd21ro2jPfI0iDNXU1rV2wHAkDtctcrIoZfbjr3VacO2NgB1EOfoGV9u0KR
         c1L9R8d1h6xNbbQN/KRn00yb4SO8AZPBNH2EHQC3nRjhatE/RlhBkDj65MxGb8Zyh4Ye
         BnG2Qd54kLTnIzSTifCiD2ZVgC7rL1fGVqeWpvHHqN9ji7afVXtSJEu3qn97KAdGULJ2
         aBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Po5do5+nfvwSlBbAQjWB0ng6PC9YtlFO+3dIqkp2e4s=;
        b=H8rtm6McmZdR6D6q5YM0SzCbVmWJdHEyWmYwWCBLDSH3jIKMcqXjklNjhlalY8hIZw
         DQoa5upFOUofar4nK+n2P/9WtuF8MD+Q6ywSsQ8yQT9iCgtoLgBGiX/H85Yf6gddEojB
         /C7PsGJWWoWqSDHcE0ECxk21I2eRHtU9muvSuQxw8XdvGPjrv8fPBOWNl+G10jr5hrUe
         WeRiLwg9w5+LE4a9jsJ2rcBLLhlHgVyLtYNuuC5duQcQTjGA7m0Okx0NihO3G9zgOHSm
         r3oASeLxUBdOk7lIk29drzJ1QQaFWqQQc+dDK18l8eRe5lwwQAiLE7/N5ovNCGp5HYGe
         1HTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx14-20020a0562142b0e00b0047373b558d3si2996491qvb.568.2022.07.21.23.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 23:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEmK9-0001xv-A1
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 02:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmGz-0008Ae-Mr; Fri, 22 Jul 2022 02:36:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmGx-00013x-BS; Fri, 22 Jul 2022 02:36:29 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lq0844VSvz4xGL;
 Fri, 22 Jul 2022 16:36:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq0805Wb5z4xFy;
 Fri, 22 Jul 2022 16:36:16 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 2/8] m25p80: Add the n25q256a SFDP table
Date: Fri, 22 Jul 2022 08:35:56 +0200
Message-Id: <20220722063602.128144-3-clg@kaod.org>
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
X-TUID: MDfRy3ZP+/zG

The same values were collected on 4 differents OpenPower systems,
palmettos, romulus and tacoma.

The SFDP table size is defined as being 0x100 bytes but it could be
bigger. Only the mandatory table for basic features is available at
byte 0x30.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  2 ++
 hw/block/m25p80.c      |  8 +++---
 hw/block/m25p80_sfdp.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/meson.build   |  1 +
 4 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 hw/block/m25p80_sfdp.c

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 230b07ef3308..d3a0a778ae84 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -15,4 +15,6 @@
  */
 #define M25P80_SFDP_MAX_SIZE  (1 << 24)
 
+extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index abdc4c0b0da7..13e7b28fd2b0 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -247,13 +247,15 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, ER_4K) },
     { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, ER_4K) },
     { INFO("n25q256a11",  0x20bb19,      0,  64 << 10, 512, ER_4K) },
-    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K) },
+    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K),
+      .sfdp_read = m25p80_sfdp_n25q256a },
     { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
     { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
-           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB) },
-    { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
+           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB),
+      .sfdp_read = m25p80_sfdp_n25q256a },
+   { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
     { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
     { INFO_STACKED("mt35xu01g", 0x2c5b1b, 0x104100, 128 << 10, 1024,
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
new file mode 100644
index 000000000000..24ec05de79a1
--- /dev/null
+++ b/hw/block/m25p80_sfdp.c
@@ -0,0 +1,58 @@
+/*
+ * M25P80 Serial Flash Discoverable Parameter (SFDP)
+ *
+ * Copyright (c) 2020, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "m25p80_sfdp.h"
+
+#define define_sfdp_read(model)                                       \
+    uint8_t m25p80_sfdp_##model(uint32_t addr)                        \
+    {                                                                 \
+        assert(is_power_of_2(sizeof(sfdp_##model)));                  \
+        return sfdp_##model[addr & (sizeof(sfdp_##model) - 1)];       \
+    }
+
+/*
+ * Micron
+ */
+static const uint8_t sfdp_n25q256a[] = {
+    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
+    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x0f,
+    0x29, 0xeb, 0x27, 0x6b, 0x08, 0x3b, 0x27, 0xbb,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x27, 0xbb,
+    0xff, 0xff, 0x29, 0xeb, 0x0c, 0x20, 0x10, 0xd8,
+    0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
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
+define_sfdp_read(n25q256a);
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 2389326112ae..3129ca4c52eb 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -12,6 +12,7 @@ softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
 softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
 softmmu_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
+softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
-- 
2.35.3

