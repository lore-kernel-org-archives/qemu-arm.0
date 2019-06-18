Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3973237wrg;
        Tue, 18 Jun 2019 10:22:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxs7OA3FvI4na+csPodK8Dk0poGxgbreTOEOUMRjN3i8nxFfTkrPNip1bqtna0o1/oWv95M
X-Received: by 2002:a05:620a:5b1:: with SMTP id q17mr29291625qkq.174.1560878543032;
        Tue, 18 Jun 2019 10:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560878543; cv=none;
        d=google.com; s=arc-20160816;
        b=DZZGk2vu5dFkE/6CnwLxjFK1M/LVQSlrTgb3x6sH6qnJGfzKiBhFWlMNUkGmTuyClb
         hzTDudAiiTTvf0ULY6h7sYgj0gPB8EqV+WPMiMohS9N17vYehkYbjSB8ze6AhgBgKa5O
         BRs+qlxZ0PD+ZFQTSCK9UBhBLqFqslA9AHSPTHogvXFpRtwxoJwE3ZeU/7Uc/ln4Da6x
         HAKAHntJoOXAMmOh9c4hfdUfJT2mP3vlcLCllEqZ2aVltSmJ7vNqIzE4AXFgonBgaNm7
         rIoI8FlGinppHPKOT1uNRxV6XjRL+jbAXdLoslNx5ojdOq9QXiq5oJ4Enl700BjVF2XX
         gVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=rHk2E6kKQQvqXbcQJVQ9EBQRqq5hNvCfkwpVgddGxdY=;
        b=tkQzyZZ2tr2mqWMDiwSSqlhHZAZLaNBnzmAYpUKyLqgS1+G1RAahgAcB7ZAUKW//q9
         uYfvIkOnJfl+Y8JtQRy+g5ieuY+173q69WUZOnloV1iLq2WMSQlKt4xc9xTXBX4EAGK0
         uT17joio/HcmNgNr0i0xoLXu0UxwpEghD/F6etMDJM7RyvTjXokFel5S611ePUNhxdXX
         R/uK7eQyjJYZ2uWBrobTMgCNMwqWfggZIFtjGDwokd0TRi1rk9N4tT3lJaQ+/ryTRGzQ
         48zdXnim6Bq0FpWgKfZ+iQrQ5LIorriEPMvWNaeptG2FUhexslknE1kIUHW9Cq0ky8Z+
         Er4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si9789385qve.12.2019.06.18.10.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:22:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHoM-0004lM-Jp
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60637)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHNN-0000L5-3R
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHNM-0004at-0B
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:29 -0400
Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]:58334)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHNL-0004a5-Qk
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:27 -0400
Received: from player157.ha.ovh.net (unknown [10.108.42.102])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E0D8C17FCA2
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:54:26 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 6E7426EB5314;
 Tue, 18 Jun 2019 16:54:20 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:59 +0200
Message-Id: <20190618165311.27066-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1675902012338768657
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.205
Subject: [Qemu-arm] [PATCH v2 09/21] aspeed/timer: Fix match calculations
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ntKnxmz2K7wJ

From: Andrew Jeffery <andrew@aj.id.au>

If the match value exceeds reload then we don't want to include it in
calculations for the next event.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 8d6266b0fd81..745eb8608b56 100644
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
2.21.0

