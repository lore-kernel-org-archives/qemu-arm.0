Received: by 10.25.208.137 with SMTP id h131csp2003335lfg;
        Tue, 10 May 2016 03:31:30 -0700 (PDT)
X-Received: by 10.55.48.80 with SMTP id w77mr41929485qkw.7.1462876290856;
        Tue, 10 May 2016 03:31:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m186si943495qhb.19.2016.05.10.03.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 03:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b04ws-0006Po-Ck
	for alex.bennee@linaro.org; Tue, 10 May 2016 06:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <will.deacon@arm.com>) id 1b04wA-0005So-5B
	for qemu-devel@nongnu.org; Tue, 10 May 2016 06:30:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <will.deacon@arm.com>) id 1b04w7-0007Vj-TA
	for qemu-devel@nongnu.org; Tue, 10 May 2016 06:30:45 -0400
Received: from foss.arm.com ([217.140.101.70]:42603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <will.deacon@arm.com>)
	id 1b04w1-0007T5-AB; Tue, 10 May 2016 06:30:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BC52433;
	Tue, 10 May 2016 03:24:11 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F6213F252;
	Tue, 10 May 2016 03:23:57 -0700 (PDT)
Date: Tue, 10 May 2016 11:24:04 +0100
From: Will Deacon <will.deacon@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <20160510102403.GE22813@arm.com>
References: <CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
	<CAFEAcA8pboFpZynTny60JRQYL0S1+HH6KoBy+de6iHOGOGBFCg@mail.gmail.com>
	<CALicx6vnEGxXA3yyzBg8VSHNns5kqvhFfVT23w_Hx7LLSkEq3w@mail.gmail.com>
	<570B7048.5010501@arm.com>
	<CALicx6u-LOA2gAc2f33a=VY0duHhtiHSZ=2+269daeE3YZ1xiA@mail.gmail.com>
	<570E1866.9010201@arm.com>
	<CALicx6saTB9giRqubF=kUkBihvZRoCVq6XVNxvi2a+nkmzMKXA@mail.gmail.com>
	<57306DA7.4010002@arm.com>
	<CAFEAcA_Kp+_aoe19PBJXDdn7HHX3ZCYbzaY5vsbYEwdyRwxdaA@mail.gmail.com>
	<20160509134410.GA2504@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160509134410.GA2504@localhost.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-devel] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
 fetch /proc/cpuinfo
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Vijay Kilari <vijay.kilari@gmail.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Suresh <ksuresh@caviumnetworks.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRfSETtVl0c2

On Mon, May 09, 2016 at 01:44:11PM +0000, Catalin Marinas wrote:
> On Mon, May 09, 2016 at 12:21:08PM +0100, Peter Maydell wrote:
> > On 9 May 2016 at 11:59, Suzuki K Poulose <Suzuki.Poulose@arm.com> wrote:
> > > Well, we have been waiting for a use case, like this, before we merge
> > > the series.
> > 
> > This isn't a great strategy for moving people away from things
> > you'd like them to avoid like parsing /proc/cpuinfo, because typically
> > userspace app writers are not very interested in coding to facilities
> > which don't exist yet, and will prefer to make do with what's actually
> > present in the kernel today... You need to provide the improved API,
> > and then it needs to get out into kernel versions in distros and
> > otherwise, and only then are you likely to get app developers who
> > will start to say "this is useful".
> 
> The problem is that the way kernel people think the API may be improved
> does not always match the use-cases required by app writers. One example
> here is exposing MIDR via MRS emulation, we know there are problems with
> big.LITTLE and the only clear answer I got so far is that we ignore such
> configurations. We don't even have a way to tell user space that this is
> a heterogeneous CPU configuration, unless we add another HWCAP bit
> specifically for this (or the opposite: HWCAP_HOMOGENEOUS_CPUS).

Personally, I think we should expose big.LITTLE as-is to userspace. That
is, if you execute an mrs instruction you'll get whichever core the
emulation happens to run on. This might even be useful to things like
pinned threadpools w/ userspace schedulers sitting on top.

> That said, I'm perfectly fine with exposing:
> 
> 	/sys/devices/system/cpu/cpu$ID/identification/
> 							\- midr
> 							\- revidr
> 
> I had the wrong impression that we already merged this part but Suzuki
> just pointed out to me that it's not.

Yes, there are use-cases for this interface as well. I don't think it's
a choice between one or the other and I firmly believe we need both (the
sysfs and mrs code).

> I think our 4.7-rc1 tree is pretty much frozen to new features now,
> though the sysfs patch is relatively small (I'll let Will comment):

The merge window opens in less than a week, so it's fixes only atm.

Will
