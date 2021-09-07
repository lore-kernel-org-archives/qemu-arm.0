Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4447363lfb;
        Tue, 7 Sep 2021 00:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr3zUe2jiEBtKVnaPfe690tXNJpMEG9VJwHok239mL056t5fJcmsxhUpfake9PqXi8DGEU
X-Received: by 2002:a05:6e02:2188:: with SMTP id j8mr11138816ila.66.1630998096312;
        Tue, 07 Sep 2021 00:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630998096; cv=none;
        d=google.com; s=arc-20160816;
        b=aPgW0hWhxWjUILy8SQuVZsg+YfWPsgxSzC+Fg9FlRUJyu3SfD8kBlILsSfVyrnSLRU
         a8fFe8jDDRGuX0SrkpIbYs0ceGZ7supB9y4WKpnZwvH204B2S69Fx1yMEPggUvy4CNWJ
         BfKI9uETLf23SxGegnSvkK907uP8URqrei2T2AWE/g7TaOIWf26HFfnfYjlBgfWsDgK9
         L74vuYwQQ9131NPHZs31KLefreucqigni21eqApD+vV0vWJ72FrqdXdIPHqnNtrEKEM+
         nKY4QogYD4lBLy/dn1h7qPSUkU/FZd4+ARZWzh2QcIRqzRwb5EKOt/oCW8reKpdftqvF
         ZA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Grsc3xUkT6bOzdNQYxAknE1PaFd34xakcPBbFKcE980=;
        b=Nf79GHDoMz+K7ufLsolrOYAojECcJURkRpDFaaJfIRORONA7lRph/j/6a3/XjUjZeJ
         LpEfiKaeL+/F0wCW25h9CC3NgxJm1g+GmPDMokLRQq4/n6zi0B82sCiseSp9/hH3Kj4e
         1nZRw84uurUyvjvck5jakCrUe+R4Wwn55oXbp6jdB59O3/UvJ512gLlKfPjIIxxBYi0y
         bsg9gypbX1P2taQhdNtk/r1AcusCrTP9JE9ITD3xpA/2O6TRj096+RIjEO4tmHgjFbxB
         xpGJM8YzrwAWSfO/XzbierTdWpeG+MD9OWAPlJgwkwcZjDuhnZkN5Py/DSoqrtNtAZdT
         Yv7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si9915031jar.120.2021.09.07.00.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNV6t-0004Mp-Jn
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV40-0001RF-Vs; Tue, 07 Sep 2021 02:58:37 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV3y-0001IX-WD; Tue, 07 Sep 2021 02:58:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D3847BCB54D8;
 Tue,  7 Sep 2021 08:58:23 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002783a2243-9336-48ab-98a3-a9fd056adef0,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 00/10] aspeed/smc: Cleanups and QOMification
Date: Tue, 7 Sep 2021 08:58:12 +0200
Message-ID: <20210907065822.1152443-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: efeab7c7-29e0-4636-872f-65ef4033d51b
X-Ovh-Tracer-Id: 976999647944805225
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jch9nb3Bhilt

Hello,

It looks big but there are no major changes.

This series adds a simple support for the 2nd watchdog registers which
were moved under the AST2600 FMC controller to deactivate the
alternate boot function. Then come cleanups of the AspeedSMC model
mostly removing a useless AspeedSMCController structure (that's the
noisy part) and QOMifying the AspeedSMCFlash structure.

Thanks,

C.

Cédric Le Goater (10):
  aspeed/smc: Add watchdog Control/Status Registers
  aspeed/smc: Introduce aspeed_smc_error() helper
  aspeed/smc: Stop using the model name for the memory regions
  aspeed/smc: Drop AspeedSMCController structure
  aspeed/smc: Remove the 'flash' attribute from AspeedSMCFlash
  aspeed/smc: Remove the 'size' attribute from AspeedSMCFlash
  aspeed/smc: Rename AspeedSMCFlash 'id' to 'cs'
  aspeed/smc: QOMify AspeedSMCFlash
  aspeed/smc: Add default reset values
  aspeed/smc: Introduce an addr_width() class handler

 include/hw/ssi/aspeed_smc.h |   81 ++-
 hw/arm/aspeed.c             |   18 +-
 hw/arm/aspeed_ast2600.c     |    4 +-
 hw/arm/aspeed_soc.c         |    4 +-
 hw/ssi/aspeed_smc.c         | 1129 ++++++++++++++++++++---------------
 5 files changed, 701 insertions(+), 535 deletions(-)

-- 
2.31.1

