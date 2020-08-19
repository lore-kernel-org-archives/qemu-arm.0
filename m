Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp312935lfy;
        Wed, 19 Aug 2020 03:10:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa0ZJYfYt+dvGTceBywfLvIUjkm70/MLyN/UlklXQ5n6jNxty3Fk2cyr79E/SupjzIleZt
X-Received: by 2002:a25:7310:: with SMTP id o16mr33879024ybc.415.1597831824672;
        Wed, 19 Aug 2020 03:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597831824; cv=none;
        d=google.com; s=arc-20160816;
        b=QefAFOo7NS5rQy3Atem9oaLr0iUYTjroGbpD9zU/TjAGLIBFVJ12f5DVMFOHcBC+gd
         fxok9sa+1j57IOdzLsCnOX+JoRLphzSQmp8IpNaIJmqEUN5h2iG5BNirf2iRf8ELr9a7
         ehWxQPXqOGvlKeAVddNOrJK8KGjpP8V2FX8K6H5ncAEtX+ee4yst2bTtnlKyeCt7wawx
         /SNxJ6gG26UYNpidECWMwmcjocjnKEnZ4rAsRD57kRQcgEUbsvp2wkbfLAxl7EYU/ZMp
         wO+KOg4EEXzNfqts7o4bJK0fHnlqMS3Kzz4iCG+mAPCwNXQHF0MU4Ow826oeR+WKJbSk
         GFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=NPPcPGIh4Bt41BFTwMb85GoceG6DxOioUuR0fqXj8WM=;
        b=kE0JjY4815adByFNDk0Z3wKcLNonFrlRDbqwFJcTwrO6VeMNKZ4V8SjsUBqi271qDn
         +WxlOVBMBlMOHEUgWiQzhqKF/Z1z7oJacuTeGMhHRsRSz4v9yTPbJRuo4h41aX7xRUV9
         I5D5oGnSQL64KSRXAWoW9aZxjoxuiN6ezApbUyMw9L4DDi1AhzOzFVNEM+63BiLkj9co
         NHZnOlCBZqoi4yofGADCyke2ck4UfT6RZMc2XI8lqS3Sv8ttfAXo5pwK80a7y8U/L4lG
         Aee9BzAZZ0/vb2o1v+qBPxg4SzJXwSxQr92sBg4uNwKAYKgoBt6K6dR5rJBGR15rf8/E
         VBfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w131si24836108ybe.482.2020.08.19.03.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8L31-0001Ax-VG
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2q-00017F-0g; Wed, 19 Aug 2020 06:10:12 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2n-0006We-Qc; Wed, 19 Aug 2020 06:10:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8BCBD51E25BC;
 Wed, 19 Aug 2020 12:10:04 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00400b36d77-2d28-4ab8-8102-5943959efb0a,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/21] aspeed/smc: Fix max_slaves of the legacy SMC device
Date: Wed, 19 Aug 2020 12:09:42 +0200
Message-ID: <20200819100956.2216690-8-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 13ae1290-9d50-4694-86d5-1309cc5e1f34
X-Ovh-Tracer-Id: 18049301410510965542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fAsxtHu8HoiI

The legacy controller only has one slave.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 0646e0dca72e..8c79a5552f93 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -259,7 +259,7 @@ static const AspeedSMCController controllers[] = {
         .r_timings         = R_TIMINGS,
         .nregs_timings     = 1,
         .conf_enable_w0    = CONF_ENABLE_W0,
-        .max_slaves        = 5,
+        .max_slaves        = 1,
         .segments          = aspeed_segments_legacy,
         .flash_window_base = ASPEED_SOC_SMC_FLASH_BASE,
         .flash_window_size = 0x6000000,
-- 
2.25.4

