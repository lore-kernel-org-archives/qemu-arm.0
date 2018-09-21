Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3329004wrd;
        Fri, 21 Sep 2018 09:22:39 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZjjo86tjHBfOa6lc7B6UHI78iAGMcY4qNFPUFFXoM4C8NqgrFzmB41q341CbRIre1u/rS4
X-Received: by 2002:ac8:76c4:: with SMTP id q4-v6mr32365407qtr.95.1537546959036;
        Fri, 21 Sep 2018 09:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537546959; cv=none;
        d=google.com; s=arc-20160816;
        b=P7XH4ftzHqqCxHVNr3QHxekgaxuEQpdrHYUVWXsG/dDSoNion635CSqQ6kEYlKNb5n
         z7ySW3fTQbLyFnqymCkyLByLmdrfxwJEHR2hiv8sc1TV0kmVFwBAEhvjN0IgDCO1Dhaq
         JpgUOPPO3NtRHHypDMcJrmvhEiDRcXBHq/8GtpIjCXw++o7U5idSXAz7Vuw4Nre/BW8F
         Lwlsx969H0+Ojb9weZynNYIuW1BvvDhzl5DGa2NoIWxePL95KvMDbD7xtMloRtrOuewu
         mjwki1DtnQzGzUCqdNbwRxiT+uZVUOVGIwcXzFYmpkHEIoDDX2Nw8jkMNl0aiZpqNopr
         Eavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=jTePxVg/fx6nE3BpP0x9z2mpWzgel/yOTGNavWbYPgk=;
        b=Sy+Ssdfg89FQuV0m0G4MNyNcRzIvgmNR/+3KxgSDddEr5YxSlACCRL76MkZFdvnJek
         n1mgFgfVvSYWah4oYFGME5zbPM1kAKHfBKV4SlH3d1yfnDWiX8JI06TBCz5pQfdqHCqW
         cRrc8wWXSphZDyeAh7bYqnkVZnr6PuH1krItsqhZNoiJsGqV6iOPSMe9ZyxW82hKCa5N
         BElkadUWThLv1PeinjN0lHyMwyjWs80vMTacqKHDc7FqAo5oGFB//YW12pBPidzoDgc3
         InTQmWDl7kn9cGDqIYI6NYLqXI6oXkiGX0VV7qALtkpPAED7jG6iF+khuns0jPZb1eqc
         57Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u128-v6si6067177qka.113.2018.09.21.09.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OCU-0005Ob-Ig
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:22:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAA-0003wP-Jp
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OA6-0003lI-A2
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:14 -0400
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:47397)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OA6-0003fK-06
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:10 -0400
Received: from player799.ha.ovh.net (unknown [10.109.159.123])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id F05B1136402
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:20:06 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 758C752008E;
	Fri, 21 Sep 2018 18:19:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:29 +0200
Message-Id: <20180921161939.822-2-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1888697097958689600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.38.232
Subject: [Qemu-arm] [PATCH v2 01/11] aspeed/timer: fix compile breakage with
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
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gUnnUfqNIZ1O

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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

