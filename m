Received: by 10.25.77.65 with SMTP id a62csp332395lfb;
        Thu, 9 Feb 2017 05:49:09 -0800 (PST)
X-Received: by 10.237.41.229 with SMTP id o92mr2589052qtd.223.1486648149819;
        Thu, 09 Feb 2017 05:49:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64si8013458qkc.319.2017.02.09.05.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 05:49:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbp5v-0004aK-3r
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 08:49:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cbp5p-0004Yi-V9
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cbp5m-0001ZV-R8
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:49:01 -0500
Received: from 2.mo53.mail-out.ovh.net ([178.33.254.39]:53682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cbp5m-0001U6-K7
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 08:48:58 -0500
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 2A3F6384A0
	for <qemu-arm@nongnu.org>; Thu,  9 Feb 2017 14:48:51 +0100 (CET)
Received: from zorba.kaod.org.com
	(dslb-088-064-225-204.088.064.pools.vodafone-ip.de [88.64.225.204])
	(Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id C225562008C;
	Thu,  9 Feb 2017 14:48:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  9 Feb 2017 14:47:35 +0100
Message-Id: <1486648058-520-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486648058-520-1-git-send-email-clg@kaod.org>
References: <1486648058-520-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8305482140767390481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrkeehgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.254.39
Subject: [Qemu-arm] [PATCH 1/4] aspeed: check for negative values returned
 by blk_getlength()
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u8I14UYsnagG

write_boot_rom() does not check for negative values. This is more a
problem for coverity than the actual code as the size of the flash
device is checked when the m25p80 object is created. If there is
anything wrong with the backing file, we should not even reach that
path.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a92c2f1c362b..ac9cbd66b72a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -113,9 +113,19 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr =
addr, size_t rom_size,
 {
     BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
     uint8_t *storage;
+    int64_t size;
=20
-    if (rom_size > blk_getlength(blk)) {
-        rom_size =3D blk_getlength(blk);
+    /* The block backend size should have already been 'validated' by
+     * the creation of the m25p80 object.
+     */
+    size =3D blk_getlength(blk);
+    if (size <=3D 0) {
+        error_setg(errp, "failed to get flash size");
+        return;
+    }
+
+    if (rom_size > size) {
+        rom_size =3D size;
     }
=20
     storage =3D g_new0(uint8_t, rom_size);
--=20
2.7.4

