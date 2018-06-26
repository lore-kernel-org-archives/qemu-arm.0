Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5410316wrq;
        Tue, 26 Jun 2018 13:00:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfCWbcwVwfvnngkhLDzKILLS+WGfmdrwFVqOaduaBcotitmwrPqwZhaNl547siYx6Aa982T
X-Received: by 2002:a0c:85e3:: with SMTP id o90-v6mr2837507qva.161.1530043239530;
        Tue, 26 Jun 2018 13:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530043239; cv=none;
        d=google.com; s=arc-20160816;
        b=AgFnH+1kMYM1lra04wb0AJxXlTzYSXP7zN2Y76K/EZqQKxpdCYZhqlkgzn0GR/7o5f
         5u20Nf9YvSl+HnVBPAA5JOVFJD/F2dMTkJQo/8bf6GmpkTigtPDhkN0MfPKo1kZU7iIh
         /Gnkt4i0/P/dBiQ70jYuX+rEKWzvpx+LGOEDWiExsfT2piHwRvRCG0unIQfVJHxG8EfT
         wCKxzcyFcng4NG83VqlqEZEKZDuuJwF44pWp08vxiN77IqqHd5iaSk5+DMODJmWSIClb
         eODeZeEVigNJYnw09YI7olyvt9SfqixhixANwYY5WIPVHNOybXtSM+oiamj/ajyLgj0h
         K3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=CF/yMqVeO6o1W71MGqftKXUQgRr+AGJfPnCS2WWWdRw=;
        b=0PhfZOdMo8M2rKub0TeE+WYdQczcSLvZPGelfOHCkR0zTJa/WpMrMQzMEJ1/d5QkL6
         qOsAUrhYAM6HgCwqLw0RlUcHRnbVFPN0lSXmCiVzazpkyhYyIvEOpDrRQ64eoIfyfZyG
         1pFu/PVrBlnyEyrRcOYjaHVgB+pnlFUDWDI8tZ8ivQdFxryLLLuP7mAk0jCoU4vzf4kF
         KzbGJNfx7lijefhdUJdGSdPcd4QRWcsGygqnL6U6DLxBP7uBqQuoXdXmavenQ+oMgNRh
         UDGbKZxe37cF7z8ObRqpDBFR2gbXFQWHH+kkZkhCClD+F1smwIFGB6dbeY7M6zTNOQ+P
         E+mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=W91wbA8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u77-v6si2345650qku.260.2018.06.26.13.00.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 13:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=W91wbA8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXu8k-00035G-RX
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 16:00:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fXu8W-00033r-Jz
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fXu8T-0004s1-I2
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:00:24 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:45329)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fXu8T-0004jW-6o; Tue, 26 Jun 2018 16:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CF/yMqVeO6o1W71MGqftKXUQgRr+AGJfPnCS2WWWdRw=;
	b=W91wbA8WwrQbSsopNbuWxEoXb0
	880OCgmF9jF85JRalnIz8H0BPySnk9ePtgXlk1A72+NOX/gR8gBozi1GbyF67ofdr44Oh20XL9MPd
	RYgEMYcH40z7iY5ZChlW2IMFv6CZwqswubvxTenXIKp734+nuVqsjNKfpoJ6K43EiHgJlAbIpU91N
	p1dMvrclTEBNvqNkcrnlyEdJ5SF0otd/Nf4j0eE4FbzDbHMGPNtcGQUsnPgsIE3d/lrNREvyVRGyC
	qdWtTwApsp7o7THpGL7QCRC7cQFPJ4jvR9uc6u5NLT1cBl66yFUw0YObuR6n/uS71bPYtdE8X+r2W
	PDJnD1aw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:58340 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fXu8G-0088E5-U6; Tue, 26 Jun 2018 20:00:09 +0000
Date: Tue, 26 Jun 2018 13:00:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180626200008.GA680@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
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
X-TUID: fqQzAtB+9Osa

