Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5305148wrq;
        Tue, 26 Jun 2018 10:59:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeacmeCEjbbgNxoAqSafgWuPXrgFQg2nQvt0mInMttylQW9jdKgNXDb8n2FgySkK5XPIWLt
X-Received: by 2002:a0c:9588:: with SMTP id s8-v6mr2492192qvs.23.1530035957484;
        Tue, 26 Jun 2018 10:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530035957; cv=none;
        d=google.com; s=arc-20160816;
        b=f4WxE4l2FGHkfa5hY1kcLfzmDUavdrkKpttJfpgIRYsvRtdS9eEMRxyP5Udsu37ttT
         M5hFTxQK/yFcG8kHJKeJfmJ4AGKn+MmysGRclwaDmA332BUWqL1oYJGY92V7UeZO4ZQE
         rGUhaHX8ZSFksleVhTvy1HoHa4VAZlR2bHtt9n8Bglvtgii+RfNgJKX7oXjAbOaNPvIZ
         WhwoYHw3kHWUhhtKGT9qAVYJbXeyo4AgOc96q6n6obzQ225YcafV4NBBmN5ZajZoo2gO
         IubzIHDvZurgQqZO8FWSBDruoOibaIOCxqvXohAHp2uzXsPGOePmVXQw3ncN0LvwYPYE
         SK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=Yu+Phlsc+D3BG4b50x0t1+Dwo5hVY2EfIt/SLhQLQMw=;
        b=KUbvP4RD8inaF+ZTQ07PKHY36DnAEnQVZVxQP7hwn8GxRmNxHuXythrLLxkH2MXhDF
         IfyD2SzwkRf6PYcQdM7zp86UgzN9/25dZMagxUIdP1Tc+zXO/wxWHhyF7l9lC4zwv4QZ
         kuGV0aAimx9HBe0+S2iHDmERpaIUKYvU2hqUZo4nITbe3uMTbK1+pCPXhwGFg1WJ8hAm
         xLX2r2qLQdXtmCc5k4CS+ZPI2Zj+ckKn84EuYtNyZM5GQeWJNF1eCFCbL73bZNQKWj3A
         C+NxEVzMD3m91bXh8QNznolX7/UB0N9e0pupth/FR6VKm0+Eq/ZY0jwlmMih5vZTluvh
         KZdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=eOSqnclt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r76-v6si2101965qkl.279.2018.06.26.10.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 10:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=eOSqnclt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXsFI-0004ZT-SI
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 13:59:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fXsF8-0004X7-Vl
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 13:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fXsF5-0002eH-3k
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 13:59:07 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:58567)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fXsF4-0002cu-SE; Tue, 26 Jun 2018 13:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yu+Phlsc+D3BG4b50x0t1+Dwo5hVY2EfIt/SLhQLQMw=;
	b=eOSqncltqCRqVBfA6IkDUHXnDV
	2fF+xe2EXhBZR8Biu175Jd8AJ37ZJVR1rp5x/SelJfOZOAfgAm+IgEr5cmjiofp4PI2P2JJaArq1T
	+P2whuaeHKBfvJVi8PsORG8+/7EG9SF4vjok4iyf7pUpfFFMVcWrQlgMO+LxFCHtv2S0kkoqRGyol
	Dv/SxPu7NvG79RtFvRPeeGk1HXgcKEgbEHYeLUdayUoX4X9YNBRvaYGufRgApohF+xqhZPb95Ukc3
	xNW+UHukrkU9bsCJ+bm3lUebwKRzGC3/5/5LO2xKEG6e5NwH3FN6Vke0oufVFwfOjSAQf43pwprGE
	N1u0vAfw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:57792 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fXsF3-004927-1t; Tue, 26 Jun 2018 17:59:01 +0000
Date: Tue, 26 Jun 2018 10:59:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180626175900.GA4307@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
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
X-TUID: J6Qot4niPB0M

On Tue, Jun 26, 2018 at 06:17:44PM +0100, Peter Maydell wrote:
> On 19 June 2018 at 03:08, Guenter Roeck <linux@roeck-us.net> wrote:
> > The CMSDK APB timer is currently always configured as periodic timer.
> > This results in the following messages when trying to boot Linux.
> >
> > Timer with delta zero, disabling
> >
> > If the timer limit set with the RELOAD command is 0, the timer
> > needs to be enabled as one-shot timer.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  hw/timer/cmsdk-apb-timer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> > index 9878746..79c1b49 100644
> > --- a/hw/timer/cmsdk-apb-timer.c
> > +++ b/hw/timer/cmsdk-apb-timer.c
> > @@ -119,7 +119,7 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
> >          }
> >          s->ctrl = value & 0xf;
> >          if (s->ctrl & R_CTRL_EN_MASK) {
> > -            ptimer_run(s->timer, 0);
> > +            ptimer_run(s->timer, ptimer_get_limit(s->timer) == 0);
> >          } else {
> >              ptimer_stop(s->timer);
> >          }
> > --
> > 2.7.4
> 
> Thanks for this patch. I was wondering whether it would be better
> just to remove the fprintf message instead. I'll either apply
> this or send a patch to do that before 3.0, anyway.
> 

If I recall correctly, I tried that, and it did not help.
The messages don't happen too often, and the message itself
does not cause a problem. Issue is that the interrupts happen
at the wrong time or not at all (after a while, ie after the
configured one-shot time expires), and the kernel really doesn't
like that.

I think the underlying problem was that the periodic timer counts
the period down (based on the time set for the one-shot timer),
stops with the "Timer with delta zero, disabling" message once
the period reaches 0, and does not fire anymore afterwards.
As a result, the kernel fails to boot maybe 90% of the time.
I should probably have mentioned that in more detail in the
commit log.

> I think we also want to make sure we convert back to a
> periodic timer if the reload register is written with a nonzero
> value before the timer expires (and that if that happens after
> the timer expired that we restart the timer). Thinking about
> this is also on my todo list.
> 

I thought that was handled in the Linux driver by disabling
the timer, updating the period, and then re-enabling it in
periodic mode, but I may have misinterpreted the code.

Guenter
