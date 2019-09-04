Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp353274wrp;
        Wed, 4 Sep 2019 00:05:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwaLRlOZ2nhyiUT4aRbDR3QLiPFie2HyO2Aiesc4z+j6iYhqcRHBXV2CoEUoA3caEsW1gXM
X-Received: by 2002:a37:4dc5:: with SMTP id a188mr39727043qkb.206.1567580747054;
        Wed, 04 Sep 2019 00:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567580747; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw0WOa/oC5Fn2tfqTYTHf2t7DSlqnMfmAOl5tsaCjHKhNV/Pez7WmCNmaQ3WCDHkaH
         BDhQOa7Lk3sOhyF9N1K4H4ZX0LOBVgmvg1/Tz+Fmygk5C0Lx6qwckDVwK+9DMmYieAl+
         4zeCBRlgXFVMx/C6YfgmQ9ZB5oA5fhTRSbGI2OGApNjNf86qLP9X2zTIl3YnLo2zB5JR
         2dQid7Tet8fgYhvgyMUfLiuEvNTaoEUqPugYfwUAm6ewEsD04ig7uxtNSFhgWiNjPD/u
         tdgKI17hVqqjzzV5mycTvMjzzC05mN4k7QKgwNxvOGMeR+n0nWZIztTxbM2u5DskRANP
         Vp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=2Y7sTzT+vQUsDLvBwcwlVVzEWtfXfc39HfDyBi5GKP0=;
        b=i0L9aCzBHN9K8mC72Cs6OEbncywU5gWmyMHARxqfbR/Kv60tAYfVuKQhyip0XDOfn/
         aav2kJIu6D61+1KYdWB8ilXTSJeo7XJsAlZNCQLCIIsYily1yyxN71VH5o0FebULlDs3
         MKdIoe0aHyg11wf2CZmzD7N0sgDwyLyhUQ9QIbAmBkYkSIbfE0o56Nejl7wmkoJfKk6c
         k0Iy+CaWNDyLR9QNUAnLuHkfTPA+GjWndqtQZveUOGUdH0aF8jJpcCSSi30zOMFCCkrr
         iPWVPiB/vpt8xMjdBoNYldqyViWspaCuPQnc7vn70LaZ3bR/jCESy2EwK8psrFkTDa9l
         O/Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si7583059qvf.143.2019.09.04.00.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 00:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5PMP-0001HF-W1
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 03:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47721)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PME-0001Gq-Ms
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PMC-00068b-6g
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:05:33 -0400
Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154]:46522)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PMC-0005z6-1D
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:05:32 -0400
Received: from player690.ha.ovh.net (unknown [10.108.57.44])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 157661077ED
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 09:05:19 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id B9D7D94DC69A;
 Wed,  4 Sep 2019 07:05:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:04:56 +0200
Message-Id: <20190904070506.1052-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7074873541930683153
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.154
Subject: [Qemu-arm] [PATCH 00/10] Aspeed: machine extensions and fixes
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: np0+ToGUK5cn

Hello,

This series improves the current models of the Aspeed machines in QEMU
and adds new ones. It also prepares ground for the models of the
Aspeed AST2600 SoC by calculating the model typenames using the SoC
name.

You will find patches for :

 - DMA support for the SMC controller, now using address_space_stl/ldl_le
 - GPIO v5 model from Rashmica

Thanks,

C.

Christian Svensson (1):
  aspeed/smc: Calculate checksum on normal DMA

C=C3=A9dric Le Goater (7):
  aspeed: Remove unused SoC definitions
  aspeed: Use consistent typenames
  aspeed/smc: Add support for DMAs
  aspeed/smc: Add DMA calibration settings
  aspeed/smc: Inject errors in DMA checksum
  aspeed/scu: Introduce per-SoC SCU types
  aspeed/scu: Introduce a aspeed_scu_get_apb_freq() routine

Rashmica Gupta (2):
  hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
  aspeed: add a GPIO controller to the SoC

 include/hw/arm/aspeed_soc.h   |   4 +-
 include/hw/gpio/aspeed_gpio.h | 100 ++++
 include/hw/misc/aspeed_scu.h  |  21 +-
 include/hw/ssi/aspeed_smc.h   |   7 +
 hw/arm/aspeed.c               |   2 +
 hw/arm/aspeed_soc.c           |  63 ++-
 hw/gpio/aspeed_gpio.c         | 884 ++++++++++++++++++++++++++++++++++
 hw/misc/aspeed_scu.c          | 102 ++--
 hw/ssi/aspeed_smc.c           | 335 ++++++++++++-
 hw/timer/aspeed_timer.c       |   3 +-
 hw/gpio/Makefile.objs         |   1 +
 11 files changed, 1418 insertions(+), 104 deletions(-)
 create mode 100644 include/hw/gpio/aspeed_gpio.h
 create mode 100644 hw/gpio/aspeed_gpio.c

--=20
2.21.0

