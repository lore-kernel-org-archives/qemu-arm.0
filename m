Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4330312wrg;
        Sat, 25 May 2019 08:34:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBjxSLbKa/Hk2A5WRYgZXYzHr8cW8jzbql6s7S/nKqfWdfvYu6KaCaW9DIAV5TR80529w4
X-Received: by 2002:ac8:460c:: with SMTP id p12mr87187594qtn.255.1558798488445;
        Sat, 25 May 2019 08:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558798488; cv=none;
        d=google.com; s=arc-20160816;
        b=d4UVCZOVCREBfrBEetE8Lm+rXyo14yVJ94qvhDppYLWc8w/dedbCUxg7djRUtHmKOf
         6DB+LEOPxgVoonWkxrFaBdwt3MmcbTxFKGE2r+B0RPXO/YwQW3gIQGys8v+D9KGh2c/m
         qRuty0vlGw4M8wuZm5aTKEC+u1frUbslHo0kNlF5bv/fJGwxkC3BXcLb3efmNiFF3cin
         aDqErh4VPSX/Cci4khriKNxKtGX5awhN69fQq+T4z5hRxvpYVyjiQn1XwP503Kd4g9Rh
         3GmDd3ZEuwNmqClypbcy5LQR2nz8d9X2WxVty1kBfmvQisfWIQL59GSCn1PivabZWOBf
         OkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oWt6bH68lFFjSl5O9wZXIONq8VqxJwr3vFO+elmRkfg=;
        b=pV6iQk8t+zBAn2eYe7z+P2UykCf2PBHx9lGM6/edZjCdPow7dBzDHJ6Wrs0DDGZ83m
         S+p2cKBifdpVOQkScsbpiwUo3LhiKdhKJInRAAQVDq2p3FeFm/lXdpFk6ZChiMEtE8QP
         O0EXYzFStpNkvOLeBVDBNc7kwE/fZpqsJb1MDvlLlyTszvVGpds/n0T6hB4SAGd/vAjt
         npmZ0T6evSVkw47gnBCogucJ2LOQ7RWQrXVYdKbxJZIhb9EXEkncZ0mMATlE30fplkba
         EVQKdGE+zyi7N4Kx9taLFsnuqk50eAetCGhI+BlD3+8DTd5qo9Yf54GJPPNpTsngS/sV
         qEAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 32si2913997qtc.25.2019.05.25.08.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYh5-0001uG-T9
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:34:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYe5-0007y9-Ra
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNF-0002LQ-Vq
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:18 -0400
Received: from 8.mo173.mail-out.ovh.net ([46.105.46.122]:43104)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNF-0002Kp-QS
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:17 -0400
Received: from player698.ha.ovh.net (unknown [10.109.146.240])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id EC1C8108339
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:14:16 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 77D03625A823;
	Sat, 25 May 2019 15:14:09 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:34 +0200
Message-Id: <20190525151241.5017-13-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6613536056988568337
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.46.122
Subject: [Qemu-arm] [PATCH 12/19] aspeed/timer: Ensure positive muldiv delta
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
Cc: Christian Svensson <bluecmd@google.com>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UIZnucgYAfbI

From: Christian Svensson <bluecmd@google.com>

If the host decrements the counter register that results in a negative
delta. This is then passed to muldiv64 which only handles unsigned
numbers resulting in bogus results.

This fix ensures the delta being operated on is positive.

Test case: kexec a kernel using aspeed_timer and it will freeze on the
second bootup when the kernel initializes the timer. With this patch
that no longer happens and the timer appears to run OK.

Signed-off-by: Christian Svensson <bluecmd@google.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 9988b8fbbf17..53b70f859c86 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -275,7 +275,11 @@ static void aspeed_timer_set_value(AspeedTimerCtrlSt=
ate *s, int timer, int reg,
             int64_t delta =3D (int64_t) value - (int64_t) calculate_tick=
s(t, now);
             uint32_t rate =3D calculate_rate(t);
=20
-            t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
+            if (delta >=3D 0) {
+                t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, ra=
te);
+            } else {
+                t->start -=3D muldiv64(-delta, NANOSECONDS_PER_SECOND, r=
ate);
+            }
             aspeed_timer_mod(t);
         }
         break;
--=20
2.20.1

