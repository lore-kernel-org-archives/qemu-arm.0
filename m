Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp80039wrq;
        Mon, 2 Jul 2018 09:52:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfY1lF2PSpN6/prHuF+v3d1yNi2uBQlRD46pKzo19nG4Ab+TxEBG34oWtDsY0Vn9265Bas0
X-Received: by 2002:a0c:88ad:: with SMTP id 42-v6mr23166244qvn.61.1530550321274;
        Mon, 02 Jul 2018 09:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530550321; cv=none;
        d=google.com; s=arc-20160816;
        b=m6+RfETYWxv0xx4QVWsAPylJOzg17rdqBiK1Tw2+rtcHlGF92e3n7dbA3BBjWfcwCQ
         NBl2qZ1A2dGzmLbjZi3Lti9ZNiPo7og5ScfK8/HUwBmY1rlRSSzJy/6Dp22Kbjru79Rc
         je8QWzDYJ2I64bsbXJr0i9AoqrSmtrJWIDLT60g+fWcr1EDCIkQezQp7sW3NmG3d9ox6
         frT/8bXPQgkWEORWJ6WRpuMQBZYoLZrRfszMSWD37D9LqqzsszCgu1ELZytuuC4CK/dv
         I7uhXsjHdfOL2eEdr8aG6XGC1dG9n3pjmo22xqWkOqKf69uNnjqxKfgr5tCqgg9nhFNf
         BL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=7QMKzZwrw8vpaZyXV5Cmknxm1IUivBTQbmnNpHjr5T4=;
        b=zaLngLL/3ouEGQyQFJgVAG+33OOf+rczqipMq1J9BcipIesexl8h0z1r/veuPBxE9u
         jy9x2SkokOHx8UguQCm5ViGQYkoWSHkAhOIhEuMDSB+FGq3kFYSIAmr6Z/hLRX6+Uula
         T5+7b50OHHjtoWFch3WmwnkHf5ujId/PGyvyMrueiE34ECIzymHosHyx0vf+/QLwgagd
         1yhdsfb6IsLgD/dZdGvihZfs3XL3OjdLlnFhAV7yNyphqyfFnoUJ+5dHop5Z/8+QUb3t
         d0tXudbam/06WENoGL7w6SZk1oM1nlTlkeJ/MB4Eh9JvbilAM9UTdzQwVdsBUCfIrqE9
         aPpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=IGKWPqhn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18-v6si3737449qti.257.2018.07.02.09.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 09:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=IGKWPqhn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa23U-0001ma-MG
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 12:52:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa1g6-0000LJ-BP
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 12:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa1g3-0000yW-5X
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 12:27:50 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:49534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fa1g2-0000vx-Rb; Mon, 02 Jul 2018 12:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7QMKzZwrw8vpaZyXV5Cmknxm1IUivBTQbmnNpHjr5T4=;
	b=IGKWPqhnZ6OMVAdGyIg8PmU4y/
	uncNd80cGIL2AoVaA1I9GaVZw0I0JKbKj2ZE++uIuwJrzFz+gJznA24UzGGX3b2NVXjB+9nQMH+Sd
	oA4PuFSj6yC5XryL5qoCWy8AnxqrmMPT3O7lKBTsS/IiHby0woNSvHqCNr70l6KN2gbc1gMskXGya
	FaszjItYHZC8TwlmSsb2/UmoB7xSwm3cMtK2vVXgGpIct41zSXgGxLFMjsPfnPdtkH9XPxZR0XW3D
	m5LnPb0etw/QnkiWkaS343x16nWUE8DwNRxUxLhALDxE1UgDG+MhomqsJYFfd3J4t5Ad9AilwhU5j
	rEdmhfpg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:57240 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fa1fq-009NdN-Kc; Mon, 02 Jul 2018 16:27:35 +0000
Date: Mon, 2 Jul 2018 09:27:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180702162733.GB32333@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 208.91.199.152
Subject: Re: [Qemu-arm] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYrsratZKvf1

