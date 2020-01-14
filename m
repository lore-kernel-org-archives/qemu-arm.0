Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5329567lff;
        Tue, 14 Jan 2020 02:35:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFvk14rYdZqfpA0mxhtUYHHscMWw+RTa19QT2697wAz8adDY+/kGqBA3oeOHp7prZuHr8U
X-Received: by 2002:a17:906:ad93:: with SMTP id la19mr22143784ejb.54.1578998107769;
        Tue, 14 Jan 2020 02:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578998107; cv=none;
        d=google.com; s=arc-20160816;
        b=01N2XB/0z0+vbyhEl5OrzemcIH6RsI+39lnFojUjwL9jqR/LF51/kuL1uN49jw1Qc1
         c0Ee9haBYkeL62QCDjbBenqCzBGO3c3Fg1ke9ja8+hfTLHlvQKeVOZqWUGg2yJAXbwxr
         QIqOgI2FxSQ3pcBvSt4ZAL0vltCatYaHBY+dgEMAG9Z22jazWBtOSB3mrmAzIYXFdM6m
         sImCvj1CQSYsAkXy5gLNqS4Xt9uPvLmW/uVMs5adPm/0baGZLNxrpF4v9/6PVQiTph2L
         8+OkoX1sKlv9dkFqM7XpCQSqTaoXh5DMuY9WO9DDCkBjCSopANuBwTONwaZIioMF03Z9
         zDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=cwksFdIK8aoOPe/jCH+OODUxVj/aeEe4ugTvbOdk9W0=;
        b=Y/PEtRyvRlCyjQ7RUPBK3AO0OzRitdnbbNV7kXpYCeiMQ81g0/il/t/JHm5sEgn94D
         RCp7lRzPQH9zS/yg2ay/Pqgg7e7/ZPEu1McMKeZ0JKuXNV4YFlstLDWACi+qPcluMKm2
         g8EoWJO2hDFqJgRD/r4lJskX/fTvNh2bnrKyra/laETYXKdkmz/PGWVCim2oQzSAE59u
         CQ5xunSd+PzzY4S1Gkbc1f56pD3GH6aDAyi7HUz1dcEZ8dDA6FLaH8lG+AYw9Fe5gzEE
         drwGDHift1tKrVad4Xzq0Atg3v7PeByKpW2nOn8i0oLtW7ve1HndZw255gE+hWADGKOH
         d7GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d25si9798546edv.364.2020.01.14.02.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 02:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irJXO-0004VM-Cc
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 05:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1irJX9-0004UK-Lf
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:34:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1irJX5-0003bm-L9
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:34:51 -0500
Received: from 8.mo177.mail-out.ovh.net ([46.105.61.98]:42853)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1irJX5-0003bK-Ed
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:34:47 -0500
Received: from player798.ha.ovh.net (unknown [10.108.57.95])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 3381F11C23B
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 11:34:44 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 46555E4CFBAB;
 Tue, 14 Jan 2020 10:34:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 0/5] aspeed: extensions and fixes
Date: Tue, 14 Jan 2020 11:34:28 +0100
Message-Id: <20200114103433.30534-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11043952188472265489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdejvddgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.61.98
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WrmiGfVBFvjC

Hi,

Here is a short series adding :

 - a new eMMC controller model for the AST2600 SoC (Andrew)
 - accessors to control the led state of the pca9552 device (Joel)
 - a 'execute-in-place' property to boot directly from CE0

Thanks,

C.

Changes since v2:

  - wrote a better commit log for the ftgmac100 fixes=20
  - renamed sdhci object names

Changes since v1:

  - removed ternary operator from sdhci_attach_drive()
  - changed object name to "emmc"


Andrew Jeffery (2):
  hw/sd: Configure number of slots exposed by the ASPEED SDHCI model
  hw/arm: ast2600: Wire up the eMMC controller

C=C3=A9dric Le Goater (2):
  ftgmac100: check RX and TX buffer alignment
  hw/arm/aspeed: add a 'execute-in-place' property to boot directly from
    CE0

Joel Stanley (1):
  misc/pca9552: Add qom set and get

 include/hw/arm/aspeed.h      |  2 +
 include/hw/arm/aspeed_soc.h  |  2 +
 include/hw/sd/aspeed_sdhci.h |  1 +
 hw/arm/aspeed.c              | 72 +++++++++++++++++++++++------
 hw/arm/aspeed_ast2600.c      | 31 +++++++++++--
 hw/arm/aspeed_soc.c          |  2 +
 hw/misc/pca9552.c            | 90 ++++++++++++++++++++++++++++++++++++
 hw/net/ftgmac100.c           | 13 ++++++
 hw/sd/aspeed_sdhci.c         | 11 ++++-
 9 files changed, 204 insertions(+), 20 deletions(-)

--=20
2.21.1

