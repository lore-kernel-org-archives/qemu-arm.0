Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4310512wrg;
        Sat, 25 May 2019 08:14:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3CxT7PMdmB5msttKUhmW/zTg8N03/Cu7mDDBWxnYT4kqfsos1D9aNHOSgt3Jxj4IAhZA2
X-Received: by 2002:a1f:bf95:: with SMTP id p143mr5869890vkf.88.1558797277194;
        Sat, 25 May 2019 08:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558797277; cv=none;
        d=google.com; s=arc-20160816;
        b=x+Z3BIDDoxPJfMtmKKZ27Y5mMIj2rc8rOebkycPa/01KnRAeaR2qpBsufr3bn8u9pd
         dhYi/7SXBOahq2BGUi6+UDSGPxV5n/TRdmZG7FlEgRe995bgojYADiLpjdiviiY0I6nl
         b3klPHvLK9I6Ty0r5emcrj6tLTiTFf1Fftp+IEsHymdUOHNBtP6+/mu8Xl+dQJAqNCPw
         slpg/GJq9TpDC9b/V1VzF05HJyQGjUc5QnpcnN2ViOLhu7tg6wzkvAEQDwnK46alrbfT
         4HyUZKYzOTKqgCeD9HTH+LGawfe5lQTMY5q1P8nAREXex5YKVMRUM7R7RWuEa5PxEpkW
         Q5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=d2DEDSt2gQKfZfPcwDqyVM4+9g9V1UIPftEqq/HrRJY=;
        b=e4lr9e1waIJ2mougXso1vrtS+p9gan1onHCEK9BPZovKwlbfhRulBrxmlySdf/UKkh
         48PB08hTc+9UukDcIZveBzEfs/kbwjsqXtnlVAkS3PIDq0ELJIFxXn2jMxpo72cgurPO
         3pZ56xk8MB7HW/Dx5nx5JLJsRvWMefh3+Z5jKQBpjNa7Fd1wPLWnkA2FxbiAZr3mxw0L
         LuNw9DaCbgOAOjrrtJaeeza/EwgOKOS7iV9SAbnB2F8IDicBakZyzlycEMp6KN6rgotZ
         badcdHWM6dY8P3bj8OoqdR2HAXyuebKFA69bPj+h88B5qBfjiF+fbXKReTerCLBoUIF8
         uqEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si1872220vke.24.2019.05.25.08.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYNY-0006M9-F9
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:14:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYN4-00067V-E2
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYN2-00020L-LX
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:06 -0400
Received: from 11.mo6.mail-out.ovh.net ([188.165.38.119]:46162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYN2-0001zQ-GK
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:04 -0400
Received: from player698.ha.ovh.net (unknown [10.109.143.223])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 2E4DB1CC226
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:14:03 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id B45E8625A7DB;
	Sat, 25 May 2019 15:13:56 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:32 +0200
Message-Id: <20190525151241.5017-11-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6609876878724664081
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.38.119
Subject: [Qemu-arm] [PATCH 10/19] aspeed/timer: Fix match calculations
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
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCbPwxM2poKW

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

