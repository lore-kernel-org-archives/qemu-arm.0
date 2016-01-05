Received: by 10.182.158.201 with SMTP id ww9csp11162842obb;
        Tue, 5 Jan 2016 05:46:48 -0800 (PST)
X-Received: by 10.55.81.70 with SMTP id f67mr2219193qkb.28.1452001608662;
        Tue, 05 Jan 2016 05:46:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o38si78651376qge.95.2016.01.05.05.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jan 2016 05:46:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGRwm-0006QA-DC
	for alex.bennee@linaro.org; Tue, 05 Jan 2016 08:46:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGRvN-0004Pp-IW
	for qemu-devel@nongnu.org; Tue, 05 Jan 2016 08:45:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGRvM-0004Ps-Da
	for qemu-devel@nongnu.org; Tue, 05 Jan 2016 08:45:21 -0500
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233]:36410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGRvM-0004Pk-6C; Tue, 05 Jan 2016 08:45:20 -0500
Received: by mail-lf0-x233.google.com with SMTP id z124so289196659lfa.3;
	Tue, 05 Jan 2016 05:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QM2d10qBXp2Dhy5IeE3EgkFA/w/7W5akXotA8o3au24=;
	b=G5iHXUkcN1XW57W/ErFQfpsFuzx6iSJCxvDH7QtkQZNueLU85BAocxJDo+KtWiEVJV
	EVbBbZZR4MgeLKNQjKwuYSgC0nBSutNEPWOo8M8fpMAJYNwplAs+sfA42j3O/6Bi9W9G
	B+Emo20MTazWZu6SOVUtd565lbRci15WseX0yGnCfRUBWp9TedRRDf2rVqZtTsV31vhK
	Cgo3YHuOLyMSwqbdVMj+h6npPih34pFoeqxbFMSKigAxDV4p5hOLXUDh9Psk+orS7/WE
	P8TIKdNL7UxmHHaVqSYq0DQM2KqEpnVnQUJE4MAUb47Qmt8+ms/dRwyUX7Zet1H4qrNx
	0iYQ==
X-Received: by 10.25.158.134 with SMTP id h128mr33675192lfe.53.1452001519409; 
	Tue, 05 Jan 2016 05:45:19 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b10sm14750850lbd.17.2016.01.05.05.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 05:45:19 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Tue,  5 Jan 2016 16:44:25 +0300
Message-Id: <ea6518142b12a475c8d8e6c4f1979693c1aa7011.1452001370.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452001370.git.digetx@gmail.com>
References: <cover.1452001370.git.digetx@gmail.com>
In-Reply-To: <cover.1452001370.git.digetx@gmail.com>
References: <cover.1452001370.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v9 3/4] hw/ptimer: Update .delta on period/freq
	change
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QhInV1t09HPR

Delta value must be updated on period/freq change, otherwise running timer
would be restarted (counter reloaded with old delta). Only m68k/mcf520x
and arm/arm_timer devices are currently doing freq change correctly, i.e.
stopping the timer. Perform delta update to fix affected devices and
eliminate potential further mistakes.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index ff0586b..eb4eb4b 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -207,6 +207,7 @@ void ptimer_stop(ptimer_state *s)
 /* Set counter increment interval in nanoseconds.  */
 void ptimer_set_period(ptimer_state *s, int64_t period)
 {
+    s->delta = ptimer_get_count(s);
     s->period = period;
     s->period_frac = 0;
     if (s->enabled) {
@@ -218,6 +219,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
+    s->delta = ptimer_get_count(s);
     s->period = 1000000000ll / freq;
     s->period_frac = (1000000000ll << 32) / freq;
     if (s->enabled) {
-- 
2.6.4

