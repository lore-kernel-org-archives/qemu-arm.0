Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp887658wrp;
        Wed, 25 Sep 2019 07:45:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9kuugR/ju5u7RfMsaBdK19WM1xRE0OGraOckZOSNE25jSXoc42NrOJ85ZJYyL5FPvFvvw
X-Received: by 2002:ac8:739a:: with SMTP id t26mr2888209qtp.176.1569422737383;
        Wed, 25 Sep 2019 07:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569422737; cv=none;
        d=google.com; s=arc-20160816;
        b=s6Zm2KBRzcFcJpc/coKOtfPmu6dN4K7/kSBIPyM6xNHmyWLb0HhfJUUkm+FwWNY98+
         yq5GVKIR+sxz+J+vcvDLZSOqhEch+2oLpo0Hjteq4T4CnMco3KGwQmVYJAsysx0G51FM
         Q8RPHBlNM78tUcELJ+9bgE9jKGGbC0k2Z0neEDqc3DOfbAt4jArsS29T4aZFvaiyZBcV
         Ad93DUhuOZoS1y01u7op8PtkJkq+sXxxEo0xr/ikZG8OgqAEeLWmOhYCRxVw5BvOMz9b
         mydmWeqsGwmEO2u8S9mrMNmblgVCabjFuL623hIH9etN5AZHlD5p1haDI88rrSzEftx6
         4oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=RSuS1ug1PeRKK+uvesAQPiP0wIBYvM+rUaxDl3Pt8/o=;
        b=Zyykpvri7YwIza7I27LiPTyo+nHrTsRg7tOG/N+aUJ9dIpNwsmb3neZiM/2AlSdpMV
         jhK4DNwPmDMqZK543voFLgTxPlVzSURlHRsoJmPVNeMHL3G2x72Lp7T8K6KHUhkxtqqa
         rRlIDc1Ikjjbv4watuebX6uQWAl9bK3+vFVd3vhu//3289qYGjaPQGtTqmvd27TzWFmP
         +27WGle5OkwTaBYEoF18+onJ0qut9NZdLJX9hvrqrahSTlNDRtufsYMM9H4P2RZG9aYW
         cL5ckF3xBaKm0RFils2OVlu/Ae8HPMDR2NtDwBSO5al/F+hxOSQSfhBb4No27raLJO9o
         jSJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si4228508qke.194.2019.09.25.07.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8Xv-0006bu-SA
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8MQ-0003YG-Ll
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8MP-0000cS-I2
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:42 -0400
Received: from 7.mo179.mail-out.ovh.net ([46.105.61.94]:38574)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8MP-0000bm-CI
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:41 -0400
Received: from player786.ha.ovh.net (unknown [10.108.35.197])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id B9C9514362E
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:33:39 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 23A48A4D3D1E;
 Wed, 25 Sep 2019 14:33:33 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/23] aspeed/timer: Add support for control register 3
Date: Wed, 25 Sep 2019 16:32:30 +0200
Message-Id: <20190925143248.10000-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8845914096798960401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.61.94
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
X-TUID: UqYFF8J/3tS0

The AST2500 timer has a third control register that is used to
implement a set-to-clear feature for the main control register.

This models the behaviour expected by the AST2500 while maintaining
the same behaviour for the AST2400.

The vmstate version is not increased yet because the structure is
modified again in the following patches.

Based on previous work from Joel Stanley.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h |  1 +
 hw/timer/aspeed_timer.c         | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index a791fee276f4..1e0288ebc49f 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -58,6 +58,7 @@ typedef struct AspeedTimerCtrlState {
=20
     uint32_t ctrl;
     uint32_t ctrl2;
+    uint32_t ctrl3;
     AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
=20
     AspeedSCUState *scu;
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index c78bc1bd2d25..d70e78a0293e 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -498,6 +498,8 @@ static uint64_t aspeed_2500_timer_read(AspeedTimerCtr=
lState *s, hwaddr offset)
=20
     switch (offset) {
     case 0x38:
+        value =3D s->ctrl3 & BIT(0);
+        break;
     case 0x3C:
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
@@ -511,9 +513,24 @@ static uint64_t aspeed_2500_timer_read(AspeedTimerCt=
rlState *s, hwaddr offset)
 static void aspeed_2500_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
                                     uint64_t value)
 {
+    const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
+    uint8_t command;
+
     switch (offset) {
     case 0x38:
+        command =3D (value >> 1) & 0xFF;
+        if (command =3D=3D 0xAE) {
+            s->ctrl3 =3D 0x1;
+        } else if (command =3D=3D 0xEA) {
+            s->ctrl3 =3D 0x0;
+        }
+        break;
     case 0x3C:
+        if (s->ctrl3 & BIT(0)) {
+            aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
+        }
+        break;
+
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
                 __func__, offset);
@@ -574,6 +591,7 @@ static void aspeed_timer_reset(DeviceState *dev)
     }
     s->ctrl =3D 0;
     s->ctrl2 =3D 0;
+    s->ctrl3 =3D 0;
 }
=20
 static const VMStateDescription vmstate_aspeed_timer =3D {
@@ -597,6 +615,7 @@ static const VMStateDescription vmstate_aspeed_timer_=
state =3D {
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
         VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
+        VMSTATE_UINT32(ctrl3, AspeedTimerCtrlState),
         VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
                              ASPEED_TIMER_NR_TIMERS, 1, vmstate_aspeed_t=
imer,
                              AspeedTimer),
--=20
2.21.0