On Tue, Jun 26, 2018 at 07:10:45PM +0100, Peter Maydell wrote:
> On 26 June 2018 at 18:59, Guenter Roeck <linux@roeck-us.net> wrote:
> > On Tue, Jun 26, 2018 at 06:17:44PM +0100, Peter Maydell wrote:
> >> Thanks for this patch. I was wondering whether it would be better
> >> just to remove the fprintf message instead. I'll either apply
> >> this or send a patch to do that before 3.0, anyway.
> >>
> >
> > If I recall correctly, I tried that, and it did not help.
> > The messages don't happen too often, and the message itself
> > does not cause a problem. Issue is that the interrupts happen
> > at the wrong time or not at all (after a while, ie after the
> > configured one-shot time expires), and the kernel really doesn't
> > like that.
> >
> > I think the underlying problem was that the periodic timer counts
> > the period down (based on the time set for the one-shot timer),
> > stops with the "Timer with delta zero, disabling" message once
> > the period reaches 0, and does not fire anymore afterwards.
> > As a result, the kernel fails to boot maybe 90% of the time.
> > I should probably have mentioned that in more detail in the
> > commit log.
> 
> Hmm, that's odd, because I don't really see what the difference
> between the two is. If you set the thing as a one-shot then we
> won't reenable the timer later either with this patch.
> 
> Can you provide an image/QEMU command line that repros this,
> and I'll see if I can find time to investigate it? (We have
> a softfreeze deadline next Tuesday, so I probably won't be
> able to get to it until after that, but since this is a bugfix
> it doesn't have to be done before freeze.)
> 

Here is a log, with debug messages added to ptimer code.

Without my patch:

ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1
[    0.497942] clocksource: Switched to clocksource mps2-clksrc^M
ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1

# up to here timer is in periodic mode and fires on a regular basis

# prepare to switch to one-shot mode
ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=0

# set timer for one-shot mode, start
ptimer_set_count(0x555556edac70, 92004
ptimer_reload(555556edac70): frac=0 period=40 delta=92004 limit=0 adjust=0

# one-shot mode fires
ptimer_tick(0x555556edac70): enabled=1 delta=92004 limit=0

# timer is in periodic mode, limit is 0 (from one-shot mode)
# reload propagates limit -> delta, making it 0
ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1

# and the timer is disabled as result.
0x555556edac70: Timer with delta zero, disabling

ptimer_set_count(0x555556edac70, 199340
ptimer_reload(555556edac70): frac=0 period=40 delta=199340 limit=0 adjust=0
[    0.514458] NET: Registered protocol family 2^M
ptimer_tick(0x555556edac70): enabled=1 delta=199340 limit=0
ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
0x555556edac70: Timer with delta zero, disabling
ptimer_set_count(0x555556edac70, 240488
ptimer_reload(555556edac70): frac=0 period=40 delta=240488 limit=0 adjust=0
[    0.526096] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096
bytes)^M
[    0.526533] TCP established hash table entries: 1024 (order: 0, 4096 bytes)^M
[    0.526943] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)^M
ptimer_tick(0x555556edac70): enabled=1 delta=240488 limit=0
ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=-1
0x555556edac70: Timer with delta zero, disabling

And so on. The system may finish booting or lock up. Which one it is seems
to be random.

Same log with my patch applied:

ptimer_tick(0x555556edac70): enabled=1 delta=250000 limit=250000
ptimer_reload(555556edac70): frac=0 period=40 delta=250000 limit=250000 adjust=1

# switch to one-shot mode
ptimer_reload(555556edac70): frac=0 period=40 delta=0 limit=0 adjust=0

@ set counter, start
ptimer_set_count(0x555556edac70, 24
ptimer_reload(555556edac70): frac=0 period=40 delta=24 limit=0 adjust=0

# tick
ptimer_tick(0x555556edac70): enabled=2 delta=24 limit=0

# update counter, restart
ptimer_set_count(0x555556edac70, 209498
ptimer_reload(555556edac70): frac=0 period=40 delta=209498 limit=0 adjust=0
[    0.509883] NET: Registered protocol family 2^M

# tick
ptimer_tick(0x555556edac70): enabled=2 delta=209498 limit=0

# update counter, restart
ptimer_set_count(0x555556edac70, 217500
ptimer_reload(555556edac70): frac=0 period=40 delta=217500 limit=0 adjust=0

# tick
ptimer_tick(0x555556edac70): enabled=2 delta=217500 limit=0

# update counter, restart
ptimer_set_count(0x555556edac70, 236941
ptimer_reload(555556edac70): frac=0 period=40 delta=236941 limit=0 adjust=0
[    0.529228] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes)^M
[    0.529661] TCP established hash table entries: 1024 (order: 0, 4096 bytes)^M
[    0.530059] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)^M
[    0.530535] TCP: Hash tables configured (established 1024 bind 1024)^M

# tick
ptimer_tick(0x555556edac70): enabled=2 delta=236941 limit=0

# update counter, restart
ptimer_set_count(0x555556edac70, 245934
ptimer_reload(555556edac70): frac=0 period=40 delta=245934 limit=0 adjust=0

and so on.

Hope this helps,

Guenter
