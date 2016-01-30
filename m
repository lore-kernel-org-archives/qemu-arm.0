Received: by 10.25.159.19 with SMTP id i19csp1542097lfe;
        Sat, 30 Jan 2016 08:49:50 -0800 (PST)
X-Received: by 10.140.43.69 with SMTP id d63mr18275012qga.18.1454172590206;
        Sat, 30 Jan 2016 08:49:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si23053978qge.108.2016.01.30.08.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYib-0006Bf-Np
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:49:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgr-0002kL-87
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:48:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgm-0002Gf-2M
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:47:59 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgk-0002FL-9T; Sat, 30 Jan 2016 11:47:54 -0500
Received: by mail-lf0-x241.google.com with SMTP id n70so5192536lfn.1;
	Sat, 30 Jan 2016 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WWer0rc2pWL33b5boJH5xq5RR+38QIgAhR+3ojdQc8w=;
	b=VvArPQa+odHoN8ZRcTP5OiHZMUmG6gK+k70r8taOCDdV0nXjzkcBAvGwr7B9CMGaEE
	kSVsuEwX4JkLN6zey9AKpimSrKDsw5fAgTatuuCiO+bkB93o/DDFJ+jGJXW7DNsgQgBI
	82NgwYN9N5mDVBvYyYiOwodPxBZeq/9OGV1eXULGqRqWLrZAdETEeI0vwx+L6dh1L3gv
	VvNCRi8Fal4RfYYPk4yWsgHJ1alsMSCMz2XNw3OK/CESJhd4ik55YGxi8dVETW7OM2i6
	t5KOObrHkww0z4bkRNaFUjKKnKXjY/XDYDIjtlX8OKk08D/MEdok+SKTTGmtn+lHSbQb
	gKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WWer0rc2pWL33b5boJH5xq5RR+38QIgAhR+3ojdQc8w=;
	b=U+K2MyTzCiULdUm51ruysU8IsSsPEQLYNEHEQmPHvbgZQSF9oashSRcKsNJV2tpqvI
	6bfL4e7sup0okZUeRe+fssQkXs/5znLy5qIc77YZ15/hPVmkHcLJOmVDKXy3yjcfnYG5
	2t/hy4pYXjpnwehKQfOH0BFGP3uKHOrj3cAQubYWdMe/XRe6ICh4jBZI8ZRVthrzDJgZ
	eGgXB+9coceaEIWw6m4MFL1brPhmM9NQxV0YMZI8dQko+2FYzL+K281ZTQWSm9yd0gFK
	4KA4nKJWmRTWUNfYnXjm8rRJ2TMIF7HQDwbcKkKSgTZj0PiYUv7yEGEZjfgZcQw9wUO2
	jNWQ==
X-Gm-Message-State: AG10YOQerUN2iDrMm5bOAQKBvCQQs35UN1j1wfVAfzMkb1DvXaS+TNrf82p/Ofl8g8P/BA==
X-Received: by 10.25.41.203 with SMTP id p194mr5481512lfp.135.1454172473544;
	Sat, 30 Jan 2016 08:47:53 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:53 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:16 +0300
Message-Id: <77d17ad13f7b20deb433ca7a7b3d7cf40429665e.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v12 7/9] hw/ptimer: Fix counter - 1 returned by
	ptimer_get_count for the active timer
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
X-TUID: PgXWqZm4aMot

Due to rounding down performed by ptimer_get_count, it returns counter - 1 for
the active timer. That's incorrect because counter should decrement only after
period been expired, not before. I.e. if running timer has been loaded with
value X, then timer counter should stay with X until period expired and
decrement after. Fix this by adding 1 to the counter value for the active and
unexpired timer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 62f8cb1..b2044fb 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -136,7 +136,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                 if ((uint32_t)(period_frac << shift))
                     div += 1;
             }
-            counter = rem / div;
+            counter = rem / div + (expired ? 0 : 1);
 
             if (expired && counter != 0) {
                 /* Wrap around periodic counter.  */
-- 
2.7.0

