Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3751871wrq;
        Mon, 2 Jul 2018 08:08:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeE+6zAH3lgPpghJ3WamjBwbuvdrTLc8tzyVhU7lL4+qEdfx4SQtxHzBWB12JgacqPJIyKw
X-Received: by 2002:a37:bbc5:: with SMTP id l188-v6mr22103948qkf.243.1530544122470;
        Mon, 02 Jul 2018 08:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530544122; cv=none;
        d=google.com; s=arc-20160816;
        b=PN2L98anFcF5zxY5149ZZASUeqy6gVr1rPb+sZwaQSK/+fSBvmi/Gj34xanv8woXql
         sFprfH5P8Zq4zani5yIyY3++XxQNWgXksSYo92NAa/in+SqmekJGf2B2zYjNyTtTKYFa
         MKZdL4E3MAJ31UAh4fs7dM/E7zApLC4Z9dRz0wqJU/cNNsm5pHd+no2R6c1v5mhiTB9E
         bJGi661Ve20gzKxw/VJ3lfEb4Dd9bvclJ4BlQdt1QY1Ud00YdZSRKugXFp2yIeaStoRO
         wXRPBWwLs0Epl4bk9LeOTBLtLPgGuraL3rmPGYUg0XiUakIswtNhRP51VuYSJ4MLABuR
         3mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=isiw/leTYYLrovAe8heQUE/88QBkmyPs5lL6ZDZqvfI=;
        b=LLi927cM4FTaiQgrTXm8WjQAiZ/6gRFGVVbEEbb0B9H5WuLODpFR1PZnYRdG4iIltk
         zwweZnpTyINbNH/KOdpztmxDurFd28m60jkRwU8S+lcIxkkkEUDmSKHGm/ApOzUhFy+t
         xfQD+qbz3ca8L9BywTzKtPKEInxrHwhxHzbGLiWO9kO3m437GIblhoXE0NJD7Z45JAyf
         yLOiojfeHteeH1/iSGr8PF3DASmAoNBrDuKv9OnvLzKZWzSuQVht2s0EApz0JF68VvVK
         B3xuItV2jAKTabBJo98qk5KcAgql6EyuoOy0SZ4VKVe+gkN9KPqkqXmSQcX8NdZ1jIlr
         GNjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kqMoI5Pp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v25-v6si1172868qtv.372.2018.07.02.08.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 08:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kqMoI5Pp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa0RV-0001T7-IZ
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 11:08:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa0PC-0000IU-3A
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 11:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa0PA-0005io-Br
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 11:06:18 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fa0PA-0005iL-3K
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 11:06:16 -0400
Received: by mail-oi0-x244.google.com with SMTP id i12-v6so12567496oik.2
	for <qemu-devel@nongnu.org>; Mon, 02 Jul 2018 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=isiw/leTYYLrovAe8heQUE/88QBkmyPs5lL6ZDZqvfI=;
	b=kqMoI5Pp5AP/4Vy3RnkB9T0w/qnYB3+ufql7eeZVPMRDLBZ73fYyXu3VI7AHdCIF27
	R8MU4iIWzaZWUoe2GBjxHJZjdXS5RBKxYH7gjyOEpgM2IYo3m3QRtiAWz1ZIY0KhXzEg
	+WenqzXjqUcN8FGsxTcO7V0C5C9cv1KuBsqkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=isiw/leTYYLrovAe8heQUE/88QBkmyPs5lL6ZDZqvfI=;
	b=oKvfoN2Pjc1WaZ2E5I1+NuvNra2aQLHYOYxLCmT0KiAhe59Kbo9HfJv+u21nMmmff6
	EkDUyEDngWLS/rHf2pEZPayh1K3u6cKayAitqvdp9WxQlfHlizuUSeXsVZbRZtmbwHqY
	Fu4zPLpsHraJFkMpmRKbA2vDMC5Ix+yo5U2hewub6A5mFHMy/3fJdJyKYZbsf9k4gUmV
	e1KAqLyJxRZejj5w+/VCm5+T3nYeuZOrPaqKM5NbGMcopVJX7sYHBP66PIlBqfJdzFb2
	YrI/UMI+L0HhiH8cuzYUGeW3DoUVYWnIyKz2P5M+yPXSnF+6sMzCOHa4aqhZv2AXtJy2
	8kZA==
X-Gm-Message-State: APt69E2LclluhgJNGk7GJXB6O0p3B7HCjrPel39mwPF/YI8oBsqemYpx
	jSaNq+RDzknbo2pwOVkX6tfmaNyHd+Yi8j7Fm6U3JwlG
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr9003740oig.13.1530543975104; 
	Mon, 02 Jul 2018 08:06:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 08:05:54 -0700 (PDT)
