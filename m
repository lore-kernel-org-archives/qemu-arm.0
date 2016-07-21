Received: by 10.25.21.156 with SMTP id 28csp440924lfv;
        Thu, 21 Jul 2016 07:47:18 -0700 (PDT)
X-Received: by 10.129.136.199 with SMTP id y190mr7109891ywf.198.1469112438553;
        Thu, 21 Jul 2016 07:47:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6si5201565qkb.123.2016.07.21.07.47.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQFFt-0007VI-TJ
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:47:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1k-0003DC-SC
	for qemu-arm@nongnu.org; Thu, 21 Jul 2016 10:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1j-0003tc-D5
	for qemu-arm@nongnu.org; Thu, 21 Jul 2016 10:32:40 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1c-0003nk-HI; Thu, 21 Jul 2016 10:32:32 -0400
Received: by mail-lf0-x244.google.com with SMTP id 33so5660905lfw.3;
	Thu, 21 Jul 2016 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vJwr3dsc5zcdGCA8WCch2engFoTlkaVBnsH7chLk+1A=;
	b=OFaW+JjS6jDhJGXIuP3/kHtM1A8By2qlXLgRhPUgvb4MrpYLDwYzZsDLhxeyywqSAy
	fbff28WUtOpQTYweNBHDiTNxlAj0k7zRMa+aTGJx/9AlSPAZpiTTcO3Ehe/hut2Vr0gl
	hc0X3p0iErww/HHFay5IsqPz2zxSoXxZoemAMVeQxG2IMuZ/V6LzySvDMEbGqVyrLttj
	XqLtrXQ97Kk3PjmcVy5YsTk9+QFk1+XANBTK+8Qk0Vdvd+3yxhH2BMqD9+5UcBmap9ms
	fS1XVNEYOfqUaGpxHndRBIn5S4oLhJxam7wC/yhcTf9QWh35BaZ02xCaBMxo6oDxai1X
	Zoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vJwr3dsc5zcdGCA8WCch2engFoTlkaVBnsH7chLk+1A=;
	b=MOA8OCcMTPINYHJRC1z7a2vFo7FtEuyn5pzqKFRL0okAgyJqWorPRq95R4GE97dVfD
	KFhPyIb0M36eDedNb/s6bJTLWP4oAq7Neg4UrSNHd8kr1gP9KHqW/3gwnhkxWEVtJIaf
	GVhVf81hILpPgZaGsSuLZ0E/GmioPMHkXONEpjMkv6od8xvIU5Q8VFXeqOmOsmsANWB9
	JKPPZrH2h0vtr61huEKTshh9A0Azx6wpGWmZVSV3figkejW2J+S+t7E/I5Vw8kZf95qo
	iD7qyNMutYSW4eF+Kr3pGutQKo2QogQ09joe+yZ/Os5wDcFwhIifidNPPayf+rx/Xg6l
	JbDg==
X-Gm-Message-State: ALyK8tIeprWaKosX3XjED4slVYi3oNJYuTWFwZy+fki2343JVvCZjOJZkJSf8HEzaK5NIQ==
X-Received: by 10.25.165.71 with SMTP id o68mr6541137lfe.95.1469111551705;
	Thu, 21 Jul 2016 07:32:31 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:23 +0300
Message-Id: <6e78695aaf467798388afb8a7589d29d2ebffa5b.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v15 12/15] hw/ptimer: Add "no immediate reload"
 policy
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WCTGqXgo9hYB

Immediate counter re-load on setting (or on starting to run with)
counter = 0 is a wrong behaviour for some of the timers. Add "no
immediate reload" policy that provides correct behaviour for such timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 8 +++++---
 include/hw/ptimer.h | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index d37e8ab..7747c65 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -44,7 +44,7 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         ptimer_trigger(s);
     }
 
-    if (delta == 0) {
+    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_RELOAD)) {
         delta = s->delta = s->limit;
     }
 
@@ -102,11 +102,13 @@ static void ptimer_tick(void *opaque)
 {
     ptimer_state *s = (ptimer_state *)opaque;
     ptimer_trigger(s);
-    s->delta = 0;
     if (s->enabled == 2) {
+        s->delta = 0;
         s->enabled = 0;
     } else {
-        ptimer_reload(s, 1);
+        int delta_adjust = (s->delta != 0 && s->limit != 0) ? 1 : 0;
+        s->delta = s->limit;
+        ptimer_reload(s, delta_adjust);
     }
 }
 
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index ec76183..3e49550 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -22,6 +22,8 @@
 /* Starting to run with/setting counter = 0 won't perform immediate
  * trigger.  */
 #define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
+/* Starting to run with/setting counter = 0 won't re-load counter.  */
+#define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
 
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
-- 
2.9.2

