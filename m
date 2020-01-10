Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp497719lff;
        Fri, 10 Jan 2020 02:25:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzn5ZLOjdOjzsIZtt+DmB0jzf06UA0QW4H8nkYnOJunLRMRoVwxoj0p45D5ubz9sYO2ijfE
X-Received: by 2002:aed:2be4:: with SMTP id e91mr1780178qtd.148.1578651946408;
        Fri, 10 Jan 2020 02:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578651946; cv=none;
        d=google.com; s=arc-20160816;
        b=PGRUwFTzYfYL5veKdRrnE7KK9j3AD9wtbKNd2DVDtNQsoVTD1F8LvgZznCPW8wC6bu
         Z7VZuBRVo99vHR0SRA2Ovtm4B9FZNG/8hQPhIa1PxHhGHSWitpFCjeN1a/20Kz75gx5E
         k6mFZ2QVGYbPWfPqSGvm62C4ypgxbNMCTOnR1luLft8oN3GPmJn4MvKao/xNYz/YPaag
         /8WgWIkR/LzikRzgjrOV2AZ0G55kf1IMCSZnH2MI40QfPLQxFC/IksXYgKF0wgPOznxT
         r9tepK8YVA2nqwbOazWNEQn7p+zVAJp0UQRfiG7kP9TXYY7E7c3EAQtUxsOP9NYKY/D7
         z+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=OeiJDnXmAIxfiW8+oXXOdTXzb6fcVPciBhl5gigS+7k=;
        b=aAJHJskXzv0e/CeFgOVmDAwQkzF6Mazh0nJNb2bfVVj2NqOLyC4exFhtwALXsmLv/s
         MIA87Ei25gvQpzIqvhlsh2UKRx0UajlETm2ctR5DEZWKfuu1/nokQAjj0qzkZseUHkAl
         stYIZOYa//g0DZP6ds99T+N7AN08JuoihqonpJpIqzFwJMS10YR5S/mbkB+c2ocMadwP
         Hb1QYilkWC/pU/svn7XM+guU+7KSeW8bd0jNvFRFApBiayZ/WKf1nyBR89R75c3mNGV+
         BAJxLeNBZitZdANrFE00f5BwJZcqfCnVDh66LXjnLSV656eUuSQ0cMyn3c/5jnPYCbbn
         /JXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si825145qtr.392.2020.01.10.02.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 02:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iprU9-0002br-C6
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 05:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iprTw-0002Zp-IN
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iprTv-00059F-Bb
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:32 -0500
Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54]:47848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iprTv-0004yG-3A
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:31 -0500
Received: from player786.ha.ovh.net (unknown [10.108.35.122])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id A0F1D21F067
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 11:25:28 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id A284AE3A03BF;
 Fri, 10 Jan 2020 10:25:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/5] aspeed: extensions and fixes
Date: Fri, 10 Jan 2020 11:25:13 +0100
Message-Id: <20200110102518.4233-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5843420520192772881
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.253.54
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
X-TUID: qKLUz+FrDNcx

Hi,

Here is a short series adding :

 - a new eMMC controller model for the AST2600 SoC (Andrew)
 - accessors to control the led state of the pca9552 device (Joel)
 - a 'execute-in-place' property to boot directly from CE0

Thanks,

C.

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
 hw/arm/aspeed_ast2600.c      | 23 +++++++++
 hw/arm/aspeed_soc.c          |  2 +
 hw/misc/pca9552.c            | 90 ++++++++++++++++++++++++++++++++++++
 hw/net/ftgmac100.c           | 13 ++++++
 hw/sd/aspeed_sdhci.c         | 11 ++++-
 9 files changed, 199 insertions(+), 17 deletions(-)

--=20
2.21.1

