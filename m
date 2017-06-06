Received: by 10.25.0.23 with SMTP id 23csp1484086lfa;
        Tue, 6 Jun 2017 01:54:15 -0700 (PDT)
X-Received: by 10.55.71.150 with SMTP id u144mr18566102qka.63.1496739255233;
        Tue, 06 Jun 2017 01:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496739255; cv=none;
        d=google.com; s=arc-20160816;
        b=eTBUQjtOOFENrNtPpr2T8wp7HFpHVx2DRemd7K/eyiCrp/hLtXXABe51M0jb2B29cV
         nn3w1lOQ6zkDtrAF+NH7UrwEzmiHuSW0X/ug3DkjD4wniB8giwo6J4nLb7dJikglY/7Z
         mAQeneKZoVsFsbuxoBKnWkGIzpncJaJuc2Len2DqoLtd9vzLF0x2XuWCdYl0LWK8FJqY
         TBzExKDOLQ4VSxbMTgas0bf2VUbM3uUm23CYRM/7dG3oBqNo2hNPQ5VGG55iWzexyKjW
         OCXekXPZWJWYRn2K1DmItpgNlWjPRmLKTgzt+FHng4LhFjTEEXni7uSfWWLbt3j2Sw0d
         m+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=K5My5KegLBTLstK8nlOr+/edC+R7aut471NxRSe4wUs=;
        b=BeHgfEmwI2LIakIM59APVvnbayx6E7d+vHkyS87DWeeQYsPE4Z2jftpKNbhJEADkmz
         vUXQsdun078FTbV9LorvjMZYQSZeuvVDncWSulyfdv+gxap70N0LMhbJ3U+z8gwBLSDN
         oXPqR+Yki3mKY09xtfl9R3STssNtsjIyV9KFY3JAdGQDeb0/k5eofo+lnKMhOMynRAnx
         kaCx9GYnKENqZ9yDewgGGBKgZyUJmPDl1D3wDWxH1TewCrYyk0/T4OMiiJhpmy/BX2sH
         YLwANdoYUFbXlfzfLRgXKhmfq74I13ockLJR/PQSoLllnfc5/RsmyThZ0u0jaI/46YEO
         u7Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p27si12609314qtf.293.2017.06.06.01.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Jun 2017 01:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIAFg-00059n-Lu
	for alex.bennee@linaro.org; Tue, 06 Jun 2017 04:54:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dIAFb-00058n-RM
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:54:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dIAFY-0004dl-P5
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:54:07 -0400
Received: from 11.mo7.mail-out.ovh.net ([87.98.173.157]:60076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dIAFY-0004cr-Ig
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:54:04 -0400
Received: from player762.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 08C2C59286
	for <qemu-arm@nongnu.org>; Tue,  6 Jun 2017 10:54:02 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
	[90.89.238.153]) (Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id 5FA25E0095;
	Tue,  6 Jun 2017 10:53:59 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  6 Jun 2017 10:53:48 +0200
Message-Id: <1496739230-32109-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7902128498771987217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrheelgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.157
Subject: [Qemu-arm] [PATCH v2 0/2] aspeed: add a TMP421 device to the
 palmetto machine
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
X-TUID: YIL6Zvhv3Nji

Hello,

This series fixes issues in the TMP421 model previously sent and adds
such a device to the palmetto machine.

Thanks,

C.

C=C3=A9dric Le Goater (2):
  hw/misc: add a TMP42{1,2,3} device model
  aspeed: add a temp sensor device on I2C bus 3

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |   9 +
 hw/misc/Makefile.objs           |   1 +
 hw/misc/tmp421.c                | 402 ++++++++++++++++++++++++++++++++++=
++++++
 4 files changed, 413 insertions(+)
 create mode 100644 hw/misc/tmp421.c

--=20
2.7.4

