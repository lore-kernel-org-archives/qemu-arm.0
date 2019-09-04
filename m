Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp29697wrp;
        Wed, 4 Sep 2019 14:44:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLYHvzzpZzsQr9dm++KmEs3PJfyaBboG9CibF0kjrAOUEGiIfCBPpFZld6oPNHo1dVNZ6R
X-Received: by 2002:ac8:2397:: with SMTP id q23mr228358qtq.297.1567633491147;
        Wed, 04 Sep 2019 14:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567633491; cv=none;
        d=google.com; s=arc-20160816;
        b=PujRke+C9P6wiPT0JMAPlSG712dFHKASoStPKP7affP0mqFsKnv87PV1VNsPPRQGB5
         tHwPAZlggwwUvHAsZ5hDSO5RqnEhRj2AePuFaAUGXhvZcMOKBmkkhH1DvzYOCs/ZgiIb
         t0OcE0JW72vewbKuFyVqtUeEUt8lsu+yh9q5O9iKgvDIEW5R1Gjn4zn+Vupeh4IntZnz
         QM/WckAO022I737IzeNHdRkdwI+bKyqrYQaxk1NmDKJ/kAZYKjYDBGMwkfPxyjee0BW/
         NWVV5BV3MwlgofoZOW7NQ0q09pEwmVV6ePcRuA16t44GuI/DoPS3gS8RKX2BE/XNO8AZ
         Fdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=avmPL7sK4lGFPkjK267VEB1h7bzmgVSsQTljA+/FeJU=;
        b=WGxAFhlwI2IDP4hrlr0h/MxES0OIu+jz6jijH9Zzhboi5vmkJxt4on8QVmW8G33BKX
         kYp4y4IdlUVv/eYfXrkksk503YbBUZFN0Lg9lBe8/fGmuP1bbrN4Lox0a+eu/yAHEHwG
         iv1jD0fHgSnNUFuNmykLy+F640aleaRozyFil3PiynKtOIUjlAvVJfxUmgpPr4q2bcei
         pKqqaIrwLM19hQjtLlv4UDsCM3ENCPhMudM7P+UArFwGF8XIVatvFVx0Op9AxiMzd106
         AXrpu07nZfl2jIHM/IHYlVHGcPLZCtuqSW/nEBLYZYxuEA9wzgBP52ur0UDR4U2LM6qm
         eFhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si193209qkm.372.2019.09.04.14.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 14:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5d58-0004Bj-BL
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 17:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5cBq-00005y-Rb
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5cBp-00013I-4S
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:42 -0400
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:57742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5cBo-0000z3-0k
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:40 -0400
Received: from player691.ha.ovh.net (unknown [10.108.54.36])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 1D13718C72B
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 22:47:39 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 0BF9698B2814;
 Wed,  4 Sep 2019 20:47:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 22:46:48 +0200
Message-Id: <20190904204659.13878-5-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904204659.13878-1-clg@kaod.org>
References: <20190904204659.13878-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2516104820903217937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedgudehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.158.110
Subject: [Qemu-arm] [RFC PATCH 04/15] aspeed/timer: Add support for AST2600
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
X-TUID: CKBoYNMi4WNh

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

