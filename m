Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4450109wre;
        Wed, 30 May 2018 00:51:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIbVNK+9Nqs3mqUfKEQhTz6tRVqAuE5ccUEunTnZhyDdeu6a7fQDZYezvvcd+zWst77lMHM
X-Received: by 2002:a37:1981:: with SMTP id 1-v6mr1354238qkz.389.1527666679980;
        Wed, 30 May 2018 00:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527666679; cv=none;
        d=google.com; s=arc-20160816;
        b=LQ0SYlCklY4nPLrtImBRvNNxgvqMKtRjsn1LTV1pP/Kkoh9klsUfvld335nZwBYfAB
         oR5EcDiAjPqcs8fKCUAd3mVLComc2iJBj6dsO5CfCX7Gd0mdefRCwMI8ysl4PD2+tLiH
         b/gnDe7X8E3piljDl/aagl6YsWVQJ4Nj4SqGvOijr8PirxmclWXYKni+ppdDn532wFEl
         V07zTXtaswmlTWY28+GNgA3vu7GOhhyoYplBXAnZHQB2G4a30GtHFYiH6/w2FMqk0RgV
         +oUNW4bxNselTzuwdjxNxOEsoqFZyPKISRCkT+hZJlrvJocaRrDO03haHJLh8jGKZ8QD
         iKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=J9sBA3w2a7q1hzofRLzw/JaLRFBBpo0zNbLszEDobMs=;
        b=AbaJxrEJ2akmhsyAHiXya9jbDY8Pon6N/NZ+9WOnmszyd4wLRGfkIXHRiG/4fWx+TX
         WjYmdiAutQvYQUPr9dmoloJRs32w4UTibMKMcUAqOlfvzoe6aNoBFI3V2VLbgYLmKqJ6
         ejzw06L4iQHzxeXzyChWT/PWLQ8taNzuRxXLDsIpu6MoyXJsRaQGoqVRA5EM8rpPcKQD
         Z/eDbcV1fNZoy3yoRJUlCsR0b3/peNiKI8XigxSrWWa9bahpYOXgaQ30RVyLZXYLW1sk
         YDf5C90hJrr1/0nNWW10XHWUXH3gTWoAlHKBGHfjn2YcqzwRiRCBWLFvl1iek/V6E/bp
         cdvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9-v6si5199367qtc.88.2018.05.30.00.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 00:51:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNvt9-0006j8-Dt
	for alex.bennee@linaro.org; Wed, 30 May 2018 03:51:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvsG-00065S-MM
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvsC-0001AB-KI
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:50:24 -0400
Received: from 10.mo7.mail-out.ovh.net ([178.33.250.56]:51938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNvsC-00019d-8C
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:50:20 -0400
Received: from player770.ha.ovh.net (unknown [10.109.108.30])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id C4CF7AB196
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 09:50:17 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player770.ha.ovh.net (Postfix) with ESMTPSA id 75A69C007F;
	Wed, 30 May 2018 09:50:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 09:49:59 +0200
Message-Id: <20180530075002.4618-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530075002.4618-1-clg@kaod.org>
References: <20180530075002.4618-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6321083555602139921
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.250.56
Subject: [Qemu-arm] [PATCH 1/4] aspeed/smc: fix HW strapping
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c1FfBZ6aMuQC

Only the flash type is strapped by HW. The 4BYTE mode is set by
firmware when the flash device is detected.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 5059396bc623..f33ec87fcb74 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -632,23 +632,17 @@ static void aspeed_smc_reset(DeviceState *d)
             aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
     }
=20
-    /* HW strapping for AST2500 FMC controllers  */
+    /* HW strapping flash type for FMC controllers  */
     if (s->ctrl->segments =3D=3D aspeed_segments_ast2500_fmc) {
         /* flash type is fixed to SPI for CE0 and CE1 */
         s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
         s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1=
);
-
-        /* 4BYTE mode is autodetected for CE0. Let's force it to 1 for
-         * now */
-        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED0));
     }
=20
     /* HW strapping for AST2400 FMC controllers (SCU70). Let's use the
      * configuration of the palmetto-bmc machine */
     if (s->ctrl->segments =3D=3D aspeed_segments_fmc) {
         s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
-
-        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED0));
     }
 }
=20
--=20
2.13.6

