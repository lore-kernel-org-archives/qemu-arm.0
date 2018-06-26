Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5346093wrq;
        Tue, 26 Jun 2018 11:43:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpckvlFfiXInl3i7cn+YVuzO1xWEAIRmrZGP6fb3XFOYf2zX0eGNpnSSKEfmNUQWc7/v2C6+
X-Received: by 2002:a37:1741:: with SMTP id i62-v6mr2423138qkh.147.1530038635544;
        Tue, 26 Jun 2018 11:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530038635; cv=none;
        d=google.com; s=arc-20160816;
        b=ccrFLTp5yu/WtSPjeT+9OMoughBnZrq3I1wmL/jaMhp5iCqzIX+RfkeGFxNYuLObly
         l7oHua/Lh6wCvmAJjq4d+b9S7GHDh4PJF+1krH2MLHSJZMsF1uRpqu9hERuL2aorHmum
         dT265xqwuw6Zw6T7Me4SrYKGCfpNrvLESShXHNbGayL3vVA6JPhHJrrHjy2hhCG3/u+F
         60kgUQWOZfeE8MzkieQr+Mv9H5x+pY6z1MDJls0RMQeqOY8v+2EkCRMfXz4dWxNoexJG
         U92osj6A/7CKbu1yJpDjiBONZJeDZjaz48pGX4lIkMzxJrWgsHM3sLHE6oKk2PAyLfTD
         gndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=JtmjEuZs6JFiutdHWX+GXESG7Ho5YAL2jDPWaB43vFY=;
        b=NNKC0UY+5uXvqHVAr2FhQgxy4L2STFyuDsrsmeG3vdyxj/pqnA3K83Om5Ms9IihB8x
         voxT5OkplSYmvCm/TXSzg0yFmlxO1fzK4zi4Ozn1UQE7smWBTasemouOEAVrzVBWC7Nv
         0yAoZS7ngykNPgyNDG8EfUaXQtg+bepZezFy+CdrHvgxLfYVaZyAmWIub+HhVZQN8nTk
         NXe3wYEZjPQqyREGS27tqK3doiW+JHZD+bMCSaaKjDhGRNLDSwsL7OvO2g+weZb5cN4U
         7FbUqOchOV5r//vM2qlxO4bfYlHE7eUjOD1tYN0J38++XOmIICtAzta3pJrQ95BLLZtc
         bsQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b="E8rzn/7Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s124-v6si2094226qkf.112.2018.06.26.11.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 11:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b="E8rzn/7Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXswV-0000v1-43
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 14:43:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fXswO-0000ul-Ng
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fXswK-0004rk-Mc
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:43:48 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:53024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fXswK-0004rK-Ec; Tue, 26 Jun 2018 14:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JtmjEuZs6JFiutdHWX+GXESG7Ho5YAL2jDPWaB43vFY=;
	b=E8rzn/7YEE3nEP3bhiR6oLy9YW
	wMmD6/DK1HjQ1YkjAfhxodEcgcc2jjY5IU75xdBH6PaBk6nFuYvUE5sAUZ3KFCqKgTMdYxq+NcEEo
	L93iLVvEeX7eAViR5FZPLN3BRd4PHqdQHcwttVIStMaw1jDm7rk9mpwdM4fFP/QtblXgQIDbigFHO
	AxpwpXC+AsOdSN1+7uREn4UZ1DqV7Nt2bInDxEaHcBoBRQPl3fVRNCJykscyPMVeGAVfxi1Gg3q/g
	ezcfACErOx4NObXwUfmogrQZBLyolj0iosewKsA/Sc1ljrTCb7qtYPiXMV47B2jZX3H6VEUQeXrqe
	K7NVGO4A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:57994 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fXswI-005Bb3-JN; Tue, 26 Jun 2018 18:43:43 +0000
Date: Tue, 26 Jun 2018 11:43:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180626184341.GA5039@roeck-us.net>
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
X-TUID: Zu8rld6L76I7

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

I had added some debug messages into the timer code and noticed
the behavior. If I recall correctly, for periodic timers, the timer
period counts down in ptimer_reload(). At some point, it reaches
zero, and the timer stops working. The behavior is different
between one-shot and periodic timers; I think that count-down
does not happen with one-shot timers. This also has to do with the
timer limit which is 0 for one-shot timers but != 0 for periodic
timers and is used in various locations in hw/core/ptimer.c.

This was with Cortex-M3 where you said you won't accept my patches
to add initrd/dtb/bios support, so the qemu version would not be
an official one and has functionality not available in upstream qemu
(it has other changes but those are relevant for reproducing the
problem). My qemu clone is at git@github.com:groeck/qemu.git in branch
v2.12.0-local. It includes this patch. The test scripts are at
git@github.com:groeck/linux-build-test.git, in the rootfs/arm/
subdirectory.

I can try to reproduce it myself tonight and send you a log,
but no promises.

Guenter

> >> periodic timer if the reload register is written with a nonzero
> >> value before the timer expires (and that if that happens after
> >> the timer expired that we restart the timer). Thinking about
> >> this is also on my todo list.
> >>
> >
> > I thought that was handled in the Linux driver by disabling
> > the timer, updating the period, and then re-enabling it in
> > periodic mode, but I may have misinterpreted the code.
> 
> Yeah, it would depend what the guest does whether it's affected,
> but my reading of the data sheet is that messing with the reload
> register with the timer still active isn't prohibited.
> 
> thanks
> -- PMM
