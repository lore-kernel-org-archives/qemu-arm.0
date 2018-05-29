Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3223823wre;
        Mon, 28 May 2018 23:29:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKTIuRUTwDj1tvpHnzhDeoGk1xjRFIq25sVfkPGYe0N3BcJPtNRIDG/3UDa+t3I2u/GedOQ
X-Received: by 2002:a37:b243:: with SMTP id b64-v6mr13358754qkf.21.1527575349635;
        Mon, 28 May 2018 23:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527575349; cv=none;
        d=google.com; s=arc-20160816;
        b=DvaZERAp5qa1bKfguUrZBYgTxFthVEr769xg2ucDSlMLv+zbWaCVVPqXg/5on0CPYr
         cxEZ5ZWx047i8oThzDClsw13yFofhcckn1sJDs2k0/gTEYwdIn8bDRgKU+c8s8JMg7pE
         U+W7+AOTCG20i60WzKBChSPE2o2WafVoWDk9B3xIYHPfpvNZLvhWVzwLKs5PVdk8VU4+
         TSAXYs2KE1xYLhewf9ofc+EF7AfID1YpDeduimcPWVTeQS6zERXgQmZ858tk394LPez3
         ua21+CwCsJYvCalk6TeGXWhqJ69Ssnzrz9hi6QMYECdaleVS9YDOfQYdMMTLk049WNdn
         Ic1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=25Pf94NTiKwSNaqkoxN4ifbuGX4iGJAZrT4ucBxBf6o=;
        b=G4+1k8QkV7yHTnnGN8HYBbPKw/f7OYDwc+H206xrbPosHwTrpYbjqL9er+p8otNS13
         eU1D5ZPkMmbCoA7BvK/wAmYjAJNlAV0lmVd+VYSRfbo/Nty2AAOvOBWJv2HwWRBQhYG3
         znIw2jbA4vrckgpkeTZp8FptA+iTbD2rdbqVycLG354KwllldVHS2V6+5xJeW3HLMiEH
         kVCLgVJKFV/MHLf97uql0CVNpNT7Gp7O7ZKCp9h6dM755QMMiimobKKXgLG34IkW+AD9
         cYFPy18sjBPbIq0leahqnC5WhqB2g7hLNpNzE7Xa5sPw0PUCb+l9fqQagnbg6lR8bBnu
         P24A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y202-v6si2829198qky.18.2018.05.28.23.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 23:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNY85-0001In-3E
	for alex.bennee@linaro.org; Tue, 29 May 2018 02:29:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY7x-0001IZ-Og
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY7u-0001Ru-LB
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:29:01 -0400
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:49959)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNY7u-0001L6-FF
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:28:58 -0400
Received: from player718.ha.ovh.net (unknown [10.109.120.87])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 673BF1B73DA
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 08:28:47 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id D4D2E4E00A5;
	Tue, 29 May 2018 08:28:41 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Date: Tue, 29 May 2018 08:28:32 +0200
Message-Id: <20180529062838.20556-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17518721075987123120
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.52.148
Subject: [Qemu-arm] [PATCH 0/6] ftgmac100 and NC-SI enhancements for the
 Aspeed SoC
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8FEkPqW/ZvCo

Hello,

Here is a couple of enhancements and fixes for the ftgmac100 NIC used
on the Aspeed SoC. It includes VLAN and multicast support.

Following is an assorted set of changes for the NC-SI backend also
used on the Aspeed SoC when soldered on OpenPOWER boards. These fix a
few problems found when running OpenBMC on aspeed QEMU machines.

Thanks,

C=C3=A9dric.

C=C3=A9dric Le Goater (6):
  ftgmac100: compute maximum frame size depending on the protocol
  ftgmac100: add IEEE 802.1Q VLAN support
  net/ftgmac100: fix multicast hash routine
  slirp/ncsi: fix "Get Version ID" payload length
  slirp/ncsi: add a "Get Parameter" response
  slirp/ncsi: add checksum support

 include/hw/net/ftgmac100.h |  7 +++++-
 hw/net/ftgmac100.c         | 59 +++++++++++++++++++++++++++++++++++-----=
------
 slirp/ncsi.c               | 54 +++++++++++++++++++++++++++++++++++++---=
--
 3 files changed, 99 insertions(+), 21 deletions(-)

--=20
2.13.6

