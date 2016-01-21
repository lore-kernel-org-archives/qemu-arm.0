Received: by 10.25.159.19 with SMTP id i19csp3908847lfe;
        Thu, 21 Jan 2016 11:05:33 -0800 (PST)
X-Received: by 10.140.30.197 with SMTP id d63mr54142910qgd.81.1453403133266;
        Thu, 21 Jan 2016 11:05:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si124175qkj.38.2016.01.21.11.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 11:05:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMKY0-0008L4-Ni
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 14:05:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXK-0007RS-0h
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXG-0001CS-AX
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:49 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:34696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aMKXG-0001C0-3I; Thu, 21 Jan 2016 14:04:46 -0500
Received: by mail-lb0-x241.google.com with SMTP id oe3so2465564lbb.1;
	Thu, 21 Jan 2016 11:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=496mFPH1cBgqLJuGgW27lhsFvxpjBxKrP6ooKxBuEfg=;
	b=S6SvdlXi/G7xDGmWLVUiOKboum+/wqUUzm+imyCUFlvmqYYu9hkFkVtOs38tkVFcl/
	zjSzlcMrXF/Ft0dCGE7FpGcJv48saNutD1w7+gSmYpS+pkrBIbtSlvAn94zc2wROl6Xo
	i01KghFY+Qyc6fcx9sqYmbX2ATgS6sH1Y6A9CnwBLkY1RcmJFjxUCZ+yuEql5lo5hjr6
	/urBHquWS4cOldI1fDdxAc8dmISrUimnJJSchnmPXPe2MlilC1BZKkOshfessVCS5M7I
	iXaUIoUqazsDGhNIcA40RYgM0jt4j6Pbosj/8wKtnB7oZ3/x8+A5Td9CYMfTsOWskPVR
	5OSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=496mFPH1cBgqLJuGgW27lhsFvxpjBxKrP6ooKxBuEfg=;
	b=EWbu5yUI+Eg6LeEM9FvpogQnjo6zNmyZ6DdiiJ0vcCGulmomvRfvvwRqUMyKdUbsJr
	AUxa6j/w5MNumzFUw8kvy0Cku0kAiKCUCvjyYo5nhC8JnEq13xWpDvHR06h6NzMTbCNu
	dgKz+OLZs6lIWxFakJLc6/bjDCIu/UHeszPTOZSYTdz+2tATagcIAY0wBC6JdcJerKtA
	wPvbir0o1zjIcAxQlJjEbs2A3/YgohVkBUVSjPkwVY2ssxTNqJ2Puhqq0IJ9Km8fT6lT
	BNA1q/167EHX/1xm+Bg66KH+vcq4lv3G+c2WUMrrE/vqmIIDA6IpHDZAvO8Td46ngJG7
	t26Q==
X-Gm-Message-State: ALoCoQkfO2ozgw7Pz+6EBk9hwaqWLJfZ8dl5h2Z4Y0IgHqKBU1MYoWZtt/EkSll+WGtQv6CyoewKrz73UEz6TCCBczY7Fi2VGQ==
X-Received: by 10.112.168.5 with SMTP id zs5mr16797439lbb.56.1453403085416;
	Thu, 21 Jan 2016 11:04:45 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163])
	by smtp.gmail.com with ESMTPSA id m21sm382496lfe.29.2016.01.21.11.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 11:04:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 22:03:46 +0300
Message-Id: <ee1f0c74b440ec31814bf0c8b8c84d4e4e1097fa.1453402860.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v11 3/7] hw/ptimer: Update .delta on
	period/freq change
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
X-TUID: PBsoYhabPJY2

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
index cb50d30..904a77b 100644
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

