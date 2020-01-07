Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24332072lff;
        Mon, 6 Jan 2020 23:54:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwL7kp8i0yB1GkOT+ZS3OxIy2Fv88yEW5nJaD3oh2m1FInZjdPjquWxADXwlYeJ22BjvIrt
X-Received: by 2002:a17:906:7848:: with SMTP id p8mr111775267ejm.19.1578383650454;
        Mon, 06 Jan 2020 23:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578383650; cv=none;
        d=google.com; s=arc-20160816;
        b=TZ8VSlRyrD183hEwQbxIoDrYuD14nNvHREXRivBFPdpTA0oFTY2U9RjpVFggeEa3ZC
         G9VXzsBOJDvt3SivlIEDpQdSIkGO8/3h6AuSxt9B5Q/eTfwbvfvrpGZRKxKGsmyhi4qt
         VjCUOeIGfKbbBMLZ4flRXBaubY8vIPpQPwGA8EiD5iO2ezR2Y1ghdKpskDlrmx9hBPfq
         yM5ZyPFPXr1NpzUzOlODwxv4MPEH6A4/TIwL6Y5NDvECuUAUJPbUZfSo4uLLnXJIx5eK
         RMu/OIL2ua2hJAnTINwKAGz7HL8noiqomOz6L3GFpnQeynP1193raTOkscDC9F6HYySW
         WZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=9nLKY0JbEYPpTA8R/jit9WoUKdFUf/AH0ixNSlPDmL8=;
        b=r/SPJoNFDUZf1E89qMzAXnX+G3lZUL5NaAeb5fsTTcj99KJPczEC43dlr9czz0NAh6
         o2qEMkXAvKfQEhnlyav2k1dp1CGu0l8IwzXODXmpRKs5n6TIEEFxoiloikvkg5LhJ3da
         hvp0Z7uGCMvx3Bn8l0vr75OxaFXRex62xGpkHTsywGJpOhr7aWZTZWInfls/wyvubt5t
         +OuK0bGoqkOkRDG+dc0XMS3/lxd8xfKBTIJdpAdck9ILCauwiWznLQM4v+nGbbNDYZdt
         TUi7LI4RQBahArQFwwyRmIC+tySRABD8XEOdtxju4qtJwOzot2OJxdU3yHTam2qnyTGY
         CLsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si24194803edl.312.2020.01.06.23.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 23:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iojbH-0004FG-A8
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 02:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iojO0-00021Q-GA
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iojNy-0006i7-P4
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:44 -0500
Received: from 15.mo7.mail-out.ovh.net ([87.98.180.21]:60259)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iojNy-0006cl-J0
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:42 -0500
Received: from player755.ha.ovh.net (unknown [10.109.143.24])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 138F3149D84
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 08:34:32 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id DDAC6DFE0B61;
 Tue,  7 Jan 2020 07:34:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/5] aspeed: extensions and fixes
Date: Tue,  7 Jan 2020 08:34:18 +0100
Message-Id: <20200107073423.30043-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3785275489691798289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.180.21
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6jlfEJCw444

Hi,

Here is a short series adding :

 - a new eMMC controller model for the AST2600 SoC (Andrew)
 - accessors to control the led state of the pca9552 device (Joel)
 - a 'execute-in-place' property to boot directly from CE0

Thanks,

C.

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
 hw/arm/aspeed.c              | 71 ++++++++++++++++++++++------
 hw/arm/aspeed_ast2600.c      | 23 +++++++++
 hw/arm/aspeed_soc.c          |  2 +
 hw/misc/pca9552.c            | 90 ++++++++++++++++++++++++++++++++++++
 hw/net/ftgmac100.c           | 13 ++++++
 hw/sd/aspeed_sdhci.c         | 11 ++++-
 9 files changed, 198 insertions(+), 17 deletions(-)

--=20
2.21.1