In-Reply-To: <20180626200008.GA680@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jul 2018 16:05:54 +0100
Message-ID: <CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH] hw/char/cmsdk-apb-timer: Correctly
 identify and set one-shot mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yDUgmfyFHRt1

On 26 June 2018 at 21:00, Guenter Roeck <linux@roeck-us.net> wrote:
> Here is a log, with debug messages added to ptimer code.

Thanks for the logging. (I am currently also messing about
with buildroot to try to reproduce -- I have a kernel that
boots, but since it has no initial filesystem it hits the
"stop because I can't find init" before anything interesting
happens.)

> Without my patch:
>
> ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
> ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
> [    0.497942] clocksource: Switched to clocksource mps2-clksrc^M
> ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
>
> # up to here timer is in periodic mode and fires on a regular basis
>
> # prepare to switch to one-shot mode
> ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=0
>
> # set timer for one-shot mode, start
> ptimer_set_count(0x555556edac70, 92004
> ptimer_reload(555556edac70): frac=0 period=40 delta=92004 limit=0 adjust=0
>
> # one-shot mode fires
> ptimer_tick(0x555556edac70): enabled=1 delta=92004 limit=0
>
> # timer is in periodic mode, limit is 0 (from one-shot mode)
> # reload propagates limit -> delta, making it 0
> ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
>
> # and the timer is disabled as result.
> 0x555556edac70: Timer with delta zero, disabling
>
> ptimer_set_count(0x555556edac70, 199340
> ptimer_reload(555556edac70): frac=0 period=40 delta=199340 limit=0 adjust=0
> [    0.514458] NET: Registered protocol family 2^M
> ptimer_tick(0x555556edac70): enabled=1 delta=199340 limit=0
> ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
> 0x555556edac70: Timer with delta zero, disabling
> ptimer_set_count(0x555556edac70, 240488
> ptimer_reload(555556edac70): frac=0 period=40 delta=240488 limit=0 adjust=0
> [    0.526096] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096
> bytes)^M
> [    0.526533] TCP established hash table entries: 1024 (order: 0, 4096 bytes)^M
> [    0.526943] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)^M
> ptimer_tick(0x555556edac70): enabled=1 delta=240488 limit=0
> ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
> 0x555556edac70: Timer with delta zero, disabling

OK, but I can't see anything actually going wrong here. Once
the guest sets the RELOAD register to 0, it gets one-shot timers, and
needs to write to VALUE each time to restart the timer. We seem to get
calls to set_count which set different counts, and a a tick for each
set_count, so that looks like it's working to me. (But see below...)

> And so on. The system may finish booting or lock up. Which one it is seems
> to be random.
>
> Same log with my patch applied:
>
> ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
>
> # switch to one-shot mode
> ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=0
>
> @ set counter, start
> ptimer_set_count(0x555556edac70, 24
> ptimer_reload(555556edac70): frac=0 period=40 delta=24 limit=0 adjust=0
>
> # tick
> ptimer_tick(0x555556edac70): enabled=2 delta=24 limit=0
>
> # update counter, restart
> ptimer_set_count(0x555556edac70, 209498
> ptimer_reload(555556edac70): frac=0 period=40 delta=209498 limit=0 adjust=0
> [    0.509883] NET: Registered protocol family 2^M
>
> # tick
> ptimer_tick(0x555556edac70): enabled=2 delta=209498 limit=0
>
> # update counter, restart
> ptimer_set_count(0x555556edac70, 217500
> ptimer_reload(555556edac70): frac=0 period=40 delta=217500 limit=0 adjust=0
>
> # tick
> ptimer_tick(0x555556edac70): enabled=2 delta=217500 limit=0

This doesn't seem to be behaving any differently (apart from
having silenced the fprintf about the zero delta).

My reading of the code in ptimer_tick() is that the behaviour
for "this was setup as a one-shot" is in effect the same as
for "this was setup as periodic but the reload value is 0"
is the same: it sets enabled to 0 and delta to 0.

One thing I do notice reading the code is that we don't
actually do anything to re-enable the timer on a write to
the VALUE register. We call ptimer_set_count(), but that will
not reenable the timer if it was disabled -- the cmsdk timer
code needs to call ptimer_run() if necessary, I think. But
that bug should manifest whether we're setting the timer up
as a one-shot or as a periodic with a 0 limit, because
ptimer_tick() will disable the timer when it fires whichever
way we do that.

thanks
-- PMM