On Mon, Jul 02, 2018 at 04:05:54PM +0100, Peter Maydell wrote:
> On 26 June 2018 at 21:00, Guenter Roeck <linux@roeck-us.net> wrote:
> > Here is a log, with debug messages added to ptimer code.
> 
> Thanks for the logging. (I am currently also messing about
> with buildroot to try to reproduce -- I have a kernel that
> boots, but since it has no initial filesystem it hits the
> "stop because I can't find init" before anything interesting
> happens.)
> 
> > Without my patch:
> >
> > ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> > ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
> > ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> > ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
> > [    0.497942] clocksource: Switched to clocksource mps2-clksrc^M
> > ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> > ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
> >
> > # up to here timer is in periodic mode and fires on a regular basis
> >
> > # prepare to switch to one-shot mode
> > ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=0
> >
> > # set timer for one-shot mode, start
> > ptimer_set_count(0x555556edac70, 92004
> > ptimer_reload(555556edac70): frac=0 period=40 delta=92004 limit=0 adjust=0
> >
> > # one-shot mode fires
> > ptimer_tick(0x555556edac70): enabled=1 delta=92004 limit=0
> >
> > # timer is in periodic mode, limit is 0 (from one-shot mode)
> > # reload propagates limit -> delta, making it 0
> > ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
> >
> > # and the timer is disabled as result.
> > 0x555556edac70: Timer with delta zero, disabling
> >
> > ptimer_set_count(0x555556edac70, 199340
> > ptimer_reload(555556edac70): frac=0 period=40 delta=199340 limit=0 adjust=0
> > [    0.514458] NET: Registered protocol family 2^M
> > ptimer_tick(0x555556edac70): enabled=1 delta=199340 limit=0
> > ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
> > 0x555556edac70: Timer with delta zero, disabling
> > ptimer_set_count(0x555556edac70, 240488
> > ptimer_reload(555556edac70): frac=0 period=40 delta=240488 limit=0 adjust=0
> > [    0.526096] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096
> > bytes)^M
> > [    0.526533] TCP established hash table entries: 1024 (order: 0, 4096 bytes)^M
> > [    0.526943] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)^M
> > ptimer_tick(0x555556edac70): enabled=1 delta=240488 limit=0
> > ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
> > 0x555556edac70: Timer with delta zero, disabling
> 
> OK, but I can't see anything actually going wrong here. Once
> the guest sets the RELOAD register to 0, it gets one-shot timers, and
> needs to write to VALUE each time to restart the timer. We seem to get
> calls to set_count which set different counts, and a a tick for each
> set_count, so that looks like it's working to me. (But see below...)
> 

Sometimes the timer doesn't fire or is not reloaded when expected, causing
the system to stall. It also seemed to me that the timer fires at the wrong
time, ie at the period instead of the selected one-time value, but I may
misinterpret the log.

> > And so on. The system may finish booting or lock up. Which one it is seems
> > to be random.
> >
> > Same log with my patch applied:
> >
> > ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
> > ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
> >
> > # switch to one-shot mode
> > ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=0
> >
> > @ set counter, start
> > ptimer_set_count(0x555556edac70, 24
> > ptimer_reload(555556edac70): frac=0 period=40 delta=24 limit=0 adjust=0
> >
> > # tick
> > ptimer_tick(0x555556edac70): enabled=2 delta=24 limit=0
> >
> > # update counter, restart
> > ptimer_set_count(0x555556edac70, 209498
> > ptimer_reload(555556edac70): frac=0 period=40 delta=209498 limit=0 adjust=0
> > [    0.509883] NET: Registered protocol family 2^M
> >
> > # tick
> > ptimer_tick(0x555556edac70): enabled=2 delta=209498 limit=0
> >
> > # update counter, restart
> > ptimer_set_count(0x555556edac70, 217500
> > ptimer_reload(555556edac70): frac=0 period=40 delta=217500 limit=0 adjust=0
> >
> > # tick
> > ptimer_tick(0x555556edac70): enabled=2 delta=217500 limit=0
> 
> This doesn't seem to be behaving any differently (apart from
> having silenced the fprintf about the zero delta).
> 
> My reading of the code in ptimer_tick() is that the behaviour
> for "this was setup as a one-shot" is in effect the same as
> for "this was setup as periodic but the reload value is 0"
> is the same: it sets enabled to 0 and delta to 0.
> 

To me the second log looks more predictive than the first, but that
may just be me.

Again, in my observation the boot sometimes stalls without my
patch. Maybe there is a better fix, but the code as-is doesn't
work for me. All I can say is that the current code does not set
one-shot mode when it should, and that seems wrong.

You could of course take out the zero delta warning. Personally
I would caution against that - whenever I have seen that warning,
it suggested that something is wrong with the emulation, and it
helped me track down the problem. Your call, of course. Also,
I don't think taking out the warning would fix my stall problem.

Thanks,
Guenter

> One thing I do notice reading the code is that we don't
> actually do anything to re-enable the timer on a write to
> the VALUE register. We call ptimer_set_count(), but that will
> not reenable the timer if it was disabled -- the cmsdk timer
> code needs to call ptimer_run() if necessary, I think. But
> that bug should manifest whether we're setting the timer up
> as a one-shot or as a periodic with a 0 limit, because
> ptimer_tick() will disable the timer when it fires whichever
> way we do that.
> 
> thanks
> -- PMM
