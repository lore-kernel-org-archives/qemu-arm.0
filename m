Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp888993wrp;
        Wed, 25 Sep 2019 07:46:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzL+dnBbOwIBP07PF+0eMX9ZVKzmQV/TvOE1saoaUEF6YxtzEFF7GZwvj8bECf6yqnzHbB2
X-Received: by 2002:a05:6402:a50:: with SMTP id bt16mr3341343edb.114.1569422804752;
        Wed, 25 Sep 2019 07:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569422804; cv=none;
        d=google.com; s=arc-20160816;
        b=yAlg4IHmkLo6ote2C8E4whFud/5T0LfRShS0+3IQE3YpNM2P0VKxF/ljCm595dP0Lq
         67DSEWxWr6ODsVDJ+6nYg1jDifT5zIWtjEM8e8yCN+C/Fflv+J4q5O3NMMLvmC1wqmh5
         uWSX0HzfTWHEjsqQjJg1vHhtIrw7aEsWC0XlKJeZIjaW7Do3tdU77SULwS+GqMUv+dwW
         TjYs8d9nTn6uQ9Pk45ZfcB3a5mCP7gw+czSf9K8a4OoZfdKHxokSDVT4YakYSwXYmHja
         DR1UhM0/cF2eM88okXZdKOX0Xo8CYASJwfUXb4l9STElg7WJA5fBcjpr4ZRuoLK7mtVb
         otKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=liYzVRzkSpeRbLC5oGGGW7LWIsv1pWlxQN1LBQ+pKGc=;
        b=NE2cW6gzlFkLgl7M4yl6SLPpGQZez9nw5zbLdqxMJfaubU6hvA3mcUQuA4phjv3I3g
         oL7Rc5XBMt5Rd4ID6dEI/BzPR8NA0VpwiLcVVCYxXCQx2TXIL/h9z+BWxKJLWtyUkeBs
         2jw2GKxVmYkfRiNGnxyXYBqc4hFddIppAFBj3CMWjIlQ70QE2ERsPsBwfQfOYdVnHB5x
         LxCMUg+N3+avzrX8CRDiRpi9vRJ9x6MOCE6VDqTqlf0JDRWU5XNcVaPSP5L9oEiIcT46
         g3bqi0hZsVl5EyG+V2B33Mrx/6aMOeKnTZJuQ/Sp8OqPnrxELFSd0WGa918Dn0eD7fU6
         L1DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si2810098eja.273.2019.09.25.07.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8Z0-0007ZM-Mb
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8MZ-0003eN-KA
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8MY-0000mX-9G
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:51 -0400
Received: from 19.mo7.mail-out.ovh.net ([178.33.251.118]:41524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8MW-0000iC-Fn
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:48 -0400
Received: from player786.ha.ovh.net (unknown [10.108.54.94])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0A39C132B1A
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:33:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id B0DE6A4D3D88;
 Wed, 25 Sep 2019 14:33:39 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/23] aspeed/timer: Add AST2600 support
Date: Wed, 25 Sep 2019 16:32:31 +0200
Message-Id: <20190925143248.10000-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8847884418975697681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.118
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
X-TUID: ddRCOe/zlHKw

The AST2600 timer has a third control register that is used to
implement a set-to-clear feature for the main control register.

On the AST2600, it is not configurable via 0x38 (control register 3)
as it is on the AST2500.

Based on previous work from Joel Stanley.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/timer/aspeed_timer.h |  1 +
 hw/timer/aspeed_timer.c         | 51 +++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index 1e0288ebc49f..69b1377af01e 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -30,6 +30,7 @@
 #define TYPE_ASPEED_TIMER "aspeed.timer"
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
+#define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
=20
 #define ASPEED_TIMER_NR_TIMERS 8
=20
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index d70e78a0293e..7f73d0c75337 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -538,6 +538,40 @@ static void aspeed_2500_timer_write(AspeedTimerCtrlS=
tate *s, hwaddr offset,
     }
 }
=20
+static uint64_t aspeed_2600_timer_read(AspeedTimerCtrlState *s, hwaddr o=
ffset)
+{
+    uint64_t value;
+
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        value =3D 0;
+        break;
+    }
+    return value;
+}
+
+static void aspeed_2600_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
+                                    uint64_t value)
+{
+    const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
+
+    switch (offset) {
+    case 0x3C:
+        aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
+        break;
+
+    case 0x38:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        break;
+    }
+}
+
 static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
 {
     AspeedTimer *t =3D &s->timers[id];
@@ -674,11 +708,28 @@ static const TypeInfo aspeed_2500_timer_info =3D {
     .class_init =3D aspeed_2500_timer_class_init,
 };
=20
+static void aspeed_2600_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedTimerClass *awc =3D ASPEED_TIMER_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2600 Timer";
+    awc->read =3D aspeed_2600_timer_read;
+    awc->write =3D aspeed_2600_timer_write;
+}
+
+static const TypeInfo aspeed_2600_timer_info =3D {
+    .name =3D TYPE_ASPEED_2600_TIMER,
+    .parent =3D TYPE_ASPEED_TIMER,
+    .class_init =3D aspeed_2600_timer_class_init,
+};
+
 static void aspeed_timer_register_types(void)
 {
     type_register_static(&aspeed_timer_info);
     type_register_static(&aspeed_2400_timer_info);
     type_register_static(&aspeed_2500_timer_info);
+    type_register_static(&aspeed_2600_timer_info);
 }
=20
 type_init(aspeed_timer_register_types)
--=20
2.21.0

