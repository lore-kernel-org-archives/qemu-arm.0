Received: by 10.80.166.35 with SMTP id d32csp3275946edc;
        Tue, 25 Oct 2016 09:08:30 -0700 (PDT)
X-Received: by 10.55.70.84 with SMTP id t81mr19231904qka.309.1477411660506;
        Tue, 25 Oct 2016 09:07:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3si13930860qtd.71.2016.10.25.09.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 09:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz4GJ-0004jf-Ov
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 12:07:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz48q-0006yR-01
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 11:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz48p-0005Xu-8E
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 11:59:55 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:35747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bz48o-0005Xf-Tb
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 11:59:55 -0400
Received: by mail-ua0-x22f.google.com with SMTP id 12so7130311uas.2
	for <qemu-arm@nongnu.org>; Tue, 25 Oct 2016 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aTsXOhwG97l8LMwLn19j5+irnFT5WWuumcAo/hkMBQk=;
	b=LkTxsCo3dcqn1NZQd1WUGyZAOKPc3hb0e0nBjLdikPS18q8uHVg3BC/ML7aR3peCtG
	Bc2gSFo3YBp+crhYPQLPJl1FBLw0e1bokseKGouuP/994DoYHLEO4s37HgSR0laWfvi4
	TuouTYoP2AKqFw5YxqaOAM2btC4XuAfqfVzrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aTsXOhwG97l8LMwLn19j5+irnFT5WWuumcAo/hkMBQk=;
	b=UgJz+o7xtjFbYYJJLlbEkfkUrU/4znn2L3Ubh1BkaCIMjdOgo5XczazT4hgxTdeSDe
	+Z5U5kGit7TsgG4KUo54Pc6u75DQATsgRgQxg7CGLegCPogNdSjVUUO+bQjvpos1n/Bs
	mh7qf4aF2GaVL3zKPjBOv81033n4TViX7YV76vDPcGI9Kh+XknJfktOIZitNaRCUGaN9
	FthAsRe+qty7SezoO47iMdkXYWHsG4yP9mq31POr0Wn7vigteWs5w2kX2Rml6PYRlaLb
	0Dsll8OvMFG8eDIbWc4vuCLHolzaHIhSkrW7QvdSXSa5ATI5qAY50YkGfK9o0i8BsOk9
	y6Dw==
X-Gm-Message-State: ABUngve2dXoXcVhNyxenioppCnstmpf+O6QQyPZQ714HHmjSBsKIz4tbiDSDGgO/+LliCJz3FKtoVGk7jOFm30Dq
X-Received: by 10.176.3.237 with SMTP id 100mr3748164uau.120.1477411194149;
	Tue, 25 Oct 2016 08:59:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 25 Oct 2016 08:59:33 -0700 (PDT)
In-Reply-To: <CAFEAcA_xEd9ic-s+R8Fp8WrbwC1cF4Tf3+7_MM_21CF3RhyOmg@mail.gmail.com>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
	<20161024084920.5qrrwa3wfdyr5kn5@hawk.localdomain>
	<155d69d3-c8fb-4ff1-7de9-ca72d4086ccb@redhat.com>
	<20161025073327.kbbabkrdsgfuypzt@kamzik.brq.redhat.com>
	<CAFEAcA_xEd9ic-s+R8Fp8WrbwC1cF4Tf3+7_MM_21CF3RhyOmg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2016 16:59:33 +0100
Message-ID: <CAFEAcA_ESsQZt=qbrLYLhZZE-GjLAKz7MjtCAsCpas7ZE=DA5A@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V7 0/2] Add option to configure
 guest vPMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hZlmWlFpZpjG

On 25 October 2016 at 16:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 October 2016 at 08:33, Andrew Jones <drjones@redhat.com> wrote:
>> Yes, I prefer it to not being able to easily switch a command line from
>> KVM to TCG. Granted, right now we mostly need to run with -cpu host for
>> KVM, which also needs to be switched for TCG. However that will hopefully
>> change with Shannon's work.
>
> If the TCG default is different from the KVM default then you
> will have problems with switching it anyway, because it will
> silently change behaviour underfoot. I think we should avoid that...

So here's my suggestion: we should just not worry about printing
a warning for not actually honouring the "please give me a PMU"
flag under TCG. At some point we'll actually implement it,
at which point the problem goes away. In the meantime (a) not
providing a PMU and not bothering to say so is what we were
doing before, and (b) there's lots of bits of the CPU that we
don't actually yet implement in TCG but which will appear as
we fix bugs in the emulation.

thanks
-- PMM
