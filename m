Received: by 10.182.158.201 with SMTP id ww9csp10897047obb;
        Mon, 4 Jan 2016 18:37:53 -0800 (PST)
X-Received: by 10.55.75.203 with SMTP id y194mr97374865qka.2.1451961473337;
        Mon, 04 Jan 2016 18:37:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c85si54367167qkh.5.2016.01.04.18.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jan 2016 18:37:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGHVR-0004NZ-2c
	for alex.bennee@linaro.org; Mon, 04 Jan 2016 21:37:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUo-0003KF-1K
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUm-00014R-Q7
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:13 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGHUm-00014M-JU; Mon, 04 Jan 2016 21:37:12 -0500
Received: by mail-lf0-x243.google.com with SMTP id n70so11473614lfn.1;
	Mon, 04 Jan 2016 18:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RjlkhgPWoryOCo35KfPWtujV4zEjuHcLLUhjXW1bULs=;
	b=QoL5ot3kv2tKDlQX+o4qS3q48dhu9RyT9GmvnVpR7UhOLJPt0Ma6TBVXAJ28i93Ykf
	a/r9QDB7xAafQbGgfuXitnhai+QnAuqM/oD+RYijS5pDHQwvFtfI+CgTaWwu+M79Y/mE
	tvxigTtIlgD54r7vaRlwNaTDV7Wem7fRv0QZCT/UQn0Q1gt44iHydo0kRmasTcecytEH
	RFQW52z4LJI2tGqWfUlmONsUeeO5JlBtRLHc+W0cPFk0GaWCcaKlkGRpf9mRoTQ8Z1AF
	EQqLRrBhqjuLeCi6fnyiV/8T2Gu5wSFZbPPET+igiHJlsTiMatbwiah8fYKLcgsGujH6
	AlDQ==
X-Received: by 10.25.145.14 with SMTP id t14mr16380729lfd.100.1451961431772;
	Mon, 04 Jan 2016 18:37:11 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	d2sm16008201lbc.11.2016.01.04.18.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 18:37:11 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Tue,  5 Jan 2016 05:33:28 +0300
Message-Id: <efba01ebc3e93fb00993a2de72c7794b5e4e1411.1451960508.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1451960508.git.digetx@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
In-Reply-To: <cover.1451960508.git.digetx@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v8 3/4] hw/ptimer: Update .delta on period/freq
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
X-TUID: ZRpx3JaQ4rk3

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
index 96a6c7a..8c2dd9f 100644
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

