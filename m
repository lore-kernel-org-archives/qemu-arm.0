Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp577789wro;
        Thu, 14 Mar 2019 01:43:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbkLlVp0IgzGMkscBAXWVGGjuSDmh1lbVaAYhvZ0Wx1CTho7xACLBmvGBjeqqpq7o6L+Ku
X-Received: by 2002:a25:e6c7:: with SMTP id d190mr39174338ybh.296.1552553033210;
        Thu, 14 Mar 2019 01:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552553033; cv=none;
        d=google.com; s=arc-20160816;
        b=MBwKUa+vshjaGsKB/ilgxjqDPzw6wgNEGAXEtnYz6LeikVm/VWnzvsYMHYg+nv1x9L
         aBwHF1kQJRDQZasvWw0Syb5inqdgTcvC4kFfs9ITxzYSppBdzvyEOiy88SfWipICWNTP
         tRWCkInOAuT90t76pV0rDPJA05UFAglREJWW+9/wg+EQ6qBQhVoO5NhgJzAnsZ8TlacZ
         J4VYhg6968Nd64zQnyOS2pNRvUf1kUvKaOvLTRJdPaOz5hgTXnH0c5yYdsst+5FLN/+e
         k7+G4mi7tADw49h9L6gTbco93r0Jq7zhQxGhpIq72katqPwhiArYk7vCeWTiNUvytOn+
         83Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=d2DEDSt2gQKfZfPcwDqyVM4+9g9V1UIPftEqq/HrRJY=;
        b=NAKXmQdTjEy6cMRnniGIi7wUIAl+y76wM/YXYzeLmZVTissth9UTk2w1seSaHD+uss
         mxlFxy/307gEshW/cqPm42OQqA8d3AvQmVQbh9Qq4hDUsRVTDZ9lZ7gbp/z952rmCCMi
         UcYWy4eKtGg1/m9qDxw+B2bAdOQVVB4HlipYIp590xdH7bfdzmJ0JaLf2XePO15suV4o
         WtaUZY6MvIs5qLLEI/n7mR0ScHKrF+fI7kdjsmpP3V0hcPBdnKPc4IDmAM/vossg2FWh
         g5hMLikomHG84K83q2aF1CTGcGHDtTOKgpNagw6ufr2WwyZrxFXNTC1zY6ghq5g+m10v
         eq7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l85si7842698ywc.375.2019.03.14.01.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 01:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Lxw-0000DU-L9
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 04:43:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4LxV-0008S0-E4
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4LxU-0002mI-KI
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:25 -0400
Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219]:36143)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4LxU-0002iD-8o
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:24 -0400
Received: from player762.ha.ovh.net (unknown [10.109.146.137])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 05E9811D84E
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 09:43:19 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id DFA0B3AA2E84;
	Thu, 14 Mar 2019 08:43:11 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 09:42:33 +0100
Message-Id: <20190314084235.9887-4-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314084235.9887-1-clg@kaod.org>
References: <20190314084235.9887-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1452129406510271249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.74.219
Subject: [Qemu-arm] [PATCH 3/5] aspeed/timer: Fix match calculations
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pxw3vr/t5Z9t

From: Andrew Jeffery <andrew@aj.id.au>

If the match value exceeds reload then we don't want to include it in
calculations for the next event.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 2f8522a597d3..6c184572ea04 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -107,6 +107,11 @@ static inline uint64_t calculate_time(struct AspeedT=
imer *t, uint32_t ticks)
     return t->start + delta_ns;
 }
=20
+static inline uint32_t calculate_match(struct AspeedTimer *t, int i)
+{
+    return t->match[i] < t->reload ? t->match[i] : 0;
+}
+
 static uint64_t calculate_next(struct AspeedTimer *t)
 {
     uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -118,12 +123,12 @@ static uint64_t calculate_next(struct AspeedTimer *=
t)
      * the timer counts down to zero.
      */
=20
-    next =3D calculate_time(t, MAX(t->match[0], t->match[1]));
+    next =3D calculate_time(t, MAX(calculate_match(t, 0), calculate_matc=
h(t, 1)));
     if (now < next) {
         return next;
     }
=20
-    next =3D calculate_time(t, MIN(t->match[0], t->match[1]));
+    next =3D calculate_time(t, MIN(calculate_match(t, 0), calculate_matc=
h(t, 1)));
     if (now < next) {
         return next;
     }
@@ -141,8 +146,10 @@ static uint64_t calculate_next(struct AspeedTimer *t=
)
         qemu_set_irq(t->irq, t->level);
     }
=20
+    next =3D MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
     t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
+
+    return calculate_time(t, next);
 }
=20
 static void aspeed_timer_mod(AspeedTimer *t)
--=20
2.20.1

