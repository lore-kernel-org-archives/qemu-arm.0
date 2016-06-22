Received: by 10.25.21.96 with SMTP id l93csp2439091lfi;
        Wed, 22 Jun 2016 05:21:24 -0700 (PDT)
X-Received: by 10.55.89.2 with SMTP id n2mr37000826qkb.169.1466598084103;
        Wed, 22 Jun 2016 05:21:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l4si27637060qtc.12.2016.06.22.05.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 05:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFh9n-0000jR-Fl
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 08:21:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bFh70-0007C1-Va
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 08:18:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bFh6v-0000FD-6D
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 08:18:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bFh6u-0000F9-VQ; Wed, 22 Jun 2016 08:18:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96D097F36F;
	Wed, 22 Jun 2016 12:18:24 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MCIK9p027688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 22 Jun 2016 08:18:23 -0400
Date: Wed, 22 Jun 2016 14:18:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160622121820.rkerpg2jrrpgzwyt@hawk.localdomain>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
	<20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
	<CAFEAcA_AnYGV0jy9HAUevHPB=FY3NP25-7BUpdbySZS-QPeGrg@mail.gmail.com>
	<20160622080234.f57jjn43tcwmvmcd@hawk.localdomain>
	<20160622113558.GF2274@work-vm>
	<CAFEAcA9tRnKuc4Dqj4_7vKwmg2Y00ifNQHA1rUirEy5viWsG3A@mail.gmail.com>
	<20160622115432.GA6604@work-vm>
	<CAFEAcA9xEx_hJJDuUmyrb_DMyoUarHVZQ_tJ5cjR-MLyVsqDdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9xEx_hJJDuUmyrb_DMyoUarHVZQ_tJ5cjR-MLyVsqDdg@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 22 Jun 2016 12:18:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set
 minimum_page_bits to 12
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
Cc: Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1fCCuPopyf/R

On Wed, Jun 22, 2016 at 01:02:04PM +0100, Peter Maydell wrote:
> On 22 June 2016 at 12:54, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> On 22 June 2016 at 12:35, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> >> > Yes, my hope is that any versioned machine type should migrate to
> >> > a newer qemu with the same machine type set.
> >> >
> >> > There are really two separate things that we state with the machine
> >> > versioning:
> >> >   a) that the guest view is the same
> >> >   b) that the migration format is the same
> >>
> >> Well, this is true for PC.
> >
> > PC, ppc/spapr, and I think s390.
> >
> >> But my impression when we started
> >> applying versioned machine types to ARM virt was that it was
> >> signing up to (a) but not (yet) (b)...
> >
> > So that would make ARM special; the problem is we have no way
> > to communicate to the user that it's special.
> 
> Is anybody testing that migration between versions for
> virt works?

We've only tested migration between identically configured hosts
so far. This is partly due to the fact that we haven't released
a RHEL machine type yet, i.e. we're working towards a RHEL-7.3
machine type on a RHEL-7.3 QEMU, which will be the first and only
we have. When we have a development 7.4 branch to work with then
we'd test a 7.3 machine migration from a 7.3 host to a 7.4 host
as well.

I'll add trying an upstream 2.6 machine type migration from a
2.6 QEMU to a latest QEMU to our TODO.

Thanks,
drew
