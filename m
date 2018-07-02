Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp177402wrq;
        Mon, 2 Jul 2018 11:37:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcZG6PjOGtJPpJO+Tvo/feJID6o+bf+d8IX5AJf3msKrwl9ceXHb7Ps1MSwCwZ3I8tAGzY/
X-Received: by 2002:a37:f50a:: with SMTP id l10-v6mr22521935qkk.109.1530556659546;
        Mon, 02 Jul 2018 11:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530556659; cv=none;
        d=google.com; s=arc-20160816;
        b=hY7p8d2SXc2e6dHm7tbrro6sRHp+5kznQG8eJs3tO7x7Bw5R5Up65yIdzakHT48oHQ
         hgQt4KPqtxdhWVg17vrupxtUV6+QVw8ttTM7c+yXjkz8+3ZgUzzD36sNR7wYakzjdwSM
         VJChrXZr4YlTZjVH9U2eXXrh9UY7j+9fcRGiuyLB9wK/8a08cuw3UKW4xg+6h5ExgcQu
         /W1lNPplPQKW1EJPHJ/nr+hhs49kls9Tf0duLExVjmjP08mfOsW9oKFRG5+7taaf3T67
         ZMZqoQbKLz/442RDKtfxWYkokCYnKVVwsy5CR5VBPqZJ+IxvX6ufICWrrfgOEKR0HeLy
         hKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=3KHo3ZWkTOiKISxeWa229XOU0epggFSGsUJn4kcV3wE=;
        b=oWhDyxsE3q2ZOrCjGKliERHYj69XXBuhzbOCx8dE/6gf18tUvukVtI5M7B6nqFDD92
         KfSsmNHveniSlBT8WDkFgUrxr4WShc1/WOeo0Sk1aePxAUlh0lh4NuZytsO6P3iqC8F+
         Z1Fql+bbmNhd4iW6rkOvh4N8b9shveoAySxFKcVsrMfriGoWjdMOzx8D9eYRg2DhcNpF
         pFrIaif28ZY9bUJ5xqCqErKHIVaxq+aqZnylPc5CSdSBnfk27SvbYGlp1+EqLX0aIM2v
         /Umlx9zSDD0hgq16IvmxLusYzjWn1VJ3bQw75B6E7BM0sGy2YBXIB2KgUSjC20oSN3jq
         9fgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=wuIKekJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j12-v6si3028308qkm.240.2018.07.02.11.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 11:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=wuIKekJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa3hj-0005nB-1v
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 14:37:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa3hW-0005lk-3r
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 14:37:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fa3hT-0003ma-1C
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 14:37:26 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:54141)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1fa3hS-0003lb-Gq; Mon, 02 Jul 2018 14:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3KHo3ZWkTOiKISxeWa229XOU0epggFSGsUJn4kcV3wE=;
	b=wuIKekJUM+a5eC7wNaHWc2/GCJ
	jy9qZ4MxVIQLUG15QT/sOMqqTEKbr+KA+bp4Q5E3SdUfdFTl8zFC5gehdPGXQ3Ckl8zeflBWr/dky
	kibNw2F9qCGze5omkegOZeVB9qK736EmlqaTMc5OuNyZIsNaPq6xX0V7MZggIWx+nNqc4qoOvmOoJ
	KkV9KNH8tLNxe77AQwyKyePb6srD3fPnVvSjmv+sHjA75fGqFiqTA5NeVz4po+QWni1w6Ce+J18Ni
	/53B84wmQFtRT4T+fjtYcM1da65TI6ieFRvKBGm7vlE8HOZJcSCVeYm19C9Kze8hadW7bQrqlKuPW
	lUGcXQVw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:57862 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fa3hO-00CRzs-FW; Mon, 02 Jul 2018 18:37:21 +0000
Date: Mon, 2 Jul 2018 11:37:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180702183717.GA22482@roeck-us.net>
References: <20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
	<20180702170522.GA9885@roeck-us.net>
	<CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
	<20180702175740.GA14904@roeck-us.net>
	<CAFEAcA8noUOGt_9LpfRTRX52n4Z66XzudYFfW=180c92vzPH-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8noUOGt_9LpfRTRX52n4Z66XzudYFfW=180c92vzPH-g@mail.gmail.com>
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
X-TUID: tBDjLRw5ZWV5

On Mon, Jul 02, 2018 at 07:06:17PM +0100, Peter Maydell wrote:
> On 2 July 2018 at 18:57, Guenter Roeck <linux@roeck-us.net> wrote:
> > On Mon, Jul 02, 2018 at 06:10:36PM +0100, Peter Maydell wrote:
> >> On 2 July 2018 at 18:05, Guenter Roeck <linux@roeck-us.net> wrote:
> >> > I don't think I'll have more time available to spend on this
> >> > anytime soon. If it works for you, just drop the patch. I can
> >> > keep it local in my branch. My version of qemu is different anyway,
> >> > after all.
> >>
> >> I'd kind of like to fix the bug, though. I'd just like you
> >> to provide the image you're testing with...
> >>
> >
> > Ah, but that won't help. We are dealing with a heisenbug, and me using
> > a different host than you (or even a different gcc version) may be
> > sufficient to make the problem disappear on your system.
> 
> True, but we can at least rule out some differences between
> your setup and mine. (For instance, your kernel config and
> version and rootfs are all going to be different from what
> I've been testing.)
> 
> > The mps2 images use high resolution timers, which is likely what is
> > triggering here. My working assumption is that those timers trigger at
> > the wrong time because the timer is set up in periodic instead of one-time
> > mode. With that, behavior is more or less random. On some systems it will
> > work, on some systems it won't. Since we can not agree that setting the
> > timer in periodic mode instead of one-shot mode is a problem, I don't
> > really see how we can proceed. I would somehow have to prove to you that
> > there is an observable problem in the first place, well beyond of what
> > I already did. That might take a lot of time - much more than I would
> > be able to spend on it.
> 
> I certainly believe you that there's an observable problem.
> I just disagree about your proposed fix, because I don't see
> from the code why it would make any difference. So I want to
> get to a point where I can run exactly the same thing you're
> running on my system to have a look at what's happening.
> 

Please try http://server.roeck-us.net/qemu/an385/

vmlinux is plain v4.18-rc3 compiled with the provided defconfig and
the provided toolchain (position independent, created with buildroot).
defconfig is mps2_defconfig+CONFIG_BLK_DEV_INITRD=y. Older kernels work
as well (I tested as far back as 4.9.y), with the same configuration.

qemu is from the master-local branch in my repository, built with
https://github.com/groeck/linux-build-test/blob/master/qemu/buildall.sh.

The boot wrapper was generated from
https://github.com/groeck/linux-build-test/tree/master/rootfs/arm/arm-m3-bootwrapper/.

run.sh should boot the system into a shell (at least it does for me).

Guenter
