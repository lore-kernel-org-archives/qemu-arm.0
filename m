Received: by 10.25.159.19 with SMTP id i19csp1541526lfe;
        Sat, 30 Jan 2016 08:47:57 -0800 (PST)
X-Received: by 10.140.128.8 with SMTP id 8mr18834391qha.54.1454172477427;
        Sat, 30 Jan 2016 08:47:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f124si20556717qkb.19.2016.01.30.08.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYgm-0002ck-Q7
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:47:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgj-0002YC-Pc
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:47:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgi-0002Eh-UP
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:47:53 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgg-0002DL-Tt; Sat, 30 Jan 2016 11:47:51 -0500
Received: by mail-lf0-x243.google.com with SMTP id t141so5187265lfd.3;
	Sat, 30 Jan 2016 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=T9Wxh2Ec9/WgavfJ4F3Ps/VO1v9nR4C4/sOz0L9YkiE=;
	b=C5deYzwRHw2bfnVHikgtt/Vzih87k49kMEcWLyIUpsTXVgmBpfRdafK6s5KhP5R48x
	Xe0clqUIeuzsxlCf9sf3P1yEG1MYTQKbHMNn6E9jykguABKP81APGn7kv0TBJLLIMTmO
	nPRyJ972oO7O2BOWxflbWk33SpPPOHA70fp94dJYfAN+dLO1p2xnvDiiz/WZ9oP9foGd
	VeBlQGdU807StGQsg5CLMVYXV8B+hB03bMIT76D0TM0h3vORwV2O6XoYsvjuuVWAReFV
	NJpVwxFhQgObteKYGhoHVYGhI7A+OFQvMbx8SfEDdQMdCrhlg6Ykq+I7PYkmcGfJq57s
	5bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=T9Wxh2Ec9/WgavfJ4F3Ps/VO1v9nR4C4/sOz0L9YkiE=;
	b=Vb/Ze0gYAfwI9KktrWheynj0WmTq07uta2IWPsWWfHYMPm/z1bpvxUwhjC/NoiPvuC
	ZZ2/9cEv2/lp6pFaQBaGcnxMuxYrATLi2DdxFMZuJka/KD18xSdHKbIFRTDrfQhZ2d6H
	0Wz4UxX1CgFTFezOomAjl5v5GeKAJwcxZk1Em19OCd1CosEzRvZeuYl4pae9k+AAxBHw
	dPHnGlEXa1taWyO5uK2FFHYy2WLT2HWoMhlzvBPdzPFvZ6u0PguPh7lDjXHeKHiixEz2
	DVoklHraXJ0wCTrBc1CH8H/Y8bbSET07KKjYj9NYe9s42TpRjW9XnKEtr286lSMDiCB4
	08XQ==
X-Gm-Message-State: AG10YOS49c5agwIq5BmFWa+MmB2oBzAxUcoUdXNk/dssbbwW86tQFFEo6ESKr2GPxY0szA==
X-Received: by 10.25.28.134 with SMTP id c128mr4509157lfc.95.1454172470121;
	Sat, 30 Jan 2016 08:47:50 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:49 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:12 +0300
Message-Id: <d85fb52411aa5e4b26f0d8e2358e89a99add0eef.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v12 3/9] hw/ptimer: Update .delta on period/freq
	change
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XmoRUeBppKgN

Delta value must be updated on period/freq change, otherwise running timer
would be restarted (counter reloaded with old delta). Only m68k/mcf520x
and arm/arm_timer devices are currently doing freq change correctly, i.e.
stopping the timer. Perform delta update to fix affected devices and
eliminate potential further mistakes.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index d4452d3..f58790a 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -189,6 +189,7 @@ void ptimer_stop(ptimer_state *s)
 /* Set counter increment interval in nanoseconds.  */
 void ptimer_set_period(ptimer_state *s, int64_t period)
 {
+    s->delta = ptimer_get_count(s);
     s->period = period;
     s->period_frac = 0;
     if (s->enabled) {
@@ -200,6 +201,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
+    s->delta = ptimer_get_count(s);
     s->period = 1000000000ll / freq;
     s->period_frac = (1000000000ll << 32) / freq;
     if (s->enabled) {
-- 
2.7.0

