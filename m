Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp373453lfc;
        Wed, 2 Sep 2020 02:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHoAhhiVYlcotcC7NloObk4swESODI6YQbkgQHiqqMclwyXUdu78wBWbipgLGujh485ZhM
X-Received: by 2002:a25:70c1:: with SMTP id l184mr8726258ybc.241.1599039212610;
        Wed, 02 Sep 2020 02:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599039212; cv=none;
        d=google.com; s=arc-20160816;
        b=VuaT6apsVdr5YiCWOpfK2ICH8mwi9FaAH3zn2CFE1MnHe81p7+qsYY0Y9vvTrCQ75J
         vdpRIjJiV2tIImEWiSjX3vwwSICDTrLyXLuxzF1omt1tbdF1wgyN9osIw1NAm4oUsfL9
         scMEAmUx7by4DACpCkWKd5gFRddnwnX3KnUArSrzMFwCT6yVJCuCUUWIlRigpIajQQio
         PtPK4jOLO+h/Rrpj3VPmNxV5xrxYNSRGKuK2Vx7GHBu0eI3AI51cULJnKcSUcDYNahzz
         NvTS2a/XRqOq5koH+HLTGB1V4J5C6u1B4/4EAtIxQxPSnMUcDuQ4zyToC6It+Eq5tvFt
         ieQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=06a3BUALgn1Y7nLuopQR+GgytewHkG13AFP4cxvaCb0=;
        b=XX0cdObUaOtJlY32BJPGNWdsR2Qgo2avKNCTWREfJAbI16o99vzljAiBA3YjeRoBrU
         NA64eq3owt1YNRz3tHzkb2hb9OgJkkPA3bGnrJPLwSCB17+3C7nU/7quGAtoh+ZAqKAV
         ssU/fc7lVGHW8FFw/0ekZWxQQpx2+CpgMyWMwJ+IcKbMIJRCakeYbXDr93x3bGTtsQw4
         tpg6eQ0JJPGUokX5Bn9Ay61joCRWQf3PTbFYJgtRZD0qoAFQ52rRreMGWtgeo9rrulxC
         +wTLhreNdZ0lSSxhs/RX3acoBhg3i8SnAi8RhPpgTjgTW46XxEDTHhwn/JZ732x60D6d
         O/vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q125si4762987ybc.180.2020.09.02.02.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 02:33:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDP91-0004dV-SQ
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 05:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6s-0001G1-BW; Wed, 02 Sep 2020 05:31:18 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6n-0004Y3-S7; Wed, 02 Sep 2020 05:31:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 12CBF5690862;
 Wed,  2 Sep 2020 11:31:11 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 2 Sep 2020
 11:31:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00177c0063f-1002-4561-809c-233274f9361a,
 725C0B02AD5EA5A9EE23B5614217EC25792C566F) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/9] m25p80: Add the mx66l1g45g SFDP table
Date: Wed, 2 Sep 2020 11:31:03 +0200
Message-ID: <20200902093107.608000-6-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200902093107.608000-1-clg@kaod.org>
References: <20200902093107.608000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7c33ae23-f853-41fa-acea-a09b29b97721
X-Ovh-Tracer-Id: 7376333239768222572
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 04:50:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bk4aK7HY5P8t

The SFDP table size is 0x200 bytes long. The mandatory table for basic
features is available at byte 0x30 plus some more Macronix specific
tables.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  2 +-
 hw/block/m25p80.c      |  3 +-
 hw/block/m25p80_sfdp.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 87690a173c78..468e3434151b 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -19,6 +19,6 @@ extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
 
 extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
 extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
-
+extern uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
 
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index fe4e8c8716d8..9f1fe01c0d05 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -227,7 +227,8 @@ static const FlashPartInfo known_devices[] = {
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
2.25.4

