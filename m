Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp373560lfc;
        Wed, 2 Sep 2020 02:33:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi5Wc2DdAmwyE4+WUuSXWLU79G27i1LNvCz05qzJyUH1WIeHBbHlSqxgKGK1oUUeROSXYV
X-Received: by 2002:a25:7c01:: with SMTP id x1mr8433929ybc.357.1599039220485;
        Wed, 02 Sep 2020 02:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599039220; cv=none;
        d=google.com; s=arc-20160816;
        b=JpvTwBrwDWux1b7njIMTvI59zeRK6PnZj+j24llCwV98F5Cpr/KzLIAtQXzT+GKOGX
         1hPslRaGEUnM+BNd0cqGZKTpxOwrR0m/wVK9o6O3ihs0+7qpMf6IPO6CqX1z6lfLbUGo
         lqKRSgbpGEVeVGhHdjX5hE9BdIUdcZkOB+xPQ8OYYRSWrIXPZfXdy9GDRvB32ln83KPp
         veGKgZ7kAJiuDlXTBVmrBYjGpRR00C/ee80jTaIiNTezvXBV96VORJXC8jvYvIU76tbW
         XUApHZkzbV5UNATaeuNGurBdPb7uwC6Jx6S0SkoTKMyEcYR7FMDA1l8wmAEryGjvNA9C
         WA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=gM8Xy2kxjZtufDAUdQh1u4pctpwND2blZ9GAIwFhqpY=;
        b=cKtaC/wOGgo3vlgWdGuWg7uEBYXA9hxns0cvUAvEm28v8WiGcFDyEFy97EOB0qLaD6
         eRxxcWCB1dBy8IatlvcsF8gVdcf0CibKWWeGG7T+2CykHa9vkFGMIIsQFLzfAUFf/GhY
         N1RqEk0omMrxXT25Uvi+IdGvQ/rOtHdOthGKmG8eE/5s/eK62Grk3+eOf0IDJX+a6u6s
         o/eBoL7UL0PprYq4O9eiit5TCQPCK5ihPGtVt66HQNqQ88xzaPHUSWUcQqh1oSOjV7sv
         1vlB8RhNM9CHubPgSxMhtz//pamMWoqVNxfxrtJut2EbmqYzPyBB2uGTlXN+7dyxFpBx
         KVtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si3915696ybi.305.2020.09.02.02.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 02:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDP99-0004xi-SF
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 05:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6t-0001JE-JB; Wed, 02 Sep 2020 05:31:19 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:59389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6q-0004Yk-Fj; Wed, 02 Sep 2020 05:31:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4E0E55690865;
 Wed,  2 Sep 2020 11:31:11 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 2 Sep 2020
 11:31:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a398ed06-1900-4a34-9252-e22cef2f98d7,
 725C0B02AD5EA5A9EE23B5614217EC25792C566F) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 4/9] m25p80: Add the mx25l25635f SFPD table
Date: Wed, 2 Sep 2020 11:31:02 +0200
Message-ID: <20200902093107.608000-5-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200902093107.608000-1-clg@kaod.org>
References: <20200902093107.608000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fe7b4df7-7d1b-4ceb-8e71-ef40b23ff753
X-Ovh-Tracer-Id: 7376333240785537900
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
X-TUID: vYuW1WX1mnwK

The mx25l25635e and mx25l25635f chips have the same JEDEC id but the
mx25l25635f has more capabilities reported in the SFDP table. Support
for 4B opcodes is of interest because it is exploited by the Linux
kernel.

The SFDP table size is 0x200 bytes long. The mandatory table for basic
features is available at byte 0x30 and an extra Macronix specific
table is available at 0x60.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  1 +
 hw/block/m25p80.c      |  2 ++
 hw/block/m25p80_sfdp.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 0c46e669b335..87690a173c78 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -18,6 +18,7 @@
 extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
 
 extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
+extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
 
 
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 757beab3065f..fe4e8c8716d8 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -221,6 +221,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
     { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0),
       .sfdp_read = m25p80_sfdp_mx25l25635e },
+    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10, 512, 0),
+      .sfdp_read = m25p80_sfdp_mx25l25635f },
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
2.25.4

