Received: by 10.25.21.96 with SMTP id l93csp622641lfi;
        Thu, 23 Jun 2016 09:56:29 -0700 (PDT)
X-Received: by 10.200.40.88 with SMTP id 24mr31919984qtr.73.1466700989034;
        Thu, 23 Jun 2016 09:56:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si990660qts.26.2016.06.23.09.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 09:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG7vY-0005vg-D2
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 12:56:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bG7kd-0002KR-CZ
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1bG7kX-0004lr-MM
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:45:11 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:22913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1bG7kX-0004lH-Ga; Thu, 23 Jun 2016 12:45:05 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 3F00988BEEF29;
	Thu, 23 Jun 2016 17:44:58 +0100 (IST)
Received: from hhmipssw201.hh.imgtec.org (10.100.21.117) by
	hhmail02.hh.imgtec.org (10.100.10.20) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 23 Jun 2016 17:45:01 +0100
Date: Thu, 23 Jun 2016 17:44:57 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160623164457.GA8074@hhmipssw201.hh.imgtec.org>
References: <1465552668-30084-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<CAFEAcA_4fMipG0cuOYMZVxgydVig1UbocdJGr-DVzh=qXg5QkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_4fMipG0cuOYMZVxgydVig1UbocdJGr-DVzh=qXg5QkQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [10.100.21.117]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v9 00/10] IEEE 754-2008 support for Mips
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
Cc: Blue Swirl <blauwirbel@gmail.com>, Ethan Hunt <proljc@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Miodrag Dinic <miodrag.dinic@imgtec.com>, maciej.rozycki@imgtec.com,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <petar.jovanovic@imgtec.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Aleksandar Markovic <aleksandar.markovic@imgtec.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FWBJa1TvYxIt

On Thu, Jun 23, 2016 at 04:46:14PM +0100, Peter Maydell wrote:
> On 10 June 2016 at 10:57, Aleksandar Markovic
> <aleksandar.markovic@rt-rk.com> wrote:
> > From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> >
> > This patch series provides number of IEEE 754-2008-related features to
> > Mips platform. It addresses the most sensitive changes that require
> > modification of SoftFloat library, also used by most other platforms.
> >
> > In order to make develpoment, testing, and integration easier, the patch
> > is split into two distinct parts:
> >
> >    1. Part 1 (patches 1/10, 2/10, 3/10, 4/10, 5/10) that does not change any
> >       calculation or behavior on any platform (and, for that matter, even on
> >       Mips platform). Its sole purpose is to address platform independant
> >       issues in a non-invasive manner, and to make Part 2 possible.
> >
> >    2. Part 2 (patches 6/10, 7/10, 8/10, 9/10, 10/10) that sets some Mips
> >       processors to use provisions from Part 1, and additionally implements
> >       number of IEEE 754-2008-related features for Mips, while, at the same
> >       time, mainly dealing with files located in directory target-mips only.
> 
> Hi. I've reviewed the patches in Part 1, and I'm happy with them
> apart from a few trivial things. I'm not going to look at Part 2
> since it's pretty MIPS specific.
> 
> I'm assuming that Leon will take these via the MIPS tree. Leon,
> it's up to you whether you're happy to fix up the minor things I
> raised when you put the patches into your tree or if you'd
> prefer to have Aleksandar respin and resend the patchset.

No need to respin; I'll fix these issues while applying to target-mips
queue.

> Either way, it would be good to get these into a pull request
> by Monday since softfreeze deadline is nearly here...

Sure, I'll send the pullreq by then.

Thanks,
Leon
