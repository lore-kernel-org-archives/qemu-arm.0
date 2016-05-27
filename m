Received: by 10.25.27.66 with SMTP id b63csp281245lfb;
        Fri, 27 May 2016 10:18:10 -0700 (PDT)
X-Received: by 10.55.185.67 with SMTP id j64mr14510905qkf.205.1464369490354;
        Fri, 27 May 2016 10:18:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x14si18348883qka.283.2016.05.27.10.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:18:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LOj-0005qJ-PP
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:18:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBw-0002Rt-CY
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBm-0003p4-BO
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:55 -0400
Received: from mail-lb0-x243.google.com ([2a00:1450:4010:c04::243]:33645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBm-0003ot-3q; Fri, 27 May 2016 13:04:46 -0400
Received: by mail-lb0-x243.google.com with SMTP id rs7so1636525lbb.0;
	Fri, 27 May 2016 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xLGrmZIGlDQdc8UrtTjNzmomRXGfwUEc/NYRj/C6qBw=;
	b=efefq2nKHvc6cAAttafEZIpZY8Fh7+675mjnUvWE4O2z0bmXABgHV0+QMqilxFMlfG
	jDtNYoqbM6yJbJAl2c9SAocwgTfgID7MPb6NEVsBBs1w/TFr1EfcmT30FmCDEPHrgPv1
	DoBncS6QA1fFEYQfwX3UN4YAIqY5yO08AAzqWHtAnsXFtXisAqcLBNT/N8kObZjRpLqp
	pt6WUrZ/K2Kh1I7ieTWgGdCVXt8iLEGq0aJJF2tTG+ZXEMyMCRvlkd16ToDah+KkLGgg
	uc6oA7fvp/A4IDvoeY79UnF+j6/xivYzYGaokBEgaX25JHXh+EeH07anHbMbtXXex33n
	1o9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xLGrmZIGlDQdc8UrtTjNzmomRXGfwUEc/NYRj/C6qBw=;
	b=K3tPpHtYY3yXCi6yYLMmOp3f8ldfsOlhhsLNwVsDlEtLpgqjVNEZp0mCOO/vf9EMHH
	AkWnAnTl+XRd/tOeAZLPUBLSgc/RBQ9Q6OJSMNdrBEd8AGYx1fb+hkgwP/YusovNtcyo
	kpUFTbJqTREm+1BWOcI8L/mml9yYJhH0DrJ9rXuojcEApbCoi2z7ZpNn5f2e5LStbm6m
	mD73x6/FKPJ21DaFR5+TWxJsyaVIynmMnt00jsCi/KzuRHqfMU2934TV6iR2dr/8vUaz
	juyYfGzKqcfAOPN8NvoJ/v58xHi/Ot9PpWQHszeyWZY+cDeTo+elLALvdOcCIVbytZ7T
	fmiw==
X-Gm-Message-State: ALyK8tLeb4TTF6vd3AMmqUmHCPPRK1QG0Clw0RrJ7nsl0t7Wjl1au8JZ2jA3/ao2NS2xdA==
X-Received: by 10.112.17.71 with SMTP id m7mr3939045lbd.129.1464368685410;
	Fri, 27 May 2016 10:04:45 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:31 +0300
Message-Id: <4987ef5fdc128bb9a744fd794d3f609135c6a39c.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::243
Subject: [Qemu-devel] [PATCH v13 3/8] hw/ptimer: Update .delta on
 period/freq change
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p9nWWM8ZFGL9

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
index 7e6fc2d..76ebe9b 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -190,6 +190,7 @@ void ptimer_stop(ptimer_state *s)
 /* Set counter increment interval in nanoseconds.  */
 void ptimer_set_period(ptimer_state *s, int64_t period)
 {
+    s->delta = ptimer_get_count(s);
     s->period = period;
     s->period_frac = 0;
     if (s->enabled) {
@@ -201,6 +202,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
+    s->delta = ptimer_get_count(s);
     s->period = 1000000000ll / freq;
     s->period_frac = (1000000000ll << 32) / freq;
     if (s->enabled) {
-- 
2.8.3

