Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp897418wrp;
        Wed, 25 Sep 2019 07:54:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJHEEq6JniOf5Olrf4fQT1IZNV8O1MXt1rfY/kVsuI6U9pVMeEcWMQZAIKtBImuES+HdL3
X-Received: by 2002:a50:a8a2:: with SMTP id k31mr3322278edc.79.1569423263554;
        Wed, 25 Sep 2019 07:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569423263; cv=none;
        d=google.com; s=arc-20160816;
        b=fgajRQxlWHC2orYG1kyMt9nsfvpDHClokPG6M4t0j36/KXaJ08HbHPAlipcAUNk8LJ
         e75OdsqdMfOBmQhvkpyVdC7oiTSctkuBODGdWq5SMP5U/5YlubXE+QakbjJ4bktHcByp
         Q0k550P63e6G6aVvSNR6Of2K2BaCkt21tOwIBMlSXwpPgUvZHA5mBl6xyJQCOUb3BKyf
         IpixCpW2w7/4cGymsRlUOC4wHNi+496PYZ97mFzz3JSpsaoPCyjxnWMq/FiplDNO64MO
         7Vel2GJ5wpbCTeQEcoMerzYVKYySsq5SXd9eGl7AlD50KmaFYAItoHtQq9X5kjkNaxkc
         7arA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/BLzDi+1xVcDbOlf9Ka21Q+H/NBzMX8bujEiBbrTjqE=;
        b=lKWO/1zBrJGhanAZ6uwTrHIKTaABRlcu3XGd1rj/PbFjkIx3mekzxclc6wouRUywDc
         TXFpkQjGPyyQgTCPwkxJHPmzX/FOMOf2Pa1h2M9e7m7y5kiICk43SjNBtrccXCbuc7R6
         /NhD8nUsyLXSQQON71YAe5gbWlEkR3Z0Bw14WBP9oIcKqRZlMOZ5RxqwXfK6a4LIGg0D
         zgeh3BpCiIzrKnkjfRLu7REDhBuupZ5zUJ5iDZOBjWnLXR7naoeYaR8Mt/d6zr3f+jQh
         fS85B2L4Ef+yH0IDDYXcS1WHnkh+zn4xmqWRUVniCE8DZjfGtld2/tbhdJKIlYtyZSA5
         +ZEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id re13si2722131ejb.279.2019.09.25.07.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:54:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8gP-0006sE-MA
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8Nz-0005A6-Cm
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8Nx-0001do-D7
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:35:19 -0400
Received: from 4.mo68.mail-out.ovh.net ([46.105.59.63]:52061)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8Nv-0001cC-UZ
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:35:17 -0400
Received: from player786.ha.ovh.net (unknown [10.109.159.152])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 1B0DC144B75
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 16:35:14 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 96B72A4D420D;
 Wed, 25 Sep 2019 14:35:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 19/23] m25p80: Add support for w25q512jv
Date: Wed, 25 Sep 2019 16:32:44 +0200
Message-Id: <20190925143248.10000-20-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8872372744048249617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.59.63
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOzdIc+SpKOh

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 47159de3a443..11ff5b9ad7b3 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -327,6 +327,7 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
 };
=20
 typedef enum {
--=20
2.21.0

