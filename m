Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp441955wrd;
        Fri, 31 Aug 2018 03:39:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaxLpJYjuKOaXk3JOom+568odctKZke1lg/9P9fpSW+gqNjm+lY4FpETXT5U8zAtFDh6fUY
X-Received: by 2002:a37:174d:: with SMTP id i74-v6mr1290851qkh.106.1535711988737;
        Fri, 31 Aug 2018 03:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535711988; cv=none;
        d=google.com; s=arc-20160816;
        b=fzc+Z0UruqxX3gMVuty7XbdcIK6FhxxjKcmCO6hM40yMcc30LjiHPG68JpE/2ksqAz
         LZNeBUfhVkPCANEsEEtJXpiUKA0Cy25HM3WBxQqyqZ8e+Sx/lbF4644TPGwnRpA1mBu7
         DrOLMkosQQvXdnboaaR4sE5x/Nk/E487+JtuFUc5Z16et0jtt8uoa7o+MFp1YbL6+8zx
         6cyCkCvmmEiKZnb/AJwDHZsDLiEwG2xrzx9aVWzzqgIbTV7a3rQYQwVZDTjVy5QSxMx/
         wlDP52METWgzyPl8Caqb0LNpJTi1c5uQKtVh1mDQi4pK4+/6lB9cFzgG70U7QezkU521
         89Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DUuTjZ+y1RO0hrdwvn6+kKI7ACRumD3qAtXlL+aq32U=;
        b=hsE7t18ppAaulmXKsXSVyItKd68M8BTBebDi/wPfZAHHnshlfvUdc1GLBvS5rKl58Y
         feh1sxt+L+RZvUyDqQHrnoKlYq5ihlEA8w+Ga4WggXx9ItZfPtWMo68jCVKVFMjyJhme
         HzjaRH9cyH+F5hU9iVV+qtjSGBfVh2xSjM8Yf6NHr4NieW1X3EsNx5MzXrZf5k+OeJaD
         CPCACMQGoEOeSK5jfDwgK7r6oJUNjTh6G4tPPlKiAdNXD9VZwLVL/Tdufy0C/SjeDLu2
         tYvHMMSG2oBXWB9QzVGlFngKYkZO0xzobm+Vmd3vSN9mvoet1N9oEeX6JiprmLsX/3gE
         AB3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10-v6si7756283qvm.97.2018.08.31.03.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgqC-00032b-5t
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpG-0002gU-NH
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:38:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpD-0001eX-Fp
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:38:50 -0400
Received: from 15.mo4.mail-out.ovh.net ([91.121.62.11]:50468)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgpD-0001eC-9Q
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:38:47 -0400
Received: from player168.ha.ovh.net (unknown [10.109.146.5])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 05D6C1A3BA6
	for <qemu-devel@nongnu.org>; Fri, 31 Aug 2018 12:38:45 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 46F644200AD;
	Fri, 31 Aug 2018 12:38:37 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:09 +0200
Message-Id: <20180831103816.13479-3-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1924444419654781760
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.121.62.11
Subject: [Qemu-devel] [PATCH 02/11] hw/arm/aspeed: change the FMC flash
 model of the AST2500 evb
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ElrE0gxtRIUU

The AST2500 evb is shipped with a W25Q256 which has a non volatile bit
to make the chip operate in 4 Byte address mode at power up. This
should be an interesting feature to model as it will exercise a bit
more the SMC controllers and MMIO execution at boot time.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bb9590f1aed1..f2d64e45511a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -105,7 +105,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
     [AST2500_EVB]  =3D {
         .soc_name  =3D "ast2500-a1",
         .hw_strap1 =3D AST2500_EVB_HW_STRAP1,
-        .fmc_model =3D "n25q256a",
+        .fmc_model =3D "w25q256",
         .spi_model =3D "mx25l25635e",
         .num_cs    =3D 1,
         .i2c_init  =3D ast2500_evb_i2c_init,
--=20
2.17.1

