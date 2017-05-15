Received: by 10.25.0.6 with SMTP id 6csp1262900lfa;
        Sun, 14 May 2017 22:51:55 -0700 (PDT)
X-Received: by 10.55.212.2 with SMTP id l2mr3511059qki.237.1494827515508;
        Sun, 14 May 2017 22:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494827515; cv=none;
        d=google.com; s=arc-20160816;
        b=KAeSu7OshKLyGohuEBllYDkQPjR8LH+urglzChqMTB/XEpPnazBqGbvrCntpf29DJ+
         lW2qec6Wg/Xzt3S7k1FdNlastT6V/qJexlZ7kWdqTkWE7jczw/WowRPckoEzBA+J3H3q
         OrFRO8hx8ZQ9PDckfD9Jzo4Qz/+mV1k2rkpmgg/NUSSufkEjgem4xa/WBXInhVK2bjcA
         /Q1BlZVHCut23UiEIGJmHUakvZekjrL0YCI7kPspNtHO0QXk39RPiihGVx14o8JbEdAH
         lZiet0Yvlqdepq9phu5ZapO2CdTfGO6oVSx1Fo07oVjZTduArVvtn/HKASmamJQSsSGx
         iGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=1r05fWoMafUnIluGSA4gTJTNxig9MIIAmwIiGnj3PPw=;
        b=n1kAirb0cdyhYJyMHHn1fZZGEIIPlOZh4p99hbNSFmFVzuka6VAJgIcvk0O003rFwm
         Rpp+sAhu6capSUgFszNofZzg4Vi5JgNFUXpMYXQZ8XeRDC+2HkE4UCZ686/b8heP9TsE
         wZe0wesl7ezC4bJGhlhbEalG6KfZcLvTcdDTe8UTkodL/xfhOMyzhLRRiamNKaYahAFM
         4KmaPU+uXSZ4GYHasoIAfjq6QL4dI+pBIeB4HYZ9FkZduNm+eOEEi6JEJ3n5Lo9djC7q
         5aNZhLrMwJYcLizzAyQfl/cRAfWsaae58OvI2aEUTdzeSM8pBqhCEGy56BkIPOubLfmI
         Olhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k38si9971389qtf.53.2017.05.14.22.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 May 2017 22:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dA8vC-00088f-UG
	for alex.bennee@linaro.org; Mon, 15 May 2017 01:51:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8uu-0007xZ-Mm
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8up-0001AA-O2
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:36 -0400
Received: from 15.mo4.mail-out.ovh.net ([91.121.62.11]:40191)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dA8up-00019H-IC
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:31 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 14F2163AB2
	for <qemu-arm@nongnu.org>; Mon, 15 May 2017 07:51:22 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 3D0B674006B;
	Mon, 15 May 2017 07:51:19 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2017 07:51:10 +0200
Message-Id: <1494827476-1487-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4745105159399639825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedruddvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 91.121.62.11
Subject: [Qemu-arm] [PATCH 0/6] aspeed: I2C controller fixes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5DuJbbdFnZ/

Hello,

The new Linux driver for the Aspeed I2C controller revealed some
serious limitations in the QEMU model. This series fixes these issues
and also adds a couple of well-know I2C devices to the Aspeed
machines.

The QEMU model now supports the recent Linux driver and the older one.

Thanks,

C.

C=C3=A9dric Le Goater (6):
  aspeed/i2c: improve command handling
  aspeed/i2c: handle LAST command under the RX command
  aspeed/i2c: introduce a state machine
  aspeed: add some I2C devices to the Aspeed machines
  hw/misc: add a TMP42{1,2,3} device model
  aspeed: add a temp sensor device on I2C bus 3

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |  36 ++++
 hw/i2c/aspeed_i2c.c             |  65 ++++++-
 hw/misc/Makefile.objs           |   1 +
 hw/misc/tmp421.c                | 401 ++++++++++++++++++++++++++++++++++=
++++++
 5 files changed, 494 insertions(+), 10 deletions(-)
 create mode 100644 hw/misc/tmp421.c

--=20
2.7.4

