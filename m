Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp15200wrp;
        Wed, 4 Sep 2019 14:27:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyaUUajsaAyefyVV6H6eH0Omm+3gDOzmHZbmV0z8vBGshjdGrFWxwJtt/x/3H+nBq07/IV
X-Received: by 2002:aa7:d696:: with SMTP id d22mr361661edr.135.1567632426026;
        Wed, 04 Sep 2019 14:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567632426; cv=none;
        d=google.com; s=arc-20160816;
        b=Xc2oSB32opHkDhoi2F1zW/fjf5/9Mc6GfpTIAt3XUoLytskDQa9VBxgNryS/QX5OqF
         6I3Z/4VHAtK/CAsTLozLuzdilRsuwrGsRRqNdSbxyTABsfbplQ0MzegznyBoYyc9XswU
         4wi43B7PL4DewvAj+RPI9jxXu7qPkEkFiW52Af3/zS9cI+DiADbinE4lm6ye1LoFelxZ
         vgtQsCqGKbgs6D2uZzeo4M4KPflwMhEk0jOkVxBhYeHXWrRvYTX2jhAp4fR5h0ZvbPqd
         un3BPkHwyCHfbovDgRH/E19FOFXRl0B8JJOj2v/4S6nLLRbjbHQmGMZYF9tSwcmfpujv
         t7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8KJnY2++RFxrp0v6CSeygKQ70Fv7FDt+DJT2VlKCOi8=;
        b=tHDk++hCcX/ArD1lHqqNbTHOcP4BlKbnluR7c7u1azmRpdWfsAtyOI9K2HaMoAykSH
         kKnqSCUvE4v+AWs8TEroAKkdTHgieCAusA7S0O7vM4V0z2OJhTQKw8NKr7TodBP+5OiR
         dmd8r8oYsu1ju7Y+miFsg5TyH9FmZTQvpMOXm/8pHjSzOs3mldOH9JufAkCw/9OMeOOi
         wZq0wBZ6/C3RVQD39jfvHC/57VOspMki4+gaTGVz0465gcVKZJyxYUr6pIQw11svZ0AG
         RVO2dCcRbu5Nd9klSk+pCFWR8YSm0B7/uFmDOORUCL16Dlbu4etZ2nIMhPIlE2zL6AVr
         MamA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p29si12768245edc.369.2019.09.04.14.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 14:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5cnw-00012B-8I
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 17:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53358)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5cBl-0008Pu-95
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5cBi-0000qf-3J
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:37 -0400
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:51385)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5cBh-0000p1-Sn
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:34 -0400
Received: from player691.ha.ovh.net (unknown [10.108.57.211])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 400DB18D7FA
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 22:47:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 763CD98B27EF;
 Wed,  4 Sep 2019 20:47:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 22:46:47 +0200
Message-Id: <20190904204659.13878-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904204659.13878-1-clg@kaod.org>
References: <20190904204659.13878-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2513853021181676305
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedgudehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.158.110
Subject: [Qemu-arm] [RFC PATCH 03/15] aspeed/timer: Add support for control
 register 3
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
X-TUID: WGrZUtcJMCog

The AST2500 timer has a third control register that is used to
implement a set-to-clear feature for the main control register.

This models the behaviour expected by the AST2500 while maintaining
the same behaviour for the AST2400.

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

