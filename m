Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1231266lfc;
        Fri, 22 Oct 2021 00:58:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVFSKmF6P5kFi0yLAeBsOXqEP2vKBQSSmQUl3k39pA3hzU6LvHLe4SOrMKpHDDYXc7BWOn
X-Received: by 2002:a9d:1c8f:: with SMTP id l15mr8617363ota.337.1634889489571;
        Fri, 22 Oct 2021 00:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634889489; cv=none;
        d=google.com; s=arc-20160816;
        b=e3UPg8vmSHX+tC2B6HUkkeSRpXqE8TkSl2FX79sNECN/5laaC5Ins2mSzJ44gLY+R7
         De/cipJeJdznsD+WgyvVjFA94KlEnLge24nxRgyP0MVE8GJmIrWM7jxyQ7cjYynpQRxy
         o4u+WJ5fnOlDkv5pdTOLW1Z2YVslIazD3sAxSGpkTMWphheFSwM6NiUfQnlEl+eG3Nku
         zHcFE4FePeVRBOGMNj7qhytoEMdGOH81xNhVkpA64icguPSTJZu1ICzkBKA2JqVnvKej
         l4dd0XaedgxJ12Gzn4cpb13wnW5SY5yhipICbf1eeoYUYtl1YaYz38s6/yf74LumQteY
         8tUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=38W0B9QHaCtx+lbq8XKxViuRWt7w4uUuFCKL6JzkcV8=;
        b=rOR3y3Y51R3DmNjVhwGcUwAo67rwFYloGBe5PrGMvl/x0nSNPvSvJeZKbGi8EemrmD
         hYbKZm26O2u8yybMMo3LKxhhRu2JYK7ZKSfOBZJMoPY1BLVsxf4tf4aIb5VWHBdmuDO9
         jfTPacNruCI0sjUi/OQ7/FrNDubTklykeADAHvKGO/fmotZu/z/CZqPa3HpwWk48dbqF
         P4v7QayTkXuv27AJ9qHvfbdmMRF1yeshrZSFFI+7O/oWYfY/vVtu0rXYPxHDMCHd4UsJ
         A2/znZqdyN6gcIfN+l3eSoo5Z3LLiFitScNBn2K82pnxBx8Qhq+YKejySPkCe/M5RvEL
         1YoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68si8915941ott.135.2021.10.22.00.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Oct 2021 00:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdpRI-0004x2-QS
	for alex.bennee@linaro.org; Fri, 22 Oct 2021 03:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQq-0004JT-Sl
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 03:57:41 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:37015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQm-0002rR-PK
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 03:57:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B119F21104;
 Fri, 22 Oct 2021 07:57:32 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 09:57:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ee643519-0c25-41ca-939b-08e5286bc203,
 74C1FF3A6B8BFE8186BF38A421BAA83045AEA3E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] aspeed queue
Date: Fri, 22 Oct 2021 09:57:27 +0200
Message-ID: <20211022075730.484692-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 57722aff-18f6-4b15-8057-6321ce2553c4
X-Ovh-Tracer-Id: 7992763441195158310
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeikeeklefguddvieejueejhfehfeejtdelgedtheetjeetuddutdejfeejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sjLcQ17Z5fzs

The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20211022

for you to fetch changes up to b12fa6118f4d838d19720ec6476a1666a1b43474:

  speed/sdhci: Add trace events (2021-10-22 09:52:17 +0200)

----------------------------------------------------------------
Aspeed patches :

* New fp5280g2-bmc board (John)
* Small cleanup in Aspeed SMC model (Cedric)

----------------------------------------------------------------
Cédric Le Goater (2):
      aspeed/smc: Use a container for the flash mmio address space
      speed/sdhci: Add trace events

John Wang (1):
      aspeed: Add support for the fp5280g2-bmc board

 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/arm/aspeed.c             | 74 +++++++++++++++++++++++++++++++++++++++++++++
 hw/sd/aspeed_sdhci.c        |  5 +++
 hw/ssi/aspeed_smc.c         | 11 ++++---
 hw/sd/trace-events          |  4 +++
 5 files changed, 91 insertions(+), 5 deletions(-)
