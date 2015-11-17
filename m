Received: by 10.182.158.201 with SMTP id ww9csp848800obb;
        Tue, 17 Nov 2015 09:08:09 -0800 (PST)
X-Received: by 10.31.152.83 with SMTP id a80mr4712407vke.137.1447780089816;
        Tue, 17 Nov 2015 09:08:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b62si3669035vke.145.2015.11.17.09.08.09
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 09:08:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:59770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zyjjl-0000ne-IZ
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 12:08:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjjF-0008QY-Ge
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:07:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjjE-0004gF-B7
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:07:37 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjjE-0004fv-6n
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:07:36 -0500
Received: by vkgy188 with SMTP id y188so6956755vkg.0
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 09:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wCOjJk4yIKRn6y4lrHuX69/PgHS44dfMzoKKmUWIEMQ=;
	b=b/c9oZJ39J/BSwUmcgE1EC8SGqxFeA6uQ8Inyl1PIp4i+yIP3waaALVYLKp843QUpC
	8rSVKt843OTJthwbT39heDzOI/VAVITCH+VJ/DIT4JuJMiGVnf6dz6T1gNrzEF1xrEBA
	FA74EuK4jtrZ346RyMfm+2ROnGXzqyZ8Vi94XlsJeX01cMlcj3B/Il0UqaBGR8PqPf7p
	tXdaGSmN2n77le25+594yp0Ku/Ge46clOaPMJapNO1y6G4sRdxmgqgyjOnV9+zxozJ9f
	lCBgcYSeaqJ6JXqm5UWdpXNzCq5v3USvcIJcalGpONXIvLS5C2qtAB6KloX2LxFrWvCY
	nf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wCOjJk4yIKRn6y4lrHuX69/PgHS44dfMzoKKmUWIEMQ=;
	b=NX8AgdIs721IAnlXYhd6fnXJ2X1+iQHNz4RHKMSV1aMPMbSarV42jVK9i3KFg9wBG0
	Y2ShM4WZwLw2PnIIR7bysfVWrL2lP81zMK47YlElLvsXtEYi1WNacf4HruBTieQi5657
	Iiqjph1e1/tmSTyYKBohtMzRhGx2kgkdhmCR8tYHo+4WJPl9u6EaQKKYGYBkTeGJLcp8
	XuoDC1TBxbtcmiT1YQdgPruN+/YCiOMGG5kSe9czZ1E157YbCd1Foo0kSlMwBdtCIkAT
	JJpHSeiY3uickzpwpL8vgKSrEiPewKITU2qlLjEpYX4l9gSC8ixoVCR4HCk0RaSuVBvJ
	V2zw==
X-Gm-Message-State: ALoCoQm6RKQ1QUMNpkU8s/Llk4JMEickdbQPAiipaX5aMmqD/ySTRGlcfS+BSX/frwWmDoOwcqtl
X-Received: by 10.31.190.208 with SMTP id o199mr4954887vkf.90.1447780055827;
	Tue, 17 Nov 2015 09:07:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 09:07:16 -0800 (PST)
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 17:07:16 +0000
Message-ID: <CAFEAcA-WerwObfwekpnRbfpcsUdkvV3Gqxr+krfiSJAFP-CxAw@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 00/18] Fix exception handling and msr/mrs
	access
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
X-TUID: Q3LUcRGaVIZ8

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> This series grew from a previous incorrect patch attempting to fix
> some incorrect behavior.  After spending some time going through the
> arch. ref. manual for v7-M I think I understand better how this should
> work and have made a number of changes which actually improve the situation.
>
> These changes have not yet been cross checked against real hardware, and
> I therefore don't consider them mergeable.  It's gotten big enough though
> that I'd like to get some feedback.

Thanks for this -- our M profile code has been in need of some love
for quite a while now.

> This series removes the dependence of the NVIC code on the GIC.  The GIC
> doesn't have the concept of PRIGROUP to change the size of the group
> priority field.  Also, there are a lot of cases in this code which
> I don't understand and worry about breaking.  Now that I have things
> working (I think), I could look at recombining them if this is desired.

I think separating out the NVIC is the right thing. Some of the
programmer-visible register views are superficially similar to the GIC,
but the underlying logic of how exceptions are dealt with is definitely
different, and trying to share code just makes it harder to maintain
both. (In particular for M profile external interrupts are just another
kind of exception and get prioritised along with all the internal
exceptions; for A/R profile the GIC really is an external thing
that prioritises external interrupts only to forward to the CPU.)

> I looked briefly at qtest, but can't quite see how to use it given
> the need to execute code to test most of the exception behavior.
>  Is something like this feasible at present?

You're correct that we don't have a very good story for how to test
parts of the system that really need execution of guest code.

I'll reply to the various patches individually with comments.

thanks
-- PMM
