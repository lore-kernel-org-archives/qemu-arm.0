Received: by 10.25.0.147 with SMTP id 141csp1084322lfa;
        Sun, 5 Mar 2017 10:52:45 -0800 (PST)
X-Received: by 10.55.170.212 with SMTP id t203mr11990855qke.53.1488739965370;
        Sun, 05 Mar 2017 10:52:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y81si9066508qkb.334.2017.03.05.10.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Mar 2017 10:52:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckbGs-0004Dx-Pi
	for alex.bennee@linaro.org; Sun, 05 Mar 2017 13:52:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckbGo-0004Ds-4g
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 13:52:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1ckbGl-0001uz-3B
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 13:52:38 -0500
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35443)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1ckbGk-0001uX-T0; Sun, 05 Mar 2017 13:52:35 -0500
Received: by mail-wr0-f195.google.com with SMTP id u108so15266679wrb.2;
	Sun, 05 Mar 2017 10:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mvO+bBIiwnVU0QpJUmxD3QvfXTfdA9u/HL0vVPUphqw=;
	b=s5OilA7OOcWq/vjxlplhj4aV5rvBzqDyc5YgvBop2H4Loqu6P8wVSM0Jo4LIJyHBZD
	ieFvmVUCx1mh9Z6aid6e5+pEqKIHMvYT7IYLpBWaaSR+c9GC/bdm7d4inXzsxvpYFblV
	7GhXl3oMgFXFIdpT81Ppurda2yF+Z55leo3OrCUMoOhyYmX2AlgE7XWVaFkZ6wQnYPqu
	C8N8lYPOIJ/sv2/jXHgj+LORlBa6hbgzK1gmZ6O428d606AVBqeigWQB/3eeIE4fAiU6
	u0BgeWxll95HbXqsZDr3g1RGsV0dbjlsXaBKW7qr6iB5m2HUr5lWspDuYzkTvkWPVurA
	C6mQ==
X-Gm-Message-State: AMke39kmp4IaQvHuUfW+lTCfBhELh+5MA75Mlv1X3zAHee53Hms22QIfa9KOhQIlJjtp/g==
X-Received: by 10.223.170.73 with SMTP id q9mr11197187wrd.13.1488739951800;
	Sun, 05 Mar 2017 10:52:31 -0800 (PST)
Received: from kozik-lap (bzq-109-67-52-244.red.bezeqint.net. [109.67.52.244])
	by smtp.googlemail.com with ESMTPSA id
	x18sm10474532wmd.14.2017.03.05.10.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Mar 2017 10:52:31 -0800 (PST)
Date: Sun, 5 Mar 2017 20:52:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170305185226.mhyz6cqpmcz5wrxv@kozik-lap>
References: <20170301182618.22395-1-krzk@kernel.org>
	<CAFEAcA-A1FFRnbuU8ev_oEF3rdtSY-ewQixSKr4+G1Op-eYSJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-A1FFRnbuU8ev_oEF3rdtSY-ewQixSKr4+G1Op-eYSJQ@mail.gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.195
Subject: Re: [Qemu-arm] [RFC 0/5] hw: arm: exynos: Bring up secondary CPU +
 CPUIDLE issue
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2hk7t2DnqhQ6

On Thu, Mar 02, 2017 at 04:56:22PM +0000, Peter Maydell wrote:
> On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Overview of the problem
> > =======================
> > On Exynos4210, by default Linux kernel uses cpuidle driver which tries
> > to enter low power mode, called AFTR (Arm Off, Top Running).  On real
> > hardware this brings some power savings.  This AFTR mode requires second
> > CPU to be off, so the driver (coupled cpuidle driver) when system is idle:
> > 1. Turns off second CPU,
> > 2. Enters AFTR on CPU0.
> >
> > However the QEMU system is then totally unresponsive (e.g. on serial console)
> > and RCU stalls appear from time to time.  I spent some time on it and did not
> > find the real cause behind the lag.  Maybe it is because the second CPU
> > does not really power down itself and system just burns the cycles under spin
> > locks?
> 
> Possibly so. You might check whether it still has this behaviour with
> current head of git now that the multi-threaded TCG support has landed.

No changes.

> > I am quite new to QEMU.  I do not know the internals (yet), nor the design
> > how hardware should be emulated in such subtle details.
> >
> > The questions I have are:
> > 1. What is the preferred way to solve it? Maybe some a QEMU
> >    workaround to disable the cpuidle is okay?
> > 2. Is it worth implementing a proper secondary CPU power down and
> >    at the end proper AFTR cpuidle? It might be quite difficult...
> > 3. How such issues with deep sleep modes were solved for other
> >    ARM targets?
> 
> The general answer to 3 is "we don't bother implementing deep sleep
> and mostly this hasn't caused problems, but more by luck than
> judgement". Most of our boards aren't SMP; until now SMP TCG guests
> have been slower than single core so even on a nominally SMP guest
> board most users probably use (the default) -smp 1.
> 
>  The SMP board that gets most use is the "virt" board whose
> power-down functionality works through our PSCI implementation.
> The other board we have which has power-down is the imx6 one:
> hw/misc/imx6_src.c is the system reset controller model which
> does this. Basically the model of the whatever-it-is that
> causes the CPU to be powered down does it via the APIs in
> target/arm/arm-powerctl.h, which lets you turn CPUs off and on.
> When a CPU is off then we don't try to let it execute instructions,
> so it shouldn't chew host CPU at the expense of other guest CPUs.
> 
> Minor caution with that API: arm_set_cpu_on() is asynchronous,
> so if you need to tell the guest "CPU now actually booted" then
> you'll need to use an async_run_on_cpu() callback the way the
> imx6_src.c code does.
> 
> If the "CPU on" behaviour you need is "CPU powers on as if
> starting up in standard reset" rather than "CPU powers up
> and appears to start execution at given address", then it's
> probably best to improve the arm_powerctl APIs rather than
> fudge it by trying to work out the arguments to pass to
> arm_set_cpu_on() to make its "and now go to this address"
> code not do anything. (The APIs are targeted at the current
> users which both want "do things which are done in the guest
> firmware or real hardware".)

Thanks for the hints! Especially the existing implementations might be
quite useful.

The cpuidle driver expects the CPU to come up to the same resume
address. I'll see what others are doing and learn from that. 

As I mentioned before, on current master thish patchset makes everything
more laggish and unresponsive (because of cpuidle) so actually I think
the first commit could be postponed for now. At least till I figure out
solution for the cpuidle problem.


Best regards,
Krzysztof

