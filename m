Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp579567wro;
        Thu, 14 Mar 2019 01:46:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyizVMROKcNL59ylRrb+XAzf2FVGLwz0T3GNEEQSxYBPyXaW5lzbsSDByAHvQT52fNLc7lK
X-Received: by 2002:a81:3110:: with SMTP id x16mr14674261ywx.401.1552553183612;
        Thu, 14 Mar 2019 01:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552553183; cv=none;
        d=google.com; s=arc-20160816;
        b=uP4SZ3+ui8kbainlvcHU3CuqJYVip4eqJGOnqWYCvlWY+JN9tD2yJetPZujFctfeiO
         oJABSiEjheR2NAld2KsRgVwEauD+5Urd24atpNo3aNDTJPVupKa6iMQGln7mfZfwbADU
         ORRdrbSE4NHOb6uG+m5EbhqjwxKHna3KUoIPkIJGRLtJg4/Sqzqt0sgtFH6BHT6x/8RO
         eAwZxx/mtfIXI/jUPUErhrnPVcohycIBBN+QtMEtvTuh2Oo/Xxo0gT1DvDF4Vx5NZ/eS
         tY4wWSqVx4myg5/xCxV2ARObPsoveVCIypUscbVDyqy/HEeszrKzTBGiHPaCxTQ3qTAh
         sSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Hd/QffZPW0tqy0O40KouEkyglnjbJviTsY4xM+OYow8=;
        b=lfLkimxGIr0TO7qnWlYd8RK2l3s9IpfdZAIl4NZKzA77JhDmYmwkGfQ7bzm8peRR06
         tYIkvomO0yGl9Hb62DQZzClaa0w2K+ZOXpY7MAxYey5pWU8BqLBNcjpboVYJOg/iTzbt
         1fnDwsbnpRBQA71r9AoAj/4pgvAHB5aNhAtz3gH23ezENIBmoEbwtvdeu24OxPJPZDBC
         KQx/1mYQzq1F67j+lSqz3bgL0j6hgvbbMm3mekoxLov0xE6+JxTd1sGjrnhO21ND4Yyf
         cLOinKM77/taQk73t90/CTHF+OPg9YAnmh1kkPaiS+IcWHzGt5rgfFBeiulAKH/GOD4O
         Wz6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g187si328010ywa.203.2019.03.14.01.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 01:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4M0N-00022W-1x
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 04:46:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4Lxj-0000BY-3Z
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4Lxh-00036p-BR
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:38 -0400
Received: from 10.mo68.mail-out.ovh.net ([46.105.79.203]:50000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4Lxd-0002zC-MJ
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 04:43:35 -0400
Received: from player762.ha.ovh.net (unknown [10.109.146.106])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id ED91311D84E
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 09:43:30 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id C653D3AA2F18;
	Thu, 14 Mar 2019 08:43:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 09:42:34 +0100
Message-Id: <20190314084235.9887-5-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314084235.9887-1-clg@kaod.org>
References: <20190314084235.9887-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1455225630926932753
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.79.203
Subject: [Qemu-devel] [PATCH 4/5] aspeed/timer: Provide back-pressure
 information for short periods
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
X-TUID: QdtDEvb9SKG6

From: Andrew Jeffery <andrew@aj.id.au>

First up: This is not the way the hardware behaves.

However, it helps resolve real-world problems with short periods being
used under Linux. Commit 4451d3f59f2a ("clocksource/drivers/fttmr010:
Fix set_next_event handler") in Linux fixed the timer driver to
correctly schedule the next event for the Aspeed controller, and in
combination with 5daa8212c08e ("ARM: dts: aspeed: Describe random number
device") Linux will now set a timer with a period as low as 1us.

Configuring a qemu timer with such a short period results in spending
time handling the interrupt in the model rather than executing guest
code, leading to noticeable "sticky" behaviour in the guest.

The behaviour of Linux is correct with respect to the hardware, so we
need to improve our handling under emulation. The approach chosen is to
provide back-pressure information by calculating an acceptable minimum
number of ticks to be set on the model. Under Linux an additional read
is added in the timer configuration path to detect back-pressure, which
will never occur on hardware. However if back-pressure is observed, the
driver alerts the clock event subsystem, which then performs its own
next event dilation via a config option - d1748302f70b ("clockevents:
Make minimum delay adjustments configurable")

A minimum period of 5us was experimentally determined on a Lenovo
T480s, which I've increased to 20us for "safety".

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h | 1 +
 hw/misc/aspeed_scu.c            | 6 ++++++
 hw/timer/aspeed_timer.c         | 6 +++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index 1fb949e16710..10c851ebb6d7 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -41,6 +41,7 @@ typedef struct AspeedTimer {
      * interrupts, signalling with both the rising and falling edge.
      */
     int32_t level;
+    uint32_t min_ticks;
     uint32_t reload;
     uint32_t match[2];
     uint64_t start;
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 51498ce70be6..797a07c2c45a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -427,6 +427,12 @@ static void aspeed_scu_realize(DeviceState *dev, Err=
or **errp)
                           TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
=20
     sysbus_init_mmio(sbd, &s->iomem);
+
+    /*
+     * Reset on realize to ensure the APB clock value is calculated in t=
ime for
+     * use by the timer model, which is reset before the SCU.
+     */
+    aspeed_scu_reset(dev);
 }
=20
 static const VMStateDescription vmstate_aspeed_scu =3D {
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 6c184572ea04..9988b8fbbf17 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -259,7 +259,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlSta=
te *s, int timer, int reg,
     switch (reg) {
     case TIMER_REG_RELOAD:
         old_reload =3D t->reload;
-        t->reload =3D value;
+        t->reload =3D value < t->min_ticks ? t->min_ticks : value;
=20
         /* If the reload value was not previously set, or zero, and
          * the current value is valid, try to start the timer if it is
@@ -311,7 +311,11 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t,=
 bool enable)
=20
 static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enable=
)
 {
+    AspeedTimerCtrlState *s =3D timer_to_ctrl(t);
+    uint32_t rate =3D enable ? TIMER_CLOCK_EXT_HZ : s->scu->apb_freq;
+
     trace_aspeed_timer_ctrl_external_clock(t->id, enable);
+    t->min_ticks =3D muldiv64(20 * SCALE_US, rate, NANOSECONDS_PER_SECON=
D);
 }
=20
 static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool en=
able)
--=20
2.20.1

