Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp313727lfy;
        Wed, 19 Aug 2020 03:11:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx37aVeA7fCR16Y7MVEO3botqklc9cLuKYlIvAfEE+EHRHWEdBIsr8qD7X8dGRCUTXUHQ5v
X-Received: by 2002:a25:6409:: with SMTP id y9mr35080398ybb.447.1597831887977;
        Wed, 19 Aug 2020 03:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597831887; cv=none;
        d=google.com; s=arc-20160816;
        b=eummTTJ43JzC2IsDP1CZ+ealv0diLh4D6igy3OLPHVIHz/li7N/3GpW0jPqURshMBH
         9v1VCSyzkgjAIs4skJ4GtMY8XJpmcRviModpWZb1Ighlu4n5hU4eg5T4noKeP+YhGe6k
         hPtkpW5xzaQEGOA+mfhBVYYxWFjBvxRaBSUQGxvM+bvGMS4stCmV8pyO9JlIKnumTj3N
         ab7wQm/Ibd+T/Rviqx7baUZmFJfZf8qg4D2vpPb2XK/NSVR8yZ93iFZJUwaIZ104j3Be
         B/GjK+p4rIlsk3MoXd0MMRT+oayMbHC7gbbrQDuMFatblfTFku84MIKmJGKv3JWLRxTc
         iAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=mVx781DjLJ4jZWiL63+R/29rOiqsSNwdjwVTRn/mQmw=;
        b=JozE/BbauvZ6tUC6d/PF0DaVD4ux7JLz8+c8n7YXv/19EIAdG18vS4+S0Q2kd0L8OA
         wDYoHAhAjnNNpDjJ55QT6OCAFWik0zBpJzxfDvRVWccSS9qf/XoEmlcIZfIYGAgN+dmC
         i9Wfa89G4pZAqbu/9Uzz//7I+XXdqhZbzFdtP8FeSaIC29m5BeqOGOhHx0zjIPH/o52X
         moREEg4tuHvtR3FbGLJd7PBKxadcQgbci13tXD11AC/9Z+p07mnwmEI86Ncp9VVxmZ8n
         kOSH2WuwXkFlh2HZNeV7O/dtyKdjG8PM0RuvvafIOdX4HLeSsm1RVRnVdwvVLTBNm+NO
         92yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z186si23429338ybc.63.2020.08.19.03.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8L43-0003Qo-7b
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2s-0001An-5N; Wed, 19 Aug 2020 06:10:14 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:37009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2p-0006Vv-P7; Wed, 19 Aug 2020 06:10:13 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 6AA35589282A;
 Wed, 19 Aug 2020 12:10:01 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:09:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c879f265-7988-452a-b053-047b98672557,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 01/21] m25p80: Return the JEDEC ID twice for mx25l25635e
Date: Wed, 19 Aug 2020 12:09:36 +0200
Message-ID: <20200819100956.2216690-2-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1e659def-acd2-4d23-9a43-3da5f0aef9d7
X-Ovh-Tracer-Id: 18048175508837993321
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 erik-smit <erik.lucas.smit@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Wr7tAx55Bl+

The mx25l25635e returns the JEDEC ID twice when issuing a RDID command :

  [    2.512027] aspeed-smc 1e630000.spi: reading JEDEC ID C2:20:19:C2:20:19

This can break some firmware testing for this condition on the
supermicrox11-bmc machine.

Reported-by: erik-smit <erik.lucas.smit@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 82270884416e..605ff55c6756 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -217,7 +217,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
-    { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
+    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
-- 
2.25.4

