Received: by 10.25.208.211 with SMTP id h202csp2782592lfg;
        Thu, 3 Mar 2016 08:23:08 -0800 (PST)
X-Received: by 10.140.101.147 with SMTP id u19mr4258200qge.71.1457022186668;
        Thu, 03 Mar 2016 08:23:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si5019663qka.3.2016.03.03.08.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 08:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:36049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abW1p-0004IU-Hf
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 11:23:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abW0w-000343-FJ
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 11:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abW0v-0006ID-GF
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 11:22:10 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abW0v-0006I7-4B
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 11:22:09 -0500
Received: by mail-vk0-x236.google.com with SMTP id e185so26557887vkb.1
	for <qemu-devel@nongnu.org>; Thu, 03 Mar 2016 08:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y1RzKMZT1MCQuzsp2n3kSp+/LaJQXxfHn5t0trZRqKQ=;
	b=YUqyDaafxQ7u3XQlQG5OBRobyP2VC7RDucqNkQEM+4zxw08Mstp2sHlYperffJrFX9
	xvnf4nu7QIYJwv1KkXosWeUEn9KQN504ND76OzfDQaXL5VgRJBWzc+1ozs1dsg4bnJuG
	pK4wIUNUsSr6c5ccIuDCfBZh5FR7B8Fa9QZsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y1RzKMZT1MCQuzsp2n3kSp+/LaJQXxfHn5t0trZRqKQ=;
	b=k9K/Fhi8A8Z8jYCbpJQeER2qDuM3yCCGqvNgYszvg+rKMRv+EZ9/vcPAIbUPRsM4rC
	KCFv66y1UmDe7KoumKgjaGNzBNPcgkqdDoVn5gUZQA27o44mSqO8rM6UokXLqu6Jq2CJ
	iJ4XICsvc3qsRb09fQE3rGkJQ6q8Q0G4ItyrqFf1+kWt47U/2MKJXQK71d68WT0yrUTQ
	qfrjT7LeZBuE40VWwvV9GOOTTvrH2Fvd1X3yWf86JHtMhQTKgQAxp3ZeB6xS1gy+iNgE
	VyVp0n/fCG6bDVMR/LV/i/EWvP9f5qCXC5G5LVsWT0s/J6Yh7RbLT2paaY0JUiRsFNhj
	RJ8w==
X-Gm-Message-State: AD7BkJKpMRSX4leYYmEiACNhL4NqBLEYKEC+lPovmzKl3g4qGlKG7BmDekxAW/m7hckZO7xmgUPdPUkSDME9WqCU
X-Received: by 10.31.47.207 with SMTP id v198mr2536855vkv.6.1457022128527;
	Thu, 03 Mar 2016 08:22:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 08:21:49 -0800 (PST)
In-Reply-To: <1457021768.3574.58.camel@redhat.com>
References: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
	<1457021768.3574.58.camel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 16:21:49 +0000
Message-ID: <CAFEAcA83d79ta+-40_M_mXYs9E=eSQMH9jL7kw-UpPLxK-8Kyw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH RFC] bcm2835_dma: add emulation of
 Raspberry Pi DMA controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XnPqkWYTcPgi

On 3 March 2016 at 16:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
> usb emulation has this problem too.
>
> uhci queue heads can go in circles.  The emulation code keeps a linked
> list of active queue heads, which is (among other bookkeeping things)
> used to detect when we run in circles.  It's a legal thing to do for a
> guest btw, so you can see that happening in practice.
>
> until recently ehci could be tricked into running in loops too, by
> creating a circular chain of IDTs.  Which is not legal according to
> specs, so this went unnoticed for a while.  But a malicious guest can do
> it nevertheless.  That one was fixed by stopping IDT processing in case
> no data was transfered.  This is possible because the ehci controller
> writes back the status to the IDT, so we can figure there is nothing to
> do (because we already processed that IDT) without additional
> bookkeeping, by simply checking the status.
>
> From a brief look at the patch it seems you can not use the later for
> the bcm2835 dma controller, I can't spot a place where the some status
> is written back to the dma contol block ...

I guess a more general approach to the problem would be to have
a (hopefully easy) way to say "if this has been going on for too
long then arrange to defer continued processing of it til later,
and for now resume the guest". That's too big a can of worms for
this patch, though. (And for something that's only used in TCG
emulation we care much less about malicious guests than for devices
that can be used with KVM.)

thanks
-- PMM
