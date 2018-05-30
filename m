Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4383097wre;
        Tue, 29 May 2018 23:18:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLluds8ppRtx5A53zMcAFS1jpbxzRIpKWZ4epUZqA715YhCMnvGGCevmd1mCkp2/VxpC9v1
X-Received: by 2002:ac8:24b0:: with SMTP id s45-v6mr1311648qts.84.1527661085951;
        Tue, 29 May 2018 23:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527661085; cv=none;
        d=google.com; s=arc-20160816;
        b=0Do1pCZgZdE8KL/sTMxZq/FtdBN3gJK4DJ/Z3BbqOUZy702QR3/ZfHyQj0qum9IcLS
         sgla+IyYQbSnzxH31Q2qx0FCBKdPQsy3OicrCDl6aN94yHsUrCN1Eh9O6iLyXhbxzTOi
         EJbydTUG6t9agJxlt1nt5pI94vnTvBe4x9s2NzWxPcgzQm1KR4ihf3Ot0P0uEnnaIVur
         36JN9yeNeEYJlYCbgqkTYVcTXu2XuRF5hSDkuWkDsKJAEErXUp3zcW5ut+EurHiOgdAw
         OpxmTJ2D2mWEOrarmmZg2eIGUYnzey6EYPk1uG62HGHf3YTWn86DHdIYGFLuADiWgmxW
         +x/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Sq7jFLj7BNVukxMLpkmCjfIFcUtVklM+eb3t/AzZTMg=;
        b=tEKn+gLjffOto+1g/Zos3q2wT5VJIR/EkvOmEhM3jD5vemKKRarSgNJB6uB9AFwS7Q
         FqbhJ4yfhgsaVFwicFSW1DmIx/6xNnnOvjPgumm8ThD19FSCxuWrERNJ8LDtleOZiNzP
         ci9dWPE/7NyXUqvjq2E/upA9SUGoPNTqcG/pscDcy+Gu9VXSXE8m74cHCfUvXe+6Cad3
         ilfPbnZrNsKsc+k+aHhE8S4zYQMhI36iKAcU6gw+OyNKPDBm+ZRq7anFFT9USDMoCDLv
         /jR/ApRBxIdYJvxFJGLzuTvmK1j5p2FRcUYD8yKOWLOotkGxsrS6VZOvtQ9w/5vloZbC
         OS9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k188-v6si3115129qkb.338.2018.05.29.23.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuQv-0002Ht-C3
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:18:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQX-00029m-L9
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQU-0001Fu-GB
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:41 -0400
Received: from 10.mo69.mail-out.ovh.net ([46.105.73.241]:36280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNuQU-0001FY-9N
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:17:38 -0400
Received: from player718.ha.ovh.net (unknown [10.109.122.17])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id DCC9616799
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:17:36 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id 9F07C4E0083;
	Wed, 30 May 2018 08:17:31 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 May 2018 08:17:10 +0200
Message-Id: <20180530061711.23673-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530061711.23673-1-clg@kaod.org>
References: <20180530061711.23673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4755801209291443199
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.73.241
Subject: [Qemu-arm] [PATCH v2 3/4] ftgmac100: fix multicast hash routine
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
X-TUID: 0LFmtafBmR5Z

Based on the multicast hash calculation of the FTGMAC100 Linux driver.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index abf80655f28f..8a7f274dc118 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -776,8 +776,8 @@ static int ftgmac100_filter(FTGMAC100State *s, const =
uint8_t *buf, size_t len)
                 return 0;
             }
=20
-            /* TODO: this does not seem to work for ftgmac100 */
-            mcast_idx =3D net_crc32(buf, ETH_ALEN) >> 26;
+            mcast_idx =3D net_crc32_le(buf, ETH_ALEN);
+            mcast_idx =3D (~(mcast_idx >> 2)) & 0x3f;
             if (!(s->math[mcast_idx / 32] & (1 << (mcast_idx % 32)))) {
                 return 0;
             }
--=20
2.13.6

