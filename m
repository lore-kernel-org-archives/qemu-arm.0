Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp372109lfc;
        Wed, 2 Sep 2020 02:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1ro+dl2hg37RlVCMTI3XNRYs6ZlqAgxiljpejsvHAQnWeNGl+gEEkaWAVuWUDMVP6Q6rN
X-Received: by 2002:a25:41d5:: with SMTP id o204mr9188992yba.284.1599039085431;
        Wed, 02 Sep 2020 02:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599039085; cv=none;
        d=google.com; s=arc-20160816;
        b=c/Jj7OvpOONYq+iGHMbSZ/Fuz00Cgv61PVuWhiZOM7IZHIPaK7IyF+9yJSTOy0BKeC
         qX+Hp1IhsraiyCZMei9zedBNoEqE8pNIAVJHzJBAOh11W3J97a/x8aOaocWnT5Pma+xa
         qUBhHYslmSI+o8wCR6yTGVnDRtu8M0dnk+4RPuezJnlpTimcMVnvvHlleMOlHiwBi2wv
         4Y0TdMfoSe37myXpZX14EuXD6lS5dE8Srs2VYjK9TO0nwXtoKuIQuueIpwzQ9qfXCGY9
         J2qGYm7qadGYH/pDaH9iKv6XevqiUZjRKLyRA/6ZCqDYolI8Bze2qwpnmwia3TkOuBen
         VGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=d2cMVDmXZy+W5P3CQFRppvbOMV4QeU1JVy8/yejFVGI=;
        b=n80auD+54ly/TZYlRkJm5REBX+RKxY0LnTrT44lP7IVPZbwy7QiIsDXsZVcDb6M+kE
         kDKZa3MZI35OhfdHP58+LUliE3XKXr79iWj3QYHOazA4bp+gICaZxyn3ZOlWoPsW5Ryu
         ThwglPoLC6LjrmX8imYkFBUCGwWniBnDZ7edxA4nH7mVhncmZu1Ki96goUmYZiRbXAj6
         R492aQPo/wockyrjcqGUNsIi0etvVRBDYuUuOaj+Gsg3Dl6ePM7rL2vU/GZzzvS34gOC
         SR7isZR/T280sRy4yMwj6B8B1iHIoZXHRRJ8GI4iEc96V2KB+ODW399oir/TvxUATdPi
         QdIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l64si3805747ybf.125.2020.09.02.02.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 02:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDP6y-0001Cp-N5
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 05:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6p-0001CS-A2; Wed, 02 Sep 2020 05:31:15 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:59703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6n-0004Y4-2L; Wed, 02 Sep 2020 05:31:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 31AF65690864;
 Wed,  2 Sep 2020 11:31:11 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 2 Sep 2020
 11:31:08 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00196c8ea03-4d38-4637-bb58-d16659134f27,
 725C0B02AD5EA5A9EE23B5614217EC25792C566F) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/9] 5p80: Add SFDP support
Date: Wed, 2 Sep 2020 11:30:58 +0200
Message-ID: <20200902093107.608000-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f948d42f-70fc-437a-bf36-a2807c3049c2
X-Ovh-Tracer-Id: 7375770292615547756
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedtieekkeelgfduvdeijeeujefhheefjedtleegtdehteejteduuddtjeefjeeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 04:50:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nd2jyirlX9PL

Hello,

JEDEC STANDARD JESD216 for Serial Flash Discovery Parameters (SFDP)
provides a mean to describe the features of a serial flash device
using a set of internal parameter tables. Support in Linux has been
added some time ago and the spi-nor driver is using it more often
to detect the flash settings and even flash models.

This is the initial framework for the RDSFDP command giving access to
a private SFDP area under the flash.

The patches available here :

  https://github.com/legoater/qemu/commits/aspeed-5.2

Thanks,

C.

Changes in v2:

 - fixed dummy value
 - replaced  'sfdp' table by a 'sfdp_read' handler
 - more SFDP tables
 - fixed Aspeed SMC support
 - introduced mx25l25635f chip model for test under Linux.

Cédric Le Goater (9):
  m25p80: Add basic support for the SFDP command
  m25p80: Add the n25q256a SFDP table
  m25p80: Add the mx25l25635e SFPD table
  m25p80: Add the mx25l25635f SFPD table
  m25p80: Add the mx66l1g45g SFDP table
  m25p80: Add the w25q256 SFPD table
  m25p80: Add the w25q512jv SFPD table
  arm/aspeed: Replace mx25l25635e chip model
  aspeed/smc: Add support for RDSFDP command

 hw/block/m25p80_sfdp.h      |  27 ++++
 include/hw/ssi/aspeed_smc.h |   1 +
 hw/arm/aspeed.c             |   6 +-
 hw/block/m25p80.c           |  47 +++++-
 hw/block/m25p80_sfdp.c      | 296 ++++++++++++++++++++++++++++++++++++
 hw/ssi/aspeed_smc.c         |  21 ++-
 MAINTAINERS                 |   2 +-
 hw/block/meson.build        |   1 +
 hw/block/trace-events       |   1 +
 9 files changed, 385 insertions(+), 17 deletions(-)
 create mode 100644 hw/block/m25p80_sfdp.h
 create mode 100644 hw/block/m25p80_sfdp.c

-- 
2.25.4

