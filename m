Received: by 10.25.159.19 with SMTP id i19csp3908839lfe;
        Thu, 21 Jan 2016 11:05:32 -0800 (PST)
X-Received: by 10.140.223.148 with SMTP id t142mr56950187qhb.65.1453403132154;
        Thu, 21 Jan 2016 11:05:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f17si2683712qhc.19.2016.01.21.11.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 11:05:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMKXz-0008HY-JL
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 14:05:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXK-0007RQ-0J
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXH-0001Cm-Af
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:49 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:35951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aMKXH-0001CZ-2x; Thu, 21 Jan 2016 14:04:47 -0500
Received: by mail-lb0-x244.google.com with SMTP id ad5so1945665lbc.3;
	Thu, 21 Jan 2016 11:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=YAi0Gz0P2FL7zGtDKWcl1Gdt3Y+KeqtJ5YOuepQuVX0=;
	b=JkfpSNgir8xyOWHo5Ojs4+7mfr7N0IrjzSRUH1atpHaktVE8LNsOKw4yKgpp1tQPeQ
	w/zIZQ1TToGMDGmiQRRlswgBpWQ6Wkz11hQ0qlgn4egeahj0v8ooxXMkjUiiZPimt7VL
	R+VDMvF8B8RXcP9X94tqNEQP08OeBAp5SJA2EnPEoPhZsT+654N+pvOPcj5ua3htYZEn
	1ep93IlmfGF7nPXVvIc1COrBpiZ29UKhqUY0UEz2VqjoeMLrWS20j8Avfs3F6TXE3H5H
	z2wO9uc13exAsJBzzSh0kwiaAxdJ4xaQi3iKzWP3sOb/0hT3F8OFwnkwmEKjj5IA1pDi
	daYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=YAi0Gz0P2FL7zGtDKWcl1Gdt3Y+KeqtJ5YOuepQuVX0=;
	b=Y0pdCQTngezPfmf1zQHOaSIDT8ioT2qq1ANkRDCe4oe9E5JBOnCtGrriKPdHpN+LIS
	R1lBxBr6K7ZMlJjthblX9ik96bBaX9HDMMuITclFedY6S9tO4PgIQzT/YrwMjIR8OTWN
	AWKsqdWtGAlJtD08iMY+dWFdB+fvwFwhZnC0oHFCIpYd8kwY6OFP6gPkakN+7r+eeqXQ
	DzqWxcrco9J5AYeIIRl1NRA7M4di5VhFPDkBlpJEBmGhmqAGO//F2wI3c+2saiNysoZT
	NK0Xg4zw4Ky3jd+UAzLTqARcWKt8MQYiKY3QvQleWBrA4uOkZ/ftUwjqnqvJbJ7vmdFU
	jyaw==
X-Gm-Message-State: ALoCoQlCMw66OwkHsJoMFwTOKoyvRQt6iK/02EA49wkxtjz8UucWnBfy21oAr3Q1mgxQXUoqtW/ph2mEQSyzVMVQab8xauKIHQ==
X-Received: by 10.112.168.194 with SMTP id zy2mr16774696lbb.120.1453403086320; 
	Thu, 21 Jan 2016 11:04:46 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163])
	by smtp.gmail.com with ESMTPSA id m21sm382496lfe.29.2016.01.21.11.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 11:04:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 22:03:47 +0300
Message-Id: <4ff20b257ac994ed1c921a11aed54ad59fd86fe0.1453402860.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v11 4/7] hw/ptimer: Support "on the fly" timer
	mode switch
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
X-TUID: DXNry10cq066

Allow switching between periodic <-> oneshot modes while timer is running.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 904a77b..a85d1ae 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -162,16 +162,17 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
 
 void ptimer_run(ptimer_state *s, int oneshot)
 {
-    if (s->enabled) {
-        return;
-    }
-    if (s->period == 0) {
+    bool was_disabled = !s->enabled;
+
+    if (was_disabled && s->period == 0) {
         fprintf(stderr, "Timer with period zero, disabling\n");
         return;
     }
     s->enabled = oneshot ? 2 : 1;
-    s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    ptimer_reload(s);
+    if (was_disabled) {
+        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        ptimer_reload(s);
+    }
 }
 
 /* Pause a timer.  Note that this may cause it to "lose" time, even if it
-- 
2.7.0

