Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4383105wre;
        Tue, 29 May 2018 23:18:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIoEPi2PYXh6+jClA69g2KJTpXOdipuALP/DDLvW6XafVfwH1oqnKtjdvnKgPITdeIrUyok
X-Received: by 2002:a37:6151:: with SMTP id v78-v6mr1238681qkb.134.1527661086191;
        Tue, 29 May 2018 23:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527661086; cv=none;
        d=google.com; s=arc-20160816;
        b=sFc9zTirNN0bdw0Jc/kyPPhvw4jJdqqQjRuFJkFeIahNyKS8iqpaNMqTWtaYgWMgp4
         CcBL8tqlwkMGZfU4W4KQfkHUTmVGuercOqJzgc5k8sw0HXuKKxM1UFMLHYcwFzkg7+jO
         DEqmXinzC9M+GemTjav5txPh7jQpj61sLTSMb1oskVTaUTC3vukJtdQdnFnqJelfKQ0R
         vY+qt74cxdZaFuPaB517kw6+ScFQPS9WT6vysu2prMx26Uq0ibnFSryeLd7hMawsVMyZ
         AsE757Lobqr2ulbQ5nSLgobSWmIsj4W6aw9PHbFZiyAw8/lnrxUJvECXFJAXzG2i74Rq
         8NHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=PwteM92QWDZMmTZc88S0S5qZVTR0Ib1itwjwBdVVZs8=;
        b=tTeI9EsQIdvPnXCm1aHGAaf+c0XyUjQcyBDNw+/qDEHIYnR6/Yq1KjEQ7TZ6LkW66a
         7kyOKhQRBF2gZ0g2RXLOwPG3S1pFmTob2vY2/Hf0TodBkalE+2Kx3bsIePhgIT/0v0eA
         I+9bHTrzkCcwHQAFoj5KJ2gB7lu1LJ3mZ726lYp5eDYEqOL1OWKNr70OGxDp1x6r4W5O
         VLIxdO9MwUXcB2cSjSiV8Ib+OZqAlK4ceFzzJMincAgpLkJdArtSHuLJmIuwG9YWZOle
         pBHyHceWZD6o2Ckg5090V2O5RXzqWLNFc6Vku0TsrXkFVjjJPEubBu9LMNKQh1X3kChc
         W5kA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h6-v6si5886678qvo.152.2018.05.29.23.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuQv-0002Hu-LR
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:18:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQe-0002EZ-Fw
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQb-0001J0-Ck
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:48 -0400
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]:36640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNuQb-0001I8-67
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:45 -0400
Received: from player718.ha.ovh.net (unknown [10.109.105.51])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 645861B7CC8
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:17:42 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id D1EA54E009A;
	Wed, 30 May 2018 08:17:36 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 May 2018 08:17:11 +0200
Message-Id: <20180530061711.23673-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530061711.23673-1-clg@kaod.org>
References: <20180530061711.23673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4757490058662743039
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.182.191
Subject: [Qemu-arm] [PATCH v2 4/4] ftgmac100: remove check on runt messages
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
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QDuBpol/xIwq

This is a ethernet wire limitation not needed in emulation. It breaks
U-Boot n/w stack also.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 8a7f274dc118..909c1182eebe 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -822,12 +822,6 @@ static ssize_t ftgmac100_receive(NetClientState *nc,=
 const uint8_t *buf,
         return size;
     }
=20
-    if (size < 64 && !(s->maccr & FTGMAC100_MACCR_RX_RUNT)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: dropped runt frame of %zd by=
tes\n",
-                      __func__, size);
-        return size;
-    }
-
     if (!ftgmac100_filter(s, buf, size)) {
         return size;
     }
--=20
2.13.6

