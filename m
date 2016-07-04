Received: by 10.25.21.96 with SMTP id l93csp1492388lfi;
        Mon, 4 Jul 2016 05:21:36 -0700 (PDT)
X-Received: by 10.55.110.65 with SMTP id j62mr15981006qkc.112.1467634895553;
        Mon, 04 Jul 2016 05:21:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q38si1885972qtb.16.2016.07.04.05.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK2sY-00084J-QC
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:21:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2qw-000719-PA
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2qs-0003lf-8p
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:19:54 -0400
Received: from 14.mo3.mail-out.ovh.net ([188.165.43.98]:59745)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK2qs-0003lQ-2F
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:19:50 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 351A3FFB08F
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 14:19:49 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id B2123480093;
	Mon,  4 Jul 2016 14:19:41 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon,  4 Jul 2016 14:18:53 +0200
Message-Id: <1467634738-28642-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467634738-28642-1-git-send-email-clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6081266874834455313
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.43.98
Subject: [Qemu-devel] [PATCH 2/7] m25p80: add mx25l25635f chip
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, mar.krzeminski@gmail.com,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bujhxp1h8K/k

The Macronix chip mx25l25635f used on some OpenPower boxes is very
similar to the mx25l25635e. They share the same JEDEC identifier but
the WRSR instruction requires 2 bytes in the mx25l25635f case.

To prevent some warnings on guests, let's introduce a new chip
identifying JEDEC 0xc22019 as a MX25L25635F chip.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index d9b27939dde6..aa964280beab 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -199,6 +199,7 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
     { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
+    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_=
32K) },
     { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_=
32K) },
@@ -991,6 +992,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             s->pos =3D 0;
             s->len =3D 0;
             s->state =3D STATE_COLLECTING_DATA;
+            if (!strcmp(s->pi->part_name, "mx25l25635f")) {
+                s->needed_bytes =3D 2;
+            }
         }
         break;
     case RNVCR:
--=20
2.1.4

