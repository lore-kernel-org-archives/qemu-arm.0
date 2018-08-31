Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp441323wrd;
        Fri, 31 Aug 2018 03:38:57 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZVavkAcgCQmV1aD7gKaBaNbPyk4RHOSqraxCIcPs8sOKxlGWu4oVAsVAGdFBnAG+fNXGx5
X-Received: by 2002:ac8:4649:: with SMTP id f9-v6mr15653586qto.34.1535711937021;
        Fri, 31 Aug 2018 03:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535711937; cv=none;
        d=google.com; s=arc-20160816;
        b=za9nc1HDTo5tXxRHTamVWB9Jcw90TL4thBKGtSJoHwFa+1/KK40XkI4s/cXZuP0Rqv
         oM+dh8x6aW6gD0FaP2metYZifFS4BBjj76AORCIJ46exeXEVZ6S/1QR6b579hbym7oCz
         pUvKI/wwHb07uQ20CkKis2brfpMOqVf371G/X67CIIUDUq7+k1xga1uc7dFObzjZzwA3
         P/kVLWU2rB5ll1S51kNYvpRx8xYtIrVfZY5Ntn1jP+IGgGkp03XMcNZp3Ug2mg+JugT1
         1UGcuTXPb3XGY1O3KpYpLG3oRVkOycDYQ4WM1FHgFA9g5SPtN/9NRCwImeiMZ/AhIX0p
         Y0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZOhj3FCmCEMnJZ4nInefRIItrO63nnEyc0FIUvTHWk4=;
        b=MDyW3pbx2QNNmVsFWhEVnKII11W1SR6VahC7/5DWkj+0rv+PdLVuhMFpk+qWAo+FNf
         bhWxMyRhYfJP7JrTyHhHntRFBS3GwWCb0tWBwGGDfcJnbpp1pTVn2Rt3rVfKRU/v1jo7
         UwMjX2DRiKakUEUsL/D9axLbwvnC9LIyPO+SJAggm+9q9ShuvBXgihZICJcz06esiPEM
         gTTzh3DACVHo6tzsCROZ3/qF8nV/omzc9bVzGoJXwopKZyEh4CjwD8a7Ht25rtG8gaTU
         Np3XdNXc1OL5eWKDHOLohDVySRb6Umb7WiWd+5hpBeEierTQBH8EOcCvx/z5SGJvp43s
         yzQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n124-v6si2090931qkd.291.2018.08.31.03.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgpM-0002d8-FM
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:38:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgp8-0002ah-0g
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgp4-0001aK-PA
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:38:41 -0400
Received: from 5.mo173.mail-out.ovh.net ([46.105.40.148]:59655)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgp4-0001Zu-Ib
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:38:38 -0400
Received: from player168.ha.ovh.net (unknown [10.109.160.5])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5234ACEFE9
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 12:38:37 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id F0DF94200BF;
	Fri, 31 Aug 2018 12:38:28 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:08 +0200
Message-Id: <20180831103816.13479-2-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1922192619341974336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.148
Subject: [Qemu-arm] [PATCH 01/11] aspeed/timer: fix compile breakage with
 clang 3.4.2
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m6Tt02+P3eBn

In file included from /home/thuth/devel/qemu/hw/timer/aspeed_timer.c:16:
/home/thuth/devel/qemu/include/hw/misc/aspeed_scu.h:37:3: error:
redefinition of typedef 'AspeedSCUState' is a C11 feature
      [-Werror,-Wtypedef-redefinition]
} AspeedSCUState;
  ^
/home/thuth/devel/qemu/include/hw/timer/aspeed_timer.h:27:31: note:
previous definition is here
typedef struct AspeedSCUState AspeedSCUState;

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h | 3 +--
 hw/timer/aspeed_timer.c         | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index 040a08873432..1fb949e16710 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -23,8 +23,7 @@
 #define ASPEED_TIMER_H
=20
 #include "qemu/timer.h"
-
-typedef struct AspeedSCUState AspeedSCUState;
+#include "hw/misc/aspeed_scu.h"
=20
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 5e3f51b66b43..54b400b94aa9 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -13,7 +13,6 @@
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/timer/aspeed_timer.h"
-#include "hw/misc/aspeed_scu.h"
 #include "qemu-common.h"
 #include "qemu/bitops.h"
 #include "qemu/timer.h"
--=20
2.17.1

