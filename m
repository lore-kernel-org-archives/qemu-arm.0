Received: by 10.25.159.19 with SMTP id i19csp708447lfe;
        Tue, 2 Feb 2016 07:20:44 -0800 (PST)
X-Received: by 10.55.82.137 with SMTP id g131mr35341991qkb.66.1454426444863;
        Tue, 02 Feb 2016 07:20:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si1399623qgb.59.2016.02.02.07.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Feb 2016 07:20:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQcl1-000231-9I
	for alex.bennee@linaro.org; Tue, 02 Feb 2016 10:20:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aQcky-00022P-IC
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 10:20:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aQckv-0002mn-Sg
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 10:20:40 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:36725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aQckv-0002mH-FI; Tue, 02 Feb 2016 10:20:37 -0500
Received: by mail-lb0-x242.google.com with SMTP id zr1so3924409lbb.3;
	Tue, 02 Feb 2016 07:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=XBEp9X+uFFvxkBwnye6PkLPjsMcHEWxhh+CJR2TdZtU=;
	b=R6xwuMvr8T0zGcTUbymf7t8UVSaW6I2eURcgUBhgWt5zKIbcLNyRTOmOJKPFLLrGNZ
	D+L81rsRmssfLWj4mZrFF0Jug0Koi7wQkUWKq6oiY5i1nOSU52aef/r1vx9lCiuBz6vC
	HG7TIPFIrfs1jqwuTwCN/6Z0mIFSH9E1WNH7ixGC2dYfCOG+6rK3wELFW34k6xkf9YOu
	bEVB+RN6NwcBudaNu1JvOC5Yx7Mvgr3G9K5mLg/4s5AgeKzUMDn3Z1NAajcKcF/5vRuY
	0wvs7z0OZRyoqi3oYPvyFoTc9GDOvM2VBmbgfr8CTwD465V3Fqb+5zc3lSR9ZzTOzmvg
	pR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XBEp9X+uFFvxkBwnye6PkLPjsMcHEWxhh+CJR2TdZtU=;
	b=bQZgVcD/VDCbDmGxV+g0V7kfw+5O8qpM9QydBo0LdLCeiuZOavXP6NmOmVIQB240t7
	W2qh1tSZIsHYpuZg44xhD0HhyLATR4RmVD6Vql5lzJyAxRGeSvUXc77af1cas0LdJIUQ
	+1gsRrS+Gntd/Lc9XpKe2zwDe9iUp4ezGD+/nuKA3fm+okiNH8BMT9pwDL1NPMzEqb4V
	Z+IrRxGbL3A8JrMhipSVf74c9mcZys2n0HB1auMu6C3pVhDpF1THFHggPzlQiz7o2JX4
	BBOD+t2UTb2MTBd7gu0dqc7bxeo0zyOjpmJxsM6gkobYZtVyQuhE8WD5FnwWppN9d/OY
	ZEIg==
X-Gm-Message-State: AG10YOQfuDOMIJMaBOZWTHTLZRd4OUCgerNKcuggT+rOLTVCJ6QULtf0UDTuZLxmdkor6g==
X-Received: by 10.112.77.8 with SMTP id o8mr9607459lbw.53.1454426436282;
	Tue, 02 Feb 2016 07:20:36 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	ey6sm272425lbc.36.2016.02.02.07.20.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Feb 2016 07:20:35 -0800 (PST)
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <cover.1454169735.git.digetx@gmail.com>
	<77d17ad13f7b20deb433ca7a7b3d7cf40429665e.1454169735.git.digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56B0C90B.7000300@gmail.com>
Date: Tue, 2 Feb 2016 18:19:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <77d17ad13f7b20deb433ca7a7b3d7cf40429665e.1454169735.git.digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v12 7/9] hw/ptimer: Fix counter - 1 returned
 by ptimer_get_count for the active timer
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
X-TUID: /3KWkcE+giKi

30.01.2016 19:43, Dmitry Osipenko пишет:
> Due to rounding down performed by ptimer_get_count, it returns counter - 1 for
> the active timer. That's incorrect because counter should decrement only after
> period been expired, not before. I.e. if running timer has been loaded with
> value X, then timer counter should stay with X until period expired and
> decrement after. Fix this by adding 1 to the counter value for the active and
> unexpired timer.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   hw/core/ptimer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 62f8cb1..b2044fb 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -136,7 +136,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                   if ((uint32_t)(period_frac << shift))
>                       div += 1;
>               }
> -            counter = rem / div;
> +            counter = rem / div + (expired ? 0 : 1);
>
>               if (expired && counter != 0) {
>                   /* Wrap around periodic counter.  */
>

Noticed one nit here:

There is possibility to return timer counter = limit + 1, if the following 
ptimer calls execute in less than 1ns.

	ptimer_run(t, 1);
	// counter = 91, if set() count executed in less than 1ns
	ptimer_set_count(t, 90);
	counter = ptimer_get_count(t);

Likely, it would be impossible to trigger that issue on a real current machine.
But the fix is trivial, I'll incorporate it in V13 if it looks fine:

---
@@ -76,20 +76,20 @@ static void ptimer_tick(void *opaque)
  {
      ptimer_state *s = (ptimer_state *)opaque;
      s->delta = 0;
      ptimer_reload(s);
  }

  uint64_t ptimer_get_count(ptimer_state *s)
  {
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
      uint64_t counter;

-    if (s->enabled && s->delta != 0) {
-        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    if (s->enabled && s->delta != 0 && now != s->last_event) {
          int64_t next = s->next_event;
          bool expired = (now - next >= 0);
          bool oneshot = (s->enabled == 2);

          /* Figure out the current counter value.  */
          if (expired && (oneshot || use_icount)) {
              /* Prevent timer underflowing if it should already have
                 triggered.  */
@@ -131,17 +131,17 @@ uint64_t ptimer_get_count(ptimer_state *s)
              } else {
                  if (shift != 0)
                      div |= (period_frac >> (32 - shift));
                  /* Look at remaining bits of period_frac and round div up if
                     necessary.  */
                  if ((uint32_t)(period_frac << shift))
                      div += 1;
              }
-            counter = rem / div;
+            counter = rem / div + (expired ? 0 : 1);

              if (expired && counter != 0) {
                  /* Wrap around periodic counter.  */
                  counter = s->limit - (counter - 1) % s->limit;
              }
          }
      } else {
          counter = s->delta;


-- 
Dmitry
