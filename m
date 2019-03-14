Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp578682wro;
        Thu, 14 Mar 2019 01:45:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy04z5KIRjafkM/sy6fOWn6fEyoB/gNVvrxLp5Y3ovehGkN2Ke68E5IJ7oZa0s0JLlRb4LH
X-Received: by 2002:a25:7658:: with SMTP id r85mr23629669ybc.368.1552553111733;
        Thu, 14 Mar 2019 01:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552553111; cv=none;
        d=google.com; s=arc-20160816;
        b=qcmyGoJx6KrY9stheOLnoAT9B+BT0CnUbJk7U3uUdb1y0lB4o+NS7o1zWzwHp/cZlw
         Os+DpNobZ0wskQ69PIGESunbQRQccyluHr4LSBlFg1M+gcHp+oo+ThjpROFAorrbS5hk
         t9Nuo9EyHM/IRAQo6yxt8rYaLJmEhuUN+6uuRRzsQ3gaFGCZ6+Vm7kqBq0U1fJtTZZ+6
         QziE0C0T3Fi8D/m2LwBR+q1My40dGGPvTsqWnXcQbyS0vstm8aGgtDqrMaou8xFA2bv+
         3T5CI5DlM+gbZJAmCmddWPMCgKeimcIix5O13P9kmabtuIm8CGmibjfTK0DEfn72Iq1S
         MkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2VRFZzseqkasJR9ZEx928Vijh3xcsQhytLYJ3MVsijo=;
        b=i/u4osIbnbham1ZzxQg/mFHp4kpIwnXsUk88OxXNnsu7/uTs5GR2UsvHXEOXpnprY1
         8x+h5dCHXGKeA0ctWVZgHYd9GVYrwfK/aCZRMsZ7t5npsGR5a8d5ygi8qdxnZqio81c5
         9yhB7vs3EaZZ5jCedKoIJUGALKvOu2ClguARyYz9Kb4BHDo9Wa/VgSf03NkHk426O7MX
         4v41KJ0OLe+JjbRhNi/4TMCj+7cCvgstT3uNiPrERjEVswdrVQOrr/fhfxQ1Z4Uv3B09
         XoOr3/JYKNAXvmq4yIvW4foIL4vKxEZ2Pt87pFWijWOXTg2TMXVnjMN3PIx2I2ItQ7hQ
         I59Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i184si7747244ybb.438.2019.03.14.01.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 01:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4LzD-0000rY-77
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 04:45:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4LxE-0008Ef-AU
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4LxC-0002QP-Nx
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:07 -0400
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:60018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4LxC-0002LU-DY
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:06 -0400
Received: from player762.ha.ovh.net (unknown [10.109.143.225])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 50C88121745
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 09:43:03 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id D8AE73AA2DBB;
	Thu, 14 Mar 2019 08:42:54 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 09:42:31 +0100
Message-Id: <20190314084235.9887-2-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314084235.9887-1-clg@kaod.org>
References: <20190314084235.9887-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1447625806499908369
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.149
Subject: [Qemu-devel] [PATCH 1/5] aspeed/timer: Fix behaviour running Linux
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3kvZrJUR6lA2

From: Joel Stanley <joel@jms.id.au>

The Linux kernel driver was updated in commit 4451d3f59f2a
("clocksource/drivers/fttmr010: Fix set_next_event handler) to fix an
issue observed on hardware:

 > RELOAD register is loaded into COUNT register when the aspeed timer
 > is enabled, which means the next event may be delayed because timer
 > interrupt won't be generated until <0xFFFFFFFF - current_count +
 > cycles>.

When running under Qemu, the system appeared "laggy". The guest is now
scheduling timer events too regularly, starving the host of CPU time.

This patch modifies the timer model to attempt to schedule the timer
expiry as the guest requests, but if we have missed the deadline we
re interrupt and try again, which allows the guest to catch up.

Provides expected behaviour with old and new guest code.

Fixes: c04bd47db6b9 ("hw/timer: Add ASPEED timer device model")
Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - merged a fix from Andrew Jeffery <andrew@aj.id.au>
        "Fire interrupt on failure to meet deadline"
        https://lists.ozlabs.org/pipermail/openbmc/2019-January/014641.ht=
ml
      - adapted commit log
      - checkpatch fixes ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 59 ++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 5c786e512815..9ffd8e09f670 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -109,37 +109,40 @@ static inline uint64_t calculate_time(struct Aspeed=
Timer *t, uint32_t ticks)
=20
 static uint64_t calculate_next(struct AspeedTimer *t)
 {
-    uint64_t next =3D 0;
-    uint32_t rate =3D calculate_rate(t);
+    uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t next;
=20
-    while (!next) {
-        /* We don't know the relationship between the values in the matc=
h
-         * registers, so sort using MAX/MIN/zero. We sort in that order =
as the
-         * timer counts down to zero. */
-        uint64_t seq[] =3D {
-            calculate_time(t, MAX(t->match[0], t->match[1])),
-            calculate_time(t, MIN(t->match[0], t->match[1])),
-            calculate_time(t, 0),
-        };
-        uint64_t reload_ns;
-        uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-
-        if (now < seq[0]) {
-            next =3D seq[0];
-        } else if (now < seq[1]) {
-            next =3D seq[1];
-        } else if (now < seq[2]) {
-            next =3D seq[2];
-        } else if (t->reload) {
-            reload_ns =3D muldiv64(t->reload, NANOSECONDS_PER_SECOND, ra=
te);
-            t->start =3D now - ((now - t->start) % reload_ns);
-        } else {
-            /* no reload value, return 0 */
-            break;
-        }
+    /*
+     * We don't know the relationship between the values in the match
+     * registers, so sort using MAX/MIN/zero. We sort in that order as
+     * the timer counts down to zero.
+     */
+
+    next =3D calculate_time(t, MAX(t->match[0], t->match[1]));
+    if (now < next) {
+        return next;
+    }
+
+    next =3D calculate_time(t, MIN(t->match[0], t->match[1]));
+    if (now < next) {
+        return next;
+    }
+
+    next =3D calculate_time(t, 0);
+    if (now < next) {
+        return next;
+    }
+
+    /* We've missed all deadlines, fire interrupt and try again */
+    timer_del(&t->timer);
+
+    if (timer_overflow_interrupt(t)) {
+        t->level =3D !t->level;
+        qemu_set_irq(t->irq, t->level);
     }
=20
-    return next;
+    t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
 }
=20
 static void aspeed_timer_mod(AspeedTimer *t)
--=20
2.20.1

