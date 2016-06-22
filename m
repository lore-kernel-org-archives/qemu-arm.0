Received: by 10.25.21.96 with SMTP id l93csp2438143lfi;
        Wed, 22 Jun 2016 05:19:18 -0700 (PDT)
X-Received: by 10.237.39.167 with SMTP id a36mr22167476qtd.103.1466597958789;
        Wed, 22 Jun 2016 05:19:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w203si5908219qka.104.2016.06.22.05.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 05:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFh7m-0007UX-5j
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 08:19:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFh6I-000671-4o
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFh6G-00007t-6E
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:17:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1bFh68-00005y-KX; Wed, 22 Jun 2016 08:17:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9DBE7F6A2;
	Wed, 22 Jun 2016 12:17:35 +0000 (UTC)
Received: from work-vm (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MCHVQc012744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 22 Jun 2016 08:17:34 -0400
Date: Wed, 22 Jun 2016 13:17:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160622121731.GI2274@work-vm>
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
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 Jun 2016 12:17:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set minimum_page_bits
 to 12
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BFcfzOn8yVY6

* Peter Maydell (peter.maydell@linaro.org) wrote:
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

I don't know (Perhaps Drew knows), but I'd love to add
a make check test for the x86 equivalent, but there's two
things I'm stuck on;
   1) What to run in the guest to check it survives
   2) How to know we have an old qemu binary to check.

  I was thinking for (2) I could use an environment variable
and if it's not set then skip the test.
  For (1) perhaps a trivial little image (like I use for postcopy)
that wouldn't check much except that the CPU/serial is still happy,
but at least migration completed OK.

  You could use virt-test/avocado to run a test with a full guest;
it has options to specify source and destination qemu's separately.

Dave

> 
> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
