Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1509056ivh;
        Tue, 3 Jul 2018 11:49:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd7cIHmutQjejqHPy6L8wtV8zZvWMy0DGP/eVBhqKH0e63d55laM0BueY4C5KDA28tIB10V
X-Received: by 2002:a37:4a09:: with SMTP id x9-v6mr26754178qka.5.1530643788051;
        Tue, 03 Jul 2018 11:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530643788; cv=none;
        d=google.com; s=arc-20160816;
        b=fpKdu/SXxnf6+wa+jK4DkZt5kp2aGwlhAhYfxTcHjn+3ENzOALnDWYYuYRgZnNbq2e
         CaE2hDfHu809a/bP9YLYnnClavJwMYHW5YxxFatyRgqY+uDDB2P0/uj+nJSF0kMjG0y/
         WhH5oOyd3FT9RZAiyrzDjrfey2ZItUolcY0EP4scM50ZYlJ3BBc1b+Y+hxyS4+I+XhMv
         K8mOiepDWcJy1u1O2c3BJVSGC16qzJ4IZAZjAemD6R6TyP0h36VadP+vMMIzV/UlSJ3G
         dJcPdazO1pkaBgGqIKo3gKk/tr+9bC/C6fx6aBwH+7xG56oQGBO6n/UgQhnhnvGEziUH
         PMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=84W8p4+R5HkLArHFWVyCbEmJRzgS0GPHM0QbFRFtS48=;
        b=kAqveTBhCF64XlPKVqIW6V1RXL8ggnskR24XyZ7GT15nyFmrl/nDcvRWed51/uUltK
         fnJ85CVmnKzvafQsUSFKkoc/wknz6X1Z8Lauf1aThNUYYSi++uakJ1zvuXwnuKVN/2RF
         T6Qo5SudI/jVzv4kcERezcuNtgtXy0U4eM+4K6bGhMM4GwXsfqgN5sjKVS0ad25oLxNj
         ydmnimSpOSwwrGs8jR5awO5mubB3hkEsLL1dH6aTOsy5044/Haxkm7caV+Qo62sI519N
         kXpQ7lPg2yTQbgS8b/HBWSEzgIevoRoDNaQuolf5ItHzz8fINby6sNZ2bSwVuPkVc4bs
         tWcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b="pP/luhdZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si1175536qth.269.2018.07.03.11.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 11:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b="pP/luhdZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faQN1-00040R-LY
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 14:49:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1faQMv-00040M-AK
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:49:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1faQMq-0004gl-FI
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:49:41 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:58973)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1faQMq-0004df-6g; Tue, 03 Jul 2018 14:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=84W8p4+R5HkLArHFWVyCbEmJRzgS0GPHM0QbFRFtS48=;
	b=pP/luhdZHOzQ+NFsV7AS75OaKi
	/vdNvCkdZVqJUstAcgtyi6Hp/vkmWwbsiFJldI4HuY9J85/kDGhV43SUpFJBdB6mVfRxV8c89+M51
	16rrlISYa1ZCTkSGPq53SOGwQ629uGhph0UOQDPVbhcHg8uWpYUQiljCveN7uUtO226QRPFNJpgN4
	zGhfyMnng3k5JOBO6rjTbZlC6cgp1eKJYjWannQhiIrN5RyrjSxCCnEUl+bI6BJu17sPExVxZx7Nl
	U+xo45Ybg26lQx/DpV9m3RIykhdlZpItS56nDDtDEMe5mgeVpaaLK6YuenVExX4sBV9rCY8AjO1ep
	re9nHhhw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:39292 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1faQMd-006WMg-Oz; Tue, 03 Jul 2018 18:49:24 +0000
Date: Tue, 3 Jul 2018 11:49:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180703184922.GA14422@roeck-us.net>
References: <20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
	<20180702170522.GA9885@roeck-us.net>
	<CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
	<20180702175740.GA14904@roeck-us.net>
	<CAFEAcA8noUOGt_9LpfRTRX52n4Z66XzudYFfW=180c92vzPH-g@mail.gmail.com>
	<20180702183717.GA22482@roeck-us.net>
	<CAFEAcA_p8vOs_1_4sAf1SvvPb44z885doU0821eh=-e0K5B3_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_p8vOs_1_4sAf1SvvPb44z885doU0821eh=-e0K5B3_A@mail.gmail.com>
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
X-TUID: YS7PCUzy3uvR

On Tue, Jul 03, 2018 at 06:06:24PM +0100, Peter Maydell wrote:
> On 2 July 2018 at 19:37, Guenter Roeck <linux@roeck-us.net> wrote:
> > Please try http://server.roeck-us.net/qemu/an385/
> >
> > vmlinux is plain v4.18-rc3 compiled with the provided defconfig and
> > the provided toolchain (position independent, created with buildroot).
> > defconfig is mps2_defconfig+CONFIG_BLK_DEV_INITRD=y. Older kernels work
> > as well (I tested as far back as 4.9.y), with the same configuration.
> >
> > qemu is from the master-local branch in my repository, built with
> > https://github.com/groeck/linux-build-test/blob/master/qemu/buildall.sh.
> >
> > The boot wrapper was generated from
> > https://github.com/groeck/linux-build-test/tree/master/rootfs/arm/arm-m3-bootwrapper/.
> >
> > run.sh should boot the system into a shell (at least it does for me).
> 
> Thanks. Unfortunately I tried running that a bunch of times with a
> version of your QEMU with the 'set one-shot mode' patch reverted,
> and it still booted every time.
> 

Oddly enough, I now seem to be unable to reproduce the problem either.
Weird, when I wrote the patch it was absolutely necessary.

The only other change I can think of would be the code to set the
serial baud rate in the boot loader, which I did not have initially.
Is it possible that the hangup could have been caused by that ? 

Is it worth tracking it down, or are we ok ?

> However, I think I agree with you that it's better for the timer
> device to avoid doing things that result in the ptimer code emitting
> warnings rather than just dropping the ptimer warning, so I'm going
> to take this patch upstream.
> 
> I also sorted through some of the other corner case issues
> (eg restarting a stopped one-shot timer by writing to VALUE,
> and whether an interrupt should be generated if VALUE is
> written as zero). I'm going to send a patchset in a moment that
> includes this patch and those fixes. I've tested that set by
> applying it to your master-local/ branch and using your testcase
> here, as well as by using my buildroot/uclinux image on an
> upstream QEMU (and a few other RTOS images I had to hand).
> 

The series WFM as well. I'll send out a Tested-by: in a minute.

Thanks,
Guenter
