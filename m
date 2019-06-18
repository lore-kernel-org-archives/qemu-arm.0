Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3969790wrg;
        Tue, 18 Jun 2019 10:18:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0ndwoGTs/A/CfvuyOTCdHrAwWvvsanjz1DR0UtKI0iHRtigLn7XgAkPEH9iHKRc/bi99g
X-Received: by 2002:ac8:525a:: with SMTP id y26mr102219155qtn.297.1560878320946;
        Tue, 18 Jun 2019 10:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560878320; cv=none;
        d=google.com; s=arc-20160816;
        b=vORoj6Nx8Kwy8HiTMG0aborA+v9hpbhaDMFQh+wKzk8fRehU2xq1QADGSNcd3vqiQI
         hIe0M6Tkg3MfH9Cednt5VuSLUlC4ffyex7xbCdBHkChdHUkQZxfX+4D5/uk02FXEvZW6
         KdIoPL+E58U1M+hWBUIqjhAEihQDp/ITVh/8pKKJe6OIThizOEImipg0XrNew8YTiMmM
         6CihuO0q6JZ8RRTPboEMozt/h5syB0qcFTmjGO/NyC4aRSqZiB1uDzoY6oKBbtYUITmQ
         8o91x3YwAUa1CwkFROnO2xv0iDCIuNSU3kMGY8KrC6D+lE6/+1z3+n2X86RxgPa83IlH
         qsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=yST2yA1MXO1PRUxLiIuZxjhQXF1u8DF/KqomlO5l8Uo=;
        b=zdYvbzZgA/axQzArNDwyOrjuuWQAEYtOtVoRLU2U+eb1aSKI2ZD9sPiE98S0rRqHl9
         8euchSskDaDkLRwN8q+m9CPN+1WsYMXHmwGhiilPsHzt14m0jCx5dOmyqxwduCpqLjtH
         PWhoU0XuK1YBD30dB46FttPXjPes67a6ueqmmXopRCwYyEFsf/M9DC9WPsIVcWo4r5xo
         5uQ4GSzIQ/m2A2UKE6RoE/tpdFk8xlrufZEr7f+BuuB/Ch4v73Nopg96Wsj20Bb5KZnm
         +MsItjeUC0MnrRcGQ6xniSVKs69aKzXQQsIKuiD0w74sgx7Ro5A0vAg3NlWq73q7FeFv
         3FSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j143si10166607qke.244.2019.06.18.10.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHkm-0001fq-HJ
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHND-00009B-Mz
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHNC-0004NE-7m
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:19 -0400
Received: from 18.mo6.mail-out.ovh.net ([46.105.73.110]:40709)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHN9-0004Hs-OW
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:16 -0400
Received: from player157.ha.ovh.net (unknown [10.108.54.156])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 043F71CA842
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:54:13 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 2E4ED6EB527C;
 Tue, 18 Jun 2019 16:54:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:57 +0200
Message-Id: <20190618165311.27066-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1672242837034666769
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.73.110
Subject: [Qemu-arm] [PATCH v2 07/21] aspeed/timer: Fix behaviour running
 Linux
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
X-TUID: Wk8GrWwOKlHN

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
index 2c3a4d0fe770..537f072cf87f 100644
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
2.21.0

