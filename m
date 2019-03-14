Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp580707wro;
        Thu, 14 Mar 2019 01:47:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxz08ryb3rM0YI45UM56qzGyDrjBdlf2zTmPQRieVJ8xDxWkoeeqdyJIp5tAS/SeGx2EzrB
X-Received: by 2002:a25:1909:: with SMTP id 9mr38506395ybz.420.1552553266416;
        Thu, 14 Mar 2019 01:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552553266; cv=none;
        d=google.com; s=arc-20160816;
        b=V/V0NeSDEGuFRUiAODxYUjyVtBeDeRv7jisMRCB9StFdtBxUwdGyPHo4IrQ9BT/pIA
         93ZOgMlWjWvMf5tJ6oBy4KeQc+CkPphv0d197FE90I7/RQLpAAiPoe4804QNWPblQe2D
         Wp39PgAP2kxqIGfWTUFJSn66dmaeNQSp6/v8ZGHQwX+AD3eq9c8uRuH4k75B6LlIkEGG
         Ti+4NfYUVUPf0sUpK1QdVycp8V43C+ALvzankltgSayvr0u+C8baHNr/p7GCvEjfAN1N
         h50xg/y1+ueKvLDe1xV+iQeqcChH0c5cPCAxskEVR31prB6NhLgVTWIPIXO0HUSK1Qal
         YixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sclUdOM/n4akzhwoc57IlCC76RBsshdZ1NHGR/aJqX8=;
        b=Rn/+g/SLY1aIm5nbccGZgXq3tVJAKI6tEg64niweZZzT6McX9ZE1HlLYw6/uIdk23Q
         nA61Vpsgfws8ve22OpFRj6vuLngAUMjJlwq8fiB4UxWaRrhVRxP6pW0ZtyAP+GyZm39T
         IkhnmcViPguG4MS8B+Vy5onGGGlAxUAHbvMMfj/99ebLg5sm6IudzgvE5a0MP6PPOnzQ
         h/05/wieaC0yjTu8SlhM2bDoZO5zX99h5nCDg6CmtrUWCc/FjdjHmWB8A3ea9Cjd/Q9v
         WKlpLj8hA2hRNfaO1VphP3duxpAgQ6PUw7yLv7d1Wb3y35KeAWPGunLZmJKHGOmfMztp
         ID2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r133si8077349yba.375.2019.03.14.01.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 01:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4M1h-0002bp-Rd
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 04:47:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4Lxy-0000Qf-10
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4Lxw-0003Wi-Mp
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:53 -0400
Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167]:56000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4Lxw-0003CK-Fc
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:52 -0400
Received: from player762.ha.ovh.net (unknown [10.109.146.50])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 2F18621E57B
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 09:43:41 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id ED9083AA3031;
	Thu, 14 Mar 2019 08:43:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 09:42:35 +0100
Message-Id: <20190314084235.9887-6-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314084235.9887-1-clg@kaod.org>
References: <20190314084235.9887-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1458321854415735569
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.47.167
Subject: [Qemu-devel] [PATCH 5/5] aspeed/timer: Use signed muldiv for timer
 resets
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
Cc: Christian Svensson <bluecmd@google.com>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i1xqwTtu2JXR

From: Christian Svensson <bluecmd@google.com>

If the host decrements the counter register that results in a negative
delta. This is then passed to muldiv64 which only handles unsigned
numbers resulting in bogus results.

This fix ensures the data being operated on is signed before it is
ultimately casted to the final unsigned value.

Test case: kexec a kernel using aspeed_timer and it will freeze on the
second bootup when the kernel initializes the timer. With this patch
that no longer happens and the timer appears to run OK.

Signed-off-by: Christian Svensson <bluecmd@google.com>
[clg: - checkpatch fixes ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 9988b8fbbf17..0b16eac8970c 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -275,7 +275,8 @@ static void aspeed_timer_set_value(AspeedTimerCtrlSta=
te *s, int timer, int reg,
             int64_t delta =3D (int64_t) value - (int64_t) calculate_tick=
s(t, now);
             uint32_t rate =3D calculate_rate(t);
=20
-            t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
+            t->start =3D (int64_t)t->start +
+                ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
             aspeed_timer_mod(t);
         }
         break;
--=20
2.20.1

