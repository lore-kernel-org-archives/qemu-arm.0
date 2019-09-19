Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp583375wrp;
        Wed, 18 Sep 2019 22:52:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKYmEoMRF6Z9njphInYfA2W5Ca0lF1N4ueyi/dwyPYX50tsRynOO25gzaJyf3xkyy1401i
X-Received: by 2002:ac8:3644:: with SMTP id n4mr1506565qtb.92.1568872366784;
        Wed, 18 Sep 2019 22:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568872366; cv=none;
        d=google.com; s=arc-20160816;
        b=FJgGiDt1lVkEHgVl5mLn8c8TcphoBFIp/4pVkmDoqs9WND+J3rxvQJeX560ZDOYhhO
         H2Ol2K0pi2/s26jWjw3lyL44tJOYBkSCIjs04tvwIMsJTUgdhFJF9WV7UUe98B0CSZKu
         LO4UFcU6R2OH5eJ9Z0JhHBmxvupUSXgtyPreSyApmm8eu1TQ3b37WNF1xDv330jten/z
         G2ERX6tD65pvbzNIZn2zoQKF6bvZrmzqrRQKk5xy+KF3k9lI6wA7KX52J1CKyS4r35Kd
         03izdbajkiQoD0yA8eJKwBh7Ikja6xzK8WAmzDDydO4uQ98ZuvnJ5Ak6tW/U/gYVNK6R
         5Q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=avmPL7sK4lGFPkjK267VEB1h7bzmgVSsQTljA+/FeJU=;
        b=twcJWJdCycPJJin+I9u5W1zhtPjD+2L3/TAbdJquswtFVBrZXxpO4h1EvnhdXVxLgu
         Za3VQvtHmkTLY1ZDLQxIXktSTze/BtUSRexiBMYqO8TdHV5n1991CiBUO2Cbu4lwBIz2
         xdG/xZ+5RP7WIOQQQJV0RDZr7T4UATqEEgJCbNcCkDSeiU8DJXJgojY43CzlBWhzBQse
         mxoEK3VTis+9NElG1H/yqToPKLCUMHeS2AHDDbeKM8ECK5GpdE872BuQOVDEnZAC+fEd
         SNZxKx3Y7GG5KZQ1WCEhA3rr9t6WfW1M1SByHy/7p8JnGujk2B/9yIv7vp3tWgvqnPwh
         37LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si5350020qkf.367.2019.09.18.22.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 22:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iApMz-0001jR-Nl
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 01:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApLF-00013E-Cd
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApLE-0007w7-33
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:57 -0400
Received: from 10.mo177.mail-out.ovh.net ([46.105.73.133]:50141)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApLD-0007vJ-Td
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:56 -0400
Received: from player788.ha.ovh.net (unknown [10.108.57.153])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 4A2D310B2FD
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 07:50:54 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id A9EAA9F173D1;
 Thu, 19 Sep 2019 05:50:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:49:47 +0200
Message-Id: <20190919055002.6729-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1674776115243682577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.73.133
Subject: [Qemu-devel] [PATCH 06/21] aspeed/timer: Add AST2600 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K2MxxVGtvYm+

The AST2600 timer has a third control register that is used to
implement a set-to-clear feature for the main control register.

On the AST2600, it is not configurable via 0x38 (control register 3)
as it is on the AST2500.

Based on previous work from Joel Stanley.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
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

