Received: by 10.25.21.96 with SMTP id l93csp37917lfi;
        Tue, 14 Jun 2016 04:39:28 -0700 (PDT)
X-Received: by 10.200.39.33 with SMTP id g30mr7634966qtg.16.1465904368050;
        Tue, 14 Jun 2016 04:39:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w48si18118976qgw.78.2016.06.14.04.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 04:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCmgp-0000pA-GD
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 07:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCmgd-0000l7-WF
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCmgX-000353-QF
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:39:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bCmgX-00034x-Hh; Tue, 14 Jun 2016 07:39:09 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A62E3DD47;
	Tue, 14 Jun 2016 11:39:09 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EBd4Lg004755
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 14 Jun 2016 07:39:06 -0400
Date: Tue, 14 Jun 2016 13:39:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160614113904.2u5qvf7kasv5hact@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
	<60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 14 Jun 2016 11:39:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 06/16] vl: move smp parsing
 to machine pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	imammedo@redhat.com, dgibson@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ecrfmCpGT8GB

On Tue, Jun 14, 2016 at 10:17:49AM +0200, Paolo Bonzini wrote:
> 
> 
> On 13/06/2016 22:35, Andrew Jones wrote:
> > On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
> >> On 10/06/2016 19:40, Andrew Jones wrote:
> >>> +    if (sockets == -1 || cores == -1 || threads == -1 ||
> >>> +        maxcpus == -1 || cpus == -1) {
> >>> +        error_report("cpu topology: "
> >>> +                     "all machine properties must be specified");
> >>> +        exit(1);
> >>> +    }
> >>> +
> >>
> >> I think it's sane to accept some defaults.  It must not be the DWIM
> >> thing that -smp does (which is targeted to Windows's dislike of
> >> multi-socket machine on consumer hardware).  It must be something that
> >> makes sense, and my proposal is:
> >>
> >> - threads: 1
> >> - cores: 1
> >> - sockets:
> >>   - maxcpus / (cores * threads) if maxcpus given
> >>   - cpus / (cores * threads) if cpus given
> >>   - else 1
> >> - maxcpus: cores * threads * sockets
> >> - cpus: maxcpus
> > 
> > I think some machines may prefer
> > 
> > - threads: 1
> > - sockets: 1
> > - cores:
> >   - maxcpus / (sockets * threads) if maxcpus given
> >   - cpus / (sockets * threads) if cpus given
> >   - else 1
> 
> smp_cores is only used by pseries and x86 machines.  I expect machines
> that must be single-socket to disregard smp_sockets altogether.

mach-virt currently assumes 1 "socket" with N cores when -smp N is used.
This is because, until recently, ARM machines didn't define sockets. I
presume the mindset will remain that cpus=N means cores=N even after
introducing support for multi-socket topology.

> 
> >> - any argument < 1
> > 
> > What if a user says threads=0, because they don't have HT, and assume
> > that a value of zero will get them a non-HT system? Or what about
> > machines that don't describe sockets, so a user inputs zero? In both
> > those cases I agree we should just use 1, but from a user's perspective,
> > it might seem weird.
> 
> They should just not specify it and get a default of 1. ;)

Yeah, threads, the only one we should never calculate, could be
optional. If not specified, defaulting to 1 makes perfect sense.
But, threads=0, which is weird, but in a way specifying that it's
not specified, also makes some sense.

> 
> >> - any argument > some compile-time value (1024?) to avoid overflows
> > 
> > Agreed. We should do this regardless of this series.
> > 
> >> - cpus % (cores * threads) != 0
> > 
> > Hmm. This makes sense where cpus is the number of cpu packages,
> 
> I'm not sure I understand what you mean here.  The point is that the
> machine starts with an integral number of sockets.

OK, s/cpus/maxcpus/ then. By using the currently online number, I
thought you were starting to prepare for cpu packages, which are
indivisible sets of cores and threads. But now that I think about
it, cpus % (cores * threads) isn't right for that either. It should
be total-online-threads % (cores * threads) != 0

> 
> >> - cpus > sockets * cores * threads
> >> - maxcpus != cores * threads * sockets
> > 
> > We check these two (the 2nd added with this series) already.
> 
> Yup, I was just making a complete list.
> 
> >> Alone the last relation shows that requiring all four of maxcpus, cores,
> >> threads and sockets is unnecessary. :)
> > 
> > Not really. It depends on if you assume sockets, cores or threads to
> > be the N in maxcpus=N. We could just require sockets, cores, and threads
> > to be input, which allows us to easily calculate maxcpus, and then set
> > cpus from that. In that case maxcpus would just be an available input
> > for sanity checking.
> 
> Or you could just specify -machine cpus=16,maxcpus=32 and expect 1
> core/socket, 1 thread/core, and 16 to 32 sockets.

Or 32 cores/socket (only 16 populated), 1 thread/core

> 
> >> -smp should do its legacy magic and assign all five values based on it.
> >> If the results do not match the obvious s/smp/-machine/ command line it
> >> should warn, and perhaps suggest the equivalent -machine command line.
> >> It doesn't have to be a minimal command line, just equivalent.
> > 
> > This is a good idea. I'm just still not sure what the -machine command
> > line should/should not assume.
> 
> It's okay.  Adding defaults can be done later, as long as strict checks
> are in place from the beginning and there is a clean separation between
> -smp defaults and -machine.
> 
> Relaxing checks can be done later, so I am much more interested in
> having strict checks than in having defaults.

Yes, my current thinking (which is always adjustable :-) is to start
with strict checks, and maybe always have them in this common code.
Machines that override this can implement defaults based on their
machine-specific knowledge, allowing the user to get sane topologies
without really needing to know what they want.

> 
> Though I think that we can at least agree on defaults for threads,
> maxcpus and cpus.  The only sticky point is sockets vs. cores.  We can
> make them both mandatory for now.  That is: cores and sockets are
> mandatory until we decide which one to default to 1; threads is
> optional; cpus is mandatory if you want hotplug, otherwise it's
> redundant; maxcpus is optional and always redundant.

Agreed. I'll do the following for the next round of this series

 threads: 1
 cores:   required
 sockets: required
 maxcpus: maxcpus ? maxcpus : sockets * cores * threads
 cpus:    cpus ? cpus : maxcpus

If maxcpus is input, it's redundant, but should be sanity checked.
Maybe the user wants to use the QEMU cmdline to check their math...

Thanks,
drew
