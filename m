Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp663621wrg;
        Mon, 20 May 2019 14:44:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3x0JEy5mRLRh0dLrK7wTRKrmQQIBvpLW9G3ekdgXy9HOpmhhKG9tCZQQk8O+mqScv1xSs
X-Received: by 2002:a50:b39a:: with SMTP id s26mr72640400edd.39.1558388658321;
        Mon, 20 May 2019 14:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558388658; cv=none;
        d=google.com; s=arc-20160816;
        b=N8Oz9FgA4wJY7OTWRrI53qpghCxrTjNWPY2gHuQX522fqIEm1tVusQjtR20iBAJZgt
         LzJYgyIyxRsxflXFCR/h1KKVDxjSAEWMEKOoUbD9eRhOOH9chVlc5DNrqf5bPHcNnnuZ
         /QcLr58+SMGWhYXlc2HZitJtIMXDkKnaFj1U1lhd2CHXnOhwDdbb3aALgW8FmcYwiCJW
         /GwClVDkR+6HgfWYpY+24jGh+49HJ93O0pdO3+Yd9iTzcvNuJtVFlgeA/sYUg/uCq6+k
         SuYhlZ7jNhjYj7MDgR8Hx6dr84IMzbmfSXQxXJoVAsfzGXuc8fKJ0TM86eM7y3W8wSNu
         D6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=JDwz3F2xr+8UcE0jEjnfiyWiljU3Q6hyC6le2MTCT+E=;
        b=okRGbR0KsLQFwY8z+KGp8kDxn/7ZI8fwnGCefeVq/q0goy51ngUfVsCB5hcCSKA3NX
         6zUJ2tDPYI2gR/mspoCdL3Ks1sCzN0IjH3TaF7CEqGLG5nLwy7F8o4AcN/ev8w8n0p62
         cAlfLjsdhymk4OR1xRuJOYrOs7pTwLe/Jv2mbRpLnHdW+BA34aqwMmpMsHrwUM7n/fu1
         5kw90d6jpAOPQb5VEIISHQJIoWVcY9nnO1Vpx+fe9xVeVFF72RuDeYT0Qb9nvi2sR4om
         yR1PRsMjjMvh2rRqH51X2iRdgJ9N+MNXtXPMADs0x2+mkupyS6A6praVx9Scto8eWiyg
         Y/HA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26si3872785ejc.103.2019.05.20.14.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 14:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSq4v-0007St-AQ
	for alex.bennee@linaro.org; Mon, 20 May 2019 17:44:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4e-0007Qn-LM
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:44:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSq4d-00009l-Or
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:44:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hSq4d-00009M-JL; Mon, 20 May 2019 17:43:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7029308220B;
	Mon, 20 May 2019 21:43:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8819D1001E6C;
	Mon, 20 May 2019 21:43:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 23:43:40 +0200
Message-Id: <20190520214342.13709-3-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-1-philmd@redhat.com>
References: <20190520214342.13709-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 20 May 2019 21:43:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/4] hw/arm/exynos4: Use the IEC binary prefix
 definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: McVa2gQM2QNl

It eases code review, unit is explicit.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index f0c24b7992e..f824eef0d36 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -22,6 +22,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
@@ -60,8 +61,8 @@ static int exynos4_board_smp_bootreg_addr[EXYNOS4_NUM_O=
F_BOARDS] =3D {
 };
=20
 static unsigned long exynos4_board_ram_size[EXYNOS4_NUM_OF_BOARDS] =3D {
-    [EXYNOS4_BOARD_NURI]     =3D 0x40000000,
-    [EXYNOS4_BOARD_SMDKC210] =3D 0x40000000,
+    [EXYNOS4_BOARD_NURI]     =3D 1 * GiB,
+    [EXYNOS4_BOARD_SMDKC210] =3D 1 * GiB,
 };
=20
 static struct arm_boot_info exynos4_board_binfo =3D {
--=20
2.20.1

