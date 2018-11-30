Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3762208wrt;
        Fri, 30 Nov 2018 08:22:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WCLp1FOfYEVSavjeL0/jTS1cCrfyOumj7OfFUP6M+z0cifptdHXmCRspeEuh/jqyFQg31N
X-Received: by 2002:a25:3585:: with SMTP id c127-v6mr5944265yba.346.1543594926114;
        Fri, 30 Nov 2018 08:22:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543594926; cv=none;
        d=google.com; s=arc-20160816;
        b=WfU44zdDYJUyf3mUp6i7cnmYmX8VKnoPkLNaX3iBv8YJVQedUA6FtmgkBl/WJPqa4t
         ogiSYbRdkzWWzGbGxqwl6S7GBUzI2fjPtHCX/Q0M09+dG0+4EeZWoU1DcxZBLI3uTb8J
         XiHa7or19+Gbx+G4roWWhw4J8miqAGDlwol3XNEiGfrzEiZpK9tcLa2jVJimyg0704tH
         VfK73s1Yl7nKSr7b+rjAXreWmxSrwFBb9YeBCDuURNju+CJCNSZB1qlNessV986P93Mk
         MQQED2ICe0u3JdNC2QfmlLpzHaHCkCrs5UCzhbpwrL6py7xaHPi0qW8foV6YMkPYqxek
         Eayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHfL0RGFBZt0vDaEEnCwe2T0Sqh0CYpF6Fx0lE+IyBE=;
        b=eSpqh6P4aTjeYdPErZM4U7GdRz18T9oE8+KTMbMAu/dszNhfo89rffQD2lVCs8vhxJ
         vV2frpGLdtNWc6uHdJNldfbCN0pFzxk4W7TM5KtIx+WFYHSeJBZ3mGDtOH8m+Qdu8Czr
         mKBY/g8gP8wsYTUVWOGdMIEJNFaY87o7dgDHxGp8ML4guKVwYdvoNysIlL5lLm9iEsDi
         SRnP87+6bmhM+jBER9MgUwr+gTMH0dMRC7o4VSvMhX+gQFV87Ps6Dr8gSv+0vXKFq3y1
         bn0G0P2AEgbjTfz2dOWFvcyq9KWOuXaV8/A+q0uAbLaY+GppYrhblVTnoLWVaJxrGJNv
         E0Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDGNdBss;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7-v6si2978182ybo.408.2018.11.30.08.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:22:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kDGNdBss;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlYL-0007tp-JE
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:22:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlY1-0007tB-4N
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 11:21:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlY0-0004Rp-BE
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 11:21:45 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:38135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSlY0-0004RV-4u
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 11:21:44 -0500
Received: by mail-oi1-x22b.google.com with SMTP id a77so5179939oii.5
	for <qemu-devel@nongnu.org>; Fri, 30 Nov 2018 08:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EHfL0RGFBZt0vDaEEnCwe2T0Sqh0CYpF6Fx0lE+IyBE=;
	b=kDGNdBsshgp/U175qGjmhiByGvB7MjNc3yUkzVVFGE7goxY/DzemxPF1OxhvH8nX03
	h3hd9swG81bG2ZEmdewX1sINrB1Isy6a506SUeUR1rip1yO7SYBXQswZOwiGhQm4P5qR
	nVESAlbAkQR89EwZ3yqFHx8xir8dlAN6L34vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EHfL0RGFBZt0vDaEEnCwe2T0Sqh0CYpF6Fx0lE+IyBE=;
	b=UfQT+SRpvEx68GrwM/ySvfRT46ucntbdmbHQyYnowUoLcKxX0iBwP50wA2h/nw1huQ
	SvvCWSckyGScySBZSzr4hJuhIR+zw6Pf60BUIPh5z+1VBrnA7v3zm7Bgvv9lJ3Sm3Nn7
	wSUI2oQaay5VSWTdQm61TYS2DzLW8oRi78xLH79Vty9GiKqL24yc6MODVim9c8hw2ZlZ
	0BuUTm7SCzpOKHYYrrswbf31HSYYjOwlFxzq4UooRbnVuq9uyUKtEdauFTgHEbgwC3Y7
	I9tf2B2owRFvMRYSXCl60V/zH9sF9hIvT56t2Mg1JxjFehhL7DPah/EPYMIgHh66BwHi
	sYTg==
X-Gm-Message-State: AA+aEWY3Rzam02tBpS+YqbHN4WXtHzizB3XW+fcDtlK55dgKlpM3VbGY
	hbentihiA4/ehcRpnzEZBDB3Jiv8UyWH9JKDMSQ8ng==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr3879390oit.325.1543594903304;
	Fri, 30 Nov 2018 08:21:43 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-8-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com>
	<CAFEAcA8nfp0ueLMJHhgRyf+mqG1QbakjKJiqSnLF-MFkjkDhZA@mail.gmail.com>
	<20181130161449.dg2yxiac5lnk7mbb@kamzik.brq.redhat.com>
In-Reply-To: <20181130161449.dg2yxiac5lnk7mbb@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 16:21:31 +0000
Message-ID: <CAFEAcA9Od4vjo2EeEXhP1iE_XONaK8H22L9eq1qw3w6C2nR_cQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22b
Subject: Re: [Qemu-devel] [PATCH V10 7/9] hw/misc/pvpanic: preparing for
 adding configure interface
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
Cc: Peng Hao <peng.hao2@zte.com.cn>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzV6tKfUA25L

On Fri, 30 Nov 2018 at 16:14, Andrew Jones <drjones@redhat.com> wrote:
>
> On Fri, Nov 30, 2018 at 03:57:13PM +0000, Peter Maydell wrote:
> > On Fri, 30 Nov 2018 at 15:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > I suspect the reason you've done this is that you're
> > > trying to get "-device pvpanic" to work on the command
> > > line. I recommend not trying to get that to work.
> > > MMIO devices are not pluggable devices, and -device
> > > is not expected to work with them.
> >
> > If you do want a pluggable pvpanic device for the virt
> > board then you should implement it as a PCI device,
> > incidentally.
> >
>
> We'd have to allocate it a PCI device ID, but I guess that's OK as
> there are plenty of IDs left for 1b36. I'm not sure it's worth it
> though. Phil asked that this device by user creatable, but maybe
> that's not necessary. Maybe we just need a mach-virt compat boolean
> and then to always provide this device for 4.0 and later machines?

Yes, if it's just an mmio device then we should either:
 * default to providing it, with the usual flag to say "don't create
   in older virt board versions", and also a machine property to
   disable it manually (like we do with the ITS)
 * default to not providing it at all, and have a machine
   property to enable it (like we do with the IOMMU)
Which is all doable, but every time we do that it makes the
virt board code that extra bit more complicated (we have
half a dozen machine properties on it already).

This kind of thing is why a PCI device is cleaner -- it just
works on any machine with a PCI controller, it by default is
something that the user can provide if they want to and not if
they don't, and it's not a custom UI that management layers
might need to special-case. The guest does need to do a bit
of PCI probing and setup initially, but then it can just leave
the MMIO BAR permanently mapped and write to that address
when the guest panics.

thanks
-- PMM
